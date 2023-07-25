unit RelatorioFichasAvaliacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable, Rotinas, Rotinas_Validar;

type
  TForm_RelatorioFichasAvaliacoes = class(TForm)
    QuickRep1: TQuickRep;
    QRBand_Cabec: TQRBand;
    QRLabel_Curso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel_Inicio: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel_Termino: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel_NAlunos: TQRLabel;
    QRShape21: TQRShape;
    IBQuery_Rel_Topico: TIBQuery;
    IBQuery_Rel_TopicoIDCURSO: TSmallintField;
    IBQuery_Rel_TopicoIDTURMA: TIntegerField;
    IBQuery_Rel_TopicoIDFICHA: TIntegerField;
    IBQuery_Rel_TopicoIDTOPICO: TIntegerField;
    IBQuery_Rel_TopicoTOPICO: TIBStringField;
    IBQuery_Rel_TopicoNOBSERVADO: TIBStringField;
    IBQuery_Rel_TopicoABAIXO: TIBStringField;
    IBQuery_Rel_TopicoATINGIU: TIBStringField;
    IBQuery_Rel_TopicoACIMA: TIBStringField;
    IBQuery_Rel_TopicoMEDIA: TIBStringField;
    IBQuery_Rel_TopicoCOMENTARIO: TIBStringField;
    QRBand_Ficha: TQRBand;
    QRShape_02: TQRShape;
    QRShape_03: TQRShape;
    QRShape_04: TQRShape;
    QRShape_05: TQRShape;
    QRShape_01: TQRShape;
    QRMemo_Abaixo: TQRMemo;
    QRMemo_Atingiu: TQRMemo;
    QRMemo_Acima: TQRMemo;
    QRMemo_Media: TQRMemo;
    QRBand_Sumario: TQRBand;
    IBQuery_Rel_TopicoDESTAQUE: TIBStringField;
    IBQuery_Versao_SGQ: TIBQuery;
    IBQuery_Versao_SGQVERSAO: TIBStringField;
    IBQuery_Versao_SGQDATA: TDateTimeField;
    QRLabel_Versao_Sgq: TQRLabel;
    QRImage_Grafico_Indicador: TQRImage;
    QRLabel_ResponsavelAssinatura: TQRLabel;
    QRLabel_Barra: TQRLabel;
    QRLabel_DescricaoSecao: TQRLabel;
    QRRichText_Leganda: TQRRichText;
    QRImage_Grafico_Desempenho: TQRImage;
    QRShape1: TQRShape;
    QRLabel_CargaHoraria: TQRLabel;
    QRShape2: TQRShape;
    QRLabel_Tecnica: TQRLabel;
    QRMemo_NObservado: TQRMemo;
    QRMemo_Topico: TQRMemo;
    QRRichText_Cabecalho: TQRRichText;
    QRImage_Log01: TQRImage;

    procedure AjustarShape(VI_Height: Integer; cor: TColor);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRBand_FichaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);

  private
    { Private declarations }
   cor_NObservado: TColor;
   cor_Abaixo: TColor;
   cor_Atingiu: TColor;
   cor_Acima: TColor;
   cor_Media: TColor;
   cor_Topico: TColor;

  public
    { Public declarations }
  end;

var
  Form_RelatorioFichasAvaliacoes: TForm_RelatorioFichasAvaliacoes;

implementation

uses Hab_FAC, Module;

{$R *.dfm}


procedure TForm_RelatorioFichasAvaliacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_RelatorioFichasAvaliacoes.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   VB_Assinatura: Boolean;
begin
//   cor_NObservado:= clBlue;
//   cor_Abaixo:= clRed;
//   cor_Atingiu:= clYellow;
//   cor_Acima:= ClGreen;
//   cor_Media:= $00FFE8E8;

   cor_NObservado:= $00FFF9F9;
   cor_Abaixo:= $00FFF9F9;
   cor_Atingiu:= $00FFF9F9;
   cor_Acima:= $00FFF9F9;
   cor_Media:= $00FFF9F9;

   cor_Topico:= $00F9F9F9;

   IBQuery_Rel_Topico.Open;
   IBQuery_Versao_SGQ.Open;

   QRRichText_Cabecalho.Lines.Clear;
   QRRichText_Cabecalho.Lines.Add(Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString);
   QRLabel_CargaHoraria.Caption:= '';
   QRLabel_Tecnica.Caption:= '';

   if Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString = 'EXTRATO DE CURSO - ALUNO' then
      QRRichText_Cabecalho.Lines.Add('REFERENTE AO ANEXO "F" e "G" DO MCA 37-87')
   else
   begin
      if Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString = 'EXTRATO DE CURSO - INSTRUTOR' then
         QRRichText_Cabecalho.Lines.Add('REFERENTE AO ANEXO "H" DO MCA 37-87')
      else
         if Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString = '(Anexo H) FICHA DE OPINIÃO' then
         begin
             QRLabel_CargaHoraria.Caption:= 'Carga Horaria da Disciplina: '+trim(Form_Hab_FAC.IBQuery_MontaMateria.FieldByName('CargaHoraria').AsString );
             QRLabel_Tecnica.Caption:= 'Técnica: '+trim(Form_Hab_FAC.IBTable_Tecnica.FieldByName('tecnica').AsString );
         end;

     if copy(Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString, 1, 9) <> '(Anexo G)' then
     begin
         if trim(Form_Hab_FAC.DBEdit_NomeGuerra.Text) <> '' then
           QRRichText_Cabecalho.Lines.Add('INSTRUTOR - '+trim(Form_Hab_FAC.DBEdit_PostoGraduacao.Text)+' '+trim(Form_Hab_FAC.DBEdit_NOmeGuerra.Text));
     end;

      if trim(Form_Hab_FAC.DBEdit_NomeDisciplina.Text) <> '' then
         QRRichText_Cabecalho.Lines.Add('DISCIPLINA - '+trim(Form_Hab_FAC.DBEdit_Disciplina.Text)+' ('+trim(Form_Hab_FAC.DBEdit_NomeDisciplina.Text)+')');
   end;
   //-----

   QRMemo_Topico.top:= 1;
   QRMemo_Topico.Left:= 1;

   QRLabel_Curso.Caption:= 'Nome do Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByNAme('Descricao').AsString;

   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+
                                     Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

   QRLabel_Inicio.Caption:= 'Início: '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString);
   QRLabel_Termino.Caption:= 'Término: '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString);
   QRLabel_NAlunos.Caption:= 'Nº de Alunos: '+IntToStr(DM.IBQuery_MontaTurma.FieldByName('QTDBRASILEIROS').AsInteger+DM.IBQuery_MontaTurma.FieldByName('QTDESTRANGEIROS').AsInteger);

 //  QRLabel_QuantidadeAlunos.Caption:= 'QUANTIDADE DE ALUNOS: '+Validar.RetornarTotalAlunos(DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);

   //--- Tratamento da Assinatura do Responsavel

   //Tratamento da Assinatura do Chefe da EEAE digital

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Assinatura_Chefia_EEAE.jpg') = True then
   begin
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Assinatura_Chefia_EEAE.jpg');
      QRImage_Log01.Left:= 495;

      QRLabel_Barra.Left:= -900;
      QRLabel_ResponsavelAssinatura.Left:= -900;
      QRLabel_DescricaoSecao.Left:= -900;
   end
   else
   begin
      QRImage_Log01.Left:= -900;

      QRLabel_Barra.Left:= 450;
      QRLabel_ResponsavelAssinatura.Left:= 450;
      QRLabel_DescricaoSecao.Left:= 450;

      DM.IBQuery_Cargo.First;

      if DM.IBQuery_Cargo.Locate('SIGLA','EEAE',[]) then
         //

      QRLabel_ResponsavelAssinatura.Caption:= DM.IBQuery_Cargo.FieldByName( 'Nome' ).AsString+' - '+
                                              Trim(DM.IBQuery_Cargo.FieldByName( 'PostoGraduacao' ).AsString)+' '+
                                              Trim(DM.IBQuery_Cargo.FieldByName( 'QuadroEsp' ).AsString);
      QRLabel_DescricaoSecao.Caption:= Funcoes.CentraStr(DM.IBQuery_Cargo.FieldByName( 'DescCargo' ).AsString, 13+length(QRLabel_ResponsavelAssinatura.Caption));

      QRLabel_Versao_Sgq.Caption:=  'Versão: '+Trim(IBQuery_Versao_SGQ.FieldByName('Versao').AsString)+' Atualização SGEW: '+copy(IBQuery_Versao_SGQ.FieldByName('Data').AsString,1,10);
   end;

   //--- Tratamento dos Graficos

   QRBand_Sumario.Height:= 153;

   QRImage_Grafico_Desempenho.top:= -3000;
   QRImage_Grafico_Indicador.top:= -3000;
   QRRichText_Leganda.top:= -3000;

   QRImage_Log01.Top:= 35;

   QRLabel_Barra.Top:= 35;
   QRLabel_ResponsavelAssinatura.Top:= 50;
   QRLabel_DescricaoSecao.Top:= 64;
   QRLabel_Versao_Sgq.Top:= 129;



   if (( FileExists('c:\Ensino\Tmp\Grafico_Desempenho.Jpeg')) and (  FileExists('c:\Ensino\Tmp\Grafico_Indicador.Jpeg' ))) then     // Aluno
   begin
      QRImage_Grafico_Desempenho.Picture.LoadFromFile('c:\Ensino\Tmp\Grafico_Desempenho.Jpeg');
      QRImage_Grafico_Indicador.Picture.LoadFromFile('c:\Ensino\Tmp\Grafico_Indicador.Jpeg');

      QRBand_Sumario.Height:= 804;

      QRImage_Grafico_Desempenho.Top:= 10;
      QRImage_Grafico_Indicador.Top:= 299;

      QRRichText_Leganda.Top:= 605;

      QRImage_Log01.Top:= 651;

      QRLabel_Barra.Top:= 651;
      QRLabel_ResponsavelAssinatura.Top:= 672;
      QRLabel_DescricaoSecao.Top:= 700;
      QRLabel_Versao_Sgq.Top:= 778;
   end
   else
   begin
      if ( FileExists('c:\Ensino\Tmp\Grafico_Indicador.Jpeg' )) then
      begin
         QRImage_Grafico_Indicador.Picture.LoadFromFile('c:\Ensino\Tmp\Grafico_Indicador.Jpeg');

         QRBand_Sumario.Height:= 402;

         QRImage_Grafico_Desempenho.Top:= -3000;
         QRImage_Grafico_Indicador.Top:= 10;

         QRRichText_Leganda.Top:= 287;


         QRImage_Log01.Top:= 295;

         QRLabel_Barra.Top:= 295;
         QRLabel_ResponsavelAssinatura.Top:= 313;
         QRLabel_DescricaoSecao.Top:= 327;
         QRLabel_Versao_Sgq.Top:= 377; 
      end;
   end;
