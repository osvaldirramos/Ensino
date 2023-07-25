unit DM_Item;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, Rotinas;

type
  TDMItem = class(TDataModule)
    IBDatabase_ItemProva: TIBDatabase;
    IBTransaction_ItemProva: TIBTransaction;
    IBQuery_ExecSql: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMItem: TDMItem;

implementation

{$R *.dfm}

procedure TDMItem.DataModuleCreate(Sender: TObject);
var
   arq: TextFile;
   VS_EndServidor, VS_ServidorBC, VS_Linha: String;
begin
   VS_ServidorBC:= 'BD_Ensino.gdb';
   if FileExists('C:\DataBase_ICEA\Ensino\servidor.cnf') = True then
   begin
      AssignFile ( arq, 'C:\DataBase_ICEA\Ensino\servidor.cnf' );
      Reset ( arq );
      ReadLn ( arq, VS_Linha );
      CloseFile ( arq );

      VS_EndServidor:= Funcoes.Descriptografar (VS_Linha);
      IBDatabase_ItemProva.Connected:= False;
      IBDatabase_ItemProva.DatabaseName:= VS_EndServidor+VS_ServidorBC;
      IBDatabase_ItemProva.Connected:= True;
      IBTransaction_ItemProva.Active:= True;
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
         IBDatabase_ItemProva.Connected:= False;
         IBDatabase_ItemProva.DatabaseName:= VS_EndServidor+VS_ServidorBC;
         IBDatabase_ItemProva.Connected:= True;
         IBTransaction_ItemProva.Active:= True;
      end;
   end;
end;

end.
