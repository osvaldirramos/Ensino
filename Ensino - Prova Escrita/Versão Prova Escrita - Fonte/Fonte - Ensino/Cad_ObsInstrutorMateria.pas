unit Cad_ObsInstrutorMateria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, JvShape, ComCtrls, ToolWin, DB, Rotinas,
  IBCustomDataSet, IBTable, PsyRichEdit, Grids, DBGrids, IBQuery,
  JvComponent, JvTransBtn;

type
  TForm_Cad_ObsInstrutorMateria = class(TForm)
    IBTable_InstrutorMateria: TIBTable;
    IBTable_InstrutorMateriaIDCURSO: TSmallintField;
    IBTable_InstrutorMateriaCODMATERIA: TIBStringField;
    IBTable_InstrutorMateriaIDENTIDADE: TIBStringField;
    IBTable_InstrutorMateriaOBSERVACAO: TIBStringField;
    DST_InstrutorMateria: TDataSource;
    GroupBox_Documentacao: TGroupBox;
    DBRichEdit_ObsMateriaInstrutor: TDBRichEdit;
    Panel4: TPanel;
    JvShape1: TJvShape;
    DBText_NomeCompleto: TDBText;
    IBTable_InstrutorMateriaSTATUS: TIBStringField;
    DBRadioGroup1: TDBRadioGroup;
    IBTable_FA_Comentarios: TIBTable;
    DT_FA_Comentario: TDataSource;
    IBTable_FA_ComentariosIDCURSO: TSmallintField;
    IBTable_FA_ComentariosIDTURMA: TIntegerField;
    IBTable_FA_ComentariosIDFICHA: TSmallintField;
    IBTable_FA_ComentariosIDENTIDADE: TIBStringField;
    IBTable_FA_ComentariosDISCIPLINA: TIBStringField;
    IBTable_FA_ComentariosSENHA: TIBStringField;
    IBTable_FA_ComentariosCOMENTARIO: TIBStringField;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    IBTable_FA_Avaliacao: TIBTable;
    DST_FA_Avaliacao: TDataSource;
    IBTable_FA_AvaliacaoIDCURSO: TSmallintField;
    IBTable_FA_AvaliacaoIDTURMA: TIntegerField;
    IBTable_FA_AvaliacaoIDFICHA: TSmallintField;
    IBTable_FA_AvaliacaoIDENTIDADE: TIBStringField;
    IBTable_FA_AvaliacaoDISCIPLINA: TIBStringField;
    IBTable_FA_AvaliacaoIDAVL_ICEA: TIBStringField;
    IBTable_FA_AvaliacaoDATAAVALIACAO: TDateTimeField;
    IBTable_FA_AvaliacaoDISPONIVEL: TIBStringField;
    IBTable_FA_AvaliacaoIDCOORDENADOR: TIBStringField;
    IBTable_FA_AvaliacaoSTATUS: TIBStringField;
    IBTable_FA_AvaliacaoMEDIA: TIBStringField;
    PageControl1: TPageControl;
    TabSheet_F2: TTabSheet;
    DBGrid2: TDBGrid;
    Text_Coordenador: TPsyRichEdit;
    TabSheet3: TTabSheet;
    TabSheet_AulaPratica: TTabSheet;
    PsyRichEdit_Alunos: TPsyRichEdit;
    PsyRichEdit_Icea: TPsyRichEdit;
    DBRichEdit_Comentario: TDBRichEdit;
    DSQ_IBQuery_FA_Coordenador: TDataSource;
    IBQuery_FA_Coordenador: TIBQuery;
    IBQuery_FA_CoordenadorIDCURSO: TSmallintField;
    IBQuery_FA_CoordenadorIDTURMA: TIntegerField;
    IBQuery_FA_CoordenadorIDFICHA: TSmallintField;
    IBQuery_FA_CoordenadorIDTOPICO: TSmallintField;
    IBQuery_FA_CoordenadorIDITEM: TSmallintField;
    IBQuery_FA_CoordenadorIDENTIDADE: TIBStringField;
    IBQuery_FA_CoordenadorDISCIPLINA: TIBStringField;
    IBQuery_FA_CoordenadorSENHA: TIBStringField;
    IBQuery_FA_CoordenadorRESPOSTA: TIBStringField;
    DSQ_FA_Pratica: TDataSource;
    IBQuery_FA_Pratica: TIBQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    SmallintField4: TSmallintField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBQuery_FA_Teorica: TIBQuery;
    SmallintField5: TSmallintField;
    IntegerField2: TIntegerField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    SmallintField8: TSmallintField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    DSQ_FA_Teorica: TDataSource;
    Memo1: TRichEdit;
    IBTable_InstrutorMateriaDATAATUALIZACAO: TDateTimeField;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_ConfigurarImpressora: TJvTransparentButton;
    Label1: TLabel;

    procedure TratarMedia;
    Procedure AnalizaMedia(VS_Avl: String);
    procedure Verifica_Coordenador;
    procedure Verifica_Pratica;
    procedure Verifica_Teorica;

    Function Porcentagem(VF_Media_Geral: Real): Real;

    procedure Fechar;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet3Show(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_ConfigurarImpressoraClick(
      Sender: TObject);
  private
   VF_Soma_Coord, VF_Soma_Pratica, VF_Soma_Teorica, VF_Soma_Geral: Real;
   VF_Media_Coord, VF_Media_Pratica, VF_Media_Teorica, VF_Media_Geral: Real;
   VF_SomaDis: Real;


   VI_Qtd_Coord, VI_Qtd_Pratica, VI_Qtd_Teorica, VI_Calc_Media_Geral: Integer;
   VI_Pratica, VI_Teorica: Integer;
   VI_Qtd_Dis: Integer;

   //--- Variaveis para tratar da quantificacao das medias < 3

   VF_SomaMedia, VF_QtdMedia, VF_QtdMediaAbaixo: Real;

   VS_Disciplina, VS_IdItem: String;

   VB_PossuiAvaliacao: Boolean;  public
    { Public declarations }
  end;

var
  Form_Cad_ObsInstrutorMateria: TForm_Cad_ObsInstrutorMateria;

implementation

uses Con_InstrutoresCurso, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_ObsInstrutorMateria.FormActivate(Sender: TObject);
begin
   IBTable_FA_Comentarios.Open;
   IBTable_InstrutorMateria.Open;
   IBTable_FA_Avaliacao.Open;
   IBTable_InstrutorMateria.Edit;


   //--- Tratamento dos Comentarios feitos pelos Coordenadores

   Text_Coordenador.Lines.Clear;
   PsyRichEdit_Alunos.Lines.Clear;
   PsyRichEdit_Icea.Lines.Clear;

   IBTable_FA_Avaliacao.Filter:= 'IdFicha = 2';
   IBTable_FA_Avaliacao.First;
   While Not IBTable_FA_Avaliacao.Eof do
   begin
      if IBTable_FA_Comentarios.FieldByName('IdCurso').AsString <> '' then
      begin
         if  IBTable_FA_Avaliacao.FieldByName('IdFicha').AsString = '2' then
         begin
            Text_Coordenador.Lines.Add('');
            Text_Coordenador.Lines.Add(' Avaliação: '+IBTable_FA_Avaliacao.FieldByName('DataAvaliacao').AsString);
            Text_Coordenador.Lines.Add('');

            DBRichEdit_Comentario.SelectAll;
            DBRichEdit_Comentario.CopyToClipboard ;
            Text_Coordenador.PasteFromClipboard ;
         end
         else
         begin
            if  ((IBTable_FA_Avaliacao.FieldByName('IdFicha').AsString = '3') or (IBTable_FA_Avaliacao.FieldByName('IdFicha').AsString = '4')) then
            begin
              if IBTable_FA_Comentarios.FieldByName('IdCurso').AsString <> '' then
              begin
                 PsyRichEdit_Alunos.Lines.Add('');
                 PsyRichEdit_Alunos.Lines.Add(' Avaliação: '+IBTable_FA_Avaliacao.FieldByName('DataAvaliacao').AsString);
                 PsyRichEdit_Alunos.Lines.Add('');

                 DBRichEdit_Comentario.SelectAll;
                 DBRichEdit_Comentario.CopyToClipboard ;
                 PsyRichEdit_Alunos.PasteFromClipboard ;
              end
              else
              begin
                 if  IBTable_FA_Avaliacao.FieldByName('IdFicha').AsString = '6' then
                 begin
                    PsyRichEdit_Icea.Lines.Add('');
                    PsyRichEdit_Icea.Lines.Add(' Avaliação: '+IBTable_FA_Avaliacao.FieldByName('DataAvaliacao').AsString);
                    PsyRichEdit_Icea.Lines.Add('');

                    DBRichEdit_Comentario.SelectAll;
                    DBRichEdit_Comentario.CopyToClipboard ;
                    PsyRichEdit_Icea.PasteFromClipboard ;
                 end;
              end;
            end;
         end;
      end;
      IBTable_FA_Avaliacao.Next;
   end;
   TratarMedia;
end;

procedure TForm_Cad_ObsInstrutorMateria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria);
   IBTable_FA_Comentarios.Close;
   IBTable_InstrutorMateria.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_ObsInstrutorMateria.JvTransparentButton_GravaClick(Sender: TObject);
