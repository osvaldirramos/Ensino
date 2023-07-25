unit EstatisticaDeInstruoresPorCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, DB, IBCustomDataSet, IBQuery, ExtCtrls, Rotinas, Rotinas_Sue,
  JvComponent, JvxCtrls, JvShape, ComCtrls, ToolWin, DBGrids, IBTable,
  JvGradientCaption, JvTransBtn;

type
  TForm_EstInstruoresPorCurso = class(TForm)
    IBQuery_InstrutorCurso: TIBQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    StringGrid_Disciplina: TStringGrid;
    IBQuery_InstrutorMateria: TIBQuery;
    IBQuery_InstrutorMateriaQTD: TIntegerField;
    DSQ_InstrutorMateria: TDataSource;
    IBQuery_Materia: TIBQuery;
    IBQuery_MateriaIDCURSO: TSmallintField;
    IBQuery_MateriaCODMATERIA: TIBStringField;
    IBQuery_MateriaNOMEMATERIA: TIBStringField;
    DSQ_MateriaCurso: TDataSource;
    Panel2: TPanel;
    IBQuery_Instrutor: TIBQuery;
    DSQ_Instrutor: TDataSource;
    IBTable_DisciplinaCoordenador: TIBTable;
    IBTable_DisciplinaCoordenadorIDCURSO: TSmallintField;
    IBTable_DisciplinaCoordenadorIDTURMA: TIntegerField;
    IBTable_DisciplinaCoordenadorCODMATERIA: TIBStringField;
    IBTable_DisciplinaCoordenadorNOMEMATERIA: TIBStringField;
    IBTable_DisciplinaCoordenadorNUMEROAULASTEORICAS: TSmallintField;
    IBTable_DisciplinaCoordenadorNUMEROAULASPRATICAS: TSmallintField;
    IBTable_DisciplinaCoordenadorFASE: TIBStringField;
    IBTable_DisciplinaCoordenadorPERGUNTAALUNO: TIBStringField;
    IBTable_DisciplinaCoordenadorPERGUNTACHEFE: TIBStringField;
    IBTable_DisciplinaCoordenadorESPECIALIDADE: TIBStringField;
    IBTable_DisciplinaCoordenadorQTD_OBJETIVOS: TIntegerField;
    DSQ_IBQuery_FA_Coordenador: TDataSource;
    IBQuery_FA_Coordenador: TIBQuery;
    IBQuery_FA_CoordenadorIDCURSO: TSmallintField;
    IBQuery_FA_CoordenadorIDTURMA: TIntegerField;
    IBQuery_FA_CoordenadorIDFICHA: TSmallintField;
    IBQuery_FA_CoordenadorIDTOPICO: TSmallintField;
    IBQuery_FA_CoordenadorIDITEM: TSmallintField;
    IBQuery_FA_CoordenadorIDENTIDADE: TIBStringField;
    IBQuery_FA_CoordenadorDISCIPLINA: TIBStringField;
    IBQuery_FA_CoordenadorSENHA: TIBStringField;
    IBQuery_FA_CoordenadorRESPOSTA: TIBStringField;
    IBQuery_FA_Pratica: TIBQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    SmallintField4: TSmallintField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    DSQ_FA_Pratica: TDataSource;
    IBTable_DisciplinaPratica: TIBTable;
    SmallintField9: TSmallintField;
    IntegerField3: TIntegerField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    SmallintField10: TSmallintField;
    SmallintField11: TSmallintField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    IBStringField14: TIBStringField;
    IntegerField4: TIntegerField;
    IBTable_DisciplinaTeorica: TIBTable;
    SmallintField12: TSmallintField;
    IntegerField5: TIntegerField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    SmallintField13: TSmallintField;
    SmallintField14: TSmallintField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    IBStringField20: TIBStringField;
    IntegerField6: TIntegerField;
    DSQ_FA_Teorica: TDataSource;
    IBQuery_FA_Teorica: TIBQuery;
    SmallintField5: TSmallintField;
    IntegerField2: TIntegerField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    SmallintField8: TSmallintField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    Panel3: TPanel;
    IBQuery_InstrutorIDCURSO: TSmallintField;
    IBQuery_InstrutorNOME: TIBStringField;
    IBQuery_InstrutorNOMEGUERRA: TIBStringField;
    IBQuery_InstrutorIDENTIDADE: TIBStringField;
    PrintDialog1: TPrintDialog;
    Panel5: TPanel;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvGradientCaption1: TJvGradientCaption;
    JvTransparentButton_Ferchar: TJvTransparentButton;
    Panel6: TPanel;
    JvGradientCaption2: TJvGradientCaption;
    JvShape1: TJvShape;
    Label_TotalAlunosCurso: TLabel;
    Label2: TLabel;
    JvShape4: TJvShape;
    Label_NaoAvl: TLabel;
    Label1: TLabel;
    Label_ativos: TLabel;
    Label_EmAvaliacao: TLabel;
    Label_Afastado: TLabel;
    Memo1: TRichEdit;
    JvShape2: TJvShape;
    Label_Curso: TLabel;
    ComboBox_Curso: TComboBox;

    procedure AnalizaMedia;
    procedure Verifica_Coordenador;
    procedure Verifica_Pratica;
    procedure Verifica_Teorica;

    Function Porcentagem(VF_Media_Geral: Real): Real;

    procedure MontaCurso(PS_Curso: String; Sender: TObject);
    procedure MontarCabecalho;
    procedure MontaEstatistica;

    procedure FormActivate(Sender: TObject);
    procedure ComboBox_CursoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid_DisciplinaDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure JvTransparentButton_FercharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
  private    { Private declarations }
      VS_IdCurso, VS_CodCurso: String;
      VI_Linha: Integer;


   VS_Instrutor : array[1..1000] of String;

   VF_Soma_Coord, VF_Soma_Pratica, VF_Soma_Teorica, VF_Soma_Geral: Real;
   VF_Media_Coord, VF_Media_Pratica, VF_Media_Teorica, VF_Media_Geral: Real;
   VF_SomaDis: Real;


   VI_Qtd_Coord, VI_Qtd_Pratica, VI_Qtd_Teorica, VI_Calc_Media_Geral: Integer;
   VI_Pratica, VI_Teorica: Integer;
   VI_Qtd_Dis: Integer;

   //--- Variaveis para tratar da quantificacao das medias < 3

   VF_SomaMedia, VF_QtdMedia, VF_QtdMediaAbaixo, VF_QtdInstrutores, VF_QdtAtivos, VF_QdtEmAvaliacao, VF_QdtAfastado: Real;
   VF_QdtNA: Integer;

   VS_Disciplina, VS_IdItem: String;

   VB_PossuiAvaliacao: Boolean;

  public
    { Public declarations }
  end;

