//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SGEW                                      //
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
// DATA                      : 16/04/2021                                     //
// AUTOR                     : Osvaldir D Ramos                               //
// MOTIVO                    : Criação do smodulos para geração do PTS em     //
//                             planilha Excel ou BROffice                     //
//                             Desenvolvimento dos Modulos:                   //
//                         Planilha_Selecionado(Planilha: String);            //
//                         Planilha_Todos(Planilha: String);                  //
//                         Planilha_Unico(Planilha: String);                  //
//                         MontarArquivoOpenOffice;                           //
//                         MontarArquivoExcel;                                //
//----------------------------------------------------------------------------//


unit Cad_PTS;

interface

uses
  DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit, ComObj,
  ExportPack, DB, JvComponent, JvCaptionPanel, JvEnterTab, JvRichEd,
  JvDBRichEd, Forms, JvxCtrls, Controls, JvCheckBox, JvLookOut, JvGradient,
  JvTransBtn, JvShape, Classes, Rotinas_TrataData,
   JvArrow,  Windows, Messages, SysUtils, Graphics, Dialogs;

Const

// 1° 08:00/08:50
// 2° 08:50/09:40
// 3° 10:00/10:50
// 4° 10:50/11:40
// 5° 13:00/13:50
// 6° 13:50/14:40
// 7° 15:00/15:50
// 8° 15:50/16:40

   Periodo_Manha= '08:00/08:50'+#13+'08:50/09:40'+#13+'10:00/10:50'+#13+'10:50/11:40';
   Periodo_Tarde= '13:00/13:50'+#13+'13:50/14:40'+#13+'15:00/15:50'+#13+'15:50/16:40';

