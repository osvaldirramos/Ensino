unit SalaMapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, DBCtrls, StdCtrls, JvEdit,
  ToolWin, ComCtrls, IBQuery, JvComponent, JvTransBtn, ExtCtrls, JvShape,
  JvGradient, IBTable, Rotinas, Rotinas_Sue, Rotinas_TrataData, DateUtils, Mask, JvToolEdit,
  JvCaptionPanel, JvDBCtrl, DBClient, JvGradientCaption, ImgList;

type
  TForm_Mapa_Sala = class(TForm)
    IBQuery_MontaMapa: TIBQuery;
    DSQ_MontaMapa: TDataSource;
    IBQuery_MontaMapaCODSALA: TIBStringField;
    IBQuery_MontaMapaC_01_01: TIntegerField;
    IBQuery_MontaMapaC_01_02: TIntegerField;
    IBQuery_MontaMapaC_01_03: TIntegerField;
    IBQuery_MontaMapaC_01_04: TIntegerField;
    IBQuery_MontaMapaC_01_05: TIntegerField;
    IBQuery_MontaMapaC_01_06: TIntegerField;
    IBQuery_MontaMapaC_01_08: TIntegerField;
    IBQuery_MontaMapaC_01_09: TIntegerField;
    IBQuery_MontaMapaC_01_10: TIntegerField;
    IBQuery_MontaMapaC_01_11: TIntegerField;
    IBQuery_MontaMapaC_01_12: TIntegerField;
    IBQuery_MontaMapaC_01_13: TIntegerField;
    IBQuery_MontaMapaC_01_14: TIntegerField;
    IBQuery_MontaMapaC_01_15: TIntegerField;
    IBQuery_MontaMapaC_01_16: TIntegerField;
    IBQuery_MontaMapaC_01_17: TIntegerField;
    IBQuery_MontaMapaC_01_18: TIntegerField;
    IBQuery_MontaMapaC_01_19: TIntegerField;
    IBQuery_MontaMapaC_01_20: TIntegerField;
    IBQuery_MontaMapaC_01_21: TIntegerField;
    IBQuery_MontaMapaC_01_22: TIntegerField;
    IBQuery_MontaMapaC_01_23: TIntegerField;
    IBQuery_MontaMapaC_01_24: TIntegerField;
    IBQuery_MontaMapaC_01_25: TIntegerField;
    IBQuery_MontaMapaC_01_26: TIntegerField;
    IBQuery_MontaMapaC_01_27: TIntegerField;
    IBQuery_MontaMapaC_01_28: TIntegerField;
    IBQuery_MontaMapaC_01_29: TIntegerField;
    IBQuery_MontaMapaC_01_30: TIntegerField;
    IBQuery_MontaMapaC_01_31: TIntegerField;
    IBQuery_MontaMapaC_02_01: TIntegerField;
    IBQuery_MontaMapaC_02_02: TIntegerField;
    IBQuery_MontaMapaC_02_03: TIntegerField;
    IBQuery_MontaMapaC_02_04: TIntegerField;
    IBQuery_MontaMapaC_02_05: TIntegerField;
    IBQuery_MontaMapaC_02_06: TIntegerField;
    IBQuery_MontaMapaC_02_08: TIntegerField;
    IBQuery_MontaMapaC_02_09: TIntegerField;
    IBQuery_MontaMapaC_02_10: TIntegerField;
    IBQuery_MontaMapaC_02_11: TIntegerField;
    IBQuery_MontaMapaC_02_12: TIntegerField;
    IBQuery_MontaMapaC_02_13: TIntegerField;
    IBQuery_MontaMapaC_02_14: TIntegerField;
    IBQuery_MontaMapaC_02_15: TIntegerField;
    IBQuery_MontaMapaC_02_16: TIntegerField;
    IBQuery_MontaMapaC_02_17: TIntegerField;
    IBQuery_MontaMapaC_02_18: TIntegerField;
    IBQuery_MontaMapaC_02_19: TIntegerField;
    IBQuery_MontaMapaC_02_20: TIntegerField;
    IBQuery_MontaMapaC_02_21: TIntegerField;
    IBQuery_MontaMapaC_02_22: TIntegerField;
    IBQuery_MontaMapaC_02_23: TIntegerField;
    IBQuery_MontaMapaC_02_24: TIntegerField;
    IBQuery_MontaMapaC_02_25: TIntegerField;
    IBQuery_MontaMapaC_02_26: TIntegerField;
    IBQuery_MontaMapaC_02_27: TIntegerField;
    IBQuery_MontaMapaC_02_28: TIntegerField;
    IBQuery_MontaMapaC_02_29: TIntegerField;
    IBQuery_MontaMapaC_03_01: TIntegerField;
    IBQuery_MontaMapaC_03_02: TIntegerField;
    IBQuery_MontaMapaC_03_03: TIntegerField;
    IBQuery_MontaMapaC_03_04: TIntegerField;
    IBQuery_MontaMapaC_03_05: TIntegerField;
    IBQuery_MontaMapaC_03_06: TIntegerField;
    IBQuery_MontaMapaC_03_08: TIntegerField;
    IBQuery_MontaMapaC_03_09: TIntegerField;
    IBQuery_MontaMapaC_03_10: TIntegerField;
    IBQuery_MontaMapaC_03_11: TIntegerField;
    IBQuery_MontaMapaC_03_12: TIntegerField;
    IBQuery_MontaMapaC_03_13: TIntegerField;
    IBQuery_MontaMapaC_03_14: TIntegerField;
    IBQuery_MontaMapaC_03_15: TIntegerField;
    IBQuery_MontaMapaC_03_16: TIntegerField;
    IBQuery_MontaMapaC_03_17: TIntegerField;
    IBQuery_MontaMapaC_03_18: TIntegerField;
    IBQuery_MontaMapaC_03_19: TIntegerField;
    IBQuery_MontaMapaC_03_20: TIntegerField;
    IBQuery_MontaMapaC_03_21: TIntegerField;
    IBQuery_MontaMapaC_03_22: TIntegerField;
    IBQuery_MontaMapaC_03_23: TIntegerField;
    IBQuery_MontaMapaC_03_24: TIntegerField;
    IBQuery_MontaMapaC_03_25: TIntegerField;
    IBQuery_MontaMapaC_03_26: TIntegerField;
    IBQuery_MontaMapaC_03_27: TIntegerField;
    IBQuery_MontaMapaC_03_28: TIntegerField;
    IBQuery_MontaMapaC_03_29: TIntegerField;
    IBQuery_MontaMapaC_03_30: TIntegerField;
    IBQuery_MontaMapaC_03_31: TIntegerField;
    IBQuery_MontaMapaC_04_01: TIntegerField;
    IBQuery_MontaMapaC_04_02: TIntegerField;
    IBQuery_MontaMapaC_04_03: TIntegerField;
    IBQuery_MontaMapaC_04_04: TIntegerField;
    IBQuery_MontaMapaC_04_05: TIntegerField;
    IBQuery_MontaMapaC_04_06: TIntegerField;
    IBQuery_MontaMapaC_04_08: TIntegerField;
    IBQuery_MontaMapaC_04_09: TIntegerField;
    IBQuery_MontaMapaC_04_10: TIntegerField;
    IBQuery_MontaMapaC_04_11: TIntegerField;
    IBQuery_MontaMapaC_04_12: TIntegerField;
    IBQuery_MontaMapaC_04_13: TIntegerField;
    IBQuery_MontaMapaC_04_14: TIntegerField;
    IBQuery_MontaMapaC_04_15: TIntegerField;
    IBQuery_MontaMapaC_04_16: TIntegerField;
    IBQuery_MontaMapaC_04_17: TIntegerField;
    IBQuery_MontaMapaC_04_18: TIntegerField;
    IBQuery_MontaMapaC_04_19: TIntegerField;
    IBQuery_MontaMapaC_04_20: TIntegerField;
    IBQuery_MontaMapaC_04_21: TIntegerField;
    IBQuery_MontaMapaC_04_22: TIntegerField;
    IBQuery_MontaMapaC_04_23: TIntegerField;
    IBQuery_MontaMapaC_04_24: TIntegerField;
    IBQuery_MontaMapaC_04_25: TIntegerField;
    IBQuery_MontaMapaC_04_26: TIntegerField;
    IBQuery_MontaMapaC_04_27: TIntegerField;
    IBQuery_MontaMapaC_04_28: TIntegerField;
    IBQuery_MontaMapaC_04_29: TIntegerField;
    IBQuery_MontaMapaC_04_30: TIntegerField;
    IBQuery_MontaMapaC_05_01: TIntegerField;
    IBQuery_MontaMapaC_05_02: TIntegerField;
    IBQuery_MontaMapaC_05_03: TIntegerField;
    IBQuery_MontaMapaC_05_04: TIntegerField;
    IBQuery_MontaMapaC_05_05: TIntegerField;
    IBQuery_MontaMapaC_05_06: TIntegerField;
    IBQuery_MontaMapaC_05_08: TIntegerField;
    IBQuery_MontaMapaC_05_09: TIntegerField;
    IBQuery_MontaMapaC_05_10: TIntegerField;
    IBQuery_MontaMapaC_05_11: TIntegerField;
    IBQuery_MontaMapaC_05_12: TIntegerField;
    IBQuery_MontaMapaC_05_13: TIntegerField;
    IBQuery_MontaMapaC_05_14: TIntegerField;
    IBQuery_MontaMapaC_05_15: TIntegerField;
    IBQuery_MontaMapaC_05_16: TIntegerField;
    IBQuery_MontaMapaC_05_17: TIntegerField;
    IBQuery_MontaMapaC_05_18: TIntegerField;
    IBQuery_MontaMapaC_05_19: TIntegerField;
    IBQuery_MontaMapaC_05_20: TIntegerField;
    IBQuery_MontaMapaC_05_21: TIntegerField;
    IBQuery_MontaMapaC_05_22: TIntegerField;
    IBQuery_MontaMapaC_05_23: TIntegerField;
    IBQuery_MontaMapaC_05_24: TIntegerField;
    IBQuery_MontaMapaC_05_25: TIntegerField;
    IBQuery_MontaMapaC_05_26: TIntegerField;
    IBQuery_MontaMapaC_05_27: TIntegerField;
    IBQuery_MontaMapaC_05_28: TIntegerField;
    IBQuery_MontaMapaC_05_29: TIntegerField;
    IBQuery_MontaMapaC_05_30: TIntegerField;
    IBQuery_MontaMapaC_05_31: TIntegerField;
    IBQuery_MontaMapaC_06_01: TIntegerField;
    IBQuery_MontaMapaC_06_02: TIntegerField;
    IBQuery_MontaMapaC_06_03: TIntegerField;
    IBQuery_MontaMapaC_06_04: TIntegerField;
    IBQuery_MontaMapaC_06_05: TIntegerField;
    IBQuery_MontaMapaC_06_06: TIntegerField;
    IBQuery_MontaMapaC_06_08: TIntegerField;
    IBQuery_MontaMapaC_06_09: TIntegerField;
    IBQuery_MontaMapaC_06_10: TIntegerField;
    IBQuery_MontaMapaC_06_11: TIntegerField;
    IBQuery_MontaMapaC_06_12: TIntegerField;
    IBQuery_MontaMapaC_06_13: TIntegerField;
    IBQuery_MontaMapaC_06_14: TIntegerField;
    IBQuery_MontaMapaC_06_15: TIntegerField;
    IBQuery_MontaMapaC_06_16: TIntegerField;
    IBQuery_MontaMapaC_06_17: TIntegerField;
    IBQuery_MontaMapaC_06_18: TIntegerField;
    IBQuery_MontaMapaC_06_19: TIntegerField;
    IBQuery_MontaMapaC_06_20: TIntegerField;
    IBQuery_MontaMapaC_06_21: TIntegerField;
    IBQuery_MontaMapaC_06_22: TIntegerField;
    IBQuery_MontaMapaC_06_23: TIntegerField;
    IBQuery_MontaMapaC_06_24: TIntegerField;
    IBQuery_MontaMapaC_06_25: TIntegerField;
    IBQuery_MontaMapaC_06_26: TIntegerField;
    IBQuery_MontaMapaC_06_27: TIntegerField;
    IBQuery_MontaMapaC_06_28: TIntegerField;
    IBQuery_MontaMapaC_06_29: TIntegerField;
    IBQuery_MontaMapaC_06_30: TIntegerField;
    IBQuery_MontaMapaC_07_01: TIntegerField;
    IBQuery_MontaMapaC_07_02: TIntegerField;
    IBQuery_MontaMapaC_07_03: TIntegerField;
    IBQuery_MontaMapaC_07_04: TIntegerField;
    IBQuery_MontaMapaC_07_05: TIntegerField;
    IBQuery_MontaMapaC_07_06: TIntegerField;
    IBQuery_MontaMapaC_07_08: TIntegerField;
    IBQuery_MontaMapaC_07_09: TIntegerField;
    IBQuery_MontaMapaC_07_10: TIntegerField;
    IBQuery_MontaMapaC_07_11: TIntegerField;
    IBQuery_MontaMapaC_07_12: TIntegerField;
    IBQuery_MontaMapaC_07_13: TIntegerField;
    IBQuery_MontaMapaC_07_14: TIntegerField;
    IBQuery_MontaMapaC_07_15: TIntegerField;
    IBQuery_MontaMapaC_07_16: TIntegerField;
    IBQuery_MontaMapaC_07_17: TIntegerField;
    IBQuery_MontaMapaC_07_18: TIntegerField;
    IBQuery_MontaMapaC_07_19: TIntegerField;
    IBQuery_MontaMapaC_07_20: TIntegerField;
    IBQuery_MontaMapaC_07_21: TIntegerField;
    IBQuery_MontaMapaC_07_22: TIntegerField;
    IBQuery_MontaMapaC_07_23: TIntegerField;
    IBQuery_MontaMapaC_07_24: TIntegerField;
    IBQuery_MontaMapaC_07_25: TIntegerField;
    IBQuery_MontaMapaC_07_27: TIntegerField;
    IBQuery_MontaMapaC_07_28: TIntegerField;
    IBQuery_MontaMapaC_07_29: TIntegerField;
    IBQuery_MontaMapaC_07_30: TIntegerField;
    IBQuery_MontaMapaC_07_31: TIntegerField;
    IBQuery_MontaMapaC_08_01: TIntegerField;
    IBQuery_MontaMapaC_08_02: TIntegerField;
    IBQuery_MontaMapaC_08_03: TIntegerField;
    IBQuery_MontaMapaC_08_04: TIntegerField;
    IBQuery_MontaMapaC_08_05: TIntegerField;
    IBQuery_MontaMapaC_08_06: TIntegerField;
    IBQuery_MontaMapaC_08_08: TIntegerField;
    IBQuery_MontaMapaC_08_09: TIntegerField;
    IBQuery_MontaMapaC_08_10: TIntegerField;
    IBQuery_MontaMapaC_08_11: TIntegerField;
    IBQuery_MontaMapaC_08_12: TIntegerField;
    IBQuery_MontaMapaC_08_13: TIntegerField;
    IBQuery_MontaMapaC_08_14: TIntegerField;
    IBQuery_MontaMapaC_08_15: TIntegerField;
    IBQuery_MontaMapaC_08_16: TIntegerField;
    IBQuery_MontaMapaC_08_17: TIntegerField;
    IBQuery_MontaMapaC_08_18: TIntegerField;
    IBQuery_MontaMapaC_08_19: TIntegerField;
    IBQuery_MontaMapaC_08_20: TIntegerField;
    IBQuery_MontaMapaC_08_21: TIntegerField;
    IBQuery_MontaMapaC_08_22: TIntegerField;
    IBQuery_MontaMapaC_08_23: TIntegerField;
    IBQuery_MontaMapaC_08_24: TIntegerField;
    IBQuery_MontaMapaC_08_25: TIntegerField;
    IBQuery_MontaMapaC_08_26: TIntegerField;
    IBQuery_MontaMapaC_08_27: TIntegerField;
    IBQuery_MontaMapaC_08_28: TIntegerField;
    IBQuery_MontaMapaC_08_29: TIntegerField;
    IBQuery_MontaMapaC_08_30: TIntegerField;
    IBQuery_MontaMapaC_08_31: TIntegerField;
    IBQuery_MontaMapaC_09_01: TIntegerField;
    IBQuery_MontaMapaC_09_02: TIntegerField;
    IBQuery_MontaMapaC_09_03: TIntegerField;
    IBQuery_MontaMapaC_09_04: TIntegerField;
    IBQuery_MontaMapaC_09_05: TIntegerField;
    IBQuery_MontaMapaC_09_06: TIntegerField;
    IBQuery_MontaMapaC_09_08: TIntegerField;
    IBQuery_MontaMapaC_09_09: TIntegerField;
    IBQuery_MontaMapaC_09_10: TIntegerField;
    IBQuery_MontaMapaC_09_11: TIntegerField;
    IBQuery_MontaMapaC_09_12: TIntegerField;
    IBQuery_MontaMapaC_09_13: TIntegerField;
    IBQuery_MontaMapaC_09_14: TIntegerField;
    IBQuery_MontaMapaC_09_15: TIntegerField;
    IBQuery_MontaMapaC_09_16: TIntegerField;
    IBQuery_MontaMapaC_09_17: TIntegerField;
    IBQuery_MontaMapaC_09_18: TIntegerField;
    IBQuery_MontaMapaC_09_19: TIntegerField;
    IBQuery_MontaMapaC_09_20: TIntegerField;
    IBQuery_MontaMapaC_09_21: TIntegerField;
    IBQuery_MontaMapaC_09_22: TIntegerField;
    IBQuery_MontaMapaC_09_23: TIntegerField;
    IBQuery_MontaMapaC_09_24: TIntegerField;
    IBQuery_MontaMapaC_09_25: TIntegerField;
    IBQuery_MontaMapaC_09_26: TIntegerField;
    IBQuery_MontaMapaC_09_27: TIntegerField;
    IBQuery_MontaMapaC_09_28: TIntegerField;
    IBQuery_MontaMapaC_09_29: TIntegerField;
    IBQuery_MontaMapaC_09_30: TIntegerField;
    IBQuery_MontaMapaC_10_01: TIntegerField;
    IBQuery_MontaMapaC_10_02: TIntegerField;
    IBQuery_MontaMapaC_10_03: TIntegerField;
    IBQuery_MontaMapaC_10_04: TIntegerField;
    IBQuery_MontaMapaC_10_05: TIntegerField;
    IBQuery_MontaMapaC_10_06: TIntegerField;
    IBQuery_MontaMapaC_10_08: TIntegerField;
    IBQuery_MontaMapaC_10_09: TIntegerField;
    IBQuery_MontaMapaC_10_10: TIntegerField;
    IBQuery_MontaMapaC_10_11: TIntegerField;
    IBQuery_MontaMapaC_10_12: TIntegerField;
    IBQuery_MontaMapaC_10_13: TIntegerField;
    IBQuery_MontaMapaC_10_14: TIntegerField;
    IBQuery_MontaMapaC_10_15: TIntegerField;
    IBQuery_MontaMapaC_10_16: TIntegerField;
    IBQuery_MontaMapaC_10_17: TIntegerField;
    IBQuery_MontaMapaC_10_18: TIntegerField;
    IBQuery_MontaMapaC_10_19: TIntegerField;
    IBQuery_MontaMapaC_10_20: TIntegerField;
    IBQuery_MontaMapaC_10_21: TIntegerField;
    IBQuery_MontaMapaC_10_22: TIntegerField;
    IBQuery_MontaMapaC_10_23: TIntegerField;
    IBQuery_MontaMapaC_10_24: TIntegerField;
    IBQuery_MontaMapaC_10_25: TIntegerField;
    IBQuery_MontaMapaC_10_26: TIntegerField;
    IBQuery_MontaMapaC_10_27: TIntegerField;
    IBQuery_MontaMapaC_10_28: TIntegerField;
    IBQuery_MontaMapaC_10_29: TIntegerField;
    IBQuery_MontaMapaC_10_30: TIntegerField;
    IBQuery_MontaMapaC_10_31: TIntegerField;
    IBQuery_MontaMapaC_11_01: TIntegerField;
    IBQuery_MontaMapaC_11_02: TIntegerField;
    IBQuery_MontaMapaC_11_03: TIntegerField;
    IBQuery_MontaMapaC_11_04: TIntegerField;
    IBQuery_MontaMapaC_11_05: TIntegerField;
    IBQuery_MontaMapaC_11_06: TIntegerField;
    IBQuery_MontaMapaC_11_08: TIntegerField;
    IBQuery_MontaMapaC_11_09: TIntegerField;
    IBQuery_MontaMapaC_11_10: TIntegerField;
    IBQuery_MontaMapaC_11_11: TIntegerField;
    IBQuery_MontaMapaC_11_12: TIntegerField;
    IBQuery_MontaMapaC_11_13: TIntegerField;
    IBQuery_MontaMapaC_11_14: TIntegerField;
    IBQuery_MontaMapaC_11_15: TIntegerField;
    IBQuery_MontaMapaC_11_16: TIntegerField;
    IBQuery_MontaMapaC_11_17: TIntegerField;
    IBQuery_MontaMapaC_11_18: TIntegerField;
    IBQuery_MontaMapaC_11_19: TIntegerField;
    IBQuery_MontaMapaC_11_20: TIntegerField;
    IBQuery_MontaMapaC_11_21: TIntegerField;
    IBQuery_MontaMapaC_11_22: TIntegerField;
    IBQuery_MontaMapaC_11_23: TIntegerField;
    IBQuery_MontaMapaC_11_24: TIntegerField;
    IBQuery_MontaMapaC_11_25: TIntegerField;
    IBQuery_MontaMapaC_11_26: TIntegerField;
    IBQuery_MontaMapaC_11_27: TIntegerField;
    IBQuery_MontaMapaC_11_28: TIntegerField;
    IBQuery_MontaMapaC_11_29: TIntegerField;
    IBQuery_MontaMapaC_11_30: TIntegerField;
    IBQuery_MontaMapaC_12_01: TIntegerField;
    IBQuery_MontaMapaC_12_02: TIntegerField;
    IBQuery_MontaMapaC_12_03: TIntegerField;
    IBQuery_MontaMapaC_12_04: TIntegerField;
    IBQuery_MontaMapaC_12_05: TIntegerField;
    IBQuery_MontaMapaC_12_06: TIntegerField;
    IBQuery_MontaMapaC_12_08: TIntegerField;
    IBQuery_MontaMapaC_12_09: TIntegerField;
    IBQuery_MontaMapaC_12_10: TIntegerField;
    IBQuery_MontaMapaC_12_11: TIntegerField;
    IBQuery_MontaMapaC_12_12: TIntegerField;
    IBQuery_MontaMapaC_12_13: TIntegerField;
    IBQuery_MontaMapaC_12_14: TIntegerField;
    IBQuery_MontaMapaC_12_15: TIntegerField;
    IBQuery_MontaMapaC_12_16: TIntegerField;
    IBQuery_MontaMapaC_12_17: TIntegerField;
    IBQuery_MontaMapaC_12_18: TIntegerField;
    IBQuery_MontaMapaC_12_19: TIntegerField;
    IBQuery_MontaMapaC_12_20: TIntegerField;
    IBQuery_MontaMapaC_12_21: TIntegerField;
    IBQuery_MontaMapaC_12_22: TIntegerField;
    IBQuery_MontaMapaC_12_23: TIntegerField;
    IBQuery_MontaMapaC_12_24: TIntegerField;
    IBQuery_MontaMapaC_12_25: TIntegerField;
    IBQuery_MontaMapaC_12_26: TIntegerField;
    IBQuery_MontaMapaC_12_27: TIntegerField;
    IBQuery_MontaMapaC_12_28: TIntegerField;
    IBQuery_MontaMapaC_12_29: TIntegerField;
    IBQuery_MontaMapaC_12_30: TIntegerField;
    IBQuery_MontaMapaC_12_31: TIntegerField;
    IBQuery_MontaMapaC_01_07: TIntegerField;
    IBQuery_MontaMapaC_02_07: TIntegerField;
    IBQuery_MontaMapaC_03_07: TIntegerField;
    IBQuery_MontaMapaC_04_07: TIntegerField;
    IBQuery_MontaMapaC_05_07: TIntegerField;
    IBQuery_MontaMapaC_06_07: TIntegerField;
    IBQuery_MontaMapaC_07_07: TIntegerField;
    IBQuery_MontaMapaC_08_07: TIntegerField;
    IBQuery_MontaMapaC_09_07: TIntegerField;
    IBQuery_MontaMapaC_10_07: TIntegerField;
    IBQuery_MontaMapaC_11_07: TIntegerField;
    IBQuery_MontaMapaC_12_07: TIntegerField;
    IBQuery_MontaMapaC_07_26: TIntegerField;
    IBQuery_SalaAula: TIBQuery;
    DSQ_SalaAula: TDataSource;
    IBQuery_SalaAulaCODSALA: TIBStringField;
    IBQuery_SalaAulaCAPACIDADE: TIntegerField;
    IBQuery_SalaAulaOBSERVACAO: TIBStringField;
    IBQuery_SalaAulaSITUACAO: TIBStringField;
    IBQuery_SalaAulaDATAINICIO: TDateTimeField;
    IBQuery_SalaAulaDATATERMINO: TDateTimeField;
    IBTable_SalaOcupacao: TIBTable;
    DST_SalaOcupacao: TDataSource;
    IBQuery_Observacao: TIBQuery;
    DSQ_Observacao: TDataSource;
    IBQuery_SalaOcupacao: TIBQuery;
    DataSource1: TDataSource;
    Panel10: TPanel;
    JvGradientCaption1: TJvGradientCaption;
    IBTable_MapaSala: TIBTable;
    IBTable_SalaObs: TIBTable;
    DataSource2: TDataSource;
    IBTable_SalaObsIDOBS: TIntegerField;
    IBTable_SalaObsINICIO: TDateTimeField;
    IBTable_SalaObsTERMINO: TDateTimeField;
    IBTable_SalaObsSOLICITANTE: TIBStringField;
    IBTable_SalaObsDESCRICAO: TIBStringField;
    JvTransparentButton_F_105_6: TJvTransparentButton;
    JvTransparentButton_105_65: TJvTransparentButton;
    JvTransparentButton_Reserva_Outro_evento: TJvTransparentButton;
    JvTransparentButton_IEMA_105_9: TJvTransparentButton;
    JvTransparentButton_SalaReservada: TJvTransparentButton;
    JvTransparentButton13: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvGradientCaption_MenuPrincipal: TJvGradientCaption;
    DBNavigator1: TDBNavigator;
    IBQuery_PTS_Semana: TIBQuery;
    IBStringField1: TIBStringField;
    IntegerField1: TIntegerField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DataSource3: TDataSource;
    IBQuery_MontaMapaCAPACIDADE: TIntegerField;
    JvTransparentButton1: TJvTransparentButton;
    ImageList_SituacaoItem: TImageList;
    IBTable_SalaOcupacaoAlterar: TStringField;
    IBTable_SalaOcupacaoExcluir: TStringField;
    JvShape3: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    IBQuery_ObservacaoIDOBS: TIntegerField;
    IBQuery_ObservacaoINICIO: TDateTimeField;
    IBQuery_ObservacaoTERMINO: TDateTimeField;
    IBQuery_ObservacaoSOLICITANTE: TIBStringField;
    IBQuery_ObservacaoDESCRICAO: TIBStringField;
    IBTable_SalaOcupacaoCODSALA: TIBStringField;
    IBTable_SalaOcupacaoINICIO: TDateTimeField;
    IBTable_SalaOcupacaoTERMINO: TDateTimeField;
    IBTable_SalaOcupacaoIDCURSO: TSmallintField;
    IBTable_SalaOcupacaoIDTURMA: TIntegerField;
    IBTable_SalaOcupacaoDESCRICAO: TIBStringField;
    IBTable_SalaOcupacaoSOLICITANTE: TIBStringField;
    IBQuery_obs: TIBQuery;
    IntegerField2: TIntegerField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    Panel2: TPanel;
    JvCaptionPanel3: TJvCaptionPanel;
    DBGrid4: TDBGrid;
    DBGrid_Mapa: TDBGrid;
    JvCaptionPanel1: TJvCaptionPanel;
    DBGrid_Visualizar_Observacao: TDBGrid;
    JvCaptionPanel_RecursoSalaAula: TJvCaptionPanel;
    JvTransparentButton_Fecha_RecursoSalaAula: TJvTransparentButton;
    Panel5: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit_RecObs: TDBEdit;
    DBEdit_Quantidade: TDBEdit;
    DBEdit_Recurso: TDBEdit;
    DBGrid_Recurso: TDBGrid;
    ComboBox_Sala: TComboBox;
    Label9: TLabel;
    JvDateEdit_DataInicio: TJvDateEdit;
    Label10: TLabel;
    JvDateEdit_DataTermino: TJvDateEdit;
    JvTransparentButton_TratarCalendario: TJvTransparentButton;
    JvTransparentButton_LimpaLista: TJvTransparentButton;
    JvCaptionPanel_Reserva: TJvCaptionPanel;
    StatusBar1: TStatusBar;
    DBGrid_SelReserva: TDBGrid;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton3: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_Fecha_Reserva: TJvTransparentButton;
    DBRichEdit_Descricao: TDBRichEdit;
    JvDBDateEdit_Inicio: TJvDBDateEdit;
    JvDBDateEdit_Termino: TJvDBDateEdit;
    DBRichEdit_Solicitante: TDBRichEdit;
    DBComboBox_Sala: TDBComboBox;

    Procedure AlimentaComboBoxSala;
    procedure FecharJanelas;

    Function PegaSalaReservada(VS_InicioAno: String; VI_Ocup: integer): integer;
    Function PegaSalaTurma(VS_InicioAno: String; VI_Ocup: integer): integer;
    Function PegaSalaPTS(VS_InicioAno: String; VI_Ocup: integer): integer;

    procedure Grava_Obs(IdObs, Inicio, Termino, Solicitante, Descricao: String);
    Function WeekNum(const TDT:TDateTime) : Word;

    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_TratarCalendarioClick(Sender: TObject);
    procedure JvTransparentButton_Cancela_InsercaoLocalClick(Sender: TObject);
    procedure JvTransparentButton_LimpaListaClick(Sender: TObject);
    procedure ComboBox_SalaChange(Sender: TObject);
    procedure DBGrid_MapaCellClick(Column: TColumn);
    procedure JvTransparentButton_Fecha_Sol_ReservaClick(Sender: TObject);
    procedure JvTransparentButton_CancelaReservaClick(Sender: TObject);
    procedure JvTransparentButton_GravaReservaClick(Sender: TObject);

    procedure DBGrid_MapaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure DBGrid_SelReservaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_SelReservaCellClick(Column: TColumn);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure JvTransparentButton_Fecha_RecursoSalaAulaClick(Sender: TObject);
    procedure JvTransparentButton_SalaReservadaClick(Sender: TObject);
    procedure JvTransparentButton_Reserva_Outro_eventoClick( Sender: TObject);

  private    { Private declarations }
     Cont, VI_Inicio_old, VI_Final_Old: Integer;
     VS_Dia: String;

     VB_Mostrar: Boolean;
  public
    { Public declarations }
  end;