end;

procedure TForm_RelatorioFichasAvaliacoes.QRBand_FichaBeforePrint( Sender: TQRCustomBand; var PrintBand: Boolean);
var
   VI_Height: Integer;
   cor: TColor;
begin
   QRMemo_NObservado.Lines.Clear;
   QRMemo_Abaixo.Lines.Clear;
   QRMemo_Atingiu.Lines.Clear;
   QRMemo_Acima.Lines.Clear;
   QRMemo_Media.Lines.Clear;
   QRMemo_Topico.Lines.Clear;

   QRMemo_NObservado.Lines.Add(IBQuery_Rel_Topico.FieldByName('NOBSERVADO').AsString);
   QRMemo_Abaixo.Lines.Add(IBQuery_Rel_Topico.FieldByName('Abaixo').AsString);
   QRMemo_Atingiu.Lines.Add(IBQuery_Rel_Topico.FieldByName('Atingiu').AsString);
   QRMemo_Acima.Lines.Add(IBQuery_Rel_Topico.FieldByName('Acima').AsString);
   QRMemo_Media.Lines.Add(IBQuery_Rel_Topico.FieldByName('Media').AsString);

//   QRMemo_Topico.Lines.Add(IBQuery_Rel_Topico.FieldByName('Comentario').AsString+' - '+IBQuery_Rel_Topico.FieldByName('Topico').AsString);
   QRMemo_Topico.Lines.Add(IBQuery_Rel_Topico.FieldByName('Topico').AsString);

    //-----------------------------------
   //--- Tratamento de Cor

   if ((IBQuery_Rel_Topico.FieldByName('Destaque').AsString = 'C') or (IBQuery_Rel_Topico.FieldByName('Destaque').AsString = 'E')) then            // Cinza
      Cor:= $00E4E4E4
   else
      Cor:= clWhite;

    //-----------------------------------
   //--- Tratamento da altura da Mensagem

   if ((IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'A')) then    // QUESITOS DO ANEXO "F"
   Begin
      QRMemo_Topico.Width:= 1064; //456;
      VI_Height:= 25;  //32;
   end
   else
   begin
   if ((IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'B')) then    // Linha Branco
   Begin
      QRMemo_Topico.Width:= 608; //456;
      VI_Height:= 3;
   end
   else
   begin
   if ((IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'C')) then     // Comentario cadastrado no banco
   Begin
      QRMemo_Topico.Width:= 1064;  //456;
      VI_Height:= 70;   // 40
   end
   else
   begin
   if ((IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'D')) then     // Comentario Cabecalho
   Begin
      QRMemo_Topico.Width:= 343; //429;  //402;
      VI_Height:= 40; //30;
   end
   else
   begin
   if (IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'K') then        // ANEXO H - Formulario 13
   begin
      if copy(IBQuery_Rel_Topico.FieldByName('Topico').AsString, 1, 8) = 'QUESITOS' then
      begin
         QRMemo_Topico.Width:= 1064;
         VI_Height:= 20;       //30
      end
      else
      begin
         if copy(Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString, 1, 9)  = '(Anexo G)' then
         begin
            QRMemo_Topico.Width:= 600; //410; //429;
            VI_Height:= 40;       //30
         end
         else
         begin
            if copy(Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString, 1, 9)  = '(Anexo H)' then
            begin
               QRMemo_Topico.Width:= 959; //410; //429;
               VI_Height:= 35;       //30
            end
            else
            begin
               if copy(Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString, 1, 9)  = '(Anexo F)' then
               begin
                  QRMemo_Topico.Width:= 600; //410; //429;
                  VI_Height:= 60;       //30
               end
               else
               begin
                  if copy(Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString, 1, 7)  = 'EXTRATO' then
                  begin
                     QRMemo_Topico.Width:= 600; //410; //429;
                     VI_Height:= 60;       //30
                  end
                  else
                  begin
                     if IBQuery_Rel_Topico.FieldByName('Destaque').AsString = 'C' then
                     begin
                        QRMemo_Topico.Width:= 1064;   //456
                        VI_Height:= 24;  //10
                     end
                     else
                     begin
                        QRMemo_Topico.Width:= 959; //429;
                        VI_Height:= 25;  //10
                     end;
                  end;
               end;
            end;
         end;
      end;
   end
   else
   begin
      if (IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'P') then     // Outros casos
      begin
         if copy(Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString, 1, 9)  = '(Anexo H)' then
         begin
            QRMemo_Topico.Width:= 959; //410; //429;
            VI_Height:= 40;       //30
         end
         else
         begin
            if copy(Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString, 1, 9)  = '(Anexo G)' then
            begin
               QRMemo_Topico.Width:= 600; //410; //429;
               VI_Height:= 40;       //30
            end
            else
            begin
               QRMemo_Topico.Width:= 600; //410; //429;
               VI_Height:= 35;       //30
            end;
         end;
      end
      else
      begin
         if (IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'M') then     // MÉDIA ARITMÉTICA
         begin
            QRMemo_Topico.Width:= 959; //410;
            VI_Height:= 20;
         end
         else
         begin
            if ((IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'X')) then        // TratarTopico
            Begin
               QRMemo_Topico.Width:= 457;
               VI_Height:= 26;
            end
            else
            begin
               if ((IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'N')) then     // QUESITOS -
               Begin
                  QRMemo_Topico.Width:= 959; //457;
                  VI_Height:= 40;  //30
               end
               else
               begin
                  if ((IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'F')) then    // Msg Comentario
                  Begin
                        Cor:= clRed;

                     QRMemo_Topico.Width:= 1064; //457;
                     VI_Height:= 20;
                  end
               end;
            end;
         end;
      end;
   end;
   end;
   end;
   end;
   end;

   QRBand_Ficha.Height:= VI_Height;
   QRMemo_Topico.Height:= VI_Height;

   //---- Tratamento da cor


   //---- Tratamento para verificar se topico ou comentario

   if IBQuery_Rel_Topico.FieldByName('Comentario').AsString <> 'S' then
   begin
      AjustarShape(VI_Height, Cor);
   end
   else
   begin
      VI_Height:= 0;
      AjustarShape(VI_Height, Cor);
  end;