//   Periodo_Manha= '08:00/08:45'+#13+'08:55/09:40'+#13+'09:50/10:35'+#13+'10:45/11:30';
//   Periodo_Tarde= '13:00/13:45'+#13+'13:55/14:40'+#13+'14:50/15:35'+#13+'15:45/16:30';

   VS_Pasta= 'C:\Ensino\PTS_BDF\';
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
    Panel_Cabecalho: TPanel;
    Panel_SelecaoCurso: TPanel;
    ScrollBox_PTS: TScrollBox;
    Panel_QuaFeira: TPanel;
    Panel_4: TPanel;
    Panel_Quarta: TPanel;
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
    Panel_Sexta: TPanel;
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
    Panel_Quinta: TPanel;
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
    Panel_Terca: TPanel;
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
    Panel_Segunda: TPanel;
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
    JvShape_Imprimir_EAD: TJvShape;
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
    DBEdit_Periodo: TDBEdit;
    DBComboBox_Disciplina: TDBComboBox;
    DBComboBox_Tutor: TDBComboBox;
    DBComboBox_Carga: TDBComboBox;
    DBEdit_CodPud: TDBEdit;
    DBEdit_Local: TDBEdit;
    IBQuery_PTS_EAD: TIBQuery;
    DSQ_PTS_EAD: TDataSource;
    DST_PTS_EAD: TDataSource;
    IBTable_PTS_EAD: TIBTable;
    JvShape_PDF_EAD: TJvShape;
    JvTransparentButton_PDF_EAD: TJvTransparentButton;
    Shape_Semana_02: TShape;
    Label1: TLabel;
    JvDateEdit_Segunda: TJvDateEdit;
    Shape_Semana_03: TShape;
    Shape_Semana_04: TShape;
    Shape_Semana_05: TShape;
    Shape_Semana_06: TShape;
    Label_SextaFeira: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label_Segunda: TLabel;
    IBTable_PTSMSG: TIBStringField;
    JvCaptionPanel_ImportaPTS: TJvCaptionPanel;
    Label8: TLabel;
    JvExpressButton_GravarExportarPara: TJvExpressButton;
    JvExpressButton_Exportacao: TJvExpressButton;
    Label11: TLabel;
    DBRichEdit_Editor_Demo_00: TJvDBRichEdit;
    ComboBox_Importar: TComboBox;
    Edit_TurmaOrigem: TEdit;
    JvShape9: TJvShape;
    JvTransparentButton_Alteracao: TJvTransparentButton;
    JvShape_Imprimir: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvShape_PDF: TJvShape;
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
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    IBQuery_PTS: TIBQuery;
    DSQ_PTS: TDataSource;
    IBQuery_PTSIDCURSO: TSmallintField;
    IBQuery_PTSIDTURMA: TIntegerField;
    IBQuery_PTSSEMANA: TSmallintField;
    IBQuery_PTSDATA_02: TIBStringField;
    IBQuery_PTSDIA_SEMANA_02: TIBStringField;
    IBQuery_PTSHORARIO_01_02: TIBStringField;
    IBQuery_PTSHORARIO_02_02: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_02: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_02: TIBStringField;
    IBQuery_PTSEQUIPE_01_02: TIBStringField;
    IBQuery_PTSEQUIPE_02_02: TIBStringField;
    IBQuery_PTSLOCAL_01_02: TIBStringField;
    IBQuery_PTSLOCAL_02_02: TIBStringField;
    IBQuery_PTSDATA_03: TIBStringField;
    IBQuery_PTSDIA_SEMANA_03: TIBStringField;
    IBQuery_PTSHORARIO_01_03: TIBStringField;
    IBQuery_PTSHORARIO_02_03: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_03: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_03: TIBStringField;
    IBQuery_PTSEQUIPE_01_03: TIBStringField;
    IBQuery_PTSEQUIPE_02_03: TIBStringField;
    IBQuery_PTSLOCAL_01_03: TIBStringField;
    IBQuery_PTSLOCAL_02_03: TIBStringField;
    IBQuery_PTSDATA_04: TIBStringField;
    IBQuery_PTSDIA_SEMANA_04: TIBStringField;
    IBQuery_PTSHORARIO_01_04: TIBStringField;
    IBQuery_PTSHORARIO_02_04: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_04: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_04: TIBStringField;
    IBQuery_PTSEQUIPE_01_04: TIBStringField;
    IBQuery_PTSEQUIPE_02_04: TIBStringField;
    IBQuery_PTSLOCAL_01_04: TIBStringField;
    IBQuery_PTSLOCAL_02_04: TIBStringField;
    IBQuery_PTSDATA_05: TIBStringField;
    IBQuery_PTSDIA_SEMANA_05: TIBStringField;
    IBQuery_PTSHORARIO_01_05: TIBStringField;
    IBQuery_PTSHORARIO_02_05: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_05: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_05: TIBStringField;
    IBQuery_PTSEQUIPE_01_05: TIBStringField;
    IBQuery_PTSEQUIPE_02_05: TIBStringField;
    IBQuery_PTSLOCAL_01_05: TIBStringField;
    IBQuery_PTSLOCAL_02_05: TIBStringField;
    IBQuery_PTSDATA_06: TIBStringField;
    IBQuery_PTSDIA_SEMANA_06: TIBStringField;
    IBQuery_PTSHORARIO_01_06: TIBStringField;
    IBQuery_PTSHORARIO_02_06: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_06: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_06: TIBStringField;
    IBQuery_PTSEQUIPE_01_06: TIBStringField;
    IBQuery_PTSEQUIPE_02_06: TIBStringField;
    IBQuery_PTSLOCAL_01_06: TIBStringField;
    IBQuery_PTSLOCAL_02_06: TIBStringField;
    IBQuery_PTSMSG: TIBStringField;
    PDF_Unico: TMenuItem;
    Panel3: TPanel;
    JvCheckBox_Vizualizar: TJvCheckBox;
    Impressonica1: TMenuItem;
    DBEdit_Semana: TDBEdit;
    DBEdit_Modulo: TDBEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    IBQuery_PTSCRIACAO: TDateTimeField;
    IBQuery_PTSRESPONSAVEL: TIBStringField;
    IBTable_PTSCRIACAO: TDateTimeField;
    IBTable_PTSRESPONSAVEL: TIBStringField;
    IBTable_PTS_TmpCRIACAO: TDateTimeField;
    IBTable_PTS_TmpRESPONSAVEL: TIBStringField;
    IBTable_PTSImportarCRIACAO: TDateTimeField;
    IBTable_PTSImportarRESPONSAVEL: TIBStringField;
    Panel4: TPanel;
    Label6: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    JvShape1: TJvShape;
    DBNavigator_EAD: TDBNavigator;
    DBText1: TDBText;
    IBTable_PTS_EAD_Importar: TIBTable;
    Panel13: TPanel;
    JvGradient1: TJvGradient;
    Shape3: TShape;
    JvExpressButton_Exportar_EAD: TJvExpressButton;
    IBQuery_PTS_EADIDCURSO: TSmallintField;
    IBQuery_PTS_EADIDTURMA: TIntegerField;
    IBQuery_PTS_EADINDICE: TSmallintField;
    IBQuery_PTS_EADSEMANA: TIBStringField;
    IBQuery_PTS_EADMODULO: TIBStringField;
    IBQuery_PTS_EADDISCIPLINA: TIBStringField;
    IBQuery_PTS_EADPERIODO: TIBStringField;
    IBQuery_PTS_EADTUTOR: TIBStringField;
    IBQuery_PTS_EADMSG: TIBStringField;
    IBQuery_PTS_EADCARGAHORARIA: TIBStringField;
    IBQuery_PTS_EADCODPUD: TIBStringField;
    IBQuery_PTS_EADLOCAL: TIBStringField;
    IBQuery_PTS_EADCRIACAO: TDateTimeField;
    IBQuery_PTS_EADRESPONSAVEL: TIBStringField;
    IBTable_PTS_EADIDCURSO: TSmallintField;
    IBTable_PTS_EADIDTURMA: TIntegerField;
    IBTable_PTS_EADINDICE: TSmallintField;
    IBTable_PTS_EADSEMANA: TIBStringField;
    IBTable_PTS_EADMODULO: TIBStringField;
    IBTable_PTS_EADDISCIPLINA: TIBStringField;
    IBTable_PTS_EADPERIODO: TIBStringField;
    IBTable_PTS_EADTUTOR: TIBStringField;
    IBTable_PTS_EADMSG: TIBStringField;
    IBTable_PTS_EADCARGAHORARIA: TIBStringField;
    IBTable_PTS_EADCODPUD: TIBStringField;
    IBTable_PTS_EADLOCAL: TIBStringField;
    IBTable_PTS_EADCRIACAO: TDateTimeField;
    IBTable_PTS_EADRESPONSAVEL: TIBStringField;
    IBTable_PTS_EAD_ImportarIDCURSO: TSmallintField;
    IBTable_PTS_EAD_ImportarIDTURMA: TIntegerField;
    IBTable_PTS_EAD_ImportarINDICE: TSmallintField;
    IBTable_PTS_EAD_ImportarSEMANA: TIBStringField;
    IBTable_PTS_EAD_ImportarMODULO: TIBStringField;
    IBTable_PTS_EAD_ImportarDISCIPLINA: TIBStringField;
    IBTable_PTS_EAD_ImportarPERIODO: TIBStringField;
    IBTable_PTS_EAD_ImportarTUTOR: TIBStringField;
    IBTable_PTS_EAD_ImportarMSG: TIBStringField;
    IBTable_PTS_EAD_ImportarCARGAHORARIA: TIBStringField;
    IBTable_PTS_EAD_ImportarCODPUD: TIBStringField;
    IBTable_PTS_EAD_ImportarLOCAL: TIBStringField;
    IBTable_PTS_EAD_ImportarCRIACAO: TDateTimeField;
    IBTable_PTS_EAD_ImportarRESPONSAVEL: TIBStringField;
    DBGrid_PTS_EAD: TDBGrid;
    JvCaptionPanel_ImporatPTS_EAD: TJvCaptionPanel;
    Label13: TLabel;
    JvExpressButton_GravarExportarPara_EAD: TJvExpressButton;
    JvExpressButton_Cancelar_Exportar_PTS_EAD: TJvExpressButton;
    Label14: TLabel;
    JvDBRichEdit1: TJvDBRichEdit;
    ComboBox_Importar_EAD: TComboBox;
    Edit_Origem_EAD: TEdit;
    JvShape3: TJvShape;
    JvTransparentButton1: TJvTransparentButton;
    PopupMenu_Excel: TPopupMenu;
    Excel_Selecionado: TMenuItem;
    Excel_Todos: TMenuItem;
    Excel1: TMenuItem;
    BROffice1: TMenuItem;
    BROffice_Selecionado: TMenuItem;
    BROfficeTodos: TMenuItem;
    N2: TMenuItem;
    IBTable_PTSDATA_07: TIBStringField;
    IBTable_PTSDIA_SEMANA_07: TIBStringField;
    IBTable_PTSHORARIO_01_07: TIBStringField;
    IBTable_PTSHORARIO_02_07: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_01_07: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_02_07: TIBStringField;
    IBTable_PTSEQUIPE_01_07: TIBStringField;
    IBTable_PTSEQUIPE_02_07: TIBStringField;
    IBTable_PTSLOCAL_01_07: TIBStringField;
    IBTable_PTSLOCAL_02_07: TIBStringField;
    IBTable_PTSDATA_08: TIBStringField;
    IBTable_PTSDIA_SEMANA_08: TIBStringField;
    IBTable_PTSHORARIO_01_08: TIBStringField;
    IBTable_PTSHORARIO_02_08: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_01_08: TIBStringField;
    IBTable_PTSTRAB_ESCOLAR_02_08: TIBStringField;
    IBTable_PTSEQUIPE_01_08: TIBStringField;
    IBTable_PTSEQUIPE_02_08: TIBStringField;
    IBTable_PTSLOCAL_01_08: TIBStringField;
    IBTable_PTSLOCAL_02_08: TIBStringField;
    IBQuery_PTSDATA_07: TIBStringField;
    IBQuery_PTSDIA_SEMANA_07: TIBStringField;
    IBQuery_PTSHORARIO_01_07: TIBStringField;
    IBQuery_PTSHORARIO_02_07: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_07: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_07: TIBStringField;
    IBQuery_PTSEQUIPE_01_07: TIBStringField;
    IBQuery_PTSEQUIPE_02_07: TIBStringField;
    IBQuery_PTSLOCAL_01_07: TIBStringField;
    IBQuery_PTSLOCAL_02_07: TIBStringField;
    IBQuery_PTSDATA_08: TIBStringField;
    IBQuery_PTSDIA_SEMANA_08: TIBStringField;
    IBQuery_PTSHORARIO_01_08: TIBStringField;
    IBQuery_PTSHORARIO_02_08: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_08: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_08: TIBStringField;
    IBQuery_PTSEQUIPE_01_08: TIBStringField;
    IBQuery_PTSEQUIPE_02_08: TIBStringField;
    IBQuery_PTSLOCAL_01_08: TIBStringField;
    IBQuery_PTSLOCAL_02_08: TIBStringField;
    IBTable_PTS_TmpDATA_07: TIBStringField;
    IBTable_PTS_TmpDIA_SEMANA_07: TIBStringField;
    IBTable_PTS_TmpHORARIO_01_07: TIBStringField;
    IBTable_PTS_TmpHORARIO_02_07: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_01_07: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_02_07: TIBStringField;
    IBTable_PTS_TmpEQUIPE_01_07: TIBStringField;
    IBTable_PTS_TmpEQUIPE_02_07: TIBStringField;
    IBTable_PTS_TmpLOCAL_01_07: TIBStringField;
    IBTable_PTS_TmpLOCAL_02_07: TIBStringField;
    IBTable_PTS_TmpDATA_08: TIBStringField;
    IBTable_PTS_TmpDIA_SEMANA_08: TIBStringField;
    IBTable_PTS_TmpHORARIO_01_08: TIBStringField;
    IBTable_PTS_TmpHORARIO_02_08: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_01_08: TIBStringField;
    IBTable_PTS_TmpTRAB_ESCOLAR_02_08: TIBStringField;
    IBTable_PTS_TmpEQUIPE_01_08: TIBStringField;
    IBTable_PTS_TmpEQUIPE_02_08: TIBStringField;
    IBTable_PTS_TmpLOCAL_01_08: TIBStringField;
    IBTable_PTS_TmpLOCAL_02_08: TIBStringField;
    IBTable_PTSImportarDATA_07: TIBStringField;
    IBTable_PTSImportarDIA_SEMANA_07: TIBStringField;
    IBTable_PTSImportarHORARIO_01_07: TIBStringField;
    IBTable_PTSImportarHORARIO_02_07: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_01_07: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_02_07: TIBStringField;
    IBTable_PTSImportarEQUIPE_01_07: TIBStringField;
    IBTable_PTSImportarEQUIPE_02_07: TIBStringField;
    IBTable_PTSImportarLOCAL_01_07: TIBStringField;
    IBTable_PTSImportarLOCAL_02_07: TIBStringField;
    IBTable_PTSImportarDATA_08: TIBStringField;
    IBTable_PTSImportarDIA_SEMANA_08: TIBStringField;
    IBTable_PTSImportarHORARIO_01_08: TIBStringField;
    IBTable_PTSImportarHORARIO_02_08: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_01_08: TIBStringField;
    IBTable_PTSImportarTRAB_ESCOLAR_02_08: TIBStringField;
    IBTable_PTSImportarEQUIPE_01_08: TIBStringField;
    IBTable_PTSImportarEQUIPE_02_08: TIBStringField;
    IBTable_PTSImportarLOCAL_01_08: TIBStringField;
    IBTable_PTSImportarLOCAL_02_08: TIBStringField;
    Panel_Sabado: TPanel;
    Panel2: TPanel;
    Panel12: TPanel;
    JvDBRichEdit_HORARIO_02_07: TJvDBRichEdit;
    JvDBRichEdit_Trab_Sabado_2: TJvDBRichEdit;
    JJvDBRichEdit_Doc_Sabado_2: TJvDBRichEdit;
    JvDBRichEdit_Loc_Sabado_2_7: TJvDBRichEdit;
    Panel15: TPanel;
    JvDBRichEdit_Loc_Sabado_1_7: TJvDBRichEdit;
    JvDBRichEdit_Doc_Sabado_1: TJvDBRichEdit;
    JvDBRichEdit_Trab_Sabado_1: TJvDBRichEdit;
    JvDBRichEdit_HORARIO_01_07: TJvDBRichEdit;
    Panel17: TPanel;
    Shape_Semana_07: TShape;
    Label_Sabado: TLabel;
    Panel_Domingo: TPanel;
    Panel18: TPanel;
    Panel20: TPanel;
    JvDBRichEdit_HORARIO_02_08: TJvDBRichEdit;
    JvDBRichEdit_TRAB_ESCOLAR_02_08: TJvDBRichEdit;
    JvDBRichEdit_EQUIPE_02_08: TJvDBRichEdit;
    JvDBRichEdit_LOCAL_02_08: TJvDBRichEdit;
    Panel22: TPanel;
    JvDBRichEdit_LOCAL_01_08: TJvDBRichEdit;
    JvDBRichEdit_EQUIPE_01_08: TJvDBRichEdit;
    JvDBRichEdit_TRAB_ESCOLAR_01_08: TJvDBRichEdit;
    JvDBRichEdit_HORARIO_01_08: TJvDBRichEdit;
    Panel23: TPanel;
    Shape_Semana_08: TShape;
    Label_Domingo: TLabel;
    JvDateEdit_Domingo: TJvDateEdit;
    JvDateEdit_Terca: TJvDateEdit;
    JvDateEdit_Quarta: TJvDateEdit;
    JvDateEdit_Quinta: TJvDateEdit;
    JvDateEdit_Sexta: TJvDateEdit;
    JvDateEdit_Sabado: TJvDateEdit;
    IBTable_CadPTS: TIBTable;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    SmallintField2: TSmallintField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    IBStringField20: TIBStringField;
    IBStringField21: TIBStringField;
    IBStringField22: TIBStringField;
    IBStringField23: TIBStringField;
    IBStringField24: TIBStringField;
    IBStringField25: TIBStringField;
    IBStringField26: TIBStringField;
    IBStringField27: TIBStringField;
    IBStringField28: TIBStringField;
    IBStringField29: TIBStringField;
    IBStringField30: TIBStringField;
    IBStringField31: TIBStringField;
    IBStringField32: TIBStringField;
    IBStringField33: TIBStringField;
    IBStringField34: TIBStringField;
    IBStringField35: TIBStringField;
    IBStringField36: TIBStringField;
    IBStringField37: TIBStringField;
    IBStringField38: TIBStringField;
    IBStringField39: TIBStringField;
    IBStringField40: TIBStringField;
    IBStringField41: TIBStringField;
    IBStringField42: TIBStringField;
    IBStringField43: TIBStringField;
    IBStringField44: TIBStringField;
    IBStringField45: TIBStringField;
    IBStringField46: TIBStringField;
    IBStringField47: TIBStringField;
    IBStringField48: TIBStringField;
    IBStringField49: TIBStringField;
    IBStringField50: TIBStringField;
    IBStringField51: TIBStringField;
    DateTimeField1: TDateTimeField;
    IBStringField52: TIBStringField;
    IBStringField53: TIBStringField;
    IBStringField54: TIBStringField;
    IBStringField55: TIBStringField;
    IBStringField56: TIBStringField;
    IBStringField57: TIBStringField;
    IBStringField58: TIBStringField;
    IBStringField59: TIBStringField;
    IBStringField60: TIBStringField;
    IBStringField61: TIBStringField;
    IBStringField62: TIBStringField;
    IBStringField63: TIBStringField;
    IBStringField64: TIBStringField;
    IBStringField65: TIBStringField;
    IBStringField66: TIBStringField;
    IBStringField67: TIBStringField;
    IBStringField68: TIBStringField;
    IBStringField69: TIBStringField;
    IBStringField70: TIBStringField;
    IBStringField71: TIBStringField;
    IBStringField72: TIBStringField;
    IBQuery1: TIBQuery;
    Shape4: TShape;
    Panel_Filtro: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    JvShapeLimpa_Descricao: TJvShape;
    JvShape_Limpa_Docente: TJvShape;
    JvShape_Limpa_Local: TJvShape;
    JvxLabel3: TJvxLabel;
    JvxLabel4: TJvxLabel;
    JvxLabel2: TJvxLabel;
    JvxLabel1: TJvxLabel;
    JvxLabel5: TJvxLabel;
    JvExpressButton_Limpa_Docente: TJvExpressButton;
    JvExpressButton_Limpa_Local: TJvExpressButton;
    JvExpressButton_Limpa_Descricao: TJvExpressButton;
    JvExpressButton_AtualizarrHora: TJvExpressButton;
    ComboBox_Instrutor: TComboBox;
    ComboBox_SalaAula: TComboBox;
    ComboBox_disciplinas: TComboBox;
    Panel_TrataBase: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit_Criacao: TDBEdit;
    DBEdit_Responsavel: TDBEdit;

    procedure Apresentar_Data_Formulario;
    procedure TratamentoData;

    procedure Trata_Opcoes(Top: Integer);

    procedure Planilha_Selecionado(Planilha: String);
    procedure Planilha_Todos(Planilha: String);
    procedure Planilha_Unico(Planilha: String);

    procedure MontarArquivoOpenOffice;
    procedure MontarArquivoExcel;

    procedure MontaRelacaoTurmaImportar;

    procedure SelecionaPTS;

    procedure ZerarOpcao(Sender: TObject);
    procedure Gravar_Pts;
    Function  Tratar_Segunda(VD_Data: TDateTime): TDateTime;
    procedure Tratar_Msg_Feriado(Shape: TShape; PS_Msg: String; Cor: TColor);
    procedure Tratar_Semana(Status: Boolean);

    procedure Tratar_PTS_EAD(OrderByEAD: String);
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
    procedure JvExpressButton_ExportacaoClick(Sender: TObject);
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
    procedure PDF_UnicoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Impressonica1Click(Sender: TObject);
    procedure DBGrid_PTS_EADTitleClick(Column: TColumn);
    procedure JvExpressButton_GravarExportarPara_EADClick(Sender: TObject);
    procedure JvExpressButton_Cancelar_Exportar_PTS_EADClick(Sender: TObject);
    procedure JvExpressButton_Exportar_EADClick(Sender: TObject);
    procedure JvExpressButton_AtualizarrHoraClick(Sender: TObject);
    procedure Excel_SelecionadoClick(Sender: TObject);
    procedure Excel_TodosClick(Sender: TObject);
    procedure BROffice_SelecionadoClick(Sender: TObject);
    procedure BROfficeTodosClick(Sender: TObject);
    procedure IBTable_PTSAfterScroll(DataSet: TDataSet);
    procedure JvDateEdit_SegundaExit(Sender: TObject);
    procedure JvDateEdit_SegundaChange(Sender: TObject);

  private    { Private declarations }
     VS_IdCurso_Sel, VS_IdTurma_Sel, VS_Coordenador, VS_Msg, VS_Msg_EAD, VS_Opcao, OrderByEAD: String;
     VI_Opcao: Integer;

     VB_Tratar_Segunda: Boolean;

     VD_Segunda: TDateTime;
  public    { Public declarations }
  end;