var
  Form_Mapa_Sala: TForm_Mapa_Sala;

implementation

uses Module;

{$R *.dfm}

//-----------------------------------------------------------------------------
//-- Tratamento para fechar as janelas de comunicação do modulo
//-----------------------------------------------------------------------------

procedure TForm_Mapa_Sala.FecharJanelas;
begin
   JvCaptionPanel_RecursoSalaAula.Visible:= False;
   JvCaptionPanel_Reserva.Visible:= False;
end;

//------------------------------------------------------------------------------
// Alimenta os combox de sala de aula
//------------------------------------------------------------------------------

Procedure TForm_Mapa_Sala.AlimentaComboBoxSala;
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add('Select distinct CodSala From SalaAula order By CodSala');
   DM.IBQuery_Executa.Open;
   DM.IBQuery_Executa.First;

   ComboBox_Sala.Items.Clear;
   DBComboBox_Sala.Items.Clear;

   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_Sala.Items.Add(DM.IBQuery_Executa.FieldByName('CodSala').AsString);
      DBComboBox_Sala.Items.Add(DM.IBQuery_Executa.FieldByName('CodSala').AsString);

      DM.IBQuery_Executa.Next;
   end;
end;

//-----------------------------------------------------------------------------
//-- Tratamento de abertura da Form
//-----------------------------------------------------------------------------

