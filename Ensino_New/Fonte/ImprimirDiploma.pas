//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : ImprimirDiploma.PAS                            //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da impressao//
//                             do Diploma (Aluno/Instrutor).                  //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 01/06/2008                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit ImprimirDiploma;

interface

uses
  Printers, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, JvRichEd, JvDBRichEd, StdCtrls, Rotinas_Validar,
  PsyRichEdit, ComCtrls, ToolWin, Menus, DBCtrls, ExtCtrls, RichPrint, IBTable,
  Rotinas, Rotinas_TrataData, JvComponent, JvTransBtn, JvShape, JvGradient;

type
  TForm_MontaDiploma = class(TForm)
    JvDBRichEdit_Diploma: TJvDBRichEdit;
    IBQuery_Diploma: TIBQuery;
    DSQ_Diploma: TDataSource;
    IBQuery_DiplomaCODIGO: TSmallintField;
    IBQuery_DiplomaDOC: TIBStringField;
    IBQuery_DiplomaDESCRICAO: TBlobField;
    ScrollBox1: TScrollBox;
    Text1: TPsyRichEdit;
    PrintDialog1: TPrintDialog;
    IBTable_CertidaoAluno: TIBTable;
    IBTable_CertidaoAlunoIDCURSO: TSmallintField;
    IBTable_CertidaoAlunoIDTURMA: TIntegerField;
    IBTable_CertidaoAlunoIDENTIDADE: TIBStringField;
    IBTable_CertidaoAlunoANO: TIBStringField;
    IBTable_CertidaoAlunoCERTIFICADO: TIntegerField;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel_BotoesProva: TPanel;
    JvGradient_Tela01: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Imprime: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_Config: TJvTransparentButton;
    DBNavigator_Diploma: TDBNavigator;
    JvShape1: TJvShape;
    PopupMenu_Imprimir: TPopupMenu;
    ImprimeTodosAlunos: TMenuItem;
    N1: TMenuItem;
    Apartirdoalunoselecionado: TMenuItem;
    N2: TMenuItem;
    SomenteoAlunoselecionado: TMenuItem;
    Panel_Imprimir: TPanel;
    Memo1: TMemo;

    Function TratarNome(Nome: String): String;

    procedure MontaDiploma;
    procedure TratarConferido(PostoGraduacao, Sexo: String);
    procedure Trocar(Trocar: String; Por: String);
    procedure MostraDiploma;

    procedure FormActivate(Sender: TObject);
    procedure DBNavigator_DiplomaClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_ConfigClick(Sender: TObject);
    procedure ApartirdoalunoselecionadoClick(Sender: TObject);
    procedure ImprimeTodosAlunosClick(Sender: TObject);
    procedure SomenteoAlunoselecionadoClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private    { Private declarations }
     VS_NomeCurso01, VS_SIPAERAnterior, VS_NomeAnterior, VS_FuncaoAnterior, VS_Certidao, VS_CertidaoAnt, VS_DataAnt, VS_TrataSexo: String;
     VI_EspacoNomeCurso: Integer;
     VB_Tratar_DescCusro, VB_MontaDiploma: Boolean;
  public
    { Public declarations }
  end;

var
  Form_MontaDiploma: TForm_MontaDiploma;

implementation

uses Module, Sel_Turma, MenuPrincipal, GerarRegCertificados;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_MontaDiploma.FormActivate(Sender: TObject);
begin
   JvGradient_Tela01.StartColor:= Cor_Tela;

   VB_Tratar_DescCusro:= False;
   IBTable_CertidaoAluno.Open;
   Form_SelTurma.IBTable_Pessoa_Al.Open;
   VS_NomeCurso01:= '';
   MontaDiploma;
end;

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_MontaDiploma.MontaDiploma;
var
   VS_Comando: String;
