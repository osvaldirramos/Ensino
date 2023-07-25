unit MontaGabarito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, IBCustomDataSet, IBTable, IBQuery, Rotinas,
  StdCtrls, JvRichEd, JvDBRichEd, ToolWin, ExtCtrls, DBCtrls, Grids,
  DBGrids, JvGradient, JvComponent, JvTransBtn, JvShape;

type
  TForm_MontaGabarito = class(TForm)
    JvGradient3: TJvGradient;
    ComboBox_Gabarito: TComboBox;
    Label1: TLabel;
    Label_Gabarito: TLabel;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Imprime: TJvTransparentButton;


    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_ImprimeClick(Sender: TObject);
  private    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form_MontaGabarito: TForm_MontaGabarito;

implementation

uses Se_Prova, Rel_GPA, Module, Rel_GPA_CINDACTAII;


{$R *.dfm}

//------------------------------------------------------------------------------
// Montagem da Prova
//------------------------------------------------------------------------------

procedure TForm_MontaGabarito.FormActivate(Sender: TObject);
var
   i: integer;
begin
   if Funcoes.GetRelDesempenho = 'Iniciado' then
   begin
      Funcoes.CabecalhoForm(Form_MontaGabarito, 'Montagem do Gabarito da Prova');

       //---
      //--- Montagem do Combo de Tratamento do Gabarito

      ComboBox_Gabarito.Items.Clear;

      ComboBox_Gabarito.Visible:= True;
      ComboBox_Gabarito.Text:= '1';
      For i:= 1 to Form_Cad_Prova.Table_Teste.FieldByName('N_Gabaritos').AsInteger do
          ComboBox_Gabarito.Items.Add(IntToStr(i));
   end;
   ComboBox_Gabarito.Text:= '1';
end;


procedure TForm_MontaGabarito.JvTransparentButton_ImprimeClick( Sender: TObject);
var
   VS_Comando: String;
begin
   if trim(ComboBox_Gabarito.Text) = '' then
   begin
      ShowMessage('ERRO...'+#13+#13+'Não foi selecionado o Gabarito da Prova...');
      ComboBox_Gabarito.SetFocus;
   end
   else
   begin
      // Verifica se o gabarito existe

      VS_Comando:= 'Select g.Questao, g.NumItem, g.NumeroQuestao, g.Gabarito '+
                   ' From  gabaritoprova g '+
                   ' where g.IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                   ' and   g.IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                   ' and   g.FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                   ' and   g.ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                   ' and   g.CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                   ' and   g.Gabarito = '+Form_MontaGabarito.ComboBox_Gabarito.Text;

      Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando);

      if DM.IBQuery_Executa.FieldByName('Gabarito').AsString = '' then
      begin
         ShowMessage('ERRO...'+#13+#13+'Não foi montado o gabarito da Prova, primeiro é necessário Montar a Prova...');
      end
      else
      begin
         Funcoes.SetRelDesempenho('Iniciado');
         Funcoes.SetGabaritoProva(ComboBox_Gabarito.Text);

         if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CINDACTA II' then
         begin
            Application.CreateForm(TForm_Rel_GPA_CINDACTAII, Form_Rel_GPA_CINDACTAII);
            Form_Rel_GPA_CINDACTAII.QuickRep1.Prepare;                                   
//            NPaginas:= Form_Rel_GPA_CINDACTAII.QuickRep1.QRPrinter.PageCount;
            Form_Rel_GPA_CINDACTAII.QuickRep1.Preview
         end
         else
         begin
            Application.CreateForm(TForm_Rel_GPA, Form_Rel_GPA);
            Form_Rel_GPA.QuickRep1.Prepare;
            Form_Cad_Prova.NPaginas:= Form_Rel_GPA.QuickRep1.QRPrinter.PageCount;
            Form_Rel_GPA.QuickRep1.Preview
         end;
      end;
   end;
end;

procedure TForm_MontaGabarito.JvTransparentButton_FecharClick( Sender: TObject);
var
   Action: TCloseAction;
begin
   Action:= caFree;
   Close;
end;


end.
