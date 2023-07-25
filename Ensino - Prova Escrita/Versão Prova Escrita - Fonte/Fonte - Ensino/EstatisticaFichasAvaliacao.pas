unit EstatisticaFichasAvaliacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvShape, TeEngine, Series, TeeProcs, Chart, Grids,
  StdCtrls, ComCtrls, ToolWin,  Mask, JvToolEdit, Buttons, DB,
  IBCustomDataSet, IBQuery, DBGrids, ComObj, JvLabel, JvBlinkingLabel,
  Rotinas, Rotinas_Sue, Rotinas_TrataData, JvLookOut, JvComponent,
  JvTransBtn;

type
  TForm_estatisticaFichasAvaliacao = class(TForm)
    DBGrid_Lista: TStringGrid;
    Query_FA_Avaliacao: TIBQuery;
    DSQ_FA_Avaliacao: TDataSource;
    IBQuery_FA_Respostas: TIBQuery;
    DSQ_FA_Respostas: TDataSource;
    IBQuery_FA_RespostasIDFICHA: TSmallintField;
    IBQuery_FA_RespostasRESPONDEU: TIBStringField;
    IBQuery_FA_RespostasIDENTIDADE: TIBStringField;
    IBQuery_FA_RespostasDISCIPLINA: TIBStringField;
    IBQuery_FA_RespostasIDALUNO: TIBStringField;
    Query_FA_AvaliacaoIDFICHA: TSmallintField;
    Query_FA_AvaliacaoIDENTIDADE: TIBStringField;
    Query_FA_AvaliacaoDATAAVALIACAO: TDateTimeField;
    Query_FA_AvaliacaoIDCURSO: TSmallintField;
    Query_FA_AvaliacaoIDTURMA: TIntegerField;
    IBQuery_FA_RespostasIDCURSO: TSmallintField;
    IBQuery_FA_RespostasIDTURMA: TIntegerField;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    JvDateEdit_Inicio: TJvDateEdit;
    JvDateEdit_Termino: TJvDateEdit;
    ComboBox_Curso: TComboBox;
    IBQuery_FA_Modelo: TIBQuery;
    IBQuery_FA_ModeloIDFICHA: TSmallintField;
    IBQuery_FA_ModeloCABECALHO: TIBStringField;
    DSQ_FA_Modelo: TDataSource;
    IBQuery_FichaAvaliacao: TIBQuery;
    IBQuery_FichaAvaliacaoIDCURSO: TSmallintField;
    IBQuery_FichaAvaliacaoIDTURMA: TIntegerField;
    IBQuery_FichaAvaliacaoIDFICHA: TSmallintField;
    IBQuery_FichaAvaliacaoIDENTIDADE: TIBStringField;
    IBQuery_FichaAvaliacaoDISCIPLINA: TIBStringField;
    IBQuery_FichaAvaliacaoDATAAVALIACAO: TDateTimeField;
    IBQuery_FichaAvaliacaoDISPONIVEL: TIBStringField;
    IBQuery_FichaAvaliacaoCABECALHO: TIBStringField;
    IBQuery_FichaAvaliacaoIDCOORDENADOR: TIBStringField;
    IBQuery_FichaAvaliacaoIDAVL_ICEA: TIBStringField;
    DSQ_FichaAvaliacao: TDataSource;
    Query_FA_AvaliacaoDISCIPLINA: TIBStringField;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape4: TJvShape;
    JvExpressButton_Pesquisar: TJvExpressButton;
    JvShapeExcel: TJvShape;
    JvTransparentButton_Excel: TJvTransparentButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_ExcelClick(Sender: TObject);
    procedure JvExpressButton_PesquisarClick(Sender: TObject);
  private    { Private declarations }
     VI_Ficha: Integer;
  public
    { Public declarations }
  end;

var
  Form_estatisticaFichasAvaliacao: TForm_estatisticaFichasAvaliacao;

implementation

uses Module;

{$R *.dfm}

procedure TForm_estatisticaFichasAvaliacao.FormActivate(Sender: TObject);
begin
   JvDateEdit_Inicio.Text:= '01/'+Funcoes_TrataData.MesAtual+'/'+Funcoes_TrataData.AnoAtual;
   JvDateEdit_Termino.Date:= Date;

//   SpeedButton_Exccel.Visible:= False;

   Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
   ComboBox_Curso.Text:= '';
end;

//------------------------------------------------------------------------------
// Tratamento para fechar Form
//------------------------------------------------------------------------------

procedure TForm_estatisticaFichasAvaliacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para retornar
//------------------------------------------------------------------------------

procedure TForm_estatisticaFichasAvaliacao.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Sai do sistema e retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_estatisticaFichasAvaliacao.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento para montar a lista de avaliacoes
//------------------------------------------------------------------------------

procedure TForm_estatisticaFichasAvaliacao.JvExpressButton_PesquisarClick(Sender: TObject);
var
  VS_Comando: String;
  VF_FA, VF_Sol, VF_Resp: Real;
