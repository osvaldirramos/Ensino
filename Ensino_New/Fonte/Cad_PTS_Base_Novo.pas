//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SGEW                                           //
//                                                                            //
// PROGRAMA                  : Cad_PTS_Base_Novo.pas                          //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do Cadastro //
//                             do PTS Base novo.                              //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Ten Padilha                                    //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 06/10/2021                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//


unit Cad_PTS_Base_Novo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTransBtn, ExtCtrls, JvShape, JvGradient, DBCtrls, StdCtrls,
  JvToolEdit, JvDBCtrl, Mask, JvComponent, JvEnterTab, DB, IBCustomDataSet,
  IBTable, JvRichEd, JvDBRichEd, Rotinas, Rotinas_SUE, Rotinas_TrataData, Rotinas_Validar,
  Grids, DBGrids, ComCtrls, IBQuery;

type
  TForm_Cad_PTS_Base_Novo = class(TForm)
    JvGradient_Tela: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    Memo_Dicas01: TMemo;
    JvEnterAsTab1: TJvEnterAsTab;
    Label_DiaSemana: TLabel;
    Label_Horario: TLabel;
    Label_TrabEscolar: TLabel;
    Label3: TLabel;
    DBComboBox_Horario: TDBComboBox;
    DBComboBox_Local: TDBComboBox;
    Panel1: TPanel;
    Label1: TLabel;
    JvDBRichEdit_Msg: TJvDBRichEdit;
    Label_Opcao: TLabel;
    StatusBar_Msg: TStatusBar;
    Label2: TLabel;
    DBComboBox_Disciplina: TDBComboBox;
    Memo_Dicas02: TMemo;
    DBComboBox_Dia_Semana: TDBComboBox;
    IBTable_PTS_base_Semana: TIBTable;
    IBTable_PTS_base_SemanaIDCURSO: TSmallintField;
    IBTable_PTS_base_SemanaIDSEMANA: TIntegerField;
    IBTable_PTS_base_SemanaDIA_SEMANA: TIBStringField;
    IBTable_PTS_base_SemanaHORARIO: TIBStringField;
    IBTable_PTS_base_SemanaTRAB_ESCOLAR: TIBStringField;
    IBTable_PTS_base_SemanaLOCAL: TIBStringField;
    IBTable_PTS_base_SemanaDISCIPLINA: TIBStringField;
    IBTable_PTS_base_SemanaQTD_INSTRUTOR: TIntegerField;
    IBTable_PTS_base_SemanaESPECIALIDADE: TIBStringField;
    DST_PTS_base_Semana: TDataSource;
    IBQuery_PTS_base_Semana: TIBQuery;
    IBQuery_PTS_base_SemanaIDCURSO: TSmallintField;
    IBQuery_PTS_base_SemanaIDSEMANA: TIntegerField;
    IBQuery_PTS_base_SemanaDIA_SEMANA: TIBStringField;
    IBQuery_PTS_base_SemanaHORARIO: TIBStringField;
    IBQuery_PTS_base_SemanaLOCAL: TIBStringField;
    IBQuery_PTS_base_SemanaTRAB_ESCOLAR: TIBStringField;
    IBQuery_PTS_base_SemanaDISCIPLINA: TIBStringField;
    IBQuery_PTS_base_SemanaQTD_INSTRUTOR: TIntegerField;
    IBQuery_PTS_base_SemanaESPECIALIDADE: TIBStringField;
    DSQ_PTS_base_Semana: TDataSource;
    Label_DescCurso: TLabel;
    ComboBox_TrabalhoEscolar: TComboBox;
    Label_Disciplina_Selecionada: TLabel;

    procedure InserirDisciplinaBase;

    procedure Validar_ComboBox_TrabalhoEscolar;
    procedure Tratar_ComboBox_Horario;
    procedure AjustarTrabalhoEscolar;
    procedure TrabalhoEscolar(VS_Opcao: String);
    procedure Disciplina(VS_Opcao: String);

    procedure Fechar(Sender: TObject);
    procedure Tratar_Insercao_PTS;

    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure DBComboBox_Dia_SemanaEnter(Sender: TObject);
    procedure DBComboBox_HorarioEnter(Sender: TObject);
    procedure DBComboBox_LocalEnter(Sender: TObject);
    procedure JvDBRichEdit_MsgEnter(Sender: TObject);
    procedure DBComboBox_Dia_SemanaExit(Sender: TObject);
    procedure DBComboBox_HorarioExit(Sender: TObject);
    procedure DBComboBox_LocalExit(Sender: TObject);
    procedure JvDBRichEdit_MsgExit(Sender: TObject);
    procedure DBComboBox_DisciplinaEnter(Sender: TObject);
    procedure DBComboBox_DisciplinaExit(Sender: TObject);
    procedure DBComboBox_DisciplinaChange(Sender: TObject);
    procedure ComboBox_TrabalhoEscolarChange(Sender: TObject);
    procedure ComboBox_TrabalhoEscolarEnter(Sender: TObject);
    procedure ComboBox_TrabalhoEscolarExit(Sender: TObject);
    procedure ComboBox_TrabalhoEscolarSelect(Sender: TObject);
  private                           { Private declarations }
     VS_CodMateria, VS_NomeMateria, VS_DiaSemana, VS_Local, VS_QtdInstrutor, VS_Especialidade: String;
     VS_CodigoDisciplina_Anterior, VS_Trabalho_Escolar_Anterior: String;

     VS_Disciplina, VS_TrabalhoEscolar: String;  //=>

     VI_TamDisciplina: Integer;
     VB_Validar_ComboBox_TrabalhoEscolar: boolean;
  public
    { Public declarations }
  end;