var
  Form_Cad_PTS: TForm_Cad_PTS;

implementation

uses Module, Frame_Sel_Curso, Rel_ProgramaDeTrabalhoSemanal,
  Sel_ResponsavelAssinaturaRelatorio, Controle_Alteracoes_PTS, Rel_PTS_EAD;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento na criacao do Form
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.FormCreate(Sender: TObject);
begin
   SetWindowLong(Application.Handle,GWL_EXSTYLE,
   GetWindowLong(Application.Handle, GWL_EXSTYLE)
   or WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
end;

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.FormActivate(Sender: TObject);
var
    Status: Boolean;
begin
   if ((Funcoes.GetCadCurso = 'MenuPrincipal') or (Funcoes.GetCadCurso = 'SelTurma')) then
   begin
      OrderByEAD:= ' Order By Indice ';

      JvExpressButton_AtualizarrHora.Visible:= False;
      JvCaptionPanel_ImportaPTS.Visible:= False;
      JvCaptionPanel_ImporatPTS_EAD.Visible:= False;

//      Trata_Opcoes(25);
      VB_Tratar_Segunda:= False;
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

//      JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
      ComboBox_Equipe.Visible:= False;

      IBTable_PTS.Open;
      IBTable_PTS_EAD.Open;

      PageControl_PTS.TabIndex:= 0;

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_Cad_PTS.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Cadastro', ComboBox_TipoTurma.Text);

      Funcoes.SetCadCurso('CadCurso');
      TrataSemanas;
      Tratar_PTS_EAD(OrderByEAD);

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
   end;

   if DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString = 'Presencial' then
   begin
      TabSheet_PTS_EAD.TabVisible:= False;
   end
   else
   begin
      TabSheet_PTS_EAD.TabVisible:= True;
      Tratar_PTS_EAD(OrderByEAD);
      TratarBotoes_EAD(True);
   end;

   TabSheet_PTS.Caption:= 'Plano de Trabalho  Semanal - PTS ( - Curso: '+Funcoes.GetCodCurso+' )';
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
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao do PTS EAD
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Tratar_PTS_EAD(OrderByEAD: String);
begin
   if ((DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'Presencial') and (DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger <> 0)) then
   begin
      IBQuery_PTS_EAD.Close;
      IBQuery_PTS_EAD.Sql.Clear;
      IBQuery_PTS_EAD.Sql.Add('Select * '+
                              ' From CAD_PTS_DISTANCIA '+
                              ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                              ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                              OrderByEAD
                             );
      IBQuery_PTS_EAD.Open;
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
begin
   if DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString = '' then
   begin
      VI_SemIni:= 0;
      VI_SemAtual:= 0;

      JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
      JvDateEdit_Terca.Date:= JvDateEdit_Segunda.Date+1;
      JvDateEdit_Quarta.Date:= JvDateEdit_Segunda.Date+2;
      JvDateEdit_Quinta.Date:= JvDateEdit_Segunda.Date+3;
      JvDateEdit_Sexta.Date:= JvDateEdit_Segunda.Date+4;
      JvDateEdit_Sabado.Date:= JvDateEdit_Segunda.Date+5;
      JvDateEdit_Domingo.Date:= JvDateEdit_Segunda.Date+6;

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
      VI_Semanas:= Round(Vi_Semanas/7);

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
//      JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);

      While i <= VI_Semanas do
      begin
         ComboBox_SemanaImportar.Items.Add(IntToStr(i));
         ComboBox_Semana.Items.Add(IntToStr(i));
         i:= i+1;
      end;

//      JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
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
{   if PS_data <> '  /  ' then
   begin
      Funcoes.OpenQuery('Select * From Cad_Feriados where Data = '+#39+Funcoes.DePara( PS_Data+'/'+Funcoes_TrataData.AnoAtual, '/', '.')+' 00:00'+#39);
      if DM.IBQuery_Executa.FieldByName('Data').AsString <> '' then
      begin
        case semana of
           2: Tratar_Msg_Feriado( Shape_Semana_02, 'Feriado: '+DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString, CLRed);
           3: Tratar_Msg_Feriado( Shape_Semana_03, 'Feriado: '+DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString, CLRed);
           4: Tratar_Msg_Feriado( Shape_Semana_04, 'Feriado: '+DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString, CLRed);
           5: Tratar_Msg_Feriado( Shape_Semana_05, 'Feriado: '+DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString, CLRed);
           6: Tratar_Msg_Feriado( Shape_Semana_06, 'Feriado: '+DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString, CLRed);
//           7: Tratar_Msg_Feriado( Shape_Semana_07, 'Sábado', CLRed);
//           8: Tratar_Msg_Feriado( Shape_Semana_08, 'Domingo', CLRed);
        end;
      end;
   end;
}
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao da segunda feira
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.TratamentoData;
begin
   //--- Coloca todas semanas no padrao de nao feriado

   Tratar_Msg_Feriado( Shape_Semana_02, '', $00E4A958);
   Tratar_Msg_Feriado( Shape_Semana_03, '', $00E4A958);
   Tratar_Msg_Feriado( Shape_Semana_04, '', $00E4A958);
   Tratar_Msg_Feriado( Shape_Semana_05, '', $00E4A958);
   Tratar_Msg_Feriado( Shape_Semana_06, '', $00E4A958);

   Verifica_Feriado(copy(JvDateEdit_Segunda.Text,1,5), 2);
   Verifica_Feriado(copy(JvDateEdit_Terca.Text,1,5), 3);
   Verifica_Feriado(copy(JvDateEdit_Quarta.Text,1,5), 4);
   Verifica_Feriado(copy(JvDateEdit_Quinta.Text,1,5), 5);
   Verifica_Feriado(copy(JvDateEdit_Sexta.Text,1,5), 6);
//   Verifica_Feriado(copy(JvDateEdit_Sabado.Text,1,5), 7);
//   Verifica_Feriado(copy(JvDateEdit_Domingo.Text,1,5), 8);
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
            ScrollBox_PTS.VertScrollBar.Position:=0;
            SelecionaPTS;
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

   Panel_SegFeira.Enabled:= Status;
   Panel_TerFeira.Enabled:= Status;
   Panel_QuaFeira.Enabled:= Status;
   Panel_QuiFeira.Enabled:= Status;
   Panel_SexFeira.Enabled:= Status;
   Panel_Sabado.Enabled:= Status;
   Panel_Domingo.Enabled:= Status;
   JvDBRichEdit_Msg.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para atualizar a hora de acordo com a nova npa
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_AtualizarrHoraClick(Sender: TObject);
begin
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
end;

//------------------------------------------------------------------------------
// Tratamento das opções
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Trata_Opcoes(Top: Integer);
begin
   JvExpressButton_AtualizarrHora.Top:= Top;
   ComboBox_disciplinas.Top:= Top;
   JvExpressButton_Limpa_Descricao.Top:= Top;
   ComboBox_Instrutor.Top:= Top;
   JvExpressButton_Limpa_Docente.Top:= Top;
   ComboBox_SalaAula.Top:= Top;
   JvExpressButton_Limpa_Local.Top:= Top;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para inserir um novo PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_NovoPtsClick(Sender: TObject);
var
   VS_Sala: String;
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
               Trata_Opcoes(2); //25

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
               VB_Tratar_Segunda:= False;

               IBTable_PTS.Append;

               TrataSemanas;

               IBTable_PTS.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
               IBTable_PTS.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
               IBTable_PTS.FieldByName('Semana').AsString:=  ComboBox_Semana.Text;

               IBTable_PTS.FieldByName('Criacao').AsString:= DateToStr(Date);
               IBTable_PTS.FieldByName('Responsavel').AsString:= DM.Query_Usuario.FieldByName('Nome').AsString;

               IBTable_PTS.FieldByName('Dia_Semana_02').AsString:= '2º Feira';
               IBTable_PTS.FieldByName('Dia_Semana_03').AsString:= '3º Feira';
               IBTable_PTS.FieldByName('Dia_Semana_04').AsString:= '4º Feira';
               IBTable_PTS.FieldByName('Dia_Semana_05').AsString:= '5º Feira';
               IBTable_PTS.FieldByName('Dia_Semana_06').AsString:= '6º Feira';
               IBTable_PTS.FieldByName('Dia_Semana_07').AsString:= 'Sábado';
               IBTable_PTS.FieldByName('Dia_Semana_08').AsString:= 'Domingo';

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
               TratamentoData;
            end
            else
            begin
               JvExpressButton_AtualizarrHora.Visible:= True;
               VS_Opcao:= 'Alteração';

               VB_Tratar_Segunda:= True;
               VD_Segunda:= JvDateEdit_Segunda.Date;
               IBTable_PTS.Edit;

               JvDateEdit_Segunda.Text:= IBTable_PTS.FieldByName('Data_02').AsString;
               JvDateEdit_Terca.Text:= IBTable_PTS.FieldByName('Data_03').AsString;
               JvDateEdit_Quarta.Text:= IBTable_PTS.FieldByName('Data_04').AsString;
               JvDateEdit_Quinta.Text:= IBTable_PTS.FieldByName('Data_05').AsString;
               JvDateEdit_Sexta.Text:= IBTable_PTS.FieldByName('Data_06').AsString;
               JvDateEdit_Sabado.Text:= IBTable_PTS.FieldByName('Data_07').AsString;
               JvDateEdit_Domingo.Text:= IBTable_PTS.FieldByName('Data_08').AsString;

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
   VS_Comando: String;

   VD_Data_02, VD_Data_03, VD_Data_04, VD_Data_05, VD_Data_06, VD_Data_07, VD_Data_08: TDateTime;

   VI_Semana_Selecionada, VI_Semana_Ini, i: integer;
begin
   DecodeDate (JvDateEdit_Segunda.date, Ano, Mes, Dia);


   IBTable_PTS.Edit;
   IBTable_PTS.FieldByName('Data_02').AsString:= JvDateEdit_Segunda.Text;
   IBTable_PTS.FieldByName('Data_03').AsString:= JvDateEdit_Terca.Text;
   IBTable_PTS.FieldByName('Data_04').AsString:= JvDateEdit_Quarta.Text;
   IBTable_PTS.FieldByName('Data_05').AsString:= JvDateEdit_Quinta.Text;
   IBTable_PTS.FieldByName('Data_06').AsString:= JvDateEdit_Sexta.Text;
   IBTable_PTS.FieldByName('Data_07').AsString:= JvDateEdit_Sabado.Text;
   IBTable_PTS.FieldByName('Data_08').AsString:= JvDateEdit_Domingo.Text;

   IBTable_PTS.Post;
   Funcoes.ExecutaTransacao;


   if VB_Tratar_Segunda = True then
   begin
       VI_Semana_Ini:= StrToInt(ComboBox_Semana.Text)+1;

       VD_Data_02:= StrToDate(JvDateEdit_Segunda.Text);
       VD_Data_03:= StrToDate(JvDateEdit_Terca.Text);
       VD_Data_04:= StrToDate(JvDateEdit_Quarta.Text);
       VD_Data_05:= StrToDate(JvDateEdit_Quinta.Text);
       VD_Data_06:= StrToDate(JvDateEdit_Sexta.Text);
       VD_Data_07:= StrToDate(JvDateEdit_Sabado.Text);
       VD_Data_08:= StrToDate(JvDateEdit_Domingo.Text);

       for i:= VI_Semana_Ini to StrToInt(Label_Semanas.Caption)  do
       begin
          VD_Data_02:= VD_Data_02 + 7;
          VD_Data_03:= VD_Data_03 + 7;
          VD_Data_04:= VD_Data_04 + 7;
          VD_Data_05:= VD_Data_05 + 7;
          VD_Data_06:= VD_Data_06 + 7;
          VD_Data_07:= VD_Data_07 + 7;
          VD_Data_08:= VD_Data_08 + 7;

          VS_Comando:= 'Update cad_PTS set Data_02 = '+#39+copy(DateToStr(VD_Data_02), 1, 6)+copy(DateToStr(VD_Data_02), 9, 2)+#39+ ', '+
                                         ' Data_03 = '+#39+copy(DateToStr(VD_Data_03), 1, 6)+copy(DateToStr(VD_Data_03), 9, 2)+#39+ ', '+
                                         ' Data_04 = '+#39+copy(DateToStr(VD_Data_04), 1, 6)+copy(DateToStr(VD_Data_04), 9, 2)+#39+ ', '+
                                         ' Data_05 = '+#39+copy(DateToStr(VD_Data_05), 1, 6)+copy(DateToStr(VD_Data_05), 9, 2)+#39+ ', '+
                                         ' Data_06 = '+#39+copy(DateToStr(VD_Data_06), 1, 6)+copy(DateToStr(VD_Data_06), 9, 2)+#39+ ', '+
                                         ' Data_07 = '+#39+copy(DateToStr(VD_Data_07), 1, 6)+copy(DateToStr(VD_Data_07), 9, 2)+#39+ ', '+
                                         ' Data_08 = '+#39+copy(DateToStr(VD_Data_08), 1, 6)+copy(DateToStr(VD_Data_08), 9, 2)+#39+
                       ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                       ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                       ' and   Semana  = '+IntToStr(i);

                        Funcoes.ExecusaoQuery( VS_Comando );
       end;

   end;
end;

//------------------------------------------------------------------------------
// Tratamento para gravacao do PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvTransparentButton_GravaClick(Sender: TObject);
begin
   if ((IBTable_PTS.State = DSInsert) or (IBTable_PTS.State = DSEdit )) then
   begin
      if IBTable_PTS.FieldByName('Semana').AsString <> '' then
      begin

         Gravar_Pts;
         GravaPtsTmp;

         SelecionaPTS;

         Funcoes.GravaAcesso('Menu Principal - PTS', VS_Opcao+' PTS do Curso '+Funcoes.GetCodCurso+' Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'/'+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - Usuario: '+Funcoes.GetUsuario);
      end
      else
      begin
         IBTable_PTS.Cancel;
         Funcoes.ExecutaTransacao;
      end;
   end;
   JvExpressButton_AtualizarrHora.Visible:= False;
   Trata_Opcoes(25);

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

      SelecionaPTS;
   end;
   Trata_Opcoes(25);
   JvExpressButton_AtualizarrHora.Visible:= False;
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

         Application.CreateForm(TForm_Rel_PTS, Form_Rel_PTS);

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

            Application.CreateForm(TForm_Rel_PTS, Form_Rel_PTS);
            if JvCheckBox_Vizualizar.Checked = True then
               Form_Rel_PTS.QuickRep1.Preview
            else
               Form_Rel_PTS.QuickRep1.Print;
            VI_SemanaAtual:= VI_SemanaAtual+1;

            ComboBox_Semana.Text:= IntToStr(VI_SemanaAtual);

            JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);

            SelecionaPTS;
         end;
         ComboBox_Semana.Text:= VS_SemanaAtual;
//         JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
         JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
         SelecionaPTS;
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
   VS_Comando, VS_Data: String;
   Ano, Mes, Dia : word;
begin
   if ((DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString <> '') and (DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString <> '' )) then
   begin
      VD_Data:= DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime;
      VS_Comando:= ' Select IDCURSO, SEMANA, MSG, '+
                   '        DATA_02, DIA_SEMANA_02, HORARIO_01_02, HORARIO_02_02, TRAB_ESCOLAR_01_02, TRAB_ESCOLAR_02_02, EQUIPE_01_02, EQUIPE_02_02, LOCAL_01_02, LOCAL_02_02, '+
                   '        DATA_03, DIA_SEMANA_03, HORARIO_01_03, HORARIO_02_03, TRAB_ESCOLAR_01_03, TRAB_ESCOLAR_02_03, EQUIPE_01_03, EQUIPE_02_03, LOCAL_01_03, LOCAL_02_03, '+
                   '        DATA_04, DIA_SEMANA_04, HORARIO_01_04, HORARIO_02_04, TRAB_ESCOLAR_01_04, TRAB_ESCOLAR_02_04, EQUIPE_01_04, EQUIPE_02_04, LOCAL_01_04, LOCAL_02_04, '+
                   '        DATA_05, DIA_SEMANA_05, HORARIO_01_05, HORARIO_02_05, TRAB_ESCOLAR_01_05, TRAB_ESCOLAR_02_05, EQUIPE_01_05, EQUIPE_02_05, LOCAL_01_05, LOCAL_02_05, '+
                   '        DATA_06, DIA_SEMANA_06, HORARIO_01_06, HORARIO_02_06, TRAB_ESCOLAR_01_06, TRAB_ESCOLAR_02_06, EQUIPE_01_06, EQUIPE_02_06, LOCAL_01_06, LOCAL_02_06 '+
                   ' From PTS_base '+
                   ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;

      IBQuery1.Close;
      IBQuery1.SQL.Clear;
      IBQuery1.Sql.Add(VS_Comando);
      IBQuery1.Open;

      IBTable_CadPTS.Open;

      While not IBQuery1.eof do
      begin

         IBTable_CadPTS.Append;
         IBTable_CadPTS.FieldByName('IDCURSO').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
         IBTable_CadPTS.FieldByName('IDTURMA').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
         IBTable_CadPTS.FieldByName('SEMANA').AsString:= IBQuery1.FieldByName('SEMANA').AsString;
         IBTable_CadPTS.FieldByName('Criacao').AsString:= DateToStr(Date);
         IBTable_CadPTS.FieldByName('Responsavel').AsString:= DM.Query_Usuario.FieldByName('Nome').AsString;

         IBTable_CadPTS.FieldByName('MSG').AsString:= IBQuery1.FieldByName('MSG').AsString;

         DecodeDate (VD_Data, Ano, Mes, Dia);
         VS_Data:= FormatFloat('00', Dia)+'/'+FormatFloat('00', Mes)+'/'+copy(IntToStr(Ano),3,2);
         IBTable_CadPTS.FieldByName('DATA_02').AsString:= VS_Data;
//         IBTable_CadPTS.FieldByName('DATA_02').AsdateTime:= VD_Data;
         IBTable_CadPTS.FieldByName('DIA_SEMANA_02').AsString:= IBQuery1.FieldByName('DIA_SEMANA_02').AsString;
         IBTable_CadPTS.FieldByName('HORARIO_01_02').AsString:= IBQuery1.FieldByName('HORARIO_01_02').AsString;
         IBTable_CadPTS.FieldByName('HORARIO_02_02').AsString:= IBQuery1.FieldByName('HORARIO_02_02').AsString;
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_01_02').AsString:= IBQuery1.FieldByName('TRAB_ESCOLAR_01_02').AsString;
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_02_02').AsString:= IBQuery1.FieldByName('TRAB_ESCOLAR_02_02').AsString;
         IBTable_CadPTS.FieldByName('EQUIPE_01_02').AsString:= IBQuery1.FieldByName('EQUIPE_01_02').AsString;
         IBTable_CadPTS.FieldByName('EQUIPE_02_02').AsString:= IBQuery1.FieldByName('EQUIPE_02_02').AsString;
         IBTable_CadPTS.FieldByName('LOCAL_01_02').AsString:= IBQuery1.FieldByName('LOCAL_01_02').AsString;
         IBTable_CadPTS.FieldByName('LOCAL_02_02').AsString:= IBQuery1.FieldByName('LOCAL_02_02').AsString;

         VD_Data:= VD_Data + 1;
         DecodeDate (VD_Data, Ano, Mes, Dia);
         VS_Data:= FormatFloat('00', Dia)+'/'+FormatFloat('00', Mes)+'/'+copy(IntToStr(Ano),3,2);

         IBTable_CadPTS.FieldByName('DATA_03').AsString:= VS_Data;
         IBTable_CadPTS.FieldByName('DIA_SEMANA_03').AsString:= IBQuery1.FieldByName('DIA_SEMANA_03').AsString;
         IBTable_CadPTS.FieldByName('HORARIO_01_03').AsString:= IBQuery1.FieldByName('HORARIO_01_03').AsString;
         IBTable_CadPTS.FieldByName('HORARIO_02_03').AsString:= IBQuery1.FieldByName('HORARIO_02_03').AsString;
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_01_03').AsString:= IBQuery1.FieldByName('TRAB_ESCOLAR_01_03').AsString;
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_02_03').AsString:= IBQuery1.FieldByName('TRAB_ESCOLAR_02_03').AsString;
         IBTable_CadPTS.FieldByName('EQUIPE_01_03').AsString:= IBQuery1.FieldByName('EQUIPE_01_03').AsString;
         IBTable_CadPTS.FieldByName('EQUIPE_02_03').AsString:= IBQuery1.FieldByName('EQUIPE_02_03').AsString;
         IBTable_CadPTS.FieldByName('LOCAL_01_03').AsString:= IBQuery1.FieldByName('LOCAL_01_03').AsString;
         IBTable_CadPTS.FieldByName('LOCAL_02_03').AsString:= IBQuery1.FieldByName('LOCAL_02_03').AsString;

         VD_Data:= VD_Data + 1;
         DecodeDate (VD_Data, Ano, Mes, Dia);
         VS_Data:= FormatFloat('00', Dia)+'/'+FormatFloat('00', Mes)+'/'+copy(IntToStr(Ano),3,2);

         IBTable_CadPTS.FieldByName('DATA_04').AsString:= VS_Data;
         IBTable_CadPTS.FieldByName('DIA_SEMANA_04').AsString:= IBQuery1.FieldByName('DIA_SEMANA_04').AsString;
         IBTable_CadPTS.FieldByName('HORARIO_01_04').AsString:= IBQuery1.FieldByName('HORARIO_01_04').AsString;
         IBTable_CadPTS.FieldByName('HORARIO_02_04').AsString:= IBQuery1.FieldByName('HORARIO_02_04').AsString;
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_01_04').AsString:= IBQuery1.FieldByName('TRAB_ESCOLAR_01_04').AsString;
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_02_04').AsString:= IBQuery1.FieldByName('TRAB_ESCOLAR_02_04').AsString;
         IBTable_CadPTS.FieldByName('EQUIPE_01_04').AsString:= IBQuery1.FieldByName('EQUIPE_01_04').AsString;
         IBTable_CadPTS.FieldByName('EQUIPE_02_04').AsString:= IBQuery1.FieldByName('EQUIPE_02_04').AsString;
         IBTable_CadPTS.FieldByName('LOCAL_01_04').AsString:= IBQuery1.FieldByName('LOCAL_01_04').AsString;
         IBTable_CadPTS.FieldByName('LOCAL_02_04').AsString:= IBQuery1.FieldByName('LOCAL_02_04').AsString;

         VD_Data:= VD_Data + 1;
         DecodeDate (VD_Data, Ano, Mes, Dia);
         VS_Data:= FormatFloat('00', Dia)+'/'+FormatFloat('00', Mes)+'/'+copy(IntToStr(Ano),3,2);

         IBTable_CadPTS.FieldByName('DATA_05').AsString:= VS_Data;
         IBTable_CadPTS.FieldByName('DIA_SEMANA_05').AsString:= IBQuery1.FieldByName('DIA_SEMANA_05').AsString;
         IBTable_CadPTS.FieldByName('HORARIO_01_05').AsString:= IBQuery1.FieldByName('HORARIO_01_05').AsString;
         IBTable_CadPTS.FieldByName('HORARIO_02_05').AsString:= IBQuery1.FieldByName('HORARIO_02_05').AsString;
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_01_05').AsString:= IBQuery1.FieldByName('TRAB_ESCOLAR_01_05').AsString;
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_02_05').AsString:= IBQuery1.FieldByName('TRAB_ESCOLAR_02_05').AsString;
         IBTable_CadPTS.FieldByName('EQUIPE_01_05').AsString:= IBQuery1.FieldByName('EQUIPE_01_05').AsString;
         IBTable_CadPTS.FieldByName('EQUIPE_02_05').AsString:= IBQuery1.FieldByName('EQUIPE_02_05').AsString;
         IBTable_CadPTS.FieldByName('LOCAL_01_05').AsString:= IBQuery1.FieldByName('LOCAL_01_05').AsString;
         IBTable_CadPTS.FieldByName('LOCAL_02_05').AsString:= IBQuery1.FieldByName('LOCAL_02_05').AsString;

         VD_Data:= VD_Data + 1;
         DecodeDate (VD_Data, Ano, Mes, Dia);
         VS_Data:= FormatFloat('00', Dia)+'/'+FormatFloat('00', Mes)+'/'+copy(IntToStr(Ano),3,2);

         IBTable_CadPTS.FieldByName('DATA_06').AsString:= VS_Data;
         IBTable_CadPTS.FieldByName('DIA_SEMANA_06').AsString:= IBQuery1.FieldByName('DIA_SEMANA_06').AsString;
         IBTable_CadPTS.FieldByName('HORARIO_01_06').AsString:= IBQuery1.FieldByName('HORARIO_01_06').AsString;
         IBTable_CadPTS.FieldByName('HORARIO_02_06').AsString:= IBQuery1.FieldByName('HORARIO_02_06').AsString;
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_01_06').AsString:= IBQuery1.FieldByName('TRAB_ESCOLAR_01_06').AsString;
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_02_06').AsString:= IBQuery1.FieldByName('TRAB_ESCOLAR_02_06').AsString;
         IBTable_CadPTS.FieldByName('EQUIPE_01_06').AsString:= IBQuery1.FieldByName('EQUIPE_01_06').AsString;
         IBTable_CadPTS.FieldByName('EQUIPE_02_06').AsString:= IBQuery1.FieldByName('EQUIPE_02_06').AsString;
         IBTable_CadPTS.FieldByName('LOCAL_01_06').AsString:= IBQuery1.FieldByName('LOCAL_01_06').AsString;
         IBTable_CadPTS.FieldByName('LOCAL_02_06').AsString:= IBQuery1.FieldByName('LOCAL_02_06').AsString;

         VD_Data:= VD_Data + 1;
         DecodeDate (VD_Data, Ano, Mes, Dia);
         VS_Data:= FormatFloat('00', Dia)+'/'+FormatFloat('00', Mes)+'/'+copy(IntToStr(Ano),3,2);

         IBTable_CadPTS.FieldByName('DATA_07').AsString:= VS_Data;
         IBTable_CadPTS.FieldByName('DIA_SEMANA_07').AsString:= '';
         IBTable_CadPTS.FieldByName('HORARIO_01_07').AsString:= '';
         IBTable_CadPTS.FieldByName('HORARIO_02_07').AsString:= '';
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_01_07').AsString:= '';
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_02_07').AsString:= '';
         IBTable_CadPTS.FieldByName('EQUIPE_01_07').AsString:= '';
         IBTable_CadPTS.FieldByName('EQUIPE_02_07').AsString:= '';
         IBTable_CadPTS.FieldByName('LOCAL_01_07').AsString:= '';
         IBTable_CadPTS.FieldByName('LOCAL_02_07').AsString:= '';

         VD_Data:= VD_Data + 1;
         DecodeDate (VD_Data, Ano, Mes, Dia);
         VS_Data:= FormatFloat('00', Dia)+'/'+FormatFloat('00', Mes)+'/'+copy(IntToStr(Ano),3,2);

         IBTable_CadPTS.FieldByName('DATA_08').AsString:= VS_Data;
         IBTable_CadPTS.FieldByName('DIA_SEMANA_08').AsString:= '';
         IBTable_CadPTS.FieldByName('HORARIO_01_08').AsString:= '';
         IBTable_CadPTS.FieldByName('HORARIO_02_08').AsString:= '';
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_01_08').AsString:= '';
         IBTable_CadPTS.FieldByName('TRAB_ESCOLAR_02_08').AsString:= '';
         IBTable_CadPTS.FieldByName('EQUIPE_01_08').AsString:= '';
         IBTable_CadPTS.FieldByName('EQUIPE_02_08').AsString:= '';
         IBTable_CadPTS.FieldByName('LOCAL_01_08').AsString:= '';
         IBTable_CadPTS.FieldByName('LOCAL_02_08').AsString:= '';

         IBTable_CadPTS.Post;
         Funcoes.ExecutaTransacao;
         VD_Data:= VD_Data + 1;
         IBQuery1.Next;
      end;
      IBTable_CadPTS.Close;
      SelecionaPTS;
   end;
end;

//------------------------------------------------------------------------------
// Grava o PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_GravarExportarParaClick(Sender: TObject);
var
   VS_Msg, VS_Turma: String;
   VI_Retorno, VI_QtdRegistro: Integer;
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

               IBTable_PTSImportar.FieldByName('DAT A_07').AsString:= IBTable_PTS.FieldByName('DATA_07').AsString;
               IBTable_PTSImportar.FieldByName('DIA_SEMANA_07').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_07').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_01_07').AsString:= IBTable_PTS.FieldByName('HORARIO_01_07').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_02_07').AsString:= IBTable_PTS.FieldByName('HORARIO_02_07').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_01_07').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_07').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_02_07').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_07').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_01_07').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_07').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_02_07').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_07').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_01_07').AsString:= IBTable_PTS.FieldByName('LOCAL_01_07').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_02_07').AsString:= IBTable_PTS.FieldByName('LOCAL_02_07').AsString;

               IBTable_PTSImportar.FieldByName('DAT A_08').AsString:= IBTable_PTS.FieldByName('DATA_08').AsString;
               IBTable_PTSImportar.FieldByName('DIA_SEMANA_08').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_08').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_01_08').AsString:= IBTable_PTS.FieldByName('HORARIO_01_08').AsString;
               IBTable_PTSImportar.FieldByName('HORARIO_02_08').AsString:= IBTable_PTS.FieldByName('HORARIO_02_08').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_01_08').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_08').AsString;
               IBTable_PTSImportar.FieldByName('TRAB_ESCOLAR_02_08').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_08').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_01_08').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_08').AsString;
               IBTable_PTSImportar.FieldByName('EQUIPE_02_08').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_08').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_01_08').AsString:= IBTable_PTS.FieldByName('LOCAL_01_08').AsString;
               IBTable_PTSImportar.FieldByName('LOCAL_02_08').AsString:= IBTable_PTS.FieldByName('LOCAL_02_08').AsString;

               IBTable_PTSImportar.Post;
               Funcoes.ExecutaTransacao;
               ShowMessage('Finalizada a Exportação...');
               JvCaptionPanel_ImportaPTS.Visible:= False;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Cancela a Exportacao
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_ExportacaoClick(Sender: TObject);
begin
   IBTable_PTSImportar.Close;
   JvCaptionPanel_ImportaPTS.Visible:= False;
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
         MontaRelacaoTurmaImportar;
         ComboBox_SemanaImportar.Text:= ComboBox_Semana.Text;
         IBTable_PTSImportar.Open;

         JvCaptionPanel_ImportaPTS.Visible:= True;
         Edit_TurmaOrigem.Text:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString;
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
   IBTable_PTS_Tmp.FieldByName('Criacao').AsString:= IBTable_PTS.FieldByName('Criacao').AsString;
   IBTable_PTS_Tmp.FieldByName('Responsavel').AsString:= IBTable_PTS.FieldByName('Responsavel').AsString;

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

   IBTable_PTS_Tmp.FieldByName('DATA_07').AsString:= IBTable_PTS.FieldByName('DATA_07').AsString;
   IBTable_PTS_Tmp.FieldByName('DIA_SEMANA_07').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_07').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_01_07').AsString:= IBTable_PTS.FieldByName('HORARIO_01_07').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_02_07').AsString:= IBTable_PTS.FieldByName('HORARIO_02_07').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_01_07').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_07').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_02_07').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_07').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_01_07').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_07').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_02_07').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_07').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_01_07').AsString:= IBTable_PTS.FieldByName('LOCAL_01_07').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_02_07').AsString:= IBTable_PTS.FieldByName('LOCAL_02_07').AsString;

   IBTable_PTS_Tmp.FieldByName('DATA_08').AsString:= IBTable_PTS.FieldByName('DATA_08').AsString;
   IBTable_PTS_Tmp.FieldByName('DIA_SEMANA_08').AsString:= IBTable_PTS.FieldByName('DIA_SEMANA_08').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_01_08').AsString:= IBTable_PTS.FieldByName('HORARIO_01_08').AsString;
   IBTable_PTS_Tmp.FieldByName('HORARIO_02_08').AsString:= IBTable_PTS.FieldByName('HORARIO_02_08').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_01_08').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_01_08').AsString;
   IBTable_PTS_Tmp.FieldByName('TRAB_ESCOLAR_02_08').AsString:= IBTable_PTS.FieldByName('TRAB_ESCOLAR_02_08').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_01_08').AsString:= IBTable_PTS.FieldByName('EQUIPE_01_08').AsString;
   IBTable_PTS_Tmp.FieldByName('EQUIPE_02_08').AsString:= IBTable_PTS.FieldByName('EQUIPE_02_08').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_01_08').AsString:= IBTable_PTS.FieldByName('LOCAL_01_08').AsString;
   IBTable_PTS_Tmp.FieldByName('LOCAL_02_08').AsString:= IBTable_PTS.FieldByName('LOCAL_02_08').AsString;

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
   VS_NomeArq, VS_Semana: String;
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

         VS_NomeArq:= Funcoes.GetCodCurso+'_'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_'+ComboBox_Semana.Text;
         VS_NomeArq:= 'PTS_'+Funcoes.DePara(VS_NomeArq, '/', '_');

         if not DirectoryExists(VS_Pasta) then
            ForceDirectories(VS_Pasta);

         VS_NomeArq:= VS_Pasta+'\'+VS_NomeArq;

         Application.CreateForm(TForm_Rel_PTS, Form_Rel_PTS);
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
   VS_NomeArq, VS_Semana, VS_SemanaAtual: String;
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

            VS_NomeArq:= Funcoes.GetCodCurso+'_T'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_S'+ComboBox_Semana.Text;
            VS_NomeArq:= 'PTS_'+Funcoes.DePara(VS_NomeArq, '/', '_');

            if not DirectoryExists(VS_Pasta) then
               ForceDirectories(VS_Pasta);

            VS_NomeArq:= VS_Pasta+'\'+VS_NomeArq;

            Application.CreateForm(TForm_Rel_PTS, Form_Rel_PTS);

            Form_Rel_PTS.QuickRep1.Prepare;
            ExportQR1.Report := Form_Rel_PTS.QuickRep1;
            ExportQR1.ExportQRPDF( VS_NomeArq , False);
            ShellExecute(Handle, nil, PChar(VS_NomeArq+'.pdf') , nil, nil, SW_SHOWNORMAL);

            VI_SemanaAtual:= VI_SemanaAtual+1;
            ComboBox_Semana.Text:= IntToStr(VI_SemanaAtual);

            JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);

            SelecionaPTS;
         end;
         ComboBox_Semana.Text:= VS_SemanaAtual;