var
  Form_EstInstruoresPorCurso: TForm_EstInstruoresPorCurso;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_EstInstruoresPorCurso.FormActivate( Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      Funcoes.CabecalhoForm( Form_EstInstruoresPorCurso, 'Quantidade de Instrutores por Curso');
      Funcoes.SetCadCurso('CadCurso');
      VI_Linha:= 1;

      //--- Tratamento da Selecao dos Cursos

      IBQuery_Materia.Open;
      IBQuery_InstrutorMateria.Open;

      IBQuery_Instrutor.Open;
      IBQuery_FA_Coordenador.Open;
      IBQuery_FA_Pratica.Open;
      IBQuery_FA_Teorica.Open;

      IBTable_DisciplinaCoordenador.Open;
      IBTable_DisciplinaPratica.Open;
      IBTable_DisciplinaTeorica.Open;

      Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
      MontaCurso(Funcoes.GetCodCurso, Sender);

   end;
end;

procedure TForm_EstInstruoresPorCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Materia.Close;
   IBQuery_InstrutorMateria.Close;

   IBQuery_Instrutor.Close;
   IBQuery_FA_Coordenador.Close;
   IBQuery_FA_Pratica.Close;
   IBQuery_FA_Teorica.Close;

   IBTable_DisciplinaCoordenador.Close;
   IBTable_DisciplinaPratica.Close;
   IBTable_DisciplinaTeorica.Close;

   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao fechar
//------------------------------------------------------------------------------

procedure TForm_EstInstruoresPorCurso.JvTransparentButton_FercharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para retornar para o Windows
//------------------------------------------------------------------------------

procedure TForm_EstInstruoresPorCurso.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Combox de Selecao de Curso
//------------------------------------------------------------------------------

procedure TForm_EstInstruoresPorCurso.ComboBox_CursoChange( Sender: TObject);
begin
   MontaCurso(ComboBox_Curso.Text, Sender);
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

procedure TForm_EstInstruoresPorCurso.MontaCurso(PS_Curso: String; Sender: TObject);
var
   VS_Comando: string;
begin
//   PageControl_Funcoes.TabIndex:= 0;

   if VS_CodCurso <> PS_Curso then
   begin
      if trim(PS_Curso) <> '' then
      begin
         //--- Monta query de selecao de curso

         VS_Comando:= 'Select IdCurso, CodCurso, NomeCurso '+
                      'From Curso '+
                      ' where codcurso = '+#39+PS_Curso+#39;
         Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando);

         if Trim(DM.IBQuery_Executa.FieldByName('CodCurso').AsString) <> '' then
         begin
            //--- Inicia Montagem da arvore

            ComboBox_Curso.Text:= DM.IBQuery_Executa.FieldByName('CodCurso').AsString;

            VS_IdCurso:= DM.IBQuery_Executa.FieldByNAme('IdCurso').AsString;
            VS_CodCurso:= ComboBox_Curso.Text;

            MontaEstatistica;
            JvTransparentButton_RetornarClick(Sender);

          end
          else
          begin
             Showmessage('Curso não Cadastrado.');
          end;
       end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para montar a estatistica de Instrutor por Curso