begin
   IBTable_InstrutorMateria.Post;
   Fechar;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Cancelar
//------------------------------------------------------------------------------

procedure TForm_Cad_ObsInstrutorMateria.JvTransparentButton_ConfigurarImpressoraClick(Sender: TObject);
begin
   IBTable_InstrutorMateria.Cancel;
   Fechar;
end;

//------------------------------------------------------------------------------
// Tratamento da Procedure Fechar
//------------------------------------------------------------------------------

procedure TForm_Cad_ObsInstrutorMateria.Fechar;
begin
   Close;
end;

procedure TForm_Cad_ObsInstrutorMateria.TabSheet3Show(Sender: TObject);
begin
    IBTable_FA_Comentarios.Filter:= 'IdFicha = 6';
end;

procedure TForm_Cad_ObsInstrutorMateria.TratarMedia;
var
   VS_Comando: String;
begin
   Memo1.Lines.Clear;
   VB_PossuiAvaliacao:= False;

      //--- Verificando a Ficha do Coordenador (2)
   VS_Comando:= 'Select * From FA_Resposta '+
                ' Where IdFicha = 2 '+
                ' and (IdTopico >= 1 and IdTopico <= 4) '+
                ' and IdCurso =  '+Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria.FieldByName('IdCurso').AsString+
                ' and Identidade =  '+#39+Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria.FieldByName('Identidade').AsString+#39+
                ' and Disciplina =  '+#39+Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria.FieldByName('CodMateria').AsString+#39+
                ' order by  disciplina, IdFicha, IdTopico, IdItem ';

   IBQuery_FA_Coordenador.Close;
   IBQuery_FA_Coordenador.Sql.Clear;
   IBQuery_FA_Coordenador.Sql.Add(VS_Comando);
   IBQuery_FA_Coordenador.Open;
   IBQuery_FA_Coordenador.First;

   VI_Calc_Media_Geral:= 0;
   VF_Soma_Coord:= 0;
   VI_Qtd_Coord:= 0;
   VF_SomaMedia:= 0;
   VF_QtdMedia:= 0;

   if IBQuery_FA_Coordenador.FieldByName('Disciplina').AsString <> '' then
   begin
      VS_Disciplina:= IBQuery_FA_Coordenador.FieldByName('Disciplina').AsString;
      VS_IdItem:= IBQuery_FA_Coordenador.FieldByName('IdItem').AsString;

      While not IBQuery_FA_Coordenador.Eof do
      begin
         Verifica_Coordenador;
         IBQuery_FA_Coordenador.Next;
      end;
      VS_Disciplina:= VS_Disciplina+' ';
      Verifica_Coordenador;
   end;

      //--- Verificando a Ficha Avaliacao Pratica (3)

   VS_Comando:= 'Select * From FA_Resposta '+
                ' Where IdFicha = 3 '+
                ' and IdTopico = 2 '+
                ' and IdCurso =  '+Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria.FieldByName('IdCurso').AsString+
                ' and Identidade =  '+#39+Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria.FieldByName('Identidade').AsString+#39+
                ' and Disciplina =  '+#39+Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria.FieldByName('CodMateria').AsString+#39+
                ' order by  disciplina, IdFicha, IdTopico, IdItem ';

   IBQuery_FA_Pratica.Close;
   IBQuery_FA_Pratica.Sql.Clear;
   IBQuery_FA_Pratica.Sql.Add(VS_Comando);
   IBQuery_FA_Pratica.Open;
   IBQuery_FA_Pratica.First;

   VI_Qtd_Pratica:= 0;
   VI_Pratica:= 0;
   VF_SomaMedia:= 0;
   VF_QtdMedia:= 0;

   VF_SomaDis:= 0;
   VI_Qtd_Dis:= 0;
   VF_Soma_Pratica:= 0;

   if IBQuery_FA_Pratica.FieldByName('Disciplina').AsString <> '' then
   begin
      VS_Disciplina:= IBQuery_FA_Pratica.FieldByName('Disciplina').AsString;
      VS_IdItem:= IBQuery_FA_Pratica.FieldByName('IdItem').AsString;
      While not IBQuery_FA_Pratica.Eof do
      begin
         Verifica_Pratica;
         IBQuery_FA_Pratica.Next;
      end;
      VS_Disciplina:= VS_Disciplina+' ';
      Verifica_Pratica;
   end;

      //--- Verificando a Ficha Avaliacao Teorica (4)

   VS_Comando:= 'Select * From FA_Resposta '+
                ' Where IdFicha = 4 '+
                ' and IdTopico = 1 '+
                ' and IdCurso =  '+Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria.FieldByName('IdCurso').AsString+
                ' and Identidade =  '+#39+Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria.FieldByName('Identidade').AsString+#39+
                ' and Disciplina =  '+#39+Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria.FieldByName('CodMateria').AsString+#39+
                ' order by  disciplina, IdFicha, IdTopico, IdItem ';

   IBQuery_FA_Teorica.Close;
   IBQuery_FA_Teorica.Sql.Clear;
   IBQuery_FA_Teorica.Sql.Add(VS_Comando);
   IBQuery_FA_Teorica.Open;
   IBQuery_FA_Teorica.First;

   VF_SomaMedia:= 0;
   VF_QtdMedia:= 0;

   VI_Teorica:= 0;
   VF_Soma_Teorica:= 0;
   VI_Qtd_Teorica:= 0;
   VF_SomaDis:= 0;
   VI_Qtd_Dis:= 0;

   if IBQuery_FA_Teorica.FieldByName('Disciplina').AsString <> '' then
   begin
      VS_Disciplina:= IBQuery_FA_Teorica.FieldByName('Disciplina').AsString;
      VS_IdItem:= IBQuery_FA_Teorica.FieldByName('IdItem').AsString;

      While not IBQuery_FA_Teorica.Eof do
      begin
         Verifica_Teorica;
         IBQuery_FA_Teorica.Next;
      end;
      VS_Disciplina:= VS_Disciplina+' ';
      Verifica_Teorica;
   end;

   if VB_PossuiAvaliacao = True then
   begin
      VF_Media_Coord:= 0;
      VF_Media_Pratica:= 0;
      VF_Media_Teorica:= 0;
      VI_Calc_Media_Geral:= 0;

      if VI_Qtd_Coord > 0 then
      begin
         VF_Media_Coord:= VF_Soma_Coord/VI_Qtd_Coord;
         VI_Calc_Media_Geral:= VI_Calc_Media_Geral+1;
      end;

      if VI_Qtd_Pratica > 0 then
      begin
         VF_Media_Pratica:= VF_Soma_Pratica/VI_Qtd_Pratica;
         VI_Calc_Media_Geral:= VI_Calc_Media_Geral+1;
      end;

      if VI_Qtd_Teorica > 0 then
      begin
         VF_Media_Teorica:= VF_Soma_Teorica/VI_Qtd_Teorica;
         VI_Calc_Media_Geral:= VI_Calc_Media_Geral+1;
      end;

      if VI_Calc_Media_Geral > 0 then
      begin
         VF_Soma_Geral:= VF_Media_Coord+VF_Media_Pratica+VF_Media_Teorica;
         if VF_Soma_Geral > 0 then
            VF_Media_Geral:= VF_Soma_Geral/VI_Calc_Media_Geral;
      end;

      if Porcentagem(VF_Media_Geral) >= 80 then
      begin
         if  VF_QtdMediaAbaixo <= 3 then
            Memo1.Lines.Add('Média Geral '+FormatFloat('#0.00', VF_Media_Geral )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Geral))+'%) - Qtd Media Baixa '+FormatFloat('#0', VF_QtdMediaAbaixo )+' ( Ativo )' )
         else
            Memo1.Lines.Add('Média Geral '+FormatFloat('#0.00', VF_Media_Geral )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Geral))+'%) - Qtd Media Baixa '+FormatFloat('#0', VF_QtdMediaAbaixo )+' ( Em Avaliação )')
      end
      else
      begin
         Memo1.Lines.Add('Média Geral '+FormatFloat('#0.00', VF_Media_Geral )+' ('+FormatFloat('#0.00', Porcentagem(VF_Media_Geral))+'%) - '+' Qtd Media Baixa '+FormatFloat('#0', VF_QtdMediaAbaixo )+' ( Afastado )')
      end;
   end;