procedure TForm_Mapa_Sala.FormActivate(Sender: TObject);
var
   VS_DataFinal, VS_Comando: string;
begin
   VB_Mostrar:= False;

   FecharJanelas;

   VS_DataFinal:= '31/12/'+Funcoes_TrataData.AnoAtual;

   JvDateEdit_DataInicio.Date:= Date;
   JvDateEdit_DataTermino.Date:= StrToDate(VS_DataFinal);


   Cont:= 0;
   VI_Inicio_old:= 0;
   VI_Final_Old:= 0;

   AlimentaComboBoxSala;                                                       //----- Carga do Combo de sala de aula

   IBQuery_SalaAula.Open;
   IBQuery_MontaMapa.Close;
   IBTable_MapaSala.Open;
   IBTable_SalaOcupacao.Open;
   IBTable_SalaObs.Open;

   JvTransparentButton_AtualizaClick(Sender);

   IBQuery_obs.Open;
   JvTransparentButton_TratarCalendarioClick(Sender);

end;


//-----------------------------------------------------------------------------
//-- Tratamento par atualizar a relação de sala de aula
//-----------------------------------------------------------------------------

procedure TForm_Mapa_Sala.JvTransparentButton_AtualizaClick(Sender: TObject);
var
   VS_Comando, VS_InicioAno: String;
   VI_Inicio, VI_Final: Integer;
   c, VI_Ocup, VI_Ajusta: Integer;
