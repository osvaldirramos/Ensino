//----------------------------------------------------------------------------//
//                                                                            //
//  NOME DO PROJETO : ENSINO - SISTEMA DE AUXILIO DO ENSINO                   //                                                     //
//                                                       //
//----------------------------------------------------------------------------//
//  DESCRIÇÃO : Rotina criada para ajustar o Item vindo do APAC               //
//                                                                            //
//  MÓDULOS CHAMADOS :                                                        //
//                                                                            //
//  EQUIPE DE DESENVOLVIMENTO:                                                //
//                                                                            //
//  ANALISTAS: Osvaldir Donizetti Ramos                                       //
//                                                                            //
//  PROGRAMADOR: Osvaldir Donizetti Ramos                                     //
//                                                                            //
//  REVISORES :                                                               //
//                                                                            //
//  INICIO DA ELABORAÇÃO : 01-05-1999                                         //
//                                                                            //
//----------------------------------------------------------------------------//
//                                   REVISÃO                                  //
//----------------------------------------------------------------------------//
//  DATA :                                                                    //
//  AUTOR :                                                                   //
//  MOTIVO :                                                                  //
//----------------------------------------------------------------------------//

unit Fer_AjustarItemProva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, JvRichEd, JvDBRichEd, DB,
  IBCustomDataSet, IBTable, PsyRichEdit, ExtCtrls;