end;

//------------------------------------------------------------------------------
// Verificacao do Coordenador
//------------------------------------------------------------------------------

procedure TForm_Cad_ObsInstrutorMateria.Verifica_Coordenador;
var
   VS_VerDisciplina: String;
begin
   if IBQuery_FA_Coordenador.FieldByName('Disciplina').AsString <> '' then
   begin
      VS_VerDisciplina:= IBQuery_FA_Coordenador.FieldByName('Disciplina').AsString;
      if VS_Disciplina <> VS_VerDisciplina then
      begin
         VB_PossuiAvaliacao:= True;
         AnalizaMedia('Avaliação Pelo Coordenador ');

         VS_Disciplina:= IBQuery_FA_Coordenador.FieldByName('Disciplina').AsString;
         VS_IdItem:= IBQuery_FA_Coordenador.FieldByName('IdItem').AsString;
      end
      else
      begin
         if VS_IdItem <> IBQuery_FA_Coordenador.FieldByName('IdItem').AsString then
         begin
            VB_PossuiAvaliacao:= True;

            if VF_QtdMedia > 0 then
               if (VF_SomaMedia/VF_QtdMedia) < 3 then
                  VF_QtdMediaAbaixo:= VF_QtdMediaAbaixo+1;

            VS_IdItem:= IBQuery_FA_Coordenador.FieldByName('IdItem').AsString;
            VF_SomaMedia:= 0;
            VF_QtdMedia:= 0;
         end;
      end;

      if IBQuery_FA_Coordenador.FieldByName('Resposta').AsString <> '' then
      begin
         VI_Calc_Media_Geral:= VI_Calc_Media_Geral +1;
         VI_Qtd_Coord:= VI_Qtd_Coord+1;
         VF_Soma_Coord:= VF_Soma_Coord+IBQuery_FA_Coordenador.FieldByName('Resposta').AsFloat;

         VF_SomaDis:= VF_SomaDis+IBQuery_FA_Coordenador.FieldByName('Resposta').AsFloat;
         VI_Qtd_Dis:= VI_Qtd_Dis+1;

         VF_SomaMedia:= VF_SomaMedia+IBQuery_FA_Coordenador.FieldByName('Resposta').AsFloat;
         VF_QtdMedia:= VF_QtdMedia + 1;
      end;
   end;