begin
    if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II' then
       Text1.Width:= 1300
    else
       Text1.Width:= 1450;

   DBNavigator_Diploma.Visible:= False;
   JvShape_Windows.Visible:= False;

   if ((Form_MontaDiploma.Caption = 'Ensino --> Vizualização do Diploma Assinatura Manual --> Aluno') or (Form_MontaDiploma.Caption = 'SAE --> Vizualização do Diploma Assinatura Manual --> Aluno')) then
   begin
      VS_Comando:= 'select *  from Documento where codigo = 30 ';
      Form_SelTurma.IBQuery_AlunoTurma.First;
      DBNavigator_Diploma.Visible:= True;
      JvShape_Windows.Visible:= True;
      DBNavigator_Diploma.DataSource:= Form_SelTurma.DSQ_AlunoTurma;
   end
   else
   begin
      if (Form_MontaDiploma.Caption = 'Diploma 2º Via Aluno')  then
      begin
         VS_Comando:= 'select *  from Documento where codigo = 4 ';
      end
      else
      begin
         if (Form_MontaDiploma.Caption = 'Diploma 2º Via Aluno (Ass Digital)')  then
         begin
            VS_Comando:= 'select *  from Documento where codigo = 36 ';
         end
         else
         begin
            DBNavigator_Diploma.Visible:= True;
            JvShape_Windows.Visible:= True;
            if ((Form_MontaDiploma.Caption = 'Ensino --> Vizualização do Diploma --> Instrutor') or (Form_MontaDiploma.Caption = 'SAE --> Vizualização do Diploma --> Instrutor')) then
            begin
               VS_Comando:= 'select *  from Documento where codigo = 6 ';
               DBNavigator_Diploma.DataSource:= Form_SelTurma.DSQ_InstrutorTurma;
            end
            else
            begin
               VS_Comando:= 'select *  from Documento where codigo = 25 ';
               DBNavigator_Diploma.DataSource:= Form_SelTurma.DSQ_AlunoTurma;
            end;
         end;
      end;
   end;

   IBQuery_Diploma.Close;
   IBQuery_Diploma.Sql.Clear;
   IBQuery_Diploma.Sql.Add(VS_Comando);
   IBQuery_Diploma.Open;

   Printer.Orientation := poLandscape;
   VI_EspacoNomeCurso:= 0;
   VB_MontaDiploma:= False;
   VS_NomeAnterior:= '#Nome';
   VS_CertidaoAnt:= '#Certific';
   VS_FuncaoAnterior:= '#Funcao';
   VS_SIPAERAnterior:= '#Sipaer';
   VS_TrataSexo:= 'Conferido a';
   VS_DataAnt:= '#Data';

   MostraDiploma;
end;

//------------------------------------------------------------------------------
// Procedure de tratamento do Diploma
//------------------------------------------------------------------------------

procedure TForm_MontaDiploma.MostraDiploma;
var
   VS_SIPAER, VS_NomeCurso, VS_NomeAluno, VS_Funcao, VS_Data: String;
   VS_LocalAssinatura, VS_Assinatura, VS_cargo: String;
   Ano1, Mes1, Dia1: Word;
