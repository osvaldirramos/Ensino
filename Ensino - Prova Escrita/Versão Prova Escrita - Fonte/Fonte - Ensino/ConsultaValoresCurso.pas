unit ConsultaValoresCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Mask, Menus, DB, IBCustomDataSet, IBQuery,
  ComCtrls, ToolWin, ExtCtrls, Rotinas, Rotinas_TrataData, JvComponent,
  JvTransBtn, JvShape, JvGradient;

type
  TForm_AlunosPorInstituicao = class(TForm)
    IBQuery_Turma: TIBQuery;
    PopupMenu_Pesquisa: TPopupMenu;
    Ano1: TMenuItem;
    Curso1: TMenuItem;
    PorEspecialidade1: TMenuItem;
    PorLocalidade1: TMenuItem;
    StringGrid_Executados: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    JvGradient3: TJvGradient;
    JvShape2: TJvShape;
    JvTransparentButton_Assinatura: TJvTransparentButton;
    Memo2: TMemo;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Label2: TLabel;
    ComboBox_Mes: TComboBox;
    Label3: TLabel;
    MaskEdit_Localidade: TMaskEdit;
    JvShape3: TJvShape;
    JvTransparentButton1: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton2: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;


    procedure LimpaMatrizExecutados(VI_Linhas: Integer);
    procedure MontarCabecalho;

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_PesExecutadosClick(Sender: TObject);
    procedure ToolButton_RecalcularClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_AssinaturaClick(Sender: TObject);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
  private    { Private declarations }
     VI_Linha: Integer;
  public    { Public declarations }
     VB_SelecaoResponsavelAssinatura: Boolean;
  end;

var
  Form_AlunosPorInstituicao: TForm_AlunosPorInstituicao;

implementation

uses Module, Rel_AlunosPorUnidades, Sel_ResponsavelAssinaturaRelatorio;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento quando ativa a Form
//------------------------------------------------------------------------------

procedure TForm_AlunosPorInstituicao.FormActivate(Sender: TObject);
var
  d,m,y : word;
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      VB_SelecaoResponsavelAssinatura:= False;
      DecodeDate(Date,y,m,d);

