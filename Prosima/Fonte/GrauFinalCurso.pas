//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : GrauFinalCurso.PAS                             //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar o relatorio  //
//                             Grau Final de Curso.                           //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//           Estagiário      :                                                //
//                                                                            //
// INICIO DA ELABORACAO      : 11/05/2007                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit GrauFinalCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, IBCustomDataSet, IBTable, IBQuery, Rotinas, ComObj,
  StdCtrls, JvRichEd, JvDBRichEd, PsyRichEdit, ToolWin;

type
  TForm_GrauFinalCurso = class(TForm)
    IBQuery_AlunoTurma: TIBQuery;
    DSQ_AlunoTurma: TDataSource;
    IBTable_AlunoTurma: TIBTable;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    IBQuery_AlunoTurmaNUMORDEM: TSmallintField;
    IBQuery_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBQuery_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBQuery_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBQuery_AlunoTurmaNOME: TIBStringField;
    IBQuery_AlunoTurmaQUADROESP: TIBStringField;
    IBTable_AlunoTurmaIDCURSO: TSmallintField;
    IBTable_AlunoTurmaIDTURMA: TIntegerField;
    IBTable_AlunoTurmaIDENTIDADE: TIBStringField;
    IBTable_AlunoTurmaNUMORDEM: TSmallintField;
    IBTable_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBTable_AlunoTurmaIDUNIDADE: TIBStringField;
    IBTable_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBTable_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBTable_AlunoTurmaDATAMATRICULA: TDateTimeField;
    IBTable_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBTable_AlunoTurmaDATADESLIGAMENTO: TDateTimeField;
    IBTable_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBTable_AlunoTurmaREGISTRARVEICULO: TIBStringField;
    IBTable_AlunoTurmaINSTITUTO: TIBStringField;
    IBTable_AlunoTurmaTIPO_ALUNO: TIBStringField;
    IBTable_AlunoTurmaNOMECOMPLETO: TIBStringField;
    IBTable_AlunoTurmaCHAMADA: TIBStringField;
    IBQuery_Documento: TIBQuery;
    IBQuery_DocumentoDOC: TIBStringField;
    IBQuery_DocumentoDESCRICAO: TBlobField;
    DSQ_Documentacao: TDataSource;
    Documento: TJvDBRichEdit;
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_Imprimir: TToolButton;
    ToolButton_Salvar: TToolButton;
    ToolButton7: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Text1: TPsyRichEdit;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    IBTable_Estagiario: TIBTable;
    IBTable_EstagiarioID_ATCO: TIBStringField;
    IBTable_EstagiarioESTAGIARIO: TIBStringField;
    IBQuery_Cad_Avaliados: TIBQuery;
    IBQuery_Cad_AvaliadosIDCURSO: TSmallintField;
    IBQuery_Cad_AvaliadosIDTURMA: TIntegerField;
    IBQuery_Cad_AvaliadosID_FICHA: TIntegerField;
    IBQuery_Cad_AvaliadosID_ATCO: TIBStringField;
    IBQuery_Cad_AvaliadosID_AVL: TIBStringField;
    IBQuery_Cad_AvaliadosID_EXERCICIO: TIntegerField;
    IBQuery_Cad_AvaliadosID_INSTRUTOR: TIBStringField;
    IBQuery_Cad_AvaliadosNOMECOMPLETO: TIBStringField;
    IBQuery_Cad_AvaliadosDATA_AVL: TDateTimeField;
    IBQuery_Cad_AvaliadosLOCAL: TIBStringField;
    IBQuery_Cad_AvaliadosMEDIA: TIBBCDField;
    IBQuery_Cad_AvaliadosPARECER: TBlobField;
    IBQuery_Cad_AvaliadosNS: TIBStringField;
    IBQuery_Cad_AvaliadosFICHACOMPLETA: TIBStringField;
    DSQ_Cad_Avaliados: TDataSource;
    IBQuery_FichaAvaliacao: TIBQuery;
    IBQuery_FichaAvaliacaoAREA_AVALIACAO: TIBStringField;
    IBQuery_FichaAvaliacaoBOM: TIBStringField;
    IBQuery_FichaAvaliacaoDESCRICAO: TIBStringField;
    IBQuery_FichaAvaliacaoID_ATCO: TIBStringField;
    IBQuery_FichaAvaliacaoID_AVL: TIBStringField;
    IBQuery_FichaAvaliacaoID_EXERCICIO: TIntegerField;
    IBQuery_FichaAvaliacaoID_FICHA: TIntegerField;
    IBQuery_FichaAvaliacaoID_ITEM: TIBStringField;
    IBQuery_FichaAvaliacaoIDCURSO: TSmallintField;
    IBQuery_FichaAvaliacaoIDTURMA: TIntegerField;
    IBQuery_FichaAvaliacaoNA: TIBStringField;
    IBQuery_FichaAvaliacaoNS: TIBStringField;
    IBQuery_FichaAvaliacaoOTIMO: TIBStringField;
    IBQuery_FichaAvaliacaoREGULAR: TIBStringField;
    DSQ_Avaliacao: TDataSource;
    IBTable_FichaAvaliacao: TIBTable;
    IBTable_FichaAvaliacaoIDCURSO: TSmallintField;
    IBTable_FichaAvaliacaoIDTURMA: TIntegerField;
    IBTable_FichaAvaliacaoID_FICHA: TIntegerField;
    IBTable_FichaAvaliacaoID_ATCO: TIBStringField;
    IBTable_FichaAvaliacaoID_AVL: TIBStringField;
    IBTable_FichaAvaliacaoID_EXERCICIO: TIntegerField;
    IBTable_FichaAvaliacaoID_ITEM: TIBStringField;
    IBTable_FichaAvaliacaoOTIMO: TIBStringField;
    IBTable_FichaAvaliacaoBOM: TIBStringField;
    IBTable_FichaAvaliacaoREGULAR: TIBStringField;
    IBTable_FichaAvaliacaoNS: TIBStringField;
    IBTable_FichaAvaliacaoNA: TIBStringField;
    IBTable_FichaAvaliacaoAREA_AVALIACAO: TIBStringField;
    IBTable_FichaAvaliacaoDESCRICAO: TIBStringField;
    DataSource1: TDataSource;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;

    procedure Processar;
    procedure Mostrar_Medias;

    procedure SetFileName(const FileName: String);
    procedure FileSaveAs(Sender: TObject);
    procedure Trocar(Trocar: String; Por: String);
    Procedure Linha_Em_Branco(VI_Qtd: Integer);
    Procedure Gravar_RelGrauFinalCurso(PS_Detalhe: String);

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton_ImprimirClick(Sender: TObject);
    procedure ToolButton_SalvarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);

  private    { Private declarations }
    FFileName: string;
    VI_NumOrSeq: integer;
    VI_TotalReg, VI_OTIMO, VI_BOM, VI_REGULAR, VI_NS, VI_NA: Integer;

  public    { Public declarations }
  end;

