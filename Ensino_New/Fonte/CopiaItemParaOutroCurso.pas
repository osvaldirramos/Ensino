//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : CopiaItemParaOutroCurso.PAS                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de Copiar o Item Se-  //
//                             de Prova selecionado para o Curso e Disciplina //
//                             Desejado, para isto o usuario devera selecionar//
//                             o curso e a Disciplina.                        //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          :                                                //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 29/07/2011                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit CopiaItemParaOutroCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Grids, DBGrids, JvEdit,
  ToolWin, ComCtrls, DBCtrls, JvComponent, JvCaptionPanel, JvxCtrls, Rotinas,
  ExtCtrls, JvShape, Rotinas_Sue, IBTable, JvTransBtn, JvGradient;

type
  TForm_CopiaItemParaOutroCurso = class(TForm)
    Panel_Treeviw: TPanel;
    JvCaptionPanel1: TJvCaptionPanel;
    DBNavigator2: TDBNavigator;
    ToolBar2: TToolBar;
    JvEdit_Materia: TJvEdit;
    JvEdit_NomeMateria: TJvEdit;
    DBGrid_Materia: TDBGrid;
    Query_MontaCurso: TIBQuery;
    DSQ_MontaCurso: TDataSource;
    Query_MontaMateria: TIBQuery;
    Query_MontaMateriaIDCURSO: TSmallintField;
    Query_MontaMateriaCODMATERIA: TIBStringField;
    Query_MontaMateriaNOMEMATERIA: TIBStringField;
    DSQ_MontaMateria: TDataSource;
    Query_MontaMateriaIDTURMA: TIntegerField;
    Query_MontaCursoIDCURSO: TSmallintField;
    Query_MontaCursoIDTURMA: TIntegerField;
    Query_MontaCursoCODCURSO: TIBStringField;
    Query_MontaCursoNOMECURSO: TIBStringField;
    IBQuery_Turmas: TIBQuery;
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
    Memo1: TMemo;

    procedure MontaMateria(Sender: TObject);

    procedure FormActivate(Sender: TObject);
    procedure ComboBox_CursoSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_CopiarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
       VS_OrderByMateria: String;
  public    { Public declarations }
  end;

var
  Form_CopiaItemParaOutroCurso: TForm_CopiaItemParaOutroCurso;

implementation

uses Sel_ItemProva, Frame_Sel_Curso, Module;

{$R *.dfm}

procedure TForm_CopiaItemParaOutroCurso.FormActivate(Sender: TObject);
begin
   if Funcoes.GetTransfItem = 'Iniciar' then
   Begin
      Funcoes.CabecalhoForm(Form_CopiaItemParaOutroCurso, 'Ensino --> Copia de Item do Curso '+Funcoes.GetCodCurso+' para Outro Curso');

      Funcoes.SetTransfItem('Continuar');

      Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
      Funcoes.TratarJvTransparentButton(JvTransparentButton_Copiar, JvShape_Copiar, False);
   end;
end;

//------------------------------------------------------------------------------
//--- Monta query de selecao de curso
//------------------------------------------------------------------------------

procedure TForm_CopiaItemParaOutroCurso.ComboBox_CursoSelect(Sender: TObject);
begin
   Funcoes.ExecutaQuery(Query_MontaCurso, 'Select c.IdCurso, t.IdTurma, c.CodCurso, c.NomeCurso '+
                                          'From Curso c, Turma t'+
                                          ' where c.IdCurso = t.IdCurso '+
                                          ' and c.codcurso = '+#39+ComboBox_Curso.Text+#39+
                                          ' order by t.IdTurma'
                       );

   Query_MontaCurso.Last;
   if Query_MontaCurso.RecordCount > 0 then
   begin
      Query_MontaMateria.Open;
      if Query_MontaMateria.FieldByName('IdCurso').AsString = '' then
         Funcoes.TratarJvTransparentButton(JvTransparentButton_Copiar, JvShape_Copiar, False)
      else
         Funcoes.TratarJvTransparentButton(JvTransparentButton_Copiar, JvShape_Copiar, True);
   end
   else
   begin
      Showmessage('Curso não Cadastrado.');
   end;
end;

procedure TForm_CopiaItemParaOutroCurso.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   Funcoes.SetTransfItem('Iniciar');
   Form_Sel_ItemProva.Width:= 1270;

   Query_MontaMateria.Open;
   Close;
end;

