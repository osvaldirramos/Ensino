//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SGEW                                           //
//                                                                            //
// PROGRAMA                  : Cad_PTS_Novo.pas                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do Cadastro //
//                             do PTS novo.                                   //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Ten Padilha                                    //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 07/03/2022                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//


unit Cad_PTS_Indicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTransBtn, ExtCtrls, JvShape, JvGradient, DBCtrls, StdCtrls,
  JvToolEdit, JvDBCtrl, Mask, JvComponent, JvEnterTab, DB, IBCustomDataSet,
  IBTable, JvRichEd, JvDBRichEd, Rotinas, Rotinas_SUE, Rotinas_TrataData,
  Grids, DBGrids, ComCtrls, IBQuery, JvLookOut;

type
  TForm_Cad_PTS_Indicacao = class(TForm)
    Panel1: TPanel;
    StatusBar_Msg: TStatusBar;
    IBTable_PTS_Indicacao: TIBTable;
    DST_PTS_Indicacao: TDataSource;
    IBQuery_PTS_Instrutor_Turma: TIBQuery;
    DSQ_PTS_Instrutor_Indicacao: TDataSource;
    DBGrid_Instrutor: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    IBQuery_PTS_Selecionado: TIBQuery;
    DataSource1: TDataSource;
    IBQuery_PTS_SelecionadoIDPTS: TIntegerField;
    IBQuery_PTS_SelecionadoIDSEMANA: TIntegerField;
    IBQuery_PTS_SelecionadoDIA_SEMANA: TIBStringField;
    IBQuery_PTS_SelecionadoHORARIO: TIBStringField;
    IBQuery_PTS_SelecionadoTRAB_ESCOLAR: TIBStringField;
    IBQuery_PTS_SelecionadoDISCIPLINA: TIBStringField;
    IBTable_PTS_IndicacaoIDPTS: TIntegerField;
    IBTable_PTS_IndicacaoIDSEMANA: TIntegerField;
    IBTable_PTS_IndicacaoDIA_SEMANA: TIBStringField;
    IBTable_PTS_IndicacaoHORARIO: TIBStringField;
    IBTable_PTS_IndicacaoTRAB_ESCOLAR: TIBStringField;
    IBTable_PTS_IndicacaoSTATUS: TIBStringField;
    IBTable_PTS_IndicacaoINDICADO_POR: TIBStringField;
    IBTable_PTS_IndicacaoDATA_INDICACAO: TDateTimeField;
    IBTable_PTS_IndicacaoID: TIntegerField;
    IBTable_PTS_IndicacaoDISCIPLINA: TIBStringField;
    IBTable_PTS_IndicacaoIDINSTRUTOR: TIBStringField;
    IBQuery_PTS_Instrutor_TurmaIDCURSO: TSmallintField;
    IBQuery_PTS_Instrutor_TurmaIDTURMA: TIntegerField;
    IBQuery_PTS_Instrutor_TurmaIDENTIDADE: TIBStringField;
    IBQuery_PTS_Instrutor_TurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_PTS_Instrutor_TurmaNOMEGUERRA: TIBStringField;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    Panel3: TPanel;
    JvGradient_Menu: TJvGradient;
    Label_Opcao: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    JvGradient_Tela: TJvGradient;

    Procedure Tratar_PTS_Semana;

    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
  private    { Private declarations }
     VBAchouPessoa: Boolean;
     VS_IdInstrutor: String;
  public
    { Public declarations }
  end;

var
  Form_Cad_PTS_Indicacao: TForm_Cad_PTS_Indicacao;

implementation

uses Sel_PTS_Novo, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento quando Abre a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Indicacao.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   JvGradient_Tela.StartColor:= Cor_Tela;

   Funcoes.CabecalhoForm( Form_Cad_PTS_Indicacao, ' Cadastro - PTS Base Novo ( Plano de Trabalho Semanal ) - Semana: '+Form_Sel_PTS_Novo.ComboBox_Semana.Text);
   Label_Opcao.Caption:= Form_Sel_PTS_Novo.VS_Opcao;

   //--- Abertura da tabela

   IBTable_PTS_Indicacao.Open;

   VS_Comando:= 'Select IdCurso, IdTurma, Identidade, PostoGraduacao, NomeGuerra '+
                ' From Instrutor_Turma_View '+
                ' Where IdCurso = '+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('IdCurso').AsString+
                ' and IdTurma = '+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('IdTurma').AsString+
                ' order by PostoGraduacao, NomeGuerra ';

   IBQuery_PTS_Instrutor_Turma.Close;
   IBQuery_PTS_Instrutor_Turma.SQL.Clear;
   IBQuery_PTS_Instrutor_Turma.SQL.Add(VS_Comando);
   IBQuery_PTS_Instrutor_Turma.Open;

   Tratar_PTS_Semana;
   DBGrid_Instrutor.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento para inserir PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Indicacao.Tratar_PTS_Semana;
