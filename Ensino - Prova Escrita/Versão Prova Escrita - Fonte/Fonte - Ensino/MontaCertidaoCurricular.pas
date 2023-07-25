//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Relatorios                                     //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar a Certidao   //
//                             Curricular.                                    //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 02/07/2008                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :  03/09/2008                                    //
// AUTOR                     : Osvaldir                                       //
// MODULO ALTERADO           :                                                //
// MOTIVO                    : Criado a versão que utiliza o Editor.          //
//----------------------------------------------------------------------------//

unit MontaCertidaoCurricular;

interface

uses
  ActnList, ImgList, Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ComCtrls, ToolWin, Mask, JvToolEdit, StdCtrls,
  Grids, DBGrids, DB, IBCustomDataSet, IBQuery, ExtCtrls, JvComponent,
  JvEnterTab, JvRichEd, JvDBRichEd, PsyRichEdit, Menus, JvxClock, JvCombobox, ClipBrd,
  JvColorCombo, DBCtrls, RichPrint, RichPreview, ExtDlgs, JvBaseThumbnail, JvThumbImage,
  JvxCtrls, JvGradient, IBTable, JvCaptionPanel,
  Rotinas, Rotinas_TrataData, JvTransBtn, JvShape;


type
  TForm_MontaCertidaoCurricular = class(TForm)
    DSQ_Materia: TDataSource;
    IBQuery_MontaMateria: TIBQuery;
    IBQuery_Documento: TIBQuery;
    IBQuery_DocumentoDOC: TIBStringField;
    IBQuery_DocumentoDESCRICAO: TBlobField;
    DSQ_Documentacao: TDataSource;
    Documento: TJvDBRichEdit;
    Text1: TPsyRichEdit;
    PopupMenu_Imprimir: TPopupMenu;
    ImprimeTodosAlunos: TMenuItem;
    SomenteoAlunoselecionado: TMenuItem;
    PrintDialog1: TPrintDialog;
    Query_ChefeAVL: TIBQuery;
    DSQ_ChefeAVL: TDataSource;
    DSQ_RespAEN: TDataSource;
    Query_ChefeENS: TIBQuery;
    IBTable_CertidaoAluno: TIBTable;
    IBTable_CertidaoAlunoIDCURSO: TSmallintField;
    IBTable_CertidaoAlunoIDTURMA: TIntegerField;
    IBTable_CertidaoAlunoIDENTIDADE: TIBStringField;
    IBTable_CertidaoAlunoANO: TIBStringField;
    IBTable_CertidaoAlunoCERTIFICADO: TIntegerField;
    IBTable_PessoaAl: TIBTable;
    IBTable_PessoaAlIDENTIDADE: TIBStringField;
    IBTable_PessoaAlPOSTOGRADUACAO: TIBStringField;
    IBTable_PessoaAlULTIMAPROMOCAO: TDateTimeField;
    IBTable_PessoaAlSEXO: TIBStringField;
    IBTable_PessoaAlSARAM: TIBStringField;
    IBTable_PessoaAlEMAIL: TIBStringField;
    IBTable_PessoaAlCPF_CIC: TIBStringField;
    IBTable_PessoaAlNOMEPAIS: TIBStringField;
    IBTable_PessoaAlQUADROESP: TIBStringField;
    IBTable_PessoaAlNOME: TIBStringField;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IBTable_PessoaAlNOMEGUERRA: TIBStringField;
    Query_ChefeAVLIDCARGO: TSmallintField;
    Query_ChefeAVLIDENTIDADE: TIBStringField;
    Query_ChefeAVLSIGLA: TIBStringField;
    Query_ChefeAVLPOSTOGRADUACAO: TIBStringField;
    Query_ChefeAVLDESCCARGO: TIBStringField;
    Query_ChefeAVLNOME: TIBStringField;
    Query_ChefeAVLQUADROESP: TIBStringField;
    Query_ChefeENSIDCARGO: TSmallintField;
    Query_ChefeENSIDENTIDADE: TIBStringField;
    Query_ChefeENSSIGLA: TIBStringField;
    Query_ChefeENSPOSTOGRADUACAO: TIBStringField;
    Query_ChefeENSDESCCARGO: TIBStringField;
    Query_ChefeENSNOME: TIBStringField;
    Query_ChefeENSQUADROESP: TIBStringField;
    JvCaptionPanel_Assinatura: TJvCaptionPanel;
    GroupBox_ResponsavelPeloEAV: TGroupBox;
    JvGradient2: TJvGradient;
    DBGrid_CoordenadorCurso: TDBGrid;
    GroupBox_ResponsavelPeloENS: TGroupBox;
    DBGrid1: TDBGrid;
    Apartirdoalunoselecionado: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    JvGradient1: TJvGradient;
    Panel_Botoes: TPanel;
    JvGradient3: TJvGradient;
    JvShape4: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_ConfigImpressora: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_Assinatura: TJvTransparentButton;
    CheckBox_Materia: TCheckBox;
    CheckBox_Tempo: TCheckBox;
    DBNavigator_Curriculum: TDBNavigator;
    JvShape_Navigator: TJvShape;
    JvShape5: TJvShape;
    JvTransparentButton_Cad_Disciplina: TJvTransparentButton;
    JvShape_Rubricar: TJvShape;
    JvTransparentButton_Ruberica: TJvTransparentButton;
    JvGradient4: TJvGradient;
    JvShape3: TJvShape;
    JvTransparentButton_Selecao: TJvTransparentButton;
    Panel_Imprimir: TPanel;

    Procedure VerificarCertidao;
    procedure FormActivate(Sender: TObject);
    procedure SelecaoResponsavelPelaAssinatura;

    procedure ExecutaDocumento(VS_Comando: String);
    procedure MontaMateria;
    procedure TrataAluno;
    procedure AjustaRelatorio;
    procedure MontaRelatorio;
    procedure Grava_Linha(VS_Linha, Stilo: String);
    procedure Grava_Linha_Branco(VI_QTD : Integer);
    procedure Grava_Linha_Fase(VS_Fase : String);
    procedure Trocar(Trocar: String; Por: String);
    procedure DBNavigator_CurriculumClick(Sender: TObject; Button: TNavigateBtn);
    procedure ImprimeTodosAlunosClick(Sender: TObject);
    procedure SomenteoAlunoselecionadoClick(Sender: TObject);
    procedure CheckBox_TempoClick(Sender: TObject);
    procedure CheckBox_MateriaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApartirdoalunoselecionadoClick(Sender: TObject);
    procedure JvTransparentButton_AssinaturaClick(Sender: TObject);
    procedure JvTransparentButton_ConfigImpressoraClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RubericaClick(Sender: TObject);
    procedure JvTransparentButton_Cad_DisciplinaClick(Sender: TObject);
    procedure JvTransparentButton_SelecaoClick(Sender: TObject);
  private    { Private declarations }
      VS_SemMedia, VS_NomeChefeEAVA, VS_DivisaoEAVA, VS_NomeChefeDE, VS_DivisaoDE: String;
      VS_DescricaoCurso, VS_Aluno, VS_Periodo, VS_PeriodoDist, VS_DescricaoTempo: String;
      VS_Certidao, VS_Modelo, VS_LocalData, VS_CertidaoAnt, VS_NomeAlunoAnt, VS_MediaAnt: String;
      Vi_QtdLinhas, VI_Pagina, VI_Soma_Tempo, VI_ContLinha: integer;
      VB_MontaCurriculum: Boolean;
      VR_MediaMinima: Real;

  public    { Public declarations }
  end;