//         JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
         JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
         SelecionaPTS;
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

//------------------------------------------------------------------------------
// Tratamento quando a semana não foi selecionada
//------------------------------------------------------------------------------

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
var
   VS_Comando: String;
   VI_Indice: integer;
begin
   if Trim(DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString) = '' then
   begin
      showMessage('Não foi selecionado a Turma...');
   end
   else
   begin
      VS_Comando:= 'select max(indice) + 1 as Indice  '+
                   ' From CAD_PTS_DISTANCIA '+
                   ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                   ' and idturma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;

      Funcoes.OpenQuery(VS_Comando);

      if DM.IBQuery_Executa.FieldByName('Indice').AsString = '' then
         VI_Indice:= 1
      else
         VI_Indice:= DM.IBQuery_Executa.FieldByName('Indice').AsInteger;

      TratarBotoes_EAD(False);
      VS_Opcao:= 'Inserção';
      IBTable_PTS_EAD.Append;
      IBTable_PTS_EAD.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
      IBTable_PTS_EAD.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      IBTable_PTS_EAD.FieldByName('Indice').AsInteger:= VI_Indice;
      IBTable_PTS_EAD.FieldByName('Semana').AsString:= '';
      IBTable_PTS_EAD.FieldByName('Modulo').AsString:= '';
      IBTable_PTS_EAD.FieldByName('Local').AsString:= DM.IBTable_Configuracao.FieldByName('Sigla').AsString;
      IBTable_PTS_EAD.FieldByName('Criacao').AsString:= DateToStr(Date);
      IBTable_PTS_EAD.FieldByName('Responsavel').AsString:= DM.Query_Usuario.FieldByName('Nome').AsString;

      VS_Msg_EAD:= '';
      DBEdit_Semana.SetFocus;
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
      DBEdit_Semana.SetFocus;
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
//   VS_Comando:= 'Select count(1) as Qtd From CAD_PTS_DISTANCIA '+
//                ' where   IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
//                ' and '+' IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
//                ' and '+' Semana = '+#39+DBEdit_Semana.Text+#39+
//                ' and '+' Modulo = '+#39+DBEdit_Modulo.Text+#39+
//                ' and '+' Disciplina = '+#39+DBComboBox_Disciplina.Text+#39;
//   Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando);

