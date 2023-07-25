unit Rel_Diploma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery, Rotinas_TrataData,
  Rotinas_Validar, IBTable;

type
  TForm_Rel_Diploma = class(TForm)
    QuickRep1: TQuickRep;
    PageFooterBand1: TQRBand;
    QRImage_Log01: TQRImage;
    QRImage_Decea: TQRImage;
    QRImage_Icea: TQRImage;
    QRImage_BrasaoUniao: TQRImage;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRImage_MarcaDagua: TQRImage;
    QRImage_Fundo: TQRImage;
    QRLabel4: TQRLabel;
    QRLabel_Conferido: TQRLabel;
    QRLabel_Nome: TQRLabel;
    QRLabel_Funcao: TQRLabel;
    QRLabel_Curso01: TQRLabel;
    QRLabel_Cidade: TQRLabel;
    QRLabel_Certidao: TQRLabel;
    IBTable_CertidaoAluno: TIBTable;
    IBTable_CertidaoAlunoIDCURSO: TSmallintField;
    IBTable_CertidaoAlunoIDTURMA: TIntegerField;
    IBTable_CertidaoAlunoIDENTIDADE: TIBStringField;
    IBTable_CertidaoAlunoANO: TIBStringField;
    IBTable_CertidaoAlunoCERTIFICADO: TIntegerField;
    QRLabel_Curso02: TQRLabel;
    QRLabel_Curso03: TQRLabel;
    QRImage_Assinatura: TQRImage;

    procedure TratarConferido(PostoGraduacao, Sexo: String);

    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private   { Private declarations }
      VS_TrataSexo: String;
  public
    { Public declarations }
  end;

var
  Form_Rel_Diploma: TForm_Rel_Diploma;

implementation

uses Sel_Turma, MenuPrincipal, Module, ImprimirDiploma, GerarRegCertificados;

{$R *.dfm}

procedure TForm_Rel_Diploma.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   VS_TratarCurso, VS_Termino: String;
   Ano, Mes, Dia : word;