end;


//------------------------------------------------------------------------------
// Verificacao da Avaliacao Pratica
//------------------------------------------------------------------------------

procedure TForm_Cad_ObsInstrutorMateria.Verifica_Pratica;
var
   VS_VerDisciplina: String;
begin
   if IBQuery_FA_Pratica.FieldByName('Disciplina').AsString <> '' then
   begin
      VS_VerDisciplina:= IBQuery_FA_Pratica.FieldByName('Disciplina').AsString;
      if VS_Disciplina <> VS_VerDisciplina then
      begin
         VB_PossuiAvaliacao:= True;
         AnalizaMedia('Avaliação Pratica');


         VS_Disciplina:= IBQuery_FA_Pratica.FieldByName('Disciplina').AsString;
         VS_IdItem:= IBQuery_FA_Pratica.FieldByName('IdItem').AsString;
      end
      else
      begin
         if VS_IdItem <> IBQuery_FA_Pratica.FieldByName('IdItem').AsString then
         begin
            VB_PossuiAvaliacao:= True;

            if VF_QtdMedia > 0 then
               if (VF_SomaMedia/VF_QtdMedia) < 3 then
                  VF_QtdMediaAbaixo:= VF_QtdMediaAbaixo+1;

            VS_IdItem:= IBQuery_FA_Pratica.FieldByName('IdItem').AsString;
            VF_SomaMedia:= 0;
            VF_QtdMedia:= 0;
         end;
      end;

      if IBQuery_FA_Pratica.FieldByName('Resposta').AsString <> '' then
      begin
         VI_Calc_Media_Geral:= VI_Calc_Media_Geral +1;
         VI_Qtd_Pratica:= VI_Qtd_Pratica+1;
         VF_Soma_Pratica:= VF_Soma_Pratica+IBQuery_FA_Pratica.FieldByName('Resposta').AsFloat;

         VF_SomaDis:= VF_SomaDis+IBQuery_FA_Pratica.FieldByName('Resposta').AsFloat;
         VI_Qtd_Dis:= VI_Qtd_Dis+1;

         VF_SomaMedia:= VF_SomaMedia+IBQuery_FA_Pratica.FieldByName('Resposta').AsFloat;
         VF_QtdMedia:= VF_QtdMedia + 1;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Verificacao da Avaliacao Teorica
