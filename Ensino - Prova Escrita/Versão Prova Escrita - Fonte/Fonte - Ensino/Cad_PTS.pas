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

unit Cad_PTS;

interface

uses
  DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvEnterTab, JvxCtrls, JvShape, JvCheckBox, JvLookOut, Forms, Controls,
  Classes, DB, Windows, Messages, SysUtils, Graphics, Dialogs, ExportPack,
  JvTransBtn;

Const
   Periodo_Manha= '08:00/08:45'+#13+'08:55/09:40'+#13+'09:50/10:35'+#13+'10:45/11:30';
   Periodo_Tarde= '13:00/13:45'+#13+'13:55/14:40'+#13+'14:50/15:35'+#13+'15:45/16:30';
type
  TForm_Cad_PTS = class(TForm)
    DST_PTS: TDataSource;
    IBTable_PTS: TIBTable;
    IBTable_PTSImportar: TIBTable;
    IBTable_PTSImportarIDCURSO: TSmallintField;
    IBTable_PTSImportarIDTURMA: TIntegerField;
    IBTable_PTSImportarSEMANA: TSmallintField;
    IBTable_PTSImportarMSG: TIBStringField;
    IBTable_PTSImportarDATA_02: TIBStringField;
    IBTable_PTSImportarDIA_SEMANA_02: TIBStringField;
    IBTable_PTSImportarHORARIO_01_02: TIBStringField;
    IBTable_PTSImportarHORARIO_02_02: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_01_02: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_02_02: TIBStringField;
    IBTable_PTSImportarEQUIPE_01_02: TIBStringField;
    IBTable_PTSImportarEQUIPE_02_02: TIBStringField;
    IBTable_PTSImportarLOCAL_01_02: TIBStringField;
    IBTable_PTSImportarLOCAL_02_02: TIBStringField;
    IBTable_PTSImportarDATA_03: TIBStringField;
    IBTable_PTSImportarDIA_SEMANA_03: TIBStringField;
    IBTable_PTSImportarHORARIO_01_03: TIBStringField;
    IBTable_PTSImportarHORARIO_02_03: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_01_03: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_02_03: TIBStringField;
    IBTable_PTSImportarEQUIPE_01_03: TIBStringField;
    IBTable_PTSImportarEQUIPE_02_03: TIBStringField;
    IBTable_PTSImportarLOCAL_01_03: TIBStringField;
    IBTable_PTSImportarLOCAL_02_03: TIBStringField;
    IBTable_PTSImportarDATA_04: TIBStringField;
    IBTable_PTSImportarDIA_SEMANA_04: TIBStringField;
    IBTable_PTSImportarHORARIO_01_04: TIBStringField;
    IBTable_PTSImportarHORARIO_02_04: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_01_04: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_02_04: TIBStringField;
    IBTable_PTSImportarEQUIPE_01_04: TIBStringField;
    IBTable_PTSImportarEQUIPE_02_04: TIBStringField;
    IBTable_PTSImportarLOCAL_01_04: TIBStringField;
    IBTable_PTSImportarLOCAL_02_04: TIBStringField;
    IBTable_PTSImportarDATA_05: TIBStringField;
    IBTable_PTSImportarDIA_SEMANA_05: TIBStringField;
    IBTable_PTSImportarHORARIO_01_05: TIBStringField;
    IBTable_PTSImportarHORARIO_02_05: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_01_05: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_02_05: TIBStringField;
    IBTable_PTSImportarEQUIPE_01_05: TIBStringField;
    IBTable_PTSImportarEQUIPE_02_05: TIBStringField;
    IBTable_PTSImportarLOCAL_01_05: TIBStringField;
    IBTable_PTSImportarLOCAL_02_05: TIBStringField;
    IBTable_PTSImportarDATA_06: TIBStringField;
    IBTable_PTSImportarDIA_SEMANA_06: TIBStringField;
    IBTable_PTSImportarHORARIO_01_06: TIBStringField;
    IBTable_PTSImportarHORARIO_02_06: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_01_06: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_02_06: TIBStringField;
    IBTable_PTSImportarEQUIPE_01_06: TIBStringField;
    IBTable_PTSImportarEQUIPE_02_06: TIBStringField;
    IBTable_PTSImportarLOCAL_01_06: TIBStringField;
    IBTable_PTSImportarLOCAL_02_06: TIBStringField;
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
    PopupMenu_PDF: TPopupMenu;
    PDF_Selecionado: TMenuItem;
    PDF_Todos: TMenuItem;
    PopupMenu_Imprimir: TPopupMenu;
    Imprimir_Selecionado: TMenuItem;
    Imprimir_Todos: TMenuItem;
    N1: TMenuItem;
    IBTable_PTS_Tmp: TIBTable;
    IBTable_PTS_TmpIDCURSO: TSmallintField;
    IBTable_PTS_TmpIDTURMA: TIntegerField;
    IBTable_PTS_TmpSEMANA: TSmallintField;
    IBTable_PTS_TmpIDCODIGO: TIBStringField;
    IBTable_PTS_TmpDATA_ALTERACAO: TDateTimeField;
    IBTable_PTS_TmpHORA_ALTERACAO: TIBStringField;
    IBTable_PTS_TmpMSG: TIBStringField;
    IBTable_PTS_TmpDATA_02: TIBStringField;
    IBTable_PTS_TmpDIA_SEMANA_02: TIBStringField;
    IBTable_PTS_TmpHORARIO_01_02: TIBStringField;
    IBTable_PTS_TmpHORARIO_02_02: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_01_02: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_02_02: TIBStringField;
    IBTable_PTS_TmpEQUIPE_01_02: TIBStringField;
    IBTable_PTS_TmpEQUIPE_02_02: TIBStringField;
    IBTable_PTS_TmpLOCAL_01_02: TIBStringField;
    IBTable_PTS_TmpLOCAL_02_02: TIBStringField;
    IBTable_PTS_TmpDATA_03: TIBStringField;
    IBTable_PTS_TmpDIA_SEMANA_03: TIBStringField;
    IBTable_PTS_TmpHORARIO_01_03: TIBStringField;
    IBTable_PTS_TmpHORARIO_02_03: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_01_03: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_02_03: TIBStringField;
    IBTable_PTS_TmpEQUIPE_01_03: TIBStringField;
    IBTable_PTS_TmpEQUIPE_02_03: TIBStringField;
    IBTable_PTS_TmpLOCAL_01_03: TIBStringField;
    IBTable_PTS_TmpLOCAL_02_03: TIBStringField;
    IBTable_PTS_TmpDATA_04: TIBStringField;
    IBTable_PTS_TmpDIA_SEMANA_04: TIBStringField;
    IBTable_PTS_TmpHORARIO_01_04: TIBStringField;
    IBTable_PTS_TmpHORARIO_02_04: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_01_04: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_02_04: TIBStringField;
    IBTable_PTS_TmpEQUIPE_01_04: TIBStringField;
    IBTable_PTS_TmpEQUIPE_02_04: TIBStringField;
    IBTable_PTS_TmpLOCAL_01_04: TIBStringField;
    IBTable_PTS_TmpLOCAL_02_04: TIBStringField;
    IBTable_PTS_TmpDATA_05: TIBStringField;
    IBTable_PTS_TmpDIA_SEMANA_05: TIBStringField;
    IBTable_PTS_TmpHORARIO_01_05: TIBStringField;
    IBTable_PTS_TmpHORARIO_02_05: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_01_05: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_02_05: TIBStringField;
    IBTable_PTS_TmpEQUIPE_01_05: TIBStringField;
    IBTable_PTS_TmpEQUIPE_02_05: TIBStringField;
    IBTable_PTS_TmpLOCAL_01_05: TIBStringField;
    IBTable_PTS_TmpLOCAL_02_05: TIBStringField;
    IBTable_PTS_TmpDATA_06: TIBStringField;
    IBTable_PTS_TmpDIA_SEMANA_06: TIBStringField;
    IBTable_PTS_TmpHORARIO_01_06: TIBStringField;
    IBTable_PTS_TmpHORARIO_02_06: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_01_06: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_02_06: TIBStringField;
    IBTable_PTS_TmpEQUIPE_01_06: TIBStringField;
    IBTable_PTS_TmpEQUIPE_02_06: TIBStringField;
    IBTable_PTS_TmpLOCAL_01_06: TIBStringField;
    IBTable_PTS_TmpLOCAL_02_06: TIBStringField;
    ExportQR1: TExportQR;
    PageControl_PTS: TPageControl;
    TabSheet_PTS: TTabSheet;
    Panel_Botoes: TPanel;
    Panel_Principal: TPanel;
    Panel1: TPanel;
    Panel_Cabecalho: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    ComboBox_Instrutor: TComboBox;
    ComboBox_disciplinas: TComboBox;
    ComboBox_SalaAula: TComboBox;
    Panel_SelecaoCurso: TPanel;
    Panel2: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    ScrollBox_PTS: TScrollBox;
    Panel_QuaFeira: TPanel;
    Panel_4: TPanel;
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
    PanelMsg: TPanel;
    JvDBRichEdit_Msg: TJvDBRichEdit;
    ComboBox_Equipe: TComboBox;
    TabSheet_PTS_EAD: TTabSheet;
    Panel_Botoes_EAD: TPanel;
    JvGradient5: TJvGradient;
    JvShape8: TJvShape;
    JvTransparentButton_Retornar_EAD: TJvTransparentButton;
    JvShape12: TJvShape;
    JvTransparentButton_Windows_EAD: TJvTransparentButton;
    JvShape13: TJvShape;
    JvTransparentButton_Imprime_EAD: TJvTransparentButton;
    JvShape14: TJvShape;
    JvTransparentButton_Alterar_EAD: TJvTransparentButton;
    JvShape15: TJvShape;
    JvTransparentButton_Grava_EAD: TJvTransparentButton;
    JvShape16: TJvShape;
    JvTransparentButton_Cancelar_EAD: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir_EAD: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_Excluir_EAD: TJvTransparentButton;
    Panel16: TPanel;
    Panel21: TPanel;
    JvDBRichEdit_Msg_EAD: TJvDBRichEdit;
    ComboBox_Equipe_EAD: TComboBox;
    Panel_Cadastro: TPanel;
    JvGradient6: TJvGradient;
    DBComboBox_Semana_EAD: TDBComboBox;
    DBComboBox_Modulo: TDBComboBox;
    DBEdit_Periodo: TDBEdit;
    DBComboBox_Disciplina: TDBComboBox;
    DBComboBox_Tutor: TDBComboBox;
    DBComboBox_Carga: TDBComboBox;
    DBEdit_CodPud: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid_PTS_EAD: TDBGrid;
    IBQuery_PTS_EAD: TIBQuery;
    IBQuery_PTS_EADIDCURSO: TSmallintField;
    IBQuery_PTS_EADIDTURMA: TIntegerField;
    IBQuery_PTS_EADSEMANA: TIBStringField;
    IBQuery_PTS_EADMODULO: TIBStringField;
    IBQuery_PTS_EADDISCIPLINA: TIBStringField;
    IBQuery_PTS_EADPERIODO: TIBStringField;
    IBQuery_PTS_EADTUTOR: TIBStringField;
    IBQuery_PTS_EADMSG: TIBStringField;
    IBQuery_PTS_EADCARGAHORARIA: TIBStringField;
    IBQuery_PTS_EADCODPUD: TIBStringField;
    IBQuery_PTS_EADLOCAL: TIBStringField;
    DSQ_PTS_EAD: TDataSource;
    DST_PTS_EAD: TDataSource;
    IBTable_PTS_EAD: TIBTable;
    IBTable_PTS_EADIDCURSO: TSmallintField;
    IBTable_PTS_EADIDTURMA: TIntegerField;
    IBTable_PTS_EADSEMANA: TIBStringField;
    IBTable_PTS_EADMODULO: TIBStringField;
    IBTable_PTS_EADDISCIPLINA: TIBStringField;
    IBTable_PTS_EADPERIODO: TIBStringField;
    IBTable_PTS_EADTUTOR: TIBStringField;
    IBTable_PTS_EADMSG: TIBStringField;
    IBTable_PTS_EADCARGAHORARIA: TIBStringField;
    IBTable_PTS_EADCODPUD: TIBStringField;
    IBTable_PTS_EADLOCAL: TIBStringField;
    JvShape1: TJvShape;
    JvTransparentButton_PDF_EAD: TJvTransparentButton;
    Shape_Semana_02: TShape;
    Label1: TLabel;
    JvDateEdit_Segunda: TJvDateEdit;
    Shape_Semana_03: TShape;
    Shape_Semana_04: TShape;
    Shape_Semana_05: TShape;
    Shape_Semana_06: TShape;
    Label3: TLabel;
    Label_Data06: TLabel;
    Label4: TLabel;
    Label_Data05: TLabel;
    Label2: TLabel;
    Label_Data04: TLabel;
    Label_Segunda: TLabel;
    Label_Data03: TLabel;
    IBTable_PTSMSG: TIBStringField;
    JvCaptionPanel_ImporatPTS: TJvCaptionPanel;
    Label8: TLabel;
    JvExpressButton_GravarExportarPara: TJvExpressButton;
    JvExpressButton3: TJvExpressButton;
    Label11: TLabel;
    DBRichEdit_Editor_Demo_00: TJvDBRichEdit;
    ComboBox_Importar: TComboBox;
    Edit_TurmaOrigem: TEdit;
    JvShape9: TJvShape;
    JvTransparentButton_Alteracao: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvShape11: TJvShape;
    JvTransparentButton_ImprimirPDF: TJvTransparentButton;
    JvShape_Revisar_Item: TJvShape;
    JvTransparentButton_NovoPts: TJvTransparentButton;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    Panel_GerenciaPTS: TPanel;
    JvGradient4: TJvGradient;
    Shape1: TShape;
    JvExpressButton_ExportarPTS: TJvExpressButton;
    Shape2: TShape;
    JvExpressButton_PTSBase: TJvExpressButton;
    JvShape2: TJvShape;
    Label9: TLabel;
    Label10: TLabel;
    Label1_SemanaImportar: TLabel;
    ComboBox_SemanaImportar: TComboBox;
    JvShape_Semana: TJvShape;
    Label_Semana: TLabel;
    Label_Semana_Barra: TLabel;
    Label_Semanas: TLabel;
    Panel_Frame_SelCurso: TPanel;
    Panel_TipoTurma: TPanel;
    JvShape_TipoTurma: TJvShape;
    ComboBox_TipoTurma: TComboBox;
    ComboBox_Semana: TComboBox;
    Panel11: TPanel;
    JvxLabel_Semana: TJvxLabel;
    JvShapeLimpa_Descricao: TJvShape;
    JvExpressButton_Limpa_Descricao: TJvExpressButton;
    JvShape_Limpa_Docente: TJvShape;
    JvExpressButton_Limpa_Docente: TJvExpressButton;
    JvShape_Limpa_Local: TJvShape;
    JvExpressButton_Limpa_Local: TJvExpressButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvCheckBox_Vizualizar: TJvCheckBox;
    IBQuery_PTS: TIBQuery;
    DSQ_PTS: TDataSource;
    IBQuery_PTSIDCURSO: TSmallintField;
    IBQuery_PTSIDTURMA: TIntegerField;
    IBQuery_PTSSEMANA: TSmallintField;

    procedure ZerarOpcao(Sender: TObject);
    procedure Gravar_Pts;
    Function  Tratar_Segunda(VD_Data: TDateTime): TDateTime;
    procedure Tratar_Msg_Feriado(Shape: TShape; PS_Msg: String; Cor: TColor);
    procedure Tratar_Semana(Status: Boolean);

    procedure Tratar_PTS_EAD;
    procedure TratarBotoes_EAD(Status: Boolean);

    procedure TratarSemanaNaoSelecionada;
    procedure Verifica_Feriado(PS_data: String; semana: Integer);

    procedure GravaPtsTmp;
    procedure TratarBotoes(Status: Boolean);
    procedure TrataSemanas;
    Procedure ListaInstrutores;
    Procedure ListaDisciplinas;
    Procedure ListaSalas;
    Procedure TratarCaixaDisciplinas(PI_Opcao, PI_Top: Integer);
    Procedure TratarCaixaInstrutor(PI_Opcao, PI_Top: Integer);
    Procedure TratarCaixaSala(PI_Opcao: Integer);
    Procedure TrataTurma(Turma: String);
    procedure Cadastra_PTS_Com_PTSBase;
    procedure Verifica_Existencia_de_PTS(PS_TipoCarga: String);

    procedure FormActivate(Sender: TObject);
    procedure JvDateEdit_SegundaChange(Sender: TObject);
    procedure JvDBRichEdit_Segunda_1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_disciplinasClick(Sender: TObject);
    procedure ComboBox_InstrutorClick(Sender: TObject);
    procedure JvDBRichEdit_MsgKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_EquipeClick(Sender: TObject);
    procedure ComboBox_EquipeKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_EquipeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvExpressButton_PTSBaseClick(Sender: TObject);
    procedure JvExpressButton_GravarExportarParaClick(Sender: TObject);
    procedure JvExpressButton3Click(Sender: TObject);
    procedure JvExpressButton_ExportarPTSClick(Sender: TObject);
    procedure PDF_SelecionadoClick(Sender: TObject);
    procedure PDF_TodosClick(Sender: TObject);
    procedure JvDBRichEdit_Segunda_1Click(Sender: TObject);
    procedure JvDBRichEdit_Segunda_2Click(Sender: TObject);
    procedure JvDBRichEdit_Terca_1Click(Sender: TObject);
    procedure JvDBRichEdit_Terca_2Click(Sender: TObject);
    procedure JvDBRichEdit_Quarta_1Click(Sender: TObject);
    procedure JvDBRichEdit_Quarta_2Click(Sender: TObject);
    procedure JvDBRichEdit_Quinta_1Click(Sender: TObject);
    procedure JvDBRichEdit_Quinta_2Click(Sender: TObject);
    procedure JvDBRichEdit_Sexta_1Click(Sender: TObject);
    procedure JvDBRichEdit_Sexta_2Click(Sender: TObject);
    procedure JvDBRichEdit_Doc_1Click(Sender: TObject);
    procedure JvDBRichEdit_Doc_2Click(Sender: TObject);
    procedure JvDBRichEdit_Doc_3Click(Sender: TObject);
    procedure JvDBRichEdit_Doc_4Click(Sender: TObject);
    procedure JvDBRichEdit_Doc_5Click(Sender: TObject);
    procedure JvDBRichEdit_Doc_6Click(Sender: TObject);
    procedure JvDBRichEdit_Doc_7Click(Sender: TObject);
    procedure JvDBRichEdit_Doc_8Click(Sender: TObject);
    procedure JvDBRichEdit_Doc_9Click(Sender: TObject);
    procedure JvDBRichEdit_Doc_10Click(Sender: TObject);
    procedure ComboBox_SalaAulaClick(Sender: TObject);
    procedure JvDBRichEdit_Loc_1Click(Sender: TObject);
    procedure JvDBRichEdit_Loc_2Click(Sender: TObject);
    procedure JvDBRichEdit_Loc_3Click(Sender: TObject);
    procedure JvDBRichEdit_Loc_4Click(Sender: TObject);
    procedure JvDBRichEdit_Loc_5Click(Sender: TObject);
    procedure JvDBRichEdit_Loc_6Click(Sender: TObject);
    procedure JvDBRichEdit_Loc_7Click(Sender: TObject);
    procedure JvDBRichEdit_Loc_8Click(Sender: TObject);
    procedure JvDBRichEdit_Loc_9Change(Sender: TObject);
    procedure JvDBRichEdit_Loc_10Click(Sender: TObject);
    procedure IBTable_PTSPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure Imprimir_SelecionadoClick(Sender: TObject);
    procedure Imprimir_TodosClick(Sender: TObject);
    procedure ComboBox_SalaAulaKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_InstrutorKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_TipoTurmaChange(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_NovoPtsClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_AlteracaoClick(Sender: TObject);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
    procedure JvTransparentButton_Inserir_EADClick(Sender: TObject);
    procedure JvTransparentButton_Alterar_EADClick(Sender: TObject);
    procedure JvTransparentButton_Excluir_EADClick(Sender: TObject);
    procedure JvTransparentButton_Grava_EADClick(Sender: TObject);
    procedure JvTransparentButton_Cancelar_EADClick(Sender: TObject);
    procedure JvDBRichEdit_Msg_EADKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_Equipe_EADChange(Sender: TObject);
    procedure ComboBox_Equipe_EADKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_Equipe_EADExit(Sender: TObject);
    procedure ComboBox_Equipe_EADClick(Sender: TObject);
    procedure IBTable_PTS_EADPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure JvTransparentButton_Imprime_EADClick(Sender: TObject);
    procedure TabSheet_PTS_EADEnter(Sender: TObject);
    procedure TabSheet_PTS_EADExit(Sender: TObject);
    procedure JvTransparentButton_PDF_EADClick(Sender: TObject);
    procedure IBTable_PTSBeforeScroll(DataSet: TDataSet);
    procedure ComboBox_SemanaChange(Sender: TObject);
    procedure ComboBox_SemanaSelect(Sender: TObject);
    procedure ComboBox_SemanaKeyPress(Sender: TObject; var Key: Char);
    procedure JvExpressButton_Limpa_DescricaoClick(Sender: TObject);
    procedure JvExpressButton_Limpa_DocenteClick(Sender: TObject);
    procedure JvExpressButton_Limpa_LocalClick(Sender: TObject);
    procedure IBQuery_PTSAfterScroll(DataSet: TDataSet);
  private    { Private declarations }
     VS_IdCurso_Sel, VS_IdTurma_Sel, VS_Coordenador, VS_Msg, VS_Msg_EAD, VS_Opcao: String;
     VI_Opcao: Integer;
  public    { Public declarations }
  end;

var
  Form_Cad_PTS: TForm_Cad_PTS;

implementation

uses Module, Frame_Sel_Curso, Rel_ProgramaDeTrabalhoSemanal,
  Sel_ResponsavelAssinaturaRelatorio, Controle_Alteracoes_PTS, Rel_PTS_EAD;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.FormActivate(Sender: TObject);
var
    Status: Boolean;
begin
   JvCaptionPanel_ImporatPTS.Visible:= False;
   if ((Funcoes.GetCadCurso = 'MenuPrincipal') or (Funcoes.GetCadCurso = 'SelTurma')) then
   begin
      VI_Opcao:= 0;

      VS_IdCurso_Sel:= '-1';
      VS_IdTurma_Sel:= '-1';
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - PTS');    // Abre o perfil do usuario em relacao a agenda

      Funcoes.CabecalhoForm( Form_Cad_PTS, 'Plano de Trabalho Semanal - PTS');

      if (( Funcoes.GetSecao = 'PLANEJAMENTO') or ( Funcoes.GetSecao = 'ADMINISTRAÇÃO')) Then
         Status:= true
      else
         Status:= False;

      Panel_GerenciaPTS.Visible:= Status;
      Panel_TipoTurma.Visible:= Status;

      if ((DM.IBQuery_MontaTurma.FieldByName('Status').AsString = 'A') or (DM.IBQuery_MontaTurma.FieldByName('Status').AsString = 'B')) then
         ComboBox_TipoTurma.Text:= 'Em Andamento'
      else
         if DM.IBQuery_MontaTurma.FieldByName('Status').AsString = 'E' then
            ComboBox_TipoTurma.Text:= 'Executados'
         else
            if DM.IBQuery_MontaTurma.FieldByName('Status').AsString = 'P' then
               ComboBox_TipoTurma.Text:= 'Planejados'
            else
               ComboBox_TipoTurma.Text:= 'Default';

      JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
      ComboBox_Equipe.Visible:= False;

      IBTable_PTS.Open;
      IBTable_PTS_EAD.Open;

      PageControl_PTS.TabIndex:= 0;

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_Cad_PTS.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Cadastro', ComboBox_TipoTurma.Text);

      Funcoes.SetCadCurso('CadCurso');
      TrataSemanas;
      Tratar_PTS_EAD;

      TratarBotoes(True);
      TratarBotoes_EAD(True);

      ComboBox_SalaAula.Visible:= False;
      ComboBox_Instrutor.Visible:= False;
      ComboBox_disciplinas.Visible:= False;

      JvShapeLimpa_Descricao.Visible:= False;
      JvExpressButton_Limpa_Descricao.Visible:= False;

      JvShape_Limpa_Docente.Visible:= False;
      JvExpressButton_Limpa_Docente.Visible:= False;

      JvExpressButton_Limpa_Local.Visible:= False;
      JvShape_Limpa_Local.Visible:= False;

      JvTransparentButton_CancelarClick(Sender);
      ComboBox_SemanaChange(Sender);
      ComboBox_Semana.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   JvTransparentButton_CancelarClick(Sender);

    IBTable_PTSImportar.Close;
    IBTable_PTS.Close;

    JvTransparentButton_Cancelar_EADClick(Sender);
    IBTable_PTS_EAD.Close;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Retornar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Windows
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_WindowsClick(Sender: TObject);
begin
    Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento quando for selecionado outro PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.IBTable_PTSBeforeScroll(DataSet: TDataSet);
begin
   TrataTurma(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString);

   if ((VS_IdCurso_Sel <> DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString) or ( VS_IdTurma_Sel <> DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString)) then
   begin
      ListaSalas;
      ListaDisciplinas;
      ListaInstrutores;    // Tratamento da Lista de Instrutores

      VS_IdCurso_Sel:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
      VS_IdTurma_Sel:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
//      TrataSemanas;
   end;

   if DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString = 'Presencial' then
   begin
      TabSheet_PTS_EAD.TabVisible:= False;
   end
   else
   begin
      TabSheet_PTS_EAD.TabVisible:= True;
      Tratar_PTS_EAD;
      TratarBotoes_EAD(True);
   end;

   TratarBotoes(True);
end;

//------------------------------------------------------------------------------
// Trata a Turma
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTS.TrataTurma(Turma: String);
begin
   if Turma = '' then
   begin
      ComboBox_SemanaImportar.Clear;
      ComboBox_Semana.Items.Clear;
      ComboBox_Semana.Text:=  '0';
      Label_Semanas.Caption:= '0';
      JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao do PTS EAD
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Tratar_PTS_EAD;
begin
   if DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'Presencial' then
   begin
      if ((VS_IdCurso_Sel <> DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString) or ( VS_IdTurma_Sel <> DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString)) then
      begin
         IBQuery_PTS_EAD.Close;
         IBQuery_PTS_EAD.Sql.Clear;
         IBQuery_PTS_EAD.Sql.Add('Select * From Cad_PTS_EAD Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
         IBQuery_PTS_EAD.Open;
      end;
   end;
end;
//------------------------------------------------------------------------------
// Monta as semanas para selecao
//--
// Trata as semanas referente ao Curso
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.TrataSemanas;
var
   Div_semanas, Vi_Semanas: Real;
   VI_SemIni, VI_SemAtual, VI_SemanaAtual, i: Integer;
   Sender: TObject;
begin


   if DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString = '' then
   begin
      VI_SemIni:= 0;
      VI_SemAtual:= 0;

      JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
      Vi_Semanas:= 0;
      ComboBox_SemanaImportar.Clear;
      ComboBox_Semana.Items.Clear;
      Label1_SemanaImportar.Caption:= '0';
      Label_Semanas.Caption:= '0';
   end
   else
   begin
      VI_SemIni:= Funcoes.SemanaAno(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString);
      VI_SemAtual:= Funcoes.SemanaAno(DateToStr(Date));

      VI_SemanaAtual:= (VI_SemAtual - VI_SemIni)+1;

      if VI_SemanaAtual <= 0 then
         VI_SemanaAtual:= 1;


      Vi_Semanas:= DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsDateTime - DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime;
      Div_semanas:= Vi_Semanas/7;
      Vi_Semanas:= Round(Vi_Semanas/7);

      if Div_Semanas > VI_Semanas then
         Vi_Semanas:= Vi_Semanas+1;

      ComboBox_SemanaImportar.Clear;
      ComboBox_Semana.Items.Clear;
      if VI_SemanaAtual > VI_Semanas then
         VI_SemanaAtual:= StrToInt(FloatToStr(VI_Semanas));

      i:= 1;
      if ((ComboBox_TipoTurma.Text = 'Em Andamento') or (ComboBox_TipoTurma.Text = 'Default') or (ComboBox_TipoTurma.Text = 'Default-in')) then
         ComboBox_Semana.Text:= IntToStr(VI_SemanaAtual)
      else
         ComboBox_Semana.Text:= IntToStr(1);
      JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);

      While i <= VI_Semanas do
      begin
         ComboBox_SemanaImportar.Items.Add(IntToStr(i));
         ComboBox_Semana.Items.Add(IntToStr(i));
         i:= i+1;
      end;

      JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
      Label1_SemanaImportar.Caption:= IntToStr(i-1);
      Label_Semanas.Caption:= IntToStr(i-1);
   end;
end;


//------------------------------------------------------------------------------
// Tratamento para Destacar Feriados
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Tratar_Msg_Feriado(Shape: TShape; PS_Msg: String; Cor: TColor);
begin
   Shape.Brush.Color:= Cor;
   Shape.Hint:= PS_Msg;
end;

//------------------------------------------------------------------------------
// Tratamento para Destacar Feriados
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Verifica_Feriado(PS_data: String; semana: Integer);
begin
   Funcoes.OpenQuery('Select * From Feriados where Data = '+#39+PS_Data+#39);
   if DM.IBQuery_Executa.FieldByName('Data').AsString <> '' then
   begin
     case semana of
        2: Tratar_Msg_Feriado( Shape_Semana_02, 'Feriado: '+DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString, CLRed);
        3: Tratar_Msg_Feriado( Shape_Semana_03, 'Feriado: '+DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString, CLRed);
        4: Tratar_Msg_Feriado( Shape_Semana_04, 'Feriado: '+DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString, CLRed);
        5: Tratar_Msg_Feriado( Shape_Semana_05, 'Feriado: '+DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString, CLRed);
        6: Tratar_Msg_Feriado( Shape_Semana_06, 'Feriado: '+DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString, CLRed);
     end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao da segunda feira
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvDateEdit_SegundaChange(Sender: TObject);
var
   Ano, Mes, Dia : word;
begin
   //--- Coloca todas semanas no padrao de nao feriado

   Tratar_Msg_Feriado( Shape_Semana_02, '', $00E4A958);
   Tratar_Msg_Feriado( Shape_Semana_03, '', $00E4A958);
   Tratar_Msg_Feriado( Shape_Semana_04, '', $00E4A958);
   Tratar_Msg_Feriado( Shape_Semana_05, '', $00E4A958);
   Tratar_Msg_Feriado( Shape_Semana_06, '', $00E4A958);

   Verifica_Feriado(copy(JvDateEdit_Segunda.Text,1,5), 2);

   DecodeDate (JvDateEdit_Segunda.date+1, Ano, Mes, Dia);
   Label_Data03.Caption:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes);
   Verifica_Feriado(Label_Data03.Caption, 3);

   DecodeDate (JvDateEdit_Segunda.date+2, Ano, Mes, Dia);
   Label_Data04.Caption:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes);
   Verifica_Feriado(Label_Data04.Caption, 4);

   DecodeDate (JvDateEdit_Segunda.date+3, Ano, Mes, Dia);
   Label_Data05.Caption:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes);
   Verifica_Feriado(Label_Data05.Caption, 5);

   DecodeDate (JvDateEdit_Segunda.date+4, Ano, Mes, Dia);
   Label_Data06.Caption:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes);
   Verifica_Feriado(Label_Data06.Caption, 6);
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da semana
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.ComboBox_SemanaChange(Sender: TObject);
begin
   if DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString = '' then
   begin
      IBTable_PTS.Close;
      ShowMessage('Não possui PTS cadastrado '+ComboBox_TipoTurma.Text+'...');
   end
   else
   begin
      if (trim(ComboBox_Semana.Text) <> '') then
      begin
         if StrToInt(ComboBox_Semana.Text) > StrToInt(Label_Semanas.Caption) Then
         begin
            ShowMessage('O número de semanas não podem ser maior que o total de semana...');
            ComboBox_Semana.SetFocus;
         end
         else
         begin
            JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
            IBQuery_PTS.Close;
            IBQuery_PTS.Sql.Clear;
            IBQuery_PTS.SQL.Add( 'Select IdCurso, IdTurma, Semana '+
                                 ' From Cad_PTS ' +
                                 ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                 ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                 ' and   Semana = '+ComboBox_Semana.Text
                                );
            IBQuery_PTS.Open;
            JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
         end;
      end
      else
      begin
         ShowMessage('Não foi selecionado a semana...');
         ComboBox_Semana.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para selecao da semana
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.ComboBox_SemanaSelect(Sender: TObject);
begin
   if (trim(ComboBox_Semana.Text) <> '') then
      ComboBox_SemanaChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para inserir um novo PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.TratarBotoes(Status: Boolean);
