//----------------------------------------------------------------------------//
// PROGRAMA                  : ControleGeralDeGraus_New.pas                   //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar o relatorio  //
//                             com controle Geral de Graus.                   //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 18/05/2009                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      : 18/09/2012                                     //
// AUTOR                     : Osvaldir                                       //
// MODULO ALTERADO           :                                                //
// MOTIVO                    : Ajuste da Media Parcial quando o aluno tiver   //
//                             nota de Recuperação este ajuste foi solicitado //
//                             pelo SO Marcos com aval do Ten Mansano:
//
//    Segue abaixo a transcrição do texto contido no Plano de Avaliação MCA
//    37-87/2011 item 3.1.6.6 letra f, que trata dos critérios para cálculo da
//    nota do aluno que for submetido à prova de recuperação.
//
//      "f)	 a nota final do aluno que for submetido à prova de recuperação
//    obedecerá aos seguintes critérios:
//          - para o cálculo da MF, o cômputo de qualquer MP será MP = 6,00
//    (mesmo o aluno tendo obtido na prova de recuperação um grau maior que
//    6,00 (seis vírgula zero zero);
//          - o cômputo da última ou única MP e também a MF ou só a MF será
//    MF 7,00;
//        Observação: Uma vez calculada a MF de acordo com o acima
//    estabelecido, se esta ficar abaixo do ponto de corte (MF=7,00), poderá ser
//    levado em     consideração o grau real obtido na prova de recuperação,
//    até o limite necessário para a obtenção da MF=7,00; "
//
//----------------------------------------------------------------------------//

unit ControleGeralDeGraus_New;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, DB, IBCustomDataSet, IBQuery, Rotinas,
  IBTable, JvLabel, JvBlinkingLabel, PsyRichEdit, Grids, DBGrids, JvRichEd,
  JvDBRichEd, JvComponent, JvTransBtn, ExtCtrls, JvShape, JvGradient;

type
  TForm_MontaControleGeraoGraus = class(TForm)
    IBTable_AlunoTurma2: TIBTable;
    IBTable_AlunoTurma2IDCURSO: TSmallintField;
    IBTable_AlunoTurma2IDTURMA: TIntegerField;
    IBTable_AlunoTurma2IDENTIDADE: TIBStringField;
    IBTable_AlunoTurma2NUMORDEM: TSmallintField;
    IBTable_AlunoTurma2CODIGOALUNO: TIntegerField;
    IBTable_AlunoTurma2NOTAFINAL: TIBBCDField;
    Text1: TPsyRichEdit;
    PrintDialog1: TPrintDialog;
    IBTable_Teste: TIBTable;
    IBTable_TesteIDCURSO: TSmallintField;
    IBTable_TesteIDTURMA: TIntegerField;
    IBTable_TesteFASEAPLICACAO: TIBStringField;
    IBTable_TesteREFERENCIAAVALIACAO: TIBStringField;
    IBTable_TesteCODMATERIA: TIBStringField;
    IBTable_TesteAPRESENTARNOTA: TIBStringField;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel_Botoes: TPanel;
    JvGradient_Tela_01: TJvGradient;
    JvShape4: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_ConfigImpressora: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    IBTable_TesteSTATUS_APLICACAO: TIBStringField;

    procedure Trocar(Trocar: String; Por: String);
    Procedure Trata_Msg( Tam: Integer; PS_Msg1, PS_Msg2, PS_Msg3: String);
    procedure ZeraMediaMP;
    procedure CalculaMediaParcial;
    procedure CalculaMediaFase;
    procedure VerificaLinha;
    procedure ImprimirResultado;
    procedure SetarDefault(VI_Size: Integer);
    procedure TracarLinha;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_ConfigImpressoraClick(Sender: TObject);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
  private    { Private declarations }
      VR_MediaMP: Array[1..25] of Real;
      VR_MediaFase: Array[1..25] of Real;
      MI_Fase: Array[1..10] of integer;

      VB_PossuiPeso, VB_PossuiProvaRecuperacao, VB_RefazCalculo: Boolean;
      VI_ContMP, VI_FaseIni, VI_ImprimeFase, VI_PesoMP, VI_Peso, VI_MediaFase, VI_ContMedia, VI_MP, VI_Fase: Integer;
      VR_NotaFinal, VR_Nota, VR_SomaNota, VR_SomaMediaFase: Real;
      VS_Msg0, VS_Msg1, VS_Msg2, VS_Msg3: String;
  public
    { Public declarations }
  end;