end;

//------------------------------------------------------------------------------
// Ajustar o Shape(s)
//------------------------------------------------------------------------------

procedure TForm_RelatorioFichasAvaliacoes.AjustarShape(VI_Height: Integer; cor: TColor);
begin
   QRMemo_Topico.Color:=  Cor;

   QRMemo_Media.Color:= Cor;
   QRMemo_Media.Height:= VI_Height;
   QRShape_05.Height:= VI_Height;

   if ((IBQuery_Rel_Topico.FieldByName('Destaque').AsString = 'E')  or (IBQuery_Rel_Topico.FieldByName('Destaque').AsString = 'X')) then            //--- Relatorio modelo Extrato
      Cor:= $00E4E4E4;
//      Cor:= clWhite;

//   QRMemo_NObservado.Color:= Cor;
//   QRMemo_Abaixo.Color:= Cor;
//   QRMemo_Atingiu.Color:= Cor;
//   QRMemo_Acima.Color:= Cor;

   //--- Para analisar

   QRMemo_Topico.Color:=  cor_Topico;
   QRMemo_NObservado.Color:= cor_NObservado;
   QRMemo_Abaixo.Color:= cor_Abaixo;
   QRMemo_Atingiu.Color:= cor_Atingiu;
   QRMemo_Acima.Color:= cor_Acima;
   QRMemo_Media.Color:= cor_Media;


   QRMemo_NObservado.Height:= VI_Height;
   QRMemo_Abaixo.Height:= VI_Height;
   QRMemo_Atingiu.Height:= VI_Height;
   QRMemo_Acima.Height:= VI_Height;

   QRShape_01.Height:= VI_Height;
   QRShape_02.Height:= VI_Height;
   QRShape_03.Height:= VI_Height;
   QRShape_04.Height:= VI_Height;
end;

end.
