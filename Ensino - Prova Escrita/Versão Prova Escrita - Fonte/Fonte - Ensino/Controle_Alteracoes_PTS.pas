//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Cad_PTS.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             do PTS.                                        //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 31/07/2008                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Controle_Alteracoes_PTS;

interface

uses
  DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvEnterTab, JvxCtrls, JvShape, JvCheckBox, JvLookOut, Forms, Controls,
  Classes, DB, Windows, Messages, SysUtils, Graphics, Dialogs, JvTransBtn;

Const
   Periodo_Manha= '08:00/08:45'+#13+'08:55/09:40'+#13+'09:50/10:35'+#13+'10:45/11:30';
   Periodo_Tarde= '13:00/13:45'+#13+'13:55/14:40'+#13+'14:50/15:35'+#13+'15:45/16:30';
type
  TForm_Controle_Alteracoes_PTS = class(TForm)
    DSQ_PTS_TMP: TDataSource;
    Panel27: TPanel;
    IBQuery_PtsTmp: TIBQuery;
    Panel_ListaDeCorrecoes: TPanel;
    Panel_Botoes: TPanel;
    JvGradient1: TJvGradient;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    DBGrid1: TDBGrid;
    ScrollBox_PTS: TScrollBox;
    Panel_QuaFeira: TPanel;
    Panel_4: TPanel;
    Label2: TLabel;
    Label_Data04: TLabel;
    Panel5: TPanel;
    Panel_2_4: TPanel;
    JvDBRichEdit_Hor_6: TJvDBRichEdit;
    JvDBRichEdit_Quarta_2: TJvDBRichEdit;
    JvDBRichEdit_Doc_6: TJvDBRichEdit;
    JvDBRichEdit_Loc_6: TJvDBRichEdit;
    Panel_1_4: TPanel;
    JvDBRichEdit_Hor_5: TJvDBRichEdit;
    JvDBRichEdit_Quarta_1: TJvDBRichEdit;
    JvDBRichEdit_Doc_5: TJvDBRichEdit;
    JvDBRichEdit_Loc_5: TJvDBRichEdit;
    Panel_SexFeira: TPanel;
    Panel_6: TPanel;
    Label3: TLabel;
    Label_Data06: TLabel;
    Panel14: TPanel;
    Panel_2_6: TPanel;
    JvDBRichEdit_Hor_10: TJvDBRichEdit;
    JvDBRichEdit_Sexta_2: TJvDBRichEdit;
    JvDBRichEdit_Doc_10: TJvDBRichEdit;
    JvDBRichEdit_Loc_10: TJvDBRichEdit;
    Panel_1_6: TPanel;
    JvDBRichEdit_Hor_9: TJvDBRichEdit;
    JvDBRichEdit_Sexta_1: TJvDBRichEdit;
    JvDBRichEdit_Doc_9: TJvDBRichEdit;
    JvDBRichEdit_Loc_9: TJvDBRichEdit;
    Panel_QuiFeira: TPanel;
    Panel_5: TPanel;
    Label4: TLabel;
    Label_Data05: TLabel;
    Panel19: TPanel;
    Panel_2_5: TPanel;
    JvDBRichEdit_Hor_8: TJvDBRichEdit;
    JvDBRichEdit_Quinta_2: TJvDBRichEdit;
    JvDBRichEdit_Doc_8: TJvDBRichEdit;
    JvDBRichEdit_Loc_8: TJvDBRichEdit;
    Panel_1_5: TPanel;
    JvDBRichEdit_Hor_7: TJvDBRichEdit;
    JvDBRichEdit_Quinta_1: TJvDBRichEdit;
    JvDBRichEdit_Doc_7: TJvDBRichEdit;
    JvDBRichEdit_Loc_7: TJvDBRichEdit;
    Panel_TerFeira: TPanel;
    Panel24: TPanel;
    Panel_2_3: TPanel;
    JvDBRichEdit_Hor_4: TJvDBRichEdit;
    JvDBRichEdit_Terca_2: TJvDBRichEdit;
    JvDBRichEdit_Doc_4: TJvDBRichEdit;
    JvDBRichEdit_Loc_4: TJvDBRichEdit;
    Panel_1_3: TPanel;
    JvDBRichEdit_Hor_3: TJvDBRichEdit;
    JvDBRichEdit_Terca_1: TJvDBRichEdit;
    JvDBRichEdit_Doc_3: TJvDBRichEdit;
    JvDBRichEdit_Loc_3: TJvDBRichEdit;
    Panel_3: TPanel;
    Label_Segunda: TLabel;
    Label_Data03: TLabel;
    Panel_SegFeira: TPanel;
    Panel_22: TPanel;
    Panel_2_2: TPanel;
    JvDBRichEdit_Hor_2: TJvDBRichEdit;
    JvDBRichEdit_Segunda_2: TJvDBRichEdit;
    JvDBRichEdit_Doc_2: TJvDBRichEdit;
    JvDBRichEdit_Loc_2: TJvDBRichEdit;
    Panel_1_2: TPanel;
    JvDBRichEdit_Loc_1: TJvDBRichEdit;
    JvDBRichEdit_Doc_1: TJvDBRichEdit;
    JvDBRichEdit_Segunda_1: TJvDBRichEdit;
    JvDBRichEdit_Hor_1: TJvDBRichEdit;
    Panel_2: TPanel;
    Label1: TLabel;
    Label_Data02: TLabel;
    Panel2: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    JvDBRichEdit_Msg: TJvDBRichEdit;
    Panel_Semana: TPanel;
    JvShape1: TJvShape;
    Label6: TLabel;
    IBQuery_PtsTmpIDCURSO: TSmallintField;
    IBQuery_PtsTmpIDTURMA: TIntegerField;
    IBQuery_PtsTmpSEMANA: TSmallintField;
    IBQuery_PtsTmpIDCODIGO: TIBStringField;
    IBQuery_PtsTmpDATA_ALTERACAO: TDateTimeField;
    IBQuery_PtsTmpHORA_ALTERACAO: TIBStringField;
    IBQuery_PtsTmpMSG: TIBStringField;
    IBQuery_PtsTmpDATA_02: TIBStringField;
    IBQuery_PtsTmpDIA_SEMANA_02: TIBStringField;
    IBQuery_PtsTmpHORARIO_01_02: TIBStringField;
    IBQuery_PtsTmpHORARIO_02_02: TIBStringField;
    IBQuery_PtsTmpTRAB_ESCOLAR_01_02: TIBStringField;
    IBQuery_PtsTmpTRAB_ESCOLAR_02_02: TIBStringField;
    IBQuery_PtsTmpEQUIPE_01_02: TIBStringField;
    IBQuery_PtsTmpEQUIPE_02_02: TIBStringField;
    IBQuery_PtsTmpLOCAL_01_02: TIBStringField;
    IBQuery_PtsTmpLOCAL_02_02: TIBStringField;
    IBQuery_PtsTmpDATA_03: TIBStringField;
    IBQuery_PtsTmpDIA_SEMANA_03: TIBStringField;
    IBQuery_PtsTmpHORARIO_01_03: TIBStringField;
    IBQuery_PtsTmpHORARIO_02_03: TIBStringField;
    IBQuery_PtsTmpTRAB_ESCOLAR_01_03: TIBStringField;
    IBQuery_PtsTmpTRAB_ESCOLAR_02_03: TIBStringField;
    IBQuery_PtsTmpEQUIPE_01_03: TIBStringField;
    IBQuery_PtsTmpEQUIPE_02_03: TIBStringField;
    IBQuery_PtsTmpLOCAL_01_03: TIBStringField;
    IBQuery_PtsTmpLOCAL_02_03: TIBStringField;
    IBQuery_PtsTmpDATA_04: TIBStringField;
    IBQuery_PtsTmpDIA_SEMANA_04: TIBStringField;
    IBQuery_PtsTmpHORARIO_01_04: TIBStringField;
    IBQuery_PtsTmpHORARIO_02_04: TIBStringField;
    IBQuery_PtsTmpTRAB_ESCOLAR_01_04: TIBStringField;
    IBQuery_PtsTmpTRAB_ESCOLAR_02_04: TIBStringField;
    IBQuery_PtsTmpEQUIPE_01_04: TIBStringField;
    IBQuery_PtsTmpEQUIPE_02_04: TIBStringField;
    IBQuery_PtsTmpLOCAL_01_04: TIBStringField;
    IBQuery_PtsTmpLOCAL_02_04: TIBStringField;
    IBQuery_PtsTmpDATA_05: TIBStringField;
    IBQuery_PtsTmpDIA_SEMANA_05: TIBStringField;
    IBQuery_PtsTmpHORARIO_01_05: TIBStringField;
    IBQuery_PtsTmpHORARIO_02_05: TIBStringField;
    IBQuery_PtsTmpTRAB_ESCOLAR_01_05: TIBStringField;
    IBQuery_PtsTmpTRAB_ESCOLAR_02_05: TIBStringField;
    IBQuery_PtsTmpEQUIPE_01_05: TIBStringField;
    IBQuery_PtsTmpEQUIPE_02_05: TIBStringField;
    IBQuery_PtsTmpLOCAL_01_05: TIBStringField;
    IBQuery_PtsTmpLOCAL_02_05: TIBStringField;
    IBQuery_PtsTmpDATA_06: TIBStringField;
    IBQuery_PtsTmpDIA_SEMANA_06: TIBStringField;
    IBQuery_PtsTmpHORARIO_01_06: TIBStringField;
    IBQuery_PtsTmpHORARIO_02_06: TIBStringField;
    IBQuery_PtsTmpTRAB_ESCOLAR_01_06: TIBStringField;
    IBQuery_PtsTmpTRAB_ESCOLAR_02_06: TIBStringField;
    IBQuery_PtsTmpEQUIPE_01_06: TIBStringField;
    IBQuery_PtsTmpEQUIPE_02_06: TIBStringField;
    IBQuery_PtsTmpLOCAL_01_06: TIBStringField;
    IBQuery_PtsTmpLOCAL_02_06: TIBStringField;
    IBQuery_PtsTmpNOME: TIBStringField;
    DBText_Semana: TDBText;
    IBTable_PTS: TIBTable;
    IBTable_PTSIDCURSO: TSmallintField;
    IBTable_PTSIDTURMA: TIntegerField;
    IBTable_PTSSEMANA: TSmallintField;
    IBTable_PTSDATA_02: TIBStringField;
    IBTable_PTSDIA_SEMANA_02: TIBStringField;
    IBTable_PTSHORARIO_01_02: TIBStringField;
    IBTable_PTSHORARIO_02_02: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_01_02: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_02_02: TIBStringField;
    IBTable_PTSEQUIPE_01_02: TIBStringField;
    IBTable_PTSEQUIPE_02_02: TIBStringField;
    IBTable_PTSLOCAL_01_02: TIBStringField;
    IBTable_PTSLOCAL_02_02: TIBStringField;
    IBTable_PTSDATA_03: TIBStringField;
    IBTable_PTSDIA_SEMANA_03: TIBStringField;
    IBTable_PTSHORARIO_01_03: TIBStringField;
    IBTable_PTSHORARIO_02_03: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_01_03: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_02_03: TIBStringField;
    IBTable_PTSEQUIPE_01_03: TIBStringField;
    IBTable_PTSEQUIPE_02_03: TIBStringField;
    IBTable_PTSLOCAL_01_03: TIBStringField;
    IBTable_PTSLOCAL_02_03: TIBStringField;
    IBTable_PTSDATA_04: TIBStringField;
    IBTable_PTSDIA_SEMANA_04: TIBStringField;
    IBTable_PTSHORARIO_01_04: TIBStringField;
    IBTable_PTSHORARIO_02_04: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_01_04: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_02_04: TIBStringField;
    IBTable_PTSEQUIPE_01_04: TIBStringField;
    IBTable_PTSEQUIPE_02_04: TIBStringField;
    IBTable_PTSLOCAL_01_04: TIBStringField;
    IBTable_PTSLOCAL_02_04: TIBStringField;
    IBTable_PTSDATA_05: TIBStringField;
    IBTable_PTSDIA_SEMANA_05: TIBStringField;
    IBTable_PTSHORARIO_01_05: TIBStringField;
    IBTable_PTSHORARIO_02_05: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_01_05: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_02_05: TIBStringField;
    IBTable_PTSEQUIPE_01_05: TIBStringField;
    IBTable_PTSEQUIPE_02_05: TIBStringField;
    IBTable_PTSLOCAL_01_05: TIBStringField;
    IBTable_PTSLOCAL_02_05: TIBStringField;
    IBTable_PTSDATA_06: TIBStringField;
    IBTable_PTSDIA_SEMANA_06: TIBStringField;
    IBTable_PTSHORARIO_01_06: TIBStringField;
    IBTable_PTSHORARIO_02_06: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_01_06: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_02_06: TIBStringField;
    IBTable_PTSEQUIPE_01_06: TIBStringField;
    IBTable_PTSEQUIPE_02_06: TIBStringField;
    IBTable_PTSLOCAL_01_06: TIBStringField;
    IBTable_PTSLOCAL_02_06: TIBStringField;
    IBTable_PTSMSG: TIBStringField;
    DST_PTS: TDataSource;
    JvShape2: TJvShape;
    JvTransparentButton_Restaurar: TJvTransparentButton;

    procedure AbrePtsTMP;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_RestaurarClick(Sender: TObject);
  private    { Private declarations }

  public    { Public declarations }
  end;