//   if  DM.IBQuery_Executa.FieldByName('Qtd').Asinteger > 0 then
//   begin
//      ShowMessage('O PTS EAD inserido já encontra-se cadastrado no banco de dados...');
//      DBEdit_Semana.SetFocus;
//   end
//   else
//   begin
      if DBEdit_Semana.Text = '' then
      begin
         ShowMessage('A Semana não pode ser branco...');
         DBEdit_Semana.SetFocus;
      end
      else
      begin
         if DBEdit_Modulo.Text = '' then
         begin
            ShowMessage('O Módulo não pode ser branco...');
            DBEdit_Modulo.SetFocus;
         end
         else
         begin
            if DBComboBox_Disciplina.Text = '' then
            begin
               ShowMessage('A Disciplina não pode ser branco...');
               DBComboBox_Disciplina.SetFocus;
            end
            else
            begin
               if ((IBTable_PTS_EAD.State = DSInsert) or (IBTable_PTS_EAD.State = DSEdit )) then
               begin
                  IBTable_PTS_EAD.Post;
                  Funcoes.ExecutaTransacao;
                  Funcoes.AtualizaQuery(IBQuery_PTS_EAD);

                  TratarBotoes_EAD(True);
               end;
            end;
         end;
      end;
//   end;
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
        MessageDlg('O PTS EAD para período com a disciplina selecionado já foi Cadastrado...',mtError, [mbOk],0);
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

   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;
   JvTransparentButton_Imprime_EAD.Enabled:= Status;
   JvTransparentButton_PDF_EAD.Enabled:= Status;

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
   VS_NomeArq: String;