begin
   if Label_Semanas.Caption = '0' then
      Status:= False;

   Panel_Botoes_EAD.Enabled:= Status;
   Panel_SelecaoCurso.Enabled:= Status;

   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;

   if Funcoes.GetAcesso = 'A' then
   begin
      JvTransparentButton_Alteracao.Enabled:= Status;
      JvTransparentButton_NovoPts.Enabled:= Status;
      JvExpressButton_ExportarPTS.Enabled:= Status;
      JvExpressButton_PTSBase.Enabled:= Status;
   end
   else
   begin
      if ((DM.Query_PerfilAcesso.FieldByName('Inserir').AsString = 'S') or ( DM.Query_PerfilAcesso.FieldByName('Alterar').AsString = 'S')) then
      begin
         JvTransparentButton_Alteracao.Enabled:= Status;
         JvTransparentButton_NovoPts.Enabled:= Status;
         JvExpressButton_ExportarPTS.Enabled:= Status;
         JvExpressButton_PTSBase.Enabled:= Status;
      end
      else
      begin
         JvTransparentButton_Alteracao.Enabled:= False;
         JvTransparentButton_NovoPts.Enabled:= False;
         JvExpressButton_ExportarPTS.Enabled:= False;
         JvExpressButton_PTSBase.Enabled:= False;
      end;
   end;

   JvTransparentButton_Imprimir.Enabled:= Status;
   JvTransparentButton_ImprimirPDF.Enabled:= Status;
   Panel_GerenciaPTS.Enabled:= Status;
   JvCheckBox_Vizualizar.Enabled:= Status;

   if Status = True then
      Status:= False
   else
      if Label_Semanas.Caption = '0' then
         Status:= False
      else
         Status:= True;

   ComboBox_Instrutor.Visible:= Status;
   ComboBox_disciplinas.Visible:= Status;
   ComboBox_SalaAula.Visible:= Status;

   JvShapeLimpa_Descricao.Visible:= Status;
   JvExpressButton_Limpa_Descricao.Visible:= Status;

   JvShape_Limpa_Docente.Visible:= Status;
   JvExpressButton_Limpa_Docente.Visible:= Status;

   JvExpressButton_Limpa_Local.Visible:= Status;
   JvShape_Limpa_Local.Visible:= Status;

   JvTransparentButton_Grava.Enabled:= Status;
   JvTransparentButton_Cancelar.Enabled:= Status;

   JvDateEdit_Segunda.Enabled:= Status;
   JvDBRichEdit_Segunda_1.Enabled:= Status;
   JvDBRichEdit_Segunda_2.Enabled:= Status;
   JvDBRichEdit_Terca_1.Enabled:= Status;
   JvDBRichEdit_Terca_2.Enabled:= Status;
   JvDBRichEdit_Quarta_1.Enabled:= Status;
   JvDBRichEdit_Quarta_2.Enabled:= Status;
   JvDBRichEdit_Quinta_1.Enabled:= Status;
   JvDBRichEdit_Quinta_2.Enabled:= Status;
   JvDBRichEdit_Sexta_1.Enabled:= Status;
   JvDBRichEdit_Sexta_2.Enabled:= Status;
   JvDBRichEdit_Hor_1.Enabled:= Status;
   JvDBRichEdit_Hor_2.Enabled:= Status;
   JvDBRichEdit_Hor_3.Enabled:= Status;
   JvDBRichEdit_Hor_4.Enabled:= Status;
   JvDBRichEdit_Hor_5.Enabled:= Status;
   JvDBRichEdit_Hor_6.Enabled:= Status;
   JvDBRichEdit_Hor_7.Enabled:= Status;
   JvDBRichEdit_Hor_8.Enabled:= Status;
   JvDBRichEdit_Hor_9.Enabled:= Status;
   JvDBRichEdit_Hor_10.Enabled:= Status;
   JvDBRichEdit_Doc_1.Enabled:= Status;
   JvDBRichEdit_Doc_2.Enabled:= Status;
   JvDBRichEdit_Doc_3.Enabled:= Status;
   JvDBRichEdit_Doc_4.Enabled:= Status;
   JvDBRichEdit_Doc_5.Enabled:= Status;
   JvDBRichEdit_Doc_6.Enabled:= Status;
   JvDBRichEdit_Doc_7.Enabled:= Status;
   JvDBRichEdit_Doc_8.Enabled:= Status;
   JvDBRichEdit_Doc_9.Enabled:= Status;
   JvDBRichEdit_Doc_10.Enabled:= Status;
   JvDBRichEdit_Loc_1.Enabled:= Status;
   JvDBRichEdit_Loc_2.Enabled:= Status;
   JvDBRichEdit_Loc_3.Enabled:= Status;
   JvDBRichEdit_Loc_4.Enabled:= Status;
   JvDBRichEdit_Loc_5.Enabled:= Status;
   JvDBRichEdit_Loc_6.Enabled:= Status;
   JvDBRichEdit_Loc_7.Enabled:= Status;
   JvDBRichEdit_Loc_8.Enabled:= Status;
   JvDBRichEdit_Loc_9.Enabled:= Status;
   JvDBRichEdit_Loc_10.Enabled:= Status;
   JvDBRichEdit_Msg.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para inserir um novo PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_NovoPtsClick(Sender: TObject);