var
  Form_Controle_Alteracoes_PTS: TForm_Controle_Alteracoes_PTS;

implementation

uses Module, Cad_PTS;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_Controle_Alteracoes_PTS.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm( Form_Controle_Alteracoes_PTS, 'Consulta Alterações no PTS');

   AbrePtsTMP;;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Controle_Alteracoes_PTS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    IBQuery_PtsTmp.Close;
    Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Retornar
//------------------------------------------------------------------------------

procedure TForm_Controle_Alteracoes_PTS.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da semana
//------------------------------------------------------------------------------

procedure TForm_Controle_Alteracoes_PTS.AbrePtsTMP;
var
   Ano, Mes, Dia : word;
begin
   Funcoes.ExecutaQuery(IBQuery_PtsTmp, 'Select p.IDCURSO, p.IDTURMA, p.SEMANA, p.IDCODIGO, p.DATA_ALTERACAO, p.HORA_ALTERACAO, p.MSG, p.DATA_02, p.DIA_SEMANA_02, p.HORARIO_01_02, p.HORARIO_02_02, '+
                                        '       p.TRAB_ESCOLAR_01_02, p.TRAB_ESCOLAR_02_02, p.EQUIPE_01_02, p.EQUIPE_02_02, p.LOCAL_01_02, p.LOCAL_02_02, p.DATA_03, p.DIA_SEMANA_03, '+
                                        '       p.HORARIO_01_03, p.HORARIO_02_03, p.TRAB_ESCOLAR_01_03, p.TRAB_ESCOLAR_02_03, p.EQUIPE_01_03, p.EQUIPE_02_03, p.LOCAL_01_03, p.LOCAL_02_03, '+
                                        '       p.DATA_04, p.DIA_SEMANA_04, p.HORARIO_01_04, p.HORARIO_02_04, p.TRAB_ESCOLAR_01_04, p.TRAB_ESCOLAR_02_04, p.EQUIPE_01_04, p.EQUIPE_02_04, '+
                                        '       p.LOCAL_01_04, p.LOCAL_02_04, p.DATA_05, p.DIA_SEMANA_05, p.HORARIO_01_05, p.HORARIO_02_05, p.TRAB_ESCOLAR_01_05, p.TRAB_ESCOLAR_02_05, '+
                                        '       p.EQUIPE_01_05, p.EQUIPE_02_05, p.LOCAL_01_05, p.LOCAL_02_05, p.DATA_06, p.DIA_SEMANA_06, p.HORARIO_01_06, p.HORARIO_02_06, '+
                                        '       p.TRAB_ESCOLAR_01_06, p.TRAB_ESCOLAR_02_06, p.EQUIPE_01_06, p.EQUIPE_02_06, p.LOCAL_01_06, p.LOCAL_02_06, u.nome '+
                                        ' From PTS_TMP p, usuario u '+
                                        ' Where p.IdCodigo = u.IdCodigo '+
                                        ' and   p.IdCurso = :IdCurso '+
                                        ' and   p.IdTurma = :IdTurma '+
                                        ' and   p.Semana = :Semana '+
                                        ' order by p.DATA_ALTERACAO  desc , p.HORA_ALTERACAO desc '
                       );

   Label_Data02.Caption:= DateToStr(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime+((IBQuery_PtsTmp.FieldByName('Semana').AsInteger -1)*7));
   DecodeDate (StrToDate(Label_Data02.Caption)+1, Ano, Mes, Dia);
   Label_Data03.Caption:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes)+'/'+FormatFloat('0000',Ano);

   DecodeDate (StrToDate(Label_Data02.Caption)+2, Ano, Mes, Dia);
   Label_Data04.Caption:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes)+'/'+FormatFloat('0000',Ano);

   DecodeDate (StrToDate(Label_Data02.Caption)+3, Ano, Mes, Dia);
   Label_Data05.Caption:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes)+'/'+FormatFloat('0000',Ano);

   DecodeDate (StrToDate(Label_Data02.Caption)+4, Ano, Mes, Dia);
   Label_Data06.Caption:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes)+'/'+FormatFloat('0000',Ano);

   IBTable_PTS.Open;
