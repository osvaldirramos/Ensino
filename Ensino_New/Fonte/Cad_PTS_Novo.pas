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


unit Cad_PTS_Novo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTransBtn, ExtCtrls, JvShape, JvGradient, DBCtrls, StdCtrls,
  JvToolEdit, JvDBCtrl, Mask, JvComponent, JvEnterTab, DB, IBCustomDataSet,
  IBTable, JvRichEd, JvDBRichEd, Rotinas, Rotinas_SUE, Rotinas_TrataData, Rotinas_Validar,
  Grids, DBGrids, ComCtrls, IBQuery;

type
  TForm_Cad_PTS_Novo = class(TForm)
    JvGradient_Tela: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    Memo_Dicas01: TMemo;
    Memo_Dicas02: TMemo;
    JvEnterAsTab1: TJvEnterAsTab;
    Label_DiaSemana: TLabel;
    Label_Horario: TLabel;
    Label_TrabEscolar: TLabel;
    Label3: TLabel;
    DBComboBox_Dia_Semana: TDBComboBox;
    DBComboBox_Horario: TDBComboBox;
    DBComboBox_Local: TDBComboBox;
    Panel_Observacao: TPanel;
    Label1: TLabel;
    JvDBRichEdit_Msg: TJvDBRichEdit;
    StatusBar_Msg: TStatusBar;
    Label2: TLabel;
    Label6: TLabel;
    DBComboBox_Disciplina: TDBComboBox;
    ComboBox_TrabalhoEscolar: TComboBox;
    DBEdit_Data: TDBEdit;
    Label_Opcao: TLabel;
    Label_DescCurso: TLabel;
    Label_Disciplina_Selecionada: TLabel;

    procedure InserirDisciplinaBase;

    procedure Validar_ComboBox_TrabalhoEscolar;
    procedure Tratar_ComboBox_Horario;
    procedure AjustarTrabalhoEscolar;
    procedure TrabalhoEscolar(VS_Opcao: String);
    procedure Disciplina(VS_Opcao: String);

    procedure Fechar(Sender: TObject);
    procedure Tratar_Insercao_PTS;

    Function AcharData: String;

    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure DBComboBox_TrabalhoEscolarExit(Sender: TObject);
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
    procedure DBComboBox_QtdInstruoresEnter(Sender: TObject);
    procedure DBComboBox_QtdInstruoresExit(Sender: TObject);
    procedure DBComboBox_EspecialidadeEnter(Sender: TObject);
    procedure ComboBox_TrabalhoEscolarChange(Sender: TObject);
    procedure ComboBox_TrabalhoEscolarEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox_TrabalhoEscolarExit(Sender: TObject);
    procedure ComboBox_TrabalhoEscolarSelect(Sender: TObject);
  private                           { Private declarations }
     VS_CodMateria, VS_DiaSemana, VS_Local, VS_QtdInstrutor, VS_Especialidade: String;
     VS_Dia_Semana_Anterior, VS_Horario_Anterior, VS_CodigoDisciplina_Anterior, VS_Trabalho_Escolar_Anterior: String;

     VS_Disciplina, VS_TrabalhoEscolar: String;  //=>

     VI_TamDisciplina: Integer;
     VB_Validar_ComboBox_TrabalhoEscolar: boolean;
  public
    { Public declarations }
  end;

var
  Form_Cad_PTS_Novo: TForm_Cad_PTS_Novo;

implementation

uses Module, Sel_PTS_Novo, Frame_Sel_Curso, Sel_Disciplina;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento quando Abre a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.FormActivate(Sender: TObject);
begin
   Funcoes_SUE.AlimentaDBComboBox(DBComboBox_Dia_Semana, 'Dia_Semana', 'PTS_DIA_SEMANA', '', 'id');
   Funcoes_SUE.AlimentaDBComboBox(DBComboBox_Local, 'CodSala', 'SalaAula', '', 'CodSala');

   JvGradient_Tela.StartColor:= Cor_Tela;
   Label_DescCurso.Caption:= trim(Frame_SelCurso.ComboBox_Curso.Text);

   InserirDisciplinaBase;

   Form_Sel_PTS_Novo.IBTable_PTS_Semana.Open;


   if Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString = '' then
      VS_DiaSemana:= Form_Sel_PTS_Novo.ComboBox_Semana.Text
   else
      VS_DiaSemana:= Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString;

   VS_Local:= Form_Sel_PTS_Novo.IBQuery_PTS_Semana.FieldByName('Local').AsString;

   Funcoes.CabecalhoForm( Form_Cad_PTS_Novo, ' Cadastro - PTS Novo ( Plano de Trabalho Semanal ) - Semana: '+Form_Sel_PTS_Novo.ComboBox_Semana.Text);
   Label_Opcao.Caption:= Form_Sel_PTS_Novo.VS_Opcao;

   //--- Tratamento para alimentar os ComboBox

   Validar.ListaDisciplinas(DM.IBQuery_MontaTurma.FieldByName('idcurso').AsString, DM.IBQuery_MontaTurma.FieldByName('idturma').AsString, DBComboBox_Disciplina, ComboBox_TrabalhoEscolar);

   Tratar_Insercao_PTS
