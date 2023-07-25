//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Rotinas.PAS                                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             comuns para o sistema.                         //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      : 24/03/2020                                     //
// AUTOR                     : Osvaldir                                       //
// MODULO Inserido           : FileTimeToDTime                                //
// MOTIVO                    : Este modulo pega a data do arquivo.            //
//----------------------------------------------------------------------------//

unit Rotinas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
   IBQuery, ToolWin, ShellApi, midaslib, jpeg, Winsock;

const
   Data= '24/03/2020';
   Versao= 'Versão: 1.46';
   Diretorio_Imagens = 'C:\DataBase_Icea\Ensino\Tmp\';
   Diretorio_Log = 'C:\DataBase_Icea\Ensino\Logs\';

   type
   Funcao = Class
      Private
              VS_DispBD, VS_DispRede, VS_Log: String;

      Public
         Function GetDispBD: String;
         Function GetDispRede: String;
         Function GetLog: String;
         Function FileTimeToDTime(FTime: TFileTime): TDateTime;

         Procedure SetLog(PS_Curso, PS_Turma, PS_Prova: String);
         Procedure SetDispBD(PS_DispBD: String);
         Procedure SetDispRede(PS_DispRede: String);

         procedure FazLogException(Mensagem: string);
         Procedure Verifica_Disponibilidade_Rede;
         Procedure Verifica_Disponibilidade_BD;

         Function CapturaTelaJpg: TJpegImage;
         procedure ApagarImagens(Diretorio_Imagens: String);

         Procedure Tratar_MsgErroServidor(VS_Msg: String);

         Procedure ExecutaQuery(Query_Executa: TIBQuery; PS_Comando: String);
         Procedure ExecusaoQuery(VS_Comando: String);

         Procedure OpenQuery(VS_Comando: String);
         Procedure ExecutaTransacao;
         Procedure abortaTransacao;
         Procedure AjustaHora;

   end;

var
   Funcoes: Funcao;
implementation

uses Module;


//------------------------------------------------------------------------------
// Descricao: Tratamento para retornar a disponibilidade do Servidor
// Data     : 20/06/2018
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.GetLog: String;
begin
   GetLog:= VS_Log;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para setar a disponibilidade do Servidor
// Data     : 20/06/2018
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.SetLog(PS_Curso, PS_Turma, PS_Prova: String);
begin
   VS_Log:= 'Log_'+PS_Curso+'_'+PS_Turma+'_'+PS_Prova;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para retornar a disponibilidade do Servidor
// Data     : 20/06/2018
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.GetDispBD: String;
begin
   GetDispBD:= VS_DispBD;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para setar a disponibilidade do Servidor
// Data     : 20/06/2018
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.SetDispBD(PS_DispBD: String);
begin
   VS_DispBD:= PS_DispBD;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para retornar a disponibilidade da Rede
// Data     : 20/06/2018
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.GetDispRede: String;
begin
   GetDispRede:= VS_DispRede;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para setar a disponibilidade do Servidor
// Data     : 20/06/2018
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.SetDispRede(PS_DispRede: String);
begin
   VS_DispRede:= PS_DispRede;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para atualizar a Hora do Micro
// Data     : 11/12/08
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AjustaHora;
var
   SystemTime : TSystemTime;
begin
   try
      OpenQuery('select current_timestamp as DataHora from rdb$database');
      With SystemTime do
      begin
         //Definindo o dia do sistema

         wDay:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,1,2));
         wMonth:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,4,2));
         wYear:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,7,4));

         //Definindo a hora do sistema

         wHour:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,12,2)); //hora
         wMinute:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,15,2)); //minutos
         wSecond:= 00; //segundos
      end;

      SetLocalTime(SystemTime);       //Colocar a hora e data do sistema
   except
//       Tratar_MsgErroServidor;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de Fazer ExecSql na Query
//
// Atualizado em: 17/12/2005
//------------------------------------------------------------------------------

Procedure Funcao.ExecusaoQuery(VS_Comando: String);
begin
   if not DM.IBDatabase_Ensino.TestConnected then
      Tratar_MsgErroServidor('Servidor do Banco de questões disponível')
   else
   begin
      DM.IBQuery_ExecSql.Close;
      DM.IBQuery_ExecSql.Sql.Clear;
      DM.IBQuery_ExecSql.Sql.Add(VS_Comando);
      DM.IBQuery_ExecSql.ExecSql;
      ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: OpenQuery
