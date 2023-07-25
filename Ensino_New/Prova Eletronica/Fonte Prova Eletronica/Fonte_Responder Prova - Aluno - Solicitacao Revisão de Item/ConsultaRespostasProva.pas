unit ConsultaRespostasProva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, jpeg, ExtCtrls, StdCtrls, JvComponent,
  JvTransBtn, JvShape, JvRichEd, JvDBRichEd, IBCustomDataSet,IBQuery,
  Rotinas, JvGradient;

type
  TForm_ConsultaRespostasProva = class(TForm)
    Panel_EditorProva: TPanel;
    Panel_Prova: TPanel;
    Panel_Botoes_CabecalhoProva: TPanel;
    Panel3: TPanel;
    Shape7: TShape;
    Shape8: TShape;
    Label_Prova: TLabel;
    Label_DataProva: TLabel;
    Shape9: TShape;
    Label_Aluno: TLabel;
    Label_Curso_: TLabel;
    Label_Turma_: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Image_Brasao: TImage;
    Label_Curso: TLabel;
    Label_Turma: TLabel;
    Label_Referencia_Prova: TLabel;
    Label_Data_Prova: TLabel;
    Label_Instituto: TLabel;
    Label_Versao: TLabel;
    ClientDataSet_resultado: TClientDataSet;
    ClientDataSet_resultadoItem: TStringField;
    ClientDataSet_resultadoNumQuestao: TStringField;
    ClientDataSet_resultadoResp: TStringField;
    ClientDataSet_resultadoCorreta: TStringField;
    ClientDataSet_resultadoErro: TStringField;
    ClientDataSet_resultadoRevisao: TStringField;
    ClientDataSet_resultadoNumItem: TIntegerField;
    DSC_Resultado: TDataSource;
    DBGrid_Resultado: TDBGrid;
    Query_GabaritoProva: TIBQuery;
    Query_GabaritoProvaNUMEROQUESTAO: TIntegerField;
    Query_GabaritoProvaNUMITEM: TIntegerField;
    Query_GabaritoProvaQUESTAO: TIntegerField;
    Query_GabaritoProvaDESCENALT: TBlobField;
    Query_GabaritoProvaRESPOSTACORRETA: TIBStringField;
    Query_GabaritoProvaGABARITO: TIntegerField;
    DSQ_GabaritoProva: TDataSource;
    Panel_TratarBotao_FecharPrograma: TPanel;
    JvGradient_Itens: TJvGradient;
    JvShape_FecharPrograma: TJvShape;
    JvTransparentButton_FecharPrograma_: TJvTransparentButton;
    JvGradient1: TJvGradient;
    procedure Open_GabaritoProva(PS_OrderBy: String);
    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_FecharPrograma_Click(Sender: TObject);
    procedure DBGrid_ResultadoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private    { Private declarations }
     VS_Where, VS_Gabarito, VS_RespostaAluno: String;
  public
    { Public declarations }
  end;

var
  Form_ConsultaRespostasProva: TForm_ConsultaRespostasProva;

implementation

uses Module;

{$R *.dfm}

procedure TForm_ConsultaRespostasProva.FormActivate(Sender: TObject);
var
   VI_cont: Integer;