var
  Form_GrauFinalCurso: TForm_GrauFinalCurso;

implementation

uses Module, MenuPrincipal, Relatorio_Geral;

resourcestring
  sSaveChanges = 'Salvar arquivo %s?';
  sOverWrite = 'Substituir arquivo %s';
  sUntitled = 'Sem nome';
  sModified = 'Modificado';
  sColRowInfo = 'Linha: %3d   Coluna: %3d';

{$R *.dfm}

procedure TForm_GrauFinalCurso.FormActivate(Sender: TObject);
var
   VS_Detalhe, VS_NotaFinal : String;
   VS_Nome2, VS_PostoGrad, VS_QuadroEsp, VS_Nome, VS_Comando, VS_MediaTurma : String;
   VI_Tam1, VI_Tam, VI_Branco, VI_Cont,VI_Cont2, VI_Linha, VI_Tot_Alu: integer;
   VI_Tama, VI_TamPosto, VI_ContDeslig, VI_Tot_Alu_Sobr : integer;
   VR_NotaFinal, VR_MediaTurma: Real;
begin
   if Funcoes.GetRelDesempenho = 'Iniciado' then
   begin
      Funcoes.SetRelDesempenho('Processando');

      IBQuery_Cad_Avaliados.Open;
      IBQuery_FichaAvaliacao.Open;
      IBTable_FichaAvaliacao.Open;

      IBQuery_Cad_Avaliados.First;
      While not IBQuery_Cad_Avaliados.Eof do
      begin
         if IBQuery_Cad_Avaliados.FieldByName('Media').AsString = '' then
         begin
            Processar;
         end;
         IBQuery_Cad_Avaliados.Next;
      end;

       //---
      //   Tratamento do Cabecalho do Relatorio

      Funcoes.AtualizaQuery(IBQuery_AlunoTurma);

      Text1.Lines.Clear;
      Documento.SelectAll;
      Documento.CopyToClipboard ;
      Text1.PasteFromClipboard ;
      IBQuery_Documento.Close;

      Trocar('#Cabecalho', 'GRAU FINAL DE CURSO' );
      Text1.Lines.Add(Funcoes.CentraStr(Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('CodCurso').AsString, 98));
      Text1.Lines.Add(Funcoes.CentraStr(Trim(Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('Turma').AsString)+' DE '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('Ano').AsString, 98));
      Text1.Lines.Add('');
      Text1.Lines.Add('');

      //----------------- Tratamento do Relatorio  -----------------//

      IBTable_AlunoTurma.Close;
      IBTable_AlunoTurma.Open;

      DM.IBQuery_Cargo.Open;
      IBTable_Estagiario.Open;

      DM.IBQuery_Cargo.Locate('IdCargo', VarArrayOf(['5']), [loPartialKey]);

      VS_Comando:= 'Select IdCurso, IdTurma, Identidade, IdAntiguidade, NumOrdem, PostoGraduacao, MotivoDesligamento, CodigoAluno, NotaFinal, nome, quadroEsp '+
                   ' from Aluno_Turmas_View '+
                   ' Where IdCurso = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdCurso').AsString+
                   ' and   IdTurma = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdTurma').AsString+
                   ' Order by NotaFinal Desc, IdAntiguidade';
      Funcoes.ExecutaQuery( IBQuery_AlunoTurma, VS_Comando);
      IBQuery_AlunoTurma.Last;
      VI_Tot_Alu:= IBQuery_AlunoTurma.RecordCount;

      if VI_Tot_Alu = 0 then
      begin
         ShowMessage('Não foi selecionado a Turma para montagem do Relatório...');
      end
      else
      begin
         IBQuery_AlunoTurma.First;
         While not IBQuery_AlunoTurma.EOF do
         begin
            if (IBQuery_AlunoTurma.FieldByName('motivoDesligamento').AsString <> ' ')  and
               (IBQuery_AlunoTurma.FieldByName('motivoDesligamento').AsString <> NULL) and
               (IBQuery_AlunoTurma.FieldByName('motivoDesligamento').AsString <> 'a')   and
               (IBQuery_AlunoTurma.FieldByName('motivoDesligamento').AsString <> '')   then
            begin
               IBTable_AlunoTurma.edit;
               IBTable_AlunoTurma.FieldByName('NotaFinal').AsFloat := 0 ;
               IBTable_AlunoTurma.Post;
               Funcoes.ExecutaTransacao_Prosima;
            end;
            IBQuery_AlunoTurma.Next;
         end;

         VI_Cont      := 1;
         VI_Cont2     := 1;
         VI_NumOrSeq  := 0;
         VI_Linha     := 8;

         VR_MediaTurma:= 0;
         VI_ContDeslig:= 0;

         //------------- Determina o tamanho do Maior Posto Graduacao -----------//

         VI_TamPosto:= 11;
         While not IBQuery_AlunoTurma.EOF do
         begin
            if VI_TamPosto < Length(Trim(IBQuery_AlunoTurma.FieldByName('postoGraduacao').AsString)) then
               VI_TamPosto:= Length(Trim(IBQuery_AlunoTurma.FieldByName('postoGraduacao').AsString))+1;
            IBQuery_AlunoTurma.Next;
         end;

         //---------------------- Leitura da tabela de Aluno_Turma ---------------//

         IBQuery_AlunoTurma.First;

         While not IBQuery_AlunoTurma.EOF do
         begin
            //-------Leitura da tabela Aluno_Turma ja na ordem de nota    --------//

            VR_NotaFinal:= 0;
            VI_Linha:= VI_Linha + 1;

            if ( Trim(copy(String(IBQuery_AlunoTurma.FieldByName('postoGraduacao').AsString),1,4)) = 'TEN1' ) then
               VS_PostoGrad := 'TEN 1º'
            else
               if ( Trim(copy(String(IBQuery_AlunoTurma.FieldByName( 'postoGraduacao' ).AsString),1,5)) = 'TEN C' ) then
                   VS_PostoGrad := 'Ten Cel'  //Ok
               else
                  if ( Trim(copy(String(IBQuery_AlunoTurma.FieldByName( 'postoGraduacao' ).AsString),1,5)) = 'SubT' ) then
                     VS_PostoGrad := 'SubTen' //Ok
                  else
                     VS_PostoGrad:= Trim(IBQuery_AlunoTurma.FieldByName('postoGraduacao').AsString);

            For VI_Branco := Length(VS_PostoGrad) to VI_TamPosto do
               VS_PostoGrad:= VS_PostoGrad+' ';

            //--- Trata o Quadro e a Especialidade

            if IBQuery_AlunoTurma.FieldByName('QuadroEsp').AsString = 'x' then
               VS_QuadroEsp := ' '
            else
               VS_QuadroEsp:= Trim(IBQuery_AlunoTurma.FieldByName('QuadroEsp').AsString);

            For VI_Branco := Length(VS_QuadroEsp) to 10 do
               VS_QuadroEsp:= VS_QuadroEsp+' ';

            VS_Nome:= IBQuery_AlunoTurma.FieldByName('nome').AsString;
            if Length(VS_Nome) > 41 then
               VS_Nome2:= Copy(VS_Nome, 41, 41)
            else
               VS_Nome2:= '';

            VS_Nome:= Copy(VS_Nome, 1, 41);
            For VI_Branco := Length(VS_Nome) to  41 do
               VS_Nome:= VS_Nome+' ';

            if (IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString <> ' ') and
               (IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString <> NULL)and
               (IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString <> 'a')  and
               (IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString <> '')  then
            begin
               VS_Detalhe:= '     '+FormatFloat('0#',VI_Cont)+' - '+VS_PostoGrad+VS_QuadroEsp+VS_Nome+
                            'Deslig.:'+IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString;
               VI_ContDeslig := VI_ContDeslig + 1;
            end
            else
            begin
               VR_NotaFinal:= IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsFloat;
               VS_NotaFinal := FormatFloat('0#.000',VR_NotaFinal); //Table_Aluno_Turma.FieldByName('NOTAFINAL').AsString ;

               if VS_NotaFinal = '' then
                 VS_NotaFinal:= '0' ;

               VI_Tama := length(VS_NotaFinal);

               if (( VS_NotaFinal = '10' ) or (VI_Tama = 1)) then
                  VS_NotaFinal:=VS_NotaFinal+',00' ;

               if (copy(VS_NotaFinal,2,1)=',') then
                  VS_NotaFinal := copy(VS_NotaFinal,1,4)
               else
                  VS_NotaFinal := copy(VS_NotaFinal,1,5) ;

               VR_NotaFinal := StrToFloat(VS_NotaFinal);

               if IBTable_Estagiario.FieldByName('Estagiario').AsString = 'S' then
                  VS_Detalhe:= '       '+FormatFloat('0#',VI_Cont)+' - '+VS_PostoGrad+' '+VS_QuadroEsp+VS_Nome+' '+VS_NotaFinal+'  (Estagiário)'
               else
                  VS_Detalhe:= '       '+FormatFloat('0#',VI_Cont)+' - '+VS_PostoGrad+' '+VS_QuadroEsp+VS_Nome+' '+VS_NotaFinal;
            end;
            VR_MediaTurma:= VR_MediaTurma + VR_NotaFinal;

            //--- Gravar na tabela Table_Rel_Detail_Gab as respostas corretas ---//

            Gravar_RelGrauFinalCurso(VS_Detalhe);

            if VS_Nome2 <> '' then
               Gravar_RelGrauFinalCurso('                                   '+VS_Nome2);

            VI_Tot_Alu_Sobr := VI_Tot_Alu - VI_Cont;

            if ((VI_Cont = 23) and (VI_Tot_Alu < 32 )) or((VI_Cont2 = 59) and (VI_Tot_Alu < 72 )) or(VI_Cont = 32) or (VI_Cont2 = 64) or (VI_Cont = 96) or (( VI_Cont2 > 96) and (VI_Tot_Alu_Sobr < 2)) Then
            Begin
               VI_Cont2:= 1;

              For VI_Branco := VI_Linha to 41 do
                 Linha_Em_Branco(1);

              VS_Detalhe:= '                                                                     Cont...';
              Gravar_RelGrauFinalCurso(VS_Detalhe);

              Linha_Em_Branco(1);

              VI_Linha:= 0;

              //--------------------- Inicia outra pagina ----------------------//

              VS_Detalhe:= '                            C O N T I N U A Ç Ã O';
              Gravar_RelGrauFinalCurso(VS_Detalhe);
              Linha_Em_Branco(1);
           end;

           VI_Cont:= VI_Cont + 1;
           VI_Cont2:= VI_Cont2 + 1;
           IBQuery_AlunoTurma.Next;
         end;                       //  While not Table_Aluno_Turma.EOF do

         Linha_Em_Branco(1);

         //-------------------------- Media da Turma ----------------------------//

         For VI_Branco := VI_Linha to 8 do   // Era 28   21/09/01
            Linha_Em_Branco(1);

         VR_MediaTurma:= VR_MediaTurma/((VI_Cont-1)-VI_ContDeslig);
         VS_MediaTurma:= FloatToStr(VR_MediaTurma) ;

         // Alteracao solicitada em 09/03/2005 transformando de 3 casas decimais p/ 2 sem aredondar
         if (copy(VS_MediaTurma,2,1)=',') then
            VS_MediaTurma := copy(VS_MediaTurma,1,4)
         else
            VS_MediaTurma := copy(VS_MediaTurma,1,5) ;

         VS_Detalhe:= '                                         Média da Turma: '+VS_MediaTurma ;         //FormatFloat('0#.00',VR_MediaTurma);
         Gravar_RelGrauFinalCurso(VS_Detalhe);

         Linha_Em_Branco(1);

         //----------------------------- Data de Inicio  ------------------------//

         VS_Detalhe:= '                                 Início..: '+' '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('dataInicio').AsString;
         Gravar_RelGrauFinalCurso(VS_Detalhe);

         //---------------------------- Data de Termino  ------------------------//

         VS_Detalhe:= '                                 Término.: '+' '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('dataTermino').AsString;
         Gravar_RelGrauFinalCurso(VS_Detalhe);
         Linha_Em_Branco(1);

         //--------------------- Sao Jose dos Campos, Data ----------------------//

         VS_Detalhe:= Funcoes.RetornaCidade(DateToStr(Date));
         VI_Tam:= 78-Length(VS_Detalhe);

         for VI_Branco := 1 to VI_Tam do
            VS_Detalhe:= ' '+VS_Detalhe;
         Gravar_RelGrauFinalCurso(VS_Detalhe);

         Linha_Em_Branco(2);

         //-------------------- Chefe da Seção de Avaliação  --------------------//

         VS_Detalhe:= DM.IBQuery_Cargo.FieldByName( 'Nome' ).AsString+' - '+
                      Trim(DM.IBQuery_Cargo.FieldByName( 'PostoGraduacao' ).AsString)+' '+
                      trim(DM.IBQuery_Cargo.FieldByName( 'QuadroEsp' ).AsString);

         VI_Tam1:= (71- Length(trim(VS_Detalhe)))DIV 2;
         VI_Tam:= 94-VI_Tam1-Length(trim(VS_Detalhe));

         for VI_Branco := 1 to VI_Tam do
            VS_Detalhe:= ' '+VS_Detalhe;
         Gravar_RelGrauFinalCurso(VS_Detalhe);

         //------ Tratamento do Cargo do do Chefe da Seção de Avaliação ------//

         VS_Detalhe:= DM.IBQuery_Cargo.FieldByName( 'DescCargo' ).AsString;
         VI_Tam1:= (71- Length(trim(VS_Detalhe)))DIV 2;
         VI_Tam:= 94-VI_Tam1-Length(trim(VS_Detalhe));

         for VI_Branco := 1 to VI_Tam do
            VS_Detalhe:= ' '+VS_Detalhe;
         Gravar_RelGrauFinalCurso(VS_Detalhe);
         Funcoes.ExecutaTransacao_Prosima;
      end;

      Text1.SelStart:= 0;  //5