begin
   if VB_MontaDiploma = False then
   begin
      JvDBRichEdit_Diploma.SelectAll;
      JvDBRichEdit_Diploma.CopyToClipboard ;

      Text1.Clear;
      Text1.SelStart:= 0;
      Text1.PasteFromClipboard ;

      if ((Copy(Trim(Form_MenuPrincipal.Label_NomeCurso.Caption),1,6) = 'BÁSICO') or
          (Copy(Trim(Form_MenuPrincipal.Label_NomeCurso.Caption),1,6) = 'Básico'))then
          VS_NomeCurso:= 'Curso '
      else
          VS_NomeCurso:= 'Curso de ';

      //---------------- Tratamento do Nome do Aluno/Instrutor ----------//

      if ((Form_MontaDiploma.Caption = 'Ensino --> Vizualização do Diploma --> Instrutor') or (Form_MontaDiploma.Caption = 'SAE --> Vizualização do Diploma --> Instrutor')) then
      begin
         VS_NomeAluno:= TratarNome(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString);
         VS_Funcao:= Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Funcao').AsString
      end
      else
      begin
         if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SIAT-MN' then
             VS_Certidao:= ''
         else
         begin
            if IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsString = '' then
            begin
               if MessageDlg('A Turma não possuí número da Certidão.'+#13+'Deseja gerar Certidão agora ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               begin
                  Application.CreateForm(TForm_GerarRegCertificados, Form_GerarRegCertificados);
                  Form_GerarRegCertificados.Show;
                  VS_Certidao:= FormatFloat('0000', IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger)+'/'+IBTable_CertidaoAluno.FieldByName('Ano').AsString;
               end
               else
                  VS_Certidao:= '0000';
            end
            else
            begin
               VS_Certidao:= FormatFloat('0000', IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger)+'/'+IBTable_CertidaoAluno.FieldByName('Ano').AsString;
            end;
         end;

         VS_NomeAluno:= TratarNome(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NomeCompleto').AsString);

         VS_Funcao:= '';
      end;

     //----------------- Montando o Periodo de Termino ------------------//

      if ((Form_MontaDiploma.Caption = 'Ensino --> Vizualização do Diploma --> Instrutor') or (Form_MontaDiploma.Caption = 'SAE --> Vizualização do Diploma --> Instrutor')) then
      begin
         VS_Data:= Validar.TratarPeriodo(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName( 'DataChegada' ).AsString, Form_SelTurma.IBQuery_InstrutorTurma.FieldByName( 'DataSaida' ).AsString);
      end
      else
      begin
         DecodeDate (StrToDate(DM.IBTable_Turma.FieldByName( 'DataTermino' ).AsString), Ano1, Mes1, Dia1);
         VS_Data:= 'em '+FormatFloat('00', Dia1)+' de '+Funcoes_TrataData.Mes_Extenso(IntToStr(Mes1),1)+' de '+FormatFloat('####', Ano1);
      end;

      //---------------- Tratamento do Assinatura do Diploma ----------//

      if Form_SelTurma.VB_SelecaoResponsavelAssinatura = False then
      begin
         DM.IBQuery_Cargo.Open;
         DM.IBQuery_Cargo.First;

        if DM.IBQuery_Cargo.Locate('SIGLA','DIR',[]) then
          //
      end;
      VS_Assinatura:= DM.IBQuery_Cargo.FieldByName( 'Nome' ).AsString+'  '+
                                        Trim(DM.IBQuery_Cargo.FieldByName( 'PostoGraduacao' ).AsString)+' '+
                                        Trim(DM.IBQuery_Cargo.FieldByName( 'QuadroEsp' ).AsString);

      VS_cargo := DM.IBQuery_Cargo.FieldByName( 'DescCargo' ).AsString;

      //---- Tratamento do Local do Curso

      VS_LocalAssinatura:= Funcoes.RetornaCidade(DM.IBTable_Turma.FieldByName( 'DataTermino' ).AsString);

      if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
         VS_SIPAER:= Form_SelTurma.IBTable_Pessoa_Al.FieldByName('SIPAER').AsString
      else
         VS_SIPAER:= '';

      if ((Form_MontaDiploma.Caption = 'Ensino --> Vizualização do Diploma --> Instrutor') or
          (Form_MontaDiploma.Caption = 'SAE --> Vizualização do Diploma --> Instrutor')) then
      begin
         if ((Trim(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('PostoGraduacao').AsString) <> 'CV') and (Trim(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('PostoGraduacao').AsString) <> 'CIVIL')) then
         begin
            if Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Sexo').AsString = 'M' then
            begin
               if VS_TrataSexo <> 'Conferido ao' then
               begin
                  VS_TrataSexo:= 'Conferido ao';
                  Trocar('Conferido a', 'Conferido ao');
               end;
            end
            else
            begin
               if VS_TrataSexo <> 'Conferido a' then
               begin
                  VS_TrataSexo:= 'Conferido a';
                  Trocar('Conferido ao', 'Conferido a');
               end;
            end;
         end
         else
         begin
            if VS_TrataSexo = 'Conferido ao' then
            begin
               VS_TrataSexo:= 'Conferido a';
               Trocar('Conferido ao', 'Conferido a');
            end;
         end;
      end
      else
      begin
         if ((Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('PostoGraduacao').AsString) <> 'CV') and (Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('PostoGraduacao').AsString) <> 'CIVIL')) then
         begin
            if Form_SelTurma.IBQuery_AlunoTurma.FieldByName('Sexo').AsString = 'M' then
            begin
               if VS_TrataSexo <> 'Conferido ao' then
               begin
                  VS_TrataSexo:= 'Conferido ao';
                  Trocar('Conferido a', 'Conferido ao');
               end;
            end
            else
            begin
               if VS_TrataSexo <> 'Conferido a' then
               begin
                  VS_TrataSexo:= 'Conferido a';
                  Trocar('Conferido ao', 'Conferido a');
               end;
            end;
         end
         else
         begin
            if VS_TrataSexo = 'Conferido ao' then
            begin
               VS_TrataSexo:= 'Conferido a';
               Trocar('Conferido ao', 'Conferido a');
            end;
         end;
      end;
      Trocar(VS_NomeAnterior, VS_NomeAluno);
      Trocar(VS_FuncaoAnterior, VS_Funcao);
      Trocar(VS_CertidaoAnt, VS_Certidao);
      Trocar(VS_SIPAERAnterior, VS_SIPAER);
