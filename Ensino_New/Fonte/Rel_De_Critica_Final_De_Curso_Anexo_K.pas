//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SGEW                                           //
//                                                                            //
// PROGRAMA                  : Rel_De_Critica_Final_De_Curso_Anexo_K.pas      //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do Relatorio//
//                             de Critica de Final de Curso.                  //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Ten Marcela                                    //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 21/01/2020                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Rel_De_Critica_Final_De_Curso_Anexo_K;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable, TeEngine, Series, TeeProcs, Rotinas_Validar;

type
  TForm_Relatoio_De_Critica_Final_De_Curso = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel_Curso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel_Inicio: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    PageFooterBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel_ResponsavelAssinatura: TQRLabel;
    QRLabel_Barra: TQRLabel;
    QRLabel_Termino: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape13: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel_QuantidadeAlunos: TQRLabel;
    QRImage_Docentes: TQRImage;
    QRImage_Avaliacao: TQRImage;
    QRImage_MaterialDidatico: TQRImage;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRImage_Disciplina: TQRImage;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel_DescricaoSecao: TQRLabel;
    QRLabel_Titutlo: TQRLabel;
    QRLabel_Comantario: TQRLabel;

    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private                     { Private declarations }
     VS_Tipo, VS_Comantario: String;
  public
    { Public declarations }
  end;

var
  Form_Relatoio_De_Critica_Final_De_Curso: TForm_Relatoio_De_Critica_Final_De_Curso;

implementation

uses Module, CorrecaoProva, Hab_FAC;

{$R *.dfm}

procedure TForm_Relatoio_De_Critica_Final_De_Curso.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   VS_Comando: String;
begin
   VS_Tipo:= '';
   QRLabel_Curso.Caption:= 'NOME DO CURSO: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByNAme('Descricao').AsString;

   QRLabel_Turma.Caption:= 'TURMA: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+
                                     Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

   QRLabel_Inicio.Caption:= 'INÍCIO: '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString);
   QRLabel_Termino.Caption:= 'TÉRMINO: '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString);



   QRLabel_QuantidadeAlunos.Caption:= 'QUANTIDADE DE ALUNOS: '+Validar.RetornarTotalAlunos(DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
   //--- Tratamento da Assinatura do Responsavel

   DM.IBQuery_Cargo.First;

   if DM.IBQuery_Cargo.Locate('SIGLA','EAVA',[]) then
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

procedure TForm_Relatoio_De_Critica_Final_De_Curso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Relatoio_De_Critica_Final_De_Curso.PageFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if VS_Tipo <> Form_Hab_FAC.ClientDataSet_Relatorio.FieldByName('Tipo').AsString then
   begin
      QRLabel_Titutlo.Color:= $00E4E4E4;
      QRLabel_Titutlo.Caption:= Form_Hab_FAC.ClientDataSet_Relatorio.FieldByName('Tipo').AsString;
      VS_Tipo:= Form_Hab_FAC.ClientDataSet_Relatorio.FieldByName('Tipo').AsString;
      QRLabel_Comantario.Top:= 25;
      QRLabel_Comantario.Height:= 96;
   end
   else
   begin
      QRLabel_Titutlo.Color:= clWhite;
      QRLabel_Titutlo.Caption:= '';

      QRLabel_Comantario.Top:= 1;
      QRLabel_Comantario.Height:= 115;
      VS_Comantario:= Form_Hab_FAC.ClientDataSet_Relatorio.FieldByName('Comentario').AsString;
    end;
    QRLabel_Comantario.Caption:= Form_Hab_FAC.ClientDataSet_Relatorio.FieldByName('Comentario').AsString
end;


end.