var
   VS_Sala, VS_Comando: String;
begin
   try
      if (trim(ComboBox_Semana.Text) = '') then
         TratarSemanaNaoSelecionada
      else
      begin
         if DM.IBQuery_MontaTurma.FieldByName('Turma').AsString = '' then
            showMessage('Não foi selecionado a Turma...')
         else
         begin
            TratarBotoes(False);
            if IBTable_PTS.FieldByName('IdCurso').AsString = '' then
            begin
               VS_Opcao:= 'Inserção';

                //----
               //--- Tratamento da seleção do Coordenador

               VS_Msg:= '';
               VS_Msg_EAD:= '';
               VS_Coordenador:= Trim(DM.IBQuery_MontaTurma.FieldByName('Coordenador').AsString);
               JvDBRichEdit_Msg.Lines.Add('Coordenador: '+VS_Coordenador);

                //----
               //--- Tratamento da Sala

               VS_Sala:= Trim(DM.IBQuery_MontaTurma.FieldByName('CodSala').AsString);

               IBTable_PTS.Append;
               IBTable_PTS.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
               IBTable_PTS.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
               IBTable_PTS.FieldByName('Semana').AsString:=  ComboBox_Semana.Text;

               IBTable_PTS.FieldByName('Dia_Semana_02').AsString:= '2º Feira';
               IBTable_PTS.FieldByName('Dia_Semana_03').AsString:= '3º Feira';
               IBTable_PTS.FieldByName('Dia_Semana_04').AsString:= '4º Feira';
               IBTable_PTS.FieldByName('Dia_Semana_05').AsString:= '5º Feira';
               IBTable_PTS.FieldByName('Dia_Semana_06').AsString:= '6º Feira';

               IBTable_PTS.FieldByName('Horario_01_02').AsString:= Periodo_Manha;
               IBTable_PTS.FieldByName('Horario_02_02').AsString:= Periodo_Tarde;
               IBTable_PTS.FieldByName('Horario_01_03').AsString:= Periodo_Manha;
               IBTable_PTS.FieldByName('Horario_02_03').AsString:= Periodo_Tarde;
               IBTable_PTS.FieldByName('Horario_01_04').AsString:= Periodo_Manha;
               IBTable_PTS.FieldByName('Horario_02_04').AsString:= Periodo_Tarde;
               IBTable_PTS.FieldByName('Horario_01_05').AsString:= Periodo_Manha;
               IBTable_PTS.FieldByName('Horario_02_05').AsString:= Periodo_Tarde;
               IBTable_PTS.FieldByName('Horario_01_06').AsString:= Periodo_Manha;
               IBTable_PTS.FieldByName('Horario_02_06').AsString:= Periodo_Tarde;

               IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_02').AsString:= '';
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_02').AsString:= '';
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_03').AsString:= '';
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_03').AsString:= '';
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_04').AsString:= '';
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_04').AsString:= '';
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_05').AsString:= '';
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_05').AsString:= '';
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_06').AsString:= '';
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_06').AsString:= '';

               IBTable_PTS.FieldByName('Local_01_02').AsString:= VS_Sala;
               IBTable_PTS.FieldByName('Local_02_02').AsString:= VS_Sala;
               IBTable_PTS.FieldByName('Local_01_03').AsString:= VS_Sala;
               IBTable_PTS.FieldByName('Local_02_03').AsString:= VS_Sala;
               IBTable_PTS.FieldByName('Local_01_04').AsString:= VS_Sala;
               IBTable_PTS.FieldByName('Local_02_04').AsString:= VS_Sala;
               IBTable_PTS.FieldByName('Local_01_05').AsString:= VS_Sala;
               IBTable_PTS.FieldByName('Local_02_05').AsString:= VS_Sala;
               IBTable_PTS.FieldByName('Local_01_06').AsString:= VS_Sala;
               IBTable_PTS.FieldByName('Local_02_06').AsString:= VS_Sala;
            end
            else
            begin
               VS_Opcao:= 'Alteração';
               IBTable_PTS.Edit;
               VS_Msg:= IBTable_PTS.FieldByName('MSG').AsString;
            end;
            TratarBotoes(False);
            JvDBRichEdit_Segunda_1.SetFocus;
         end;
      end;
   except

   end;