var
  Form_MontaCertidaoCurricular: TForm_MontaCertidaoCurricular;

implementation

uses MenuPrincipal, Module, GerarRegCertificados, Sel_Turma,
  Sel_Disciplina, Cad_Disciplina;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.FormActivate(Sender: TObject);
var
   VB_Status: Boolean;
begin
    //---
    // Verificar se calcula a media ou não

    Funcoes.OpenQuery('Select SEM_MEDIA from Curso Where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString);
    VS_SemMedia:= DM.IBQuery_Executa.FieldByName('Sem_Media').AsString;

   JvCaptionPanel_Assinatura.Visible:= False;
   Vi_QtdLinhas:= 63;

   IBTable_PessoaAl.Open;
   IBTable_CertidaoAluno.Open;
   IBQuery_MontaMateria.Open;
   Query_ChefeAVL.Open;
   Query_ChefeENS.Open;

   if Trim(Form_SelTurma.ComboBox_Curso.Text) <> 'ATM015' then
      VR_MediaMinima:= 7
   else
      VR_MediaMinima:= 6;

   VerificarCertidao;

   if ((Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - Amostra - Assinatura Digital') or (Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - Amostra - Assinatura Manual')) then
      VB_Status:= False
   else
      VB_Status:= True;

   DBNavigator_Curriculum.Enabled:= VB_Status;
   ImprimeTodosAlunos.Enabled:= VB_Status;

   //--- Localizar o Chefe da AVL

   Query_ChefeAVL.Locate('SIGLA','EAV',[]);
   Query_ChefeENS.Locate('SIGLA','ENS',[]);
   SelecaoResponsavelPelaAssinatura;

   //--- Monta o Relatorio

   VB_MontaCurriculum:= False;
   VS_CertidaoAnt:= 'CERTIDÃO CURRICULAR Nº #CERTIDAO';
   VS_NomeAlunoAnt:= '#Nome_Aluno';
   VS_MediaAnt:= 'a MÉDIA FINAL #media';

   IBQuery_MontaMateria.Close;
   IBQuery_MontaMateria.Open;

   if ((Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - Amostra - Assinatura Manual') or (Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - Por Turma - Assinatura Manual')) then
      VB_Status:= False
   else
      VB_Status:= True;
   JvTransparentButton_Ruberica.Visible:= VB_Status;
   JvShape_Rubricar.Visible:= VB_Status;

   if ((Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - 2º Via') or (Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular 2º Via (Ass Digital)')) then
      VB_Status:= False
   else
      VB_Status:= True;
   DBNavigator_Curriculum.Visible:= VB_Status;
   JvShape_Navigator.Visible:= VB_Status;

   MontaRelatorio;
end;

procedure TForm_MontaCertidaoCurricular.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_PessoaAl.Close;
   IBTable_CertidaoAluno.Close;
   IBQuery_MontaMateria.Close;
   Query_ChefeAVL.Close;
   Query_ChefeENS.Close;
   IBQuery_MontaMateria.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para finalizar a emissao do relatorio
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Chama o Relatorio
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.MontaRelatorio;
var
   VB_ProximoAluno: Boolean;
   VS_EspacoInicial, VS_Desc_Materia_01,VS_Desc_Materia_02,VS_Desc_Materia_03: string;
   VS_Total_Tempo, VS_AulasPraticas, VS_AulasTeoricas, VS_CargaHoraria: String;
   i, VI_Total_Tempo :integer;

   VR_Total_Tempo: Real;

   VW_Ano1, VW_Mes1, VW_Dia1: Word;
   VW_Ano2, VW_Mes2, VW_Dia2: Word;
begin
   if Trim(DM.IBTable_Turma.FieldByName('DataInicioDist').AsString) <> '' then
   begin
      VS_Modelo:= 'Distancia';
      VI_ContLinha:= 30;  //34
   end
   else
   begin
      VS_Modelo:= 'Normal';
      VI_ContLinha:= 29;   //32
   end;
   VI_Pagina:= 0;

   Text1.Lines.Clear;

   Text1.Paragraph.Alignment := paLeftJustify;
   Text1.SelAttributes.Size := 11;
   Text1.SelAttributes.Name:= 'Courier New';

   //--- Tratamento da Fase II - Inicio do Relatorio

   if VS_Modelo = 'Normal' then
      ExecutaDocumento(' select doc, Descricao from Documento where codigo = 17 ')
   else
      ExecutaDocumento( ' select doc, Descricao from Documento where codigo = 21 ');

   VI_Soma_Tempo:= 0;
   IBQuery_MontaMateria.First;
   While not IBQuery_MontaMateria.EOF do
   begin
      Text1.Paragraph.Alignment := paLeftJustify;
      Text1.SelAttributes.Size := 11;
      Text1.SelAttributes.Name:= 'Courier New';

      //---------- Coleta o nº de aulas Praticas e aulas Teoricas---------//

      VS_AulasPraticas:= IBQuery_MontaMateria.FieldByName( 'NumeroAulasPraticas' ).AsString;
      VS_AulasTeoricas:= IBQuery_MontaMateria.FieldByName( 'NumeroAulasTeoricas' ).AsString;

      //--------------------- Calcula o Tempo da Materia -----------------//

      if trim(VS_AulasPraticas) = '' then
      begin
         ShowMessage('A Disciplina '+IBQuery_MontaMateria.FieldByName( 'CodMateria' ).AsString+'  '+
                                     Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,1,51)+#13+
                                     Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,52,51)+#13+
                                     Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,103,51)+#13+
                     ' não possuí tempo registrado na Aula Prática');
          VS_AulasPraticas:= '-1';
      end;

      if trim(VS_AulasTeoricas) = '' then
      begin
         ShowMessage('A Disciplina '+IBQuery_MontaMateria.FieldByName( 'CodMateria' ).AsString+'  '+
                                     Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,1,51)+#13+
                                     Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,52,51)+#13+
                                     Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,103,51)+#13+
                     ' não possuí tempo registrado na Aula Teórica');
         VS_AulasTeoricas:= '-1';
      end;


      if ((StrToInt(VS_AulasPraticas) > 0) or (StrToInt(VS_AulasTeoricas) > 0 )) then
      begin
         // Trata tempo para hora cheia

         VR_Total_Tempo:= StrToFloat(VS_AulasPraticas)+StrToFloat(VS_AulasTeoricas);
         VI_Total_Tempo:= StrToInt(VS_AulasPraticas)+StrToInt(VS_AulasTeoricas);
         VS_Total_Tempo:= FormatFloat('000',VI_Total_Tempo);

         VS_CargaHoraria:= FormatFloat('000',VR_Total_Tempo)+':00';
      end
      else
      begin
         VS_Total_Tempo := '  ';
         VS_CargaHoraria:= '      ';
      end;           // if ((StrToInt(VS_AulasPraticas) > 0) and (StrToInt(VS_AulasTeoricas) > 0 ))

      if ((Copy(IBQuery_MontaMateria.FieldByName( 'CODMATERIA' ).AsString,3,3) = '000') and
          (Copy(IBQuery_MontaMateria.FieldByName( 'CODMATERIA' ).AsString,6,1) = '0')) then
      begin
         VI_Soma_Tempo:= VI_Soma_Tempo + VI_Total_Tempo;
         VS_EspacoInicial:= '     ';
         if CheckBox_Materia.Checked = True then
            Grava_Linha('', '');
      end
      else
      begin
         VS_EspacoInicial:= '        ';
      end;

      //------------- Coleta e posiciona o Nome da materia ------------//

      if Copy(IBQuery_MontaMateria.FieldByName( 'CODMATERIA' ).AsString,3,4) = '0000' then
      begin
         VS_Desc_Materia_01:= Trim(Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,1,54));
         VS_Desc_Materia_02:= Trim(Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,55,54));
         VS_Desc_Materia_03:= Trim(Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,107,54));
      end
      else
      begin
         VS_Desc_Materia_01:= Trim(Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,1,51));
         VS_Desc_Materia_02:= Trim(Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,52,51));
         VS_Desc_Materia_03:= Trim(Copy(IBQuery_MontaMateria.FieldByName( 'NOMEMATERIA' ).AsString,103,51));
      end;

      if CheckBox_Tempo.Checked = False then
         VS_Total_Tempo := '   ';

      if ((trim(VS_Desc_Materia_02) <> '') or (trim(VS_Desc_Materia_03) <> '')) then
         Grava_Linha(Funcoes.ReplStr(VS_EspacoInicial+VS_Desc_Materia_01,'.',59), '')
      else
         Grava_Linha(Funcoes.ReplStr(VS_EspacoInicial+VS_Desc_Materia_01,'.',59)+'      '+VS_Total_Tempo+'     '+VS_CargaHoraria, '');

      //----------- Verifica se a 2º descricao nao e branco -----------//

      if ( trim(VS_Desc_Materia_02) <> '') then
         if ( trim(VS_Desc_Materia_03) <> '') then
            Grava_Linha(Funcoes.ReplStr(VS_EspacoInicial+VS_Desc_Materia_02,'.',59), '')
         else
            Grava_Linha(Funcoes.ReplStr(VS_EspacoInicial+VS_Desc_Materia_02,'.',59)+'      '+VS_Total_Tempo+'     '+VS_CargaHoraria, '');

      //---------- Verifica se a 3º descricao nao e branco -----------//

      if ( trim(VS_Desc_Materia_03) <> '') then
         Grava_Linha(Funcoes.ReplStr(VS_EspacoInicial+VS_Desc_Materia_03,'.',59)+'      '+VS_Total_Tempo+'     '+VS_CargaHoraria, '');

      IBQuery_MontaMateria.Next;
   end;                // End do While

   //--- Tratamento da certidao quando tiver Atividades

   if ((DM.IBTable_Turma.FieldByName('Administrativas').AsString = '') and
       (DM.IBTable_Turma.FieldByName('Instrucao').AsString = '') and
       (DM.IBTable_Turma.FieldByName('Flexibilizacao').AsString = '') and
       (DM.IBTable_Turma.FieldByName('Avaliacao').AsString = '')) then
   begin

   end
   else
   begin
         Grava_Linha(' ', '');
         Grava_Linha(VS_EspacoInicial+'ATIVIDADES', 'Bold');
         Grava_Linha(' ', '');

      if (DM.IBTable_Turma.FieldByName('Administrativas').AsString <> '') then
      begin
         VI_Soma_Tempo:= VI_Soma_Tempo + DM.IBTable_Turma.FieldByName('Administrativas').AsInteger;
         VS_CargaHoraria:= FormatFloat('000',DM.IBTable_Turma.FieldByName('Administrativas').AsInteger)+':00';
         Grava_Linha(Funcoes.ReplStr(VS_EspacoInicial+'Administrativas','.',59)+'              '+VS_CargaHoraria, '');
      end;

      if (DM.IBTable_Turma.FieldByName('Instrucao').AsString <> '')  then
      begin
         VI_Soma_Tempo:= VI_Soma_Tempo + DM.IBTable_Turma.FieldByName('Instrucao').AsInteger;
         VS_CargaHoraria:= FormatFloat('000',DM.IBTable_Turma.FieldByName('Instrucao').AsInteger)+':00';
         Grava_Linha(Funcoes.ReplStr(VS_EspacoInicial+'Complementação Instrução','.',59)+'              '+VS_CargaHoraria, '');
      end;

      if (DM.IBTable_Turma.FieldByName('Flexibilizacao').AsString <> '')  then
      begin
         VI_Soma_Tempo:= VI_Soma_Tempo + DM.IBTable_Turma.FieldByName('Flexibilizacao').AsInteger;
         VS_CargaHoraria:= FormatFloat('000',DM.IBTable_Turma.FieldByName('Flexibilizacao').AsInteger)+':00';
         Grava_Linha(Funcoes.ReplStr(VS_EspacoInicial+'Flexibilidade','.',59)+'              '+VS_CargaHoraria, '');
      end;

      if (DM.IBTable_Turma.FieldByName('Avaliacao').AsString <> '') then
      begin
         VI_Soma_Tempo:= VI_Soma_Tempo + DM.IBTable_Turma.FieldByName('Avaliacao').AsInteger;
         VS_CargaHoraria:= FormatFloat('000',DM.IBTable_Turma.FieldByName('Avaliacao').AsInteger)+':00';
         Grava_Linha(Funcoes.ReplStr(VS_EspacoInicial+'Avaliação','.',59)+'              '+VS_CargaHoraria, '');
      end;
   end;

   //---


   if VI_ContLinha > 58 then
   begin
      for i:= 1 to (70-VI_ContLinha) do
         Grava_Linha(' ', '');
   end;
   Grava_Linha(' ', '');

   //--- Tratamento da Fase II - Assinatura do Relatorio

   if ((Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - Amostra - Assinatura Digital') or
       (Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - Por Turma - Assinatura Digital')) then
      ExecutaDocumento(' select doc, Descricao from Documento where codigo = 26 ')
   else
      if (Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - 2º Via') then
          ExecutaDocumento(' select doc, Descricao from Documento where codigo = 34 ')
      else
         if (Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular 2º Via (Ass Digital)') then
            ExecutaDocumento( ' select doc, Descricao from Documento where codigo = 35 ')
         else
            ExecutaDocumento(' select doc, Descricao from Documento where codigo = 18 ');

    //--------------------- Tratamento do Periodo do Curso ---------------------//
   //----------------------- Montando o Periodo Inicial -----------------------//

   if trim(DM.IBTable_Turma.FieldByName('DataInicio').AsString) <> '' then
   begin
      DecodeDate(StrToDate(DM.IBTable_Turma.FieldByName('DataInicio').AsString), VW_Ano1, VW_Mes1, VW_Dia1);

      //----------------- Montando o Periodo de Termino ------------------//

      DecodeDate(StrToDate(DM.IBTable_Turma.FieldByName('DataTermino').AsString), VW_Ano2, VW_Mes2, VW_Dia2);
      if VW_Mes1 = VW_Mes2 then
         VS_Periodo:= IntToStr(VW_Dia1)+' a '+IntToStr(VW_Dia2)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),2)+' '+Copy(IntToStr(VW_Ano2),3,2)
      else
      begin
         if VW_Ano1 = VW_Ano2 then
            VS_Periodo:= IntToStr(VW_Dia1)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes1),2)+' a '+IntToStr(VW_Dia2)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),2)+' '+Copy(IntToStr(VW_Ano2),3,2)
         else
            VS_Periodo:= IntToStr(VW_Dia1)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes1),2)+' '+Copy(IntToStr(VW_Ano1),3,2)+' a '+IntToStr(VW_Dia2)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),2)+' '+Copy(IntToStr(VW_Ano2),3,2);
      end;
   end;

    //----------------- Tratamento do Periodo do Curso a Distancia -------------//
   //----------------------- Montando o Periodo Inicial -----------------------//

   if VS_Modelo = 'Normal' then
      VS_PeriodoDist:= ''
   else
   begin
      if trim(DM.IBTable_Turma.FieldByName('DataInicioDist').AsString) <> '' then
      begin
         DecodeDate(StrToDate(DM.IBTable_Turma.FieldByName('DataInicioDist').AsString), VW_Ano1, VW_Mes1, VW_Dia1);   // Coloca o seculo no ano

         //----------------- Montando o Periodo de Termino ------------------//

         DecodeDate(StrToDate(DM.IBTable_Turma.FieldByName('DataTerminoDist').AsString), VW_Ano2, VW_Mes2, VW_Dia2);   // Coloca o seculo no ano

         if VW_Mes1 = VW_Mes2 then
            VS_PeriodoDist:= IntToStr(VW_Dia1)+' a '+IntToStr(VW_Dia2)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),2)+' '+Copy(IntToStr(VW_Ano2),3,2)
         else
            VS_PeriodoDist:= IntToStr(VW_Dia1)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes1),2)+' a '+IntToStr(VW_Dia2)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),2)+' '+Copy(IntToStr(VW_Ano2),3,2);
      end;
   end;

   if ((Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - 2º Via') or
       (Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular 2º Via (Ass Digital)')) then
      VS_LocalData:= Funcoes.RetornaCidade(DateToStr(Date))
   else
      if trim(DM.IBTable_Turma.FieldByName('dataTermino').AsString) <> '' then
         VS_LocalData:= Funcoes.RetornaCidade(DM.IBTable_Turma.FieldByName('dataTermino').AsString)
      else
         VS_LocalData:= Funcoes.RetornaCidade(DateToStr(Date));

   VS_DescricaoTempo:= Funcoes.Extenso(FormatFloat('0000', VI_Soma_Tempo),'v');

   if ((Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString) = '') or (VS_SemMedia = 'S')) then
       AjustaRelatorio
   else
   begin
      VB_ProximoAluno:= True;
      While ((VB_ProximoAluno = True) and (not Form_SelTurma.IBQuery_AlunoTurma.eof)) do
      begin
         if StrToFloat(Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString)) >= VR_MediaMinima then
         begin
            AjustaRelatorio;
           VB_ProximoAluno:= False;
         end
         else
         begin
            Form_SelTurma.IBQuery_AlunoTurma.Next;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento dos Dados do Aluno (Posto/Graduacao/Nome)
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.TrataAluno;
var
   VS_QdroEsp, VS_Posto : String;
begin
      //---------------- Tratamento do Nome do Curso ----------//

      if Funcoes.GetIdCurso = '4' then
      begin
         VS_Posto:= Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName( 'PostoGraduacao' ).AsString);

         if ((VS_Posto = '1S') or (VS_Posto = '2S') or (VS_Posto = '3S') or (VS_Posto = 'SO') or
             (VS_Posto = '1º SG') or (VS_Posto = '2º SG') or (VS_Posto = '3º SG') or (VS_Posto = 'ST') or
             (VS_Posto = '1º Sgt') or (VS_Posto = '2º Sgt') or (VS_Posto = '3º Sgt')) Then
            VS_DescricaoCurso:= 'OPERADOR DE SISTEMA DE INSPEÇÃO EM VÔO'
         else
            VS_DescricaoCurso:= Trim(Form_SelTurma.Label_DescricaoCurso.Caption);
      end
      else
         VS_DescricaoCurso:= Trim(Form_SelTurma.Label_DescricaoCurso.Caption);


   VS_Posto:= Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName( 'PostoGraduacao' ).AsString);

   if (VS_Posto = 'CIVIL') or (VS_Posto = 'CV')  then
   begin
      VS_Posto := '';
      VS_QdroEsp:= '';
   end
   else
   begin
      VS_QdroEsp:= Trim(IBTable_PessoaAl.FieldByName('QuadroEsp').AsString);

      if VS_QdroEsp = 'QOENG TE' then
         VS_QdroEsp := 'QOENG TEL'
      else
         if VS_QdroEsp = 'QOENG EL' then
            VS_QdroEsp := 'QOENG ELN';
   end;

   if Form_MontaCertidaoCurricular.Caption = 'Curriculum Escolar - Amostra' then
      VS_Aluno:= 'Nome do aluno '
   else
      if VS_Posto = '' then
         VS_Aluno:= Trim(IBTable_PessoaAl.FieldByName( 'NOME' ).AsString)
      else
         VS_Aluno:= Trim(IBTable_PessoaAl.FieldByName( 'NOME' ).AsString)+' - '+VS_Posto+' '+VS_QdroEsp;