begin
   Application.CreateForm(TForm_Rel_PTS_EAD, Form_Rel_PTS_EAD);

   VS_NomeArq:= Funcoes.GetCodCurso+'_'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_'+ComboBox_Semana.Text;
   VS_NomeArq:= 'PTS_EAD_'+Funcoes.DePara(VS_NomeArq, '/', '_');

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


   JvDateEdit_segunda.Text:= IBQuery_PTS.FieldByName('data_02').AsString;
   JvDateEdit_Terca.Text:= IBQuery_PTS.FieldByName('data_03').AsString;
   JvDateEdit_Quarta.Text:= IBQuery_PTS.FieldByName('data_04').AsString;
   JvDateEdit_Quinta.Text:= IBQuery_PTS.FieldByName('data_05').AsString;
   JvDateEdit_Sexta.Text:= IBQuery_PTS.FieldByName('data_06').AsString;
   JvDateEdit_Sabado.Text:= IBQuery_PTS.FieldByName('data_07').AsString;
   JvDateEdit_Domingo.Text:= IBQuery_PTS.FieldByName('data_08').AsString;


end;

procedure TForm_Cad_PTS.SelecionaPTS;
begin
//   JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
   IBQuery_PTS.Close;
   IBQuery_PTS.Sql.Clear;
   IBQuery_PTS.SQL.Add( 'Select * '+
                        ' From Cad_PTS ' +
                        ' where IdCurso = :IdCurso '+
                        ' and   IdTurma = :IdTurma '+
                        ' and   Semana = '+ComboBox_Semana.Text
                      );
  IBQuery_PTS.Open;

  
end;

//------------------------------------------------------------------------------
// Tratamento para gerar arquivo PDF registro unico
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.PDF_UnicoClick(Sender: TObject);
var
   VS_NomeArq, VS_SemanaAtual: String;
   VI_SemanaAtual, UltimaSemana: Integer;
   VS_Comando, VS_Where, Filtro: String;
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

         VS_Comando:= 'Select * '+
                        ' From Cad_PTS ' +
                        ' where IdCurso = :IdCurso '+
                        ' and   IdTurma = :IdTurma ';
         VS_Where:= '';
         Filtro:= ' and (';
         While VI_SemanaAtual <= UltimaSemana do
         begin
            VS_Where:= VS_Where+Filtro+' (Semana = '+IntToStr(VI_SemanaAtual)+')';
            VI_SemanaAtual:= VI_SemanaAtual+1;
            Filtro:= ' or ';
         end;
         VS_Where:= VS_Where+')';

         VS_Comando:= VS_Comando+VS_Where;

         IBQuery_PTS.Close;
         IBQuery_PTS.Sql.Clear;
         IBQuery_PTS.SQL.Add( VS_Comando+' order by semana' );
         IBQuery_PTS.Open;

         if not DirectoryExists('C:\Ensino\ArquivosPDF') then
             ForceDirectories('C:\Ensino\ArquivosPDF');

         VS_NomeArq:= Funcoes.GetCodCurso+'_'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_Unico';
         VS_NomeArq:= 'PTS_'+Funcoes.DePara(VS_NomeArq, '/', '_');

         if not DirectoryExists(VS_Pasta) then
            ForceDirectories(VS_Pasta);

         VS_NomeArq:= VS_Pasta+'\'+VS_NomeArq;

         Application.CreateForm(TForm_Rel_PTS, Form_Rel_PTS);

         Form_Rel_PTS.QuickRep1.Prepare;
         ExportQR1.Report := Form_Rel_PTS.QuickRep1;
         ExportQR1.ExportQRPDF( VS_NomeArq , False);
         ShellExecute(Handle, nil, PChar(VS_NomeArq+'.pdf') , nil, nil, SW_SHOWNORMAL);
      end;
      ComboBox_Semana.Text:= VS_SemanaAtual;
//      JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
      JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
      SelecionaPTS;
   end;
end;