end;

//------------------------------------------------------------------------------
// Tratamento para gravacao do PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Gravar_Pts;
var
   Ano, Mes, Dia : word;
begin
   if ((IBTable_PTS.State = DSBrowse)) then
   begin
      DecodeDate (JvDateEdit_Segunda.date, Ano, Mes, Dia);

      IBTable_PTS.Edit;
      IBTable_PTS.FieldByName('Data_02').AsString:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes);
      IBTable_PTS.FieldByName('Data_03').AsString:= Label_Data03.Caption;
      IBTable_PTS.FieldByName('Data_04').AsString:= Label_Data04.Caption;
      IBTable_PTS.FieldByName('Data_05').AsString:= Label_Data05.Caption;
      IBTable_PTS.FieldByName('Data_06').AsString:= Label_Data06.Caption;

      IBTable_PTS.Post;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para gravacao do PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_GravaClick(Sender: TObject);
var
   Ano, Mes, Dia : word;
begin
   if ((IBTable_PTS.State = DSInsert) or (IBTable_PTS.State = DSEdit )) then
   begin
      if IBTable_PTS.FieldByName('Semana').AsString <> '' then
      begin
         Gravar_Pts;
         GravaPtsTmp;

         Funcoes.GravaAcesso('Menu Principal - PTS', VS_Opcao+' PTS do Curso '+Funcoes.GetCodCurso+' Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'/'+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - Usuario: '+Funcoes.GetUsuario);
      end
      else
      begin
         IBTable_PTS.Cancel;
         Funcoes.ExecutaTransacao;
      end;
   end;
   TratarBotoes(True);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para cancelar a Inclusao/Alteracao PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   if ((IBTable_PTS.State = DSInsert) or (IBTable_PTS.State = DSEdit )) then
   begin
      IBTable_PTS.Cancel;
      Funcoes.ExecutaTransacao;
   end;
   TratarBotoes(True);
end;

//------------------------------------------------------------------------------
// Tratamento da opção para imprimir o PTS selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Imprimir_SelecionadoClick(Sender: TObject);
var
   VS_Semana: String;
   Ano, Mes, Dia : word;
begin
   if IBTable_PTS.FieldByName('HORARIO_01_02').AsString = '' then
       ShowMessage('Não foi preenchido o PTS...')
   else
   begin
      if (trim(ComboBox_Semana.Text) = '') then
         TratarSemanaNaoSelecionada
      else
      begin
         DecodeDate (JvDateEdit_Segunda.date, Ano, Mes, Dia);
         VS_Semana:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes);
         if IBTable_PTS.FieldByName('Data_02').AsString <> VS_Semana then
            Gravar_Pts;

         if JvCheckBox_Vizualizar.Checked = True then
            Form_Rel_PTS.QuickRep1.Preview
         else
            Form_Rel_PTS.QuickRep1.Print
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da opcao para imprimir todos os PTSs
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Imprimir_TodosClick(Sender: TObject);
var
   VS_Semana, VS_SemanaAtual: String;
   VI_SemanaAtual, UltimaSemana: Integer;

   Ano, Mes, Dia : word;
begin
   if IBTable_PTS.FieldByName('HORARIO_01_02').AsString = '' then
       ShowMessage('Não foi preenchido o PTS...')
   else
   begin
      if (trim(ComboBox_Semana.Text) = '') then
         TratarSemanaNaoSelecionada
      else
      begin
         UltimaSemana:= StrToInt(Label_Semanas.Caption);
         VI_SemanaAtual:=  StrToInt(ComboBox_Semana.Text);
         VS_SemanaAtual:= ComboBox_Semana.Text;
         While VI_SemanaAtual <= UltimaSemana do
         begin
            DecodeDate (JvDateEdit_Segunda.date, Ano, Mes, Dia);
            VS_Semana:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes);
            if IBTable_PTS.FieldByName('Data_02').AsString <> VS_Semana then
               Gravar_Pts;

            if JvCheckBox_Vizualizar.Checked = True then
               Form_Rel_PTS.QuickRep1.Preview
            else
               Form_Rel_PTS.QuickRep1.Print;
            VI_SemanaAtual:= VI_SemanaAtual+1;

            ComboBox_Semana.Text:= IntToStr(VI_SemanaAtual);

            JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
         end;
         ComboBox_Semana.Text:= VS_SemanaAtual;
         JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
         JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Caixa de Selecao da Sala de Aula
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTS.ListaSalas;
begin
   Funcoes.OpenQuery('Select CodSala From SalaAula order By CodSala ');

   DM.IBQuery_Executa.First;
   ComboBox_SalaAula.Items.Clear;
   ComboBox_SalaAula.Text:= DM.IBQuery_Executa.FieldByName('CodSala').AsString;
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_SalaAula.Items.Add(DM.IBQuery_Executa.FieldByName('CodSala').AsString);
      DM.IBQuery_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Caixa de Selecao de Disciplina
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTS.ListaDisciplinas;
begin
   DBComboBox_Disciplina.Items.Clear;
   DBComboBox_Disciplina.Text:= '';

   ComboBox_disciplinas.Items.Clear;
   ComboBox_disciplinas.Text:= '';

   if ((DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString <> '') and (DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString <> '' )) then
   begin
      Funcoes.OpenQuery('Select NomeMateria From MateriaCurso where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
      DM.IBQuery_Executa.First;
      DBComboBox_Disciplina.Text:= DM.IBQuery_Executa.FieldByName('NomeMateria').AsString;

      ComboBox_disciplinas.Text:= DM.IBQuery_Executa.FieldByName('NomeMateria').AsString;

      While not DM.IBQuery_Executa.Eof do
      begin
         DBComboBox_Disciplina.Items.Add(DM.IBQuery_Executa.FieldByName('NomeMateria').AsString);

         ComboBox_disciplinas.Items.Add(DM.IBQuery_Executa.FieldByName('NomeMateria').AsString);
         DM.IBQuery_Executa.Next;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da seleção dos Instrutores
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTS.ListaInstrutores;
begin
   DBComboBox_Tutor.Items.Clear;
   DBComboBox_Tutor.Text:= '';

   ComboBox_Equipe_EAD.Items.Clear;
   ComboBox_Instrutor.Text:= '';

   if ((DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString <> '') and (DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString <> '' )) then
   begin
       Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select P.nomeGuerra, p.PostoGraduacao'+
                                                ' from   instrutorturma i, pessoa p'+
                                               ' where  i.identidade = p.identidade'+
                                               ' and    i.idCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                               ' and    i.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                          );
      DM.IBQuery_Executa.First;

      DBComboBox_Tutor.Items.Clear;
      DBComboBox_Tutor.Items.Add('Equipe');
      DBComboBox_Tutor.Text:= 'Equipe';

      ComboBox_Equipe_EAD.Items.Clear;
      ComboBox_Equipe_EAD.Text:= Trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' '+Trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString);

      ComboBox_Instrutor.Items.Clear;
      ComboBox_Instrutor.Items.Add('Equipe');
      ComboBox_Instrutor.Text:= 'Equipe';
      ComboBox_Equipe.Text:= Trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' '+Trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString);

      While not DM.IBQuery_Executa.Eof do
      begin
         ComboBox_Equipe_EAD.Items.Add(Trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' '+Trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString));
         DBComboBox_Tutor.Items.Add(Trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' '+Trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString));

         ComboBox_Equipe.Items.Add(Trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' '+Trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString));
         ComboBox_Instrutor.Items.Add(Trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' '+Trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString));
         DM.IBQuery_Executa.Next;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento Da Caixa de Selecao da Disciplina
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTS.TratarCaixaDisciplinas(PI_Opcao, PI_Top: Integer);
Begin
   VI_Opcao:= PI_Opcao;
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Segunda_1KeyPress(Sender: TObject;var Key: Char);
begin
  if Key = #4 then
     TratarCaixaDisciplinas( 1, Panel_SegFeira.Top+3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Segunda_2Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 2, Panel_SegFeira.Top+95 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Terca_1Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 3, Panel_TerFeira.Top+3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Terca_2Click(Sender: TObject);
begin
    TratarCaixaDisciplinas( 4, Panel_TerFeira.Top+95 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Quarta_1Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 5, Panel_QuaFeira.Top+3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Quarta_2Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 6, Panel_QuaFeira.Top+95 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Quinta_1Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 7, Panel_QuiFeira.Top+3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Quinta_2Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 8, Panel_QuiFeira.Top+95 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Sexta_1Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 9, Panel_SexFeira.Top+3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Sexta_2Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 10, Panel_SexFeira.Top+95 );
end;

//------------------------------------------------------------------------------
//- Selecao da Disciplina
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.ComboBox_disciplinasClick(Sender: TObject);
begin
   if VI_Opcao = 1 then
      IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_02').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_02').AsString+ComboBox_disciplinas.Text+#13
   else
      if VI_Opcao = 2 then
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_02').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_02').AsString+ComboBox_disciplinas.Text+#13
      else
         if VI_Opcao = 3 then
            IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_03').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_03').AsString+ComboBox_disciplinas.Text+#13
         else
            if VI_Opcao = 4 then
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_03').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_03').AsString+ComboBox_disciplinas.Text+#13
            else
               if VI_Opcao = 5 then
                  IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_04').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_04').AsString+ComboBox_disciplinas.Text+#13
               else
                  if VI_Opcao = 6 then
                     IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_04').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_04').AsString+ComboBox_disciplinas.Text+#13
                  else
                     if VI_Opcao = 7 then
                        IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_05').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_05').AsString+ComboBox_disciplinas.Text+#13
                     else
                        if VI_Opcao = 8 then
                           IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_05').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_05').AsString+ComboBox_disciplinas.Text+#13
                        else
                           if VI_Opcao = 9 then
                              IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_06').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_06').AsString+ComboBox_disciplinas.Text+#13
                           else
                              if VI_Opcao = 10 then
                                 IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_06').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_06').AsString+ComboBox_disciplinas.Text+#13
end;


//------------------------------------------------------------------------------
//
// Tratamento da Selecao do Instrutor
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento Da Caixa de Selecao
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTS.TratarCaixaInstrutor(PI_Opcao, PI_Top: Integer);
Begin
   VI_Opcao:= PI_Opcao;
end;

