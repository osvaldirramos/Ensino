//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Mostra_GrauFinal.PAS                           //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao mostrar a Nota final  //
//                             dos alunos permitindo um melhor acompanhamento //
//                             da Secao de Avaliacao                          //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 10/11/2008                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Mostra_GrauFinal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, TeeProcs, Chart, StdCtrls, Grids, DBGrids, Rotinas,Rotinas_SUE,
  DB, DbChart, JvToolEdit, JvEdit, DBCtrls, Mask, JvComponent, JvxCtrls,
  Buttons, ExtCtrls, JvShape, IBCustomDataSet, IBQuery, ComCtrls, ToolWin,
  JvCaptionPanel, JvEnterTab, JvTransBtn, JvGradient, IBTable;
type
  TForm_Mostra_GrauFinal = class(TForm)
    Query_RelacaoAlunos: TIBQuery;
    Query_RelacaoAlunosIDCURSO: TSmallintField;
    Query_RelacaoAlunosIDTURMA: TIntegerField;
    Query_RelacaoAlunosNUMORDEM: TSmallintField;
    Query_RelacaoAlunosCODIGOALUNO: TIntegerField;
    Query_RelacaoAlunosNOMEGUERRA: TIBStringField;
    Query_RelacaoAlunosNOTAFINAL: TIBBCDField;
    DSQ_RelacaoAlunos: TDataSource;
    Query_RelacaoAlunosMOTIVODESLIGAMENTO: TIBStringField;
    JvCaptionPanel_RelacaoAlunos: TJvCaptionPanel;
    DBNavigator2: TDBNavigator;
    DBGrid_Alunos: TDBGrid;
    IBQuery_ResultadoExame: TIBQuery;
    DSQ_ResultadoExame: TDataSource;
    Query_RelacaoAlunosIDENTIDADE: TIBStringField;
    JvEnterAsTab1: TJvEnterAsTab;
    Panel_Mostra_Media: TPanel;
    JvCaptionPanel_BuscaPorPessoa: TJvCaptionPanel;
    DBGrid_Prova: TDBGrid;
    JvShape1: TJvShape;
    IBQuery_ResultadoExameCODPROVA: TIBStringField;
    IBQuery_ResultadoExameNOTA: TIBBCDField;
    Query_RelacaoAlunosNOME: TIBStringField;
    Panel_Botoes_CabecalhoProva: TPanel;
    JvGradient_Tela01: TJvGradient;
    Chart_MediasAlunos: TChart;
    Series1: TBarSeries;
    Panel_Media: TPanel;
    Chart_ProvassAlunos: TChart;
    BarSeries_Provas: TBarSeries;
    JvShape5: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape_retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Memo1: TMemo;
    Panel_Frame_SelCurso: TPanel;
    IBQuery_ResultadoExameIDCURSO: TSmallintField;
    IBQuery_ResultadoExameIDTURMA: TIntegerField;
    IBQuery_ResultadoExameREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_ResultadoExameCODMATERIA: TIBStringField;
    IBTable_QGA: TIBTable;
    IBTable_QGAIDCURSO: TSmallintField;
    IBTable_QGAIDTURMA: TIntegerField;
    IBTable_QGAFASEAPLICACAO: TIBStringField;
    IBTable_QGAREFERENCIAAVALIACAO: TIBStringField;
    IBTable_QGACODMATERIA: TIBStringField;
    IBTable_QGACODPROVA: TIBStringField;
    IBTable_QGAMEDIAMINIMA: TIBBCDField;

    procedure ImprimeGraficoMedias;
    procedure ImprimeGraficoNotas;

    procedure FormActivate(Sender: TObject);
    procedure DBGrid_AlunosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_ProvaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure Query_RelacaoAlunosAfterScroll(DataSet: TDataSet);
    procedure Chart_MediasAlunosDblClick(Sender: TObject);
  private    { Private declarations }

  public    { Public declarations }
  end;

var
  Form_Mostra_GrauFinal: TForm_Mostra_GrauFinal;

implementation

uses Frame_Sel_Curso, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Mostra_GrauFinal.FormActivate(Sender: TObject);
begin
   JvGradient_Tela01.StartColor:= Cor_Tela;

   Funcoes.CabecalhoForm( Form_Mostra_GrauFinal, 'Mostra o Grau Final do Aluno');

   Query_RelacaoAlunos.Open;
   IBQuery_ResultadoExame.Open;
   IBTable_QGA.Open;

   Frame_SelCurso := TFrame_SelCurso.Create(nil);
   Frame_SelCurso.Parent := Form_Mostra_GrauFinal.Panel_Frame_SelCurso;
   Frame_SelCurso.TrataCurso('Cadastro', 'Em Andamento');
   ImprimeGraficoMedias;
   ImprimeGraficoNotas;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Mostra_GrauFinal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_RelacaoAlunos.Close;
   IBQuery_ResultadoExame.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Mostra_GrauFinal.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Mostra_GrauFinal.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao da Query
//------------------------------------------------------------------------------

procedure TForm_Mostra_GrauFinal.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_RelacaoAlunos);
   ImprimeGraficoMedias;
   ImprimeGraficoNotas;
end;

//------------------------------------------------------------------------------
//
// Geracao do Grafico de Nota dos Alunos
//
//------------------------------------------------------------------------------

procedure TForm_Mostra_GrauFinal.Query_RelacaoAlunosAfterScroll(DataSet: TDataSet);
begin
   ImprimeGraficoNotas;
end;

//------------------------------------------------------------------------------
// Tratamento do Grafico das medias dos Alunos
//------------------------------------------------------------------------------