//   VS_Data:= FormatFloat('00', d)+'.'+FormatFloat('00', m)+'.'+FormatFloat('0000', y);

      Funcoes.CabecalhoForm(Form_AlunosPorInstituicao, 'Consulta de Cursos Executados');
      Funcoes.SetCadCurso('CadCurso');

      ComboBox_Mes.Text:= Funcoes_TrataData.Mes_Extenso(IntToStr(m), 1);

      //--- Tratamento da Grid de Cursos Executados

      MontarCabecalho;

      ToolButton_PesExecutadosClick(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando pressiona o Botao fechar
//------------------------------------------------------------------------------

procedure TForm_AlunosPorInstituicao.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_AlunosPorInstituicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Turma.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento quando pressiona o Botao Windows
//------------------------------------------------------------------------------

procedure TForm_AlunosPorInstituicao.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento quando pressiona o Botao de Pesquisa
//------------------------------------------------------------------------------

procedure TForm_AlunosPorInstituicao.ToolButton_PesExecutadosClick(Sender: TObject);
var
   VD_DiaIni: TDateTime;
   VS_Retorno, VS_Data_Fim, VS_Data_Ini, VS_Inicio, VS_termino, VS_Mes, VS_Comando: String;
   VI_Instrucao, VI_Material_Didatico, VI_Auxilios, VI_Dias: Integer;
begin
   if (ComboBox_Mes.Text = 'Janeiro') then
      VS_Mes:= '01'
   else
   if (ComboBox_Mes.Text = 'Fevereiro') then
      VS_Mes:= '02'
   else
   if (ComboBox_Mes.Text = 'Março') Then
      VS_Mes:= '03'
   else
   if ComboBox_Mes.Text = 'Maio' then
      VS_Mes:= '05'
   else
   if (ComboBox_Mes.Text = 'Abril') then
      VS_Mes:= '04'
   else
   if (ComboBox_Mes.Text = 'Junho') Then
      VS_Mes:= '06'
   else
   if (ComboBox_Mes.Text = 'Julho') then
      VS_Mes:= '07'
   else
   if (ComboBox_Mes.Text = 'Agosto') then
      VS_Mes:= '08'
   else
   if (ComboBox_Mes.Text = 'Setembro') then
      VS_Mes:= '09'
   else
   if (ComboBox_Mes.Text = 'Outubro') then
      VS_Mes:= '10'
   else
   if (ComboBox_Mes.Text = 'Novembro') then
      VS_Mes:= '11';
   if (ComboBox_Mes.Text = 'Dezembro') then
      VS_Mes:= '12';

   VS_Inicio:= '01.'+VS_Mes+'.'+Funcoes_TrataData.AnoAtual;
   VS_Termino:= IntToStr(Funcoes_TrataData.DiasNoMes(StrToInt(Funcoes_TrataData.AnoAtual), StrToInt(VS_Mes)))+'.'+VS_Mes+'.'+Funcoes_TrataData.AnoAtual;

    //---
   //--- Trata do Tamanho da Matriz

   VS_Comando:= 'Select count(1) Qtd'+
                ' from AlunoTurma a, Turma t '+
                ' Where a.IdCurso = t.IdCurso '+
                ' and   a.IdTurma = t.IdTurma '+
                ' and   a.IdUnidade like '+#39+'%'+Trim(MaskEdit_Localidade.Text)+'%'+#39+
                ' and   t.datainicio <= '+#39+VS_Termino+#39+
                ' and   t.DataTermino >= '+#39+VS_Inicio+#39;
   Funcoes.OpenQuery(VS_Comando);
   StringGrid_Executados.RowCount:= DM.IBQuery_Executa.FieldbyName('Qtd').AsInteger+2;
   LimpaMatrizExecutados(DM.IBQuery_Executa.FieldbyName('Qtd').AsInteger+2);

    //---
   //--- Select para pegar os Cursos

   VS_Comando:= 'select Distinct a.IdCurso, a.IdTurma, t.CodCurso, t.Turma, t.Ano, t.DataInicio, t.DataTermino '+
                ' from AlunoTurma a, Turmas_View t '+
                ' Where a.IdCurso = t.IdCurso '+
                ' and   a.IdTurma = t.IdTurma '+
                ' and   a.IdUnidade like '+#39+'%'+Trim(MaskEdit_Localidade.Text)+'%'+#39+
                ' and   t.datainicio <= '+#39+VS_Termino+#39+
                ' and   t.DataTermino >= '+#39+VS_Inicio+#39;

   VS_Comando:= VS_Comando+' order by t.CodCurso, t.Turma';
   Funcoes.ExecutaQuery(IBQuery_Turma, VS_Comando);
   VI_Linha:= 1;
   VI_Instrucao:= 0;
   VI_Material_Didatico:= 0;
   VI_Auxilios:= 0;

   IBQuery_Turma.First;
   While not IBQuery_Turma.Eof do
   begin
       //---
      //--- Calculando Dias Uteis

      if  IBQuery_Turma.FieldbyName('DataInicio').AsDateTime > StrToDate(Funcoes.DePara(VS_Inicio,'.','/')) then
         VS_Data_Ini:= Funcoes.DePara(IBQuery_Turma.FieldbyName('DataInicio').AsString,'.','/')
      else
         VS_Data_Ini:= Funcoes.DePara(VS_Inicio,'.','/');

      if IBQuery_Turma.FieldbyName('DataTermino').AsDateTime < StrToDate(Funcoes.DePara(VS_Termino,'.','/')) then
         VS_Data_Fim:= Funcoes.DePara(IBQuery_Turma.FieldbyName('DataTermino').AsString,'.','/')
      else
         VS_Data_Fim:= Funcoes.DePara(VS_Termino,'.','/');

       //---
      //--- Encontra o numero de dias Uteis

      VD_DiaIni:= StrToDate(VS_Data_Ini);
      VI_Dias:= 0;
      While VD_DiaIni <= StrToDate(VS_Data_Fim) do
      begin
         VS_Retorno:= Funcoes_TrataData.DiadaSemana(DateToStr(VD_DiaIni));
         if ((VS_Retorno = 'Segunda-feira') or (VS_Retorno = 'Terça-feira') or (VS_Retorno = 'Quarta-feira') or
             (VS_Retorno = 'Quinta-feira') or (VS_Retorno = 'Sexta-feira')) then
            VI_Dias:= VI_Dias + 1;
         VD_DiaIni:= VD_DiaIni+1;
      end;

      VS_Comando:= ' Select count(1) as Qtd '+
                   ' From AlunoTurma '+
                   ' where IdCurso = '+IBQuery_Turma.FieldByName('IdCurso').AsString+
                   ' and   IdTurma = '+IBQuery_Turma.FieldByName('IdTurma').AsString+
                   ' and   MotivoDesligamento = '+#39+'a'+#39+
                   ' and   IdUnidade like '+#39+'%'+Trim(MaskEdit_Localidade.Text)+'%'+#39;
      Funcoes.OpenQuery(VS_Comando);
      StringGrid_Executados.Cells[0,VI_Linha]:= IBQuery_Turma.FieldbyName('CodCurso').AsString+
                                                ' Turma '+IBQuery_Turma.FieldbyName('Turma').AsString+'/'+IBQuery_Turma.FieldbyName('Ano').AsString+' - ('+
                                                VS_Data_Ini+' - '+VS_Data_Fim+')';
      StringGrid_Executados.Cells[1,VI_Linha]:= Funcoes.CentraStr( IntToStr(VI_Dias), 17);
      StringGrid_Executados.Cells[2,VI_Linha]:= Funcoes.CentraStr( IntToStr(VI_Dias), 34);
      StringGrid_Executados.Cells[3,VI_Linha]:= Funcoes.CentraStr( IntToStr(VI_Dias), 17);
      StringGrid_Executados.Cells[4,VI_Linha]:= Funcoes.CentraStr( DM.IBQuery_Executa.FieldbyName('Qtd').AsString, 17);
      StringGrid_Executados.Cells[5,VI_Linha]:= Funcoes.CentraStr(IntToStr(DM.IBQuery_Executa.FieldbyName('Qtd').AsInteger*VI_Dias), 17);
      StringGrid_Executados.Cells[6,VI_Linha]:= Funcoes.CentraStr(IntToStr(DM.IBQuery_Executa.FieldbyName('Qtd').AsInteger*VI_Dias), 34);
      StringGrid_Executados.Cells[7,VI_Linha]:= Funcoes.CentraStr(IntToStr(DM.IBQuery_Executa.FieldbyName('Qtd').AsInteger*VI_Dias), 17);

      VI_Instrucao:= VI_Instrucao + DM.IBQuery_Executa.FieldbyName('Qtd').AsInteger*VI_Dias;
      VI_Material_Didatico:= VI_Material_Didatico + DM.IBQuery_Executa.FieldbyName('Qtd').AsInteger*VI_Dias;
      VI_Auxilios:= VI_Auxilios + DM.IBQuery_Executa.FieldbyName('Qtd').AsInteger*VI_Dias;

      VI_Linha:= VI_Linha + 1;
      IBQuery_Turma.Next;
   end;
      StringGrid_Executados.Cells[1,VI_Linha]:= '';
      StringGrid_Executados.Cells[2,VI_Linha]:= '';
      StringGrid_Executados.Cells[3,VI_Linha]:= '';
      StringGrid_Executados.Cells[4,VI_Linha]:= 'TOTAL:';
   StringGrid_Executados.Cells[0,VI_Linha]:= '';
   StringGrid_Executados.Cells[5,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Instrucao), 17);
   StringGrid_Executados.Cells[6,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Material_Didatico), 34);
   StringGrid_Executados.Cells[7,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Auxilios), 17);