//      Trocar('#Data', VS_Termino);
      Trocar(VS_DataAnt, VS_Data);

      VS_NomeAnterior:= VS_NomeAluno;
      VS_FuncaoAnterior:= VS_Funcao;
      VS_CertidaoAnt:= VS_Certidao;
      VS_SIPAERAnterior:= VS_SIPAER;
      VS_DataAnt:= VS_Data;

      Trocar('#TratarCurso', VS_NomeCurso);
      Trocar('#T', DM.IBTable_Turma.FieldByName('Turma').AsString );

      if VS_NomeCurso01 = '' then
      begin
         if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II' then
             VS_NomeCurso01:= Trim(Form_SelTurma.Label_DescricaoCurso.Caption)+ ' ('+Trim(Form_SelTurma.ComboBox_Curso.Text)+')'
         else
             VS_NomeCurso01:= Trim(Form_SelTurma.Label_DescricaoCurso.Caption)+ ' ('+Trim(Form_SelTurma.ComboBox_Curso.Text)+').';

         if VI_EspacoNomeCurso > 0 then
             VS_NomeCurso01:= Funcoes.LReplStr(VS_NomeCurso01, ' ', VI_EspacoNomeCurso );
          Memo1.Lines.Add(VS_NomeCurso01)

      end;

      Trocar('#DescricaoCurso_1', Memo1.Lines.Text );
      Trocar('#CidadeData', VS_LocalAssinatura);
      Trocar('#Assinatura', VS_Assinatura);
      Trocar('#Cargo', VS_cargo);
      VB_MontaDiploma:= True;
      VB_Tratar_DescCusro:= True;
   end
   else
   begin
      if ((Form_MontaDiploma.Caption = 'Ensino --> Vizualização do Diploma --> Instrutor') or
          (Form_MontaDiploma.Caption = 'SAE --> Vizualização do Diploma --> Instrutor')) then
      begin
         VS_NomeAluno:= TratarNome(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString);
         VS_Funcao:= Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Funcao').AsString;
         VS_Certidao:= '';
         TratarConferido(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('PostoGraduacao').AsString, Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Sexo').AsString);
      end
      else
      begin
         if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SIAT-MN' then
             VS_Certidao:= ''
         else
         begin
            if IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsString = '' then
            begin
               if MessageDlg('A Turma não possuí número da Certidão.'+#13+'Deseja gerar Certidão agora ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               begin
                  Application.CreateForm(TForm_GerarRegCertificados, Form_GerarRegCertificados);
                  Form_GerarRegCertificados.Show;
                  VS_Certidao:= FormatFloat('0000', IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger)+'/'+IBTable_CertidaoAluno.FieldByName('Ano').AsString;
               end
               else
                  VS_Certidao:= '0000';
            end
            else
            begin
               VS_Certidao:= FormatFloat('0000', IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger)+'/'+IBTable_CertidaoAluno.FieldByName('Ano').AsString;
            end;
         end;

         VS_NomeAluno:= TratarNome(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NomeCompleto').AsString);
         VS_Funcao:= '';
         TratarConferido(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('PostoGraduacao').AsString, Form_SelTurma.IBQuery_AlunoTurma.FieldByName('Sexo').AsString);
      end;

      if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
         VS_SIPAER:= Form_SelTurma.IBTable_Pessoa_Al.FieldByName('SIPAER').AsString
      else
         VS_SIPAER:= '';

//      Trocar('#DescricaoCurso_1', Memo1.Lines.Text );
      Trocar(VS_NomeAnterior, VS_NomeAluno);
      Trocar(VS_FuncaoAnterior, VS_Funcao);
      Trocar(VS_CertidaoAnt, VS_Certidao);
      Trocar(VS_SIPAERAnterior, VS_SIPAER);

      VS_NomeAnterior:= VS_NomeAluno;
      VS_FuncaoAnterior:= VS_Funcao;
      VS_CertidaoAnt:= VS_Certidao;
      VS_SIPAERAnterior:= VS_SIPAER;
   end;
   Text1.Paragraph.LeftIndent:= 10;
   Text1.Paragraph.RightIndent:= 10;
   Text1.SetFocus;
   Text1.SelectAll ;
   text1.SelStart := 1;

   Update;
end;

//------------------------------------------------------------------------------
// Tratamento a palavra conferido de acordo com o Sexo
//------------------------------------------------------------------------------

procedure TForm_MontaDiploma.TratarConferido(PostoGraduacao, Sexo: String);
begin
   if ((trim(PostoGraduacao) <> 'CV') and (Trim(PostoGraduacao) <> 'CIVIL')) then
   begin
      if Sexo = 'M' then
      begin
         if VS_TrataSexo <> 'Conferido ao' then
         begin
            VS_TrataSexo:= 'Conferido ao';
            Trocar('Conferido a', 'Conferido ao');
         end;
      end
      else
      begin
         if VS_TrataSexo <> 'Conferido a' then
         begin
            VS_TrataSexo:= 'Conferido a';
            Trocar('Conferido ao', 'Conferido a');
         end;
      end;
   end
   else
   begin
      if VS_TrataSexo <> 'Conferido a' then
      begin
         VS_TrataSexo:= 'Conferido a';
         Trocar('Conferido ao', 'Conferido a');
      end;
   end;
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel por do texto
//------------------------------------------------------------------------------

procedure TForm_MontaDiploma.Trocar(Trocar: String; Por: String);
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
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_MontaDiploma.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Printer.Orientation := poPortrait;
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_MontaDiploma.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Printer.Orientation := poPortrait;
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento da opcao de impressao de todos registros
//------------------------------------------------------------------------------

procedure TForm_MontaDiploma.ApartirdoalunoselecionadoClick(Sender: TObject);
var
   N: Integer;
   Rel: String;
   bmLocal : TBookmark;
begin
   bmLocal:= Form_SelTurma.IBQuery_AlunoTurma.GetBookMark;
   While not Form_SelTurma.IBQuery_AlunoTurma.eof do
   begin
      Panel_Imprimir.Caption:= 'Aguarde imprimindo...';
      Update;
      if PrintDialog1.Execute then
      begin
         for N := 1 to PrintDialog1.Copies do
         Begin
            Rel:= 'Certidao'+IntToStr(n)+'.Rel';
            Text1.Print(Rel);
         end;
      end;
      Form_SelTurma.IBQuery_AlunoTurma.Next;
      MontaDiploma;
      MostraDiploma;
   end;
   if Form_SelTurma.IBQuery_AlunoTurma.Recordcount > 0 then
      Form_SelTurma.IBQuery_AlunoTurma.GotoBookMark(bmLocal);
   Form_SelTurma.IBQuery_AlunoTurma.FreeBookMark(bmLocal);

   Panel_Imprimir.Caption:= 'Impressão Finalizada... ';
   update;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de selecao do Diploma
//------------------------------------------------------------------------------

procedure TForm_MontaDiploma.DBNavigator_DiplomaClick(Sender: TObject;Button: TNavigateBtn);
begin
//   MontaDiploma;
   MostraDiploma;
end;

procedure TForm_MontaDiploma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_MontaDiploma.JvTransparentButton_ConfigClick( Sender: TObject);
begin
   PrinterSetupDialog1.Execute;
end;

Function TForm_MontaDiploma.TratarNome(Nome: String): String;
var
   Retorno: String;
begin
   if copy(Nome,1,2) = 'CV' then
      Retorno:= Copy(Nome, 3, Length(Nome)-2)
   else
      Retorno:= Nome;
   TratarNome:= Retorno;
end;

procedure TForm_MontaDiploma.ImprimeTodosAlunosClick(Sender: TObject);
var
   N: Integer;
   Rel: String;
   bmLocal : TBookmark;
begin
   bmLocal:= Form_SelTurma.IBQuery_AlunoTurma.GetBookMark;
   Form_SelTurma.IBQuery_AlunoTurma.First;
   While not Form_SelTurma.IBQuery_AlunoTurma.eof do
   begin
      Panel_Imprimir.Caption:= 'Aguarde imprimindo...';
      Update;
      if PrintDialog1.Execute then
      begin
         for N := 1 to PrintDialog1.Copies do
         Begin
            Rel:= 'Certidao'+IntToStr(n)+'.Rel';
            Text1.Print(Rel);
         end;
      end;
      Form_SelTurma.IBQuery_AlunoTurma.Next;
//      MontaDiploma;
      MostraDiploma;
   end;
   if Form_SelTurma.IBQuery_AlunoTurma.Recordcount > 0 then
      Form_SelTurma.IBQuery_AlunoTurma.GotoBookMark(bmLocal);
   Form_SelTurma.IBQuery_AlunoTurma.FreeBookMark(bmLocal);

   Panel_Imprimir.Caption:= 'Impressão Finalizada... ';
   update;
end;

procedure TForm_MontaDiploma.SomenteoAlunoselecionadoClick(Sender: TObject);
var
   N: Integer;
   Rel: String;
begin
   if PrintDialog1.Execute then
   begin
      Panel_Imprimir.Caption:= 'Aguarde imprimindo...';
      Update;
      for N := 1 to PrintDialog1.Copies do
      Begin
         Rel:= 'Certidao'+IntToStr(n)+'.Rel';
         Text1.Print(Rel);
      end;
      Panel_Imprimir.Caption:= 'Impressão Finalizada... ';
      update;
   end;
end;

procedure TForm_MontaDiploma.Memo1Change(Sender: TObject);
begin
  if VB_Tratar_DescCusro = True then
  begin
     MontaDiploma;
     MostraDiploma;
  end;
end;

end.