end;

//------------------------------------------------------------------------------
// Tratamento para inserir PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.Tratar_Insercao_PTS;
begin
   Tratar_ComboBox_Horario;

   VS_CodMateria:= '-1-1-1';
   VI_TamDisciplina:= 0;

   if Form_Sel_PTS_Novo.VS_Opcao = 'Inserir' then
   begin
      VS_Horario_Anterior:= '';
      VS_Dia_Semana_Anterior:= '';
      Form_Sel_PTS_Novo.IBTable_PTS_Principal.Edit;

      Form_Sel_PTS_Novo.IBTable_PTS_Semana.Append;
      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('IdSemana').AsString:= Form_Sel_PTS_Novo.ComboBox_Semana.Text;
      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Dia_Semana').AsString:= VS_DiaSemana;
      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Local').AsString:= VS_Local;
      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('QTD_INSTRUTOR').AsString:= VS_QtdInstrutor;
      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Especialidade').AsString:= VS_Especialidade;

      DBComboBox_Dia_Semana.Enabled:= True;
      DBComboBox_Dia_Semana.Text:= VS_DiaSemana;
      DBComboBox_Horario.Text:= '';
      ComboBox_TrabalhoEscolar.Text:= '';
      DBComboBox_Local.Text:= VS_Local;
   end
   else
   begin
      Form_Sel_PTS_Novo.IBTable_PTS_Principal.Edit;
      Form_Sel_PTS_Novo.IBTable_PTS_Semana.Edit;

      DBComboBox_Dia_Semana.Enabled:= True;

      DBComboBox_Horario.Text:= Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Horario').AsString;
      DBComboBox_Disciplina.Text:= Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Disciplina').AsString;
      ComboBox_TrabalhoEscolar.Text:= Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('trab_escolar').AsString;

      VS_Dia_Semana_Anterior:= Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Dia_Semana').AsString;
      VS_Horario_Anterior:= Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Horario').AsString;
      VS_CodigoDisciplina_Anterior:= Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Disciplina').AsString;
      VS_Trabalho_Escolar_Anterior:= Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Trab_Escolar').AsString;

      Label_Disciplina_Selecionada.Caption:= 'Disciplina selecionada: '+VS_Trabalho_Escolar_Anterior;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Caixa de Selecao de Disciplina
//------------------------------------------------------------------------------

Function TForm_Cad_PTS_Novo.AcharData: String;
var
    VS_Data: String;

   VI_Dia_Semana, VI_Semana: Integer;
begin
   if DBComboBox_Dia_Semana.Text = '' then
       VI_Dia_Semana:= 0
   else
      VI_Dia_Semana:= StrToInt(Copy(DBComboBox_Dia_Semana.Text,1,1))-2;         // 2ºFEIRA - O menos 2 tem o objetivo de zerar a segunda feira

   VI_Semana:= StrToInt(Form_Sel_PTS_Novo.ComboBox_Semana.Text) - 1;
   VI_Semana:= VI_Semana*7 + VI_Dia_Semana;

   VS_Data:= DateToStr(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime+VI_Semana);
   AcharData:= VS_Data;
end;


//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.JvTransparentButton_GravaClick(Sender: TObject);
var
   VB_Gravar: Boolean;