//   VI_Linha:= VI_Linha - 1;
end;

//------------------------------------------------------------------------------
// Limpa Matriz
//------------------------------------------------------------------------------

procedure TForm_AlunosPorInstituicao.LimpaMatrizExecutados(VI_Linhas: Integer);
var
   L, I: Integer;
begin
    for I:= 0 to 7 do
       for L:= 1 to VI_Linhas do
          StringGrid_Executados.Cells[I,L]:= ' ';

end;

//------------------------------------------------------------------------------
// Monta o Cabecalho
//------------------------------------------------------------------------------

procedure TForm_AlunosPorInstituicao.MontarCabecalho;
begin
   StringGrid_Executados.Cells[0,0]:= '       CURSO';
   StringGrid_Executados.Cells[1,0]:= 'INSTRUÇÃO';
   StringGrid_Executados.Cells[2,0]:= 'MATERIAL DIDÁTICO';
   StringGrid_Executados.Cells[3,0]:= 'AUXÍLIOS';
   StringGrid_Executados.Cells[4,0]:= 'Nº ALUNOS';
   StringGrid_Executados.Cells[5,0]:= 'INSTRUÇÃO';
   StringGrid_Executados.Cells[6,0]:= 'MATERIAL DIDÁTICO';
   StringGrid_Executados.Cells[7,0]:= 'AUXÍLIOS';
end;

procedure TForm_AlunosPorInstituicao.ToolButton_RecalcularClick(Sender: TObject);
var
   VI_Instrucao, VI_Material_Didatico, VI_Auxilios, i: Integer;