var
  Form_Cad_PTS_Base_Novo: TForm_Cad_PTS_Base_Novo;

implementation

uses Sel_PTS_Base_Novo, Module, Sel_Disciplina;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento quando Abre a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.FormActivate(Sender: TObject);
begin
   Funcoes_SUE.AlimentaDBComboBox(DBComboBox_Dia_Semana, 'Dia_Semana', 'PTS_DIA_SEMANA', '', 'id');
   Funcoes_SUE.AlimentaDBComboBox(DBComboBox_Local, 'CodSala', 'SalaAula', '', 'CodSala');

   JvGradient_Tela.StartColor:= Cor_Tela;
   Label_DescCurso.Caption:= trim(Form_Sel_PTS_Base_Novo.Query_MontaCurso.FieldByName('CodCurso').AsString)+
                          ' ( '+trim(Form_Sel_PTS_Base_Novo.Query_MontaCurso.FieldByName('NomeCurso').AsString)+' )';

   InserirDisciplinaBase;

   IBTable_PTS_base_Semana.Open;
   if Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana.FieldByName('Dia_Semana').AsString = '' then
      VS_DiaSemana:= Form_Sel_PTS_Base_Novo.ComboBox_Semana.Text
   else
   begin
      VS_DiaSemana:= Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana.FieldByName('Dia_Semana').AsString;
      VS_Disciplina:= Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana.FieldByName('Disciplina').AsString;          //=>
      VS_TrabalhoEscolar:= Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana.FieldByName('Trab_Escolar').AsString;   //=>
   end;

   VS_Local:= Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana.FieldByName('Local').AsString;
   VS_QtdInstrutor:= Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana.FieldByName('QTD_Instrutor').AsString;
   VS_Especialidade:= Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana.FieldByName('Especialidade').AsString;

   Funcoes.CabecalhoForm( Form_Cad_PTS_Base_Novo, ' Cadastro - PTS Base Novo ( Plano de Trabalho Semanal ) - Semana: '+Form_Sel_PTS_Base_Novo.ComboBox_Semana.Text);
   Label_Opcao.Caption:= Form_Sel_PTS_Base_Novo.VS_Opcao;

   //--- Tratamento para alimentar os ComboBox

   Validar.ListaDisciplinas(DM.IBQuery_MontaTurma.FieldByName('idcurso').AsString, DM.IBQuery_MontaTurma.FieldByName('idturma').AsString, DBComboBox_Disciplina, ComboBox_TrabalhoEscolar);

   Tratar_Insercao_PTS;