type
  TForm_Fer_AjustarItemProva = class(TForm)
    ToolBar3: TToolBar;
    ToolButton_AjustarItemTratado: TToolButton;
    ToolButtonG_GravaAjuste: TToolButton;
    ToolButton9: TToolButton;
    ToolButton_FechaAjustar: TToolButton;
    GroupBox1: TGroupBox;
    JvDBRichEdit_Original: TJvDBRichEdit;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    Ruler: TPanel;
    RulerLine: TBevel;
    RightInd: TLabel;
    Bevel3: TBevel;
    LeftInd: TLabel;
    FirstInd: TLabel;
    Text1: TPsyRichEdit;
    ToolButton1: TToolButton;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    ToolButton_Cancelar: TToolButton;
    ToolButton3: TToolButton;

    procedure Ajustar;

    procedure ToolButton_AjustarItemTratadoClick(Sender: TObject);
    procedure ToolButtonG_GravaAjusteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_FechaAjustarClick(Sender: TObject);
    procedure FirstIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseMove(Sender: TObject; Shift: TShiftState;  X, Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton;  Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RulerResize(Sender: TObject);
    procedure LeftIndMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvDBRichEdit_OriginalSelectionChange(Sender: TObject);
    procedure Text1SelectionChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton_CancelarClick(Sender: TObject);

  private    { Private declarations }
    FDragOfs_Ajus, FDragOfs: Integer;
    FDragging_Ajus, FDragging: Boolean;
    FUpdating: Boolean;
  public
    { Public declarations }
  end;

var
  Form_Fer_AjustarItemProva: TForm_Fer_AjustarItemProva;

implementation

uses Sel_ItemProva, Module;

const
  RulerAdj = 4/3;
  GutterWid = 6;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Form Principal
//------------------------------------------------------------------------------

procedure TForm_Fer_AjustarItemProva.FormActivate(Sender: TObject);
begin
//   Form_Sel_ItemProva.IBTable_Item_Prova.Open;
   Form_Sel_ItemProva.IBTable_Item_Desc.Open;

   Text1.Paragraph.LeftIndent := 25;
   JvDBRichEdit_Original.ReadOnly:= True;
   Ajustar;
end;

//------------------------------------------------------------------------------
// Rotina para ajustar o Item da Prova
//------------------------------------------------------------------------------

procedure TForm_Fer_AjustarItemProva.Ajustar;
var
   VI_achouD, i, VI_Linhas: Integer;
   VS_ItemAjustado, VS_Traco, VS_Monta, VS_Linha: String;
   VB_AchouD, VB_Grava: Boolean;
begin
  Text1.Lines.Clear;
  if Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName('Possui_Imagem').AsString = 'S' then
  begin
      ShowMessage('Este Item possuí imagem, favor corrigir manualmente');
//      Query_Item.Next;
  end
  else
  begin
     Text1.SelAttributes.Size := 11;
     Text1.SelAttributes.Name:= 'Courier New';
     Text1.Paragraph.LeftIndent := 22;
     JvDBRichEdit_Original.SelectAll;
     JvDBRichEdit_Original.SelAttributes.Size := 11;
     JvDBRichEdit_Original.SelAttributes.Name:= 'Courier New';
     VI_Linhas:= JvDBRichEdit_Original.Lines.count+1;
     VS_ItemAjustado:= '';
     VS_Monta:= '';
     VB_Grava:= False;
     VB_AchouD:= False;
     VI_achouD:= 0;
     i:= 0;
     While i <= VI_Linhas do
     begin
         if VB_Grava = True then
         begin
            if ((VB_AchouD = True) and (Trim(VS_Monta) = '')) then
            begin
               i:= i +1;
               VB_Grava:= False;
            end
            else
            begin
               if VB_AchouD = True then
                  VI_achouD:= VI_achouD+1;

               if VI_achouD = 2 then
                  VS_ItemAjustado:= VS_ItemAjustado+Trim(VS_Monta)
               else
                  VS_ItemAjustado:= VS_ItemAjustado+Trim(VS_Monta)+#13;

               if ((VB_AchouD = False) and (Trim(VS_Linha) = '')) then
                  VS_ItemAjustado:= VS_ItemAjustado+#13;

               VS_Traco:= Copy(Trim(VS_Linha), Length(Trim(VS_Linha)), 1);
               if VS_Traco = '-' then
                   VS_Monta:= Copy(VS_Linha, 1, Length(Trim(VS_Linha))-1)
               else
                  VS_monta:= VS_Linha;

               VB_Grava:= False;
            end;
         end
         else
         begin
            VS_Linha:= JvDBRichEdit_Original.Lines.Strings[I];

            if ((Copy(VS_Linha, 1, 2) = 'A)') or (Copy(VS_Linha, 1, 2) = 'B)') or (Copy(VS_Linha, 1, 2) = 'C)') or (Copy(VS_Linha, 1, 2) = 'D)')) then
               VS_linha:= LowerCase(copy(VS_Linha,1,1))+copy(VS_Linha,2,length(VS_linha)-1);

            i:= i+1;
            if ((Trim(VS_Linha) = '') or
                (Copy(VS_Linha, 1, 2) = 'I-') or (Copy(VS_Linha, 1, 3) = 'II-') or (Copy(VS_Linha, 1, 4) = 'III-') or (Copy(VS_Linha, 1, 3) = 'IV-') or
                (Copy(VS_Linha, 1, 2) = '( ') or
                (Copy(VS_Linha, 1, 2) = '1.') or (Copy(VS_Linha, 1, 2) = '2.') or (Copy(VS_Linha, 1, 2) = '3.') or (Copy(VS_Linha, 1, 2) = '4.') or (Copy(VS_Linha, 1, 2) = '5.') or
                (Copy(VS_Linha, 1, 2) = '6.') or (Copy(VS_Linha, 1, 2) = '7.') or (Copy(VS_Linha, 1, 2) = '8.') or (Copy(VS_Linha, 1, 2) = '9.') or
                (Copy(VS_Linha, 1, 2) = '(1') or (Copy(VS_Linha, 1, 2) = '(2') or (Copy(VS_Linha, 1, 2) = '(3') or (Copy(VS_Linha, 1, 2) = '(4') or (Copy(VS_Linha, 1, 2) = '(5') or
                (Copy(VS_Linha, 1, 2) = '(6') or (Copy(VS_Linha, 1, 2) = '(7') or (Copy(VS_Linha, 1, 2) = '(8') or (Copy(VS_Linha, 1, 2) = '(9') or
                (Copy(VS_Linha, 1, 3) = '(1 -') or (Copy(VS_Linha, 1, 3) = '(2 -') or (Copy(VS_Linha, 1, 3) = '(3 -') or (Copy(VS_Linha, 1, 3) = '(4 -') or (Copy(VS_Linha, 1, 3) = '(5 -') or
                (Copy(VS_Linha, 1, 3) = '(6 -') or (Copy(VS_Linha, 1, 3) = '(7 -') or (Copy(VS_Linha, 1, 3) = '(8 -') or (Copy(VS_Linha, 1, 3) = '(9 -') or
                (Copy(VS_Linha, 1, 3) = '(I -') or (Copy(VS_Linha, 1, 4) = 'II -') or (Copy(VS_Linha, 1, 5) = 'III -') or (Copy(VS_Linha, 1, 4) = 'IV -') or
                (Copy(VS_Linha, 1, 2) = 'b)') or (Copy(VS_Linha, 1, 2) = 'c)') or (Copy(VS_Linha, 1, 2) = 'd)')) then
            begin
               if ((Copy(VS_Linha, 1, 2) = 'D)') or (Copy(VS_Linha, 1, 2) = 'd)')) then
                   VB_AchouD:= True;
               VB_Grava:= True;
            end
            else
            begin
               VS_Traco:= Copy(Trim(VS_Linha), Length(Trim(VS_Linha)), 1);
               if VS_Traco = '-' then
                  VS_Linha:= Copy(VS_Linha, 1, Length(Trim(VS_Linha))-1);

               VS_Monta:= VS_Monta+VS_Linha;

               if i = VI_linhas then
                  VB_Grava:= true;
            end;
         end;
     end;

     Text1.Text:= VS_ItemAjustado;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botal Ajustar
//------------------------------------------------------------------------------

procedure TForm_Fer_AjustarItemProva.ToolButton_AjustarItemTratadoClick(Sender: TObject);
begin
   Ajustar;
end;

//------------------------------------------------------------------------------
// Tratamento do Botal fechar
//------------------------------------------------------------------------------

procedure TForm_Fer_AjustarItemProva.ToolButton_FechaAjustarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Copia o Item tratado para o item
//------------------------------------------------------------------------------

procedure TForm_Fer_AjustarItemProva.ToolButtonG_GravaAjusteClick(Sender: TObject);
begin
   JvDBRichEdit_Original.ReadOnly:= False;
   Form_Sel_ItemProva.IBTable_Item_Desc.Edit;
   JvDBRichEdit_Original.Lines.Clear;
   Text1.SelectAll;
   Text1.CopyToClipboard;
   JvDBRichEdit_Original.PasteFromClipboard;
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'NLinhas').AsInteger:= JvDBRichEdit_Original.Lines.count;
   Form_Sel_ItemProva.IBTable_Item_Desc.Post;
   DM.IBTransaction_Ensino.CommitRetaining;
   Form_Sel_ItemProva.Query_Item.Next;
   Ajustar;