//------------------------------------------------------------------------------

procedure TForm_EstInstruoresPorCurso.MontaEstatistica;
var
   i, VI_Ativo, VI_EmAvaliacao, VI_Afastado, VI_NaoAvl: Integer;
   VS_Comando: string;
begin
    //---
   //--- Limpa a relaçao

   For i:= 1 to VI_Linha do
   begin
      StringGrid_Disciplina.Cells[0,I]:= ' ';
      StringGrid_Disciplina.Cells[1,I]:= '';
      StringGrid_Disciplina.Cells[2,I]:= '';
   end;

   VI_Ativo:= 0;
   VI_EmAvaliacao:= 0;
   VI_Afastado:= 0;
   VI_NaoAvl:= 0;
   VI_Linha:= 1;

   VS_Comando:= 'Select distinct IdCurso,  CodMateria, NomeMateria '+
                ' from MateriaCurso '+
                ' Where IdCurso = '+VS_IdCurso+
                ' Order by CodMateria ';
   Funcoes.ExecutaQuery(IBQuery_Materia, VS_Comando);

   MontarCabecalho;
   IBQuery_Materia.First;
   While not IBQuery_Materia.Eof do
   begin
      StringGrid_Disciplina.Cells[0,VI_Linha]:= ' '+IBQuery_Materia.FieldbyName('CodMateria').AsString;
      StringGrid_Disciplina.Cells[1,VI_Linha]:= IBQuery_Materia.FieldbyName('NomeMateria').AsString;
      StringGrid_Disciplina.Cells[2,VI_Linha]:= '  '+IBQuery_InstrutorMateria.FieldByName('Qtd').AsString;
      VI_Linha:= VI_Linha + 1;
      IBQuery_Materia.Next;
   end;

   VS_Comando:= ' Select Identidade, Status From InstrutorCurso where IdCurso = '+VS_IdCurso;
   Funcoes.ExecutaQuery(IBQuery_InstrutorCurso, VS_comando);

   IBQuery_InstrutorCurso.First;
   While not IBQuery_InstrutorCurso.Eof do
   Begin
      if Trim(IBQuery_InstrutorCurso.FieldByName('Status').AsString) = 'Ativo' then
         VI_Ativo:= VI_Ativo+1
      else
         if Trim(IBQuery_InstrutorCurso.FieldByName('Status').AsString) = 'Em Avaliação' then
            VI_EmAvaliacao:= VI_EmAvaliacao+1
         else
            if Trim(IBQuery_InstrutorCurso.FieldByName('Status').AsString) = 'Afastado' then
               VI_Afastado:= VI_Afastado+1
            else
               VI_NaoAvl:= VI_NaoAvl+1;    
      IBQuery_InstrutorCurso.Next;
   End;

   Label_TotalAlunosCurso.Caption:=   ' Total de Instrutores (Curso)...: '+IntToStr(VI_Ativo+VI_EmAvaliacao+VI_Afastado);
   Label_ativos.Caption:=      ' Ativos............: '+IntToStr(VI_Ativo);
   Label_EmAvaliacao.Caption:= ' Em Avaliação.: '+IntToStr(VI_EmAvaliacao);
   Label_Afastado.Caption:=    ' Afastado........: '+IntToStr(VI_Afastado);
   Label_NaoAvl.Caption:=      ' Não Avaliado....: '+IntToStr(VI_NaoAvl);