end;

//------------------------------------------------------------------------------
// Tratamento para inserir PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.Tratar_Insercao_PTS;
var
   VS_Comando: String;
begin
   VS_CodMateria:= '-1-1-1';
   VI_TamDisciplina:= 0;
   
   if Form_Sel_PTS_Base_Novo.VS_Opcao = 'Inserir' then
   begin
      Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.Edit;

      IBTable_PTS_base_Semana.Append;
      IBTable_PTS_base_Semana.FieldByName('IdCurso').AsString:= Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.FieldByName('IdCurso').AsString;
      IBTable_PTS_base_Semana.FieldByName('IdSemana').AsString:= Form_Sel_PTS_Base_Novo.ComboBox_Semana.Text;

      IBTable_PTS_base_Semana.FieldByName('Dia_Semana').AsString:= VS_DiaSemana;
      IBTable_PTS_base_Semana.FieldByName('Disciplina').AsString:= VS_Disciplina;                   //=>
      IBTable_PTS_base_Semana.FieldByName('Trab_Escolar').AsString:= VS_TrabalhoEscolar;         //=>

      IBTable_PTS_base_Semana.FieldByName('Local').AsString:= VS_Local;
      IBTable_PTS_base_Semana.FieldByName('QTD_INSTRUTOR').AsString:= VS_QtdInstrutor;
      IBTable_PTS_base_Semana.FieldByName('Especialidade').AsString:= VS_Especialidade;

      ComboBox_TrabalhoEscolar.Text:= VS_TrabalhoEscolar;         //=> '';
      DBComboBox_Dia_Semana.Text:= VS_DiaSemana;
      DBComboBox_Horario.Text:= '';
      DBComboBox_Local.Text:= VS_Local;
      Label_Disciplina_Selecionada.Caption:= '';

   end
   else
   begin

      VS_Comando:= ' Select idcurso, idsemana, dia_semana, horario, disciplina, trab_escolar, local, QTD_Instrutor, Especialidade '+
                   ' From PTS_Base_Semana '+
                   ' Where idcurso =  '+Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.FieldByName('IdCurso').AsString+
                   ' and IdSemana = '+Form_Sel_PTS_Base_Novo.ComboBox_Semana.Text+
                   ' and Dia_Semana = '+#39+Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana.FieldByName('Dia_Semana').AsString+#39+
                   ' and Horario = '+#39+Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana.FieldByName('Horario').AsString+#39+
                   ' Order by IdSemana, dia_semana, horario ';

      IBQuery_PTS_base_Semana.Close;
      IBQuery_PTS_base_Semana.Sql.Clear;
      IBQuery_PTS_base_Semana.Sql.Add(VS_Comando);
      IBQuery_PTS_base_Semana.Open;

      Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.Edit;
      IBTable_PTS_base_Semana.Edit;

      ComboBox_TrabalhoEscolar.Text:= IBTable_PTS_base_Semana.FieldByName('trab_escolar').AsString;
      VS_CodigoDisciplina_Anterior:= IBTable_PTS_base_Semana.FieldByName('Disciplina').AsString;
      VS_Trabalho_Escolar_Anterior:= IBTable_PTS_base_Semana.FieldByName('Trab_Escolar').AsString;

      Label_Disciplina_Selecionada.Caption:= 'Disciplina selecionada: '+VS_Trabalho_Escolar_Anterior;

   end;

   Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.FieldByName('Responsavel').AsString:= Funcoes.GetUsuario;
   Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.FieldByName('Atualizacao').AsString:= DateToStr(Date);
   Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.FieldByName('Ano').AsString:= Funcoes_TrataData.AnoAtual;

   DBComboBox_Dia_Semana.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.JvTransparentButton_GravaClick(Sender: TObject);
var
   VS_Comando: String;