procedure TForm_Mostra_GrauFinal.ImprimeGraficoNotas;
var
   VS_Valor: String;
   bmLocal : TBookmark;
begin
   IBQuery_ResultadoExame.Open;
   bmLocal:= IBQuery_ResultadoExame.GetBookMark;

   BarSeries_Provas.Clear;
   IBQuery_ResultadoExame.First;
   While not IBQuery_ResultadoExame.Eof do
   begin
       if IBQuery_ResultadoExame.FieldByName('Nota').AsString <> '' then
       begin
          VS_Valor:= Trim(Funcoes.DePara(IBQuery_ResultadoExame.FieldByName('Nota').AsString,'.',','));
          if IBQuery_ResultadoExame.FieldByName('Nota').AsFloat >= IBTable_QGA.FieldByName('MediaMinima').AsFloat then
              BarSeries_Provas.AddY(StrToCurrDef( FormatFloat('#0.00',StrToFloat(VS_Valor)), 0), IBQuery_ResultadoExame.FieldByName('CodProva').AsString, $00F1C6A3)
          else
              BarSeries_Provas.AddY(StrToCurrDef( FormatFloat('#0.00',StrToFloat(VS_Valor)), 0), IBQuery_ResultadoExame.FieldByName('CodProva').AsString, clRed);
      end;
      IBQuery_ResultadoExame.Next;
   end;

   IBQuery_ResultadoExame.GotoBookMark(bmLocal);
   IBQuery_ResultadoExame.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Tratamento do Grafico das medias dos Alunos
//------------------------------------------------------------------------------

procedure TForm_Mostra_GrauFinal.ImprimeGraficoMedias;
var
   VR_SomaMedia, VR_Cont: Real;
   VS_Valor: String;
   bmLocal : TBookmark;
begin
   bmLocal:= Query_RelacaoAlunos.GetBookMark;
   VR_SomaMedia:= 0;
   VR_Cont:= 0;

   Series1.Clear;
   Query_RelacaoAlunos.First;
   While not Query_RelacaoAlunos.Eof do
   begin
      if Query_RelacaoAlunos.FieldByNAme('MOTIVODESLIGAMENTO').AsString = 'a' then
      begin
         if Trim(Query_RelacaoAlunos.FieldByName('NotaFinal').AsString) <> '' then
         begin
            VR_SomaMedia:= VR_SomaMedia +Query_RelacaoAlunos.FieldByName('NotaFinal').AsFloat;
            VR_Cont:= VR_Cont+1;

            VS_Valor:= Trim(Funcoes.DePara(Query_RelacaoAlunos.FieldByName('NotaFinal').AsString,'.',','));
            if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'ICEA' then
               Series1.AddY(StrToCurrDef( FormatFloat('#0.00',StrToFloat(VS_Valor)), 0), FormatFloat('000', Query_RelacaoAlunos.FieldByName('CodigoAluno').AsFloat),clRed)
            else
               Series1.AddY(StrToCurrDef( FormatFloat('#0.0000',StrToFloat(VS_Valor)), 0), FormatFloat('000', Query_RelacaoAlunos.FieldByName('CodigoAluno').AsFloat),clRed);
         end;
      end;
      Query_RelacaoAlunos.Next;
   end;

   Panel_Media.Caption:= 'Média da Turma -> ';
   if VR_SomaMedia > 0 then
   begin
      VR_SomaMedia:= VR_SomaMedia / VR_Cont;
      if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'ICEA' then
         Panel_Media.Caption:= Panel_Media.Caption+FormatFloat('#0.00',Funcoes.TratarNota(VR_SomaMedia))
      else
         Panel_Media.Caption:= Panel_Media.Caption+FormatFloat('#0.0000',Funcoes.TratarNota(VR_SomaMedia))
   end;
   Query_RelacaoAlunos.GotoBookMark(bmLocal);
   Query_RelacaoAlunos.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Tratamento da Grid que mostra os alunos
//------------------------------------------------------------------------------

procedure TForm_Mostra_GrauFinal.DBGrid_AlunosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if ((Trim(Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString) <> 'a') and
       (Trim(Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString) <> ' ') and
       (Trim(Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString) <> '')) then
      DBGrid_Alunos.Canvas.Font.Color:= clRed
   else
      if  Query_RelacaoAlunos.FieldByName('NotaFinal').AsFloat < 7 then
         DBGrid_Alunos.Canvas.Font.Color:= clRed
      else
         DBGrid_Alunos.Canvas.Font.Color:= clBlack;

  if gdSelected in State then
    DBGrid_Alunos.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Alunos.Canvas.FillRect(Rect);
   DBGrid_Alunos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Tratamento da Grid que mostra as notas das provas dos alunos
//------------------------------------------------------------------------------

procedure TForm_Mostra_GrauFinal.DBGrid_ProvaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if trim(IBQuery_ResultadoExame.FieldByName('nota').AsString) <> '' then
     if StrToFloat(Funcoes.DePara(IBQuery_ResultadoExame.FieldByName('nota').AsString,'.',',')) < 6 then
        DBGrid_Prova.Canvas.Font.Color:= clRed
     else
        DBGrid_Prova.Canvas.Font.Color:= clBlack
   else
      DBGrid_Prova.Canvas.Font.Color:= clBlack;

  if gdSelected in State then
    DBGrid_Prova.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Prova.Canvas.FillRect(Rect);
   DBGrid_Prova.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_Mostra_GrauFinal.Chart_MediasAlunosDblClick(Sender: TObject);
begin
    Chart_MediasAlunos.CopyToClipboardBitmap;
end;

end.