//
// Atualizado em: 25/01/2006
//------------------------------------------------------------------------------

Procedure Funcao.OpenQuery(VS_Comando: String);
begin
   if not DM.IBDatabase_Ensino.TestConnected then
      Tratar_MsgErroServidor('Servidor do Banco de questões disponível')
   else
   begin
      DM.IBQuery_Executa.Close;
      DM.IBQuery_Executa.Sql.Clear;
      DM.IBQuery_Executa.Sql.Add(VS_Comando);
      DM.IBQuery_Executa.Open;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de executar a query
// Data     : 31/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaQuery(Query_Executa: TIBQuery; PS_Comando: String);
begin
   if not DM.IBDatabase_Ensino.TestConnected then
      Tratar_MsgErroServidor('Servidor do Banco de questões disponível')
   else
   begin
      Query_Executa.Close;
      Query_Executa.SQL.Clear;
      Query_Executa.SQL.Add(PS_Comando);
      Query_Executa.Open;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da Execucao da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaTransacao;
begin
   try
      if not DM.IBTransaction_Ensino.Active then
          DM.IBTransaction_Ensino.Active := True;

      DM.IBTransaction_Ensino.CommitRetaining;
   except
       Tratar_MsgErroServidor('Servidor do Banco de questões disponível');
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da parada da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.abortaTransacao;
begin
   try
      if not DM.IBTransaction_Ensino.Active then
          DM.IBTransaction_Ensino.Active := True;
      DM.IBTransaction_Ensino.RollbackRetaining
   except
       Tratar_MsgErroServidor('Servidor do Banco de questões disponível');
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Grava a janela da aplicacao da prova  em formato de imagem
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.CapturaTelaJpg: TJpegImage;
var
   dc : hdc;
   cv : TCanvas;
   aux : TBitmap;
begin

   Result := TJPEGImage.Create;

   aux := TBitmap.Create;
   aux.Height := Screen.Height;
   aux.Width := Screen.Width;

   dc := GetDC(0);
   cv := TCanvas.Create;
   cv.Handle := dc;

   //--Define o tamanho da imagem
   aux.Canvas.CopyRect(Rect(0,0,Screen.Width,Screen.Height),cv,
   Rect(0,0,Screen.Width,Screen.Height));
   cv. Free;
   ReleaseDC(0,dc);

   //-- Compacta o BMP para JPEG
   Result.Assign(aux);
   Result.Compress;
end;

//------------------------------------------------------------------------------
// Descricao    : Funcao para Extrair a Data do arquivo
// Data         :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.FileTimeToDTime(FTime: TFileTime): TDateTime;
var
  LocalFTime: TFileTime;
  STime: TSystemTime;
begin
  FileTimeToLocalFileTime(FTime, LocalFTime);
  FileTimeToSystemTime(LocalFTime, STime);
  Result := SystemTimeToDateTime(STime);
end;


//------------------------------------------------------------------------------
// Descricao: Exclui as imagens geradas da prova anterior
// Data     :
//
// Atualizado em:
// Descricao    :  Tratar aqui
//------------------------------------------------------------------------------

procedure Funcao.ApagarImagens(Diretorio_Imagens: String);
Var
   caminho, VS_DataAtua, VS_ModifyDT: string;

   SR: TSearchRec;
   I: integer;
   ModifyDT: TDateTime;
