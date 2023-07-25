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

unit CopiaTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, TeeProcs, Chart, StdCtrls, Grids, DBGrids,
  DB, DbChart, JvToolEdit, JvEdit, DBCtrls, Mask, JvComponent, JvxCtrls,
  Buttons, ExtCtrls, JvShape, IBCustomDataSet, IBQuery, ComCtrls, ToolWin,
  JvCaptionPanel, JvEnterTab, IBTable, Rotinas_Validar,
  Rotinas_SUE, Rotinas, Rotinas_TrataData, JvTransBtn, JvGradient;

type
  TForm_CopiaTurma = class(TForm)
    Query_MontaCurso: TIBQuery;
    Query_MontaCursoIDCURSO: TSmallintField;
    Query_MontaCursoCODCURSO: TIBStringField;
    DSQ_MontaCurso: TDataSource;
    Query_MontaTurma: TIBQuery;
    DSQ_MontaTurma: TDataSource;
    JvEnterAsTab1: TJvEnterAsTab;
    Query_MontaTurmaIDCURSO: TSmallintField;
    Query_MontaTurmaIDTURMA: TIntegerField;
    Query_MontaTurmaTURMA: TIBStringField;
    Query_MontaTurmaANO: TIBStringField;
    Query_MontaTurmaDATAINICIO: TDateTimeField;
    Query_MontaTurmaDATATERMINO: TDateTimeField;
    IBTable_AlunoTurma: TIBTable;
    IBTable_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBTable_AlunoTurmaIDCURSO: TSmallintField;
    IBTable_AlunoTurmaIDTURMA: TIntegerField;
    IBTable_AlunoTurmaIDENTIDADE: TIBStringField;
    IBTable_AlunoTurmaNUMORDEM: TSmallintField;
    IBTable_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBTable_AlunoTurmaIDUNIDADE: TIBStringField;
    IBTable_AlunoTurmaIDSUBUNIDADE: TIBStringField;
    IBTable_AlunoTurmaDATAMATRICULA: TDateTimeField;
    IBTable_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBTable_AlunoTurmaDATADESLIGAMENTO: TDateTimeField;
    IBTable_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBTable_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBTable_AlunoTurmaREGISTRARVEICULO: TIBStringField;
    IBTable_AlunoTurmaINSTITUTO: TIBStringField;
    IBTable_AlunoTurmaTIPO_ALUNO: TIBStringField;
    IBTable_AlunoTurmaNOMECOMPLETO: TIBStringField;
    IBTable_AlunoTurmaCHAMADA: TIBStringField;
    IBTable_RelacaoAlunos: TIBTable;
    IntegerField3: TIntegerField;
    SmallintField2: TSmallintField;
    IntegerField4: TIntegerField;
    IBStringField10: TIBStringField;
    SmallintField3: TSmallintField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    DateTimeField4: TDateTimeField;
    IBStringField14: TIBStringField;
    DateTimeField5: TDateTimeField;
    IBBCDField1: TIBBCDField;
    SmallintField4: TSmallintField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    Panel_Botoes: TPanel;
    JvGradient1: TJvGradient;
    JvShape9: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape_Copiar: TJvShape;
    JvTransparentButton_Copiar: TJvTransparentButton;
    JvShape1: TJvShape;
    Label1: TLabel;
    ComboBox_Curso: TComboBox;
    JvCaptionPanel1: TJvCaptionPanel;
    DBNavigator1: TDBNavigator;
    DBGrid_Turma: TDBGrid;
    ToolBar_Pesquisar: TToolBar;
    MaskEdit_Turma: TJvEdit;
    JvEdit_Ano: TJvEdit;
    JvDateEdit_Inicio: TJvDateEdit;
    JvDateEdit_Termino: TJvDateEdit;
    IBTable_RelacaoInstrutorTurma: TIBTable;
    IBTable_RelacaoInstrutorTurmaIDCURSO: TSmallintField;
    IBTable_RelacaoInstrutorTurmaIDTURMA: TIntegerField;
    IBTable_RelacaoInstrutorTurmaIDENTIDADE: TIBStringField;
    IBTable_RelacaoInstrutorTurmaDATACHEGADA: TDateTimeField;
    IBTable_RelacaoInstrutorTurmaDATASAIDA: TDateTimeField;
    IBTable_RelacaoInstrutorTurmaAPRESENTACAO: TDateTimeField;
    IBTable_RelacaoInstrutorTurmaFUNCAO: TIBStringField;
    IBTable_RelacaoInstrutorTurmaCODIGOINSTRUTOR: TIntegerField;
    IBTable_RelacaoInstrutorTurmaINSTITUTO: TIBStringField;
    IBTable_RelacaoInstrutorTurmaIDUNIDADE: TIBStringField;
    IBTable_RelacaoInstrutorTurmaIDSUBUNIDADE: TIBStringField;
    IBTable_RelacaoInstrutorTurmaFICHA: TIBStringField;
    IBTable_RelacaoInstrutorTurmaIDANTIGUIDADE: TSmallintField;
    IBTable_RelacaoInstrutorTurmaSENHA: TIBStringField;
    IBTable_RelacaoInstrutorTurmaNOMECOMPLETO: TIBStringField;
    IBTable_RelacaoInstrutorTurmaTIPO_INSTRUTOR: TIBStringField;
    IBTable_instrutorTurma: TIBTable;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    IBStringField2: TIBStringField;
    IntegerField2: TIntegerField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    SmallintField5: TSmallintField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    DataSource1: TDataSource;
    IBTable_AlunoTurmaRESTRICAO: TIBStringField;
    IBTable_AlunoTurmaESTAGIARIO: TIBStringField;
    IBTable_PessoaAl: TIBTable;
    IBTable_PessoaAlIDENTIDADE: TIBStringField;
    IBTable_PessoaAlNOMEGUERRA: TIBStringField;
    IBTable_PessoaAlPOSTOGRADUACAO: TIBStringField;
    IBTable_PessoaAlULTIMAPROMOCAO: TDateTimeField;
    IBTable_PessoaAlSEXO: TIBStringField;
    IBTable_PessoaAlSARAM: TIBStringField;
    IBTable_PessoaAlEMAIL: TIBStringField;
    IBTable_PessoaAlCPF_CIC: TIBStringField;
    IBTable_PessoaAlNOMEPAIS: TIBStringField;
    IBTable_PessoaAlDATA_NASCIMENTO: TDateTimeField;
    IBTable_PessoaAlIDUNIDADE: TIBStringField;
    IBTable_PessoaAlIDSUBUNIDADE: TIBStringField;
    IBTable_PessoaAlQUADROESP: TIBStringField;
    IBTable_PessoaAlNOME: TIBStringField;
    IBTable_PessoaAlSIPAER: TIBStringField;
    IBTable_PessoaAlIDENTIDADE_OLD: TIBStringField;
    DST_RelacaoAlunos: TDataSource;

    procedure MontaTurma(Sender: TObject);
    procedure GerarCodigoAluno(VS_IdCurso: String; S_IdTurma: String);
    procedure CopiarAluno;
    procedure CopiarInstrutor;

    procedure FormActivate(Sender: TObject);
    procedure DBGrid_TurmaTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox_CursoChange(Sender: TObject);
    procedure JvTransparentButton_CopiarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
       OrderByturma, VS_ComandoTurma: String;
   public
    { Public declarations }
  end;