procedure TForm_Cad_PTS.Impressonica1Click(Sender: TObject);
var
   VS_SemanaAtual: String;
   VI_SemanaAtual, UltimaSemana: Integer;
   VS_Comando, VS_Where, Filtro: String;
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

         VS_Comando:= 'Select * '+
                        ' From Cad_PTS ' +
                        ' where IdCurso = :IdCurso '+
                        ' and   IdTurma = :IdTurma ';
         VS_Where:= '';
         Filtro:= ' and (';
         While VI_SemanaAtual <= UltimaSemana do
         begin
            VS_Where:= VS_Where+Filtro+' (Semana = '+IntToStr(VI_SemanaAtual)+')';
            VI_SemanaAtual:= VI_SemanaAtual+1;
            Filtro:= ' or ';
         end;
         VS_Where:= VS_Where+')';

         VS_Comando:= VS_Comando+VS_Where;

         IBQuery_PTS.Close;
         IBQuery_PTS.Sql.Clear;
         IBQuery_PTS.SQL.Add( VS_Comando );
         IBQuery_PTS.Open;

         Application.CreateForm(TForm_Rel_PTS, Form_Rel_PTS);

         if JvCheckBox_Vizualizar.Checked = True then
            Form_Rel_PTS.QuickRep1.Preview
         else
            Form_Rel_PTS.QuickRep1.Print;
      end;
      ComboBox_Semana.Text:= VS_SemanaAtual;
//      JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
      JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
      SelecionaPTS;
   end;
end;

//------------------------------------------------------------------------------
// Tratamentoo para organizar de acordo com o titulo da Grid
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.DBGrid_PTS_EADTitleClick(Column: TColumn);
begin
   if (column.Title.Caption = 'SEMANA' ) then
   begin
      if OrderByEAD = ' order by Indice desc ' then
          OrderByEAD:= ' order by Indice '
      else
          OrderByEAD:= ' order by Indice desc ';
   end
   else
     if trim(column.Title.Caption) = 'MÓDULO' then
         OrderByEAD:= ' order by Modulo'
     else
        if trim(column.Title.Caption) = 'DISCIPLINA' then
            OrderByEAD:= ' order by Disciplina'
        else
           if trim(column.Title.Caption) = 'COD PUD' then
              OrderByEAD:= ' order by CODPUD'
           else
              if trim(column.Title.Caption) = 'CARGA/HORÁRIA' then
                 OrderByEAD:= ' order by CARGAHORARIA '
              else
                 if trim(column.Title.Caption) = 'PERÍODO' then
                    OrderByEAD:= ' Order By Periodo, Semana, Modulo'
                 else
                    if trim(column.Title.Caption) = 'TUTOR' then
                       OrderByEAD:= ' order by TUTOR'
                    else
                       if trim(column.Title.Caption) = 'LOCAL' then
                           OrderByEAD:= ' order by Local';

      Tratar_PTS_EAD(OrderByEAD);
end;

//------------------------------------------------------------------------------
// Exportacao do PTS EAD
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_GravarExportarPara_EADClick(Sender: TObject);
var
   VS_Msg, VS_Turma, VS_IdTurma: String;
   VI_Retorno, VI_QtdRegistro: Integer;
   VB_Gravar: Boolean;
begin
   if ((DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString <> '') and (DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString <> '' )) then
   begin
      VB_Gravar:= True;
      if ((ComboBox_Importar_EAD.Text = DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString)) Then
      begin
         ShowMessage('Não pode Exportar para a mesma Turma ');
      end
      else
      begin
         //--- Tratamento para selecionar a turma que ira ser cadasatrada
         VS_Turma:= Trim(Funcoes.ExtraiAntesDe(ComboBox_Importar_EAD.Text, '-'));

         if VS_Turma = '' then
         begin
            ShowMessage('Não foi selecionada a Turma que irá receber o PTS...');
            ComboBox_Importar_EAD.SetFocus;
         end
         else
         begin

         Funcoes.OpenQuery('Select idTurma, turma '+
                                ' From Turma '+
                                ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                ' and   Turma = '+#39+VS_Turma+#39+
                                ' and   ano = '+DM.IBQuery_MontaTurma.FieldByName('ano').AsString
                               );
          VS_IdTurma:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;


            VI_QtdRegistro:= Funcoes.QtdRegistro(' Select count(1) as Qtd From CAD_PTS_DISTANCIA where IdCurso = ' +DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+'  and IdTurma = '+VS_IdTurma);
            if VI_QtdRegistro > 0 then
            begin
               VI_Retorno:= Application.MessageBox('Já existe PTS para Turma na semana selecionada  '+#13+
                                                   'Confirma a Exportação ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
               if VI_Retorno = IDYes then
               begin
                  Funcoes.ExecusaoQuery(' Delete From CAD_PTS_DISTANCIA where IdCurso = ' +DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+'  and IdTurma = '+VS_IdTurma);
                  VB_Gravar:= True
               end
               else
                  VB_Gravar:= False;
            end;

            if VB_Gravar = True then
            begin
               VS_Msg:= 'Exportação do PTS EAD Curso '+Funcoes.GetCodCurso+' da Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'/'+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+
                        ' para a Turma '+VS_Turma+' Usuario: '+Funcoes.GetUsuario;
               Funcoes.GravaAcesso('Menu Principal - PTS', VS_Msg);

               IBQuery_PTS_EAD.First;
               While not IBQuery_PTS_EAD.Eof do
               begin
                  IBTable_PTS_EAD_Importar.Append;
                  IBTable_PTS_EAD_Importar.FieldByName('IDCURSO').AsString:=      IBQuery_PTS_EAD.FieldByName('IDCURSO').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('IDTURMA').AsString:=      VS_IdTurma;
                  IBTable_PTS_EAD_Importar.FieldByName('INDICE').AsString:=       IBQuery_PTS_EAD.FieldByName('INDICE').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('SEMANA').AsString:=       IBQuery_PTS_EAD.FieldByName('SEMANA').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('MODULO').AsString:=       IBQuery_PTS_EAD.FieldByName('MODULO').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('DISCIPLINA').AsString:=   IBQuery_PTS_EAD.FieldByName('DISCIPLINA').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('PERIODO').AsString:=      IBQuery_PTS_EAD.FieldByName('PERIODO').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('TUTOR').AsString:=        IBQuery_PTS_EAD.FieldByName('TUTOR').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('MSG').AsString:=          IBQuery_PTS_EAD.FieldByName('MSG').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('CARGAHORARIA').AsString:= IBQuery_PTS_EAD.FieldByName('CARGAHORARIA').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('CODPUD').AsString:=       IBQuery_PTS_EAD.FieldByName('CODPUD').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('LOCAL').AsString:=        IBQuery_PTS_EAD.FieldByName('LOCAL').AsString;
                  IBTable_PTS_EAD_Importar.FieldByName('CRIACAO').AsString:=      DateToStr(Date);
                  IBTable_PTS_EAD_Importar.FieldByName('RESPONSAVEL').AsString:=  DM.Query_Usuario.FieldByName('Nome').AsString;
                  IBTable_PTS_EAD_Importar.Post;

                  IBQuery_PTS_EAD.Next;
               end;
               Funcoes.ExecutaTransacao;
               ShowMessage('Finalizada a Exportação...');
               JvExpressButton_Cancelar_Exportar_PTS_EADClick(Sender);
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Cancela a Exportacao
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_Cancelar_Exportar_PTS_EADClick(Sender: TObject);
begin
   IBTable_PTS_EAD_Importar.Close;
   JvCaptionPanel_ImporatPTS_EAD.Visible:= False;
end;

//------------------------------------------------------------------------------
// Abre a janela para copiar o PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.JvExpressButton_Exportar_EADClick(Sender: TObject);
begin
   if (trim(ComboBox_Semana.Text) = '') then
      TratarSemanaNaoSelecionada
   else
   begin
      if IBTable_PTS_EAD.FieldByName('IdTurma').AsString = '' then
         ShowMessage('Não possuí PTS Cadastrado ...')
      else
      begin
         MontaRelacaoTurmaImportar;
         IBTable_PTS_EAD_Importar.Open;

         JvCaptionPanel_ImporatPTS_EAD.Visible:= True;
         Edit_Origem_EAD.Text:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString;
      end;
   end;
end;


//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.MontaRelacaoTurmaImportar;
begin
   if ((ComboBox_TipoTurma.Text = 'Default-in') or (ComboBox_TipoTurma.Text = 'Default')) then
   begin
      ComboBox_TipoTurma.Text:= 'Default';
      Funcoes.OpenQuery( 'Select idTurma, turma, Ano, Descricao, Modalidade '+
                         ' From Turma '+
                         ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                         ' and (Status = '+#39+'A'+#39+' or Status = '+#39+'P'+#39+')'+
                         ' order by Ano desc, Turma '
                       );
   end
   else
   begin
      if ComboBox_TipoTurma.Text = 'Em Andamento' then
      begin
          Funcoes.OpenQuery('Select idTurma, turma, Ano, Descricao, Modalidade '+
                       ' From Turma '+
                       ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                       ' and Status = '+#39+'A'+#39+
                       ' order by Ano desc, Turma '
                      );
      end
      else
      begin
         if ComboBox_TipoTurma.Text = 'Planejados' then
         begin
            Funcoes.OpenQuery('Select idTurma, turma, Ano, Descricao, Modalidade '+
                          ' From Turma '+
                          ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                          ' and Status = '+#39+'P'+#39+
                          ' order by Ano desc, Turma '
                        );
         end
         else
         begin
            if ComboBox_TipoTurma.Text = 'Executados' then
            begin
                Funcoes.OpenQuery('Select idTurma, turma, Ano, Descricao, Modalidade '+
                             ' From Turma '+
                             ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                             ' and Status = '+#39+'E'+#39+
                             ' order by Ano desc, Turma '
                            );
            end
            else
            begin
                if ComboBox_TipoTurma.Text = 'Todos' then
                begin
                   Funcoes.OpenQuery('Select idTurma, turma, Ano, Descricao, Modalidade '+
                                ' From Turma '+
                                ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                ' and Status <> '+#39+'B'+#39+
                                ' order by Ano desc, Turma '
                               );
               end;
            end;
         end;
      end;
   end;

   ComboBox_Importar.Items.Clear;
   ComboBox_Importar_EAD.Items.Clear;

   ComboBox_Importar.Text:= '';
   ComboBox_Importar_EAD.Text:= '';
   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_Importar.Items.Add( DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString);
      ComboBox_Importar_EAD.Items.Add( DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString);
       DM.IBQuery_Executa.Next;
   end;
end;



//------------------------------------------------------------------------------
//
// Tratamento do Excel
//
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Tratamento para Imprimir o arquivo Excel  Selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Excel_SelecionadoClick(Sender: TObject);
begin
   Planilha_Selecionado('Excel');
end;

//------------------------------------------------------------------------------
// Tratamento para Imprimir o arquivo BROffice  Selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.BROffice_SelecionadoClick(Sender: TObject);
begin
   Planilha_Selecionado('BROffice');
end;

//------------------------------------------------------------------------------
// Tratamento para Imprimir o arquivo Excel Todos
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Excel_TodosClick(Sender: TObject);
begin
   Planilha_Todos('Excel');
end;

//------------------------------------------------------------------------------
// Tratamento para Imprimir o arquivo BROffice Todos
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.BROfficeTodosClick(Sender: TObject);
begin
   Planilha_Todos('BROffice');
end;

//------------------------------------------------------------------------------
// Tartamento para Imprimir o arquivo Excel  Selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Planilha_Selecionado(Planilha: String);
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

         if Planilha = 'Excel' then
            MontarArquivoExcel
         else
            MontarArquivoOpenOffice;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tartamento para Imprimir o arquivo Excel/BROffice  Todos
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Planilha_Todos(Planilha: String);
var
   Ano, Mes, Dia : word;
   VS_NomeArq, VS_Semana, VS_SemanaAtual: String;
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

            VS_NomeArq:= Funcoes.GetCodCurso+'_T'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_S'+ComboBox_Semana.Text;
            VS_NomeArq:= 'PTS_'+Funcoes.DePara(VS_NomeArq, '/', '_');

            if Planilha = 'Excel' then
               MontarArquivoExcel
            else
               MontarArquivoOpenOffice;

            VI_SemanaAtual:= VI_SemanaAtual+1;
            ComboBox_Semana.Text:= IntToStr(VI_SemanaAtual);

            JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);

            SelecionaPTS;
         end;
         ComboBox_Semana.Text:= VS_SemanaAtual;
