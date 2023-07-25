unit Tratar_Erros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBTable, StdCtrls;

type
  TForm_Tratar_Erros = class(TForm)
    IBTable_Gabarito_Local: TIBTable;
    DST_Gabarito: TDataSource;
    DBGrid1: TDBGrid;
    IBTable_Gabarito_Svd: TIBTable;
    DST_Gabarito_SVD: TDataSource;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    IBTable_Gabarito_LocalIDCURSO: TSmallintField;
    IBTable_Gabarito_LocalIDTURMA: TIntegerField;
    IBTable_Gabarito_LocalNUMITEM: TIntegerField;
    IBTable_Gabarito_LocalFASEAPLICACAO: TIBStringField;
    IBTable_Gabarito_LocalREFERENCIAAVALIACAO: TIBStringField;
    IBTable_Gabarito_LocalCODMATERIA: TIBStringField;
    IBTable_Gabarito_LocalMATERIA: TIBStringField;
    IBTable_Gabarito_LocalNUMEROQUESTAO: TSmallintField;
    IBTable_Gabarito_LocalQUESTAOANULADA: TIBStringField;
    IBTable_Gabarito_LocalQUESTAOIRREGULAR: TIBStringField;
    IBTable_Gabarito_LocalALTERNATIVACORRETAA: TIBStringField;
    IBTable_Gabarito_LocalALTERNATIVACORRETAB: TIBStringField;
    IBTable_Gabarito_LocalALTERNATIVACORRETAC: TIBStringField;
    IBTable_Gabarito_LocalALTERNATIVACORRETAD: TIBStringField;
    IBTable_Gabarito_LocalALTERNATIVACORRETAE: TIBStringField;
    IBTable_Gabarito_LocalINDICEFACILIDADE: TIBStringField;
    IBTable_Gabarito_LocalUSUARIO: TIBStringField;
    IBTable_Gabarito_LocalREVISAO: TIBStringField;
    IBTable_Gabarito_SvdIDCURSO: TSmallintField;
    IBTable_Gabarito_SvdIDTURMA: TIntegerField;
    IBTable_Gabarito_SvdNUMITEM: TIntegerField;
    IBTable_Gabarito_SvdFASEAPLICACAO: TIBStringField;
    IBTable_Gabarito_SvdREFERENCIAAVALIACAO: TIBStringField;
    IBTable_Gabarito_SvdCODMATERIA: TIBStringField;
    IBTable_Gabarito_SvdMATERIA: TIBStringField;
    IBTable_Gabarito_SvdNUMEROQUESTAO: TSmallintField;
    IBTable_Gabarito_SvdQUESTAOANULADA: TIBStringField;
    IBTable_Gabarito_SvdQUESTAOIRREGULAR: TIBStringField;
    IBTable_Gabarito_SvdALTERNATIVACORRETAA: TIBStringField;
    IBTable_Gabarito_SvdALTERNATIVACORRETAB: TIBStringField;
    IBTable_Gabarito_SvdALTERNATIVACORRETAC: TIBStringField;
    IBTable_Gabarito_SvdALTERNATIVACORRETAD: TIBStringField;
    IBTable_Gabarito_SvdALTERNATIVACORRETAE: TIBStringField;
    IBTable_Gabarito_SvdINDICEFACILIDADE: TIBStringField;
    IBTable_Gabarito_SvdUSUARIO: TIBStringField;
    IBTable_Gabarito_SvdREVISAO: TIBStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Tratar_Erros: TForm_Tratar_Erros;

implementation

uses Module;

{$R *.dfm}

procedure TForm_Tratar_Erros.Button1Click(Sender: TObject);
begin
IBTable_Gabarito_Local.Open;
IBTable_Gabarito_Svd.Open
end;

procedure TForm_Tratar_Erros.Button2Click(Sender: TObject);
begin
   IBTable_Gabarito_Local.First;
   While not IBTable_Gabarito_Local.Eof do
   begin
       IBTable_Gabarito_Svd.Append;
       IBTable_Gabarito_Svd.FieldByName('IDCURSO').AsString:= IBTable_Gabarito_Local.FieldByName('IDCURSO').AsString;
       IBTable_Gabarito_Svd.FieldByName('IDTURMA').AsString:= IBTable_Gabarito_Local.FieldByName('IDTURMA').AsString;
       IBTable_Gabarito_Svd.FieldByName('FASEAPLICACAO').AsString:= IBTable_Gabarito_Local.FieldByName('FASEAPLICACAO').AsString;
       IBTable_Gabarito_Svd.FieldByName('REFERENCIAAVALIACAO').AsString:= IBTable_Gabarito_Local.FieldByName('REFERENCIAAVALIACAO').AsString;
       IBTable_Gabarito_Svd.FieldByName('CODMATERIA').AsString:= IBTable_Gabarito_Local.FieldByName('CODMATERIA').AsString;
       IBTable_Gabarito_Svd.FieldByName('IDENTIDADE').AsString:= IBTable_Gabarito_Local.FieldByName('IDENTIDADE').AsString;
       IBTable_Gabarito_Svd.FieldByName('OPCAOVETOR').AsString:= IBTable_Gabarito_Local.FieldByName('OPCAOVETOR').AsString;
       IBTable_Gabarito_Svd.FieldByName('GABARITO').AsString:= IBTable_Gabarito_Local.FieldByName('GABARITO').AsString;

       {       IBTable_Gabarito_Svd.FieldByName('TERMINO').AsString:= IBTable_Gabarito_Local.FieldByName('TERMINO').AsString;
       IBTable_Gabarito_Svd.FieldByName('QTDRESPONDIDAS').AsString:= IBTable_Gabarito_Local.FieldByName('QTDRESPONDIDAS').AsString;
       IBTable_Gabarito_Svd.FieldByName('SENHA').AsString:= IBTable_Gabarito_Local.FieldByName('SENHA').AsString;
       IBTable_Gabarito_Svd.FieldByName('OBSEVACAO').AsString:= IBTable_Gabarito_Local.FieldByName('OBSEVACAO').AsString;
       IBTable_Gabarito_Svd.FieldByName('PROVAABERTA').AsString:= IBTable_Gabarito_Local.FieldByName('PROVAABERTA').AsString;
       }
       IBTable_Gabarito_Svd.Post;

       IBTable_Gabarito_Local.Next;
   end;

   Funcoes.ExecutaTransacao;

end;

end.