var
  Form_CopiaTurma: TForm_CopiaTurma;

implementation

uses Module;

{$R *.dfm}


//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.FormActivate(Sender: TObject);
begin
   Query_MontaTurma.Open;
   OrderByturma:= 'Ano, CodTurma';

   Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_MontaCurso.Close;
   Query_MontaTurma.Close;
   IBTable_AlunoTurma.Close;
   IBTable_RelacaoAlunos.Close;

   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao da Query
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.JvTransparentButton_CopiarClick(Sender: TObject);
begin
   if Query_MontaTurma.FieldByName('IdCurso').AsString = '' then
      ShowMessage('O curso selecionado não possuí turma cadastrada...')
   else
       if Form_CopiaTurma.Caption = 'Sistema de Gerenciamento do Ensino --> Copia dos alunos de uma turma para outra' then
          CopiarAluno
       else
          CopiarInstrutor;
end;

//------------------------------------------------------------------------------
// Tratamento para copiar os alunos para a turma selecionada
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.CopiarAluno;
begin
   IBTable_AlunoTurma.Open;
   IBTable_RelacaoAlunos.Open;
   IBTable_RelacaoAlunos.First;
   While not IBTable_RelacaoAlunos.eof do
   begin
      IBTable_AlunoTurma.Append;
      if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SRPV-SP') or
          (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CRCEA-SE')) then         
         IBTable_AlunoTurma.FieldByName('CodigoAluno').AsString:= IBTable_RelacaoAlunos.FieldByName('CodigoAluno').AsString
      else
         GerarCodigoAluno(Query_MontaTurma.FieldByName('IdCurso').AsString, Query_MontaTurma.FieldByName('IdTurma').AsString);

       IBTable_AlunoTurma.FieldByName('IdCurso').AsString:= Query_MontaTurma.FieldByName('IdCurso').AsString;
       IBTable_AlunoTurma.FieldByName('IDTURMA').AsString:= Query_MontaTurma.FieldByName('IdTurma').AsString;
       IBTable_AlunoTurma.FieldByName('IDENTIDADE').AsString:= IBTable_RelacaoAlunos.FieldByName('Identidade').AsString;
       IBTable_AlunoTurma.FieldByName('NUMORDEM').AsString:= IBTable_RelacaoAlunos.FieldByName('NUMORDEM').AsString;
       IBTable_AlunoTurma.FieldByName('POSTOGRADUACAO').AsString:= IBTable_RelacaoAlunos.FieldByName('POSTOGRADUACAO').AsString;
       IBTable_AlunoTurma.FieldByName('IDUNIDADE').AsString:= IBTable_RelacaoAlunos.FieldByName('IDUNIDADE').AsString;
       IBTable_AlunoTurma.FieldByName('IDSUBUNIDADE').AsString:= IBTable_RelacaoAlunos.FieldByName('IDSUBUNIDADE').AsString;
       IBTable_AlunoTurma.FieldByName('DATAMATRICULA').AsString:= Query_MontaTurma.FieldByName('DataInicio').AsString;
       IBTable_AlunoTurma.FieldByName('MOTIVODESLIGAMENTO').AsString:= 'a';
       IBTable_AlunoTurma.FieldByName('DATADESLIGAMENTO').AsString:= Query_MontaTurma.FieldByName('DataTermino').AsString;
       IBTable_AlunoTurma.FieldByName('NotaFinal').AsString:= '';
       IBTable_AlunoTurma.FieldByName('IDANTIGUIDADE').AsString:= IBTable_RelacaoAlunos.FieldByName('IDANTIGUIDADE').AsString;
       IBTable_AlunoTurma.FieldByName('REGISTRARVEICULO').AsString:= IBTable_RelacaoAlunos.FieldByName('REGISTRARVEICULO').AsString;
       IBTable_AlunoTurma.FieldByName('INSTITUTO').AsString:= IBTable_RelacaoAlunos.FieldByName('INSTITUTO').AsString;
       IBTable_AlunoTurma.FieldByName('TIPO_ALUNO').AsString:= IBTable_RelacaoAlunos.FieldByName('TIPO_ALUNO').AsString;
       IBTable_AlunoTurma.FieldByName('NOMECOMPLETO').AsString:= IBTable_RelacaoAlunos.FieldByName('NOMECOMPLETO').AsString;
       IBTable_AlunoTurma.FieldByName('CHAMADA').AsString:= IBTable_RelacaoAlunos.FieldByName('CHAMADA').AsString;
       IBTable_AlunoTurma.Post;

       IBTable_PessoaAl.Open;
       Funcoes.CadastrarAcessoFichaAvaliacao( Query_MontaTurma.FieldByName('IDCURSO').AsString,
                                              Query_MontaTurma.FieldByName('IDTURMA').AsString,
                                              IBTable_RelacaoAlunos.FieldByName('IDENTIDADE').AsString,
                                              IBTable_PessoaAl.FieldByName('NomeGuerra').AsString,
                                              IBTable_AlunoTurma.FieldByName('CODIGOALUNO').AsString
                                             );

      IBTable_RelacaoAlunos.Next;
   end;
   IBTable_PessoaAl.Close;
   Funcoes.ExecutaTransacao;
   ShowMessage('Já foram copiados todos alunos...');
end;

//------------------------------------------------------------------------------
// Tratamento para copiar os alunos para a turma selecionada
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.CopiarInstrutor;
begin
   IBTable_InstrutorTurma.Open;
   IBTable_InstrutorTurma.First;

   IBTable_RelacaoInstrutorTurma.open;
   IBTable_RelacaoInstrutorTurma.First;
   While not IBTable_RelacaoInstrutorTurma.eof do
   begin
      IBTable_InstrutorTurma.Append;

      IBTable_InstrutorTurma.FieldByName('IdCurso').AsString:= Query_MontaTurma.FieldByName('IdCurso').AsString;
      IBTable_InstrutorTurma.FieldByName('IdTurma').AsString:= Query_MontaTurma.FieldByName('IdTurma').AsString;
      IBTable_InstrutorTurma.FieldByName('Identidade').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('Identidade').AsString;
      IBTable_InstrutorTurma.FieldByName('CodigoInstrutor').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('CodigoInstrutor').AsString;
      IBTable_InstrutorTurma.FieldByName('senha').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('senha').AsString;
      IBTable_InstrutorTurma.FieldByName('DataChegada').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('DataChegada').AsString;
      IBTable_InstrutorTurma.FieldByName('DataSaida').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('DataChegada').AsString;
      IBTable_InstrutorTurma.FieldByName('Apresentacao').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('Apresentacao').AsString;
      IBTable_InstrutorTurma.FieldByName('Funcao').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('Funcao').AsString;
      IBTable_InstrutorTurma.FieldByName('CodigoInstrutor').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('CodigoInstrutor').AsString;
      IBTable_InstrutorTurma.FieldByName('IdUnidade').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('IdUnidade').AsString;
      IBTable_InstrutorTurma.FieldByName('IdSubUnidade').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('IdSubUnidade').AsString;
      IBTable_InstrutorTurma.FieldByName('Ficha').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('Ficha').AsString;
      IBTable_InstrutorTurma.FieldByName('IdAntiguidade').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('IdAntiguidade').AsString;
      IBTable_InstrutorTurma.FieldByName('Senha').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('Senha').AsString;
      IBTable_InstrutorTurma.FieldByName('NomeCompleto').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('NomeCompleto').AsString;
      IBTable_InstrutorTurma.FieldByName('Tipo_Instrutor').AsString:= IBTable_RelacaoInstrutorTurma.FieldByName('Tipo_Instrutor').AsString;
      IBTable_InstrutorTurma.Post;

      IBTable_RelacaoInstrutorTurma.Next;
   end;
   Funcoes.ExecutaTransacao;
   ShowMessage('Já foram copiados todos Instrutores...');
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso    --- Monta query de selecao de curso
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.ComboBox_CursoChange(Sender: TObject);
begin
   Funcoes.ExecutaQuery(Query_MontaCurso, 'Select IdCurso, CodCurso, NomeCurso '+
                                          'From Curso '+
                                          ' where codcurso = '+#39+ComboBox_Curso.tEXT+#39
                       );

   if Query_MontaCurso.RecordCount = 0 then
   begin
      Showmessage('Curso não Cadastrado.');
      ComboBox_Curso.SetFocus;
   end;
end;


//------------------------------------------------------------------------------
// Monta a estrutura da turma
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.MontaTurma(Sender: TObject);
begin
   VS_ComandoTurma:= 'Select IdCurso, IdTurma, Turma, ano, datainicio, datatermino '+
                     ' From turmas_view '+
                     ' Where IdCurso = :IdCurso ';

   if Trim(MaskEdit_Turma.Text) <> '' then
       VS_ComandoTurma:= VS_ComandoTurma+' and Turma Like '+#39+MaskEdit_Turma.Text+'%'+#39;

   if JvDateEdit_Inicio.Text <> '  /  /    ' then
   begin
      if Validar.ValidarData(JvDateEdit_Inicio.Text) = True then
         VS_ComandoTurma:= VS_ComandoTurma+' and datainicio = '+#39+Funcoes.TratarData(JvDateEdit_Inicio.Text)+#39;
   end;

   if JvDateEdit_Termino.Text <> '  /  /    ' then
   begin
      if Validar.ValidarData(JvDateEdit_Termino.Text) = True then
         VS_ComandoTurma:= VS_ComandoTurma+' and datatermino = '+#39+Funcoes.TratarData(JvDateEdit_Termino.Text)+#39;
   end;

   if Trim(JvEdit_Ano.Text) <> '' then
       VS_ComandoTurma:= VS_ComandoTurma+' and Ano = '+#39+JvEdit_Ano.Text+#39;

   VS_ComandoTurma:= VS_ComandoTurma+'order by ';

   Funcoes.ExecutaQuery(Query_MontaTurma, VS_ComandoTurma + OrderByturma);
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao da Grid de Turma
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.DBGrid_TurmaTitleClick(Column: TColumn);
begin
   if (column.Title.Caption = 'Turma')  then
       OrderByturma:= 'Ano desc , Turma desc'
   else
     if trim(column.Title.Caption) = 'Ínicio' then
         OrderByturma:= 'DataInicio desc'
     else
        if trim(column.Title.Caption) = 'Término' then
            OrderByturma:= 'DataTermino desc'
        else
           if trim(column.Title.Caption) = 'Status' then
               OrderByturma:= 'Status';
   Funcoes.ExecutaQuery(Query_MontaTurma, VS_ComandoTurma + OrderByturma);
end;

//------------------------------------------------------------------------------
// Gera o codigo do Aluno
//------------------------------------------------------------------------------

procedure TForm_CopiaTurma.GerarCodigoAluno(VS_IdCurso: String; S_IdTurma: String);
var
   VS_Comando, VS_CodAluno: String;
   VI_CodExiste: integer;
begin
   //--- Chama função para gerar codigo do aluno  --------------//
   VI_CodExiste:=0;

   while VI_CodExiste = 0  do
   begin
      VS_CodAluno:=Funcoes.Randomico (999);

      if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString <> 'SIAT-MN'))then
      begin
         VS_Comando:= 'Select count(1) Qtd '+
                      'from CODIGO_ALUNO_VIEW '+
                      'where IdCurso = '+VS_IdCurso+
                      ' and CodigoAluno = '+VS_CodAluno;
      end
      else
      begin
         VS_CodAluno:= Funcoes_TrataData.AnoAtual+VS_CodAluno;
         VS_Comando:= 'Select count(1) Qtd '+
                      'from CODIGO_ALUNO_VIEW '+
                      'where IdCurso = '+VS_IdCurso+
                      ' and CodigoAluno = '+VS_CodAluno;
      end;

      if Funcoes.QtdRegistro(VS_Comando) = 0 then
      begin
         VI_CodExiste:= 1;
         IBTable_AlunoTurma.FieldByName('CodigoAluno').AsString:= VS_CodAluno;
      end;
   end;
end;
end.