var
  Form_MontaControleGeraoGraus: TForm_MontaControleGeraoGraus;

implementation

uses Module, CorrecaoProva;

{$R *.dfm}

//----------------------------------------------------------------------------//
// Modulo Principal
//----------------------------------------------------------------------------//

procedure TForm_MontaControleGeraoGraus.FormActivate(Sender: TObject);
var
   VS_Relacao_NotasBaixa, VS_MsgFinal: String;
   i: integer;
   VR_Nota_Ant, VR_MediaFinal, VR_SomaMediaFinal: Real;
   VI_Peso_Ant: Integer;
   VB_NotasProcessada: boolean;
begin
   JvGradient_Tela_01.StartColor:= Cor_Tela;

   Funcoes.CabecalhoForm(Form_MontaControleGeraoGraus, ' Controle Geral de Graus');

   Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.Open;
   DM.IBTable_Configuracao.Open;
   IBTable_AlunoTurma2.Open;
   IBTable_Teste.open;

    //-----
   // Cabecalho do Relatorio

   Funcoes.TrataMensagem('select doc, Descricao from Documento where Codigo = 39');
   Text1.PasteFromClipboard;

   Trocar('#CodCurso', Funcoes.GetCodCurso);
   Trocar('#Turma', DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' de '+DM.IBQuery_MontaTurma.FieldByName('ano').AsString);

   if ((Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('PESODISCIPLINA').AsInteger = 0) and
       (Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName( 'MotivoDesligamento').AsString = 'a')) then
   begin
      SetarDefault(9);
      Text1.Lines.Add('Verifique o Cadastro de Avaliação, O Peso da disciplina esta com "0"');
   end
   else
   begin
      Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.Last;
      if (( Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.Recordcount = 0) and
          (Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName( 'MotivoDesligamento').AsString = 'a')) then
      begin
         SetarDefault(12);
         Text1.Lines.Add('Não foi cadastrada as notas');
         TracarLinha;   // Traca linha divisoria
      end
      else
      begin
         VS_Relacao_NotasBaixa:= '';
         VB_RefazCalculo:= False;
         VB_PossuiProvaRecuperacao:= False;
         Form_Cad_CorrecaoProva.Query_RelacaoAlunos.First;
         While not Form_Cad_CorrecaoProva.Query_RelacaoAlunos.eof do
         begin
            if Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName( 'MotivoDesligamento').AsString = 'a' then
            begin
               VR_SomaMediaFinal:= 0;

               SetarDefault(12);
               if Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'Nota').AsString = '' then
               begin
                  Text1.Lines.Add( Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('CodigoAluno').AsString+' - '+
                                   trim(Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString)+
                                   ' não possuí nota Cadastrada...');
                  TracarLinha;
               end
               else
               begin
                  Text1.Lines.Add(Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('CodigoAluno').AsString+' - '+
                                  Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString);
                  SetarDefault(9);
                  Text1.Lines.Add('');

                  Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.First;
                  ZeraMediaMP;

                  for i:= 1 to 10 do
                  begin
                     VR_MediaFase[i]:= 0;
                     MI_Fase[i]:= 0;
                  end;

                  VB_NotasProcessada:= False;
                  VS_MsgFinal:= '';
                  VR_Nota_Ant:= 0;

                  VI_Fase:= 9999999;
                  While not Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.eof do
                  begin
                     if Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'Nota').AsString <> '' then
                     begin
                        if IBTable_Teste.FieldByName('ApresentarNota').AsString = 'N' then
                        begin
                           if (Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('Media').AsString = 'S') then
                              VS_MsgFinal:= VS_MsgFinal+#13+'A Prova '+Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('CodProva').AsString+' não foi processada, porque não esta setada para ser divulgada...';
                        end
                        else
                        begin
                           if (Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('Media').AsString = 'S') then
                           begin
                              If VI_Fase = 9999999 then
                              begin
                                 VI_Fase:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'FaseAplicacao').AsInteger;
                                 VI_FaseIni:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'FaseAplicacao').AsInteger;
                                 VI_MP:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'MediaParcial').AsInteger;
                              end;

                              VB_NotasProcessada:= True;
                              MI_Fase[VI_Fase]:= 1;

                              CalculaMediaParcial;    // Teste 09_
                              CalculaMediaFase;   // calcula a media por Fase

                              VI_Peso:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('PESODISCIPLINA').AsInteger;
                              VR_Nota:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'Nota').AsFloat;
                              VR_Nota:= Funcoes.TratarNota(VR_Nota);
                              if VI_Peso > 1 then
                                 VB_PossuiPeso:= True;

                              VR_NotaFinal:= VR_Nota*VI_Peso;

                              if ((Copy(Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('CodProva').AsString,1,2) = 'RT') or
                                  (Copy(Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('CodProva').AsString,1,2) = 'RP') or
                                  (Copy(Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('CodProva').AsString,1,2) = 'PF') or
                                  (Copy(Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('CodProva').AsString,1,2) = 'RF')) then
                              begin
                                 if VR_Nota >= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('MediaMinima').AsFloat then
                                    VR_NotaFinal:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('MediaMinima').AsFloat*VI_Peso;

                                 VR_SomaNota:= VR_SomaNota-VR_Nota_Ant;
                                 VI_PesoMP:=  VI_PesoMP-VI_Peso_Ant;

                                 VI_PesoMP:= VI_PesoMP + VI_Peso;
                                 VR_SomaNota:= VR_SomaNota+VR_NotaFinal;

                                 if VI_MP <> Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'MediaParcial').AsInteger then
                                     CalculaMediaParcial;

                                 Trata_Msg(5, Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('CodProva').AsString, FormatFloat('00',VI_Peso), FormatFloat('00.00',Funcoes.TratarNota(VR_Nota)));

                                  VB_PossuiProvaRecuperacao:= True;
                                  VB_RefazCalculo:= True;
                              end
                              else
                              begin
                                 VI_PesoMP:= VI_PesoMP + VI_Peso;

                                 CalculaMediaParcial;

                                 Trata_Msg(5, Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('CodProva').AsString, FormatFloat('00',VI_Peso), FormatFloat('00.00',Funcoes.TratarNota(VR_Nota)));
                                 VerificaLinha;

                                 VR_Nota_Ant:= VR_NotaFinal;
                                 VI_Peso_Ant:=  VI_Peso;
                                 VR_SomaNota:= VR_SomaNota+VR_NotaFinal;

                                 if IBTable_Teste.FieldByName('Status_Aplicacao').AsString <> 'ENCERRADA' then
                                 begin
                                    IBTable_Teste.Edit;
                                    IBTable_Teste.FieldByName('Status_Aplicacao').AsString:= 'ENCERRADA';
                                    IBTable_Teste.Post;
                                 end;
                              end;
                           end
                           else
                           begin
                              Text1.Lines.Add( 'A Prova '+Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName('CodProva').AsString+' esta setada para não ser calculada na media,verificar o campo "Calculo na Média.:" no QGA...');
                           end;
                        end;
                     end;
                     Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.next;
                  end;

                  if Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString <> 'a' then
                  begin
                     Trata_Msg(6, 'FASE '+IntToStr(VI_Fase)+'|', '******|', 'Desl. |');
                     ImprimirResultado;
                     Text1.Lines.Add('Aluno Desligado');
                     VB_RefazCalculo:= False;
                  end
                  else
                  begin
                     if VB_NotasProcessada = True then
                     begin
                        MI_Fase[VI_Fase]:= 1;
                        VI_MP:= 0;

                        CalculaMediaParcial;
                        VI_Fase:= 99999;
                        CalculaMediaFase;      // calcula a media por Fase

                         //----
                        //--- Calcula a Media Final do Aluno

                        VS_Msg0:= '+';
                        VS_Msg1:= '|';
                        VS_Msg3:= '|';
                        VI_ContMedia:= 0;
                        VR_SomaMediaFinal:= 0;
                        for i:= VI_FaseIni to VI_Fase do
                        begin
                           if MI_Fase[I] = 1 then
                           begin
                              VR_SomaMediaFinal:= VR_SomaMediaFinal+VR_MediaFase[i];
                              VI_ContMedia:= VI_ContMedia+1;

                              VS_Msg0:= VS_Msg0+'-------+';
                              VS_Msg1:= VS_Msg1+'Fase '+FormatFloat('#0', i)+' |';
                              if VR_MediaFase[i] = 10 then
                                 VS_Msg3:= VS_Msg3+' '+FormatFloat('#0.00', Funcoes.TratarNota(VR_MediaFase[i]))+' |'
                              else
                                 VS_Msg3:= VS_Msg3+'  '+FormatFloat('#0.00', Funcoes.TratarNota(VR_MediaFase[i]))+' |';
                           end;
                        end;
                        VR_SomaMediaFinal:= VR_SomaMediaFinal/VI_ContMedia;

                        VS_Msg0:= VS_Msg0+'---------+';
                        VS_Msg1:= VS_Msg1+'  Final  |';
                        if  VR_SomaMediaFinal = 10 then
                           VS_Msg3:= VS_Msg3+' '+FormatFloat('#0.00', Funcoes.TratarNota(VR_SomaMediaFinal))+'   |'
                        else
                           VS_Msg3:= VS_Msg3+'  '+FormatFloat('#0.00', Funcoes.TratarNota(VR_SomaMediaFinal))+'   |';

                        SetarDefault(8);
                        Text1.Lines.Add(VS_Msg0);
                        SetarDefault(8);
                        Text1.Lines.Add(VS_Msg1);
                        SetarDefault(8);
                        Text1.Lines.Add(VS_Msg0);
                        SetarDefault(8);
                        Text1.Lines.Add(VS_Msg3);
                        SetarDefault(8);
                        Text1.Lines.Add(VS_Msg0);
                     end;
                     TracarLinha;   // Traca linha divisoria
                  end;
               end;

                //---
               //--- Grava a Media Final

               if Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString <> 'a' then
                  VR_MediaFinal:= 0
               else
               begin
                  VR_MediaFinal:= Funcoes.TratarNota(VR_SomaMediaFinal);
                  if VR_MediaFinal < 7.00 then
                  begin
                     VS_Relacao_NotasBaixa:= VS_Relacao_NotasBaixa+#13+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('CodigoAluno').AsString+' - '+
                                                                       trim(Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString)+' - '+
                                                                       FormatFloat('##.00', VR_MediaFinal);
                  end;
               end;

               IBTable_AlunoTurma2.Edit;
               IBTable_AlunoTurma2.FieldByName( 'NotaFinal').AsFloat:= VR_MediaFinal;
               IBTable_AlunoTurma2.Post;
            end;
            if VB_RefazCalculo = False then
               Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Next;
         end;

         if VS_MsgFinal <> '' then
         begin
            SetarDefault(9);
            Text1.Lines.Add(VS_MsgFinal);
         end;

         Funcoes.ExecutaTransacao;
         if VS_Relacao_NotasBaixa <> '' then   //---- Possui alunos com media abaixo de 7
            ShowMessage( 'Relação de Alunos com Médias Abaixo de 7,00: '+#13+VS_Relacao_NotasBaixa);
      end;
   end;
end;

//----------------------------------------------------------------------------//
// Limpa a Matriz que gera a Madia Parcial (MP)
//----------------------------------------------------------------------------//

procedure TForm_MontaControleGeraoGraus.ZeraMediaMP;
var
   i: integer;
begin
   for i:= 1 to 25 do
      VR_MediaMP[i]:= -1;

   VS_Msg0:= '+';
   VS_Msg1:= '';
   VS_Msg2:= '';
   VS_Msg3:= '';

      VB_PossuiPeso:= False;
      VI_ImprimeFase:= 1;
      VI_MediaFase:= 0;
      VR_SomaNota:= 0;
      VI_ContMedia:= 0;
      VI_PesoMP:= 0;
      VI_ContMP:= 0;
end;

//------------------------------------------------------------------------------
// Calcula Media por Fase
//------------------------------------------------------------------------------

procedure TForm_MontaControleGeraoGraus.CalculaMediaFase;
var
   i: integer;
begin
   if VI_Fase <> Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'FaseAplicacao').AsInteger then
   begin
      if Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString <> 'a' then
      begin
         Trata_Msg(6, 'FASE '+IntToStr(VI_Fase)+'|', '******|', 'Desl. |');
         ImprimirResultado;
         VI_Fase:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'FaseAplicacao').AsInteger;
      end
      else
      begin
         if VI_Fase = 0 then
         begin
            VI_Fase:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'FaseAplicacao').AsInteger;
            if VI_Fase < VI_FaseIni then
               VI_FaseIni:= VI_Fase;
         end
         else
         begin
            if VI_Fase = 99999 then
               VI_Fase:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'FaseAplicacao').AsInteger
            else
               VI_MediaFase:= VI_MediaFase+1;

            VI_ContMP:= VI_ContMP+1;
         end;

         if ((VR_MediaMP[1] = -1) and (VR_MediaMP[2] = -1) and (VR_MediaMP[3] = -1)) then
         begin
            VI_MP:= 0;
            CalculaMediaParcial;
         end;

         VR_SomaMediaFase:= 0;
         for i:= 1 to VI_MediaFase do
         begin
            if  VR_MediaMP[i] <> -1 then
               VR_SomaMediaFase:= VR_SomaMediaFase+VR_MediaMP[i];
         end;
         VR_SomaMediaFase:= VR_SomaMediaFase/VI_ContMedia;
         VR_SomaMediaFase:= Funcoes.TratarNota(VR_SomaMediaFase);

         if ((VB_PossuiProvaRecuperacao = True) and (VB_RefazCalculo = False) and (VR_SomaMediaFase > 7)) then   //~~~~
         begin   //~~~~
            VB_RefazCalculo:= True;           //~~~~
            VI_MediaFase:= VI_MediaFase-1;    //~~~~
            SetarDefault(12);
            Text1.Lines.Add('Aluno(a) possuí prova de recuperação e não atingiu a média, será refeito o calculo ');
         end                                  //~~~~
         else                                 //~~~~
         begin
            if (VB_PossuiProvaRecuperacao = True) then   //++
               Text1.Lines.Add('Aluno(a) possuí prova de recuperação... ');   //++

            VB_PossuiProvaRecuperacao:= False;
            VB_RefazCalculo:= False;
            VR_MediaFase[VI_Fase]:= Funcoes.TratarNota(VR_SomaMediaFase);

            Trata_Msg(6, 'FASE '+IntToStr(VI_Fase)+'|', '******|', FormatFloat('00.00',Funcoes.TratarNota(VR_SomaMediaFase))+' |');
            VI_ImprimeFase:= 1;

            ImprimirResultado;

            VI_Fase:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'FaseAplicacao').AsInteger;
            if VI_Fase < VI_FaseIni then
               VI_FaseIni:= VI_Fase;
            VI_MP:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'MediaParcial').AsInteger;
         end;
      end;

      ZeraMediaMP;
   end;