begin
   if Form_Sel_PTS_Novo.VS_Opcao = 'Cadastrar o instrutor no Trabalho Escolar selecionado' then
      Funcoes.ExecutaQuery( IBQuery_PTS_Selecionado, ' Select IdPTS, IdSemana, DIA_SEMANA, HORARIO, TRAB_ESCOLAR, Disciplina '+
                                                     ' From pts_semana '+
                                                     ' Where IdPTS =  '+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                                                     ' and   Trab_Escolar = '+#39+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString+#39+
                                                     ' order by  IdPTS, IdSemana, DIA_SEMANA, HORARIO'
                       )
   else
      Funcoes.ExecutaQuery( IBQuery_PTS_Selecionado, ' Select IdPTS, IdSemana, DIA_SEMANA, HORARIO, TRAB_ESCOLAR, Disciplina '+
                                                     ' From pts_semana '+
                                                     ' Where IdPTS =  '+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                                                     ' and   IdSemana = '+#39+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('IdSemana').AsString+#39+
                                                     ' and   Dia_Semana = '+#39+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString+#39+
                                                     ' and   Horario = '+#39+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Horario').AsString+#39+
                                                     ' and   Trab_Escolar = '+#39+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString+#39
                       );
end;


//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Indicacao.JvTransparentButton_GravaClick(Sender: TObject);
var
   VB_Gravar: Boolean;
   VI_Qtd: Integer;
begin
   VB_Gravar:= True;

   Funcoes.OpenQuery( 'Select count(1) as Qtd From PTS_INDICACAO '+
                      ' Where IdPTS =  '+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                      ' and   IdSemana = '+#39+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('IdSemana').AsString+#39+
                      ' and   Dia_Semana = '+#39+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString+#39+
                      ' and   Horario = '+#39+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Horario').AsString+#39+
                      ' and   Trab_Escolar = '+#39+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString+#39+
                      ' and   IdInstrutor = '+#39+IBQuery_PTS_Instrutor_Turma.FieldByName('Identidade').AsString+#39
                    );

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
   begin
      VB_Gravar:= False;
      ShowMessage('O Instrutor já foi cadastrado para a Disciplina '+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString+'...');
      DBGrid_Instrutor.SetFocus;
   end
   else
   begin
      Funcoes.OpenQuery( 'Select count(1) as Qtd From PTS_INDICACAO '+
                         ' Where IdPTS =  '+Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('IdPTS').AsString
                       );


      VI_Qtd:= Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('IdPTS').AsInteger+10000+DM.IBQuery_Executa.FieldByName('Qtd').AsInteger;

      //--- Tratamento para gravar o PTS

      IBQuery_PTS_Selecionado.Open;
      IBQuery_PTS_Selecionado.First;
      While not IBQuery_PTS_Selecionado.Eof do
      begin
         IBTable_PTS_Indicacao.Append;

         IBTable_PTS_Indicacao.FieldByName('IdPTS').AsString:=          IBQuery_PTS_Selecionado.FieldByName('IdPTS').AsString;
         IBTable_PTS_Indicacao.FieldByName('IdSemana').AsString:=       IBQuery_PTS_Selecionado.FieldByName('IdSemana').AsString;
         IBTable_PTS_Indicacao.FieldByName('Dia_Semana').AsString:=     IBQuery_PTS_Selecionado.FieldByName('Dia_Semana').AsString;
         IBTable_PTS_Indicacao.FieldByName('Horario').AsString:=        IBQuery_PTS_Selecionado.FieldByName('Horario').AsString;
         IBTable_PTS_Indicacao.FieldByName('Trab_Escolar').AsString:=   IBQuery_PTS_Selecionado.FieldByName('Trab_Escolar').AsString;
         IBTable_PTS_Indicacao.FieldByName('Disciplina').AsString:=     IBQuery_PTS_Selecionado.FieldByName('Disciplina').AsString;
         IBTable_PTS_Indicacao.FieldByName('IdInstrutor').AsString:=    IBQuery_PTS_Instrutor_Turma.FieldByName('Identidade').AsString;
         IBTable_PTS_Indicacao.FieldByName('id').AsInteger:=            VI_Qtd;
         IBTable_PTS_Indicacao.FieldByName('INDICADO_POR').AsString:=   Funcoes.GetUsuario;
         IBTable_PTS_Indicacao.FieldByName('DATA_INDICACAO').AsString:= DateToStr(Date);

         IBTable_PTS_Indicacao.Post;
         Funcoes.ExecutaTransacao;

         Funcoes.AtualizaQuery( Form_Sel_PTS_Novo.IBQuery_PTS_Indicacao );

         IBQuery_PTS_Selecionado.Next;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Cancela Gravacao
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Indicacao.JvTransparentButton_CancelarClick( Sender: TObject);
begin
   Form_Sel_PTS_Novo.VS_Opcao:= 'Consultar';

   Close;
end;

end.