end;

procedure TForm_Fer_AjustarItemProva.FirstIndMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs_Ajus := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs_Ajus;
  FDragging_Ajus := True;
end;

procedure TForm_Fer_AjustarItemProva.FirstIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if FDragging_Ajus then
     TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs_Ajus

end;

procedure TForm_Fer_AjustarItemProva.FirstIndMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging_Ajus := False;
  Text1.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs_Ajus-GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TForm_Fer_AjustarItemProva.LeftIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if FDragging_Ajus then
     TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs_Ajus

end;

procedure TForm_Fer_AjustarItemProva.LeftIndMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging_Ajus:= False;
  Text1.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs_Ajus-GutterWid) / RulerAdj)-Text1.Paragraph.FirstIndent;
end;

procedure TForm_Fer_AjustarItemProva.RightIndMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Fer_AjustarItemProva.RightIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
     TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs

end;

procedure TForm_Fer_AjustarItemProva.RightIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if RightInd.Left > RulerLine.Width then
    RightInd.Left := RulerLine.Width-16;

  FDragging := False;
  Text1.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
  Text1SelectionChange(Sender);

end;

procedure TForm_Fer_AjustarItemProva.RulerResize(Sender: TObject);
begin
  RulerLine.Width := Ruler.Width;
end;

procedure TForm_Fer_AjustarItemProva.LeftIndMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs_Ajus := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs_Ajus;
  FDragging_Ajus := True;
end;

procedure TForm_Fer_AjustarItemProva.JvDBRichEdit_OriginalSelectionChange( Sender: TObject);
begin
  try
    FUpdating := True;
    FirstInd.Left := Trunc(JvDBRichEdit_Original.Paragraph.FirstIndent*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((JvDBRichEdit_Original.Paragraph.RightIndent+GutterWid)*RulerAdj);
  finally
    FUpdating := False;
  end;

end;

procedure TForm_Fer_AjustarItemProva.Text1SelectionChange(Sender: TObject);
begin
  try
    FUpdating := True;
    FirstInd.Left := Trunc(JvDBRichEdit_Original.Paragraph.FirstIndent*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((JvDBRichEdit_Original.Paragraph.RightIndent+GutterWid)*RulerAdj);
  finally
    FUpdating := False;
  end;
end;

procedure TForm_Fer_AjustarItemProva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Fer_AjustarItemProva.ToolButton_CancelarClick(Sender: TObject);
begin
   Form_Sel_ItemProva.Query_Item.Next;
   Ajustar;
end;

end.