end;

//------------------------------------------------------------------------------
// Calcula media Parcial
//------------------------------------------------------------------------------

Procedure TForm_MontaControleGeraoGraus.CalculaMediaParcial;
begin
   if VI_MP <> Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'MediaParcial').AsInteger then
   begin
      if VI_PesoMP = 0 then
      begin
         Text1.Lines.Add('Verifique o Cadastro de Avaliação, O Peso da disciplina esta com "0"');
      end
      else
      begin
         VI_MediaFase:= VI_MediaFase+1;

         if VB_PossuiPeso = True then
         begin
//             VR_MediaMP[VI_MediaFase]:= Funcoes.TratarNota(VR_SomaNota);                 // Calcula Media quando houver peso
             VR_MediaMP[VI_MediaFase]:= Funcoes.TratarNota(VR_SomaNota/VI_PesoMP);                 // Calcula Media quando houver peso
//             VI_ContMedia:= VI_ContMedia+VI_Peso;
            VI_ContMedia:= VI_ContMedia+1;
         end
         else
         begin
            VR_MediaMP[VI_MediaFase]:= Funcoes.TratarNota(VR_SomaNota/VI_PesoMP);      // Calcula Media quando não houver peso
            VI_ContMedia:= VI_ContMedia+1;
         end;

         if  VR_MediaMP[VI_MediaFase] <> 0 then
            Trata_Msg(5, 'MP', '=====',FormatFloat('00.00',Funcoes.TratarNota(VR_MediaMP[VI_MediaFase])));

         VI_PesoMP:= 0;
         VR_SomaNota:= 0;
         VI_MP:= Form_Cad_CorrecaoProva.IBQuery_ResultadoExame.FieldByName( 'MediaParcial').AsInteger;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para tratar mostragem das provas