begin
   VI_Instrucao:= 0;
   VI_Material_Didatico:= 0;
   VI_Auxilios:= 0;

   for i:= 1 to VI_Linha-1 do
   begin
      StringGrid_Executados.Cells[1,I]:= Funcoes.CentraStr(StringGrid_Executados.Cells[1,I], 17);
      StringGrid_Executados.Cells[2,I]:= Funcoes.CentraStr( StringGrid_Executados.Cells[2,I], 34);
      StringGrid_Executados.Cells[3,I]:= Funcoes.CentraStr( StringGrid_Executados.Cells[3,I], 17);

      StringGrid_Executados.Cells[5,I]:= Funcoes.CentraStr(IntToStr(StrToInt(trim(StringGrid_Executados.Cells[1,I])) * StrToInt(trim(StringGrid_Executados.Cells[4,I]))), 17);
      StringGrid_Executados.Cells[6,I]:= Funcoes.CentraStr(IntToStr(StrToInt(trim(StringGrid_Executados.Cells[2,I])) * StrToInt(trim(StringGrid_Executados.Cells[4,I]))), 34);
      StringGrid_Executados.Cells[7,I]:= Funcoes.CentraStr(IntToStr(StrToInt(trim(StringGrid_Executados.Cells[3,I])) * StrToInt(trim(StringGrid_Executados.Cells[4,I]))), 17);

      VI_Instrucao:= VI_Instrucao + StrToInt(trim(StringGrid_Executados.Cells[1,I])) * StrToInt(trim(StringGrid_Executados.Cells[4,I]));
      VI_Material_Didatico:= VI_Material_Didatico + StrToInt(trim(StringGrid_Executados.Cells[2,I])) * StrToInt(trim(StringGrid_Executados.Cells[4,I]));
      VI_Auxilios:= VI_Auxilios + StrToInt(trim(StringGrid_Executados.Cells[3,I])) * StrToInt(trim(StringGrid_Executados.Cells[4,I]));
   end;
   StringGrid_Executados.Cells[0,VI_Linha]:= ' Total';
   StringGrid_Executados.Cells[5,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Instrucao), 17);
   StringGrid_Executados.Cells[6,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Material_Didatico), 34);
   StringGrid_Executados.Cells[7,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Auxilios), 17);
end;

procedure TForm_AlunosPorInstituicao.JvTransparentButton_ImprimirClick(Sender: TObject);
var
   VS_Comando: String;
   i: Integer;
begin
   VS_Comando:= 'Delete from Rel_alunosPorUnidade ';
   Funcoes.ExecusaoQuery(VS_Comando);

   for i:= 1 to VI_Linha do
   begin
      VS_Comando:= ' Insert into REL_ALUNOSPORUNIDADE ( DESCRICAO, MES, CURSO, DIAS_INSTRUCAO, DIAS_MATERIAL, DIAS_AUXILIOS, N_Aluno, ALUNO_INSTRUCAO, ALUNOS_MATERIAL, ALUNOS_AUXILIOS) '+
                   ' Values( '+#39+'Alunos da '+MaskEdit_Localidade.Text+' no ICEA '+#39+', '+
                               #39+'Mês: '+ComboBox_Mes.Text+'/'+Funcoes_TrataData.AnoAtual+#39+', '+
                  #39+trim(StringGrid_Executados.Cells[0,I])+#39+', '+
                  #39+trim(StringGrid_Executados.Cells[1,I])+#39+', '+
                  #39+trim(StringGrid_Executados.Cells[2,I])+#39+', '+
                  #39+trim(StringGrid_Executados.Cells[3,I])+#39+', '+
                  #39+trim(StringGrid_Executados.Cells[4,I])+#39+', '+
                  #39+trim(StringGrid_Executados.Cells[5,I])+#39+', '+
                  #39+trim(StringGrid_Executados.Cells[6,I])+#39+', '+
                  #39+trim(StringGrid_Executados.Cells[7,I])+#39+' )';
      Funcoes.ExecusaoQuery(VS_Comando);
   end;
   Form_Rel_AlunosPorUnidades.Preview;
   
end;

//------------------------------------------------------------------------------
// Tratamento do botao para trocar o responsavel pela assinatura do Relatorio
//------------------------------------------------------------------------------

procedure TForm_AlunosPorInstituicao.JvTransparentButton_AssinaturaClick( Sender: TObject);
begin
   VB_SelecaoResponsavelAssinatura:= True;
   Form_Sel_ResponsavelAssinaturaRelatorio.ShowMOdal;
end;


end.