begin
   VS_TrataSexo:= 'Conferido a';
   IBTable_CertidaoAluno.Open;

   if Form_SelTurma.CheckBox_Dip_Conferido.Checked = true then
       QRLabel_Conferido.Font.Style:= [fsBold];

   if Form_SelTurma.CheckBox_Dip_Nome.Checked = true then
       QRLabel_Nome.Font.Style:= [fsBold];

   if Form_SelTurma.CheckBox_Dip_Funcao.Checked = true then
       QRLabel_Funcao.Font.Style:= [fsBold];

   if Form_SelTurma.CheckBox_Dip_Curso01.Checked = true then
       QRLabel_Curso01.Font.Style:= [fsBold];

   if Form_SelTurma.CheckBox_Dip_Curso02.Checked = true then
       QRLabel_Curso02.Font.Style:= [fsBold];

   if Form_SelTurma.CheckBox_Dip_Curso03.Checked = true then
       QRLabel_Curso03.Font.Style:= [fsBold];

   if Form_SelTurma.CheckBox_Dip_Cidade.Checked = true then
       QRLabel_Cidade.Font.Style:= [fsBold];

   //----------------- Montando o Periodo de Termino ------------------//

   DecodeDate (StrToDate(DM.IBTable_Turma.FieldByName( 'DataTermino' ).AsString), Ano, Mes, Dia);
   VS_Termino:= FormatFloat('00', Dia)+' de '+Funcoes_TrataData.Mes_Extenso(IntToStr(Mes),1)+' de '+FormatFloat('####', Ano);

   if ((Copy(Trim(Form_MenuPrincipal.Label_NomeCurso.Caption),1,6) = 'BÁSICO') or
       (Copy(Trim(Form_MenuPrincipal.Label_NomeCurso.Caption),1,6) = 'Básico'))then
       VS_TratarCurso:= ' o curso '
   else
       VS_TratarCurso:= ' o curso de ';

   if Form_SelTurma.Edit_Dip_Curso01.Text <> '' then
   begin
      QRLabel_Curso01.Caption:= Trim(Form_SelTurma.Edit_Dip_Curso01.Text)
   end
   else
   begin
      if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II' then
         QRLabel_Curso01.Caption:= Trim(Form_SelTurma.Label_DescricaoCurso.Caption)+ ' ('+Trim(Form_SelTurma.ComboBox_Curso.Text)+')'
      else
         QRLabel_Curso01.Caption:= Trim(Form_SelTurma.Label_DescricaoCurso.Caption)+ ' ('+Trim(Form_SelTurma.ComboBox_Curso.Text)+').';
   end;

   if Form_SelTurma.Edit_Dip_Curso02.Text <> '' then
      QRLabel_Curso02.Caption:= Trim(Form_SelTurma.Edit_Dip_Curso02.Text)
   else
      QRLabel_Curso02.Caption:= '';

   if Form_SelTurma.Edit_Dip_Curso03.Text <> '' then
      QRLabel_Curso03.Caption:= Trim(Form_SelTurma.Edit_Dip_Curso03.Text)
   else
      QRLabel_Curso03.Caption:= '';

   //---------------- Tratamento do Nome do Aluno/Instrutor ----------//

   if ((Form_SelTurma.VS_Opcao_Diploma = 'Ensino --> Vizualização do Diploma --> Instrutor') or
       (Form_SelTurma.VS_Opcao_Diploma = 'SAE --> Vizualização do Diploma --> Instrutor')) then
   begin
      if Form_SelTurma.Edit_Dip_Nome.Text <> '' then
         QRLabel_Nome.Caption:= Trim(Form_SelTurma.Edit_Dip_Nome.Text)
      else
         QRLabel_Nome.Caption:= Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString;

      if Form_SelTurma.Edit_Dip_Funcao.Text <> '' then
         QRLabel_Funcao.Caption:= Trim(Form_SelTurma.Edit_Dip_Funcao.Text)
      else
         QRLabel_Funcao.Caption:= 'por ter participado como '+Trim(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Funcao').AsString)+', em '+VS_Termino+', '+VS_TratarCurso ;

      QRLabel_Certidao.Caption:= '';
      TratarConferido(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('PostoGraduacao').AsString, Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Sexo').AsString);
   end
   else
   begin
      if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SIAT-MN' then
         QRLabel_Certidao.Caption:= ''
      else
      begin
         if IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsString = '' then
         begin
            if MessageDlg('A Turma não possuí número da Certidão.'+#13+'Deseja gerar Certidão agora ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
               Application.CreateForm(TForm_GerarRegCertificados, Form_GerarRegCertificados);
               Form_GerarRegCertificados.Show;
               QRLabel_Certidao.Caption:= FormatFloat('0000', IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger)+'/'+IBTable_CertidaoAluno.FieldByName('Ano').AsString;
            end
            else
               QRLabel_Certidao.Caption:= '0000';
         end
         else
         begin
            QRLabel_Certidao.Caption:= FormatFloat('0000', IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger)+'/'+IBTable_CertidaoAluno.FieldByName('Ano').AsString;
         end;
      end;
      if Form_SelTurma.Edit_Dip_Nome.Text <> '' then
         QRLabel_Nome.Caption:= Trim(Form_SelTurma.Edit_Dip_Nome.Text)
      else
         QRLabel_Nome.Caption:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NomeCompleto').AsString;

      if Form_SelTurma.Edit_Dip_Funcao.Text <> '' then
         QRLabel_Funcao.Caption:= Trim(Form_SelTurma.Edit_Dip_Funcao.Text)
      else
         QRLabel_Funcao.Caption:= 'por ter concluído com aproveitamento, em '+VS_Termino+', '+VS_TratarCurso ;

      TratarConferido(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('PostoGraduacao').AsString, Form_SelTurma.IBQuery_AlunoTurma.FieldByName('Sexo').AsString);
   end;

   if Form_SelTurma.Edit_Dip_Cidade.Text <> '' then
      QRLabel_Cidade.Caption:= Trim(Form_SelTurma.Edit_Dip_Cidade.Text)
   else
      QRLabel_Cidade.Caption:= Funcoes.RetornaCidade(DM.IBTable_Turma.FieldByName( 'DataTermino' ).AsString);

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Diploma.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Diploma.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Brasao_Uniao.jpg') = True then
      QRImage_BrasaoUniao.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Brasao_Uniao.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Decea.jpg') = True then
      QRImage_Decea.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Decea.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Icea.jpg') = True then
      QRImage_Icea.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Icea.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Icea_Simbolo.jpg') = True then
      QRImage_Fundo.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Icea_Simbolo.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Marcadagua.jpg') = True then
      QRImage_MarcaDagua.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Marcadagua.jpg');

//   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Assinatura.jpg') = True then
//      QRImage_Assinatura.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Assinatura.jpg');
end;

procedure TForm_Rel_Diploma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_CertidaoAluno.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento a palavra conferido de acordo com o Sexo
//------------------------------------------------------------------------------

procedure TForm_Rel_Diploma.TratarConferido(PostoGraduacao, Sexo: String);
begin
   if Form_SelTurma.Edit_Dip_Conferido.Text <> '' then
      QRLabel_Conferido.Caption:= Trim(Form_SelTurma.Edit_Dip_Conferido.Text)
   else
      QRLabel_Conferido.Caption:= Validar.TratarConferido(PostoGraduacao, Sexo);
end;


end.