//------------------------------------------------------------------------------

procedure TForm_MontaControleGeraoGraus.VerificaLinha;
begin
   VI_ImprimeFase:= VI_ImprimeFase + 1;

   if VI_ImprimeFase = 19 then
   begin
      VS_Msg1:= VS_Msg1+'|';
      VS_Msg2:= VS_Msg2+'|';
      VS_Msg3:= VS_Msg3+'|';

      ImprimirResultado;
      VS_Msg0:= '+';
      VS_Msg1:= '';
      VS_Msg2:= '';
      VS_Msg3:= '';
      VI_ImprimeFase:= 1;
   end;
end;

//------------------------------------------------------------------------------
// Imprimi o Resultado
//------------------------------------------------------------------------------

procedure TForm_MontaControleGeraoGraus.ImprimirResultado;
begin
   SetarDefault(8);
   Text1.Lines.Add(VS_Msg0);
   SetarDefault(8);
   Text1.Lines.Add(VS_Msg1);
   SetarDefault(8);
   Text1.Lines.Add(VS_Msg2);
   SetarDefault(8);
   Text1.Lines.Add(VS_Msg0);
   SetarDefault(8);
   Text1.Lines.Add(VS_Msg3);
   SetarDefault(8);
   Text1.Lines.Add(VS_Msg0);
   SetarDefault(8);
   Text1.Lines.Add('');