//         JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
         JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
         SelecionaPTS;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para gerar arquivo PDF registro unico
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.Planilha_Unico(Planilha: String);
var
   VS_SemanaAtual: String;
   VI_SemanaAtual, UltimaSemana: Integer;
   VS_Comando, VS_Where, Filtro: String;
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

         VS_Comando:= 'Select * '+
                        ' From Cad_PTS ' +
                        ' where IdCurso = :IdCurso '+
                        ' and   IdTurma = :IdTurma ';
         VS_Where:= '';
         Filtro:= ' and (';
         While VI_SemanaAtual <= UltimaSemana do
         begin
            VS_Where:= VS_Where+Filtro+' (Semana = '+IntToStr(VI_SemanaAtual)+')';
            VI_SemanaAtual:= VI_SemanaAtual+1;
            Filtro:= ' or ';
         end;
         VS_Where:= VS_Where+')';

         VS_Comando:= VS_Comando+VS_Where;

         IBQuery_PTS.Close;
         IBQuery_PTS.Sql.Clear;
         IBQuery_PTS.SQL.Add( VS_Comando );
         IBQuery_PTS.Open;

         if Planilha = 'Excel' then
            MontarArquivoExcel
         else
            MontarArquivoOpenOffice;
      end;
      ComboBox_Semana.Text:= VS_SemanaAtual;
//      JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);
      JvDateEdit_Segunda.Date:= Tratar_Segunda(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime)+((StrToInt(ComboBox_Semana.Text)-1)*7);
      SelecionaPTS;
   end;
end;


//------------------------------------------------------------------------------
// Tartamento para Imprimir o arquivo Excel
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.MontarArquivoExcel;
var
   objExcel, Sheet: Variant;
   cTitulo : string;
   i : integer;
begin
   // Cria uma instancia para utilizar o Excel

   cTitulo := 'PTS - Curso';

   try
      objExcel := CreateOleObject('Excel.Application');
   except
      objExcel := CreateOleObject('scalc.Application');
   end;
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   // Preenchendo as Colunas
   Sheet.Range['A1'] := 'HORÁRIO';
   Sheet.Range['B1'] := 'TRABALHO ESCOLAR';
   Sheet.Range['C1'] := 'DOCENTE';
   Sheet.Range['D1'] := 'LOCAL';

   // por aqui tu limparias a planilha

   i:= 2;
   IBQuery_PTS.First;
   while not IBQuery_PTS.eof do
   begin

      // Segunda feira

      Sheet.Cells[i,1] := 'Segunda Feira '+IBQuery_PTS.FieldByName('DATA_02').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_01_02').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_02').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_01_02').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_01_02').AsString;

      i:= i+1;
      Sheet.Cells[i,1] := 'Segunda Feira '+IBQuery_PTS.FieldByName('DATA_02').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_02_02').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_02').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_02_02').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_02_02').AsString;

     // Terca feira

      i:= i+1;
      Sheet.Cells[i,1] := 'Terça Feira '+IBQuery_PTS.FieldByName('DATA_03').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_01_03').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_03').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_01_03').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_01_03').AsString;

      i:= i+1;
      Sheet.Cells[i,1] := 'Terça Feira '+IBQuery_PTS.FieldByName('DATA_03').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_02_03').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_03').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_02_03').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_02_03').AsString;

     // Quarta feira

      i:= i+1;
      Sheet.Cells[i,1] := 'Quarta Feira '+IBQuery_PTS.FieldByName('DATA_04').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_01_04').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_04').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_01_04').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_01_04').AsString;

      i:= i+1;
      Sheet.Cells[i,1] := 'Quarta Feira '+IBQuery_PTS.FieldByName('DATA_04').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_02_04').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_04').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_02_04').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_02_04').AsString;

     // Quinta feira

      i:= i+1;
      Sheet.Cells[i,1] := 'Quinta Feira '+IBQuery_PTS.FieldByName('DATA_05').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_01_05').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_05').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_01_05').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_01_05').AsString;

      i:= i+1;
      Sheet.Cells[i,1] := 'Quinta Feira '+IBQuery_PTS.FieldByName('DATA_05').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_02_05').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_05').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_02_05').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_02_05').AsString;

     // Sexta feira

      i:= i+1;
      Sheet.Cells[i,1] := 'Sexta Feira '+IBQuery_PTS.FieldByName('DATA_06').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_01_06').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_06').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_01_06').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_01_06').AsString;

      i:= i+1;
      Sheet.Cells[i,1] := 'Sexta Feira '+IBQuery_PTS.FieldByName('DATA_06').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_02_06').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_06').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_02_06').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_02_06').AsString;

     // Sabado

      i:= i+1;
      Sheet.Cells[i,1] := 'Sábado '+IBQuery_PTS.FieldByName('DATA_07').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_01_07').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_07').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_01_07').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_01_07').AsString;

      i:= i+1;
      Sheet.Cells[i,1] := 'Sábado '+IBQuery_PTS.FieldByName('DATA_07').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_02_07').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_07').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_02_07').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_02_07').AsString;

     // Domingo

      i:= i+1;
      Sheet.Cells[i,1] := 'Domingo '+IBQuery_PTS.FieldByName('DATA_08').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_01_08').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_08').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_01_08').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_01_08').AsString;

      i:= i+1;
      Sheet.Cells[i,1] := 'Domingo '+IBQuery_PTS.FieldByName('DATA_08').AsString;
      Sheet.Cells[i,2] := IBQuery_PTS.FieldByName('HORARIO_02_08').AsString;
      Sheet.Cells[i,3] := IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_08').AsString;
      Sheet.Cells[i,4] := IBQuery_PTS.FieldByName('EQUIPE_02_08').AsString;
      Sheet.Cells[i,5] := IBQuery_PTS.FieldByName('LOCAL_02_08').AsString;

      i:= i+1;
      IBQuery_PTS.Next;
   end;
end;

//------------------------------------------------------------------------------
//funcao para exportar para openoffice o DBGrid
//------------------------------------------------------------------------------

procedure TForm_Cad_PTS.MontarArquivoOpenOffice;
var
   OpenDesktop, Calc, Sheets, Sheet, wProperties : Variant;
   Connect, OpenOffice : Variant;
   i : Integer; // Coluna
begin

   Screen.Cursor := crSQLWait;

   // Cria o link OLE com o OpenOffice
   if VarIsEmpty(OpenOffice) then
      OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
   Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

   // Inicia o Calc
   OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
   wProperties := VarArrayCreate([0, - 1], varVariant);
   Calc := OpenDesktop.LoadComponentFromURL('private:factory/scalc', '_blank', 0, wProperties);
   sheets := Calc.Sheets;
   Sheet := Sheets.getByIndex(0);

   // Calc.ConvertFromUrl(calc);

   // Cria linha de cabeçalho
   i := 0;
   // Preenchendo as Colunas
   Sheet.getCellByPosition(0,i).SetString('DATA');
   Sheet.getCellByPosition(1,i).SetString('HORÁRIO');
   Sheet.getCellByPosition(2,i).SetString('TRABALHO ESCOLAR');
   Sheet.getCellByPosition(3,i).SetString('DOCENTE');
   Sheet.getCellByPosition(4,i).SetString('LOCAL');

   i:= 2;
   IBQuery_PTS.First;
   while not IBQuery_PTS.eof do
   begin

      // Segunda feira

      Sheet.getCellByPosition(0,i).SetString('Segunda Feira '+IBQuery_PTS.FieldByName('DATA_02').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_01_02').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_02').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_01_02').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_01_02').AsString);

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Segunda Feira '+IBQuery_PTS.FieldByName('DATA_02').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_02_02').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_02').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_02_02').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_02_02').AsString);

      // Terca feira

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Terça Feira '+IBQuery_PTS.FieldByName('DATA_03').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_01_03').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_03').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_01_03').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_01_03').AsString);

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Terça Feira '+IBQuery_PTS.FieldByName('DATA_03').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_02_03').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_03').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_02_03').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_02_03').AsString);

      // Quarta feira

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Quarta Feira '+IBQuery_PTS.FieldByName('DATA_04').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_01_04').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_04').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_01_04').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_01_04').AsString);

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Quarta Feira '+IBQuery_PTS.FieldByName('DATA_04').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_02_04').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_04').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_02_04').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_02_04').AsString);

      // Quinta feira

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Quinta Feira '+IBQuery_PTS.FieldByName('DATA_05').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_01_05').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_05').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_01_05').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_01_05').AsString);

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Quinta Feira '+IBQuery_PTS.FieldByName('DATA_05').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_02_05').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_05').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_02_05').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_02_05').AsString);

      // Sexta feira

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Sábado '+IBQuery_PTS.FieldByName('DATA_06').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_01_06').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_06').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_01_06').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_01_06').AsString);

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Sábado '+IBQuery_PTS.FieldByName('DATA_06').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_02_06').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_06').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_02_06').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_02_06').AsString);

      // Sabado

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Domingo '+IBQuery_PTS.FieldByName('DATA_07').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_01_07').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_01_07').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_01_07').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_01_07').AsString);

      i:= i+1;
      Sheet.getCellByPosition(0,i).SetString('Domingo '+IBQuery_PTS.FieldByName('DATA_07').AsString);
      Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS.FieldByName('HORARIO_02_07').AsString);
      Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS.FieldByName('TRAB_ESCOLAR_02_07').AsString);
      Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS.FieldByName('EQUIPE_02_07').AsString);
      Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS.FieldByName('LOCAL_02_07').AsString);

      i:= i+1;
      IBQuery_PTS.Next;
   end;
   Screen.Cursor := crDefault;
end;

procedure TForm_Cad_PTS.IBTable_PTSAfterScroll(DataSet: TDataSet);
begin
    TratamentoData;
end;

procedure TForm_Cad_PTS.JvDateEdit_SegundaChange(Sender: TObject);
begin
    Apresentar_Data_Formulario;
end;

procedure TForm_Cad_PTS.JvDateEdit_SegundaExit(Sender: TObject);
begin
   Apresentar_Data_Formulario;
end;

procedure TForm_Cad_PTS.Apresentar_Data_Formulario;
begin
    if JvDateEdit_Segunda.Date <> VD_Segunda then
    begin
       // Atualizao calendario do pdf

       VB_Tratar_Segunda:= True;

       VD_Segunda:= JvDateEdit_Segunda.Date;

       JvDateEdit_Terca.Date:= JvDateEdit_Segunda.Date + 1;
       JvDateEdit_Quarta.Date:= JvDateEdit_Segunda.Date + 2;
       JvDateEdit_Quinta.Date:= JvDateEdit_Segunda.Date + 3;
       JvDateEdit_Sexta.Date:= JvDateEdit_Segunda.Date + 4;
       JvDateEdit_Sabado.Date:= JvDateEdit_Segunda.Date + 5;
       JvDateEdit_Domingo.Date:= JvDateEdit_Segunda.Date + 6;

    end;
end;


end.
