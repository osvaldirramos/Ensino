unit EstatisticaItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Grids, DBGrids, DBCtrls, JvComponent,
  JvTransBtn, ExtCtrls, JvShape, JvGradient, IBQuery, StdCtrls, Mask,
  JvEdit, ToolWin, ComCtrls;

type
  TForm_EstatisticaItem = class(TForm)
    Query_MontaMateria: TIBQuery;
    DSQ_MontaMateria: TDataSource;
    Query_MontaMateriaIDCURSO: TSmallintField;
    Query_MontaMateriaIDTURMA: TIntegerField;
    Query_MontaMateriaCODMATERIA: TIBStringField;
    Query_MontaMateriaNOMEMATERIA: TIBStringField;
    Query_MontaMateriaQTDITENS: TIntegerField;
    Panel1: TPanel;
    DBGrid_Disciplina: TDBGrid;
    Panel_Botoes: TPanel;
    JvShape1: TJvShape;
    JvTransparentButton_ConfigurarImpressora: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton2: TJvTransparentButton;
    Shape7: TShape;
    Label_inicio: TLabel;
    Label_termino: TLabel;
    Label_Turma: TLabel;
    Label_Curso: TLabel;
    DBNavigator: TDBNavigator;
    DBEdit_Inicio: TDBEdit;
    DBEdit_Termino: TDBEdit;
    Edit_Curso: TEdit;
    Edit_Turma: TEdit;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Edit_TotalItens: TEdit;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton2Click(Sender: TObject);
    procedure JvTransparentButton_ConfigurarImpressoraClick(
      Sender: TObject);
    procedure DBGrid_DisciplinaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private    { Private declarations }
      VI_TotalItens: integer;
  public
    { Public declarations }
  end;

var
  Form_EstatisticaItem: TForm_EstatisticaItem;

implementation

uses Rotinas, Sel_ItemProva, Module, Rel_EID,
  Frame_Sel_Curso;

{$R *.dfm}

procedure TForm_EstatisticaItem.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
      VI_TotalItens:= 0;
      Form_Sel_ItemProva.VS_Opcao_Rel:= 'Aberto';
      Edit_Curso.Text:= Frame_SelCurso.ComboBox_Curso.Text;
      Edit_Turma.Text:= Frame_SelCurso.ComboBox_Turma.Text;

      VS_Comando:= 'select i.idcurso, i.idturma, i.codmateria, m.nomemateria, count(*) as QtdItens '+
                   ' From item_prova i, MateriaCurso m '+
                   ' Where i.idcurso = m.idcurso '+
                   ' and   i.idTurma = m.idTurma '+
                   ' and   i.codmateria = m.codmateria '+
                   ' and   i.idCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                   ' and   i.idTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                   ' group by i.idcurso, i.idturma, i.codmateria, m.nomemateria '+
                   ' Order by i.idcurso, i.idturma, i.codmateria, m.nomemateria ';

      Funcoes.ExecutaQuery(Query_MontaMateria, VS_Comando);
 //  end;
end;

procedure TForm_EstatisticaItem.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_EstatisticaItem.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_EstatisticaItem.JvTransparentButton2Click(Sender: TObject);
begin
   Application.CreateForm(TForm_Rel_EID, Form_Rel_EID);
   Form_Rel_EID.QuickRep1.Prepare;
   Form_Rel_EID.QuickRep1.Preview
end;

procedure TForm_EstatisticaItem.JvTransparentButton_ConfigurarImpressoraClick(Sender: TObject);
begin
   PrinterSetupDialog1.Execute;

end;

procedure TForm_EstatisticaItem.DBGrid_DisciplinaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Column.Title.Caption = 'Qtd Itens' then
   begin
     VI_TotalItens:= VI_TotalItens + Query_MontaMateria.FieldByName('QTDITENS').AsInteger;
      Edit_TotalItens.Text:= FormatFloat('00000', VI_TotalItens);
   end;

end;

end.