begin
   VB_Mostrar:= False;

   VI_Ocup:= 0;

   VS_InicioAno:= '01/01/'+Funcoes_TrataData.AnoAtual;
//   VS_InicioAno:= DateToStr(Date);

   Funcoes.ExecusaoQuery('Delete from salamapa');
   Funcoes.ExecusaoQuery('Delete from salaOBS');

   IBQuery_SalaAula.First;

   While not IBQuery_SalaAula.eof do
   begin
       IBTable_MapaSala.Append;
       IBTable_MapaSala.Fields[0].AsString:= IBQuery_SalaAula.FieldByNAme('CodSala').AsString;

//       for C:= 1 to 366 do
//           IBTable_MapaSala.Fields[c].AsString:= '';

       if trim(IBQuery_SalaAula.FieldByName('DataInicio').AsString) <> '' then
       begin
          VI_Ocup:= VI_Ocup + 100;

          Grava_Obs( IntToStr(VI_Ocup),
                     IBQuery_SalaAula.FieldByName('DataInicio').AsString,
                     IBQuery_SalaAula.FieldByName('DataTermino').AsString,
                     IBQuery_SalaAula.FieldByName('Situacao').AsString,
                     IBQuery_SalaAula.FieldByName('Observacao').AsString
                   );

          VI_Inicio:= DaysBetween(StrToDate(VS_InicioAno),IBQuery_SalaAula.FieldByName('DataInicio').AsDateTime)+2;
          VI_Final:=  DaysBetween(StrToDate(VS_InicioAno),IBQuery_SalaAula.FieldByName('DataTermino').AsDateTime)+2;

          for c:= VI_Inicio to VI_Final do
             IBTable_MapaSala.Fields[c].AsInteger:= VI_Ocup;
       end;

       IBTable_SalaOcupacao.First;

       if IBTable_SalaOcupacao.FieldByNAme('CodSala').AsString <> '' then
       begin
          VI_Ajusta:= 100;

          VI_Ocup:= VI_Ocup + 1;

          Grava_Obs( IntToStr(VI_Ocup+VI_Ajusta),
                     IBQuery_SalaAula.FieldByName('DataInicio').AsString,
                     IBQuery_SalaAula.FieldByName('DataTermino').AsString,
                     IBQuery_SalaAula.FieldByName('Situacao').AsString,
                     IBQuery_SalaAula.FieldByName('Observacao').AsString
                   );

          VI_Inicio:= DaysBetween(StrToDate(VS_InicioAno),IBTable_SalaOcupacao.FieldByName('Inicio').AsDateTime)+2;
          VI_Final:=  DaysBetween(StrToDate(VS_InicioAno),IBTable_SalaOcupacao.FieldByName('Termino').AsDateTime)+2;

          for c:= VI_Inicio to VI_Final do
             IBTable_MapaSala.Fields[c].AsInteger:= VI_Ocup+VI_Ajusta;

          IBTable_SalaOcupacao.Next;
       end;

        //----
       //---- Pegar Sala reservada

      VI_Ocup:= PegaSalaReservada(VS_InicioAno, VI_Ocup);

        //----
       //---- Pegar a sala de aula de acordo com a turma

      VI_Ocup:= PegaSalaTurma(VS_InicioAno, VI_Ocup);

        //----
       //---- Pegar a sala de aula de acordo com a turma

       VI_Ocup:= PegaSalaPTS(VS_InicioAno, VI_Ocup);

       IBTable_MapaSala.Post;
       Funcoes.ExecutaTransacao;
       IBQuery_SalaAula.Next;
   end;
   Funcoes.ExecutaTransacao;

   VB_Mostrar:= True;


   Funcoes.AtualizaQuery(IBQuery_MontaMapa);
