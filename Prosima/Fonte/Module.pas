unit Module;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBQuery, IBDatabase, IBCustomDataSet, IBTable, ImgList, Menus;

type
  TDM = class(TDataModule)
    Table_Acesso: TIBTable;
    Table_PerfilAcesso: TIBTable;
    Query_PerfilAcesso: TIBQuery;
    Query_Executa: TIBQuery;
    Query_Usuario: TIBQuery;
    Query_PerfilAcessoIDCODIGO: TIBStringField;
    Query_PerfilAcessoMODULO: TIBStringField;
    Query_PerfilAcessoPOSSUIACESSO: TIBStringField;
    Query_PerfilAcessoINSERIR: TIBStringField;
    Query_PerfilAcessoALTERAR: TIBStringField;
    Query_PerfilAcessoEXCLUIR: TIBStringField;
    Query_PerfilAcessoGRAVAACESSO: TIBStringField;
    IBDatabase_Ensino: TIBDatabase;
    IBTransaction_Ensino: TIBTransaction;
    PopupMenu_Ajuda: TPopupMenu;
    Sobre1: TMenuItem;
    IBQuery_Cargo: TIBQuery;
    DSQ_Cargo: TDataSource;
    Table_AcessoIDCODIGO: TIBStringField;
    Table_AcessoIDMODULO: TIBStringField;
    Table_AcessoDATA: TDateTimeField;
    Table_AcessoHORA: TIBStringField;
    Table_AcessoATIVIDADE: TIBStringField;
    IBTable_Configuracao: TIBTable;
    IBTable_ConfiguracaoNOME: TIBStringField;
    IBTable_ConfiguracaoSIGLA: TIBStringField;
    IBTable_ConfiguracaoCIDADE: TIBStringField;
    DST_Configuracao: TDataSource;
    IBTable_ConfiguracaoENDERECO: TIBStringField;
    IBTable_ConfiguracaoNUMERO: TIBStringField;
    IBTable_ConfiguracaoBAIRRO: TIBStringField;
    IBTable_ConfiguracaoESTADO: TIBStringField;
    IBTable_ConfiguracaoCEP: TIBStringField;
    IBTable_ConfiguracaoTELEFONE: TIBStringField;
    IBTable_ConfiguracaoFAX: TIBStringField;
    IBTable_ConfiguracaoEMAIL: TIBStringField;
    IBTable_ConfiguracaoDIVISAO: TIBStringField;
    Query_UsuarioIDCODIGO: TIBStringField;
    Query_UsuarioNOME: TIBStringField;
    Query_UsuarioSENHA: TIBStringField;
    Query_UsuarioACESSO: TIBStringField;
    Query_UsuarioSECAO: TIBStringField;
    IBQuery_ExecSql: TIBQuery;
    ImageList_Ensino: TImageList;
    IBQuery_MontaTurma: TIBQuery;
    DSQ_MontaTurma: TDataSource;
    Table_PerfilAcessoIDCODIGO: TIBStringField;
    Table_PerfilAcessoMODULO: TIBStringField;
    Table_PerfilAcessoPOSSUIACESSO: TIBStringField;
    Table_PerfilAcessoINSERIR: TIBStringField;
    Table_PerfilAcessoALTERAR: TIBStringField;
    Table_PerfilAcessoEXCLUIR: TIBStringField;
    Table_PerfilAcessoGRAVAACESSO: TIBStringField;
    IBQuery_MontaTurmaIDCURSO: TSmallintField;
    IBQuery_MontaTurmaIDTURMA: TIntegerField;
    IBQuery_MontaTurmaTURMA: TIBStringField;
    IBQuery_MontaTurmaANO: TIBStringField;
    IBQuery_MontaTurmaDATAINICIO: TDateTimeField;
    IBQuery_MontaTurmaDATATERMINO: TDateTimeField;
    IBQuery_MontaTurmaCOORDENADOR: TIBStringField;
    IBQuery_MontaTurmaSTATUS: TIBStringField;
    IBQuery_MontaTurmaDESCRICAO: TIBStringField;
    IBQuery_MontaTurmaCODSALA: TIBStringField;
    DSQ_usuario: TDataSource;
    Query_UsuarioATUALIZACAO: TDateTimeField;
    IBQuery_Executa_ensino: TIBQuery;
    IBQuery_Login_Instrutor: TIBQuery;
    DSQ_Login_Instrutor: TDataSource;
    IBQuery_Login_InstrutorIDCURSO: TSmallintField;
    IBQuery_Login_InstrutorIDTURMA: TIntegerField;
    IBQuery_Login_InstrutorNOME: TIBStringField;
    IBQuery_Login_InstrutorNOMEGUERRA: TIBStringField;
    IBQuery_Login_InstrutorIDENTIDADE: TIBStringField;
    IBQuery_Login_InstrutorFUNCAO: TIBStringField;
    IBQuery_Login_InstrutorSENHA: TIBStringField;
    IBDatabase_Prosima: TIBDatabase;
    IBTransaction_Prosima: TIBTransaction;
    IBQuery_ExecutaProsima: TIBQuery;
    IBQuery_Prosima_Ensino: TIBQuery;

    Function descriptografar (Armazena: String): string;
    procedure SetaServidor(P_Endereco: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
  private    { Private declarations }
     arq: TextFile;
     VS_Secao, VS_Linha: String;
  public    { Public declarations }
     VS_Exercicio, VS_data: String;
  end;

var
  DM: TDM;

implementation

uses Sobre;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento quando o DataModule esta sendo criado
//------------------------------------------------------------------------------

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   VS_Exercicio:= '';
   VS_data:= DateToStr(Date);

   if FileExists('C:\DataBase_ICEA\Ensino\servidor.cnf') = True then
   begin
      SetaServidor('C:\DataBase_ICEA\Ensino\servidor.cnf');
   end
   else
   begin
      if FileExists('servidor.cnf') = True then
      begin
         SetaServidor('servidor.cnf');
      end
      else
      begin
         MessageDlg('O arquivo "Servidor.cnf" não foi encontrado na pasta "C:\DataBase_ICEA\Ensino" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
         Application.terminate;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Chama a Form de tratamento da versão do sistema
//------------------------------------------------------------------------------

procedure TDM.Sobre1Click(Sender: TObject);
begin
   Application.CreateForm(TForm_Sobre, Form_Sobre);
   Form_Sobre.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento para setar o Servidor
//------------------------------------------------------------------------------

procedure TDM.SetaServidor(P_Endereco: String);
var
   VS_EndServidor, VS_ServidorBC, VS_ServidorProsima: String;
begin
//    VS_ServidorBC:= 'Execucao.gdb';
    VS_ServidorBC:= 'BD_Ensino.gdb';
    VS_ServidorProsima:= 'BD_Prosima.gdb';
    AssignFile ( arq, P_Endereco );
    Reset ( arq );
    ReadLn ( arq, VS_Linha );
    ReadLn ( arq, VS_Secao );
    CloseFile ( arq );

    VS_EndServidor:= descriptografar (VS_Linha);
//    Funcoes.
    IBDatabase_Ensino.Connected:= False;
    IBDatabase_Ensino.DatabaseName:= VS_EndServidor+VS_ServidorBC;
    IBDatabase_Ensino.Connected:= True;

//    IBTransaction_Ensino.Active:= True;

    IBDatabase_Prosima.Connected:= False;
    IBDatabase_Prosima.DatabaseName:= VS_EndServidor+VS_ServidorProsima;
    IBDatabase_Prosima.Connected:= True;

    IBTransaction_Prosima.Active:= True;

    //--- Abre as Tabelas

    IBTable_Configuracao.Open;
end;

//------------------------------------------------------------------------------
// Descricao: Descriptografa uma variavel fornecida
//
// Data     :
//
// Atualizado em: 15/08/2005
//------------------------------------------------------------------------------

Function TDM.descriptografar (Armazena: String): string;
var
    Resultado: string;
    Temp: char;
    CodIndex,Cont: integer;
begin
   Resultado:= '';

   for Cont := 1 to length(Armazena) do
   begin
      if ((copy(Armazena, Cont, 1) = 'V') or (copy(Armazena, Cont, 1) = 'W')  or
          (copy(Armazena, Cont, 1) = 'X') or (copy(Armazena, Cont, 1) = 'Y')  or
          (copy(Armazena, Cont, 1) = 'Z')) then
      begin
         Resultado:= Resultado + copy(Armazena, Cont, 1);
      end
      else
      begin
         for CodIndex := 1 to 2 do
         begin
            Temp:= Pred(Armazena[cont]);
            Armazena[cont]:= Temp;
         end;
         Resultado:= Resultado + Temp;
      end;
   end;
   descriptografar:= Resultado;
end;
end.
