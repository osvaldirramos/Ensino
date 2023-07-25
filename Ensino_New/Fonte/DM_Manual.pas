unit DM_Manual;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, ImgList,
  Controls, Rotinas, IBTable;

type
  TDMManual = class(TDataModule)
    IBDatabase_Manual: TIBDatabase;
    IBTransaction_Manual: TIBTransaction;
    IBQuery_Manual: TIBQuery;
    DSQ_Manual: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMManual: TDMManual;

implementation                          

{$R *.dfm}

procedure TDMManual.DataModuleCreate(Sender: TObject);
var
   arq: TextFile;
   VS_EndServidor, VS_ServidorBC, VS_Linha: String;
begin
   VS_ServidorBC:= 'Manual.gdb';
   if FileExists('C:\DataBase_ICEA\Ensino\servidor.cnf') = True then
   begin
      AssignFile ( arq, 'C:\DataBase_ICEA\Ensino\servidor.cnf' );
      Reset ( arq );
      ReadLn ( arq, VS_Linha );
      CloseFile ( arq );

      VS_EndServidor:= Funcoes.Descriptografar (VS_Linha);
      IBDatabase_Manual.Connected:= False;
      IBDatabase_Manual.DatabaseName:= VS_EndServidor+VS_ServidorBC;
      IBDatabase_Manual.Connected:= True;
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
         IBDatabase_Manual.Connected:= False;
         IBDatabase_Manual.DatabaseName:= VS_EndServidor+VS_ServidorBC;
         IBDatabase_Manual.Connected:= True;
      end;
   end;

end;


end.