begin
   Validar_ComboBox_TrabalhoEscolar;

   Disciplina('Gravar');
   TrabalhoEscolar('Gravar');

   VB_Gravar:= True;

   if Funcoes.ValidaCampo(DBComboBox_Dia_Semana.Text, 'O dia da semana ') = False then
   begin
      VB_Gravar:= False;
      DBComboBox_Dia_Semana.SetFocus;
   end
   else
   begin
      if Funcoes.ValidaCampo(DBComboBox_Horario.Text, 'O horário ') = False then
      begin
         VB_Gravar:= False;
         DBComboBox_Horario.SetFocus;
      end
      else
      begin
         if Funcoes.ValidaCampo(ComboBox_TrabalhoEscolar.Text, 'A descrição do trabalho escolar ') = False then
         begin
            VB_Gravar:= False;
            ComboBox_TrabalhoEscolar.SetFocus;
         end
         else
         begin
            if Form_Sel_PTS_Novo.VS_Opcao = 'Inserir' then
            begin
               if Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('IdPTS').AsString <> '' then
               begin
                  if Validar.Verificar_PTS_Ja_Cadastrado(Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('IdPTS').AsString, Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('IdSemana').AsString,  Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Dia_Semana').AsString,  Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Horario').AsString) = True then
                  begin
                     VB_Gravar:= False;
                     DBComboBox_Dia_Semana.SetFocus;
                  end;
               end;
            end
            else
            begin
               if (( VS_Horario_Anterior <> Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Horario').AsString) or
                   ( VS_Dia_Semana_Anterior <> Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Dia_Semana').AsString))then
                  if Validar.Verificar_PTS_Ja_Cadastrado(Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('IdPTS').AsString, Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('IdSemana').AsString,  Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Dia_Semana').AsString,  Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Horario').AsString) = True then
                  begin
                     VB_Gravar:= False;
                     DBComboBox_Dia_Semana.SetFocus;
                  end;
            end;
         end;
      end;
   end;

   //--- Tratamento para gravar o PTS

   if VB_Gravar then
   begin
      if (( Form_Sel_PTS_Novo.IBTable_PTS_Principal.State = DSInsert) or ( Form_Sel_PTS_Novo.IBTable_PTS_Principal.State = DSEdit )) then
         Form_Sel_PTS_Novo.IBTable_PTS_Principal.Post;

      if (( Form_Sel_PTS_Novo.IBTable_PTS_Semana.State = DSInsert) or ( Form_Sel_PTS_Novo.IBTable_PTS_Semana.State = DSEdit )) then
         Form_Sel_PTS_Novo.IBTable_PTS_Semana.Post;

      VS_Disciplina:= Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Disciplina').AsString;                   //=>
      VS_TrabalhoEscolar:= Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Trab_Escolar').AsString;         //=>

      Funcoes.ExecutaTransacao;

      AjustarTrabalhoEscolar;

      Funcoes.AtualizaQuery( Form_Sel_PTS_Novo.IBQuery_PTS_Semana );

      if Form_Sel_PTS_Novo.VS_Opcao = 'Inserir' then
      begin
          Tratar_ComboBox_Horario;

          Tratar_Insercao_PTS;
      end
      else
          Close;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao fechar da janela
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Form_Sel_PTS_Novo.VS_Opcao:= 'Consultar';
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Cancela Gravacao
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.JvTransparentButton_CancelarClick( Sender: TObject);
begin

   if (( Form_Sel_PTS_Novo.IBTable_PTS_Semana.State = DSInsert) or ( Form_Sel_PTS_Novo.IBTable_PTS_Semana.State = DSEdit )) then
   begin
      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Dia_Semana').AsString:= '0';
      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Horario').AsString:= '0';
      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Trab_Escolar').AsString:= '0';
      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Local').AsString:= '0';

      Form_Sel_PTS_Novo.IBTable_PTS_Semana.Cancel;
   end;

   if (( Form_Sel_PTS_Novo.IBTable_PTS_Principal.State = DSInsert) or ( Form_Sel_PTS_Novo.IBTable_PTS_Principal.State = DSEdit )) then
       Form_Sel_PTS_Novo.IBTable_PTS_Principal.Cancel;

   Funcoes.abortaTransacao;

   Fechar(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para Fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.Fechar(Sender: TObject);
begin
   Form_Sel_PTS_Novo.VS_Opcao:= 'Consultar';
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento da opção de selecao do DBCombox_Dia
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_Dia_SemanaEnter(Sender: TObject);
begin
   Validar.DBComboBox_Enter(DBComboBox_Dia_Semana);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o JvDBRichEdit_Msg Enter
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_Dia_SemanaExit(Sender: TObject);
begin
   Validar.DBComboBox_Exit(DBComboBox_Dia_Semana);

   Tratar_ComboBox_Horario;
end;

//------------------------------------------------------------------------------
// Tratamento para filtrar a semana selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.Tratar_ComboBox_Horario;
begin
   Funcoes.OpenQuery( 'select horario '+
                      ' From pts_horario '+
                      ' Where horario not in ( select s.horario '+
                      '                        From pts_principal p, pts_semana s '+
                      '                        Where p.idcurso =  '+DM.IBQuery_MontaTurma.FieldByName('idcurso').AsString+
                      '                        and   p.idturma = '+DM.IBQuery_MontaTurma.FieldByName('idturma').AsString+
                      '                        and   p.IdPts = s.IdPts '+
                      '                        and   idsemana = '+Form_Sel_PTS_Novo.ComboBox_Semana.Text+
                      '                        and   s.dia_semana = '+#39+DBComboBox_Dia_Semana.Text+#39+
                      '                       )'
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
// Tratamento da opção de selecao do ComboBox_TrabalhoEscolar Change
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.ComboBox_TrabalhoEscolarChange(Sender: TObject);
begin
   VB_Validar_ComboBox_TrabalhoEscolar:= True;
end;

//------------------------------------------------------------------------------
// Tratamento da opção de selecao do ComboBox_TrabalhoEscolar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.ComboBox_TrabalhoEscolarEnter( Sender: TObject);
begin
   VB_Validar_ComboBox_TrabalhoEscolar:= True;
end;

procedure TForm_Cad_PTS_Novo.ComboBox_TrabalhoEscolarExit(Sender: TObject);
begin
   Validar_ComboBox_TrabalhoEscolar;
   Validar.ComboBox_Exit(ComboBox_TrabalhoEscolar);
end;

procedure TForm_Cad_PTS_Novo.ComboBox_TrabalhoEscolarSelect(Sender: TObject);
begin
   Validar_ComboBox_TrabalhoEscolar;
   VB_Validar_ComboBox_TrabalhoEscolar:= False;

end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o ComboBox do horario Enter
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_HorarioEnter(Sender: TObject);
begin
   Validar.DBComboBox_Enter(DBComboBox_Horario);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o DBComboBox_Local do horario Enter
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_LocalEnter(Sender: TObject);
begin
   Validar.DBComboBox_Enter(DBComboBox_Local);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o DBComboBox_Local do horario Exit
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_LocalExit(Sender: TObject);
begin
   Validar.DBComboBox_Exit(DBComboBox_Local);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o JvDBRichEdit_Msg Enter
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.JvDBRichEdit_MsgEnter(Sender: TObject);
begin
   Validar.JvDBRichEdit_Enter(JvDBRichEdit_Msg);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o DBComboBox_Horario Exit
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_HorarioExit(Sender: TObject);
begin
   Validar.DBComboBox_Exit(DBComboBox_Horario);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o DBComboBox_TrabalhoEscolar Exit
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_TrabalhoEscolarExit(Sender: TObject);
begin
   Validar.ComboBox_Exit(ComboBox_TrabalhoEscolar);
   TrabalhoEscolar('Inserir');
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o vDBRichEdit_Msg Exit
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.JvDBRichEdit_MsgExit(Sender: TObject);
begin
   Validar.JvDBRichEdit_Exit(JvDBRichEdit_Msg);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o DBComboBox_Disciplina Enter
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_DisciplinaEnter(Sender: TObject);
begin
   Validar.DBComboBox_Enter(DBComboBox_Disciplina);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o DBComboBox_Disciplina Exit
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_DisciplinaExit(Sender: TObject);
begin
   Validar.DBComboBox_Exit(DBComboBox_Disciplina);
   Disciplina('Inserir');
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o DBComboBox_QtdInstruores Enter
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_QtdInstruoresEnter(Sender: TObject);
begin
//   Validar.DBComboBox_Exit(DBComboBox_QtdInstruores);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o DBComboBox_QtdInstruores Exit
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_QtdInstruoresExit(Sender: TObject);
begin
//   Validar.DBComboBox_Exit(DBComboBox_QtdInstruores);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona o DBComboBox_Especialidade Enter
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.DBComboBox_EspecialidadeEnter(Sender: TObject);
begin
//   Validar.DBComboBox_Enter(DBComboBox_Especialidade);
end;

//------------------------------------------------------------------------------
// Verificacao da disciplina
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.Disciplina(VS_Opcao: String);
begin
   if ((trim(DBComboBox_Disciplina.Text) <> '') and (VS_CodigoDisciplina_Anterior <> trim(DBComboBox_Disciplina.Text))) then
   begin
      Funcoes.OpenQuery(' Select distinct NomeMateria '+
                        ' From MateriaCurso '+
                        ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('idcurso').AsString+
                        ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('idturma').AsString+
                        ' and CodMateria = '+#39+DBComboBox_Disciplina.Text+#39);

      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('TRAB_ESCOLAR').AsString:= Funcoes.AjustarMaiscula(UpperCase( DM.IBQuery_Executa.FieldByName('NomeMateria').AsString));
      ComboBox_TrabalhoEscolar.Text:= Funcoes.AjustarMaiscula(UpperCase( DM.IBQuery_Executa.FieldByName('NomeMateria').AsString));

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

procedure TForm_Cad_PTS_Novo.TrabalhoEscolar(VS_Opcao: String);
begin
   if ((trim(ComboBox_TrabalhoEscolar.Text) <> '') and (VS_Trabalho_Escolar_Anterior <> trim(ComboBox_TrabalhoEscolar.Text))) then
   begin
      VS_CodMateria:= Funcoes.TrocarAcentoPor_(ComboBox_TrabalhoEscolar.Text);
      Funcoes.OpenQuery( 'Select distinct CodMateria '+
                         ' From MateriaCurso '+
                         ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('idcurso').AsString+
                         ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('idturma').AsString+
                         ' and upper(NomeMateria) like '+#39+'%'+copy(VS_CodMateria, 10, Length(VS_CodMateria))+'%'+#39
                       );

      Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Disciplina').AsString:= DM.IBQuery_Executa.FieldByName('CodMateria').AsString;
      DBComboBox_Disciplina.Text:= DM.IBQuery_Executa.FieldByName('CodMateria').AsString;

      VS_CodMateria:= DM.IBQuery_Executa.FieldByName('CodMateria').AsString;

      if VS_Opcao = 'Inserir' then
         DBComboBox_Local.SetFocus;
   end
   else
   begin
      if VS_Opcao = 'Inserir' then
         DBComboBox_Disciplina.Text:= '';
   end;

   if VS_Opcao = 'Inserir' then
       DBComboBox_Local.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento para ajustar o trabalho Escolar e eselecionar a disciplina em todo PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.AjustarTrabalhoEscolar;
begin
   if VS_CodMateria <> '-1-1-1' then
      Funcoes.ExecusaoQuery( ' Update PTS_Semana set Disciplina = '+#39+VS_CodMateria+#39+', '+
                             '                       Trab_Escolar = '+#39+Funcoes.AjustarMaiscula(UpperCase(copy(ComboBox_TrabalhoEscolar.Text, 10, Length(ComboBox_TrabalhoEscolar.Text))))+#39+
                             ' where idpts = '+Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('IDPTS').AsString+
                             ' and   Trab_Escolar = '+#39+VS_Trabalho_Escolar_Anterior+#39
                           );
end;

//------------------------------------------------------------------------------
//  Insere a disciplina Base na Turma selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.InserirDisciplinaBase;
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
      update;

      DM.IBTable_Materia.Close;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para validar o ComboBox_TrabalhoEscolar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS_Novo.Validar_ComboBox_TrabalhoEscolar;
begin
   if VB_Validar_ComboBox_TrabalhoEscolar = True then
   begin
      if ( Copy(ComboBox_TrabalhoEscolar.Text,1,6) = '------' ) then
      begin
         ShowMessage('Não é permitido selecionar a referência...'+#13+ComboBox_TrabalhoEscolar.Text);
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
               Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Disciplina').AsString:= '';

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

         Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Disciplina').AsString:= DBComboBox_Disciplina.Text;
         Form_Sel_PTS_Novo.IBTable_PTS_Semana.FieldByName('Trab_Escolar').AsString:= ComboBox_TrabalhoEscolar.Text;
         VB_Validar_ComboBox_TrabalhoEscolar:= False;

         update;

         TrabalhoEscolar('Inserir');
      end;
   end;

end;


end.