end;

//------------------------------------------------------------------------------
// Tratamento para retornar a turma selecionada para a turma atual
//------------------------------------------------------------------------------

procedure TForm_Controle_Alteracoes_PTS.JvTransparentButton_RestaurarClick(Sender: TObject);
var
   VI_Retorno: Integer;
begin
   VI_Retorno:= Application.MessageBox('Deseja realmente transformar esta versão do PTS como atual ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      IBTable_PTS.Edit;

      IBTable_PTS.FieldByName('IDCURSO').AsString:= IBQuery_PtsTmp.FieldByName('IDCURSO').AsString;
      IBTable_PTS.FieldByName('IDTURMA').AsString:= IBQuery_PtsTmp.FieldByName('IDTURMA').AsString;
      IBTable_PTS.FieldByName('SEMANA').AsString:= IBQuery_PtsTmp.FieldByName('SEMANA').AsString;
      IBTable_PTS.FieldByName('MSG').AsString:= IBQuery_PtsTmp.FieldByName('MSG').AsString;
      IBTable_PTS.FieldByName('DATA_02').AsString:= IBQuery_PtsTmp.FieldByName('DATA_02').AsString;
      IBTable_PTS.FieldByName('DIA_SEMANA_02').AsString:= IBQuery_PtsTmp.FieldByName('DIA_SEMANA_02').AsString;
      IBTable_PTS.FieldByName('HORARIO_01_02').AsString:= IBQuery_PtsTmp.FieldByName('HORARIO_01_02').AsString;
      IBTable_PTS.FieldByName('HORARIO_02_02').AsString:= IBQuery_PtsTmp.FieldByName('HORARIO_02_02').AsString;
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_02').AsString:= IBQuery_PtsTmp.FieldByName('TRAB_ESCOLAR_01_02').AsString;
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_02').AsString:= IBQuery_PtsTmp.FieldByName('TRAB_ESCOLAR_02_02').AsString;
      IBTable_PTS.FieldByName('EQUIPE_01_02').AsString:= IBQuery_PtsTmp.FieldByName('EQUIPE_01_02').AsString;
      IBTable_PTS.FieldByName('EQUIPE_02_02').AsString:= IBQuery_PtsTmp.FieldByName('EQUIPE_02_02').AsString;
      IBTable_PTS.FieldByName('LOCAL_01_02').AsString:= IBQuery_PtsTmp.FieldByName('LOCAL_01_02').AsString;
      IBTable_PTS.FieldByName('LOCAL_02_02').AsString:= IBQuery_PtsTmp.FieldByName('LOCAL_02_02').AsString;
      IBTable_PTS.FieldByName('DATA_03').AsString:= IBQuery_PtsTmp.FieldByName('DATA_03').AsString;
      IBTable_PTS.FieldByName('DIA_SEMANA_03').AsString:= IBQuery_PtsTmp.FieldByName('DIA_SEMANA_03').AsString;
      IBTable_PTS.FieldByName('HORARIO_01_03').AsString:= IBQuery_PtsTmp.FieldByName('HORARIO_01_03').AsString;
      IBTable_PTS.FieldByName('HORARIO_02_03').AsString:= IBQuery_PtsTmp.FieldByName('HORARIO_02_03').AsString;
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_03').AsString:= IBQuery_PtsTmp.FieldByName('TRAB_ESCOLAR_01_03').AsString;
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_03').AsString:= IBQuery_PtsTmp.FieldByName('TRAB_ESCOLAR_02_03').AsString;
      IBTable_PTS.FieldByName('EQUIPE_01_03').AsString:= IBQuery_PtsTmp.FieldByName('EQUIPE_01_03').AsString;
      IBTable_PTS.FieldByName('EQUIPE_02_03').AsString:= IBQuery_PtsTmp.FieldByName('EQUIPE_02_03').AsString;
      IBTable_PTS.FieldByName('LOCAL_01_03').AsString:= IBQuery_PtsTmp.FieldByName('LOCAL_01_03').AsString;
      IBTable_PTS.FieldByName('LOCAL_02_03').AsString:= IBQuery_PtsTmp.FieldByName('LOCAL_02_03').AsString;
      IBTable_PTS.FieldByName('DATA_04').AsString:= IBQuery_PtsTmp.FieldByName('DATA_04').AsString;
      IBTable_PTS.FieldByName('DIA_SEMANA_04').AsString:= IBQuery_PtsTmp.FieldByName('DIA_SEMANA_04').AsString;
      IBTable_PTS.FieldByName('HORARIO_01_04').AsString:= IBQuery_PtsTmp.FieldByName('HORARIO_01_04').AsString;
      IBTable_PTS.FieldByName('HORARIO_02_04').AsString:= IBQuery_PtsTmp.FieldByName('HORARIO_02_04').AsString;
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_04').AsString:= IBQuery_PtsTmp.FieldByName('TRAB_ESCOLAR_01_04').AsString;
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_04').AsString:= IBQuery_PtsTmp.FieldByName('TRAB_ESCOLAR_02_04').AsString;
      IBTable_PTS.FieldByName('EQUIPE_01_04').AsString:= IBQuery_PtsTmp.FieldByName('EQUIPE_01_04').AsString;
      IBTable_PTS.FieldByName('EQUIPE_02_04').AsString:= IBQuery_PtsTmp.FieldByName('EQUIPE_02_04').AsString;
      IBTable_PTS.FieldByName('LOCAL_01_04').AsString:= IBQuery_PtsTmp.FieldByName('LOCAL_01_04').AsString;
      IBTable_PTS.FieldByName('LOCAL_02_04').AsString:= IBQuery_PtsTmp.FieldByName('LOCAL_02_04').AsString;
      IBTable_PTS.FieldByName('DATA_05').AsString:= IBQuery_PtsTmp.FieldByName('DATA_05').AsString;
      IBTable_PTS.FieldByName('DIA_SEMANA_05').AsString:= IBQuery_PtsTmp.FieldByName('DIA_SEMANA_05').AsString;
      IBTable_PTS.FieldByName('HORARIO_01_05').AsString:= IBQuery_PtsTmp.FieldByName('HORARIO_01_05').AsString;
      IBTable_PTS.FieldByName('HORARIO_02_05').AsString:= IBQuery_PtsTmp.FieldByName('HORARIO_02_05').AsString;
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_05').AsString:= IBQuery_PtsTmp.FieldByName('TRAB_ESCOLAR_01_05').AsString;
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_05').AsString:= IBQuery_PtsTmp.FieldByName('TRAB_ESCOLAR_02_05').AsString;
      IBTable_PTS.FieldByName('EQUIPE_01_05').AsString:= IBQuery_PtsTmp.FieldByName('EQUIPE_01_05').AsString;
      IBTable_PTS.FieldByName('EQUIPE_02_05').AsString:= IBQuery_PtsTmp.FieldByName('EQUIPE_02_05').AsString;
      IBTable_PTS.FieldByName('LOCAL_01_05').AsString:= IBQuery_PtsTmp.FieldByName('LOCAL_01_05').AsString;
      IBTable_PTS.FieldByName('LOCAL_02_05').AsString:= IBQuery_PtsTmp.FieldByName('LOCAL_02_05').AsString;
      IBTable_PTS.FieldByName('DATA_06').AsString:= IBQuery_PtsTmp.FieldByName('DATA_06').AsString;
      IBTable_PTS.FieldByName('DIA_SEMANA_06').AsString:= IBQuery_PtsTmp.FieldByName('DIA_SEMANA_06').AsString;
      IBTable_PTS.FieldByName('HORARIO_01_06').AsString:= IBQuery_PtsTmp.FieldByName('HORARIO_01_06').AsString;
      IBTable_PTS.FieldByName('HORARIO_02_06').AsString:= IBQuery_PtsTmp.FieldByName('HORARIO_02_06').AsString;
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_06').AsString:= IBQuery_PtsTmp.FieldByName('TRAB_ESCOLAR_01_06').AsString;
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_06').AsString:= IBQuery_PtsTmp.FieldByName('TRAB_ESCOLAR_02_06').AsString;
      IBTable_PTS.FieldByName('EQUIPE_01_06').AsString:= IBQuery_PtsTmp.FieldByName('EQUIPE_01_06').AsString;
      IBTable_PTS.FieldByName('EQUIPE_02_06').AsString:= IBQuery_PtsTmp.FieldByName('EQUIPE_02_06').AsString;
      IBTable_PTS.FieldByName('LOCAL_01_06').AsString:= IBQuery_PtsTmp.FieldByName('LOCAL_01_06').AsString;
      IBTable_PTS.FieldByName('LOCAL_02_06').AsString:= IBQuery_PtsTmp.FieldByName('LOCAL_02_06').AsString;
      IBTable_PTS.Post;

      Funcoes.ExecutaTransacao;
      Close;
   end;
end;

end.

