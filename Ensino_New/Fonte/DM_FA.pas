unit DM_FA;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, ImgList,
  Controls, Rotinas;

type
  TDM_FA = class(TDataModule)
    IBDatabase_FA: TIBDatabase;
    IBTransaction_FA: TIBTransaction;
    Query_Executa: TIBQuery;
    IBQuery_ExecSql: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
//  DM_FA: TDM_FA;

implementation

{$R *.dfm}

procedure TDM_FA.DataModuleCreate(Sender: TObject);
var
   arq: TextFile;
   VS_EndServidor, VS_ServidorBC, VS_Linha: String;
begin
   VS_ServidorBC:= 'Planejamento.gdb';
   if FileExists('C:\DataBase_ICEA\Ensino\servidor.cnf') = True then
   begin
      AssignFile ( arq, 'C:\DataBase_ICEA\Ensino\servidor.cnf' );
      Reset ( arq );
      ReadLn ( arq, VS_Linha );
      CloseFile ( arq );

      VS_EndServidor:= Funcoes.Descriptografar (VS_Linha);
      IBDatabase_Pln.Connected:= False;
      IBDatabase_Pln.DatabaseName:= VS_EndServidor+VS_ServidorBC;
      IBDatabase_Pln.Connected:= True;
   end
   else
   begin
      if FileExists('servidor.cnf') = True then
      begin
         AssignFile ( arq, 'servidor.cnf' );
         Reset ( arq );
         ReadLn ( arq, VS_Linha );
         CloseFile ( arq );

         VS_EndServidor:= Funcoes.Descriptografar (VS_Linha);
         IBDatabase_Pln.Connected:= False;
         IBDatabase_Pln.DatabaseName:= VS_EndServidor+VS_ServidorBC;
         IBDatabase_Pln.Connected:= True;
      end;
   end;

end;


end.