//------------------------------------------------------------------------------
// Tratamento da slecao de tecla
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvDBRichEdit_Doc_1Click(Sender: TObject);
begin
   TratarCaixaInstrutor( 1, Panel_SegFeira.Top+3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Doc_2Click(Sender: TObject);
begin
   TratarCaixaInstrutor( 2, Panel_SegFeira.Top+95 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Doc_3Click(Sender: TObject);
begin
     TratarCaixaInstrutor( 3, Panel_TerFeira.Top+3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Doc_4Click(Sender: TObject);
begin
   TratarCaixaInstrutor( 4, Panel_TerFeira.Top+95 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Doc_5Click(Sender: TObject);
begin
   TratarCaixaInstrutor( 5, Panel_QuaFeira.Top+3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Doc_6Click(Sender: TObject);
begin
     TratarCaixaInstrutor( 6, Panel_QuaFeira.Top+95 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Doc_7Click(Sender: TObject);
begin
   TratarCaixaInstrutor( 7, Panel_QuiFeira.Top+3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Doc_8Click(Sender: TObject);
begin
   TratarCaixaInstrutor( 8, Panel_QuiFeira.Top+95 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Doc_9Click(Sender: TObject);
begin
   TratarCaixaInstrutor( 9, Panel_SexFeira.Top+3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Doc_10Click(Sender: TObject);
begin
   TratarCaixaInstrutor( 10, Panel_SexFeira.Top+95 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_MsgKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #4 then
       ComboBox_Equipe.Visible:= True;

   if key = #3 then
      JvDBRichEdit_Msg.Text:= JvDBRichEdit_Msg.Text+#13+'Coordenador: '+(DM.IBQuery_MontaTurma.FieldByName('Coordenador').AsString);
end;


procedure TForm_Cad_PTS.ComboBox_InstrutorClick(Sender: TObject);
begin
   if VI_Opcao = 1 then
      IBTable_PTS.FieldByName('EQUIPE_01_02').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_02').AsString+ComboBox_Instrutor.Text+#13
   else
      if VI_Opcao = 2 then
         IBTable_PTS.FieldByName('EQUIPE_02_02').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_02').AsString+ComboBox_Instrutor.Text+#13
      else
         if VI_Opcao = 3 then
            IBTable_PTS.FieldByName('EQUIPE_01_03').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_03').AsString+ComboBox_Instrutor.Text+#13
         else
            if VI_Opcao = 4 then
               IBTable_PTS.FieldByName('EQUIPE_02_03').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_03').AsString+ComboBox_Instrutor.Text+#13
            else
               if VI_Opcao = 5 then
                  IBTable_PTS.FieldByName('EQUIPE_01_04').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_04').AsString+ComboBox_Instrutor.Text+#13
               else
                  if VI_Opcao = 6 then
                     IBTable_PTS.FieldByName('EQUIPE_02_04').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_04').AsString+ComboBox_Instrutor.Text+#13
                  else
                     if VI_Opcao = 7 then
                        IBTable_PTS.FieldByName('EQUIPE_01_05').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_05').AsString+ComboBox_Instrutor.Text+#13
                     else
                        if VI_Opcao = 8 then
                           IBTable_PTS.FieldByName('EQUIPE_02_05').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_05').AsString+ComboBox_Instrutor.Text+#13
                        else
                           if VI_Opcao = 9 then
                              IBTable_PTS.FieldByName('EQUIPE_01_06').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_06').AsString+ComboBox_Instrutor.Text+#13
                           else
                              if VI_Opcao = 10 then
                                 IBTable_PTS.FieldByName('EQUIPE_02_06').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_06').AsString+ComboBox_Instrutor.Text+#13
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao da Equipe
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.ComboBox_EquipeClick(Sender: TObject);
begin
   if VS_Msg = '' then
      VS_Msg:= 'Equipe: '+ComboBox_Equipe.Text+' / '
   else
      VS_Msg:=  VS_Msg+ ComboBox_Equipe.Text+' / ';

   JvDBRichEdit_Msg.Lines.Clear;
   JvDBRichEdit_Msg.Lines.Add(VS_Msg+#13+VS_Coordenador);
   IBTable_PTS.FieldByName('MSG').AsString:= VS_Msg+#13+VS_Coordenador;
end;

procedure TForm_Cad_PTS.ComboBox_EquipeKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #4 then
      ComboBox_Equipe.Visible:= False
end;

procedure TForm_Cad_PTS.ComboBox_EquipeExit(Sender: TObject);
begin
   ComboBox_Equipe.Visible:= False
end;

//------------------------------------------------------------------------------
//
//--- Tratamento para selecao da sala de aula
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento Da Caixa de Selecao da Sala de Aula
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTS.TratarCaixaSala(PI_Opcao: Integer);
Begin
   VI_Opcao:= PI_Opcao;
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Loc_1Click(Sender: TObject);
begin
   TratarCaixaSala( 1 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Loc_2Click(Sender: TObject);
begin
   TratarCaixaSala( 2 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Loc_3Click(Sender: TObject);
begin
   TratarCaixaSala( 3 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Loc_4Click(Sender: TObject);
begin
   TratarCaixaSala( 4 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Loc_5Click(Sender: TObject);
begin
   TratarCaixaSala( 5 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Loc_6Click(Sender: TObject);
begin
   TratarCaixaSala( 6 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Loc_7Click(Sender: TObject);
begin
   TratarCaixaSala( 7 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Loc_8Click(Sender: TObject);
begin
   TratarCaixaSala( 8 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Loc_9Change(Sender: TObject);
begin
   TratarCaixaSala( 9 );
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Loc_10Click(Sender: TObject);
begin
   TratarCaixaSala( 10 );
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona a sala de aula
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.ComboBox_SalaAulaClick(Sender: TObject);
begin
   if VI_Opcao = 1 then
      IBTable_PTS.FieldByName('LOCAL_01_02').AsString:= IBTable_PTS.FieldByName('LOCAL_01_02').AsString+ComboBox_SalaAula.Text+#13
   else
      if VI_Opcao = 2 then
         IBTable_PTS.FieldByName('LOCAL_02_02').AsString:= IBTable_PTS.FieldByName('LOCAL_02_02').AsString+ComboBox_SalaAula.Text+#13
      else
         if VI_Opcao = 3 then
            IBTable_PTS.FieldByName('LOCAL_01_03').AsString:= IBTable_PTS.FieldByName('LOCAL_01_03').AsString+ComboBox_SalaAula.Text+#13
         else
            if VI_Opcao = 4 then
               IBTable_PTS.FieldByName('LOCAL_02_03').AsString:= IBTable_PTS.FieldByName('LOCAL_02_03').AsString+ComboBox_SalaAula.Text+#13
            else
               if VI_Opcao = 5 then
                  IBTable_PTS.FieldByName('LOCAL_01_04').AsString:= IBTable_PTS.FieldByName('LOCAL_01_04').AsString+ComboBox_SalaAula.Text+#13
               else
                  if VI_Opcao = 6 then
                     IBTable_PTS.FieldByName('LOCAL_02_04').AsString:= IBTable_PTS.FieldByName('LOCAL_02_04').AsString+ComboBox_SalaAula.Text+#13
                  else
                     if VI_Opcao = 7 then
                        IBTable_PTS.FieldByName('LOCAL_01_05').AsString:= IBTable_PTS.FieldByName('LOCAL_01_05').AsString+ComboBox_SalaAula.Text+#13
                     else
                        if VI_Opcao = 8 then
                           IBTable_PTS.FieldByName('LOCAL_02_05').AsString:= IBTable_PTS.FieldByName('LOCAL_02_05').AsString+ComboBox_SalaAula.Text+#13
                        else
                           if VI_Opcao = 9 then
                              IBTable_PTS.FieldByName('LOCAL_01_06').AsString:= IBTable_PTS.FieldByName('LOCAL_01_06').AsString+ComboBox_SalaAula.Text+#13
                           else
                              if VI_Opcao = 10 then
                                 IBTable_PTS.FieldByName('LOCAL_02_06').AsString:= IBTable_PTS.FieldByName('LOCAL_02_06').AsString+ComboBox_SalaAula.Text+#13
end;

//------------------------------------------------------------------------------
//
//--- Cadastramento do PTS
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//--- Tratamento do Botao que cadastra o PTS_Base
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_PTSBaseClick(Sender: TObject);
begin
   if (trim(ComboBox_Semana.Text) = '') then
      TratarSemanaNaoSelecionada
   else
      Verifica_Existencia_de_PTS('Confirmar');
end;

//------------------------------------------------------------------------------
//--- Tratamento do Botao que cadastra o PTS_Base
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Verifica_Existencia_de_PTS(PS_TipoCarga: String);
var
   VI_QtdRegistros, VI_Retorno: Integer;
begin
   if ((DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString <> '') and (DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString <> '' )) then
   begin
      if DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString <> '' then
      begin
         Funcoes.OpenQuery('Select count(1) as Qtd '+
                           ' From Cad_PTS '+
                           ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                           ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                          );
         VI_QtdRegistros:= DM.IBQuery_Executa.FieldByName('Qtd').AsInteger;

         if VI_QtdRegistros = 0 then
            Cadastra_PTS_Com_PTSBase
         else
         begin
            if PS_TipoCarga = 'Confirmar' then    // Verifica se a carga será direta ou pede confirmação
            begin
               VI_Retorno:= Application.MessageBox('Já existe PTS inserido na turma selecionada'+#13+'Se for feita atualização os dados atual serão perdidos.'+#13+
                                                 'Deseja realmente atualizá-la com a Turma Base ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
               if VI_Retorno = IDYes then
               begin
                  Funcoes.GravaAcesso('Menu Principal - PTS', 'Inserção do PTS Base no Curso '+Funcoes.GetCodCurso+' da Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'/'+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - Usuario: '+Funcoes.GetUsuario);
                  Funcoes.ExecusaoQuery('Delete From Cad_PTS Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
                  Cadastra_PTS_Com_PTSBase;
               end;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Cadastrar o PTS como PTS_Base
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Cadastra_PTS_Com_PTSBase;
var
   VD_Data: TDateTime;
begin
   if ((DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString <> '') and (DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString <> '' )) then
   begin
      VD_Data:= DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime;

      Funcoes.OpenQuery(' Select IDCURSO, SEMANA, MSG, '+
                        '        DATA_02, DIA_SEMANA_02, HORARIO_01_02, HORARIO_02_02, TRAB_ESCOLAR_01_02, TRAB_ESCOLAR_02_02, EQUIPE_01_02, EQUIPE_02_02, LOCAL_01_02, LOCAL_02_02, '+
                        '        DATA_03, DIA_SEMANA_03, HORARIO_01_03, HORARIO_02_03, TRAB_ESCOLAR_01_03, TRAB_ESCOLAR_02_03, EQUIPE_01_03, EQUIPE_02_03, LOCAL_01_03, LOCAL_02_03, '+
                        '        DATA_04, DIA_SEMANA_04, HORARIO_01_04, HORARIO_02_04, TRAB_ESCOLAR_01_04, TRAB_ESCOLAR_02_04, EQUIPE_01_04, EQUIPE_02_04, LOCAL_01_04, LOCAL_02_04, '+
                        '        DATA_05, DIA_SEMANA_05, HORARIO_01_05, HORARIO_02_05, TRAB_ESCOLAR_01_05, TRAB_ESCOLAR_02_05, EQUIPE_01_05, EQUIPE_02_05, LOCAL_01_05, LOCAL_02_05, '+
                        '        DATA_06, DIA_SEMANA_06, HORARIO_01_06, HORARIO_02_06, TRAB_ESCOLAR_01_06, TRAB_ESCOLAR_02_06, EQUIPE_01_06, EQUIPE_02_06, LOCAL_01_06, LOCAL_02_06 '+
                        ' From PTS_base '+
                        ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString
                       );

      While not DM.IBQuery_Executa.eof do
      begin

         IBTable_PTS.Append;
         IBTable_PTS.FieldByName('IDCURSO').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
         IBTable_PTS.FieldByName('IDTURMA').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
         IBTable_PTS.FieldByName('SEMANA').AsString:= DM.IBQuery_Executa.FieldByName('SEMANA').AsString;
         IBTable_PTS.FieldByName('MSG').AsString:= DM.IBQuery_Executa.FieldByName('MSG').AsString;
         IBTable_PTS.FieldByName('DATA_02').AsdateTime:= VD_Data;
         IBTable_PTS.FieldByName('DIA_SEMANA_02').AsString:= DM.IBQuery_Executa.FieldByName('DIA_SEMANA_02').AsString;
         IBTable_PTS.FieldByName('HORARIO_01_02').AsString:= DM.IBQuery_Executa.FieldByName('HORARIO_01_02').AsString;
         IBTable_PTS.FieldByName('HORARIO_02_02').AsString:= DM.IBQuery_Executa.FieldByName('HORARIO_02_02').AsString;
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_02').AsString:= DM.IBQuery_Executa.FieldByName('TRAB_ESCOLAR_01_02').AsString;
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_02').AsString:= DM.IBQuery_Executa.FieldByName('TRAB_ESCOLAR_02_02').AsString;
         IBTable_PTS.FieldByName('EQUIPE_01_02').AsString:= DM.IBQuery_Executa.FieldByName('EQUIPE_01_02').AsString;
         IBTable_PTS.FieldByName('EQUIPE_02_02').AsString:= DM.IBQuery_Executa.FieldByName('EQUIPE_02_02').AsString;
         IBTable_PTS.FieldByName('LOCAL_01_02').AsString:= DM.IBQuery_Executa.FieldByName('LOCAL_01_02').AsString;
         IBTable_PTS.FieldByName('LOCAL_02_02').AsString:= DM.IBQuery_Executa.FieldByName('LOCAL_02_02').AsString;
         IBTable_PTS.FieldByName('DATA_03').AsdateTime:= VD_Data+1;
         IBTable_PTS.FieldByName('DIA_SEMANA_03').AsString:= DM.IBQuery_Executa.FieldByName('DIA_SEMANA_03').AsString;
         IBTable_PTS.FieldByName('HORARIO_01_03').AsString:= DM.IBQuery_Executa.FieldByName('HORARIO_01_03').AsString;
         IBTable_PTS.FieldByName('HORARIO_02_03').AsString:= DM.IBQuery_Executa.FieldByName('HORARIO_02_03').AsString;
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_03').AsString:= DM.IBQuery_Executa.FieldByName('TRAB_ESCOLAR_01_03').AsString;
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_03').AsString:= DM.IBQuery_Executa.FieldByName('TRAB_ESCOLAR_02_03').AsString;
         IBTable_PTS.FieldByName('EQUIPE_01_03').AsString:= DM.IBQuery_Executa.FieldByName('EQUIPE_01_03').AsString;
         IBTable_PTS.FieldByName('EQUIPE_02_03').AsString:= DM.IBQuery_Executa.FieldByName('EQUIPE_02_03').AsString;
         IBTable_PTS.FieldByName('LOCAL_01_03').AsString:= DM.IBQuery_Executa.FieldByName('LOCAL_01_03').AsString;
         IBTable_PTS.FieldByName('LOCAL_02_03').AsString:= DM.IBQuery_Executa.FieldByName('LOCAL_02_03').AsString;
         IBTable_PTS.FieldByName('DATA_04').AsdateTime:= VD_Data+2;
         IBTable_PTS.FieldByName('DIA_SEMANA_04').AsString:= DM.IBQuery_Executa.FieldByName('DIA_SEMANA_04').AsString;
         IBTable_PTS.FieldByName('HORARIO_01_04').AsString:= DM.IBQuery_Executa.FieldByName('HORARIO_01_04').AsString;
         IBTable_PTS.FieldByName('HORARIO_02_04').AsString:= DM.IBQuery_Executa.FieldByName('HORARIO_02_04').AsString;
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_04').AsString:= DM.IBQuery_Executa.FieldByName('TRAB_ESCOLAR_01_04').AsString;
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_04').AsString:= DM.IBQuery_Executa.FieldByName('TRAB_ESCOLAR_02_04').AsString;
         IBTable_PTS.FieldByName('EQUIPE_01_04').AsString:= DM.IBQuery_Executa.FieldByName('EQUIPE_01_04').AsString;
         IBTable_PTS.FieldByName('EQUIPE_02_04').AsString:= DM.IBQuery_Executa.FieldByName('EQUIPE_02_04').AsString;
         IBTable_PTS.FieldByName('LOCAL_01_04').AsString:= DM.IBQuery_Executa.FieldByName('LOCAL_01_04').AsString;
         IBTable_PTS.FieldByName('LOCAL_02_04').AsString:= DM.IBQuery_Executa.FieldByName('LOCAL_02_04').AsString;
         IBTable_PTS.FieldByName('DATA_05').AsdateTime:= VD_Data+3;
         IBTable_PTS.FieldByName('DIA_SEMANA_05').AsString:= DM.IBQuery_Executa.FieldByName('DIA_SEMANA_05').AsString;
         IBTable_PTS.FieldByName('HORARIO_01_05').AsString:= DM.IBQuery_Executa.FieldByName('HORARIO_01_05').AsString;
         IBTable_PTS.FieldByName('HORARIO_02_05').AsString:= DM.IBQuery_Executa.FieldByName('HORARIO_02_05').AsString;
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_05').AsString:= DM.IBQuery_Executa.FieldByName('TRAB_ESCOLAR_01_05').AsString;
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_05').AsString:= DM.IBQuery_Executa.FieldByName('TRAB_ESCOLAR_02_05').AsString;
         IBTable_PTS.FieldByName('EQUIPE_01_05').AsString:= DM.IBQuery_Executa.FieldByName('EQUIPE_01_05').AsString;
         IBTable_PTS.FieldByName('EQUIPE_02_05').AsString:= DM.IBQuery_Executa.FieldByName('EQUIPE_02_05').AsString;
         IBTable_PTS.FieldByName('LOCAL_01_05').AsString:= DM.IBQuery_Executa.FieldByName('LOCAL_01_05').AsString;
         IBTable_PTS.FieldByName('LOCAL_02_05').AsString:= DM.IBQuery_Executa.FieldByName('LOCAL_02_05').AsString;
         IBTable_PTS.FieldByName('DATA_06').AsdateTime:= VD_Data+4;
         IBTable_PTS.FieldByName('DIA_SEMANA_06').AsString:= DM.IBQuery_Executa.FieldByName('DIA_SEMANA_06').AsString;
         IBTable_PTS.FieldByName('HORARIO_01_06').AsString:= DM.IBQuery_Executa.FieldByName('HORARIO_01_06').AsString;
         IBTable_PTS.FieldByName('HORARIO_02_06').AsString:= DM.IBQuery_Executa.FieldByName('HORARIO_02_06').AsString;
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_06').AsString:= DM.IBQuery_Executa.FieldByName('TRAB_ESCOLAR_01_06').AsString;
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_06').AsString:= DM.IBQuery_Executa.FieldByName('TRAB_ESCOLAR_02_06').AsString;
         IBTable_PTS.FieldByName('EQUIPE_01_06').AsString:= DM.IBQuery_Executa.FieldByName('EQUIPE_01_06').AsString;
         IBTable_PTS.FieldByName('EQUIPE_02_06').AsString:= DM.IBQuery_Executa.FieldByName('EQUIPE_02_06').AsString;
         IBTable_PTS.FieldByName('LOCAL_01_06').AsString:= DM.IBQuery_Executa.FieldByName('LOCAL_01_06').AsString;
         IBTable_PTS.FieldByName('LOCAL_02_06').AsString:= DM.IBQuery_Executa.FieldByName('LOCAL_02_06').AsString;
         IBTable_PTS.Post;
         VD_Data:= VD_Data+7;
         DM.IBQuery_Executa.Next;
      end;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Grava o PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_GravarExportarParaClick(Sender: TObject);
var
   VS_Msg, VS_Turma: String;
   VI_Retorno, VI_QtdRegistro, VI_IdTurma: Integer;
   VB_Gravar: Boolean;
begin
   if ((DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString <> '') and (DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString <> '' )) then
   begin
      VB_Gravar:= True;
      if ((ComboBox_Importar.Text = DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString) and (ComboBox_SemanaImportar.Text =  ComboBox_Semana.Text)) Then
      begin
         ShowMessage('Não pode Exportar para a mesma Turma a semana selecionada');
      end
      else
      begin
         //--- Tratamento para selecionar a turma que ira ser cadasatrada
         VS_Turma:= Trim(Funcoes.ExtraiAntesDe(ComboBox_Importar.Text, '-'));

         if VS_Turma = '' then
         begin
            ShowMessage('Não foi selecionada a Turma que irá receber o PTS...');
            ComboBox_Importar.SetFocus;
         end
         else
         begin
            VI_IdTurma:= ComboBox_Importar.ItemIndex+2;

            VI_QtdRegistro:= Funcoes.QtdRegistro(' Select count(1) as Qtd From Cad_PTS where IdCurso = ' +IBTable_PTS.FieldByName('IDCURSO').AsString+'  and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+' and Semana = '+ComboBox_SemanaImportar.Text);
            if VI_QtdRegistro > 0 then
            begin
               VI_Retorno:= Application.MessageBox('Já existe PTS para Turma na semana selecionada  '+#13+
                                                   'Confirma a Exportação ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
               if VI_Retorno = IDYes then
               begin
                  Funcoes.ExecusaoQuery(' Delete From Cad_PTS where IdCurso = ' +IBTable_PTS.FieldByName('IDCURSO').AsString+'  and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+' and Semana = '+ComboBox_SemanaImportar.Text);
                  VB_Gravar:= True
               end
               else
                  VB_Gravar:= False;
            end;

            if VB_Gravar = True then
            begin
               VS_Msg:= 'Exportação do PTS do Curso '+Funcoes.GetCodCurso+' da Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'/'+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+
                        ' para a Turma '+ComboBox_Importar.Text+' - Usuario: '+Funcoes.GetUsuario;
               Funcoes.GravaAcesso('Menu Principal - PTS', VS_Msg);

               IBTable_PTSImportar.Append;

               IBTable_PTSImportar.FieldByName('IDCURSO').AsString:= IBTable_PTS.FieldByName('IDCURSO').AsString;
               IBTable_PTSImportar.FieldByName('IDTURMA').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
               IBTable_PTSImportar.FieldByName('SEMANA').AsString:= ComboBox_SemanaImportar.Text;
               IBTable_PTSImportar.FieldByName('MSG').AsString:= IBTable_PTS.FieldByName('MSG').AsString;
               IBTable_PTSImportar.FieldByName('DATA_02').AsString:= IBTable_PTS.FieldByName('DATA_02').AsString;
               IBTable_PTSImportar.FieldByName('DIA_SEMANA_02').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_02').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_01_02').AsString:= IBTable_PTS.FieldByName('HORARIO_01_02').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_02_02').AsString:= IBTable_PTS.FieldByName('HORARIO_02_02').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_01_02').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_02').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_02_02').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_02').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_01_02').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_02').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_02_02').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_02').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_01_02').AsString:= IBTable_PTS.FieldByName('LOCAL_01_02').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_02_02').AsString:= IBTable_PTS.FieldByName('LOCAL_02_02').AsString;
               IBTable_PTSImportar.FieldByName('DATA_03').AsString:= IBTable_PTS.FieldByName('DATA_03').AsString;
               IBTable_PTSImportar.FieldByName('DIA_SEMANA_03').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_03').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_01_03').AsString:= IBTable_PTS.FieldByName('HORARIO_01_03').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_02_03').AsString:= IBTable_PTS.FieldByName('HORARIO_02_03').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_01_03').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_03').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_02_03').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_03').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_01_03').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_03').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_02_03').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_03').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_01_03').AsString:= IBTable_PTS.FieldByName('LOCAL_01_03').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_02_03').AsString:= IBTable_PTS.FieldByName('LOCAL_02_03').AsString;
               IBTable_PTSImportar.FieldByName('DATA_04').AsString:= IBTable_PTS.FieldByName('DATA_04').AsString;
               IBTable_PTSImportar.FieldByName('DIA_SEMANA_04').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_04').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_01_04').AsString:= IBTable_PTS.FieldByName('HORARIO_01_04').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_02_04').AsString:= IBTable_PTS.FieldByName('HORARIO_02_04').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_01_04').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_04').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_02_04').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_04').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_01_04').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_04').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_02_04').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_04').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_01_04').AsString:= IBTable_PTS.FieldByName('LOCAL_01_04').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_02_04').AsString:= IBTable_PTS.FieldByName('LOCAL_02_04').AsString;
               IBTable_PTSImportar.FieldByName('DATA_05').AsString:= IBTable_PTS.FieldByName('DATA_05').AsString;
               IBTable_PTSImportar.FieldByName('DIA_SEMANA_05').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_05').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_01_05').AsString:= IBTable_PTS.FieldByName('HORARIO_01_05').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_02_05').AsString:= IBTable_PTS.FieldByName('HORARIO_02_05').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_01_05').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_05').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_02_05').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_05').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_01_05').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_05').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_02_05').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_05').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_01_05').AsString:= IBTable_PTS.FieldByName('LOCAL_01_05').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_02_05').AsString:= IBTable_PTS.FieldByName('LOCAL_02_05').AsString;
               IBTable_PTSImportar.FieldByName('DAT A_06').AsString:= IBTable_PTS.FieldByName('DATA_06').AsString;
               IBTable_PTSImportar.FieldByName('DIA_SEMANA_06').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_06').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_01_06').AsString:= IBTable_PTS.FieldByName('HORARIO_01_06').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_02_06').AsString:= IBTable_PTS.FieldByName('HORARIO_02_06').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_01_06').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_06').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_02_06').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_06').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_01_06').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_06').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_02_06').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_06').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_01_06').AsString:= IBTable_PTS.FieldByName('LOCAL_01_06').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_02_06').AsString:= IBTable_PTS.FieldByName('LOCAL_02_06').AsString;
               IBTable_PTSImportar.Post;
               Funcoes.ExecutaTransacao;
               ShowMessage('Finalizada a Exportação...');
               JvCaptionPanel_ImporatPTS.Visible:= False;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Fecha a Janela de CAdastro
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton3Click(Sender: TObject);
begin
   IBTable_PTSImportar.Close;
   JvCaptionPanel_ImporatPTS.Visible:= False;
