//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_Turma.pas                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da Turma.                                      //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 16/07/2011                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//
unit Cad_Turma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, DBCtrls, JvToolEdit, JvDBCtrl,
  ExtCtrls, Buttons, Mask, DB, IBCustomDataSet, IBTable, Rotinas, Rotinas_Sue,
  JvComponent, JvArrowBtn, JvSpeedButton, Menus, JvEnterTab, JvGradient,
  Grids, DBGrids, JvTransBtn, JvShape;

type
  TForm_Cad_Turma = class(TForm)
    GroupBox_DadodCurso: TGroupBox;
    GroupBox_DadosTurma: TGroupBox;
    Label38: TLabel;
    DBEdit_Turma: TDBEdit;
    DBEdit_Local1: TDBEdit;
    DBEdit_Coordenador: TDBEdit;
    JvDBDateEdit_DataInicio: TJvDBDateEdit;
    JvDBDateEdit_DataTermino: TJvDBDateEdit;
    JvDBDateEdit_DataTerminoDist: TJvDBDateEdit;
    JvDBDateEdit_DataInicioDist: TJvDBDateEdit;
    DBEdit_Ano: TDBEdit;
    DBComboBox_Modalidade: TDBComboBox;
    DBComboBox_SalaAula: TDBComboBox;
    GroupBox_PrevisaoAlunos: TGroupBox;
    JvEnterAsTab1: TJvEnterAsTab;
    DBEdit_Descricao: TDBEdit;
    DBEdit_QtdBrasileiros: TDBEdit;
    DBEdit_QtdEstrangeiros: TDBEdit;
    Label16: TLabel;
    Label13: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label_Modalidade: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label_DTD: TLabel;
    Label_DID: TLabel;
    Label_Local1: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    DBRadioGroup_Situacao: TDBRadioGroup;
    Memo_Dicas02: TMemo;
    DBComboBox_Radio: TDBComboBox;
    JvGradient3: TJvGradient;
    Memo_Dicas01: TMemo;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    Label5: TLabel;
    DBComboBox_ParticipaEstatitiscaCurso: TDBComboBox;
    Label6: TLabel;
    Label_Local2: TLabel;
    DBEdit_Local2: TDBEdit;
    JvShape_Fechar: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    Label_CodigoCurso: TLabel;
    Label_NomeCurso: TLabel;
    GroupBox_Planejamento: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    DBEdit_Avaliacao: TDBEdit;
    DBEdit_Flexibilidade: TDBEdit;
    DBEdit_Instrucao: TDBEdit;
    DBEdit_Administracao: TDBEdit;

    procedure Fechar;
    procedure TratamentoCursoDistancia(Status: Boolean);

    procedure FormActivate(Sender: TObject);
    procedure JvDBDateEdit_DataInicioExit(Sender: TObject);
    procedure DBComboBox_ModalidadeExit(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
  private    { Private declarations }
      VS_TerminoTurma: String;
  public
    { Public declarations }
  end;

var
  Form_Cad_Turma: TForm_Cad_Turma;

implementation

uses Sel_Turma, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento quando Abre a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Turma.FormActivate(Sender: TObject);
var
   VB_Status: Boolean;
begin
   if Form_Cad_Turma.Caption = 'Sistema de Gerenciamento do Ensino --> Consulta Turma' then
   begin
      VB_Status:= False;

      JvShape_Fechar.Visible:= True;
      JvTransparentButton_Fechar.Visible:= True;
   end
   else
   begin
      VB_Status:= True;

      JvShape_Fechar.Visible:= False;
      JvTransparentButton_Fechar.Visible:= False;
      //--- Tratamento para alimentar os combos

      Funcoes_SUE.AlimentaDBComboBox(DBComboBox_SalaAula, 'CodSala', 'SalaAula', '', 'CodSala');

      if DM.IBTable_Turma.FieldByName('Descricao').AsString = '' then
         DM.IBTable_Turma.FieldByName('Descricao').AsString:= Form_SelTurma.Label_DescricaoCurso.Caption;

      //--- Tratamento para mostrar as informacoes do Curso

      if (DM.IBTable_Turma.State = DSEdit) then
         VS_TerminoTurma:= DM.IBTable_Turma.FieldByName('DataTermino').AsString
      else
         DM.IBTable_Turma.FieldByName('PARTICIPA_ESTATISTICA').AsString:= 'S';
   end;

   Label_CodigoCurso.Caption:= Funcoes.GetCodCurso;
   Label_NomeCurso.Caption:= Form_SelTurma.Label_DescricaoCurso.Caption;

   if DBComboBox_Modalidade.Text = 'Presencial' then
      TratamentoCursoDistancia(False)
   else
      TratamentoCursoDistancia(True);

   GroupBox_DadodCurso.Enabled:= VB_Status;
   GroupBox_DadosTurma.Enabled:= VB_Status;
   GroupBox_PrevisaoAlunos.Enabled:= VB_Status;

   JvShape_Gravar.Visible:= VB_Status;
   JvTransparentButton_Grava.Visible:= VB_Status;

   JvShape_Cancelar.Visible:= VB_Status;
   JvTransparentButton_Cancelar.Visible:= VB_Status;

   Memo_Dicas01.Visible:= VB_Status;
   
   if Form_Cad_Turma.Caption <> 'Sistema de Gerenciamento do Ensino --> Consulta Turma' then
      DBEdit_Turma.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_Turma.JvTransparentButton_GravaClick(Sender: TObject);
begin
   if (JvDBDateEdit_DataInicio.Text = '  /  /    ') then
   begin
      ShowMessage('A Data de Inicio da turma não pode ser branco');
      JvDBDateEdit_DataInicio.SetFocus;
   end
   else
      begin
      if (JvDBDateEdit_DataTermino.Text = '  /  /    ') then
      begin
         ShowMessage('A Data de Termino da turma não pode ser branco');
         JvDBDateEdit_DataInicio.SetFocus;
      end
      else
      begin
         if Funcoes.ValidaCampo(DBEdit_Turma.Text, 'A descrição da Turma') = False then
            DBEdit_Turma.SetFocus
         else
         begin
            if Funcoes.ValidaCampo(DBEdit_Ano.Text, 'O Ano') = False then
               DBEdit_Ano.SetFocus
            else
            begin
               if ((DM.IBTable_Turma.State = DSInsert) or (DM.IBTable_Turma.State = DSEdit )) then
               begin
                  if ((DM.IBTable_Turma.State = DSEdit) and (VS_TerminoTurma <> DM.IBTable_Turma.FieldByName('DataTermino').AsString)) then
                  begin
                     Funcoes.ExecusaoQuery('Update AlunoTurma set DataDesligamento = '+#39+Funcoes.TratarData(DM.IBTable_Turma.FieldByName('DataTermino').AsString)+#39+
                                           ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                                           ' and   IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+
                                           ' and   MotivoDesligamento = '+#39+'a'+#39
                                          );
                  end;

                  DM.IBTable_Turma.Post;

                  Fechar;
               end;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Cancela Gravacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Turma.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   if ((DM.IBTable_Turma.State = DSInsert) or (DM.IBTable_Turma.State = DSEdit )) then
      DM.IBTable_Turma.Cancel;

   Fechar;
end;

//------------------------------------------------------------------------------
// Tratamento para Fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Turma.Fechar;
var
   Sender: TObject;
begin
   Funcoes.ExecutaTransacao;
   Form_SelTurma.Monta_ComboTurma;
   Form_SelTurma.ChamaTodosAluno(Sender);
   Form_SelTurma.MontaInstrutor(Sender);

   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para Data de Termino quanto a data de Inicio
//------------------------------------------------------------------------------

procedure TForm_Cad_Turma.JvDBDateEdit_DataInicioExit(Sender: TObject);
begin
   Funcoes.OpenQuery('Select NumeroSemanaAulas from Curso where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString);
   if DM.IBQuery_Executa.FieldByName('NumeroSemanaAulas').AsString <> '0' then
      JvDBDateEdit_DataTermino.Date:= JvDBDateEdit_DataInicio.Date+((DM.IBQuery_Executa.FieldByName('NumeroSemanaAulas').AsInteger*7)-3)
end;

//------------------------------------------------------------------------------
// Tratamento do Curso a Distanca de Acordo com a Modalidade
//------------------------------------------------------------------------------

procedure TForm_Cad_Turma.DBComboBox_ModalidadeExit(Sender: TObject);
begin
   if DBComboBox_Modalidade.Text = 'Semi' then
      TratamentoCursoDistancia(True)
   else
      TratamentoCursoDistancia(False)
end;

//------------------------------------------------------------------------------
// Tratamento para Curso a Distancia
//------------------------------------------------------------------------------

procedure TForm_Cad_Turma.TratamentoCursoDistancia(Status: Boolean);
begin
   Label_DID.Visible:= Status;
   JvDBDateEdit_DataInicioDist.Visible:= Status;
   Label_DTD.Visible:= Status;
   JvDBDateEdit_DataTerminoDist.Visible:= Status;
   Label_Local2.Visible:= Status;
   DBEdit_Local2.Visible:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Fechar
//------------------------------------------------------------------------------

procedure TForm_Cad_Turma.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

end.