begin
   Validar_ComboBox_TrabalhoEscolar;

   Disciplina('Gravar');
   TrabalhoEscolar('Gravar');

   if Funcoes.ValidaCampo(DBComboBox_Dia_Semana.Text, 'O dia da semana ') = False then
      DBComboBox_Dia_Semana.SetFocus
   else
      if Funcoes.ValidaCampo(DBComboBox_Horario.Text, 'O horário ') = False then
         DBComboBox_Horario.SetFocus
      else
         if Funcoes.ValidaCampo(ComboBox_TrabalhoEscolar.Text, 'A descrição do trabalho escolar ') = False then
            ComboBox_TrabalhoEscolar.SetFocus
         else
         begin
            if Form_Sel_PTS_Base_Novo.VS_Opcao = 'Inserir' then
            begin

               //--- Tratamento para verificar se o PTS ja foi inserido com a caracteristica fornecida

               VS_Comando:= 'Select count(1) as Qtd From PTS_Base_Semana '+
                            ' Where IdCurso =  '+IBTable_PTS_base_Semana.FieldByName('IdCurso').AsString+
                            ' and   IdSemana = '+IBTable_PTS_base_Semana.FieldByName('IdSemana').AsString+
                            ' and   Dia_Semana = '+#39+IBTable_PTS_base_Semana.FieldByName('Dia_Semana').AsString+#39+
                            ' and   Horario = '+#39+IBTable_PTS_base_Semana.FieldByName('Horario').AsString+#39;

               Funcoes.OpenQuery(VS_Comando);

               if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
               begin
                  ShowMessage('Já existe PTS cadastrado na '+IBTable_PTS_base_Semana.FieldByName('IdSemana').AsString+'º semana na '+IBTable_PTS_base_Semana.FieldByName('Dia_Semana').AsString+' com o horário selecionado '+IBTable_PTS_base_Semana.FieldByName('Horario').AsString+'...');
                  DBComboBox_Dia_Semana.SetFocus;
               end
               else
               begin
                  VS_DiaSemana:= IBTable_PTS_base_Semana.FieldByName('Dia_Semana').AsString;
                  VS_Local:=     IBTable_PTS_base_Semana.FieldByName('Local').AsString;

                  if (( Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.State = DSInsert) or ( Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.State = DSEdit )) then
                     Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.Post;

                  if (( IBTable_PTS_base_Semana.State = DSInsert) or ( IBTable_PTS_base_Semana.State = DSEdit )) then
                     IBTable_PTS_base_Semana.Post;

                  VS_Disciplina:= IBTable_PTS_base_Semana.FieldByName('Disciplina').AsString;                   //=>
                  VS_TrabalhoEscolar:= IBTable_PTS_base_Semana.FieldByName('Trab_Escolar').AsString;         //=>

                  Funcoes.ExecutaTransacao;

                  Funcoes.AtualizaQuery( Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana );

                  Tratar_ComboBox_Horario;

                  Tratar_Insercao_PTS
               end;
            end
            else
            begin
               if (( Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.State = DSInsert) or ( Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.State = DSEdit )) then
                  Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.Post;

               if (( IBTable_PTS_base_Semana.State = DSInsert) or ( IBTable_PTS_base_Semana.State = DSEdit )) then
                  IBTable_PTS_base_Semana.Post;

               Funcoes.ExecutaTransacao;
               AjustarTrabalhoEscolar;

               Funcoes.AtualizaQuery( Form_Sel_PTS_Base_Novo.IBQuery_PTS_base_Semana );
               Fechar(Sender);

            end;
         end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Cancela Gravacao
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.JvTransparentButton_CancelarClick( Sender: TObject);
begin
   if (( IBTable_PTS_base_Semana.State = DSInsert) or ( IBTable_PTS_base_Semana.State = DSEdit )) then
   begin
      IBTable_PTS_base_Semana.FieldByName('Dia_Semana').AsString:= '0';
      IBTable_PTS_base_Semana.FieldByName('Horario').AsString:= '0';
      IBTable_PTS_base_Semana.FieldByName('Trab_Escolar').AsString:= '0';
      IBTable_PTS_base_Semana.FieldByName('Local').AsString:= '0';

      IBTable_PTS_base_Semana.Cancel;
   end;

   if (( Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.State = DSInsert) or ( Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.State = DSEdit )) then
       Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.Cancel;


   Funcoes.abortaTransacao;

   Fechar(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para Fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.Fechar(Sender: TObject);
begin
   IBTable_PTS_base_Semana.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento da opção de selecao do DBCombox_Dia
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.DBComboBox_Dia_SemanaEnter(Sender: TObject);
begin
   Validar.DBComboBox_Enter(DBComboBox_Dia_Semana);
end;

//------------------------------------------------------------------------------
// Tratamento da opção de selecao do ComboBox_TrabalhoEscolar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.ComboBox_TrabalhoEscolarChange(Sender: TObject);
begin
   VB_Validar_ComboBox_TrabalhoEscolar:= True;
end;

//------------------------------------------------------------------------------
// Tratamento da opção de selecao do ComboBox_TrabalhoEscolar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.ComboBox_TrabalhoEscolarEnter( Sender: TObject);
begin
   VB_Validar_ComboBox_TrabalhoEscolar:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o ComboBox do horario
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.DBComboBox_HorarioEnter(Sender: TObject);
begin
   Validar.DBComboBox_Enter(DBComboBox_Horario);
end;

procedure TForm_Cad_PTS_Base_Novo.DBComboBox_LocalEnter(Sender: TObject);
begin
   Validar.DBComboBox_Enter(DBComboBox_Local);
end;

procedure TForm_Cad_PTS_Base_Novo.JvDBRichEdit_MsgEnter(Sender: TObject);
begin
   Validar.JvDBRichEdit_Enter(JvDBRichEdit_Msg);
end;

//------------------------------------------------------------------------------
// Tratamento para filtrar a semana selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.DBComboBox_Dia_SemanaExit(Sender: TObject);
begin
   Validar.DBComboBox_Exit(DBComboBox_Dia_Semana);
   Tratar_ComboBox_Horario;
end;

//------------------------------------------------------------------------------
// Tratamento para filtrar a semana selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.Tratar_ComboBox_Horario;
var
   VS_DiaSemana: String;
begin

   if DBComboBox_Dia_Semana.Text = '' then
      VS_DiaSemana:= '2º Feira'
   else
      VS_DiaSemana:= DBComboBox_Dia_Semana.Text;

   Funcoes.OpenQuery( ' select horario '+
                      ' From pts_horario '+
                      ' Where horario not in ( select horario '+
                      '                        From PTS_Base_Semana '+
                      '                        Where idcurso  = '+Form_Sel_PTS_Base_Novo.Query_MontaCurso.FieldByName('IdCurso').AsString+
                      '                        and idsemana   = '+Form_Sel_PTS_Base_Novo.ComboBox_Semana.Text+
                      '                        and dia_semana = '+#39+DBComboBox_Dia_Semana.Text+#39+
                      '                      ) '
                    );

   DBComboBox_Horario.Items.Clear;
   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.eof do
   begin
      DBComboBox_Horario.Items.Add(DM.IBQuery_Executa.FieldByName('horario').AsString);
      DM.IBQuery_Executa.Next
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para validar o ComboBox_TrabalhoEscolar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.Validar_ComboBox_TrabalhoEscolar;
begin
   if VB_Validar_ComboBox_TrabalhoEscolar = True then
   begin
      if ( Copy(ComboBox_TrabalhoEscolar.Text,1,6) = '------' ) then
      begin
         ShowMessage('Não é permitido selecionar a referencia...');
         ComboBox_TrabalhoEscolar.SetFocus;
      end
      else
      begin
         if ((ComboBox_TrabalhoEscolar.Text = 'ABERTURA DO CURSO') or
             (ComboBox_TrabalhoEscolar.Text = 'ENCERRAMENTO DO CURSO') or
             (ComboBox_TrabalhoEscolar.Text = 'ABERTURA DO CURSO') or
             (ComboBox_TrabalhoEscolar.Text = 'ENCERRAMENTO DO CURSO') or
             (ComboBox_TrabalhoEscolar.Text = 'À DISPOSIÇÃO DO ENSINO')) then
         begin
            DBComboBox_Disciplina.Text:= '';
            DBComboBox_Local.Text:= 'AUDITÓRIO';
         end
         else
         begin
            if ((ComboBox_TrabalhoEscolar.Text = 'FERIADO') or (ComboBox_TrabalhoEscolar.Text = '')) then
            begin
               DBComboBox_Disciplina.Text:= '';
               DBComboBox_Local.Text:= '';
            end
            else
            begin
               if ((copy(ComboBox_TrabalhoEscolar.Text, 1, 15) = 'PROVA AVALIAÇÃO') and
                   (copy(ComboBox_TrabalhoEscolar.Text, 1, 13) = 'PROVA TEÓRICA') and
                   (copy(ComboBox_TrabalhoEscolar.Text, 1, 13) = 'PROVA PRÁTICA') and
                   (copy(ComboBox_TrabalhoEscolar.Text, 1, 17) = 'PROVA DIAGNÓSTICA') and
                   (copy(ComboBox_TrabalhoEscolar.Text, 1, 30) = 'DISCUSSÃO DA AVALIAÇÃO PRÁTICA') and
                   (copy(ComboBox_TrabalhoEscolar.Text, 1, 30) = 'DISCUSSÃO DA AVALIAÇÃO TEÓRICA') and
                   (ComboBox_TrabalhoEscolar.Text = 'CRÍTICA DO CURSO')) then
               begin
                  DBComboBox_Disciplina.Text:= '';
               end
               else
               begin
                  if Validar.VerificarOpcao(ComboBox_TrabalhoEscolar.Text) = 'Disciplina' then
                  begin
                     DBComboBox_Disciplina.Text:= copy(ComboBox_TrabalhoEscolar.Text,1, 6);
                     ComboBox_TrabalhoEscolar.Text:= copy(ComboBox_TrabalhoEscolar.Text,10, Length(ComboBox_TrabalhoEscolar.Text)-9);
                  end
                  else
                  begin
                     DBComboBox_Disciplina.Text:= '';
                  end;
               end;
            end;
         end;

         IBTable_PTS_base_Semana.FieldByName('Disciplina').AsString:= DBComboBox_Disciplina.Text;
         IBTable_PTS_base_Semana.FieldByName('Trab_Escolar').AsString:= ComboBox_TrabalhoEscolar.Text;
         VB_Validar_ComboBox_TrabalhoEscolar:= False;

         TrabalhoEscolar('Inserir');
      end;
   end;

end;

//------------------------------------------------------------------------------
// Tratamento dos combobox
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.DBComboBox_HorarioExit(Sender: TObject);
begin
   Validar.DBComboBox_Exit(DBComboBox_Horario);
end;


procedure TForm_Cad_PTS_Base_Novo.ComboBox_TrabalhoEscolarExit(Sender: TObject);
begin
   Validar_ComboBox_TrabalhoEscolar;
   Validar.ComboBox_Exit(ComboBox_TrabalhoEscolar);
end;

procedure TForm_Cad_PTS_Base_Novo.ComboBox_TrabalhoEscolarSelect(Sender: TObject);
begin
   Validar_ComboBox_TrabalhoEscolar;
   VB_Validar_ComboBox_TrabalhoEscolar:= False;
end;


procedure TForm_Cad_PTS_Base_Novo.DBComboBox_LocalExit(Sender: TObject);
begin
   Validar.DBComboBox_Exit(DBComboBox_Local);
end;

procedure TForm_Cad_PTS_Base_Novo.JvDBRichEdit_MsgExit(Sender: TObject);
begin
   Validar.JvDBRichEdit_Exit(JvDBRichEdit_Msg);
end;

procedure TForm_Cad_PTS_Base_Novo.DBComboBox_DisciplinaChange( Sender: TObject);
begin
   Disciplina('Inserir');
end;

procedure TForm_Cad_PTS_Base_Novo.DBComboBox_DisciplinaEnter(Sender: TObject);
begin
   Validar.DBComboBox_Enter(DBComboBox_Disciplina);
end;

procedure TForm_Cad_PTS_Base_Novo.DBComboBox_DisciplinaExit(Sender: TObject);
begin
   Validar.DBComboBox_Exit(DBComboBox_Disciplina);
end;

//------------------------------------------------------------------------------
// Verificacao da disciplina
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.Disciplina(VS_Opcao: String);
begin
   if ((trim(DBComboBox_Disciplina.Text) <> '') and (VS_CodigoDisciplina_Anterior <> trim(DBComboBox_Disciplina.Text))) then
   begin
      Funcoes.OpenQuery( ' Select distinct NomeMateria From MateriaCurso '+
                         ' where IdCurso = '+Form_Sel_PTS_Base_Novo.Query_MontaCurso.FieldByName('IdCurso').AsString+
                         ' and IdTurma = 0 and CodMateria = '+#39+DBComboBox_Disciplina.Text+#39
                       );

      IBTable_PTS_base_Semana.FieldByName('TRAB_ESCOLAR').AsString:= Funcoes.AjustarMaiscula(UpperCase(DM.IBQuery_Executa.FieldByName('NomeMateria').AsString));
      ComboBox_TrabalhoEscolar.Text:= Funcoes.AjustarMaiscula(UpperCase(DM.IBQuery_Executa.FieldByName('NomeMateria').AsString));

      if VS_Opcao = 'Inserir' then
         DBComboBox_Local.SetFocus;
   end
   else
   begin
      if VS_Opcao = 'Inserir' then
          ComboBox_TrabalhoEscolar.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do trabalho Escolar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.TrabalhoEscolar(VS_Opcao: String);
begin
   if VS_Opcao = 'Inserir' then
       DBComboBox_Local.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento para ajustar o trabalho Escolar e eselecionar a disciplina em todo PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.AjustarTrabalhoEscolar;
begin
   if VS_CodMateria <> '-1-1-1' then
      Funcoes.ExecusaoQuery( ' Update PTS_Base_Semana set Disciplina = '+#39+VS_CodMateria+#39+', '+
                             '                            Trab_Escolar = '+#39+Funcoes.AjustarMaiscula(UpperCase(copy(ComboBox_TrabalhoEscolar.Text, 10, Length(ComboBox_TrabalhoEscolar.Text))))+#39+
                             ' where idcurso = '+Form_Sel_PTS_Base_Novo.Query_MontaCurso.FieldByName('IdCurso').AsString+
                             ' and   Trab_Escolar = '+#39+VS_Trabalho_Escolar_Anterior+#39
                           );
end;


//------------------------------------------------------------------------------
//  Insere a disciplina Base na Turma selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Base_Novo.InserirDisciplinaBase;
var
   VS_IdCurso: String;
begin
   VS_IdCurso:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
   Funcoes.OpenQuery( 'Select count(1) Qtd '+
                      ' From MateriaCurso '+
                      '  Where IdCurso = '+VS_IdCurso+
                      ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                    );

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger  = 0 then
   begin
      Funcoes.ExecutaQuery( DM.IBQuery_ExecutaBase, 'Select * From MateriaCurso Where IdCurso = '+VS_IdCurso+' and IdTurma = 0' );

      DM.IBTable_Materia.Open;
      DM.IBQuery_ExecutaBase.First;
      While not DM.IBQuery_ExecutaBase.eof do
      begin
         Funcoes.Grava_Disciplina( VS_IdCurso,
                                   DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('CODMATERIA').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('NOMEMATERIA').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('NUMEROAULASTEORICAS').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('NUMEROAULASPRATICAS').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('FASE').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('PERGUNTACHEFE').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('PERGUNTAALUNO').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('ESPECIALIDADE').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('QTD_OBJETIVOS').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('ATUALIZACAO').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('ANO').AsString
                                 );
         DM.IBQuery_ExecutaBase.Next;
      end;
      DM.IBTable_Materia.Close;
   end;
end;

end.