end;

//------------------------------------------------------------------------------
// Abre a janela para copiar o PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_ExportarPTSClick(Sender: TObject);
begin
   if (trim(ComboBox_Semana.Text) = '') then
      TratarSemanaNaoSelecionada
   else
   begin
      if IBTable_PTS.FieldByName('IdTurma').AsString = '' then
         ShowMessage('Não possuí PTS Cadastrado para esta semana...')
      else
      begin
         ComboBox_SemanaImportar.Text:= ComboBox_Semana.Text;
         IBTable_PTSImportar.Open;

         JvCaptionPanel_ImporatPTS.Visible:= True;
         Edit_TurmaOrigem.Text:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      end;
   end;
end;


//------------------------------------------------------------------------------
// Grava o PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.GravaPtsTmp;
begin
   IBTable_PTS_Tmp.Open;
   IBTable_PTS_Tmp.Append;

   IBTable_PTS_Tmp.FieldByName('IDCURSO').AsString:= IBTable_PTS.FieldByName('IDCURSO').AsString;
   IBTable_PTS_Tmp.FieldByName('IDTURMA').AsString:= IBTable_PTS.FieldByName('IDTURMA').AsString;
   IBTable_PTS_Tmp.FieldByName('SEMANA').AsString:= IBTable_PTS.FieldByName('SEMANA').AsString;
   IBTable_PTS_Tmp.FieldByName('IDCODIGO').AsString:= Funcoes.GetCodUsuario;
   IBTable_PTS_Tmp.FieldByName('DATA_ALTERACAO').AsString:= DateToStr(Date);
   IBTable_PTS_Tmp.FieldByName('HORA_ALTERACAO').AsString:= TimeToStr(Time);
   IBTable_PTS_Tmp.FieldByName('MSG').AsString:= IBTable_PTS.FieldByName('MSG').AsString;
   IBTable_PTS_Tmp.FieldByName('DATA_02').AsString:= IBTable_PTS.FieldByName('DATA_02').AsString;
   IBTable_PTS_Tmp.FieldByName('DIA_SEMANA_02').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_02').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_01_02').AsString:= IBTable_PTS.FieldByName('HORARIO_01_02').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_02_02').AsString:= IBTable_PTS.FieldByName('HORARIO_02_02').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_01_02').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_02').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_02_02').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_02').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_01_02').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_02').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_02_02').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_02').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_01_02').AsString:= IBTable_PTS.FieldByName('LOCAL_01_02').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_02_02').AsString:= IBTable_PTS.FieldByName('LOCAL_02_02').AsString;
   IBTable_PTS_Tmp.FieldByName('DATA_03').AsString:= IBTable_PTS.FieldByName('DATA_03').AsString;
   IBTable_PTS_Tmp.FieldByName('DIA_SEMANA_03').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_03').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_01_03').AsString:= IBTable_PTS.FieldByName('HORARIO_01_03').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_02_03').AsString:= IBTable_PTS.FieldByName('HORARIO_02_03').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_01_03').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_03').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_02_03').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_03').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_01_03').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_03').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_02_03').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_03').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_01_03').AsString:= IBTable_PTS.FieldByName('LOCAL_01_03').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_02_03').AsString:= IBTable_PTS.FieldByName('LOCAL_02_03').AsString;
   IBTable_PTS_Tmp.FieldByName('DATA_04').AsString:= IBTable_PTS.FieldByName('DATA_04').AsString;
   IBTable_PTS_Tmp.FieldByName('DIA_SEMANA_04').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_04').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_01_04').AsString:= IBTable_PTS.FieldByName('HORARIO_01_04').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_02_04').AsString:= IBTable_PTS.FieldByName('HORARIO_02_04').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_01_04').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_04').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_02_04').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_04').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_01_04').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_04').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_02_04').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_04').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_01_04').AsString:= IBTable_PTS.FieldByName('LOCAL_01_04').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_02_04').AsString:= IBTable_PTS.FieldByName('LOCAL_02_04').AsString;
   IBTable_PTS_Tmp.FieldByName('DATA_05').AsString:= IBTable_PTS.FieldByName('DATA_05').AsString;
   IBTable_PTS_Tmp.FieldByName('DIA_SEMANA_05').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_05').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_01_05').AsString:= IBTable_PTS.FieldByName('HORARIO_01_05').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_02_05').AsString:= IBTable_PTS.FieldByName('HORARIO_02_05').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_01_05').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_05').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_02_05').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_05').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_01_05').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_05').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_02_05').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_05').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_01_05').AsString:= IBTable_PTS.FieldByName('LOCAL_01_05').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_02_05').AsString:= IBTable_PTS.FieldByName('LOCAL_02_05').AsString;
   IBTable_PTS_Tmp.FieldByName('DATA_06').AsString:= IBTable_PTS.FieldByName('DATA_06').AsString;
   IBTable_PTS_Tmp.FieldByName('DIA_SEMANA_06').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_06').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_01_06').AsString:= IBTable_PTS.FieldByName('HORARIO_01_06').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_02_06').AsString:= IBTable_PTS.FieldByName('HORARIO_02_06').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_01_06').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_06').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_02_06').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_06').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_01_06').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_06').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_02_06').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_06').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_01_06').AsString:= IBTable_PTS.FieldByName('LOCAL_01_06').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_02_06').AsString:= IBTable_PTS.FieldByName('LOCAL_02_06').AsString;
   IBTable_PTS_Tmp.Post;
   Funcoes.ExecutaTransacao;
   IBTable_PTS_Tmp.Close;
