//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SGEW                                    //
//                                                                            //
// PROGRAMA                  : Avaliacao.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da avaliacao.                                  //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/02/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_GQA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, ImgList, DB, DBTables, StdCtrls, Mask,
  Buttons, ExtCtrls, Rotinas, Grids, DBGrids, DBCtrls, IBCustomDataSet,
  IBTable, IBQuery, JvRichEd, JvDBRichEd, JvMaskEdit, JvSpin, JvDBSpinEdit,
  JvDBCtrl, JvCombobox, JvColorCombo, ClipBrd, ValEdit, JvComponent,
  JvxClock, JvBaseThumbnail, JvThumbImage, JvDlg, JvBalloonHint, JvEnterTab,
  JvEdit, JvGradient, JvxCtrls, JvShape, JvCaptionPanel, JvTransBtn;


type
  TForm_Cad_QGA = class(TForm)
    Table_Avaliacao: TIBTable;
    Table_AvaliacaoIDCURSO: TSmallintField;
    Table_AvaliacaoFASEAPLICACAO: TIBStringField;
    Table_AvaliacaoREFERENCIAAVALIACAO: TIBStringField;
    Table_AvaliacaoCODMATERIA: TIBStringField;
    Table_AvaliacaoMEDIAPARCIAL: TIBStringField;
    Table_AvaliacaoPESOAPLICACAO: TSmallintField;
    Table_AvaliacaoMEDIAMINIMA: TIBBCDField;
    Table_AvaliacaoCODPROVA: TIBStringField;
    DST_Avaliacao: TDataSource;
    Table_AvaliacaoPESODISCIPLINA: TSmallintField;
    PageControl_CadQGA: TPageControl;
    TabSheet_Disciplina: TTabSheet;
    TabSheet_Abrangencia: TTabSheet;
    IBTable_Abrangencia: TIBTable;
    DST_abrangencia: TDataSource;
    IBQuery_Materia: TIBQuery;
    IBQuery_MateriaIDCURSO: TSmallintField;
    IBQuery_MateriaCODMATERIA: TIBStringField;
    IBQuery_MateriaNOMEMATERIA: TIBStringField;
    DSQ_Materia: TDataSource;
    Table_AvaliacaoIDTURMA: TIntegerField;
    Table_AvaliacaoMEDIA: TIBStringField;
    Table_AvaliacaoOBSERVACAO: TIBStringField;
    IBTable_AbrangenciaIDCURSO: TSmallintField;
    IBTable_AbrangenciaIDTURMA: TIntegerField;
    IBTable_AbrangenciaFASEAPLICACAO: TIBStringField;
    IBTable_AbrangenciaREFERENCIAAVALIACAO: TIBStringField;
    IBTable_AbrangenciaCODMATERIA: TIBStringField;
    IBTable_AbrangenciaMATERIA: TIBStringField;
    Memo_Msg01: TMemo;
    Edit_Referencia: TEdit;
    ComboBox_Referencia: TComboBox;
    ComboBox_Prova: TComboBox;
    Edit_Prova: TEdit;
    ComboBox_MediaParcial: TComboBox;
    DBComboBox_Fase_Aplicacao: TDBComboBox;
    DBEdit_Media_Minima: TDBEdit;
    DBComboBox_GrauParcial: TDBComboBox;
    DBComboBox_PesoDisciplina: TDBComboBox;
    DBRichEdit_Observacao: TDBRichEdit;
    DBComboBox_CalculoMedia: TDBComboBox;
    Memo_Msg_03: TMemo;
    Table_AvaliacaoORDEM: TIntegerField;
    JvCaptionPanel1: TJvCaptionPanel;
    DBGrid_Materia: TDBGrid;
    DBNavigator2: TDBNavigator;
    Panel4: TPanel;
    SpeedButton_Cadastra: TSpeedButton;
    SpeedButton_Excluir: TSpeedButton;
    JvCaptionPanel2: TJvCaptionPanel;
    DBGrid_Abrangencia: TDBGrid;
    DBEdit_Ordem: TDBEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    JvGradient_Tela: TJvGradient;
    Label_Media_Minima: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label_Fase_Aplicacao: TLabel;
    Label_Peso_Aplicacao: TLabel;
    Label_Disciplina: TLabel;
    Label79: TLabel;
    Label_Referencia: TLabel;
    JvEnterAsTab2: TJvEnterAsTab;
    Panel_Botoes: TPanel;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    Memo_Msg02: TMemo;

    procedure Inserir;
    procedure Alterar;
    Function Verifica_Referencia: Char;
    procedure TratarNumero(Sender: TObject;var Key: Char);

    procedure FormActivate(Sender: TObject);
    procedure ComboBox_ReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_ProvaKeyPress(Sender: TObject; var Key: Char);
    procedure Table_AvaliacaoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure Edit_ReferenciaExit(Sender: TObject);
    procedure ComboBox_ReferenciaExit(Sender: TObject);
    procedure SpeedButton_CadastraClick(Sender: TObject);
    procedure SpeedButton_ExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick( Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
  private    { Private declarations }
     FaseAplicacao_Ant, ReferenciaAvaliacao_Ant, CodMateria_ant: String;

  public
    { Public declarations }
  end;

var
  Form_Cad_QGA: TForm_Cad_QGA;

implementation

uses Sel_QGA, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Cad_QGA.FormActivate(Sender: TObject);
begin
   JvGradient_Tela.StartColor:= Cor_Tela;

   Table_Avaliacao.Open;
   IBQuery_Materia.Open;
   IBTable_Abrangencia.Open;

   if Form_Sel_QGA.VS_Opcao = 'Inserir' then
   begin
      TabSheet_Abrangencia.TabVisible:= False;
      Inserir;
   end
   else
   begin
      TabSheet_Abrangencia.TabVisible:= True;
      Alterar;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_QGA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Table_Avaliacao.Close;
   IBQuery_Materia.Close;
   IBTable_Abrangencia.Close;
   Action:= caFree;
end;


//------------------------------------------------------------------------------
//
// Tratamento Avaliacao - 22/02/2006
//
//------------------------------------------------------------------------------

//----------------------------------------------------------------------------//
// Esta procedure tem funcao de tratar da validade do nº do exame teorico
//----------------------------------------------------------------------------//

Function TForm_Cad_QGA.Verifica_Referencia: Char;
var
   VC_Retorno_Ref: Char;
begin
   Funcoes.OpenQuery('Select * from curso where idCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString);
   VC_Retorno_Ref:= '0';
   if (( ComboBox_Referencia.Text = 'T' ) and (StrToInt(Edit_Referencia.Text) > DM.IBQuery_Executa.FieldByName( 'TotalExamesTeoricos').AsInteger)) then
       VC_Retorno_Ref:= '1'
   else
      if (StrToInt(Edit_Referencia.Text) > DM.IBQuery_Executa.FieldByName( 'TotalExamesPraticos').AsInteger) then
         VC_Retorno_Ref:= '2';
   Verifica_Referencia:= VC_Retorno_Ref;
end;

//------------------------------------------------------------------------------
// Tratamento do botao nova Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Cad_QGA.Inserir;
begin
   Funcoes.GravaAcesso('Menu Principal - Quadro Global de Avaliação', 'Inserir');
   PageControl_CadQGA.TabIndex:= 0;

   Table_Avaliacao.Append;
   Edit_Referencia.Text:= '  ';
   ComboBox_Referencia.Text:= 'T';
   Edit_Prova.Text:= '';
   ComboBox_Prova.Text:= 'PT';
   DBComboBox_Fase_Aplicacao.Text:= '  ';
   DBComboBox_GrauParcial.Text:= '1';
   DBComboBox_PesoDisciplina.Text:= '1';

   FaseAplicacao_Ant:= '';
   ReferenciaAvaliacao_Ant:= '';
   CodMateria_ant:= '';

   Table_Avaliacao.FieldByName( 'Media').AsString:= 'S';
   Table_Avaliacao.FieldByName( 'MediaMinima').AsString:= '7,00';
   Table_Avaliacao.FieldByName( 'PesoDisciplina').AsString:= '1';
   Table_Avaliacao.FieldByName( 'PesoAplicacao').AsString:= '1';
   Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString:= '1';
   Edit_Referencia.SetFocus;
   Edit_Referencia.SelectAll;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Altera Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Cad_QGA.Alterar;
begin
   Funcoes.GravaAcesso('Menu Principal - Quadro Global de Avaliação', 'Alterar');
   PageControl_CadQGA.TabIndex:= 0;

   if trim(Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString) <> '' then
      Edit_Referencia.Text:= FormatFloat('00', StrToInt(Copy(Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString,1,2) ));
   ComboBox_Referencia.Text:= Copy( Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString,3,1 );
   ComboBox_MediaParcial.Text:= Copy(Table_Avaliacao.FieldByName( 'MediaParcial').AsString,1,2);
   Edit_Prova.Text:= Copy( Table_Avaliacao.FieldByName( 'CodProva').AsString,3,2 );
   ComboBox_Prova.Text:= Copy( Table_Avaliacao.FieldByName( 'CodProva').AsString,1,2);


   FaseAplicacao_Ant:= Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString;
   ReferenciaAvaliacao_Ant:= FormatFloat('00',StrToInt(Edit_Referencia.Text))+ComboBox_Referencia.Text;
   CodMateria_ant:= ComboBox_MediaParcial.Text+'0000';

   Table_Avaliacao.Edit;
   Edit_Referencia.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de gravacao dos dados inseridos ou alterados Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Cad_QGA.JvTransparentButton_GravarClick(Sender: TObject);
var
   VI_Retorno: Integer;
begin
   if ((Table_Avaliacao.State = DSInsert) or (Table_Avaliacao.State = DSEdit )) then
   begin
      if trim(ComboBox_MediaParcial.Text) = '' then
      begin
         Showmessage('A Média Parcial (MP) não pode ser branco...');
         ComboBox_MediaParcial.SetFocus;
      end
      else
      begin
         if trim(DBEdit_Media_Minima.Text) = '' then
         begin
            Showmessage('Média Miníma não pode ser branco...');
            DBEdit_Media_Minima.SetFocus;
         end
         else
         begin
            if trim(DBComboBox_GrauParcial.Text) = '' then
            begin
               Showmessage('O Grau Parcial(GP) não pode ser branco...');
               DBComboBox_GrauParcial.SetFocus;
            end
            else
            begin
               if trim(DBComboBox_PesoDisciplina.Text) = '' then
               begin
                  Showmessage('O Peso não pode ser branco...');
                  DBComboBox_PesoDisciplina.SetFocus;
               end
               else
               begin
                  if trim(DBComboBox_Fase_Aplicacao.Text) = '' then
                  begin
                     Showmessage('Fase Aplicação (Fase) não pode ser branco...');
                     DBComboBox_Fase_Aplicacao.SetFocus;
                  end
                  else
                  begin
                     Funcoes.GravaAcesso('Menu Principal - Quadro Global de Avaliação', 'Gravar');

                     Table_Avaliacao.FieldByName( 'IdCurso').AsString:= Form_Sel_QGA.IBQuery_MontaQGA.FieldByName( 'IdCurso').AsString;

                     Table_Avaliacao.FieldByName( 'IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
                     Table_Avaliacao.FieldByName( 'IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
                     Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString:= FormatFloat('00',StrToInt(Edit_Referencia.Text))+ComboBox_Referencia.Text;
                     Table_Avaliacao.FieldByName( 'CodProva').AsString:= ComboBox_Prova.Text+FormatFloat('00',StrToInt(Edit_Prova.Text));
                     Table_Avaliacao.FieldByName( 'MediaParcial').AsString:= ComboBox_MediaParcial.Text+'0000';
                     Table_Avaliacao.FieldByName( 'CodMateria').AsString:= ComboBox_MediaParcial.Text+'0000';
                     Table_Avaliacao.Post;
                     Funcoes.ExecutaTransacao;

                     if ((FaseAplicacao_Ant <> '') and (ReferenciaAvaliacao_Ant <> '') and (CodMateria_ant <> '')) then
                     begin
                         Funcoes.ExecusaoQuery('Update Teste set FaseAplicacao = '+#39+Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString+#39+', '+
                                                                'ReferenciaAvaliacao = '+#39+FormatFloat('00',StrToInt(Edit_Referencia.Text))+ComboBox_Referencia.Text+#39+', '+
                                                                'CodMateria = '+#39+ComboBox_MediaParcial.Text+'0000'+#39+
                                               ' where idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                               ' and FaseAplicacao = '+#39+FaseAplicacao_Ant+#39+
                                               ' and ReferenciaAvaliacao = '+#39+ReferenciaAvaliacao_Ant+#39+
                                               ' and CodMateria = '+#39+CodMateria_ant+#39
                                              );

                         Funcoes.ExecusaoQuery('Update ItemTeste set FaseAplicacao = '+#39+Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString+#39+', '+
                                                                    'ReferenciaAvaliacao = '+#39+FormatFloat('00',StrToInt(Edit_Referencia.Text))+ComboBox_Referencia.Text+#39+', '+
                                                                    'CodMateria = '+#39+ComboBox_MediaParcial.Text+'0000'+#39+
                                               ' where idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                               ' and FaseAplicacao = '+#39+FaseAplicacao_Ant+#39+
                                               ' and ReferenciaAvaliacao = '+#39+ReferenciaAvaliacao_Ant+#39+
                                               ' and CodMateria = '+#39+CodMateria_ant+#39
                                              );

                         Funcoes.ExecusaoQuery('Update ItemTesteManual set FaseAplicacao = '+#39+Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString+#39+', '+
                                                                    'ReferenciaAvaliacao = '+#39+FormatFloat('00',StrToInt(Edit_Referencia.Text))+ComboBox_Referencia.Text+#39+', '+
                                                                    'CodMateria = '+#39+ComboBox_MediaParcial.Text+'0000'+#39+
                                               ' where idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                               ' and FaseAplicacao = '+#39+FaseAplicacao_Ant+#39+
                                               ' and ReferenciaAvaliacao = '+#39+ReferenciaAvaliacao_Ant+#39+
                                               ' and CodMateria = '+#39+CodMateria_ant+#39
                                              );

                         Funcoes.ExecusaoQuery('Update TesteAbrangencia set FaseAplicacao = '+#39+Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString+#39+', '+
                                                                    'ReferenciaAvaliacao = '+#39+FormatFloat('00',StrToInt(Edit_Referencia.Text))+ComboBox_Referencia.Text+#39+', '+
                                                                    'CodMateria = '+#39+ComboBox_MediaParcial.Text+'0000'+#39+
                                               ' where idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                               ' and FaseAplicacao = '+#39+FaseAplicacao_Ant+#39+
                                               ' and ReferenciaAvaliacao = '+#39+ReferenciaAvaliacao_Ant+#39+
                                               ' and CodMateria = '+#39+CodMateria_ant+#39
                                              );

                     end;

                     if ( Verifica_Referencia = '1' ) then
                     begin
                         Funcoes.ExecusaoQuery('Update CURSO set TotalExamesTeoricos = '+Edit_Referencia.Text+
                                               ' where idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString
                                               );
                     end;

                     Funcoes.AtualizaQuery(Form_Sel_QGA.IBQuery_MontaQGA);


                     if ( Verifica_Referencia = '2' ) then
                     begin
                        Funcoes.ExecusaoQuery('Update CURSO set TotalExamesPraticos = '+Edit_Referencia.Text+
                                              ' where idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString
                                             );
                     end;

                     if Form_Sel_QGA.VS_Opcao = 'Inserir' then
                     begin
                        VI_Retorno:= Application.MessageBox('Deseja inserir a Abrangencia da Prova inserida ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
                        if VI_Retorno = IDYes then
                        begin

                           TabSheet_Abrangencia.TabVisible:= True;
                           PageControl_CadQGA.TabIndex:= 1;
                           Funcoes.AtualizaQuery(IBQuery_Materia);
                           IBTable_Abrangencia.Close;
                           IBTable_Abrangencia.Open;
                           DBGrid_Materia.SetFocus;
                        end
                        else
                        begin
                            Inserir;
                        end;
                     end
                     else
                     begin
                        Close;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Cad_QGA.JvTransparentButton_CancelarClick( Sender: TObject);
begin
   Funcoes.GravaAcesso('Menu Principal - Quadro Global de Avaliação', 'Cancelar');
   Table_Avaliacao.Cancel;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(Form_Sel_QGA.IBQuery_MontaQGA);
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento que obriga a entrar somente com numero na referencia
//------------------------------------------------------------------------------

procedure TForm_Cad_QGA.Edit_ReferenciaExit(Sender: TObject);
begin
   if trim(Edit_Referencia.Text) = '' then
   begin
      ShowMessage('A Referência da Prova não pode ser branco...');
      Edit_Referencia.SetFocus;
      Edit_Referencia.SelectAll;
   end
   else
   begin
      DBEdit_Ordem.Text:= IntToStr(StrToInt(Edit_Referencia.Text))+'0';
      Edit_Referencia.Text:=  FormatFloat('00', StrToInt(Edit_Referencia.Text));
      Edit_Prova.Text:=  Edit_Referencia.Text;
   end;
end;

procedure TForm_Cad_QGA.ComboBox_ReferenciaKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= Upcase(Key);
   if not (key in['P','T', chr(8)]) then
       key:= #0;
end;

procedure TForm_Cad_QGA.ComboBox_ReferenciaExit(Sender: TObject);
begin
   if (ComboBox_Referencia.Text = 'R') then
      ComboBox_Prova.Text:= 'RT'
   else
   begin
      ComboBox_Prova.Text:= 'P'+ComboBox_Referencia.Text;
      ComboBox_MediaParcial.SetFocus;
   end;
end;

procedure TForm_Cad_QGA.ComboBox_ProvaKeyPress(Sender: TObject;var Key: Char);
begin
   Key:= Upcase(Key);
   if not (key in['P','T', chr(8)]) then
       key:= #0
end;

procedure TForm_Cad_QGA.TratarNumero(Sender: TObject;var Key: Char);
begin
   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Tratamento de eero quando for duplicacaco de registro
//------------------------------------------------------------------------------

procedure TForm_Cad_QGA.Table_AvaliacaoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
   ShowMessage('Já existe Avaliação cadastrada com a Referencia '+Edit_Referencia.Text+ComboBox_Referencia.Text+' e com Media Parcial '+ComboBox_MediaParcial.Text+'...');
   Abort;
   Edit_Referencia.SetFocus;
end;

//------------------------------------------------------------------------------
//
// Tratamento da Abrangencia da Prova
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Cadastra abrangencia
//------------------------------------------------------------------------------

procedure TForm_Cad_QGA.SpeedButton_CadastraClick(Sender: TObject);
var
    VS_Comando: String;
   contador: Integer;
begin
   if trim(IBQuery_Materia.FieldByName('CodMateria').AsString) <> '' then
   begin
      With DBGrid_Materia do
      Begin
         for contador:= 0 to Pred(SelectedRows.Count) do
         Begin
            Datasource.Dataset.Bookmark:= SelectedRows[contador]; // posiciona nos registros selecionados do DBGrid

            //--- Verificacao sa a abrangencia ja foi cadastrada

            VS_Comando:= ' Select count(1) Qtd from Abrangencia_prova '+
                         ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                         ' and IdTurma = '+Table_Avaliacao.FieldByName('IdTurma').AsString+
                         ' and faseAplicacao = '+#39+Table_Avaliacao.FieldByName('faseAplicacao').AsString+#39+
                         ' and ReferenciaAvaliacao = '+#39+Table_Avaliacao.FieldByName('ReferenciaAvaliacao').AsString+#39+
                         ' and CodMateria = '+#39+Table_Avaliacao.FieldByName('CodMateria').AsString+#39+
                         ' and Materia = '+#39+IBQuery_Materia.FieldByName( 'codMateria').AsString+#39;

            if Funcoes.QtdRegistro(VS_Comando) = 0 then
            begin
               IBTable_Abrangencia.Append;
               IBTable_Abrangencia.FieldByName( 'IdCurso').AsString:= Form_Sel_QGA.IBQuery_MontaQGA.FieldByName( 'IdCurso').AsString;
               IBTable_Abrangencia.FieldByName( 'IdTurma').AsString:= Form_Sel_QGA.IBQuery_MontaQGA.FieldByName( 'IdTurma').AsString;
               IBTable_Abrangencia.FieldByName( 'faseAplicacao').AsString:= Table_Avaliacao.FieldByName( 'faseAplicacao').AsString;
               IBTable_Abrangencia.FieldByName( 'ReferenciaAvaliacao').AsString:= Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString;
               IBTable_Abrangencia.FieldByName( 'CodMateria').AsString:= Table_Avaliacao.FieldByName( 'codMateria').AsString;
               IBTable_Abrangencia.FieldByName( 'Materia').AsString:= IBQuery_Materia.FieldByName( 'codMateria').AsString;
               IBTable_Abrangencia.Post;
            end
            else
            begin
               Funcoes.OpenQuery(' Select CodProva from Avaliacao '+
                                 ' where IdCurso = '+Form_Sel_QGA.IBQuery_MontaQGA.FieldByName( 'IdCurso').AsString+
                                 ' and IdTurma = '+Form_Sel_QGA.IBQuery_MontaQGA.FieldByName( 'IdTurma').AsString+
                                 ' and faseAplicacao = '+#39+Table_Avaliacao.FieldByNAme('faseAplicacao').AsString+#39+
                                 ' and ReferenciaAvaliacao = '+#39+Table_Avaliacao.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                                 ' and CodMateria = '+#39+Table_Avaliacao.FieldByName('CodMateria').AsString+#39
                                );

               ShowMessage('A Disciplina '+IBQuery_Materia.FieldByName( 'codMateria').AsString+' - '+
                                           IBQuery_Materia.FieldByName( 'NomeMateria').AsString+
                                           ' já esta Cadastrada como abrangência na Prova '+
                                           DM.IBQuery_Executa.FieldByName('CodProva').AsString+'...');
            end;
         end;
       end;
       Funcoes.ExecutaTransacao;
       IBQuery_Materia.Next;
   end;
end;

//-------------------------------------------------------------------------------
// Exclui Abrangencia
//-------------------------------------------------------------------------------

procedure TForm_Cad_QGA.SpeedButton_ExcluirClick(Sender: TObject);
var
   VI_Retorno, contador: Integer;
begin
   if trim(IBTable_Abrangencia.FieldByName('Materia').AsString) <> '' then
   begin
      VI_Retorno:= Application.MessageBox('Essa exclusão eliminará abrangencia selecionada '+#13+
                                       'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
      if VI_Retorno = IDYes then
      begin
         With DBGrid_Abrangencia do
         Begin
            for contador:= 0 to Pred(SelectedRows.Count) do
            Begin
               Datasource.Dataset.Bookmark:= SelectedRows[contador]; // posiciona nos registros selecionados do DBGrid

               IBTable_Abrangencia.Delete;
            end;
         end;
         Funcoes.ExecutaTransacao;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Fechar da Abrangencia
//------------------------------------------------------------------------------

procedure TForm_Cad_QGA.JvTransparentButton_FecharClick(Sender: TObject);
begin
   if Form_Sel_QGA.VS_Opcao = 'Inserir' then
      Inserir
   else
      Close;
end;

end.
