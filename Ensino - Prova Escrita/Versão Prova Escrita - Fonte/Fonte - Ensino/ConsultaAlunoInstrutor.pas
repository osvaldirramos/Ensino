//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : ConsultaAluno.PAS                              //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de permitir a Consulta//
//                             dos Cursos Finalizados.                        //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 16/07/2008                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit ConsultaAlunoInstrutor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit, 
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvGroupHeader, JvAnimTitle, PsyRichEdit,
  JvTransBtn;

type
  TForm_ConsultaAluno = class(TForm)
    Panel_RelacaoAlunos: TPanel;
    DSQ_Aluno: TDataSource;
    Query_Aluno: TIBQuery;
    Query_Pessoa: TIBQuery;
    DSQ_Pessoa: TDataSource;
    IBQuery_Instrutor: TIBQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DSQ_Instrutor: TDataSource;
    IBQuery_InstrutorTURMA: TIBStringField;
    IBQuery_InstrutorANO: TIBStringField;
    IBQuery_InstrutorCODCURSO: TIBStringField;
    IBQuery_InstrutorIDENTIDADE: TIBStringField;
    DBGrid_Campos: TDBGrid;
    ToolBar_SelecaoAluno: TToolBar;
    JvEdit_NomeGuerra: TJvEdit;
    JvEdit_Identidade: TJvEdit;
    JvEdit_CPF: TJvEdit;
    JvEdit_Nome: TJvEdit;
    Query_PessoaIDENTIDADE: TIBStringField;
    Query_PessoaNOME: TIBStringField;
    Query_PessoaPOSTOGRADUACAO: TIBStringField;
    Query_PessoaSEXO: TIBStringField;
    Query_PessoaNOMEPAIS: TIBStringField;
    Query_PessoaEMAIL: TIBStringField;
    Query_PessoaCPF_CIC: TIBStringField;
    Query_PessoaSARAM: TIBStringField;
    Query_PessoaIDUNIDADE: TIBStringField;
    Query_PessoaIDSUBUNIDADE: TIBStringField;
    IBTable_Telefone: TIBTable;
    IBTable_Cad_Endereco: TIBTable;
    DST_Endereco: TDataSource;
    DST_Telefone: TDataSource;
    IBQuery_InstrutorSTATUS: TIBStringField;
    Query_AlunoIDCURSO: TSmallintField;
    Query_AlunoCODCURSO: TIBStringField;
    Query_AlunoIDTURMA: TIntegerField;
    Query_AlunoTURMA: TIBStringField;
    Query_AlunoANO: TIBStringField;
    Query_AlunoDATAINICIO: TDateTimeField;
    Query_AlunoDATATERMINO: TDateTimeField;
    Query_AlunoIDENTIDADE: TIBStringField;
    Query_PessoaNOMEGUERRA: TIBStringField;
    Query_AlunoNOTAFINAL: TIBBCDField;
    IBTable_TelefoneIDENTIDADE: TIBStringField;
    IBTable_TelefoneFAX: TIBStringField;
    IBTable_TelefoneTEL_CONTATO: TIBStringField;
    IBTable_TelefoneTEL_COMERCIAL: TIBStringField;
    IBTable_TelefoneTEL_RESIDENCIAL: TIBStringField;
    IBTable_TelefoneCELULAR: TIBStringField;
    IBTable_TelefoneCELULAR1: TIBStringField;
    Query_Historico: TIBQuery;
    Query_HistoricoNUMSEQ: TIntegerField;
    Query_HistoricoIDENTIDADE: TIBStringField;
    Query_HistoricoNOME: TIBStringField;
    Query_HistoricoPOSTOGRAD: TIBStringField;
    Query_HistoricoQUADROESPEC: TIBStringField;
    Query_HistoricoUNIDADEPER: TIBStringField;
    Query_HistoricoUNIDADESER: TIBStringField;
    Query_HistoricoCODCURSO: TIBStringField;
    Query_HistoricoTURMA: TIBStringField;
    Query_HistoricoANO: TIBStringField;
    Query_HistoricoTIPO: TIBStringField;
    Query_HistoricoPAIS: TIBStringField;
    Query_HistoricoNOTA: TFloatField;
    Query_HistoricoDATAINI: TDateTimeField;
    Query_HistoricoDATATER: TDateTimeField;
    Query_HistoricoSITUACAO: TIBStringField;
    DSQ_Historico: TDataSource;
    Query_AlunoPOSTOGRADUACAO: TIBStringField;
    Query_AlunoIDUNIDADE: TIBStringField;
    IBQuery_InstrutorIDUNIDADE: TIBStringField;
    Panel3: TPanel;
    JvGroupHeader_Aluno: TJvGroupHeader;
    Panel_informacoes: TPanel;
    JvShape1: TJvShape;
    DBText_NomePessoa: TDBText;
    IBTable_AlunoTurma: TIBTable;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    DST_AlunoTurma: TDataSource;
    IBTable_InstrutorTurma: TIBTable;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    DataSource1: TDataSource;
    IBTable_Cad_EnderecoIDENTIDADE: TIBStringField;
    IBTable_Cad_EnderecoENDERECO: TIBStringField;
    IBTable_Cad_EnderecoCIDADE: TIBStringField;
    IBTable_Cad_EnderecoUF: TIBStringField;
    IBTable_Cad_EnderecoCEP: TIBStringField;
    IBTable_Cad_EnderecoPAIS: TIBStringField;
    Panel_Botoes: TPanel;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Memo1: TMemo;
    Panel_TotalReg: TPanel;
    PageControl1: TPageControl;
    TabSheet_ComoAluno: TTabSheet;
    TabSheet_Historico: TTabSheet;
    DBGrid_Aluno: TDBGrid;
    DBGrid_Historico: TDBGrid;
    TabSheet_ComoCoordenadorInstrutor: TTabSheet;
    DBGrid_Instrutores: TDBGrid;
    Query_PessoaIDENTIDADE_OLD: TIBStringField;
    PageControl_Consulta: TPageControl;
    TabSheet_DadosPessoais: TTabSheet;
    GroupBox_Documentacao: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    DBEdit_CPF: TDBEdit;
    DBEdit_IdentidadePessoa: TDBEdit;
    GroupBox_NomeCargo: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit_NomeCompleto: TDBEdit;
    DBEdit_NomeGuerra: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox_Procedencia: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    GroupBox_EnderecoEletronico: TGroupBox;
    Label30: TLabel;
    DBEdit_EMailAl: TDBEdit;
    TabSheet_Endereco: TTabSheet;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label20: TLabel;
    DBEdit_CidadeAl: TDBEdit;
    DBEdit_CepAl: TDBEdit;
    DBEdit_EnderecoAl: TDBRichEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox6: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    DBEdit_Residencial: TDBEdit;
    DBEdit_Fax: TDBEdit;
    DBEdit_Comercial: TDBEdit;
    DBEdit_Celular: TDBEdit;
    DBEdit9: TDBEdit;
    Query_AlunoMOTIVODESLIGAMENTO: TIBStringField;


    procedure MontaPessoa(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure Edit_Busca_NomeChange(Sender: TObject);
    procedure Query_PessoaAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_CamposTitleClick(Column: TColumn);
    procedure DBGrid_AlunoDblClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure DBGrid_CamposDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_AlunoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_HistoricoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_InstrutoresDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private    { Private declarations }
     OrderByPessoa, VS_ComandoPessoa: String;
  public    { Public declarations }

  end;
var
  Form_ConsultaAluno: TForm_ConsultaAluno;

implementation

uses Module, MenuPrincipal, Module_Historico;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_ConsultaAluno.FormActivate(Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      JvGroupHeader_Aluno.Caption:= 'Passagens pelo '+DM.IBTable_Configuracao.FieldByName('Sigla').AsString+' como';
      Funcoes.SetCadCurso('CadCurso');

      JvEdit_Nome.Text:= '';

      //--- Abre as tabelas existentes

      OrderByPessoa:= ' order by Nome';
      MontaPessoa(Sender);

      Query_Aluno.Open;
      IBQuery_Instrutor.Open;
      IBTable_Cad_Endereco.Open;
      IBTable_Telefone.Open;
      Query_Historico.Open;

      PageControl_Consulta.TabIndex:= 0;
      JvEdit_Nome.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_ConsultaAluno.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_ConsultaAluno.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Fecha as tabelas abertas e desfaz da Form
//------------------------------------------------------------------------------

procedure TForm_ConsultaAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_Pessoa.Close;
   Query_Aluno.Close;
   IBQuery_Instrutor.Close;

   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento da seleção da pessoa pelo Nome
//------------------------------------------------------------------------------

procedure TForm_ConsultaAluno.Edit_Busca_NomeChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select * From Pessoa ';

   if Trim(JvEdit_Nome.Text) <> '' then
      VS_Comando:= VS_Comando+' Where Upper(Nome) like '+#39+'%'+Trim(JvEdit_Nome.Text)+'%'+#39;

   VS_Comando:= VS_Comando+' Order By Nome';
   Funcoes.ExecutaQuery(Query_Pessoa, VS_Comando);
end;

//------------------------------------------------------------------------------
// Tratamento para indicar a quantidade de passagens pelo ICEA
//------------------------------------------------------------------------------

procedure TForm_ConsultaAluno.Query_PessoaAfterScroll(DataSet: TDataSet);
begin
   if Query_Aluno.RecordCount = 0 then
      TabSheet_ComoAluno.Caption:= 'Aluno - Nenhuma'
   else
      TabSheet_ComoAluno.Caption:= 'Aluno - '+FormatFloat('0000', Query_Aluno.RecordCount );

   if IBQuery_Instrutor.RecordCount = 0 then
      TabSheet_ComoCoordenadorInstrutor.Caption:= 'Coordenador/Instrutor - Nenhuma'
   else
      TabSheet_ComoCoordenadorInstrutor.Caption:= 'Coordenador/Instrutor - '+FormatFloat('0000', IBQuery_Instrutor.RecordCount);
end;

//------------------------------------------------------------------------------
// Tratamento para ordenar a relação de pessoa atraves da selecao do cabecalho da Grid
//------------------------------------------------------------------------------

procedure TForm_ConsultaAluno.DBGrid_CamposTitleClick(Column: TColumn);
begin
   OrderByPessoa:= ' ';

  if trim(column.Title.Caption) = 'Nome Guerra' then
      OrderByPessoa:= ' order by NomeGuerra'
  else
     if trim(column.Title.Caption) = 'Identidade' then
         OrderByPessoa:= ' order by Identidade'
     else
        if trim(column.Title.Caption) = 'CPF' then
            OrderByPessoa:= ' order by CPF_CIC'
        else
           if trim(column.Title.Caption) = 'Nome' then
              OrderByPessoa:= ' order by Nome'
           else
              if trim(column.Title.Caption) = 'Posto Graduação' then
                 OrderByPessoa:= ' order by PostoGraduacao '
              else
                 if trim(column.Title.Caption) = 'Pais' then
                     OrderByPessoa:= ' order by NomePais '
                 else
                    if trim(column.Title.Caption) = 'E-Mail' then
                       OrderByPessoa:= ' order by EMAIL ';
   Funcoes.ExecutaQuery(Query_Pessoa, VS_ComandoPessoa +OrderByPessoa);
end;


//------------------------------------------------------------------------------
// Procedure para tratar do select da pessoa
//------------------------------------------------------------------------------

procedure TForm_ConsultaAluno.MontaPessoa(Sender: TObject);
begin
   VS_ComandoPessoa:= 'Select Identidade, Identidade_old, Nome, NomeGuerra, trim(POSTOGRADUACAO)||'+#39+' '+#39+'||QUADROESP as PostoGraduacao, SEXO, NOMEPAIS, EMAIL, CPF_CIC, SARAM, IDUNIDADE, IDSUBUNIDADE '+
                      ' From Pessoa '+
                      ' Where identidade <> '+#39+''+#39;

   if Trim(JvEdit_NomeGuerra.Text) <> '' then
      VS_ComandoPessoa:= VS_ComandoPessoa+' and CAST(NomeGuerra AS VARCHAR(20) CHARACTER SET ISO8859_1) COLLATE PT_BR LIKE '+#39+JvEdit_NomeGuerra.Text+'%'+#39;

   if Trim(JvEdit_Identidade.Text) <> '' then
      VS_ComandoPessoa:= VS_ComandoPessoa+' and Identidade_old Like '+#39+'%'+JvEdit_Identidade.Text+'%'+#39;

   if Trim(JvEdit_CPF.Text) <> '' then
      VS_ComandoPessoa:= VS_ComandoPessoa+' and CPF Like '+#39+'%'+JvEdit_CPF.Text+'%'+#39;

   if Trim(JvEdit_Nome.Text) <> '' then
   begin
      VS_ComandoPessoa:= VS_ComandoPessoa+' and (Nome Like '+#39+'%'+Trim(JvEdit_Nome.Text)+'%'+#39;
      VS_ComandoPessoa:= VS_ComandoPessoa+Funcoes.TratarConsultaComAcento('Nome', 'Like', Trim(JvEdit_Nome.Text)+'%')+')';
   end;

   Funcoes.ExecutaQuery(Query_Pessoa, VS_ComandoPessoa +OrderByPessoa);

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select count(1) as Qtd From Pessoa ');
   Panel_TotalReg.Caption:= 'Total: '+DM.IBQuery_Executa.FieldByName('Qtd').AsString;

end;


procedure TForm_ConsultaAluno.DBGrid_AlunoDblClick(Sender: TObject);
begin
   if Query_Aluno.FieldByName('Status').AsString = 'E' then
      Form_MenuPrincipal.HabilitaTurma(Query_Aluno, 'Executados')
   else
      Form_MenuPrincipal.HabilitaTurma(Query_Aluno, 'Default-in');

   Form_MenuPrincipal.ChamaTurma;
end;

procedure TForm_ConsultaAluno.DBGrid_CamposDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not odd(Query_Pessoa.RecNo) then                                //verifica se a linha não é impar
    if not(gdSelected in State) then                                        //verifica se a célula não está selecionada
    begin
       TDBGrid(Sender).Canvas.Brush.Color:=clMoneyGreen;                       //define a cor que a linha vai ser pintada
       TDBGrid(Sender).Canvas.FillRect(Rect);                                 //pinta cada retângulo (célula) da linha a ser pintada
       TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);  //retorna com o desenho padrão do DBGrid
    end
    else
       DBGrid_Campos.Canvas.Brush.Color := clSkyBlue;

end;

procedure TForm_ConsultaAluno.DBGrid_AlunoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not odd(Query_Pessoa.RecNo) then                                //verifica se a linha não é impar
    if not(gdSelected in State) then                                        //verifica se a célula não está selecionada
    begin
      TDBGrid(Sender).Canvas.Brush.Color:=clMoneyGreen;                       //define a cor que a linha vai ser pintada
      TDBGrid(Sender).Canvas.FillRect(Rect);                                 //pinta cada retângulo (célula) da linha a ser pintada
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);  //retorna com o desenho padrão do DBGrid
    end
    else
       if Query_Aluno.FieldByName('MotivoDesligamento').AsString = 'a' then
          DBGrid_Aluno.Canvas.Brush.Color := clSkyBlue
       else
          DBGrid_Aluno.Canvas.Brush.Color := clRed;