end;


//------------------------------------------------------------------------------
// Pega Sala de aula de acordo com o PTS
//------------------------------------------------------------------------------

Function TForm_Mapa_Sala.PegaSalaReservada(VS_InicioAno: String; VI_Ocup: integer): integer;
var
   VS_Comando: String;
   VI_Inicio, VI_Final: Integer;
   c, VI_Ajusta: Integer;
begin

       VS_Comando:= 'Select Solicitante, Descricao, inicio as DataInicio, termino as DataTermino, CodSala '+
                    ' From salaocupacao '+
                    ' where codsala = '+#39+IBQuery_SalaAula.FieldByNAme('CodSala').AsString+#39+
                    ' order by inicio ';
        Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando );

       DM.IBQuery_Executa.First;

       if DM.IBQuery_Executa.FieldByNAme('CodSala').AsString <> '' then
       begin
          VI_Ajusta:= 300;
          VI_Ocup:= VI_Ocup + 1;

          Grava_Obs( IntToStr(VI_Ocup+VI_Ajusta),
                     DM.IBQuery_Executa.FieldByName('DataInicio').AsString,
                     DM.IBQuery_Executa.FieldByName('DataTermino').AsString,
                     DM.IBQuery_Executa.FieldByName('Solicitante').AsString,
                     DM.IBQuery_Executa.FieldByName('Descricao').AsString
                   );

          VI_Inicio:= DaysBetween(StrToDate(VS_InicioAno),DM.IBQuery_Executa.FieldByName('DataInicio').AsDateTime)+2;
          VI_Final:=  DaysBetween(StrToDate(VS_InicioAno),DM.IBQuery_Executa.FieldByName('DataTermino').AsDateTime)+2;

          for c:= VI_Inicio to VI_Final do
             IBTable_MapaSala.Fields[c].AsInteger:= VI_Ocup+VI_Ajusta;

          DM.IBQuery_Executa.Next;
       end;
       PegaSalaReservada:= VI_Ocup;

