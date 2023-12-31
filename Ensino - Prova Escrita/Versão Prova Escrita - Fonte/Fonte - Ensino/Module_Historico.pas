unit Module_Historico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBQuery, IBDatabase, IBCustomDataSet, IBTable, ImgList, Menus;

type
  TDM_Historico_APAC = class(TDataModule)
    IBDatabase_Historico: TIBDatabase;
    IBTransaction_Historico: TIBTransaction;
    IBQuery_Executa: TIBQuery;

    Function descriptografar (Armazena: String): string;
    procedure SetaServidor(P_Endereco: String);
    procedure DataModuleCreate(Sender: TObject);
  private    { Private declarations }
     arq: TextFile;
     VS_Secao, VS_Linha: String;
  public
    { Public declarations }
  end;

var
  DM_Historico_APAC: TDM_Historico_APAC;

implementation

{$R *.dfm}

procedure TDM_Historico_APAC.DataModuleCreate(Sender: TObject);
begin
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
         MessageDlg('O arquivo "Servidor.cnf" n�o foi encontrado na pasta "C:\DataBase_ICEA\Ensino" '+#13+'Este arquivo cont�m o endere�o do Banco de Dados'+#13+#13+'Favor entrar em contato com o respons�vel',mtError, [mbOk],0);
         Application.terminate;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para setar o Servidor
//------------------------------------------------------------------------------

procedure TDM_Historico_APAC.SetaServidor(P_Endereco: String);
var
   VS_EndServidor, VS_ServidorBH: String;
begin
   VS_ServidorBH:= 'BD_Historico_Ensino.gdb';

   AssignFile ( arq, P_Endereco );
   Reset ( arq );
   ReadLn ( arq, VS_Linha );
   ReadLn ( arq, VS_Secao );
    CloseFile ( arq );

   VS_EndServidor:= descriptografar (VS_Linha);

   IBDatabase_Historico.Connected:= False;
   IBDatabase_Historico.DatabaseName:= VS_EndServidor+VS_ServidorBH;
   Try
      IBDatabase_Historico.Connected:= True;
      IBTransaction_Historico.Active:= True;
   except
      MessageDlg('Servidor ('+VS_EndServidor+VS_ServidorBH+') fora do ar, tente novamente ou entre em contato com o Respons�vel',mtError, [mbOk],0);
      Application.terminate;
   end;

end;

//------------------------------------------------------------------------------
// Descricao: Descriptografa uma variavel fornecida
//
// Data     :
//
// Atualizado em: 15/08/2005
//------------------------------------------------------------------------------

Function TDM_Historico_APAC.descriptografar (Armazena: String): string;
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