end;

//------------------------------------------------------------------------------
//
// Tratamento do PDF
//
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Tartamento para Imprimir o arquivo PDF  Selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.PDF_SelecionadoClick(Sender: TObject);
var
   VS_Semana: String;
   Ano, Mes, Dia : word;
   buffer, VS_Pasta, VS_NomeArq, VS_IdCurso, VS_IdTurma: String;
begin
   if IBTable_PTS.FieldByName('HORARIO_01_02').AsString = '' then
       ShowMessage('Não foi preenchido o PTS...')
   else
   begin
      if (trim(ComboBox_Semana.Text) = '') then
         TratarSemanaNaoSelecionada
      else
      begin
         DecodeDate (JvDateEdit_Segunda.date, Ano, Mes, Dia);
         VS_Semana:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes);
         if IBTable_PTS.FieldByName('Data_02').AsString <> VS_Semana then
            Gravar_Pts;

         VS_NomeArq:= Funcoes.GetCodCurso+'_'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_'+ComboBox_Semana.Text;
         VS_NomeArq:= 'PTS_'+Funcoes.DePara(VS_NomeArq, '/', '_');

         VS_Pasta:= 'C:\Ensino\ArquivosPDF\'+VS_NomeArq;

         if not DirectoryExists(VS_Pasta) then
            ForceDirectories(VS_Pasta);

         VS_NomeArq:= VS_Pasta+'\'+VS_NomeArq;

         Form_Rel_PTS.QuickRep1.Prepare;
         ExportQR1.Report := Form_Rel_PTS.QuickRep1;
         ExportQR1.ExportQRPDF( VS_NomeArq , False);
         ShellExecute(Handle, nil, PChar(VS_NomeArq+'.pdf') , nil, nil, SW_SHOWNORMAL);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tartamento para Imprimit o arquivo PDF  Todos
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.PDF_TodosClick(Sender: TObject);
var
   Ano, Mes, Dia : word;
   buffer: String;
   VS_IdCurso, VS_IdTurma, VS_Pasta, VS_NomeArq, VS_Semana, VS_SemanaAtual: String;
   VI_SemanaAtual, UltimaSemana: Integer;
begin
   if IBTable_PTS.FieldByName('HORARIO_01_02').AsString = '' then
       ShowMessage('Não foi preenchido o PTS...')
   else
   begin
      if (trim(ComboBox_Semana.Text) = '') then
         TratarSemanaNaoSelecionada
      else
      begin
         if not DirectoryExists('C:\Ensino\ArquivosPDF') then
             ForceDirectories('C:\Ensino\ArquivosPDF');

         UltimaSemana:= StrToInt(Label_Semanas.Caption);
         VI_SemanaAtual:=  StrToInt(ComboBox_Semana.Text);
         VS_SemanaAtual:= ComboBox_Semana.Text;
         While VI_SemanaAtual <= UltimaSemana do
         begin
            ComboBox_Semana.Text:= IntToStr(VI_SemanaAtual);

            JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);

            DecodeDate (JvDateEdit_Segunda.date, Ano, Mes, Dia);
            VS_Semana:= FormatFloat('00',Dia)+'/'+FormatFloat('00',Mes);
            if IBTable_PTS.FieldByName('Data_02').AsString <> VS_Semana then
               Gravar_Pts;

            VS_NomeArq:= Funcoes.GetCodCurso+'_'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_'+ComboBox_Semana.Text;
            VS_NomeArq:= 'PTS_'+Funcoes.DePara(VS_NomeArq, '/', '_');

            VS_Pasta:= 'C:\Ensino\ArquivosPDF\'+VS_NomeArq;

            if not DirectoryExists(VS_Pasta) then
               ForceDirectories(VS_Pasta);

            VS_NomeArq:= VS_Pasta+'\'+VS_NomeArq;

            Form_Rel_PTS.QuickRep1.Prepare;
            ExportQR1.Report := Form_Rel_PTS.QuickRep1;
            ExportQR1.ExportQRPDF( VS_NomeArq , False);
            ShellExecute(Handle, nil, PChar(VS_NomeArq+'.pdf') , nil, nil, SW_SHOWNORMAL);

            VI_SemanaAtual:= VI_SemanaAtual+1;
         end;
         ComboBox_Semana.Text:= VS_SemanaAtual;
         JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
         JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
      end;
   end;
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Segunda_1Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 1, Panel_SegFeira.Top+3 );
end;


procedure TForm_Cad_PTS.IBTable_PTSPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
   Sender: TObject;
begin
   if ((E is EDBEngineError) and ((E as EDBEngineError).Errors[0].Errorcode = 9729)) then
   begin
      MessageDlg('  O PTS para período selecionado já foi Cadastrado...',mtError, [mbOk],0);
      JvTransparentButton_CancelarClick(Sender);
   end;
end;

procedure TForm_Cad_PTS.ComboBox_SalaAulaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      if ComboBox_SalaAula.Text = '' then
      begin
         IBTable_PTS.FieldByName('LOCAL_01_02').AsString:= '';
         IBTable_PTS.FieldByName('LOCAL_02_02').AsString:= '';
         IBTable_PTS.FieldByName('LOCAL_01_03').AsString:= '';
         IBTable_PTS.FieldByName('LOCAL_02_03').AsString:= '';
         IBTable_PTS.FieldByName('LOCAL_01_04').AsString:= '';
         IBTable_PTS.FieldByName('LOCAL_02_04').AsString:= '';
         IBTable_PTS.FieldByName('LOCAL_01_05').AsString:= '';
         IBTable_PTS.FieldByName('LOCAL_02_05').AsString:= '';
         IBTable_PTS.FieldByName('LOCAL_01_06').AsString:= '';
         IBTable_PTS.FieldByName('LOCAL_02_06').AsString:= '';
      end
      else
      begin
         IBTable_PTS.FieldByName('LOCAL_01_02').AsString:= IBTable_PTS.FieldByName('LOCAL_01_03').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('LOCAL_02_02').AsString:= IBTable_PTS.FieldByName('LOCAL_02_03').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('LOCAL_01_03').AsString:= IBTable_PTS.FieldByName('LOCAL_01_03').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('LOCAL_02_03').AsString:= IBTable_PTS.FieldByName('LOCAL_02_03').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('LOCAL_01_04').AsString:= IBTable_PTS.FieldByName('LOCAL_01_04').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('LOCAL_02_04').AsString:= IBTable_PTS.FieldByName('LOCAL_02_04').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('LOCAL_01_05').AsString:= IBTable_PTS.FieldByName('LOCAL_01_05').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('LOCAL_02_05').AsString:= IBTable_PTS.FieldByName('LOCAL_02_05').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('LOCAL_01_06').AsString:= IBTable_PTS.FieldByName('LOCAL_01_06').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('LOCAL_02_06').AsString:= IBTable_PTS.FieldByName('LOCAL_02_06').AsString+ComboBox_SalaAula.Text+#13;
      end;
   end;
end;

procedure TForm_Cad_PTS.ComboBox_InstrutorKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      if ComboBox_SalaAula.Text = '' then
      begin
         IBTable_PTS.FieldByName('EQUIPE_01_02').AsString:= '';
         IBTable_PTS.FieldByName('EQUIPE_02_02').AsString:= '';
         IBTable_PTS.FieldByName('EQUIPE_01_03').AsString:= '';
         IBTable_PTS.FieldByName('EQUIPE_02_03').AsString:= '';
         IBTable_PTS.FieldByName('EQUIPE_01_04').AsString:= '';
         IBTable_PTS.FieldByName('EQUIPE_02_04').AsString:= '';
         IBTable_PTS.FieldByName('EQUIPE_01_05').AsString:= '';
         IBTable_PTS.FieldByName('EQUIPE_02_05').AsString:= '';
         IBTable_PTS.FieldByName('EQUIPE_01_06').AsString:= '';
         IBTable_PTS.FieldByName('EQUIPE_02_06').AsString:= '';
      end
      else
      begin
         IBTable_PTS.FieldByName('EQUIPE_01_02').AsString:= IBTable_PTS.FieldByName('LOCAL_01_03').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('EQUIPE_02_02').AsString:= IBTable_PTS.FieldByName('LOCAL_02_03').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('EQUIPE_01_03').AsString:= IBTable_PTS.FieldByName('LOCAL_01_03').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('EQUIPE_02_03').AsString:= IBTable_PTS.FieldByName('LOCAL_02_03').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('EQUIPE_01_04').AsString:= IBTable_PTS.FieldByName('LOCAL_01_04').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('EQUIPE_02_04').AsString:= IBTable_PTS.FieldByName('LOCAL_02_04').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('EQUIPE_01_05').AsString:= IBTable_PTS.FieldByName('LOCAL_01_05').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('EQUIPE_02_05').AsString:= IBTable_PTS.FieldByName('LOCAL_02_05').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('EQUIPE_01_06').AsString:= IBTable_PTS.FieldByName('LOCAL_01_06').AsString+ComboBox_SalaAula.Text+#13;
         IBTable_PTS.FieldByName('EQUIPE_02_06').AsString:= IBTable_PTS.FieldByName('LOCAL_02_06').AsString+ComboBox_SalaAula.Text+#13;
      end;
   end;

end;

//------------------------------------------------------------------------------
// Tratamento do botao de consulta das alteracoes feitas no PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_AlteracaoClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Controle_Alteracoes_PTS, Form_Controle_Alteracoes_PTS);
   Form_Controle_Alteracoes_PTS.ShowModal;

   IBTable_PTS.Close;
   IBTable_PTS.Open;
end;

//------------------------------------------------------------------------------
// Tratamento para Imprimir quando clicar no Botao
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_ImprimirClick(Sender: TObject);
begin
   Imprimir_SelecionadoClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do tipo da turma
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.ComboBox_TipoTurmaChange(Sender: TObject);
var
   VB_Status: boolean;
   VS_TratarCurso: string;