end;

//------------------------------------------------------------------------------
// Gravacao das Linhas em Branco do Comentario do Relatorio
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.AjustaRelatorio;
var
   VS_media, VS_DescricaoMedia, VS_Ret, VS_Nota: String;
   VR_Nota: Real;
   I: Integer;
begin
   TrataAluno;
   if Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - Amostra' then
   begin
      Trocar('#CERTIDAO', '999/AAAA/9999');
      Trocar('#Curso-', 'Cod-Curso');
      Trocar('#CursoDescrição', 'Descrição-Curso' );
      Trocar('#o', 'o');
      Trocar('#Nome_Aluno', 'Nome-Aluno');
      Trocar('#Periodo', 'Periodo');
      Trocar('#media', 'Média' );
      Trocar('#MediaExtenso', 'Descrição Media' );
      Trocar('#Temp', '0000');
      Trocar('#Tempo_Descricao', 'Descrição-Tempo' );
   end
   else
   begin
      //---------------- Tratamento da Nota por Extenso ----------//

      if VS_SemMedia = 'S' then
      begin
         VS_Nota:= ' ';
         VS_Ret:= ' ';
      end
      else
      begin
         VS_Nota:= Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString);
         if Trim(VS_Nota) = '' then
         begin
            VS_Nota:= ' ';
            VS_Ret:= ' ';
         end
         else
         begin
            VR_Nota :=StrToFloat(VS_Nota) ;
            VS_Nota := FormatFloat('0#.00',VR_Nota);
            VS_Ret:= Funcoes.Extenso(VS_Nota,'V');
         end;
      end;

      if trim(VS_Nota) = '' then
      begin
          VS_media:='aproveitamento ';
      end
      else
      begin
         if ((Trim(VS_Ret) = 'ZERO') or (Trim(VS_Ret) = '')) then
         begin
            VS_media:='' ;
            VS_DescricaoMedia:='';
         end
         else
         begin
            VS_media:=VS_Nota;
            VS_DescricaoMedia:= ' ( '+VS_Ret+' )';
         end;

         VS_media:= 'a MÉDIA FINAL '+VS_media+VS_DescricaoMedia;
      end;

      if ( (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') and
           (VS_Certidao <> '0000')) then
         VS_Certidao:= 'CERTIDÃO CURRICULAR Nº '+FormatFloat('0000', IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger)+'/'+DM.IBTable_Configuracao.FieldByName('SIGLA').AsString+'/'+IBTable_CertidaoAluno.FieldByName('Ano').AsString;

      Trocar(VS_CertidaoAnt,  VS_Certidao);
      Trocar(VS_NomeAlunoAnt, VS_Aluno);
      VS_CertidaoAnt:= VS_Certidao;
      VS_NomeAlunoAnt:= VS_Aluno;

      Trocar(VS_MediaAnt, trim(VS_Media) );
      VS_MediaAnt:= trim(VS_Media);

      if VB_MontaCurriculum = False then
      begin
         Trocar('#Curso-', Trim(Form_SelTurma.ComboBox_Curso.Text)+':');
         Trocar('#CursoDescrição', VS_DescricaoCurso );
         Trocar('#Periodo', VS_Periodo);
         Trocar('#Distancia', VS_PeriodoDist);
         Trocar('#Temp', FormatFloat('0000', VI_Soma_Tempo));
         Trocar('#Tempo_Descricao', VS_DescricaoTempo );
      end;
   end;

   if VB_MontaCurriculum = False then
   begin
      Trocar('#NomeChefeEAVA', VS_NomeChefeEAVA);
      Trocar('#DivisaoEAVA', VS_DivisaoEAVA);
      Trocar('#NomeChefeDE',VS_NomeChefeDE);
      Trocar('#DivisaoDE', VS_DivisaoDE);
      Trocar('#Local_Data', VS_LocalData);
      Trocar('#Assinatura', Funcoes.CentraStr(Trim(VS_NomeChefeDE), 45));
      Trocar('#Cargo', Funcoes.CentraStr(Trim(VS_DivisaoDE), 45));

      for i := 1 to VI_Pagina do
         Trocar('#TotalPagina', IntToStr(VI_Pagina));
   end;
   VB_MontaCurriculum:= true;
   Text1.SelStart:= 0;
end;

//------------------------------------------------------------------------------
// Gravacao das Linhas no Relatorio
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.Grava_Linha(VS_Linha, Stilo: String);
var
   VS_Comando: STring;
begin
   Text1.Paragraph.Alignment := paLeftJustify;
   Text1.SelAttributes.Size := 11;
   Text1.SelAttributes.Name:= 'Courier New';
   if  Stilo = 'Bold' then
      Text1.SelAttributes.Style := [fsBold];

   VI_ContLinha:= VI_ContLinha+1;

   if VI_ContLinha >= Vi_QtdLinhas then
   begin
      if ((Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - Amostra - Assinatura Manual') or
          (Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - Por Turma - Assinatura Manual')) then
      begin
         Vi_QtdLinhas:= 66;
      end
      else
      begin
         VS_Comando:= ' select doc, Descricao from Documento where codigo = 27 ';
         ExecutaDocumento(VS_Comando);
         Vi_QtdLinhas:= 63;      // 66
      end;
      VI_Pagina:= VI_Pagina +1;
      Grava_Linha_Branco( 3 );
      Grava_Linha_Branco( 4 );
      VI_ContLinha:= 4;
   end;
   Text1.Paragraph.Alignment := paLeftJustify;
   Text1.SelAttributes.Size := 11;
   Text1.SelAttributes.Name:= 'Courier New';
   Text1.Lines.Add(VS_Linha);
end;

//------------------------------------------------------------------------------
// Gravacao das Linhas em Branco do Comentario do Relatorio
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.Grava_Linha_Branco(VI_QTD : Integer);
var
   VI_Cont: Integer;
begin
   Text1.Paragraph.Alignment := paLeftJustify;
   Text1.SelAttributes.Size := 11;
   Text1.SelAttributes.Name:= 'Courier New';
   For VI_Cont := 1 to VI_QTD do
      Text1.Lines.Add('');   // Procedure para gravacao dos dados do Detalhe
end;

//------------------------------------------------------------------------------
// Gravacao das Linhas em Branco do Comentario do Relatorio
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.Grava_Linha_Fase(VS_Fase : String);
begin
   Text1.Paragraph.Alignment := paLeftJustify;
   Text1.SelAttributes.Size := 11;
   Text1.SelAttributes.Name:= 'Courier New';
   Text1.Lines.Add(VS_Fase);   // Procedure para gravacao dos dados do Detalhe
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel por do texto
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.Trocar(Trocar: String; Por: String);
var
   Posicao: Integer;
begin
  Posicao := Text1.FindText(Trocar, 0, Length(Text1.Text), []);
  if Posicao > 0 then
  begin
     Text1.SelStart := Posicao;
     Text1.SelLength := Length(Trocar);
     Text1.SelText := Por;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de selecao do Curriculum
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.DBNavigator_CurriculumClick(Sender: TObject;Button: TNavigateBtn);
begin
   if ((Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString) = '') or (VS_SemMedia = 'S')) then
       AjustaRelatorio
   else
      if StrToFloat(Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString)) >= VR_MediaMinima then
          AjustaRelatorio
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento para mostra o Unidade
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.CheckBox_MateriaClick(Sender: TObject);
begin
   MontaMateria;
   FormActivate(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para mostrar o tempo
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.CheckBox_TempoClick(Sender: TObject);
begin
   FormActivate(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para definir como sera mostrado a materia
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.MontaMateria;
begin
   if CheckBox_Materia.Checked = True then
      Funcoes.ExecutaQuery(IBQuery_MontaMateria, ' Select NomeMateria, CodMateria, NumeroAulasPraticas, NumeroAulasTeoricas '+
                                                 ' From MateriaCurso '+
                                                 ' Where IdCurso = :IdCurso '+
                                                 ' and IdTurma = :IdTurma '+
                                                 ' and substring(codmateria from 5 for 2) = '+#39+'00'+#39+
                                                 ' Order By CodMateria '
                          )
   else
      Funcoes.ExecutaQuery(IBQuery_MontaMateria, 'Select NomeMateria, CodMateria, NumeroAulasPraticas, NumeroAulasTeoricas '+
                                                 ' From MateriaCurso '+
                                                 ' Where IdCurso = :IdCurso '+
                                                 ' and IdTurma = :IdTurma '+
                                                 ' and substring(CodMateria from 3 for 4) = '+#39+'0000'+#39+
                                                 ' Order By CodMateria '
                           );
   Vi_QtdLinhas:= 63;
   MontaRelatorio;
end;

//------------------------------------------------------------------------------
// Tratamento para Habilitar a janela de selecao para assinatura do relatorio
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.JvTransparentButton_AssinaturaClick(Sender: TObject);
begin
  JvCaptionPanel_Assinatura.Visible:= true;
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao do Responsavel pela assinatura
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.SelecaoResponsavelPelaAssinatura;
begin
   VS_NomeChefeEAVA:= Trim(Query_ChefeAVL.FieldByName('nome').AsString)+' '+
                      Trim(Query_ChefeAVL.FieldByName('PostoGraduacao' ).AsString)+' '+
                      Trim(Query_ChefeAVL.FieldByName('QuadroEsp' ).AsString);

   VS_DivisaoEAVA:= Query_ChefeAVL.FieldByName( 'DESCCARGO' ).AsString;

   VS_NomeChefeDE:= Trim(Query_ChefeENS.FieldByName('nome').AsString)+' '+
                    Trim(Query_ChefeENS.FieldByName('PostoGraduacao' ).AsString)+' '+
                    Trim(Query_ChefeENS.FieldByName('QuadroEsp').AsString);

   VS_DivisaoDE:= Query_ChefeENS.FieldByName('DescCargo').AsString;
end;

procedure TForm_MontaCertidaoCurricular.JvTransparentButton_SelecaoClick( Sender: TObject);
begin
   Vi_QtdLinhas:= 63;

   JvCaptionPanel_Assinatura.Visible:= False;
   SelecaoResponsavelPelaAssinatura;
   MontaMateria;
   Text1.SetFocus;
end;

//------------------------------------------------------------------------------
// Trata o botao que chama a janela de tratamento do Cadastro da Disciplina
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.JvTransparentButton_Cad_DisciplinaClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Sel_Disciplina, Form_Sel_Disciplina);
   Funcoes.SetCadCurso('CertidaoCurricular');
   Form_Cad_Disciplina.Show;
end;

//------------------------------------------------------------------------------
// Executa a Query de Tratamento do Cabecalho do Documento
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.ExecutaDocumento(VS_Comando: String);
begin
   Funcoes.ExecutaQuery(IBQuery_Documento, VS_Comando);

   Documento.SelectAll;
   Documento.CopyToClipboard ;
   Text1.PasteFromClipboard ;
end;

//------------------------------------------------------------------------------
// Tratamento do botao que insere a Rubrica no relatorio
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.JvTransparentButton_RubericaClick(Sender: TObject);
begin
   ExecutaDocumento('select doc, Descricao from Documento where codigo = 27 ');
end;

//------------------------------------------------------------------------------
// Tratamento para verificar a Certidao do Aluno
//------------------------------------------------------------------------------

Procedure TForm_MontaCertidaoCurricular.VerificarCertidao;
begin
   if Form_MontaCertidaoCurricular.Caption = 'Certidão Curricular - 2º Via' then
   begin
      VS_Certidao:= '';
   end
   else
   begin
      if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SIAT-MN' then
         VS_Certidao:= 'CERTIDÃO CURRICULAR Nº '+IBTable_CertidaoAluno.FieldByName('Certificado').AsString+'/'+DM.IBTable_Configuracao.FieldByName('SIGLA').AsString+'/'+Funcoes_TrataData.AnoAtual
      else
      begin
         if IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsString = '' then
         begin
            if MessageDlg('A Turma não possuí número da Certidão.'+#13+'Deseja gerar Certidão agora ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
               Application.CreateForm(TForm_GerarRegCertificados, Form_GerarRegCertificados);
               Form_GerarRegCertificados.Show;
               VS_Certidao:= 'CERTIDÃO CURRICULAR Nº '+FormatFloat('0000', IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger)+'/'+DM.IBTable_Configuracao.FieldByName('SIGLA').AsString+'/'+IBTable_CertidaoAluno.FieldByName('Ano').AsString;
            end
            else
               VS_Certidao:= 'CERTIDÃO CURRICULAR Nº 0000';
         end
         else
         begin
            VS_Certidao:= 'CERTIDÃO CURRICULAR Nº '+FormatFloat('0000', IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger)+'/'+DM.IBTable_Configuracao.FieldByName('SIGLA').AsString+'/'+IBTable_CertidaoAluno.FieldByName('Ano').AsString;
         end;
      end;
   end;
end;

procedure TForm_MontaCertidaoCurricular.JvTransparentButton_ConfigImpressoraClick(Sender: TObject);
begin
   PrinterSetupDialog1.Execute;
end;

procedure TForm_MontaCertidaoCurricular.ApartirdoalunoselecionadoClick( Sender: TObject);
var
   x, y, N: Integer;
   Rel: String;
   bmLocal : TBookmark;
begin
   if VS_Certidao = '0000' then
   begin
      ShowMessage('Não foi gerado o número de Certidão...'+#13+'Para gerar a certidão deverá voltar para Cadastro da Turma e selecionar o'+#13+'Botão <Gerar nº Certidão>.');
   end
   else
   begin
      bmLocal:= Form_SelTurma.IBQuery_AlunoTurma.GetBookMark;
      Panel_Imprimir.Caption:= 'Aguarde imprimindo...';
      Update;
      While not Form_SelTurma.IBQuery_AlunoTurma.eof do
      begin
         if (( Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString) = '') or (VS_SemMedia = 'S') or
             ( StrToFloat(Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString)) >= VR_MediaMinima)) then
         begin
            if PrintDialog1.Execute then
            begin
               For N := 1 to PrintDialog1.Copies do
               Begin
                  Rel:= 'Certidao'+IntToStr(n)+'.Rel';
                  AjustaRelatorio;
                  Text1.Print(Rel);
               end;
            end;
         end;
         Form_SelTurma.IBQuery_AlunoTurma.Next;
      end;
      Panel_Imprimir.Caption:= 'Impressão Finalizada... ';
      update;
   end;
   if Form_SelTurma.IBQuery_AlunoTurma.Recordcount > 0 then
       Form_SelTurma.IBQuery_AlunoTurma.GotoBookMark(bmLocal);
   Form_SelTurma.IBQuery_AlunoTurma.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Tratamento da opcao de impressao de todos registros
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.ImprimeTodosAlunosClick(Sender: TObject);
var
   N: Integer;
   Rel: String;
   bmLocal : TBookmark;
begin
   if VS_Certidao = '0000' then
   begin
      ShowMessage('Não foi gerado o número de Certidão...'+#13+'Para gerar a certidão deverá voltar para Cadastro da Turma e selecionar o'+#13+'Botão <Gerar nº Certidão>.');
   end
   else
   begin
      bmLocal:= Form_SelTurma.IBQuery_AlunoTurma.GetBookMark;
      Panel_Imprimir.Caption:= 'Aguarde imprimindo...';
      Update;
      Form_SelTurma.IBQuery_AlunoTurma.First;
      While not Form_SelTurma.IBQuery_AlunoTurma.eof do
      begin
         if (( Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString) = '') or (VS_SemMedia = 'S') or
             ( StrToFloat(Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString)) >= VR_MediaMinima)) then
         begin
            if PrintDialog1.Execute then
            begin
               For N := 1 to PrintDialog1.Copies do
               Begin
                  Rel:= 'Certidao'+IntToStr(n)+'.Rel';
                  AjustaRelatorio;
                  Text1.Print(Rel);
               end;
            end;
         end;
         Form_SelTurma.IBQuery_AlunoTurma.Next;
      end;
      Panel_Imprimir.Caption:= 'Impressão Finalizada... ';
      update;
   end;
   if Form_SelTurma.IBQuery_AlunoTurma.Recordcount > 0 then
       Form_SelTurma.IBQuery_AlunoTurma.GotoBookMark(bmLocal);
   Form_SelTurma.IBQuery_AlunoTurma.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Tratamento da opcao de impressao do registro selecionado
//------------------------------------------------------------------------------

procedure TForm_MontaCertidaoCurricular.SomenteoAlunoselecionadoClick(Sender: TObject);
var
   N: Integer;
   Rel: String;
begin
  if VS_Certidao = '0000' then
     ShowMessage('Não foi gerado o número de Certidão...'+#13+'Para gerar a certidão deverá voltar para Cadastro da Turma e selecionar o'+#13+'Botão <Gerar nº Certidão>.')
  else
  begin
     if (( Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString) = '') or
         (VS_SemMedia = 'S') or
         ( StrToFloat(Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString)) >= VR_MediaMinima)) then
     begin
        Panel_Imprimir.Caption:= 'Aguarde imprimindo...';
        Update;
        if PrintDialog1.Execute then
        begin
           for N := 1 to PrintDialog1.Copies do
           Begin
              Rel:= 'Certidao'+IntToStr(n)+'.Rel';
              AjustaRelatorio;
              Text1.Print(Rel);
           end;
        end;
        Panel_Imprimir.Caption:= 'Impressão Finalizada... ';
        update;
     end;
  end;
end;

end.