begin
   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Brasao_Ensino.jpg') = True then
      Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Brasao_Ensino.jpg');

    //---
   //--- Monta  Clausaula Where basica

   VS_Where:= ' where IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
              ' and IdTurma = '+DM.Query_Usuario.FieldByName('IdTurma').AsString+
              ' and FaseAplicacao = '+#39+DM.Query_Usuario.FieldByName('FaseAplicacao').AsString+#39+
              ' and ReferenciaAvaliacao = '+#39+DM.Query_Usuario.FieldByName('referenciaavaliacao').AsString+#39+
              ' and CodMateria = '+#39+DM.Query_Usuario.FieldByName('CodMateria').AsString+#39+
              ' and Identidade = '+#39+DM.Query_Usuario.FieldByName('Identidade').AsString+#39;

    //---
   //--- Seta a prova como prova aberta

   Funcoes.ExecusaoQuery(' Update TesteAplicacao set ProvaAberta = '+#39+'S'+#39+VS_Where);

    //---
   //--- Pega o numero do gabarito da prova do aluno

//   Table_Teste.Open;
   Funcoes.OpenQuery(' Select Gabarito, OpcaoVetor from RespostaAluno '+VS_Where);

   VS_Gabarito:= DM.IBQuery_Executa.FieldByName('Gabarito').AsString;
   VS_RespostaAluno:= DM.IBQuery_Executa.FieldByName('OpcaoVetor').AsString;

       //---
   // Pega o Nome do Curso e o Codigo da Turma

   Funcoes.OpenQuery('Select CodCurso, Turma '+
                     ' From Turma_Em_Andamento_View '+
                     ' Where IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
                     ' and   Idturma = '+DM.Query_Usuario.FieldByName('Idturma').AsString
                    );

   Label_Curso.Caption:= DM.IBQuery_Executa.FieldByName('CodCurso').AsString;
   Label_Turma.Caption:= DM.IBQuery_Executa.FieldByName('Turma').AsString;

   Label_Aluno.Caption:= 'Aluno: '+DM.Query_Usuario.FieldByName('NomeCompleto').AsString;
   Label_Referencia_Prova.Caption:= DM.Query_Usuario.FieldByName('CodProva').AsString;
   Label_Data_Prova.Caption:= DM.Query_Usuario.FieldByName('DataAplicacao').AsString;

   Open_GabaritoProva(' Order By GP.Questao');

   VI_cont:= 1;
   Query_GabaritoProva.First;
   While not Query_GabaritoProva.Eof do
   begin
      ClientDataSet_resultado.Append;
      ClientDataSet_resultado.FieldByName('ITEM').AsString:= Query_GabaritoProva.FieldByName('Questao').AsString;
      ClientDataSet_resultado.FieldByName('NumQuestao').AsString:= Query_GabaritoProva.FieldByName('NumeroQuestao').AsString;
      ClientDataSet_resultado.FieldByName('NumItem').AsString:= Query_GabaritoProva.FieldByName('NumItem').AsString;
      ClientDataSet_resultado.FieldByName('Resp').AsString:= Copy(VS_RespostaAluno, VI_cont,1);
      ClientDataSet_resultado.FieldByName('Correta').AsString:= Query_GabaritoProva.FieldByName('RespostaCorreta').AsString;
      ClientDataSet_resultado.FieldByName('Revisao').AsString:= '';
      if Copy(VS_RespostaAluno, VI_cont,1) = ' ' then
         ClientDataSet_resultado.FieldByName('ERRO').AsString:= 'B'
      else
         if Query_GabaritoProva.FieldByName('RespostaCorreta').AsString <> Copy(VS_RespostaAluno, VI_cont,1) then
              ClientDataSet_resultado.FieldByName('ERRO').AsString:= 'E';
      ClientDataSet_resultado.Post;

      VI_cont:= VI_cont+1;
      Query_GabaritoProva.Next;
   end;
   ClientDataSet_resultado.First;
end;

//------------------------------------------------------------------------------
// Abre a Query de tratamento do Gabarito da Prova
//------------------------------------------------------------------------------

procedure TForm_ConsultaRespostasProva.Open_GabaritoProva(PS_OrderBy: String);
begin
   Funcoes.ExecutaQuery(Query_GabaritoProva, 'Select GP.NumeroQuestao, GP.NumItem, GP.Questao, ID.DescEnAlt, Id.RespostaCorreta, GP.Gabarito '+
                                             ' From  GabaritoProva GP,  Item_Desc ID '+
                                             ' Where GP.IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
                                             ' and   GP.idturma = '+DM.Query_Usuario.FieldByName('Idturma').AsString+
                                             ' and   GP.faseAplicacao = '+#39+DM.Query_Usuario.FieldByName('FaseAplicacao').AsString+#39+
                                             ' and   GP.ReferenciaAvaliacao = '+#39+DM.Query_Usuario.FieldByName('referenciaavaliacao').AsString+#39+
                                             ' and   GP.CodMateria = '+#39+DM.Query_Usuario.FieldByName('CodMateria').AsString+#39+
                                             ' and   GP.Gabarito = '+VS_Gabarito+
                                             ' and   GP.NumItem = ID.NumItem '+ PS_OrderBy
                       );
end;


procedure TForm_ConsultaRespostasProva.JvTransparentButton_FecharPrograma_Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TForm_ConsultaRespostasProva.DBGrid_ResultadoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
      if Column.FieldName = 'Erro' then
      begin
         if ClientDataSet_resultado.FieldByName('Erro').AsString = 'E' then
            DBGrid_Resultado.Canvas.Brush.Color:= ClRed
         else
            if ClientDataSet_resultado.FieldByName('Erro').AsString = 'B' then
               DBGrid_Resultado.Canvas.Brush.Color:= clWhite
            else
               DBGrid_Resultado.Canvas.Brush.Color:= $00787878;
      end;
      DBGrid_Resultado.Canvas.FillRect(Rect);
      DBGrid_Resultado.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

end.