//      Form_RelatorioGeral.Show;
   end;
   Close;
end;

//------------------------------------------------------------------------------
// Grava linha em Branco
//------------------------------------------------------------------------------

Procedure TForm_GrauFinalCurso.Linha_Em_Branco(VI_Qtd: Integer);
var
   i: integer;
begin
   for i:= 1 to VI_Qtd do
      Gravar_RelGrauFinalCurso(' ');
end;

//------------------------------------------------------------------------------
// Procedure para gravar o Detail do Relatorio
//------------------------------------------------------------------------------

Procedure TForm_GrauFinalCurso.Gravar_RelGrauFinalCurso(PS_Detalhe: String);
begin
   VI_NumOrSeq:= VI_NumOrSeq + 1;

   Text1.Lines.Add(PS_Detalhe);
end;

procedure TForm_GrauFinalCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IBQuery_AlunoTurma.Close;
  IBTable_AlunoTurma.Close;
  Action:= caFree;
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel do texto
//------------------------------------------------------------------------------

procedure TForm_GrauFinalCurso.Trocar(Trocar: String; Por: String);
var
   Posicao: Integer;
begin
  Posicao := Text1.FindText(Trocar, 0, Length(Text1.Text), []);
  if Posicao >= 0 then
  begin
    Text1.SelStart := Posicao;
    Text1.SelLength := Length(Trocar);
    Text1.SelText := Por;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento para Imprimir o Relatorio
