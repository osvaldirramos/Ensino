unit Module_Historico_SGEW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBQuery, IBDatabase, IBCustomDataSet, IBTable, ImgList, Menus;

type
  TDM_Historico_SGEW = class(TDataModule)
    IBDatabase_Historico_SGEW: TIBDatabase;
    IBTransaction_Historico_SGEW: TIBTransaction;
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
  DM_Historico_SGEW: TDM_Historico_SGEW;

implementation

{$R *.dfm}

procedure TDM_Historico_SGEW.DataModuleCreate(Sender: TObject);
begin
   if FileExists('C:\DataBase_ICEA\Ensino\servidor.cnf') = True then
      SetaServidor('C:\DataBase_ICEA\Ensino\servidor.cnf')
   else
   begin
      if FileExists('servidor.cnf') = True then
         SetaServidor('servidor.cnf')
      else
      begin
         MessageDlg('O arquivo "Servidor.cnf" não foi encontrado na pasta "C:\DataBase_ICEA\Ensino" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
         Application.terminate;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para setar o Servidor
//------------------------------------------------------------------------------

procedure TDM_Historico_SGEW.SetaServidor(P_Endereco: String);
var
   VS_EndServidor, VS_ServidorBH: String;
begin
   VS_ServidorBH:= 'BD_Historico_SGEW.gdb';

   AssignFile ( arq, P_Endereco );
   Reset ( arq );
   ReadLn ( arq, VS_Linha );
   ReadLn ( arq, VS_Secao );
    CloseFile ( arq );

   VS_EndServidor:= descriptografar (VS_Linha);

   IBDatabase_Historico_SGEW.Connected:= False;
   IBDatabase_Historico_SGEW.DatabaseName:= VS_EndServidor+VS_ServidorBH;
   Try
      IBDatabase_Historico_SGEW.Connected:= True;
      IBTransaction_Historico_SGEW.Active:= True;
   except
      MessageDlg('Servidor ('+VS_EndServidor+VS_ServidorBH+') fora do ar, tente novamente ou entre em contato com o Responsável',mtError, [mbOk],0);
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

Function TDM_Historico_SGEW.descriptografar (Armazena: String): string;
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