end;

//------------------------------------------------------------------------------
// Monta o Cabecalho
//------------------------------------------------------------------------------

procedure TForm_EstInstruoresPorCurso.MontarCabecalho;
begin
   StringGrid_Disciplina.Cells[0,0]:= 'Disciplina';
   StringGrid_Disciplina.Cells[1,0]:= '   Descrição';
   StringGrid_Disciplina.Cells[2,0]:= '   Qtd Inst.';
end;

procedure TForm_EstInstruoresPorCurso.StringGrid_DisciplinaDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
const
   LM = 10; {margem esquerda de cada célula}
   TM = 5; {margem superior de cada célula}
begin
   if ARow > 0 then
   begin
      if Funcoes.TestaParaPar(ARow) then
      begin
         StringGrid_Disciplina.Canvas.Brush.Color := clInfoBk;
         StringGrid_Disciplina.Canvas.Font.Color := clBlack;
      end
      else
      begin
         StringGrid_Disciplina.Canvas.Brush.Color := clWhite;
         StringGrid_Disciplina.Canvas.Font.Color := clBlack;
      end;
      StringGrid_Disciplina.Canvas.TextRect(Rect, Rect.Left + LM, Rect.Top + TM, StringGrid_Disciplina.Cells[Acol,Arow]);
   end;
end;

procedure TForm_EstInstruoresPorCurso.JvTransparentButton_RetornarClick(Sender: TObject);
var
   VS_Comando: String;
   x: Integer;
