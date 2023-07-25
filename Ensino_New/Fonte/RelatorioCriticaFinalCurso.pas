//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : RelatorioCriticaFinalCurso.pas                 //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da do rela- //
//                             torio de Final de Curso.                       //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Ten Marcela                                    //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 02/09/2020                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit RelatorioCriticaFinalCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable, Rotinas, Rotinas_Validar;

type
  TForm_RelatorioCriticaFinalCurso = class(TForm)
    QuickRep1: TQuickRep;
    QRBand_Cabecalho: TQRBand;
    QRLabel_Curso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel_Inicio: TQRLabel;
    QRShape_C3_2: TQRShape;
    QRShape_C_3_3: TQRShape;
    QRLabel_LocalDoCurso: TQRLabel;
    QRLabel_Termino: TQRLabel;
    QRDBText_Local_Curso: TQRDBText;
    QRShape_C_4_1: TQRShape;
    QRLabel_QuantidadeAlunos: TQRLabel;
    QRDBText_Cabacalho: TQRDBText;
    QRSysData1: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    QRBand_Sumario: TQRBand;
    QRLabel_ResponsavelAssinatura: TQRLabel;
    QRLabel_Barra: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape24: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRImage_Disciplina: TQRImage;
    QRLabel_DescricaoSecao: TQRLabel;
    QRLabel6: TQRLabel;
    QRImage_Docentes: TQRImage;
    QRImage_Avaliacao: TQRImage;
    QRImage_MaterialDidatico: TQRImage;
    QRShape_Cinza_01: TQRShape;
    QRShape_L_4: TQRShape;
    QRShape_L_3: TQRShape;
    QRShape_L_2: TQRShape;
    QRShape_L_5: TQRShape;
    QRRichText1: TQRRichText;
    QRRichText_tipo: TQRRichText;
    QRShape1: TQRShape;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_RelatorioCriticaFinalCurso: TForm_RelatorioCriticaFinalCurso;

implementation

uses Hab_FAC, Module;

{$R *.dfm}

procedure TForm_RelatorioCriticaFinalCurso.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
//   IBQuery_FAC_Ext_FichaAvaliacao.Open;
//   IBQuery_Ext_Comentario.Open;

   QRLabel_Curso.Caption:= 'NOME DO CURSO: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByNAme('Descricao').AsString;

   QRLabel_Turma.Caption:= 'TURMA: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+
                                     Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

   QRLabel_Inicio.Caption:= 'INÍCIO: '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString);
   QRLabel_Termino.Caption:= 'TÉRMINO: '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString);



   QRLabel_QuantidadeAlunos.Caption:= 'QUANTIDADE DE ALUNOS: '+Validar.RetornarTotalAlunos(DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);

   //--- Tratamento da Assinatura do Responsavel

   DM.IBQuery_Cargo.First;

   if DM.IBQuery_Cargo.Locate('SIGLA','EEAE',[]) then
       //

   QRLabel_ResponsavelAssinatura.Caption:= DM.IBQuery_Cargo.FieldByName( 'Nome' ).AsString+' - '+
                                     Trim(DM.IBQuery_Cargo.FieldByName( 'PostoGraduacao' ).AsString)+' '+
                                     Trim(DM.IBQuery_Cargo.FieldByName( 'QuadroEsp' ).AsString);
   QRLabel_DescricaoSecao.Caption:= Funcoes.CentraStr(DM.IBQuery_Cargo.FieldByName( 'DescCargo' ).AsString, 13+length(QRLabel_ResponsavelAssinatura.Caption));

   //--- Tratamento dos Graficos

   QRImage_Disciplina.Picture.LoadFromFile('c:\Ensino\Tmp\GraficoDisciplina.Jpeg');
   QRImage_Docentes.Picture.LoadFromFile('c:\Ensino\Tmp\GraficoDocente.Jpeg');
   QRImage_Avaliacao.Picture.LoadFromFile('c:\Ensino\Tmp\GraficoAvaliacao.Jpeg');
   QRImage_MaterialDidatico.Picture.LoadFromFile('c:\Ensino\Tmp\GraficoMaterialDidatico.Jpeg');

end;

procedure TForm_RelatorioCriticaFinalCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;


procedure TForm_RelatorioCriticaFinalCurso.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRRichText_tipo.Lines.Clear;
//  QRRichText_tipo.Lines.Add(IBQuery_Ext_Comentario.FieldByName('tipo').AsString);

  QRRichText1.Lines.Clear;
//  QRRichText1.Lines.Add(IBQuery_Ext_Comentario.FieldByName('Comentario').AsString);
  QRSubDetail1.Height:= (QRRichText1.Lines.Count*22)+16;
end;

procedure TForm_RelatorioCriticaFinalCurso.FormActivate(Sender: TObject);
begin
//   IBQuery_FAC_Ext_FichaAvaliacao.Open;
//   IBQuery_Ext_Comentario.Open;
end;

end.