end;

//------------------------------------------------------------------------------
// Pega Sala de aula de acordo com o PTS
//------------------------------------------------------------------------------

Function TForm_Mapa_Sala.PegaSalaTurma(VS_InicioAno: String; VI_Ocup: integer): integer;
var
   VS_Comando: String;
   VI_Inicio, VI_Final: Integer;
   c, VI_Ajusta: Integer;
begin

       VS_Comando:= 'Select IdCurso, CodCurso, idTurma, CodCurso, Turma, ano, datainicio, datatermino, qdealunos, CodSala, Coordenador '+
                    ' From Turmas_todas_view '+
                    ' where ano = 2022 '+
                    ' and ((status = '+#39+'A'+#39+') or (status = '+#39+'P'+#39+')) '+
                    ' and codsala = '+#39+IBQuery_SalaAula.FieldByNAme('CodSala').AsString+#39+
                    ' order by datainicio ';
        Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando );

       DM.IBQuery_Executa.First;

       if DM.IBQuery_Executa.FieldByNAme('CodSala').AsString <> '' then
       begin
          if trim(DM.IBQuery_Executa.FieldByName('CodCurso').AsString) <> 'GRT' then
             VI_Ajusta:= 2000
          else
             VI_Ajusta:= 5000;

          VI_Ocup:= VI_Ocup + 1;

          Grava_Obs( IntToStr(VI_Ocup+VI_Ajusta),
                     DM.IBQuery_Executa.FieldByName('DataInicio').AsString,
                     DM.IBQuery_Executa.FieldByName('DataTermino').AsString,
                     'Curso: '+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' '+DM.IBQuery_Executa.FieldByName('Turma').AsString,
                     ''+
                     'Coordenador '+DM.IBQuery_Executa.FieldByName('Coordenador').AsString
                   );

          VI_Inicio:= DaysBetween(StrToDate(VS_InicioAno),DM.IBQuery_Executa.FieldByName('DataInicio').AsDateTime)+2;
          VI_Final:=  DaysBetween(StrToDate(VS_InicioAno),DM.IBQuery_Executa.FieldByName('DataTermino').AsDateTime)+2;

          for c:= VI_Inicio to VI_Final do
             IBTable_MapaSala.Fields[c].AsInteger:= VI_Ocup+VI_Ajusta;

          DM.IBQuery_Executa.Next;
       end;
       PegaSalaTurma:= VI_Ocup;

end;

//------------------------------------------------------------------------------
// Pega Sala de aula de acordo com o PTS
//------------------------------------------------------------------------------

Function TForm_Mapa_Sala.PegaSalaPTS(VS_InicioAno: String; VI_Ocup: integer): integer;
var
   VS_Comando: String;
   VI_Inicio, VI_Final: Integer;
   c, VI_Ajusta: Integer;
begin
       VS_Comando:= 'select distinct p.IdCurso, p.IdTurma, t.codcurso, t.Turma, s.Data as datainicio,s.Data as DataTermino, s.local as CodSala '+
                    ' From pts_principal P, pts_semana s, turmas_todas_view t '+
                    ' Where p.IdPTS = s.IdPTS '+
                    ' and   p.IdCurso = t.IdCurso '+
                    ' and   p.IdTurma = t.IdTurma '+
                    ' and s.local = '+#39+IBQuery_SalaAula.FieldByNAme('CodSala').AsString+#39+
                    ' order by s.Data ';

       Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando );

       DM.IBQuery_Executa.First;

       if DM.IBQuery_Executa.FieldByNAme('CodSala').AsString <> '' then
       begin
          if trim(DM.IBQuery_Executa.FieldByName('CodCurso').AsString) <> 'GRT' then
             VI_Ajusta:= 2000
          else
             VI_Ajusta:= 5000;

          VI_Ocup:= VI_Ocup + 1;

          Grava_Obs( IntToStr(VI_Ocup+VI_Ajusta),
                     DM.IBQuery_Executa.FieldByName('DataInicio').AsString,
                     DM.IBQuery_Executa.FieldByName('DataTermino').AsString,
                     'Curso: '+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' '+DM.IBQuery_Executa.FieldByName('Turma').AsString,
                     ''+
                     'PTS '
                   );

          VI_Inicio:= DaysBetween(StrToDate(VS_InicioAno),DM.IBQuery_Executa.FieldByName('DataInicio').AsDateTime)+2;
          VI_Final:=  DaysBetween(StrToDate(VS_InicioAno),DM.IBQuery_Executa.FieldByName('DataTermino').AsDateTime)+2;

          for c:= VI_Inicio to VI_Final do
             IBTable_MapaSala.Fields[c].AsInteger:= VI_Ocup+VI_Ajusta;

          DM.IBQuery_Executa.Next;
       end;

       PegaSalaPTS:= VI_Ocup;
end;

//------------------------------------------------------------------------------
// Grava a observacao
//------------------------------------------------------------------------------

procedure TForm_Mapa_Sala.Grava_Obs(IdObs, Inicio, Termino, Solicitante, Descricao: String);
begin
   IBTable_SalaObs.Append;
   IBTable_SalaObs.FieldByName('IDOBS').AsString:= IdObs;
   IBTable_SalaObs.FieldByName('INICIO').AsString:= Inicio;
   IBTable_SalaObs.FieldByName('TERMINO').AsString:= Termino;
   IBTable_SalaObs.FieldByName('SOLICITANTE').AsString:= Solicitante;
   IBTable_SalaObs.FieldByName('DESCRICAO').AsString:= Descricao;
   IBTable_SalaObs.Post;

//   Funcoes.ExecutaTransacao;
end;

procedure TForm_Mapa_Sala.JvTransparentButton_WindowsClick( Sender: TObject);
begin

   Funcoes.Windows;
end;
//------------------------------------------------------------------------------
// Fecha o mapa de ocupação
//------------------------------------------------------------------------------

