unit Module;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBQuery, IBDatabase, IBCustomDataSet, IBTable, ImgList,
  Menus;

type
  TDM = class(TDataModule)
    IBQuery_Executa: TIBQuery;
    Query_Usuario: TIBQuery;
    IBDatabase_Ensino: TIBDatabase;
    IBTransaction_Ensino: TIBTransaction;
    IBQuery_ExecSql: TIBQuery;
    DSQ_usuario: TDataSource;
    DSQ_Executa: TDataSource;
    IBQuery_Executa_2: TIBQuery;

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
  DM: TDM;

implementation

{$R *.DFM}

procedure TDM.DataModuleCreate(Sender: TObject);
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
         MessageDlg('O arquivo "Servidor.cnf" não foi encontrado na pasta "C:\DataBase_ICEA\Ensino" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
         Application.terminate;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para setar o Servidor
//------------------------------------------------------------------------------

procedure TDM.SetaServidor(P_Endereco: String);
var
   VS_EndServidor, VS_ServidorBC: String;
begin
//    VS_ServidorBC:= 'Execucao.gdb';
    VS_ServidorBC:= 'BD_Ensino.gdb';
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
    IBTransaction_Ensino.Active:= True;
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