//------------------------------------------------------------------------------

procedure TForm_Cad_ObsInstrutorMateria.Verifica_Teorica;
var
   VS_VerDisciplina: String;
begin
   if IBQuery_FA_Teorica.FieldByName('Disciplina').AsString <> '' then
   begin
      VS_VerDisciplina:= IBQuery_FA_Teorica.FieldByName('Disciplina').AsString;
      if VS_Disciplina <> VS_VerDisciplina then
      begin
         VB_PossuiAvaliacao:= True;
         AnalizaMedia('Avaliação Teórica');

         VS_Disciplina:= IBQuery_FA_Teorica.FieldByName('Disciplina').AsString;
         VS_IdItem:= IBQuery_FA_Teorica.FieldByName('IdItem').AsString;
      end
      else
      begin
         if VS_IdItem <> IBQuery_FA_Teorica.FieldByName('IdItem').AsString then
         begin
            VB_PossuiAvaliacao:= True;

            if VF_QtdMedia > 0 then
               if (VF_SomaMedia/VF_QtdMedia) < 3 then
                  VF_QtdMediaAbaixo:= VF_QtdMediaAbaixo+1;

            VS_IdItem:= IBQuery_FA_Teorica.FieldByName('IdItem').AsString;
            VF_SomaMedia:= 0;
            VF_QtdMedia:= 0;
         end;
      end;

      if IBQuery_FA_Teorica.FieldByName('Resposta').AsString <> '' then
      begin
         VI_Calc_Media_Geral:= VI_Calc_Media_Geral +1;
         VI_Qtd_Teorica:= VI_Qtd_Teorica+1;
         VF_Soma_Teorica:= VF_Soma_Teorica+IBQuery_FA_Teorica.FieldByName('Resposta').AsFloat;

         VF_SomaDis:= VF_SomaDis+IBQuery_FA_Teorica.FieldByName('Resposta').AsFloat;
         VI_Qtd_Dis:= VI_Qtd_Dis+1;

         VF_SomaMedia:= VF_SomaMedia+IBQuery_FA_Teorica.FieldByName('Resposta').AsFloat;
         VF_QtdMedia:= VF_QtdMedia + 1;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Encontrando a Pontuacao de acordo com a porcentagem
//------------------------------------------------------------------------------

Function TForm_Cad_ObsInstrutorMateria.Porcentagem(VF_Media_Geral: Real): Real;
begin
   VF_Media_Geral:= Trunc(VF_Media_Geral * 100) / 100;
   Result:= ((VF_Media_Geral/5)* 100);
end;

//------------------------------------------------------------------------------
// Analiza a Media por Item
//------------------------------------------------------------------------------

Procedure TForm_Cad_ObsInstrutorMateria.AnalizaMedia(VS_Avl: String);
var
   VF_CalDis: Real;
begin
   if VF_QtdMedia > 0 then
   begin
      if (VF_SomaMedia/VF_QtdMedia) < 3 then
         VF_QtdMediaAbaixo:= VF_QtdMediaAbaixo+1;

      VF_CalDis:= VF_SomaDis/VI_Qtd_Dis;
      Memo1.Lines.Add(VS_Avl+' - '+FormatFloat('#0.00', VF_CalDis )+' ('+FormatFloat('#0.00', Porcentagem(VF_CalDis))+'%)' );
   end;
   VF_SomaMedia:= 0;
   VF_QtdMedia:= 0;

   VF_SomaDis:= 0;
   VI_Qtd_Dis:= 0;
end;

end.