end;

//------------------------------------------------------------------------------
// Seta a Fonte e o tamanho default de trabalho
//------------------------------------------------------------------------------

procedure TForm_MontaControleGeraoGraus.SetarDefault(VI_Size: Integer);
begin
   Text1.SelAttributes.Name:= 'Courier New';
   Text1.SelAttributes.Size := VI_Size;
end;

//------------------------------------------------------------------------------
// Tracar linha divisoria
//------------------------------------------------------------------------------

procedure TForm_MontaControleGeraoGraus.TracarLinha;
begin
   SetarDefault(9);
   Text1.Lines.Add('________________________________________________________________________________________________________________________________________________________');
   SetarDefault(9);
   Text1.Lines.Add('');
end;

//------------------------------------------------------------------------------
// Trata do botao para fechar a Form
//------------------------------------------------------------------------------

procedure TForm_MontaControleGeraoGraus.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Trata para fechar a janela
//------------------------------------------------------------------------------

procedure TForm_MontaControleGeraoGraus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_AlunoTurma2.Close;
   IBTable_Teste.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Trata do botao para fechar a Form e retonar para Windows
//------------------------------------------------------------------------------

procedure TForm_MontaControleGeraoGraus.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento da opcao de impressao do registro selecionado
//------------------------------------------------------------------------------