//------------------------------------------------------------------------------

procedure TForm_GrauFinalCurso.ToolButton_ImprimirClick(Sender: TObject);
var
   N: Integer;
begin
  if PrintDialog1.Execute then
    for N := 1 to PrintDialog1.Copies do
      Text1.Print('');
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Salvar o Arquivo
//------------------------------------------------------------------------------

procedure TForm_GrauFinalCurso.ToolButton_SalvarClick(Sender: TObject);
begin
  if ((FFileName = sUntitled) or (FFileName = '' )) then
    FileSaveAs(Sender)
  else
  begin
    Text1.Lines.SaveToFile(FFileName+'.Doc');
    Text1.Modified := False;
  end;
end;

procedure TForm_GrauFinalCurso.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Cad_Avaliados.Close;
   IBQuery_FichaAvaliacao.Close;
   IBTable_FichaAvaliacao.Close;

   IBTable_Estagiario.Close;
   Close;
end;

procedure TForm_GrauFinalCurso.ToolButton_WindowsClick(Sender: TObject);
begin
  Funcoes.Windows;
end;

procedure TForm_GrauFinalCurso.FileSaveAs(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName+'.Doc') then
      if MessageDlg(Format(sOverWrite, [SaveDialog1.FileName+'.Doc']),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    Text1.Lines.SaveToFile(SaveDialog1.FileName+'.Doc');
    SetFileName(SaveDialog1.FileName+'.Doc');
    Text1.Modified := False;
  end;
end;

procedure TForm_GrauFinalCurso.SetFileName(const FileName: String);
begin
  //Nome do Arquivo Doc
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

//------------------------------------------------------------------------------
//
// Tratamento para Calcular a Media quando esta não foi Calculada
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento quando Clicar na Grid
//------------------------------------------------------------------------------

procedure TForm_GrauFinalCurso.Processar;
var
   bm_Avl : TBookmark;
begin
   VI_OTIMO:= 0;
   VI_BOM:= 0;
   VI_REGULAR:= 0;
   VI_NS:= 0;
   VI_NA:= 0;
   VI_TotalReg:= 0;

   bm_Avl:= IBQuery_FichaAvaliacao.GetBookMark;
   IBQuery_FichaAvaliacao.First;
   While not IBQuery_FichaAvaliacao.Eof do
   begin
      if IBTable_FichaAvaliacao.FieldByName('OTIMO').AsString = '1' then
      begin
         VI_OTIMO:= VI_OTIMO+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if IBTable_FichaAvaliacao.FieldByName('BOM').AsString = '1' then
      begin
         VI_BOM:= VI_BOM+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if IBTable_FichaAvaliacao.FieldByName('REGULAR').AsString = '1' then
      begin
         VI_REGULAR:= VI_REGULAR+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if IBTable_FichaAvaliacao.FieldByName('NS').AsString = '1' then
      begin
         VI_NS:= VI_NS+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if IBTable_FichaAvaliacao.FieldByName('NA').AsString = '1' then
         VI_NA:= VI_NA+1;

      IBQuery_FichaAvaliacao.Next;
   end;

   IBQuery_FichaAvaliacao.Close;
   IBQuery_FichaAvaliacao.Open;

   IBQuery_FichaAvaliacao.GotoBookmark(bm_Avl);
   IBQuery_FichaAvaliacao.FreeBookMark(bm_Avl);

    Mostrar_Medias;
end;

//------------------------------------------------------------------------------
// Tratamento Tratar as Medias
//------------------------------------------------------------------------------

procedure TForm_GrauFinalCurso.Mostrar_Medias;
var
  VR_Media: Real;
  VS_Media, VS_Comando: String;
begin
   VR_Media:= (VI_OTIMO*4)+(VI_BOM*2)+(VI_REGULAR);
   if VI_TotalReg > 0 then
      VR_Media:= VR_Media/VI_TotalReg;

   VS_Media:= FormatFloat('#0.00', VR_Media);

   VS_Comando:= 'Update Cad_Ficha_Avl Set Media = '+Funcoes.DePara(VS_Media, ',','.')+
                ' Where IDCURSO = '+IBQuery_Cad_Avaliados.FieldByName('IDCURSO').AsString+' and '+
                ' IDTURMA = '+IBQuery_Cad_Avaliados.FieldByName('IDTURMA').AsString+' and '+
                ' ID_ATCO = '+#39+IBQuery_Cad_Avaliados.FieldByName('ID_ATCO').AsString+#39+' and '+
                ' ID_FICHA = '+IBQuery_Cad_Avaliados.FieldByName('ID_FICHA').AsString+' and '+
                ' ID_AVL = '+#39+IBQuery_Cad_Avaliados.FieldByName('ID_AVL').AsString+#39+' and '+
                ' ID_Exercicio = '+IBQuery_Cad_Avaliados.FieldByName('ID_EXERCICIO').AsString;
   Funcoes.ExecSqlProsima(VS_Comando);
end;

procedure TForm_GrauFinalCurso.ToolButton1Click(Sender: TObject);
var
   VS_Detalhe, VS_NotaFinal : String;
   VS_Nome2, VS_PostoGrad, VS_QuadroEsp, VS_Nome, VS_Comando, VS_MediaTurma : String;
   VI_Tam1,  VI_Branco, VI_Cont, VI_Tot_Alu: integer;
   VI_Tama, VI_TamPosto, VI_ContDeslig: integer;
   VR_NotaFinal, VR_MediaTurma: Real;

   objExcel,Sheet : Variant;
   cTitulo : string;
   Linha : integer;
begin
   // Cria uma instancia para utilizar o Excel

   cTitulo := 'Grau Final da Turma';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   Funcoes.AtualizaQuery(IBQuery_AlunoTurma);

    //---
   //   Tratamento do Cabecalho do Relatorio

   // Preenchendo as Colunas
   Sheet.Range['D1'] := 'INSTITUTO DE CONTROLE DO ESPAÇO AÉREO';
   Sheet.Range['D2'] := 'DIVISÃO DE ENSINO';
   Sheet.Range['D3'] := 'SUBDIVISÃO DE AVALIAÇÃO';
   Sheet.Range['D5'] := 'GRAU FINAL DE CURSO';
   Sheet.Range['D7'] := Funcoes.CentraStr(Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('CodCurso').AsString, 98);
   Sheet.Range['D8'] := Funcoes.CentraStr(Trim(Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('Turma').AsString)+' DE '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('Ano').AsString, 98);

   Linha:= Linha + 10;

      //----------------- Tratamento do Relatorio  -----------------//

      IBTable_AlunoTurma.Close;
      IBTable_AlunoTurma.Open;

      DM.IBQuery_Cargo.Open;
      IBTable_Estagiario.Open;

      DM.IBQuery_Cargo.Locate('IdCargo', VarArrayOf(['5']), [loPartialKey]);

      VS_Comando:= 'Select IdCurso, IdTurma, Identidade, IdAntiguidade, NumOrdem, PostoGraduacao, MotivoDesligamento, CodigoAluno, NotaFinal, nome, quadroEsp '+
                   ' from Aluno_Turmas_View'+
                   ' Where IdCurso = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdCurso').AsString+
                   ' and   IdTurma = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdTurma').AsString+
                   ' Order by NotaFinal Desc, IdAntiguidade';
      Funcoes.ExecutaQuery( IBQuery_AlunoTurma, VS_Comando);
      IBQuery_AlunoTurma.Last;
      VI_Tot_Alu:= IBQuery_AlunoTurma.RecordCount;

      IBQuery_AlunoTurma.First;
      While not IBQuery_AlunoTurma.EOF do
      begin
         if (IBQuery_AlunoTurma.FieldByName('motivoDesligamento').AsString <> ' ')  and
            (IBQuery_AlunoTurma.FieldByName('motivoDesligamento').AsString <> NULL) and
            (IBQuery_AlunoTurma.FieldByName('motivoDesligamento').AsString <> 'a')   and
            (IBQuery_AlunoTurma.FieldByName('motivoDesligamento').AsString <> '')   then
         begin
             IBQuery_AlunoTurma.Next;
         end;

         VI_Cont      := 1;
         VI_NumOrSeq  := 0;

         VR_MediaTurma:= 0;
         VI_ContDeslig:= 0;

         //-------Leitura da tabela Aluno_Turma ja na ordem de nota    --------//

         IBQuery_AlunoTurma.First;

         While not IBQuery_AlunoTurma.EOF do
         begin
            VR_NotaFinal:= 0;

            if ( Trim(copy(String(IBQuery_AlunoTurma.FieldByName('postoGraduacao').AsString),1,4)) = 'TEN1' ) then
               VS_PostoGrad := 'TEN 1º'
            else
               if ( Trim(copy(String(IBQuery_AlunoTurma.FieldByName( 'postoGraduacao' ).AsString),1,5)) = 'TEN C' ) then
                   VS_PostoGrad := 'Ten Cel'  //Ok
               else
                  if ( Trim(copy(String(IBQuery_AlunoTurma.FieldByName( 'postoGraduacao' ).AsString),1,5)) = 'SubT' ) then
                     VS_PostoGrad := 'SubTen' //Ok
                  else
                     VS_PostoGrad:= Trim(IBQuery_AlunoTurma.FieldByName('postoGraduacao').AsString);

            For VI_Branco := Length(VS_PostoGrad) to VI_TamPosto do
               VS_PostoGrad:= VS_PostoGrad+' ';

            //--- Trata o Quadro e a Especialidade

            if IBQuery_AlunoTurma.FieldByName('QuadroEsp').AsString = 'x' then
               VS_QuadroEsp := ' '
            else
               VS_QuadroEsp:= Trim(IBQuery_AlunoTurma.FieldByName('QuadroEsp').AsString);

            For VI_Branco := Length(VS_QuadroEsp) to 10 do
               VS_QuadroEsp:= VS_QuadroEsp+' ';

            VS_Nome:= IBQuery_AlunoTurma.FieldByName('nome').AsString;
            if Length(VS_Nome) > 41 then
               VS_Nome2:= Copy(VS_Nome, 41, 41)
            else
               VS_Nome2:= '';

            VS_Nome:= Copy(VS_Nome, 1, 41);
            For VI_Branco := Length(VS_Nome) to  41 do
               VS_Nome:= VS_Nome+' ';

            if (IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString <> ' ') and
               (IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString <> NULL)and
               (IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString <> 'a')  and
               (IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString <> '')  then
            begin
               VS_Detalhe:= '     '+FormatFloat('0#',VI_Cont)+' - '+VS_PostoGrad+VS_QuadroEsp+VS_Nome+
                            'Deslig.:'+IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString;
               VI_ContDeslig := VI_ContDeslig + 1;
            end
            else
            begin
               VR_NotaFinal:= IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsFloat;
               VS_NotaFinal := FormatFloat('0#.000',VR_NotaFinal); //Table_Aluno_Turma.FieldByName('NOTAFINAL').AsString ;

               if VS_NotaFinal = '' then
                 VS_NotaFinal:= '0' ;

               VI_Tama := length(VS_NotaFinal);

               if (( VS_NotaFinal = '10' ) or (VI_Tama = 1)) then
                  VS_NotaFinal:=VS_NotaFinal+',00' ;

               if (copy(VS_NotaFinal,2,1)=',') then
                  VS_NotaFinal := copy(VS_NotaFinal,1,4)
               else
                  VS_NotaFinal := copy(VS_NotaFinal,1,5) ;

               VR_NotaFinal := StrToFloat(VS_NotaFinal);

               //--- Imprime os dados nas colunas do Excel

               Sheet.Cells[Linha,1] := FormatFloat('###',VI_Cont);
               Sheet.Cells[Linha,2] := VS_PostoGrad;
               Sheet.Cells[Linha,3] := VS_QuadroEsp;
               Sheet.Cells[Linha,4] := VS_Nome;
               Sheet.Cells[Linha,5] := StrToFloat(VS_NotaFinal);
               if IBTable_Estagiario.FieldByName('Estagiario').AsString = 'S' then
               begin
                  Sheet.Cells[Linha,6] := '(Estagiário)';
