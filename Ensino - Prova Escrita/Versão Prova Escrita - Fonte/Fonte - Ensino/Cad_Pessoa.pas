//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Cad_Pessoa.pas                                 //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             das pessoas (Instrutores/Monitores/Alunos).    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/08/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Pessoa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvEnterTab, JvTransBtn, JvShape;
type
  TForm_Cad_Pessoa = class(TForm)
    Panel_Entrada_Dados: TPanel;
    Panel_Grid: TPanel;
    DBGrid_Campos: TDBGrid;
    ToolBar1: TToolBar;
    DSQ_Pessoa: TDataSource;
    Edit_Busca_NomeGuerra: TEdit;
    Edit_Ident: TEdit;
    Edit_Busca_Nome: TEdit;
    Query_Pessoa: TIBQuery;
    IBTable_Pessoa: TIBTable;
    DST_Pessoa: TDataSource;
    Label59: TLabel;
    Edit_Nome: TDBEdit;
    Edit_NomeGuerra: TDBEdit;
    ComboBox_PostoGraduacao: TDBComboBox;
    RadioGroup_Sexo: TDBRadioGroup;
    JvDateEdit_UltimaPromocao: TJvDBDateEdit;
    JvDBDateEdit_DataNascimento: TJvDBDateEdit;
    Label2: TLabel;
    DBEdit_CPFMF: TDBEdit;
    DBEdit_Email: TDBEdit;
    DBText_Identidade: TDBText;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label58: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    DBComboBox_Pais: TDBComboBox;
    Edit_Identidade: TEdit;
    ComboBox_Quadro: TDBComboBox;
    Query_PessoaIDENTIDADE: TIBStringField;
    Query_PessoaNOME: TIBStringField;
    Query_PessoaNOMEGUERRA: TIBStringField;
    IBTable_PessoaIDENTIDADE: TIBStringField;
    IBTable_PessoaNOME: TIBStringField;
    IBTable_PessoaNOMEGUERRA: TIBStringField;
    IBTable_PessoaPOSTOGRADUACAO: TIBStringField;
    IBTable_PessoaULTIMAPROMOCAO: TDateTimeField;
    IBTable_PessoaSEXO: TIBStringField;
    IBTable_PessoaDATA_NASCIMENTO: TDateTimeField;
    IBTable_PessoaNOMEPAIS: TIBStringField;
    IBTable_PessoaEMAIL: TIBStringField;
    IBTable_PessoaCPF_CIC: TIBStringField;
    IBTable_PessoaSARAM: TIBStringField;
    IBTable_PessoaQUADROESP: TIBStringField;
    Panel_BotoesProva: TPanel;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    Panel_Botoes: TPanel;
    JvShape_Selecao: TJvShape;
    JvTransparentButton_Selecao: TJvTransparentButton;
    JvShape_Retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;

    Procedure Botoes_Inciais(Status: Boolean; Selecao, Retornar, Windows: TJvTransparentButton);
    procedure Campos(Status: Boolean);
    procedure Pesquisar;
    procedure PesquisaIdentidade;

    procedure DBGrid_CamposTitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox_PaisExit(Sender: TObject);
    procedure ComboBox_PostoGraduacaoExit(Sender: TObject);
    procedure Edit_IdentChange(Sender: TObject);
    procedure Edit_Busca_NomeChange(Sender: TObject);
    procedure Edit_Busca_NomeGuerraChange(Sender: TObject);
    procedure Edit_Busca_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_IdentKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Busca_NomeGuerraKeyPress(Sender: TObject; var Key: Char);
    procedure IBTable_PessoaPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure Edit_IdentidadeExit(Sender: TObject);
    procedure ComboBox_QuadroExit(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_SelecaoClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
      VS_Opcao, VS_Comando, VS_OrderBy: String;
  public    { Public declarations }
      VS_Busca_Identidade: String;
  end;

var
  Form_Cad_Pessoa: TForm_Cad_Pessoa;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.FormActivate(Sender: TObject);
begin
  Funcoes.CabecalhoForm( Form_Cad_Pessoa, ' Ficha Pessoal');

   Panel_Entrada_Dados.Visible:= True;

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Gerência - Ficha Pessoal');

   VS_Opcao:= 'Inativo';

   //--- Carrega os combobox

   Funcoes_SUE.AlimentaDBComboBox(ComboBox_PostoGraduacao, 'PostoGraduacao', 'Antiguidade', '', 'PostoGraduacao');
   Funcoes_SUE.AlimentaDBComboBox(ComboBox_Quadro, 'Quadro', 'QuadroEsp', '', 'Quadro');
   Funcoes_SUE.AlimentaDBComboBox(DBComboBox_Pais, 'NomePais', 'Tab_Pais', '', 'NomePais');

   // Tratamento quando deverá retornar o a identidade da pessoa

   if Funcoes.GetRetornaPessoa = False then
   begin
      JvShape_Selecao.Visible:= False;
      JvTransparentButton_Selecao.Visible:= False;
      JvShape_Retornar.Visible:= True;
      JvTransparentButton_Retornar.Visible:= True;
      JvShape_Windows.Visible:= True;
      JvTransparentButton_Windows.Visible:= True;
   end
   else
   begin
      JvShape_Selecao.Visible:= True;
      JvTransparentButton_Selecao.Visible:= True;
      JvShape_Retornar.Visible:= False;
      JvTransparentButton_Retornar.Visible:= False;
      JvShape_Windows.Visible:= False;
      JvTransparentButton_Windows.Visible:= False;
   end;

   // Abertura das tabelas que serao utlizadas

   IBTable_Pessoa.Open;

   VS_OrderBy:= ' Nome';

   Edit_Ident.Text:= '';
   Edit_Busca_Nome.Text:= '';
   Edit_Busca_NomeGuerra.Text:= '';
   VS_Opcao:= 'Inicio';

   Pesquisar;

   if VS_Busca_Identidade <> '' then
   begin
      Query_Pessoa.Locate('Identidade', VarArrayOf([VS_Busca_Identidade]), [loPartialKey]);
      VS_Busca_Identidade:= '';
   end;


   Campos(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
   if Query_Pessoa.RecordCount = 0 then
      Funcoes.BotoesNovo01( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar)
   else
      Botoes_Inciais(True, JvTransparentButton_Selecao, JvTransparentButton_Retornar, JvTransparentButton_Windows);

   Edit_Busca_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da pesquisa pela Identidade
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.Edit_IdentChange(Sender: TObject);
begin
   Pesquisar;
end;

//------------------------------------------------------------------------------
// Tratamento da pesquisa pela Nome
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.Edit_Busca_NomeChange(Sender: TObject);
begin
   Pesquisar;
end;

//------------------------------------------------------------------------------
// Tratamento da pesquisa pela Nome de Guerra
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.Edit_Busca_NomeGuerraChange(Sender: TObject);
begin
   Pesquisar;
end;

//------------------------------------------------------------------------------
// Executa a pesquisa
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.Pesquisar;
var
   VB_Where: Boolean;
begin
   if VS_Opcao <> 'Inativo' then
   begin
      VB_Where:= False;
      VS_Comando:= 'Select pe.Identidade, pe.Nome, pe. NomeGuerra From Pessoa pe ';

      if trim(Edit_Ident.Text) <> '' then
      begin
         VB_Where:= True;
         VS_Comando:= VS_Comando+' Where pe.Identidade Like '+#39+'%'+trim(UpperCase(Edit_Ident.Text))+'%'+#39;
      end;

      if trim(Edit_Busca_Nome.Text) <> '' then
      begin
         if VB_Where = True then
            VS_Comando:= VS_Comando+' and Upper(pe.Nome) Like '+#39+'%'+trim(UpperCase(Edit_Busca_Nome.Text))+'%'+#39
         else
            VS_Comando:= VS_Comando+' Where Upper(pe.Nome) Like '+#39+'%'+trim(UpperCase(Edit_Busca_Nome.Text))+'%'+#39;
         VB_Where:= True;
      end;

      if trim(Edit_Busca_NomeGuerra.Text) <> '' then
      begin
         if VB_Where = True then
            VS_Comando:= VS_Comando+' and Upper(pe. NomeGuerra) Like '+#39+'%'+trim(UpperCase(Edit_Busca_NomeGuerra.Text))+'%'+#39
         else
            VS_Comando:= VS_Comando+' Where Upper(pe. NomeGuerra) Like '+#39+'%'+trim(UpperCase(Edit_Busca_NomeGuerra.Text))+'%'+#39;
      end;

      Query_Pessoa.Close;
      Query_Pessoa.SQL.Clear;
      Query_Pessoa.SQL.Add(VS_Comando+' Order by '+VS_OrderBy);
      Query_Pessoa.Open;
   end;
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.DBGrid_CamposTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Identidade' then
       VS_OrderBy:= 'Identidade'
   else
     if trim(column.Title.Caption) = 'Nome' then
         VS_OrderBy:= 'Nome'
     else
        if trim(column.Title.Caption) = 'Nome Guerra' then
            VS_OrderBy:= 'NomeGuerra';

   Pesquisar;
end;

//------------------------------------------------------------------------------
//
// Tratamento dos dados
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.Campos(Status: Boolean);
begin
   Edit_Nome.Enabled:= Status;
   Edit_NomeGuerra.Enabled:= Status;
   ComboBox_PostoGraduacao.Enabled:= Status;
   ComboBox_Quadro.Enabled:= Status;
   DBComboBox_Pais.Enabled:= Status;
   RadioGroup_Sexo.Enabled:= Status;
   JvDateEdit_UltimaPromocao.Enabled:= Status;
   JvDBDateEdit_DataNascimento.Enabled:= Status;
   DBEdit_CPFMF.Enabled:= Status;
   DBEdit_Email.Enabled:= Status;

   if ((Status = True) and (VS_Opcao = 'Novo'))  then
      Edit_Identidade.Visible:= True
   else
      Edit_Identidade.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento da saida da selecao da identidade do aluno
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.Edit_IdentidadeExit(Sender: TObject);
begin
   PesquisaIdentidade;
end;

//------------------------------------------------------------------------------
// Pesquisa se o aluno já esta cadastrado
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.PesquisaIdentidade;
var
   VS_Identidade, VS_Orgao, VS_UF: String;
begin
   if VS_Opcao = 'Pesquisa' then
   begin
      if trim(Edit_Identidade.Text) = '' then
      begin
         ShowMessage(' A Identidade não pode ser branca...');
         Edit_Identidade.SetFocus;
      end
      else
      begin
//         Edit_Identidade.Text:= Funcoes.NIdentidade(Edit_Identidade.Text);

         VS_Identidade:= Edit_Identidade.Text;

         // Verifica se a pessoa encontra-se na lista de pessoas

         if Funcoes.QtdRegistro('Select count(1) Qtd from pessoa pe where pe.Identidade = '+#39+VS_Identidade+VS_Orgao+VS_UF+#39) = 0 then
         begin
            VS_Opcao:= 'Novo';
            IBTable_Pessoa.Append;

            Edit_Identidade.Text:= VS_Identidade;

            IBTable_Pessoa.FieldByName('IDENTIDADE').AsString:= Edit_Identidade.Text;
            RadioGroup_Sexo.ItemIndex:= 0;
            IBTable_Pessoa.FieldByName('NomePais').AsString:= 'BRASIL';
            IBTable_Pessoa.FieldByName('Sexo').AsString:= 'M';
            Edit_Nome.SetFocus;
         end
         else
         begin
            ShowMessage(' Já existe cadastro com a identidade '+VS_Identidade+VS_Orgao+VS_UF+#13+' consulta a lista pelo número da identidade...');
            Edit_Identidade.SetFocus;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de nova pessoa
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.JvTransparentButton_InserirClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Gerência - Ficha Pessoal', 'Inserir');

   VS_Opcao:= 'Novo';
   Campos(True);
   VS_Opcao:= 'Pesquisa';
   Panel_Grid.Enabled:= False;
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
   Botoes_Inciais(False, JvTransparentButton_Selecao, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   JvTransparentButton_Selecao.Enabled:= False;

    //---
   // Set os valores iniciais

   Edit_Identidade.Text:= '';
   Edit_Identidade.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Gerência - Ficha Pessoal', 'Alterar');

   VS_Opcao:= 'Altera';
   Campos(True);

   Panel_Grid.Enabled:= False;
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
   Botoes_Inciais(False, JvTransparentButton_Selecao, JvTransparentButton_Retornar, JvTransparentButton_Windows);

   IBTable_Pessoa.Edit;
   Edit_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   Funcoes.BotoesNovo01( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
   Botoes_Inciais(False, JvTransparentButton_Selecao, JvTransparentButton_Retornar, JvTransparentButton_Windows);

   VI_retorno:= Funcoes.QtdRegistro('Select count(1) as Qtd from AlunoTurma where Identidade = '+#39+IBTable_Pessoa.FieldByName('Identidade').AsString+#39);
   if VI_retorno > 0 then
   begin
      Showmessage('A Pessoa selecionada para ser Excluída é "Aluno"'+#13+#13+'não pode ser excluido"...');
   end
   else
   begin
      VI_retorno:= Funcoes.QtdRegistro('Select count(1) as Qtd from InstrutorTurma where Identidade = '+#39+IBTable_Pessoa.FieldByName('Identidade').AsString+#39);
      if VI_retorno > 0 then
      begin
         Showmessage('A Pessoa selecionada para ser Excluída é "Instrutor"'+#13+#13+'não pode ser excluido"...');
      end
      else
      begin
         VI_Retorno:= Application.MessageBox('Essa exclusão eliminará as informações '+#13+
                                             'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
         if VI_Retorno = IDYes then
         begin
            Funcoes.GravaAcesso('Gerência - Ficha Pessoal', 'Excluir');
            IBTable_Pessoa.Delete;    // Exclui o arquivo
            Funcoes.ExecutaTransacao;
            Funcoes.AtualizaQuery(Query_Pessoa);
         end;
      end;
   end;

   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
   Botoes_Inciais(True, JvTransparentButton_Selecao, JvTransparentButton_Retornar, JvTransparentButton_Windows);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.JvTransparentButton_GravaClick(Sender: TObject);
begin
   if Trim(Edit_Nome.Text) = '' then
   begin
      Showmessage('O Nome não pode ser branco...');
      Edit_Nome.SetFocus;
   end
   else
   begin
      if Trim(Edit_NomeGuerra.Text) = '' then
      begin
         Showmessage('O Nome de Guerra não pode ser branco...');
         Edit_NomeGuerra.SetFocus;
      end
      else
      begin
         if Trim(ComboBox_PostoGraduacao.Text) = '' then
         begin
            Showmessage('O Posto/Graduação não pode ser branco...');
            ComboBox_PostoGraduacao.SetFocus;
         end
         else
         begin
            VS_Opcao:= 'Inicio';
            Funcoes.GravaAcesso('Gerência - Ficha Pessoal', 'Gravar');

            Campos(False);
            Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
            Botoes_Inciais(True, JvTransparentButton_Selecao, JvTransparentButton_Retornar, JvTransparentButton_Windows);

            // Tratamento para pessoa

            IBTable_Pessoa.Post;
            Funcoes.ExecutaTransacao;
            Funcoes.AtualizaQuery(Query_Pessoa);
            Panel_Grid.Enabled:= True;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.JvTransparentButton_CancelarClick( Sender: TObject);
begin
   Funcoes.GravaAcesso('Gerência - Ficha Pessoal', 'Cancelar');
   VS_Opcao:= 'Inicio';

   if IBTable_Pessoa.State in [dsInsert, dsEdit] then
   begin
      IBTable_Pessoa.Cancel;
      Funcoes.ExecutaTransacao;
   end;
   Funcoes.AtualizaQuery(Query_Pessoa);

   Campos(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
   Botoes_Inciais(True, JvTransparentButton_Selecao, JvTransparentButton_Retornar, JvTransparentButton_Windows);

   Panel_Grid.Enabled:= True;

   DBGrid_Campos.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Funcoes.SetPessoa('');
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao que retorna a Identidade da pessoa
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.JvTransparentButton_SelecaoClick(Sender: TObject);
begin
   if trim(Query_Pessoa.FieldByName('Identidade').AsString) = '' then
   begin
      ShowMessage('Para retornar é preciso selecionar uma pessoa...');
      Edit_Busca_Nome.SetFocus
   end
   else
   begin
      Funcoes.SetPessoa(Query_Pessoa.FieldByName('Identidade').AsString);
      Close;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento Quando a pessoa já foi cadastrada
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.IBTable_PessoaPostError(DataSet: TDataSet;   E: EDatabaseError; var Action: TDataAction);
begin
    if ((E is EDBEngineError) and ((E as EDBEngineError).Errors[0].ErrorCode = 9729)) then
    begin
       ShowMessage('A pessoa cadastrada, já consta em nosso arquivo...');
       IBTable_Pessoa.Cancel;
       Funcoes.ExecutaTransacao;
       Abort;
       Edit_Identidade.SetFocus;
    end;
end;

//------------------------------------------------------------------------------
// Tratamento da saida do comboBox Posto Graduacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.ComboBox_PostoGraduacaoExit(Sender: TObject);
begin
   if trim(ComboBox_PostoGraduacao.Text) = '' then
   begin
      Showmessage('O Posto/Graduação não pode ser branco...');
      ComboBox_PostoGraduacao.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da saida do comboBox Pais
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.ComboBox_PaisExit(Sender: TObject);
begin
   RadioGroup_Sexo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento quando pressionar enter na selecao da pessoa pelo nome
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.Edit_Busca_NomeKeyPress(Sender: TObject;var Key: Char);
begin
   if Key = #13 then
       JvTransparentButton_SelecaoClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento quando pressionar enter na selecao da pessoa pela identidade
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.Edit_IdentKeyPress(Sender: TObject;var Key: Char);
begin
   if Key = #13 then
       JvTransparentButton_SelecaoClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento quando pressionar enter na selecao da pessoa pelo Nome de querra
//------------------------------------------------------------------------------

procedure TForm_Cad_Pessoa.Edit_Busca_NomeGuerraKeyPress(Sender: TObject;var Key: Char);
begin
   if Key = #13 then
       JvTransparentButton_SelecaoClick(Sender);
end;

procedure TForm_Cad_Pessoa.ComboBox_QuadroExit(Sender: TObject);
begin
   DBComboBox_Pais.SetFocus;
end;

//------------------------------------------------------------------------------
// Procedure tratar dos botoes Iniciais
//------------------------------------------------------------------------------

Procedure TForm_Cad_Pessoa.Botoes_Inciais(Status: Boolean; Selecao, Retornar, Windows: TJvTransparentButton);
begin
   Selecao.Enabled:= Status;
   Retornar.Enabled:= Status;
   Windows.Enabled:= Status;
end;

end.