procedure TForm_MontaControleGeraoGraus.JvTransparentButton_ImprimirClick( Sender: TObject);
var
   N: Integer;
begin
  if PrintDialog1.Execute then
    for N := 1 to PrintDialog1.Copies do
      Text1.Print('');
end;

//------------------------------------------------------------------------------
// Tratamento das Variaveis de Msg
//------------------------------------------------------------------------------

Procedure TForm_MontaControleGeraoGraus.Trata_Msg( Tam: Integer; PS_Msg1, PS_Msg2, PS_Msg3: String);
begin
   VS_Msg0:= VS_Msg0+Funcoes.ReplStr('-', '-',Tam)+'+';

   VS_Msg1:= VS_Msg1+'|'+Funcoes.CentraStr(PS_Msg1, Tam);
   VS_Msg2:= VS_Msg2+'|'+Funcoes.CentraStr(PS_Msg2, Tam);
   VS_Msg3:= VS_Msg3+'|'+Funcoes.CentraStr(PS_Msg3, Tam);
end;

procedure TForm_MontaControleGeraoGraus.JvTransparentButton_ConfigImpressoraClick(Sender: TObject);
begin
   PrinterSetupDialog1.Execute;
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel por do texto
//------------------------------------------------------------------------------

procedure TForm_MontaControleGeraoGraus.Trocar(Trocar: String; Por: String);
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

end.