procedure TForm_Mapa_Sala.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Funcoes.ExecusaoQuery('Delete from salamapa');
   Funcoes.ExecusaoQuery('Delete from salaOBS');
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para busca o dia da semana
//   WeekOfTheYear da unit DateUtils?
//------------------------------------------------------------------------------

Function TForm_Mapa_Sala.WeekNum(const TDT:TDateTime) : Word;
var
   Y,M,D:Word;
   dtTmp:TDateTime;
//   Result: integer;
begin
   DecodeDate(TDT,Y,M,D);
   dtTmp := EnCodeDate(Y,1,1);
   Result := (Trunc(TDT-dtTmp)+(DayOfWeek(dtTmp)-1)) DIV 7;
   if Result = 0 then
      Result := 51
   else
      Result := Result-1;
//   WeekOfTheYear da unit DateUtils?
end;


//------------------------------------------------------------------------------
// Tratamento para Filtrar periodo
//------------------------------------------------------------------------------

procedure TForm_Mapa_Sala.JvTransparentButton_TratarCalendarioClick(Sender: TObject);
VAR
   VI_Inicio, VI_Final, C: Integer;
   VS_InicioAno: String;
begin
   if VB_Mostrar = True then
   begin
      VS_InicioAno:= '01/01/'+Funcoes_TrataData.AnoAtual;
//      VS_InicioAno:= JvDateEdit_DataInicio.Text;
//   VI_Inicio := DaysBetween(StrToDate(VS_InicioAno),JvDateEdit_DataInicio.Date);
      VI_Inicio := DaysBetween(StrToDate(VS_InicioAno),JvDateEdit_DataInicio.Date);
      VI_Final:=   DaysBetween(StrToDate(VS_InicioAno),JvDateEdit_DataTermino.Date)+2;
//   VI_Final:= VI_Inicio+DaysBetween(JvDateEdit_DataInicio.Date,JvDateEdit_DataTermino.Date);

      IBQuery_MontaMapa.Close;

      if Cont = 0 then
      begin
         VI_Inicio_old:= VI_Inicio;
         VI_Final_Old:= VI_Final;

         for c:= 1 to VI_Inicio do
            DBGrid_Mapa.Columns[c].Visible := false;

         for c:= VI_Final to 365 do
            DBGrid_Mapa.Columns[c].Visible := false;
         Cont:= Cont + 1;
      end
      else
      begin
         if VI_Inicio <> VI_Inicio_old then
         begin
            if VI_Inicio > VI_Inicio_old then
            begin
               for c:= VI_Inicio_old to VI_Inicio do
               begin
                   DBGrid_Mapa.Columns[c].Visible := false;
//                   Update;
               end;
            end
            else
            begin
               for c:= VI_Inicio+3 to VI_Inicio_old do
               begin
                   DBGrid_Mapa.Columns[c].Visible := True;
//                   Update;
               end;
            end;
         end;

         if VI_Final <> VI_Final_Old then
         begin
            if VI_Final > VI_Final_Old then
            begin
               for c:= VI_Final_Old to VI_Final do
               begin
                  DBGrid_Mapa.Columns[c].Visible := True;
//                  Update;
               end;
            end
            else
            begin
               for c:= VI_Final to VI_Final_Old do
               begin
                   DBGrid_Mapa.Columns[c].Visible := False;
//                   Update;
               end;
            end;
         end;
         VI_Inicio_old:= VI_Inicio;
         VI_Final_Old:= VI_Final;
         Update;
      end;

      IBQuery_MontaMapa.Open;
   end;
end;

procedure TForm_Mapa_Sala.JvTransparentButton_Cancela_InsercaoLocalClick(Sender: TObject);
var
   C: Integer;
begin
   for C:= 1 to 365 do
      DBGrid_Mapa.Columns[c].Visible := false;

end;

procedure TForm_Mapa_Sala.JvTransparentButton_LimpaListaClick( Sender: TObject);
var
   C: Integer;
begin
   Cont:= 0;

   JvDateEdit_DataInicio.Text:= '';
   JvDateEdit_DataTermino.Text:= '';

   for c:= 1 to VI_Inicio_old do
      DBGrid_Mapa.Columns[c].Visible := false;

   for c:= VI_Final_Old to 365 do
      DBGrid_Mapa.Columns[c].Visible := false;
end;

//------------------------------------------------------------------------------
// Tratamento para filtrar a sala
//------------------------------------------------------------------------------

