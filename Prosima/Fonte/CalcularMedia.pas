unit CalcularMedia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, IBCustomDataSet, IBQuery, Rotinas,
  IBTable, ExtCtrls, DBCtrls, ComCtrls;

type
  TForm_CalcularMedia = class(TForm)
    IBQuery_AlunoTurma: TIBQuery;
    DSQ_AlunoTurma: TDataSource;
    IBQuery_RelacaoAlunosMedia: TIBQuery;
    IBQuery_RelacaoAlunosMediaIDCURSO: TSmallintField;
    IBQuery_RelacaoAlunosMediaIDTURMA: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_FICHA: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_ATCO: TIBStringField;
    IBQuery_RelacaoAlunosMediaID_AVL: TIBStringField;
    IBQuery_RelacaoAlunosMediaID_EXERCICIO: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_INSTRUTOR: TIBStringField;
    IBQuery_RelacaoAlunosMediaNOMECOMPLETO: TIBStringField;
    IBQuery_RelacaoAlunosMediaDATA_AVL: TDateTimeField;
    IBQuery_RelacaoAlunosMediaLOCAL: TIBStringField;
    IBQuery_RelacaoAlunosMediaMEDIA: TIBBCDField;
    IBQuery_RelacaoAlunosMediaPARECER: TBlobField;
    IBQuery_RelacaoAlunosMediaNS: TIBStringField;
    IBQuery_RelacaoAlunosMediaFICHACOMPLETA: TIBStringField;
    DSQ_RelacaoAlunosMedia: TDataSource;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    Button_AnalizarAlunosSemMedia: TButton;
    IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBTable_instrutor: TIBTable;
    IBTable_instrutorIDCURSO: TSmallintField;
    IBTable_instrutorIDTURMA: TIntegerField;
    IBTable_instrutorIDENTIDADE: TIBStringField;
    IBTable_instrutorFUNCAO: TIBStringField;
    IBTable_instrutorNOMECOMPLETO: TIBStringField;
    DST_Instrutor: TDataSource;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    IBTable_AlunoTurma: TIBTable;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField3: TIBStringField;
    DST_Aluno: TDataSource;
    IBTable_instrutorCODIGOINSTRUTOR: TIntegerField;
    DBNavigator1: TDBNavigator;
    IBQuery_CadFichaAvl: TIBQuery;
    DSQ_CadFichaAvl: TDataSource;
    IBTable_CadFichaAvl: TIBTable;
    DataSource2: TDataSource;
    IBTable_CadParecer: TIBTable;
    DataSource3: TDataSource;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    DBGrid7: TDBGrid;
    Button2: TButton;
    IBQuery_CadFichaAvlIDCURSO: TSmallintField;
    IBQuery_CadFichaAvlIDTURMA: TIntegerField;
    IBQuery_CadFichaAvlID_FICHA: TIntegerField;
    IBQuery_CadFichaAvlID_ATCO: TIBStringField;
    IBQuery_CadFichaAvlID_AVL: TIBStringField;
    IBQuery_CadFichaAvlID_EXERCICIO: TIntegerField;
    IBQuery_CadFichaAvlID_INSTRUTOR: TIBStringField;
    IBQuery_CadFichaAvlNOMECOMPLETO: TIBStringField;
    IBQuery_CadFichaAvlDATA_AVL: TDateTimeField;
    IBQuery_CadFichaAvlLOCAL: TIBStringField;
    IBQuery_CadFichaAvlMEDIA: TIBBCDField;
    IBQuery_CadFichaAvlPARECER: TBlobField;
    IBQuery_CadFichaAvlNS: TIBStringField;
    IBQuery_CadFichaAvlFICHACOMPLETA: TIBStringField;
    IBQuery_CadFichaAvlESTAGIARIO: TIBStringField;
    IBTable_CadFichaAvlIDCURSO: TSmallintField;
    IBTable_CadFichaAvlIDTURMA: TIntegerField;
    IBTable_CadFichaAvlID_FICHA: TIntegerField;
    IBTable_CadFichaAvlID_ATCO: TIBStringField;
    IBTable_CadFichaAvlID_AVL: TIBStringField;
    IBTable_CadFichaAvlID_EXERCICIO: TIntegerField;
    IBTable_CadFichaAvlID_INSTRUTOR: TIBStringField;
    IBTable_CadFichaAvlNOMECOMPLETO: TIBStringField;
    IBTable_CadFichaAvlDATA_AVL: TDateTimeField;
    IBTable_CadFichaAvlLOCAL: TIBStringField;
    IBTable_CadFichaAvlMEDIA: TIBBCDField;
    IBTable_CadFichaAvlPARECER: TBlobField;
    IBTable_CadFichaAvlNS: TIBStringField;
    IBTable_CadFichaAvlFICHACOMPLETA: TIBStringField;
    IBTable_CadFichaAvlESTAGIARIO: TIBStringField;
    IBTable_CadParecerIDCURSO: TSmallintField;
    IBTable_CadParecerIDTURMA: TIntegerField;
    IBTable_CadParecerID_FICHA: TIntegerField;
    IBTable_CadParecerID_ATCO: TIBStringField;
    IBTable_CadParecerID_AVL: TIBStringField;
    IBTable_CadParecerID_EXERCICIO: TIntegerField;
    IBTable_CadParecerPARECER: TBlobField;
    DBRichEdit1: TDBRichEdit;
    DBMemo1: TDBMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button_AnalizarAlunosSemMediaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CalcularMedia: TForm_CalcularMedia;