begin
   if Trim(Funcoes.DePara(JvDateEdit_Inicio.Text,'/', '')) = '' then
   begin
       ShowMessage('Entre com o Período Inicial ');
       JvDateEdit_Inicio.SetFocus;
   end
   else
   begin
      if trim(Funcoes.DePara(JvDateEdit_Termino.Text,'/', '')) = '' then
      begin
          ShowMessage('Entre com o Período Final ');
          JvDateEdit_Termino.SetFocus;
      end
      else
      begin
         IBQuery_FA_Modelo.Open;

         if ComboBox_Curso.Text <> '' then
         begin
            VS_Comando:= 'select IdCurso From Curso '+
                         ' Where CodCurso = '+#39+ComboBox_Curso.Text+#39;
            Funcoes.ExecutaQuery( DM.IBQuery_Executa, VS_Comando);

            VS_Comando:= 'select * From FA_Avaliacao '+
                         ' Where IdFicha = :IdFicha '+
                         ' and IdCurso = '+DM.IBQuery_Executa.FieldByName('IdCurso').AsString+
                         ' and dataAvaliacao >= '+#39+Funcoes.DePara(JvDateEdit_Inicio.Text, '/', '.')+#39+
                         ' and dataAvaliacao <= '+#39+Funcoes.DePara(JvDateEdit_Termino.Text, '/', '.')+#39;
         end
         else
         begin
            VS_Comando:= 'select * From FA_Avaliacao '+
                         ' Where IdFicha = :IdFicha '+
                         ' and dataAvaliacao >= '+#39+Funcoes.DePara(JvDateEdit_Inicio.Text, '/', '.')+#39+
                         ' and dataAvaliacao <= '+#39+Funcoes.DePara(JvDateEdit_Termino.Text, '/', '.')+#39;
         end;

         Funcoes.ExecutaQuery( Query_FA_Avaliacao, VS_Comando);

         IBQuery_FA_Respostas.Open;


         DBGrid_Lista.Cells[0,0]:= 'CÓD';
         DBGrid_Lista.Cells[1,0]:= 'FICHA DE AVALIAÇÃO';
         DBGrid_Lista.Cells[2,0]:= 'HABILITADAS';
         DBGrid_Lista.Cells[3,0]:= 'HABILITADOS';
         DBGrid_Lista.Cells[4,0]:= 'RESPONDERAM';
         DBGrid_Lista.Cells[5,0]:= 'RESP. (%)';

         VI_Ficha:= 0;
         IBQuery_FA_Modelo.First;
         While not IBQuery_FA_Modelo.Eof do
         begin
            Query_FA_Avaliacao.First;

            VI_Ficha:= VI_Ficha + 1;
            VF_FA:= 0;
            VF_Sol:= 0;
            VF_Resp:= 0;

            While not Query_FA_Avaliacao.Eof do
            begin
               VF_FA:= VF_FA+1;
               IBQuery_FA_Respostas.First;
               While not IBQuery_FA_Respostas.Eof do
               begin
                  VF_Sol:= VF_Sol+1;
                  if IBQuery_FA_Respostas.FieldByName('Respondeu').AsString = 'S' then
                      VF_Resp:= VF_Resp+1;

                  IBQuery_FA_Respostas.Next;
               end;
               Query_FA_Avaliacao.Next;
            end;
            DBGrid_Lista.Cells[0, VI_Ficha]:= FormatFloat('00', VI_Ficha);
            DBGrid_Lista.Cells[1, VI_Ficha]:= IBQuery_FA_Modelo.FieldByName('Cabecalho').AsString;
            DBGrid_Lista.Cells[2, VI_Ficha]:= Funcoes.LReplStr(FloatToStr(VF_FA), ' ', 10);
            DBGrid_Lista.Cells[3, VI_Ficha]:= Funcoes.LReplStr(FloatToStr(VF_Sol), ' ', 10);
            DBGrid_Lista.Cells[4, VI_Ficha]:= Funcoes.LReplStr(FloatToStr(VF_Resp), ' ', 10);
            if VF_Resp = 0 then
               DBGrid_Lista.Cells[5, VI_Ficha]:= '   0'
            else
               DBGrid_Lista.Cells[5, VI_Ficha]:= ' '+FormatFloat('00.00',(100*VF_Resp)/VF_Sol)+'%';


            IBQuery_FA_Modelo.Next;
         end;
         JvTransparentButton_Excel.Visible:= True;
         JvShapeExcel.Visible:= True;
      end;
   end;
end;

procedure TForm_estatisticaFichasAvaliacao.JvTransparentButton_ExcelClick(Sender: TObject);
var
   objExcel, Sheet: Variant;
   cTitulo : string;
   i : integer;
begin
   // Cria uma instancia para utilizar o Excel

   cTitulo := 'Cadastro de Instrutores';

   try
      objExcel := CreateOleObject('Excel.Application');
   except
      objExcel := CreateOleObject('scalc.Application');
   end;
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   // Preenchendo as Colunas

   Sheet.Range['A1'] := 'CÓDIGO';
   Sheet.Range['B1'] := 'FICHA DE AVALIAÇÃO';
   Sheet.Range['C1'] := 'QTD FICHAS HABILITADAS';
   Sheet.Range['D1'] := 'N. HABILITADOS';
   Sheet.Range['E1'] := 'RESPONDERAM';
   Sheet.Range['F1'] := 'RESP. (%)';


   i:= 0;

   // por aqui tu limparias a planilha

   While i <= (VI_Ficha) do
   begin
      i:= i + 1;
      Sheet.Cells[i+2,1] := DBGrid_Lista.Cells[0, I];
      Sheet.Cells[i+2,2] := DBGrid_Lista.Cells[1, I];
      Sheet.Cells[i+2,3] := DBGrid_Lista.Cells[2, I];
      Sheet.Cells[i+2,4] := DBGrid_Lista.Cells[3, I];
      Sheet.Cells[i+2,5] := DBGrid_Lista.Cells[3, I];
      Sheet.Cells[i+2,6] := DBGrid_Lista.Cells[3, I]+'%';
   end;
end;

end.