procedure TForm_Mapa_Sala.ComboBox_SalaChange(Sender: TObject);
begin
  if ComboBox_Sala.Text <> '' then
     Funcoes.ExecutaQuery(IBQuery_MontaMapa, 'Select * From salamapa Where CodSala = '+#39+ComboBox_Sala.Text+#39+'order by codsala ' )
  else
     Funcoes.ExecutaQuery(IBQuery_MontaMapa, 'Select * From salamapa order by codsala ');
end;

procedure TForm_Mapa_Sala.DBGrid_MapaCellClick(Column: TColumn);
begin
   if Column.Title.Caption <> 'CODSALA' then
   begin
      VS_Dia:= Column.Title.Caption+'/'+Funcoes_TrataData.AnoAtual;

      if ((IBTable_SalaOcupacao.State = DSInsert) or (IBTable_SalaOcupacao.State = DSEdit )) then
      begin
         if DBComboBox_Sala.Text = '' then
            DBComboBox_Sala.Text:= IBQuery_MontaMapa.FieldByName('CodSala').AsString;;

         if JvCaptionPanel_Reserva.Visible = True then
         begin
            if JvDBDateEdit_Inicio.Text = '  /  /    ' then
               JvDBDateEdit_Inicio.Text:= Column.Title.Caption+'/'+Funcoes_TrataData.AnoAtual
            else
               if JvDBDateEdit_Termino.Text = '  /  /    ' then
                   JvDBDateEdit_Termino.Text:= Column.Title.Caption+'/'+Funcoes_TrataData.AnoAtual;

            DBRichEdit_Descricao.SetFocus;
         end;
      end
      else
      begin
         if Column.Field.AsString <> '' then
         begin
            IBQuery_obs.Locate('idobs',Column.Field.AsString,[]);
         end;
      end;
   end;

end;

//-------------------------------------------------------------------------------
// Tratamento para habilitar a inserção da solicitação de reserva
//-------------------------------------------------------------------------------


procedure TForm_Mapa_Sala.JvTransparentButton_Fecha_Sol_ReservaClick(Sender: TObject);
begin
   JvTransparentButton_CancelaReservaClick(Sender);
end;

//-------------------------------------------------------------------------------
// Tratamento para Gravar a inserção da solicitação de reserva
//-------------------------------------------------------------------------------

procedure TForm_Mapa_Sala.JvTransparentButton_GravaReservaClick(Sender: TObject);
var
    x: String;
begin
x:= IBTable_SalaOcupacao.FieldByName('Solicitante').AsString;
   if (IBTable_SalaOcupacao.State = DSInsert) or (IBTable_SalaOcupacao.State = DSEdit) then
   begin
      IBTable_SalaOcupacao.FieldByName('CodSala').AsString:= DBComboBox_Sala.Text;
      IBTable_SalaOcupacao.FieldByName('Inicio').AsString:= JvDBDateEdit_Inicio.Text;
      IBTable_SalaOcupacao.FieldByName('Termino').AsString:= JvDBDateEdit_Termino.Text;
      IBTable_SalaOcupacao.FieldByName('Solicitante').AsString:= DBRichEdit_Solicitante.Text;
      IBTable_SalaOcupacao.FieldByName('Descricao').AsString:= DBRichEdit_Descricao.Text;

      IBTable_SalaOcupacao.Post;
      Funcoes.ExecutaTransacao;

      IBTable_SalaOcupacao.Close;
      IBTable_SalaOcupacao.Open;
   end;

   JvCaptionPanel_Reserva.Visible:= False;
   JvDateEdit_DataInicio.SetFocus;
end;

//-------------------------------------------------------------------------------
// Tratamento para cancelar a inserção da solicitação de reserva
//-------------------------------------------------------------------------------

procedure TForm_Mapa_Sala.JvTransparentButton_CancelaReservaClick(Sender: TObject);
begin
   if (IBTable_SalaOcupacao.State = DSInsert) or (IBTable_SalaOcupacao.State = DSEdit) then
   begin
      IBTable_SalaOcupacao.Cancel;
      Funcoes.ExecutaTransacao;
   end;

   JvCaptionPanel_Reserva.Visible:= False;
   JvDateEdit_DataInicio.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da Grid
//------------------------------------------------------------------------------

procedure TForm_Mapa_Sala.DBGrid_MapaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   VS_Dia: String;
   VI_DiaSemana: Integer;
begin
   if VB_Mostrar = True then
   begin

      VS_Dia:= Column.Field.AsString;

      if VS_Dia <> '' then
         VS_Dia:= Column.Field.AsString;

      if column.Title.Caption <> 'CODSALA' then
      begin
         if ((Column.Field.AsInteger >= 100) and (Column.Field.AsInteger < 199)) then
         begin
            DBGrid_Mapa.Canvas.Brush.Color:= $0080FFFF;    // Outros Eventos
         end
         else
         begin
            if ((Column.Field.AsInteger > 300) and (Column.Field.AsInteger < 999)) then
            begin
               DBGrid_Mapa.Canvas.Brush.Color:= $004080FF;        // Sala Reservada
            end
            else
            begin
               if ((Column.Field.AsInteger > 2000) and (Column.Field.AsInteger < 4999)) then
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= $00C08080;
               end
               else
               begin
                  if ((Column.Field.AsInteger > 5000) and (Column.Field.AsInteger < 5999)) then
                  begin
                     DBGrid_Mapa.Canvas.Brush.Color:= $0000A400;
                  end
                  else
                  begin
                     VS_Dia:= column.Title.Caption+'/'+Funcoes_TrataData.AnoAtual;
                     VI_DiaSemana:= dayofweek(strtodate(VS_Dia));

                     if ((VI_DiaSemana = 1) or (VI_DiaSemana = 7)) then
                     begin
                        column.Title.Color:= ClRed;
                        DBGrid_Mapa.Canvas.Brush.Color:= ClRed;
                     end;
                  end;
               end;
            end;
         end;
      end;

      if gdSelected in State then
      begin
         DBGrid_Mapa.Canvas.Font.Color:= ClBlack;
         DBGrid_Mapa.Canvas.Brush.Color := clTeal;
      end;

      DBGrid_Mapa.Canvas.FillRect(Rect);
      DBGrid_Mapa.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;


procedure TForm_Mapa_Sala.JvTransparentButton_InserirClick(Sender: TObject);
begin
   IBTable_SalaOcupacao.Append;
   DBComboBox_Sala.Text:= IBQuery_MontaMapa.FieldByName('CodSala').AsString;

   JvDBDateEdit_Inicio.SetFocus;
end;

procedure TForm_Mapa_Sala.DBGrid_SelReservaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  Icon: TBitmap;
begin
   if VB_Mostrar = True then
   begin
      if ((column.Title.Caption = 'Alterar') or (column.Title.Caption = 'Excluir')) then
      begin
         Icon := TBitmap.Create;

         with DBGrid_SelReserva.Canvas do
         begin
           Brush.Color := clWhite;
           FillRect(Rect);

           if column.Title.Caption = 'Alterar' then
              ImageList_SituacaoItem.GetBitmap(0, Icon)
           else
              if column.Title.Caption = 'Excluir' then
                 ImageList_SituacaoItem.GetBitmap(1, Icon);

            Draw(round((Rect.Left + Rect.Right - Icon.Width) / 2), Rect.Top, Icon);
         end;
      end;
   end;
end;

procedure TForm_Mapa_Sala.DBGrid_SelReservaCellClick(Column: TColumn);
var
   VI_Retorno: integer;
begin
   if Column.Field.AsString = 'Alterar' then
   Begin
      if IBQuery_MontaMapa.FieldByName('CodSala').AsString = '' then
      begin
        ShowMessage('Não foi selecionado  a Reserva...');
        DBGrid_SelReserva.SetFocus;
      end
      else
      begin
         IBTable_SalaOcupacao.Edit;
         JvDBDateEdit_Inicio.SetFocus;
      end;
   end
   else
   begin
      if Column.Field.AsString = 'Excluir' then
      begin
         if IBQuery_MontaMapa.FieldByName('CodSala').AsString = '' then
         begin
           ShowMessage('Não foi selecionado  a Reserva...');
           DBGrid_SelReserva.SetFocus;
         end
         else
         begin
            VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Curso '+#13+
                                                'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
            if VI_Retorno = IDYes then
            begin
               IBTable_SalaOcupacao.Delete;
               Funcoes.ExecutaTransacao;

               IBTable_SalaOcupacao.Close;
               IBTable_SalaOcupacao.Open;
            end;
         end;
      end;
   end;

end;


procedure TForm_Mapa_Sala.DBGrid4DblClick(Sender: TObject);
begin
   JvCaptionPanel_RecursoSalaAula.Visible:= True;
end;

procedure TForm_Mapa_Sala.JvTransparentButton_Fecha_RecursoSalaAulaClick(Sender: TObject);
begin
   JvCaptionPanel_RecursoSalaAula.Visible:= False;
end;

//-------------------------------------------------------------------------------
// Tratamento para habilitar a inserção da solicitação de reserva  para ICEA
//-------------------------------------------------------------------------------

procedure TForm_Mapa_Sala.JvTransparentButton_SalaReservadaClick(Sender: TObject);
begin
   FecharJanelas;

   JvCaptionPanel_Reserva.Visible:= True;
   JvCaptionPanel_Reserva.Caption:= 'Solicitação de Reserva para Sala de Aula (ICEA)';

   IBTable_SalaOcupacao.Append;
   IBTable_SalaOcupacao.FieldByName('CodSala').AsString:= IBQuery_MontaMapa.FieldByName('CodSala').AsString;
   DBComboBox_Sala.Text:= IBQuery_MontaMapa.FieldByName('CodSala').AsString;

   if JvDBDateEdit_Inicio.Text = '  /  /    ' then
      JvDBDateEdit_Inicio.Text:= VS_Dia;

   JvDBDateEdit_Inicio.SetFocus;

end;

//-------------------------------------------------------------------------------
// Tratamento para habilitar a inserção da solicitação de reserva  para Outros Eventos
//-------------------------------------------------------------------------------

procedure TForm_Mapa_Sala.JvTransparentButton_Reserva_Outro_eventoClick(Sender: TObject);
begin
   FecharJanelas;

   JvCaptionPanel_Reserva.Visible:= True;
   JvCaptionPanel_Reserva.Caption:= 'Solicitação de Reserva para Sala de Aula (Outros Eventos)';

   IBTable_SalaOcupacao.Append;
   IBTable_SalaOcupacao.FieldByName('Tipo').AsString:= JvTransparentButton_Reserva_Outro_evento.Caption;
   DBComboBox_Sala.Text:= IBQuery_MontaMapa.FieldByName('CodSala').AsString;

   if JvDBDateEdit_Inicio.Text = '  /  /    ' then
      JvDBDateEdit_Inicio.Text:= VS_Dia;

   JvDBDateEdit_Inicio.SetFocus;

end;

end.