begin
   Memo1.Cursor:= crAppStart;
   VS_Comando:= 'Select It.IdCurso, It.nome, It.NomeGuerra, It.Identidade '+
                ' from Corpo_Docente_VIEW It '+
                ' where IdCurso = '+VS_IdCurso;

   IBQuery_Instrutor.Close;
   IBQuery_Instrutor.Sql.Clear;
   IBQuery_Instrutor.SQL.add(VS_Comando);
   IBQuery_Instrutor.Open;

   VF_QtdInstrutores:= 0;
   VF_QdtAtivos:= 0;
   VF_QdtEmAvaliacao:= 0;
   VF_QdtAfastado:= 0;
   VF_QdtNA:= 0;

   Memo1.Lines.Clear;
   Memo1.Lines.Add(ComboBox_Curso.Text);
   Memo1.Lines.Add('');

   IBQuery_Instrutor.First;

   While not IBQuery_Instrutor.Eof do
   begin
      VF_QtdInstrutores:= VF_QtdInstrutores+1;

      VF_QtdMediaAbaixo:= 0;                         // Variavel para quantificar as medias < 3
      VB_PossuiAvaliacao:= False;

      //--- Verificando a Ficha do Coordenador (2)

      IBQuery_FA_Coordenador.First;
      VI_Calc_Media_Geral:= 0;
      VF_Soma_Coord:= 0;
      VI_Qtd_Coord:= 0;
      VF_SomaMedia:= 0;
      VF_QtdMedia:= 0;

      if IBQuery_FA_Coordenador.FieldByName('Disciplina').AsString <> '' then
      begin
         Memo1.Lines.Add('---------------------------------------------------------------------------------------------------------');
         Memo1.Lines.Add(IBQuery_Instrutor.FieldByName('Nome').AsString);
         Memo1.Lines.Add('');

         Memo1.Lines.Add('Avaliação Pelo Coordenador');

         VS_Disciplina:= IBQuery_FA_Coordenador.FieldByName('Disciplina').AsString+' - '+Trim(IBTable_DisciplinaCoordenador.FieldByName('NomeMateria').AsString);
         VS_IdItem:= IBQuery_FA_Coordenador.FieldByName('IdItem').AsString;

         While not IBQuery_FA_Coordenador.Eof do
         begin
            Verifica_Coordenador;
            IBQuery_FA_Coordenador.Next;
         end;
         VS_Disciplina:= VS_Disciplina+' ';
         Verifica_Coordenador;
      end;

      //--- Verificando a Ficha Avaliacao Pratica (3)

      IBQuery_FA_Pratica.First;
      VI_Qtd_Pratica:= 0;
      VI_Pratica:= 0;
      VF_SomaMedia:= 0;
      VF_QtdMedia:= 0;

      VF_SomaDis:= 0;
      VI_Qtd_Dis:= 0;
      VF_Soma_Pratica:= 0;

      if IBQuery_FA_Pratica.FieldByName('Disciplina').AsString <> '' then
      begin
         if VI_Qtd_Coord = 0 then
         begin
            Memo1.Lines.Add('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
            Memo1.Lines.Add(IBQuery_Instrutor.FieldByName('Nome').AsString);
         end;

         Memo1.Lines.Add('');
         Memo1.Lines.Add('Avaliação Pratica');
         VS_Disciplina:= IBQuery_FA_Pratica.FieldByName('Disciplina').AsString+' - '+Trim(IBTable_DisciplinaPratica.FieldByName('NomeMateria').AsString);
         VS_IdItem:= IBQuery_FA_Pratica.FieldByName('IdItem').AsString;
         While not IBQuery_FA_Pratica.Eof do
         begin
            Verifica_Pratica;
            IBQuery_FA_Pratica.Next;
         end;
         VS_Disciplina:= VS_Disciplina+' ';
         Verifica_Pratica;
      end;

      //--- Verificando a Ficha Avaliacao Teorica (4)

      IBQuery_FA_Teorica.First;
      VF_SomaMedia:= 0;
      VF_QtdMedia:= 0;

      VI_Teorica:= 0;
      VF_Soma_Teorica:= 0;
      VI_Qtd_Teorica:= 0;
      VF_SomaDis:= 0;
      VI_Qtd_Dis:= 0;

      if IBQuery_FA_Teorica.FieldByName('Disciplina').AsString <> '' then
      begin
         if ((VI_Qtd_Coord = 0) and (VI_Qtd_Pratica = 0)) then
         begin
            Memo1.Lines.Add('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
            Memo1.Lines.Add(IBQuery_Instrutor.FieldByName('Nome').AsString);
         end;

         Memo1.Lines.Add('');
         Memo1.Lines.Add('Avaliação Teórica');

         VS_Disciplina:= IBQuery_FA_Teorica.FieldByName('Disciplina').AsString+' - '+Trim(IBTable_DisciplinaTeorica.FieldByName('NomeMateria').AsString);
         VS_IdItem:= IBQuery_FA_Teorica.FieldByName('IdItem').AsString;

         While not IBQuery_FA_Teorica.Eof do
         begin
            Verifica_Teorica;
            IBQuery_FA_Teorica.Next;
         end;
         VS_Disciplina:= VS_Disciplina+' ';
         Verifica_Teorica;
      end;

      if VB_PossuiAvaliacao = False then
      begin
          VF_QdtNA:= VF_QdtNA+1;
          VS_Instrutor[VF_QdtNA]:= 'N/A '+IBQuery_Instrutor.FieldByName('Nome').AsString;
      end
      else
      begin
         VF_Media_Coord:= 0;
         VF_Media_Pratica:= 0;
         VF_Media_Teorica:= 0;
         VI_Calc_Media_Geral:= 0;

         if VI_Qtd_Coord > 0 then
         begin
            VF_Media_Coord:= VF_Soma_Coord/VI_Qtd_Coord;
            VI_Calc_Media_Geral:= VI_Calc_Media_Geral+1;
         end;

         if VI_Qtd_Pratica > 0 then
         begin
            VF_Media_Pratica:= VF_Soma_Pratica/VI_Qtd_Pratica;
            VI_Calc_Media_Geral:= VI_Calc_Media_Geral+1;
         end;

         if VI_Qtd_Teorica > 0 then
         begin
            VF_Media_Teorica:= VF_Soma_Teorica/VI_Qtd_Teorica;
            VI_Calc_Media_Geral:= VI_Calc_Media_Geral+1;
         end;

         if VI_Calc_Media_Geral > 0 then
         begin
            VF_Soma_Geral:= VF_Media_Coord+VF_Media_Pratica+VF_Media_Teorica;
            if VF_Soma_Geral > 0 then
            begin
               VF_Media_Geral:= VF_Soma_Geral/VI_Calc_Media_Geral;
            end;
         end;

         if Porcentagem(VF_Media_Geral) >= 80 then
         begin
            if  VF_QtdMediaAbaixo <= 3 then
            begin
               VF_QdtAtivos:= VF_QdtAtivos+1;
               Memo1.Lines.Add('*** '+
                               ' Coord. '+FormatFloat('#0.00', VF_Media_Coord )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Coord))+'%) - '+
                               ' Pratica '+FormatFloat('#0.00', VF_Media_Pratica )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Pratica))+'%) - '+
                               ' Teorica '+FormatFloat('#0.00', VF_Media_Teorica )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Teorica))+'%) - '+
                               ' Geral '+FormatFloat('#0.00', VF_Media_Geral )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Geral))+'%) - '+
                               ' Qtd Media Baixa '+FormatFloat('#0', VF_QtdMediaAbaixo ))
            end
            else
            begin
               VF_QdtEmAvaliacao:= VF_QdtEmAvaliacao+1;
               Memo1.Lines.Add('**  '+
                               ' Coord. '+FormatFloat('#0.00', VF_Media_Coord )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Coord))+'%) - '+
                               ' Pratica '+FormatFloat('#0.00', VF_Media_Pratica )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Pratica))+'%) - '+
                               ' Teorica '+FormatFloat('#0.00', VF_Media_Teorica )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Teorica))+'%) - '+
                               ' Geral '+FormatFloat('#0.00', VF_Media_Geral )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Geral))+'%) - '+
                               ' Qtd Media Baixa '+FormatFloat('#0', VF_QtdMediaAbaixo ))
            end;
         end
         else
         begin
            VF_QdtAfastado:= VF_QdtAfastado+1;
            Memo1.Lines.Add('*   '+
                            ' Coord. '+FormatFloat('#0.00', VF_Media_Coord )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Coord))+'%) - '+
                            ' Pratica '+FormatFloat('#0.00', VF_Media_Pratica )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Pratica))+'%) - '+
                            ' Teorica '+FormatFloat('#0.00', VF_Media_Teorica )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Teorica))+'%) - '+
                            ' Geral '+FormatFloat('#0.00', VF_Media_Geral )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Geral))+'%) - '+
                            ' Qtd Media Baixa '+FormatFloat('#0', VF_QtdMediaAbaixo ))
         end;
      end;
      IBQuery_Instrutor.Next;
   end;

   //--- Tratamento para os não Avaliados

   Memo1.Lines.Add('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
   Memo1.Lines.Add(' ');
   For x:= 1 to VF_QdtNA do
      Memo1.Lines.Add(VS_Instrutor[x]);


   Memo1.Lines.Add('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
   Memo1.Lines.Add(' ');
   Memo1.Lines.Add('Resumo da Avaliação: ');
   Memo1.Lines.Add(' ');
   Memo1.Lines.Add('Qtd Instrutores... '+FormatFloat('###0', VF_QtdInstrutores));
   Memo1.Lines.Add('Qtd Ativos........ '+FormatFloat('###0', VF_QdtAtivos ));
   Memo1.Lines.Add('Qtd Em Avaliacao.. '+FormatFloat('###0', VF_QdtEmAvaliacao));
   Memo1.Lines.Add('Qtd Afastados..... '+FormatFloat('###0', VF_QdtAfastado));
   Memo1.Lines.Add('Qtd Não Avaliados. '+FormatFloat('###0', VF_QdtNA));

   Memo1.Cursor:= crArrow;

end;

//------------------------------------------------------------------------------
// Verificacao do Coordenador
//------------------------------------------------------------------------------

procedure TForm_EstInstruoresPorCurso.Verifica_Coordenador;
var
   VS_VerDisciplina: String;
begin
   if IBQuery_FA_Coordenador.FieldByName('Disciplina').AsString <> '' then
   begin
      VS_VerDisciplina:= IBQuery_FA_Coordenador.FieldByName('Disciplina').AsString+' - '+Trim(IBTable_DisciplinaCoordenador.FieldByName('NomeMateria').AsString);
      if VS_Disciplina <> VS_VerDisciplina then
      begin
         VB_PossuiAvaliacao:= True;
         AnalizaMedia;

         VS_Disciplina:= IBQuery_FA_Coordenador.FieldByName('Disciplina').AsString+' - '+Trim(IBTable_DisciplinaCoordenador.FieldByName('NomeMateria').AsString);
         VS_IdItem:= IBQuery_FA_Coordenador.FieldByName('IdItem').AsString;
      end
      else
      begin
         if VS_IdItem <> IBQuery_FA_Coordenador.FieldByName('IdItem').AsString then
         begin
            VB_PossuiAvaliacao:= True;

            if VF_QtdMedia > 0 then
               if (VF_SomaMedia/VF_QtdMedia) < 3 then
                  VF_QtdMediaAbaixo:= VF_QtdMediaAbaixo+1;

            VS_IdItem:= IBQuery_FA_Coordenador.FieldByName('IdItem').AsString;
            VF_SomaMedia:= 0;
            VF_QtdMedia:= 0;
         end;
      end;

      if IBQuery_FA_Coordenador.FieldByName('Resposta').AsString <> '' then
      begin
         VI_Calc_Media_Geral:= VI_Calc_Media_Geral +1;
         VI_Qtd_Coord:= VI_Qtd_Coord+1;
         VF_Soma_Coord:= VF_Soma_Coord+IBQuery_FA_Coordenador.FieldByName('Resposta').AsFloat;

         VF_SomaDis:= VF_SomaDis+IBQuery_FA_Coordenador.FieldByName('Resposta').AsFloat;
         VI_Qtd_Dis:= VI_Qtd_Dis+1;

         VF_SomaMedia:= VF_SomaMedia+IBQuery_FA_Coordenador.FieldByName('Resposta').AsFloat;
         VF_QtdMedia:= VF_QtdMedia + 1;
      end;
   end;
end;


//------------------------------------------------------------------------------
// Verificacao da Avaliacao Pratica
//------------------------------------------------------------------------------

procedure TForm_EstInstruoresPorCurso.Verifica_Pratica;
var
   VS_VerDisciplina: String;
begin
   if IBQuery_FA_Pratica.FieldByName('Disciplina').AsString <> '' then
   begin
      VS_VerDisciplina:= IBQuery_FA_Pratica.FieldByName('Disciplina').AsString+' - '+Trim(IBTable_DisciplinaPratica.FieldByName('NomeMateria').AsString);
      if VS_Disciplina <> VS_VerDisciplina then
      begin
         VB_PossuiAvaliacao:= True;
         AnalizaMedia;

         VS_Disciplina:= IBQuery_FA_Pratica.FieldByName('Disciplina').AsString+' - '+Trim(IBTable_DisciplinaPratica.FieldByName('NomeMateria').AsString);
         VS_IdItem:= IBQuery_FA_Pratica.FieldByName('IdItem').AsString;
      end
      else
      begin
         if VS_IdItem <> IBQuery_FA_Pratica.FieldByName('IdItem').AsString then
         begin
            VB_PossuiAvaliacao:= True;

            if VF_QtdMedia > 0 then
               if (VF_SomaMedia/VF_QtdMedia) < 3 then
                  VF_QtdMediaAbaixo:= VF_QtdMediaAbaixo+1;

            VS_IdItem:= IBQuery_FA_Pratica.FieldByName('IdItem').AsString;
            VF_SomaMedia:= 0;
            VF_QtdMedia:= 0;
         end;
      end;

      if IBQuery_FA_Pratica.FieldByName('Resposta').AsString <> '' then
      begin
         VI_Calc_Media_Geral:= VI_Calc_Media_Geral +1;
         VI_Qtd_Pratica:= VI_Qtd_Pratica+1;
         VF_Soma_Pratica:= VF_Soma_Pratica+IBQuery_FA_Pratica.FieldByName('Resposta').AsFloat;

         VF_SomaDis:= VF_SomaDis+IBQuery_FA_Pratica.FieldByName('Resposta').AsFloat;
         VI_Qtd_Dis:= VI_Qtd_Dis+1;

         VF_SomaMedia:= VF_SomaMedia+IBQuery_FA_Pratica.FieldByName('Resposta').AsFloat;
         VF_QtdMedia:= VF_QtdMedia + 1;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Verificacao da Avaliacao Teorica
//------------------------------------------------------------------------------

procedure TForm_EstInstruoresPorCurso.Verifica_Teorica;
var
   VS_VerDisciplina: String;
begin
   if IBQuery_FA_Teorica.FieldByName('Disciplina').AsString <> '' then
   begin
      VS_VerDisciplina:= IBQuery_FA_Teorica.FieldByName('Disciplina').AsString+' - '+Trim(IBTable_DisciplinaTeorica.FieldByName('NomeMateria').AsString);
      if VS_Disciplina <> VS_VerDisciplina then
      begin
         VB_PossuiAvaliacao:= True;
         AnalizaMedia;

         VS_Disciplina:= IBQuery_FA_Teorica.FieldByName('Disciplina').AsString+' - '+Trim(IBTable_DisciplinaTeorica.FieldByName('NomeMateria').AsString);
         VS_IdItem:= IBQuery_FA_Teorica.FieldByName('IdItem').AsString;
      end
      else
      begin
         if VS_IdItem <> IBQuery_FA_Teorica.FieldByName('IdItem').AsString then
         begin
            VB_PossuiAvaliacao:= True;

            if VF_QtdMedia > 0 then
               if (VF_SomaMedia/VF_QtdMedia) < 3 then
                  VF_QtdMediaAbaixo:= VF_QtdMediaAbaixo+1;

            VS_IdItem:= IBQuery_FA_Teorica.FieldByName('IdItem').AsString;
            VF_SomaMedia:= 0;
            VF_QtdMedia:= 0;
         end;
      end;

      if IBQuery_FA_Teorica.FieldByName('Resposta').AsString <> '' then
      begin
         VI_Calc_Media_Geral:= VI_Calc_Media_Geral +1;
         VI_Qtd_Teorica:= VI_Qtd_Teorica+1;
         VF_Soma_Teorica:= VF_Soma_Teorica+IBQuery_FA_Teorica.FieldByName('Resposta').AsFloat;

         VF_SomaDis:= VF_SomaDis+IBQuery_FA_Teorica.FieldByName('Resposta').AsFloat;
         VI_Qtd_Dis:= VI_Qtd_Dis+1;

         VF_SomaMedia:= VF_SomaMedia+IBQuery_FA_Teorica.FieldByName('Resposta').AsFloat;
         VF_QtdMedia:= VF_QtdMedia + 1;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Encontrando a Pontuacao de acordo com a porcentagem
//------------------------------------------------------------------------------

Function TForm_EstInstruoresPorCurso.Porcentagem(VF_Media_Geral: Real): Real;
begin
   VF_Media_Geral:= Trunc(VF_Media_Geral * 100) / 100;
   Result:= ((VF_Media_Geral/5)* 100);
end;

//------------------------------------------------------------------------------
// Analiza a Media por Item
//------------------------------------------------------------------------------

Procedure TForm_EstInstruoresPorCurso.AnalizaMedia;
var
   VF_CalDis: Real;
begin
   if VF_QtdMedia > 0 then
   begin
      if (VF_SomaMedia/VF_QtdMedia) < 3 then
         VF_QtdMediaAbaixo:= VF_QtdMediaAbaixo+1;

      VF_CalDis:= VF_SomaDis/VI_Qtd_Dis;
      Memo1.Lines.Add('=> '+FormatFloat('#0.00', VF_CalDis )+' ('+FormatFloat('#0.00', Porcentagem(VF_CalDis))+'%) - '+VS_Disciplina );
   end;
   VF_SomaMedia:= 0;
   VF_QtdMedia:= 0;

   VF_SomaDis:= 0;
   VI_Qtd_Dis:= 0;
end;



end.