implementation

uses Module;

{$R *.dfm}

procedure TForm_CalcularMedia.Button1Click(Sender: TObject);
var
   VF_Soma, VF_Media, VF_Cont: Real;
begin
   IBQuery_RelacaoAlunosMedia.OPen;
   IBQuery_AlunoTurma.Open;
   IBQuery_AlunoTurma.First;
   While not IBQuery_AlunoTurma.Eof do
   begin
      VF_Cont:= 0;
      VF_Soma:= 0;
      VF_Media:= 0;
      IBQuery_RelacaoAlunosMedia.First;
      While not IBQuery_RelacaoAlunosMedia.Eof do
      begin
         VF_Cont:= VF_Cont+1;
         VF_Soma:= VF_Soma+IBQuery_RelacaoAlunosMedia.FieldByName('Media').AsFloat;
        IBQuery_RelacaoAlunosMedia.Next;
      end;

      if VF_Cont > 0 then
         VF_Media:= VF_Soma/VF_Cont
      else
         VF_Media:= 0;

      Funcoes.ExecSql( 'Update AlunoTurma set NotaFinal = '+Funcoes.DePara(FloatToStr(VF_Media),',','.')+' where IdCurso = '+Funcoes.GetIdCurso+' and IdTurma = '+IBQuery_AlunoTurma.FieldByName('IdTurma').AsString+' and Identidade = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39);
      IBQuery_AlunoTurma.Next;
   end;
end;

procedure TForm_CalcularMedia.Button_AnalizarAlunosSemMediaClick(Sender: TObject);
var
   VF_Soma, VF_Media, VF_Cont: Real;
begin
   IBQuery_AlunoTurma.Close;
   IBQuery_AlunoTurma.Open;
   While not IBQuery_AlunoTurma.Eof do
   begin
      if trim(IBTable_instrutor.FieldByName('IdCurso').AsString) <> '' then
         break;
      IBQuery_AlunoTurma.Next;
   end;
end;

procedure TForm_CalcularMedia.Button2Click(Sender: TObject);
begin
   IBTable_CadParecer.Open;
   IBTable_CadFichaAvl.Open;

   IBQuery_CadFichaAvl.Open;
   IBQuery_CadFichaAvl.First;
   While not IBQuery_CadFichaAvl.Eof do
   begin
      if  IBTable_CadParecer.FieldByName('IdCurso').AsString <> '' then
      begin
         IBTable_CadFichaAvl.Edit;
         IBTable_CadFichaAvl.FieldByName('Parecer').AsString:= IBTable_CadParecer.FieldByName('Parecer').AsString;
         IBTable_CadFichaAvl.FieldByName('Local').AsString:= 'ICEA';
         IBTable_CadFichaAvl.Post;
         Funcoes.ExecutaTransacao_Prosima;
      end;

      IBQuery_CadFichaAvl.Next;
   end;
end;

end.