begin
   VS_DataAtua :=  DateToStr(Date-3);   // Pega a data atual menos 4 dias

   if not DirectoryExists(Diretorio_Imagens) then
       ForceDirectories(Diretorio_Imagens);

   caminho := Diretorio_Imagens+'*.*';
   I := FindFirst(caminho, faAnyFile, SR);
   while I = 0 do
   begin
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
          ModifyDT := FileTimeToDTime(SR.FindData.ftLastWriteTime);;
          VS_ModifyDT := DateToStr(ModifyDT);

          if StrToDate(VS_ModifyDT) < StrToDate(VS_DataAtua)  then
          begin
             caminho:= Diretorio_Imagens+SR.Name;
             if not DeleteFile(caminho) then
                ShowMessage('Erro ao deletar  ' + caminho);
          end;
      end;
      I := FindNext(SR);
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para verificar a disponibilidade da Rede
// Data     : 20/06/2018
//
//--> Declare a Winsock na clausula uses da unit
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Verifica_Disponibilidade_Rede;
var
    WSAData: TWSAData;
    HostEnt: PHostEnt;
    VS_IdRede, Name, VS_ArqLog:string;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PChar(Name), 255);
  SetLength(Name, StrLen(PChar(Name)));
  HostEnt := gethostbyname(PChar(Name));
  with HostEnt^ do
  begin
    VS_IdRede := Format('%d.%d.%d.%d',
    [Byte(h_addr^[0]),Byte(h_addr^[1]),
    Byte(h_addr^[2]),Byte(h_addr^[3])]);
  end;
    WSACleanup;

  if copy(VS_IdRede,1,5) <> '127.0' then
     VS_DispRede:= 'Rede Disponível '
  else
  begin
     if VS_DispRede = 'Rede Disponível ' then
        VS_DispRede:= 'Tratar Rede indisponível '
     else
        if VS_DispRede = '' then
           VS_DispRede:= 'Rede indisponível ';
  end;

  FazLogException(VS_DispRede+' ['+VS_IdRede+']');
  Tratar_MsgErroServidor(VS_DispRede);
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para verificar a disponibilidade do Banco de Dados
// Data     : 21/06/2018
//
//--> Declare a Winsock na clausula uses da unit
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.Verifica_Disponibilidade_BD;
begin
   if VS_DispBD <> 'Tratar Servidor do Banco de questões indisponível'then
   begin
   if (not DM.IBDatabase_Ensino.TestConnected) then
   begin
      if VS_DispBD = 'Servidor do Banco de questões disponível' then
         Funcoes.SetDispBD('Tratar Servidor do Banco de questões indisponível')
   end
   else
      Funcoes.SetDispBD('Servidor do Banco de questões disponível');
  end;
  FazLogException(VS_DispBD);
  Tratar_MsgErroServidor(VS_DispBD);
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento da mensagem de erro do servidor
// Data     : 11/12/08
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Tratar_MsgErroServidor(VS_Msg: String);
begin
   if VS_DispRede = 'Tratar Rede indisponível ' then
   begin
      VS_DispRede:= 'Rede indisponível ';
      if Application.MessageBox(PChar('Erro na conexão da rede...'+#13+
                                      'Solicite ao Fiscal da Prova verificar se o cabo de rede esta conectado,'+#13+
                                      'se o cabo estiver conectado solicite para o Fiscal da Prova mudá-lo de maquina..'+
                                      #13+#13+'Deseja verificar novamente a conexão com a rede...'), 'Atenção',
          MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDNo then
         if  Application.MessageBox(PChar(#13+#13+'Deseja fechar o programa nesta maquina...'), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDYes then
             Application.terminate
      else
         VS_DispRede:= 'Rede Disponível '
   end
   else
   begin
      if VS_DispBD = 'Tratar Servidor do Banco de questões indisponível' then
      begin
         VS_DispBD:= 'Servidor do Banco de questões indisponível';

         if Application.MessageBox(PChar('Servidor do Banco de questões indisponível...'+#13+
                                         'Avise ao Fiscal da Prova do erro para ele entrar em contato com o responsável'+#13+
                                         #13+#13+'Deseja verificar novamente a conexão com o Servidor do Banco de questões...'), 'Atenção',
            MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDNo then
               if  Application.MessageBox(PChar(#13+#13+'Deseja fechar o programa nesta maquina...'), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDYes then
                   Application.terminate
//         else
//            Funcoes.SetDispBD('Servidor do Banco de questões disponível');
      end;
   end;

end;

//------------------------------------------------------------------------------
// Descricao: Tratamento da criacao do Log
// Data     : 21/06/2018
//
//--> Declare a Winsock na clausula uses da unit
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.FazLogException( Mensagem: string);
var
  Arquivo: TextFile;
  NomeArquivo: String;
begin
   if VS_Log <> 'Log___' then
   begin
      NomeArquivo:= Diretorio_Log+VS_Log;   //'Curso'+'Turma'+'Prova';

      if not DirectoryExists(Diretorio_Log) then
         ForceDirectories(Diretorio_Log);

      AssignFile(Arquivo, NomeArquivo);
      if FileExists(NomeArquivo) then
        Append(arquivo)
      else
        ReWrite(arquivo);

      try
        WriteLn(arquivo, DateTimeToStr(Now)+' - '+Mensagem);
      finally
        CloseFile(arquivo);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  Funcoes:= Funcao.Create;
end.