procedure TForm_CopiaItemParaOutroCurso.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_CopiaItemParaOutroCurso.JvTransparentButton_CopiarClick(Sender: TObject);
begin
   if ((Form_Sel_ItemProva.Query_Item.FieldByName('IDCURSO').AsString = Query_MontaCurso.FieldByName('IDCURSO').AsString) and
       (Form_Sel_ItemProva.Query_Item.FieldByName('CODMATERIA').AsString = Query_MontaMateria.FieldByName('CODMATERIA').AsString)) then
   begin
       ShowMessage('O itens não podem ser copiados para ele mesmo...');
   end
   else
   begin
       //---
      //--- Copia para Turma Base

      Funcoes.ExecutaQuery(IBQuery_Turmas, 'Select * from Turma Where IdCurso = '+Query_MontaCurso.FieldByName('IDCURSO').AsString+' and Status = '+#39+'A'+#39);

      DM.IBTable_Item_Prova.Open;
      Form_Sel_ItemProva.Query_Item.First;
      While not Form_Sel_ItemProva.Query_Item.Eof do
      Begin
         Funcoes.ExecusaoQuery('delete from Item_Prova Where IdCurso = '+Query_MontaCurso.FieldByName('IDCURSO').AsString+' and IdTurma = 0 and NumItem = '+Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString);
         Funcoes.Grava_Item_Prova( Query_MontaCurso.FieldByName('IDCURSO').AsString,
                                   '0',
                                   Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString,
                                   Query_MontaMateria.FieldByName('CODMATERIA').AsString,
                                   Copy(Query_MontaMateria.FieldByName('CODMATERIA').AsString,1,2),
                                   Copy(Query_MontaMateria.FieldByName('CODMATERIA').AsString,3,2),
                                   Copy(Query_MontaMateria.FieldByName('CODMATERIA').AsString,5,2),
                                   Form_Sel_ItemProva.Query_Item.FieldByName('OBJETIVO').AsString,
                                   '',
                                   Form_Sel_ItemProva.Query_Item.FieldByName('Serie').AsString,
                                   'R'
                                  );

          //---
         // Copia o Item Selecionado para as Turmas em Andamento

         IBQuery_Turmas.First;
         While not IBQuery_Turmas.Eof do
         begin
            Funcoes.ExecusaoQuery('Delete from Item_Prova Where IdCurso = '+Query_MontaCurso.FieldByName('IDCURSO').AsString+' and IdTurma = '+IBQuery_Turmas.FieldByName('IDTurma').AsString+' and NumItem = '+Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString);

            Funcoes.Grava_Item_Prova( Query_MontaCurso.FieldByName('IDCURSO').AsString,
                                      IBQuery_Turmas.FieldByName('IDTurma').AsString,
                                      Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString,
                                      Query_MontaMateria.FieldByName('CODMATERIA').AsString,
                                      Copy(Query_MontaMateria.FieldByName('CODMATERIA').AsString,1,2),
                                      Copy(Query_MontaMateria.FieldByName('CODMATERIA').AsString,3,2),
                                      Copy(Query_MontaMateria.FieldByName('CODMATERIA').AsString,5,2),
                                      Form_Sel_ItemProva.Query_Item.FieldByName('OBJETIVO').AsString,
                                      '',
                                      Form_Sel_ItemProva.Query_Item.FieldByName('Serie').AsString,
                                      'R'
                                     );
            IBQuery_Turmas.Next;
         end;
         Form_Sel_ItemProva.Query_Item.Next;
      end;
      DM.IBTable_Item_Prova.Close;
      ShowMessage('Finalizada a cópia do Curso '+Frame_SelCurso.ComboBox_Curso.Text+' para o curso '+ComboBox_Curso.Text)
   end;
end;

procedure TForm_CopiaItemParaOutroCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Materia
//------------------------------------------------------------------------------

procedure TForm_CopiaItemParaOutroCurso.MontaMateria(Sender: TObject);
var
   VS_Comando: string;
begin
   VS_OrderByMateria:= 'Order By CodMateria';
   //--- Monta query de selecao de Materia

   VS_Comando:= 'Select IdCurso, IdTurma, CodMateria, NomeMateria, NumeroAulasTeoricas, NumeroAulasPraticas '+
                ' from MateriaCurso '+
                ' where IdCurso = :IdCurso'+
                ' and   IdTurma = 0';

   if trim(JvEdit_Materia.Text) <> '' then
      VS_Comando:= VS_Comando+' and CodMateria like '+#39+JvEdit_Materia.Text+'%'+#39;

   if trim(JvEdit_NomeMateria.Text) <> '' then
      VS_Comando:= VS_Comando+' and NomeMateria like '+#39+JvEdit_NomeMateria.Text+'%'+#39;

   Funcoes.ExecutaQuery(Query_MontaMateria, VS_Comando+VS_OrderByMateria);
end;

end.