begin
      TratarBotoes(True);

      IBTable_PTS.Close;

   VS_TratarCurso:= 'Cadastro';
   if ((ComboBox_TipoTurma.Text = 'Default-in') or (ComboBox_TipoTurma.Text = 'Default')) then
      VB_Status:= True
   else
      if ComboBox_TipoTurma.Text = 'Em Andamento' then
         VB_Status:= True
      else
         if ComboBox_TipoTurma.Text = 'Planejados' then
            VB_Status:= True
         else
            if ComboBox_TipoTurma.Text = 'Executados' then
               VB_Status:= False;

   Frame_SelCurso.TrataCurso(VS_TratarCurso, ComboBox_TipoTurma.Text);
   ComboBox_SemanaChange(Sender);
   JvTransparentButton_Alteracao.Visible:= VB_Status;
   JvTransparentButton_NovoPts.Visible:= VB_Status;
   JvTransparentButton_Grava.Visible:= VB_Status;
   JvTransparentButton_Cancelar.Visible:= VB_Status;
   Panel_GerenciaPTS.Visible:= VB_Status;

   ComboBox_Importar.Items.Clear;
   ComboBox_Importar.Text:= '';

   if Trim(IBQuery_PTS.FieldByName('IdTurma').AsString) = '' then
      IBTable_PTS.Close
   else
      IBTable_PTS.Open;

   TrataTurma(DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
   TrataSemanas;
end;

procedure TForm_Cad_PTS.TratarSemanaNaoSelecionada;
begin
   ShowMessage('Não foi selecionada semana...');
   ComboBox_Semana.SetFocus;
end;

//------------------------------------------------------------------------------
//
// Tratamento EAD
//
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Tratamento do Botao para inserir um novo PTS EAD
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_Inserir_EADClick(Sender: TObject);
begin
   if Trim(DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString) = '' then
   begin
      showMessage('Não foi selecionado a Turma...');
   end
   else
   begin
      TratarBotoes_EAD(False);
      VS_Opcao:= 'Inserção';
      IBTable_PTS_EAD.Append;
      IBTable_PTS_EAD.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
      IBTable_PTS_EAD.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      IBTable_PTS_EAD.FieldByName('Semana').AsString:= '';
      IBTable_PTS_EAD.FieldByName('Modulo').AsString:= '';
      IBTable_PTS_EAD.FieldByName('Local').AsString:= DM.IBTable_Configuracao.FieldByName('Sigla').AsString;

      VS_Msg_EAD:= '';
      DBComboBox_Semana_EAD.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para altera o PTS EAD selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_Alterar_EADClick(Sender: TObject);
begin
   if Trim(DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString) = '' then
   begin
      showMessage('Não foi selecionado a Turma...');
   end
   else
   begin
      TratarBotoes_EAD(False);
      VS_Opcao:= 'Alteração';
      IBTable_PTS_EAD.Edit;
      VS_Msg_EAD:= IBTable_PTS_EAD.FieldByName('MSG').AsString;
      DBComboBox_Semana_EAD.SetFocus;
   end;

end;

//------------------------------------------------------------------------------
// Tratamento do Botao para excluir o PTS EAD selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_Excluir_EADClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
    VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o PTS EAD selecionado '+#13+#13+'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

    if VI_Retorno = IDYes then
    begin
       IBTable_PTS_EAD.Delete;    // Exclui o arquivo
       Funcoes.ExecutaTransacao;
       Funcoes.AtualizaQuery(IBQuery_PTS_EAD);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para gravacao do PTS - EAD
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_Grava_EADClick(Sender: TObject);
begin
   if ((IBTable_PTS_EAD.State = DSInsert) or (IBTable_PTS_EAD.State = DSEdit )) then
   begin
      IBTable_PTS_EAD.Post;
      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery(IBQuery_PTS_EAD);
   end;
   TratarBotoes_EAD(True);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para cancelar a Inclusao/Alteracao PTS - EAD
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_Cancelar_EADClick(Sender: TObject);
begin
   if ((IBTable_PTS_EAD.State = DSInsert) or (IBTable_PTS_EAD.State = DSEdit )) then
   begin
      IBTable_PTS_EAD.Cancel;
      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery(IBQuery_PTS_EAD);
   end;
   TratarBotoes_EAD(True);
end;

procedure TForm_Cad_PTS.JvDBRichEdit_Msg_EADKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #4 then
       ComboBox_Equipe_EAD.Visible:= True;

   if key = #3 then
      JvDBRichEdit_Msg_EAD.Text:= JvDBRichEdit_Msg_EAD.Text+#13+'Coordenador: '+(DM.IBQuery_MontaTurma.FieldByName('Coordenador').AsString);
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao da Equipe  EAD
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.ComboBox_Equipe_EADChange(Sender: TObject);
begin
   if VS_Msg = '' then
      VS_Msg:= 'Equipe: '+ComboBox_Equipe_EAD.Text+' / '
   else
      VS_Msg:=  VS_Msg+ ComboBox_Equipe_EAD.Text+' / ';

   JvDBRichEdit_Msg_EAD.Lines.Clear;
   JvDBRichEdit_Msg_EAD.Lines.Add(VS_Msg+#13+VS_Coordenador);
   IBTable_PTS_EAD.FieldByName('MSG').AsString:= VS_Msg+#13+VS_Coordenador;

end;

procedure TForm_Cad_PTS.ComboBox_Equipe_EADKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #4 then
      ComboBox_Equipe_EAD.Visible:= False
end;

procedure TForm_Cad_PTS.ComboBox_Equipe_EADExit(Sender: TObject);
begin
   ComboBox_Equipe_EAD.Visible:= False
end;

procedure TForm_Cad_PTS.ComboBox_Equipe_EADClick(Sender: TObject);
begin
   if VS_Msg = '' then
      VS_Msg:= 'Equipe: '+ComboBox_Equipe_EAD.Text+' / '
   else
      VS_Msg:=  VS_Msg+ ComboBox_Equipe_EAD.Text+' / ';

   JvDBRichEdit_Msg_EAD.Lines.Clear;
   JvDBRichEdit_Msg_EAD.Lines.Add(VS_Msg+#13+VS_Coordenador);
   IBTable_PTS_EAD.FieldByName('MSG').AsString:= VS_Msg+#13+VS_Coordenador;

end;

//-------------------------------------------------------------------------------
// Tratamento de erro de duplicacao de registro do PTS EAD
//-------------------------------------------------------------------------------

procedure TForm_Cad_PTS.IBTable_PTS_EADPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
   Sender: TObject;
begin
   if ((E is EDBEngineError) and ((E as EDBEngineError).Errors[0].Errorcode = 9729)) then
     begin
        MessageDlg('O PTS EAD para período selecionado já foi Cadastrado...',mtError, [mbOk],0);
        JvTransparentButton_Cancelar_EADClick(Sender);
     end;
end;

//------------------------------------------------------------------------------
// Tratamento dos Botoes EAD
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.TratarBotoes_EAD(Status: Boolean);
begin
   Panel_Botoes.Enabled:= Status;
   Panel_SelecaoCurso.Enabled:= Status;

   JvTransparentButton_Inserir_EAD.Enabled:= Status;
   JvTransparentButton_Alterar_EAD.Enabled:= Status;
   JvTransparentButton_Excluir_EAD.Enabled:= Status;

   JvTransparentButton_Retornar_EAD.Enabled:= Status;
   JvTransparentButton_Windows_EAD.Enabled:= Status;
   JvTransparentButton_Imprime_EAD.Enabled:= Status;

   if Status = False then
      Status:= True
   else
      Status:= False;

   JvTransparentButton_Grava_EAD.Enabled:= Status;
   JvTransparentButton_Cancelar_EAD.Enabled:= Status;
   Panel_Cadastro.Visible:= Status;
end;

//-------------------------------------------------------------------------------
// Tratamento para imprimir a PTS EAD
//-------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_Imprime_EADClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Rel_PTS_EAD, Form_Rel_PTS_EAD);
   Form_Rel_PTS_EAD.QuickRep1.Preview;
   Form_Rel_PTS_EAD.Free;
end;

//-------------------------------------------------------------------------------
// Tratamento para imprimir a PTS EAD em PDF
//-------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_PDF_EADClick(Sender: TObject);
var
   VS_NomeArq, VS_Pasta: String;
begin
   Application.CreateForm(TForm_Rel_PTS_EAD, Form_Rel_PTS_EAD);

   VS_NomeArq:= Funcoes.GetCodCurso+'_'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_'+ComboBox_Semana.Text;
   VS_NomeArq:= 'PTS_EAD_'+Funcoes.DePara(VS_NomeArq, '/', '_');

   VS_Pasta:= 'C:\Ensino\ArquivosPDF\'+VS_NomeArq;

   if not DirectoryExists(VS_Pasta) then
      ForceDirectories(VS_Pasta);

   VS_NomeArq:= VS_Pasta+'\'+VS_NomeArq;

   Form_Rel_PTS_EAD.QuickRep1.Prepare;
   ExportQR1.Report := Form_Rel_PTS_EAD.QuickRep1;
   ExportQR1.ExportQRPDF(VS_NomeArq, False);
   ShellExecute(Handle, nil, PChar(VS_NomeArq+'.pdf') , nil, nil, SW_SHOWNORMAL);
end;

//-------------------------------------------------------------------------------
// Tratamento da opcao de selecao da semana
//-------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Tratar_Semana(Status: Boolean);
begin
   JvShape_Semana.Visible:= Status;
   Label_Semana.Visible:= Status;
   ComboBox_Semana.Visible:= Status;
   Label_Semana_Barra.Visible:= Status;
   Label_Semanas.Visible:= Status;
end;

//-------------------------------------------------------------------------------
// Tratamento quando entra na aba de tratamento do PTS EAD
//-------------------------------------------------------------------------------

procedure TForm_Cad_PTS.TabSheet_PTS_EADEnter(Sender: TObject);
begin
   Tratar_Semana(False);
end;

//-------------------------------------------------------------------------------
// Tratamento quando sai da a aba de tratamento do PTS EAD
//-------------------------------------------------------------------------------

procedure TForm_Cad_PTS.TabSheet_PTS_EADExit(Sender: TObject);
begin
   Tratar_Semana(True);
end;

//------------------------------------------------------------------------------
// Tratamento da segunda feira apartir de uma data da semana
//------------------------------------------------------------------------------

Function TForm_Cad_PTS.Tratar_Segunda(VD_Data: TDateTime): TDateTime;
var
   VI_DiaSemana: Integer;
begin
   if dayofweek(VD_Data) = 2 then
       VI_DiaSemana:= 0
   else
      VI_DiaSemana:= (dayofweek(VD_Data))-2;

   Tratar_Segunda:=  VD_Data-VI_DiaSemana;
end;

//------------------------------------------------------------------------------
// Tratamento para garantir que seja seomente numero
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.ComboBox_SemanaKeyPress(Sender: TObject; var Key: Char);
begin
    Funcoes.SomenteNumero(Sender, Key);
end;

//------------------------------------------------------------------------------
// Trata para Limpar a descricao da semana selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_Limpa_DescricaoClick(Sender: TObject);
begin
   if VI_Opcao = 0 then
      ShowMessage('Seleciona a lista de descrição da semana que deseja limpar...' )
   else
      if VI_Opcao = 1 then
         IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_02').AsString:= ''
      else
         if VI_Opcao = 2 then
            IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_02').AsString:= ''
         else
            if VI_Opcao = 3 then
               IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_03').AsString:= ''
            else
               if VI_Opcao = 4 then
                  IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_03').AsString:= ''
               else
                  if VI_Opcao = 5 then
                     IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_04').AsString:= ''
                  else
                     if VI_Opcao = 6 then
                        IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_04').AsString:= ''
                     else
                        if VI_Opcao = 7 then
                           IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_05').AsString:= ''
                        else
                           if VI_Opcao = 8 then
                              IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_05').AsString:= ''
                           else
                              if VI_Opcao = 9 then
                                 IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_06').AsString:= ''
                              else
                                 if VI_Opcao = 10 then
                                    IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_06').AsString:= '';
end;

//------------------------------------------------------------------------------
// Trata para Limpar o docente da semana selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_Limpa_DocenteClick(Sender: TObject);
begin
   if VI_Opcao = 0 then
      ShowMessage('Seleciona a lista de docente da semana que deseja limpar...' )
   else
      if VI_Opcao = 1 then
         IBTable_PTS.FieldByName('EQUIPE_01_02').AsString:= ''
      else
         if VI_Opcao = 2 then
            IBTable_PTS.FieldByName('EQUIPE_02_02').AsString:= ''
         else
            if VI_Opcao = 3 then
               IBTable_PTS.FieldByName('EQUIPE_01_03').AsString:= ''
            else
               if VI_Opcao = 4 then
                  IBTable_PTS.FieldByName('EQUIPE_02_03').AsString:= ''
               else
                  if VI_Opcao = 5 then
                     IBTable_PTS.FieldByName('EQUIPE_01_04').AsString:= ''
                  else
                     if VI_Opcao = 6 then
                        IBTable_PTS.FieldByName('EQUIPE_02_04').AsString:= ''
                     else
                        if VI_Opcao = 7 then
                           IBTable_PTS.FieldByName('EQUIPE_01_05').AsString:= ''
                        else
                           if VI_Opcao = 8 then
                              IBTable_PTS.FieldByName('EQUIPE_02_05').AsString:= ''
                           else
                              if VI_Opcao = 9 then
                                 IBTable_PTS.FieldByName('EQUIPE_01_06').AsString:= ''
                              else
                                 if VI_Opcao = 10 then
                                    IBTable_PTS.FieldByName('EQUIPE_02_06').AsString:= '';

end;

//------------------------------------------------------------------------------
// Trata para Limpar Local utilizado pela turma na semana selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_Limpa_LocalClick(Sender: TObject);
begin
   if VI_Opcao = 0 then
      ShowMessage('Seleciona a lista do local da semana que deseja limpar...' )
   else
      if VI_Opcao = 1 then
         IBTable_PTS.FieldByName('LOCAL_01_02').AsString:= ''
      else
         if VI_Opcao = 2 then
            IBTable_PTS.FieldByName('LOCAL_02_02').AsString:= ''
         else
            if VI_Opcao = 3 then
               IBTable_PTS.FieldByName('LOCAL_01_03').AsString:= ''
            else
               if VI_Opcao = 4 then
                  IBTable_PTS.FieldByName('LOCAL_02_03').AsString:= ''
               else
                  if VI_Opcao = 5 then
                     IBTable_PTS.FieldByName('LOCAL_01_04').AsString:= ''
                  else
                     if VI_Opcao = 6 then
                        IBTable_PTS.FieldByName('LOCAL_02_04').AsString:= ''
                     else
                        if VI_Opcao = 7 then
                           IBTable_PTS.FieldByName('LOCAL_01_05').AsString:= ''
                        else
                           if VI_Opcao = 8 then
                              IBTable_PTS.FieldByName('LOCAL_02_05').AsString:= ''
                           else
                              if VI_Opcao = 9 then
                                 IBTable_PTS.FieldByName('LOCAL_01_06').AsString:= ''
                              else
                                 if VI_Opcao = 10 then
                                    IBTable_PTS.FieldByName('LOCAL_02_06').AsString:= '';
end;

procedure TForm_Cad_PTS.ZerarOpcao(Sender: TObject);
begin
   VI_Opcao:= 0;
end;

procedure TForm_Cad_PTS.IBQuery_PTSAfterScroll(DataSet: TDataSet);
begin
   if Trim(IBQuery_PTS.FieldByName('IdTurma').AsString) = '' then
      IBTable_PTS.Close
   else
      IBTable_PTS.Open;

   TrataTurma(DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
//   TrataSemanas;

end;

end.