//                  VS_Detalhe:= '       '+FormatFloat('0#',VI_Cont)+' - '+VS_PostoGrad+' '+VS_QuadroEsp+VS_Nome+' '+VS_NotaFinal+'  (Estagiário)'
               end;
               Linha:= Linha + 1;
            end;
            VR_MediaTurma:= VR_MediaTurma + VR_NotaFinal;

            if VS_Nome2 <> '' then
            begin
               Sheet.Cells[Linha,4] := VS_Nome2;
               Linha:= Linha + 1;
            end;

           VI_Cont:= VI_Cont + 1;
           IBQuery_AlunoTurma.Next;
         end;                       //  While not Table_Aluno_Turma.EOF do

         //-------------------------- Media da Turma ----------------------------//

         VR_MediaTurma:= VR_MediaTurma/((VI_Cont-1)-VI_ContDeslig);
         VS_MediaTurma:= FloatToStr(VR_MediaTurma) ;

         // Alteracao solicitada em 09/03/2005 transformando de 3 casas decimais p/ 2 sem aredondar
         if (copy(VS_MediaTurma,2,1)=',') then
            VS_MediaTurma := copy(VS_MediaTurma,1,4)
         else
            VS_MediaTurma := copy(VS_MediaTurma,1,5) ;

         VS_Detalhe:= 'Média da Turma: '+VS_MediaTurma ;         //FormatFloat('0#.00',VR_MediaTurma);
         Linha:= Linha + 1;
         Sheet.Cells[Linha,4] := VS_Detalhe;
         Linha:= Linha + 1;
         Linha:= Linha + 1;

         //----------------------------- Data de Inicio  ------------------------//

         VS_Detalhe:= 'Início..: '+' '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('dataInicio').AsString;
         Sheet.Cells[Linha,4] := VS_Detalhe;
         Linha:= Linha + 1;

         //---------------------------- Data de Termino  ------------------------//

         VS_Detalhe:= 'Término.: '+' '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('dataTermino').AsString;
         Sheet.Cells[Linha,4] := VS_Detalhe;
         Linha:= Linha + 1;
         Linha:= Linha + 1;

         //--------------------- Sao Jose dos Campos, Data ----------------------//

         VS_Detalhe:= Funcoes.RetornaCidade(DateToStr(Date));

         Sheet.Cells[Linha,4] := VS_Detalhe;
         Linha:= Linha + 1;

         //-------------------- Chefe da Seção de Avaliação  --------------------//

         VS_Detalhe:= DM.IBQuery_Cargo.FieldByName( 'Nome' ).AsString+' - '+
                      Trim(DM.IBQuery_Cargo.FieldByName( 'PostoGraduacao' ).AsString)+' '+
                      trim(DM.IBQuery_Cargo.FieldByName( 'QuadroEsp' ).AsString);

         Linha:= Linha + 1;
         Linha:= Linha + 1;
         Sheet.Cells[Linha,4] := VS_Detalhe;
         Linha:= Linha + 1;

         //------ Tratamento do Cargo do do Chefe da Seção de Avaliação ------//

         VS_Detalhe:= DM.IBQuery_Cargo.FieldByName( 'DescCargo' ).AsString;
         Sheet.Cells[Linha,4] := VS_Detalhe;
         Linha:= Linha + 1;
      end;
      Sheet.Columns.AutoFit;

end;

end.