end;

procedure TForm_ConsultaAluno.DBGrid_HistoricoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not odd(Query_Pessoa.RecNo) then                                //verifica se a linha não é impar
    if not(gdSelected in State) then                                        //verifica se a célula não está selecionada
    begin
      TDBGrid(Sender).Canvas.Brush.Color:=clMoneyGreen;                       //define a cor que a linha vai ser pintada
      TDBGrid(Sender).Canvas.FillRect(Rect);                                 //pinta cada retângulo (célula) da linha a ser pintada
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);  //retorna com o desenho padrão do DBGrid
    end
    else
       DBGrid_Historico.Canvas.Brush.Color := clSkyBlue;
end;

procedure TForm_ConsultaAluno.DBGrid_InstrutoresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not odd(Query_Pessoa.RecNo) then                                //verifica se a linha não é impar
    if not(gdSelected in State) then                                        //verifica se a célula não está selecionada
    begin
      TDBGrid(Sender).Canvas.Brush.Color:=clMoneyGreen;                       //define a cor que a linha vai ser pintada
      TDBGrid(Sender).Canvas.FillRect(Rect);                                 //pinta cada retângulo (célula) da linha a ser pintada
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);  //retorna com o desenho padrão do DBGrid
    end
    else
       DBGrid_Instrutores.Canvas.Brush.Color := clSkyBlue;
end;

end.

