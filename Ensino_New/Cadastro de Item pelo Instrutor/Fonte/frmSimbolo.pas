unit frmSimbolo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Menus, StdCtrls, ComCtrls, ToolWin, ExtCtrls, ClipBrd,
  ValEdit, Buttons, Grids, DBCtrls, JvRichEd, JvComponent, JvxClock,
  JvColorCombo, JvCombobox, JvBaseThumbnail, JvThumbImage, Rotinas, JvDlg,
  JvEnterTab, JvClipView, JvGrdCpt, JvGradient, JvTransBtn, JvShape;

type
  TForm_Simbolo = class(TForm)
    Label1: TLabel;
    ComboBox_Font: TComboBox;
    JvxRichEdit_00: TJvxRichEdit;
    JvxRichEdit_Apresentacao: TJvxRichEdit;
    Panel3: TPanel;
    Panel205: TPanel;
    JvxRichEdit_201: TJvxRichEdit;
    JvxRichEdit_195: TJvxRichEdit;
    JvxRichEdit_194: TJvxRichEdit;
    JvxRichEdit_193: TJvxRichEdit;
    JvxRichEdit_192: TJvxRichEdit;
    JvxRichEdit_191: TJvxRichEdit;
    JvxRichEdit_190: TJvxRichEdit;
    JvxRichEdit_189: TJvxRichEdit;
    JvxRichEdit_188: TJvxRichEdit;
    JvxRichEdit_187: TJvxRichEdit;
    JvxRichEdit_186: TJvxRichEdit;
    JvxRichEdit_185: TJvxRichEdit;
    JvxRichEdit_184: TJvxRichEdit;
    JvxRichEdit_183: TJvxRichEdit;
    JvxRichEdit_182: TJvxRichEdit;
    JvxRichEdit_180: TJvxRichEdit;
    JvxRichEdit_179: TJvxRichEdit;
    JvxRichEdit_178: TJvxRichEdit;
    JvxRichEdit_177: TJvxRichEdit;
    JvxRichEdit_176: TJvxRichEdit;
    JvxRichEdit_175: TJvxRichEdit;
    JvxRichEdit_174: TJvxRichEdit;
    JvxRichEdit_173: TJvxRichEdit;
    JvxRichEdit_200: TJvxRichEdit;
    JvxRichEdit_199: TJvxRichEdit;
    JvxRichEdit_198: TJvxRichEdit;
    JvxRichEdit_197: TJvxRichEdit;
    JvxRichEdit_196: TJvxRichEdit;
    Panel32: TPanel;
    JvxRichEdit_28: TJvxRichEdit;
    JvxRichEdit_22: TJvxRichEdit;
    JvxRichEdit_21: TJvxRichEdit;
    JvxRichEdit_20: TJvxRichEdit;
    JvxRichEdit_19: TJvxRichEdit;
    JvxRichEdit_18: TJvxRichEdit;
    JvxRichEdit_17: TJvxRichEdit;
    JvxRichEdit_16: TJvxRichEdit;
    JvxRichEdit_15: TJvxRichEdit;
    JvxRichEdit_14: TJvxRichEdit;
    JvxRichEdit_13: TJvxRichEdit;
    JvxRichEdit_12: TJvxRichEdit;
    JvxRichEdit_11: TJvxRichEdit;
    JvxRichEdit_10: TJvxRichEdit;
    JvxRichEdit_09: TJvxRichEdit;
    JvxRichEdit_08: TJvxRichEdit;
    JvxRichEdit_07: TJvxRichEdit;
    JvxRichEdit_06: TJvxRichEdit;
    JvxRichEdit_05: TJvxRichEdit;
    JvxRichEdit_04: TJvxRichEdit;
    JvxRichEdit_03: TJvxRichEdit;
    JvxRichEdit_02: TJvxRichEdit;
    JvxRichEdit_01: TJvxRichEdit;
    JvxRichEdit_27: TJvxRichEdit;
    JvxRichEdit_26: TJvxRichEdit;
    JvxRichEdit_25: TJvxRichEdit;
    JvxRichEdit_24: TJvxRichEdit;
    JvxRichEdit_23: TJvxRichEdit;
    Panel4: TPanel;
    JvxRichEdit_56: TJvxRichEdit;
    JvxRichEdit_50: TJvxRichEdit;
    JvxRichEdit_49: TJvxRichEdit;
    JvxRichEdit_48: TJvxRichEdit;
    JvxRichEdit_47: TJvxRichEdit;
    JvxRichEdit_46: TJvxRichEdit;
    JvxRichEdit_45: TJvxRichEdit;
    JvxRichEdit_44: TJvxRichEdit;
    JvxRichEdit_43: TJvxRichEdit;
    JvxRichEdit_42: TJvxRichEdit;
    JvxRichEdit_41: TJvxRichEdit;
    JvxRichEdit_40: TJvxRichEdit;
    JvxRichEdit_39: TJvxRichEdit;
    JvxRichEdit_38: TJvxRichEdit;
    JvxRichEdit_37: TJvxRichEdit;
    JvxRichEdit_36: TJvxRichEdit;
    JvxRichEdit_35: TJvxRichEdit;
    JvxRichEdit_34: TJvxRichEdit;
    JvxRichEdit_33: TJvxRichEdit;
    JvxRichEdit_32: TJvxRichEdit;
    JvxRichEdit_31: TJvxRichEdit;
    JvxRichEdit_30: TJvxRichEdit;
    JvxRichEdit_29: TJvxRichEdit;
    JvxRichEdit_55: TJvxRichEdit;
    JvxRichEdit_54: TJvxRichEdit;
    JvxRichEdit_53: TJvxRichEdit;
    JvxRichEdit_52: TJvxRichEdit;
    JvxRichEdit_51: TJvxRichEdit;
    Panel33: TPanel;
    JvxRichEdit85: TJvxRichEdit;
    JvxRichEdit86: TJvxRichEdit;
    JvxRichEdit87: TJvxRichEdit;
    JvxRichEdit88: TJvxRichEdit;
    JvxRichEdit89: TJvxRichEdit;
    JvxRichEdit90: TJvxRichEdit;
    JvxRichEdit91: TJvxRichEdit;
    JvxRichEdit92: TJvxRichEdit;
    JvxRichEdit93: TJvxRichEdit;
    JvxRichEdit94: TJvxRichEdit;
    JvxRichEdit95: TJvxRichEdit;
    JvxRichEdit96: TJvxRichEdit;
    JvxRichEdit97: TJvxRichEdit;
    JvxRichEdit98: TJvxRichEdit;
    JvxRichEdit99: TJvxRichEdit;
    JvxRichEdit100: TJvxRichEdit;
    JvxRichEdit101: TJvxRichEdit;
    JvxRichEdit102: TJvxRichEdit;
    JvxRichEdit103: TJvxRichEdit;
    JvxRichEdit104: TJvxRichEdit;
    JvxRichEdit105: TJvxRichEdit;
    JvxRichEdit106: TJvxRichEdit;
    JvxRichEdit107: TJvxRichEdit;
    JvxRichEdit108: TJvxRichEdit;
    JvxRichEdit109: TJvxRichEdit;
    JvxRichEdit110: TJvxRichEdit;
    JvxRichEdit111: TJvxRichEdit;
    JvxRichEdit112: TJvxRichEdit;
    Panel34: TPanel;
    JvxRichEdit_84: TJvxRichEdit;
    JvxRichEdit_78: TJvxRichEdit;
    JvxRichEdit_77: TJvxRichEdit;
    JvxRichEdit_76: TJvxRichEdit;
    JvxRichEdit_75: TJvxRichEdit;
    JvxRichEdit_74: TJvxRichEdit;
    JvxRichEdit_73: TJvxRichEdit;
    JvxRichEdit_72: TJvxRichEdit;
    JvxRichEdit_71: TJvxRichEdit;
    JvxRichEdit_70: TJvxRichEdit;
    JvxRichEdit_69: TJvxRichEdit;
    JvxRichEdit_68: TJvxRichEdit;
    JvxRichEdit_67: TJvxRichEdit;
    JvxRichEdit_66: TJvxRichEdit;
    JvxRichEdit_65: TJvxRichEdit;
    JvxRichEdit_64: TJvxRichEdit;
    JvxRichEdit_63: TJvxRichEdit;
    JvxRichEdit_62: TJvxRichEdit;
    JvxRichEdit_61: TJvxRichEdit;
    JvxRichEdit_60: TJvxRichEdit;
    JvxRichEdit_59: TJvxRichEdit;
    JvxRichEdit_58: TJvxRichEdit;
    JvxRichEdit_57: TJvxRichEdit;
    JvxRichEdit_83: TJvxRichEdit;
    JvxRichEdit_82: TJvxRichEdit;
    JvxRichEdit_81: TJvxRichEdit;
    JvxRichEdit_80: TJvxRichEdit;
    JvxRichEdit_79: TJvxRichEdit;
    Panel35: TPanel;
    JvxRichEdit_113: TJvxRichEdit;
    JvxRichEdit_107: TJvxRichEdit;
    JvxRichEdit_106: TJvxRichEdit;
    JvxRichEdit_105: TJvxRichEdit;
    JvxRichEdit_104: TJvxRichEdit;
    JvxRichEdit_103: TJvxRichEdit;
    JvxRichEdit_102: TJvxRichEdit;
    JvxRichEdit_101: TJvxRichEdit;
    JvxRichEdit_100: TJvxRichEdit;
    JvxRichEdit_99: TJvxRichEdit;
    JvxRichEdit_98: TJvxRichEdit;
    JvxRichEdit_97: TJvxRichEdit;
    JvxRichEdit_96: TJvxRichEdit;
    JvxRichEdit_95: TJvxRichEdit;
    JvxRichEdit_93: TJvxRichEdit;
    JvxRichEdit_92: TJvxRichEdit;
    JvxRichEdit_91: TJvxRichEdit;
    JvxRichEdit_90: TJvxRichEdit;
    JvxRichEdit_89: TJvxRichEdit;
    JvxRichEdit_88: TJvxRichEdit;
    JvxRichEdit_87: TJvxRichEdit;
    JvxRichEdit_86: TJvxRichEdit;
    JvxRichEdit_85: TJvxRichEdit;
    JvxRichEdit_112: TJvxRichEdit;
    JvxRichEdit_111: TJvxRichEdit;
    JvxRichEdit_110: TJvxRichEdit;
    JvxRichEdit_109: TJvxRichEdit;
    JvxRichEdit_108: TJvxRichEdit;
    Panel36: TPanel;
    JvxRichEdit_143: TJvxRichEdit;
    JvxRichEdit_137: TJvxRichEdit;
    JvxRichEdit_136: TJvxRichEdit;
    JvxRichEdit_135: TJvxRichEdit;
    JvxRichEdit_134: TJvxRichEdit;
    JvxRichEdit_133: TJvxRichEdit;
    JvxRichEdit_132: TJvxRichEdit;
    JvxRichEdit_131: TJvxRichEdit;
    JvxRichEdit_130: TJvxRichEdit;
    JvxRichEdit_129: TJvxRichEdit;
    JvxRichEdit_128: TJvxRichEdit;
    JvxRichEdit_127: TJvxRichEdit;
    JvxRichEdit_125: TJvxRichEdit;
    JvxRichEdit_124: TJvxRichEdit;
    JvxRichEdit_123: TJvxRichEdit;
    JvxRichEdit_121: TJvxRichEdit;
    JvxRichEdit_120: TJvxRichEdit;
    JvxRichEdit_119: TJvxRichEdit;
    JvxRichEdit_118: TJvxRichEdit;
    JvxRichEdit_117: TJvxRichEdit;
    JvxRichEdit_116: TJvxRichEdit;
    JvxRichEdit_115: TJvxRichEdit;
    JvxRichEdit_114: TJvxRichEdit;
    JvxRichEdit_142: TJvxRichEdit;
    JvxRichEdit_141: TJvxRichEdit;
    JvxRichEdit_140: TJvxRichEdit;
    JvxRichEdit_139: TJvxRichEdit;
    JvxRichEdit_138: TJvxRichEdit;
    Panel37: TPanel;
    JvxRichEdit_171: TJvxRichEdit;
    JvxRichEdit_165: TJvxRichEdit;
    JvxRichEdit_164: TJvxRichEdit;
    JvxRichEdit_163: TJvxRichEdit;
    JvxRichEdit_162: TJvxRichEdit;
    JvxRichEdit_161: TJvxRichEdit;
    JvxRichEdit_160: TJvxRichEdit;
    JvxRichEdit_159: TJvxRichEdit;
    JvxRichEdit_158: TJvxRichEdit;
    JvxRichEdit_157: TJvxRichEdit;
    JvxRichEdit_156: TJvxRichEdit;
    JvxRichEdit_155: TJvxRichEdit;
    JvxRichEdit_154: TJvxRichEdit;
    JvxRichEdit_153: TJvxRichEdit;
    JvxRichEdit_152: TJvxRichEdit;
    JvxRichEdit_151: TJvxRichEdit;
    JvxRichEdit_150: TJvxRichEdit;
    JvxRichEdit_149: TJvxRichEdit;
    JvxRichEdit_148: TJvxRichEdit;
    JvxRichEdit_147: TJvxRichEdit;
    JvxRichEdit_146: TJvxRichEdit;
    JvxRichEdit_145: TJvxRichEdit;
    JvxRichEdit_144: TJvxRichEdit;
    JvxRichEdit_170: TJvxRichEdit;
    JvxRichEdit_169: TJvxRichEdit;
    JvxRichEdit_168: TJvxRichEdit;
    JvxRichEdit_167: TJvxRichEdit;
    JvxRichEdit_166: TJvxRichEdit;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    procedure InsereCaracter(Caracter: TJvxRichEdit);

    procedure ComboBox_FontChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvxRichEdit_06DblClick(Sender: TObject);
    procedure JvxRichEdit_05DblClick(Sender: TObject);
    procedure JvxRichEdit_07DblClick(Sender: TObject);
    procedure JvxRichEdit_08DblClick(Sender: TObject);
    procedure JvxRichEdit_09DblClick(Sender: TObject);
    procedure JvxRichEdit_10DblClick(Sender: TObject);
    procedure JvxRichEdit_11DblClick(Sender: TObject);
    procedure JvxRichEdit_12DblClick(Sender: TObject);
    procedure JvxRichEdit_13DblClick(Sender: TObject);
    procedure JvxRichEdit_14DblClick(Sender: TObject);
    procedure JvxRichEdit_15DblClick(Sender: TObject);
    procedure JvxRichEdit_16DblClick(Sender: TObject);
    procedure JvxRichEdit_17DblClick(Sender: TObject);
    procedure JvxRichEdit_18DblClick(Sender: TObject);
    procedure JvxRichEdit_19DblClick(Sender: TObject);
    procedure JvxRichEdit_20DblClick(Sender: TObject);
    procedure JvxRichEdit_21DblClick(Sender: TObject);
    procedure JvxRichEdit_22DblClick(Sender: TObject);
    procedure JvxRichEdit_23DblClick(Sender: TObject);
    procedure JvxRichEdit_24DblClick(Sender: TObject);
    procedure JvxRichEdit_25DblClick(Sender: TObject);
    procedure JvxRichEdit_26DblClick(Sender: TObject);
    procedure JvxRichEdit_27DblClick(Sender: TObject);
    procedure JvxRichEdit_28DblClick(Sender: TObject);
    procedure JvxRichEdit_29DblClick(Sender: TObject);
    procedure JvxRichEdit_30DblClick(Sender: TObject);
    procedure JvxRichEdit_31DblClick(Sender: TObject);
    procedure JvxRichEdit_32DblClick(Sender: TObject);
    procedure JvxRichEdit_04DblClick(Sender: TObject);
    procedure JvxRichEdit_03DblClick(Sender: TObject);
    procedure JvxRichEdit_02DblClick(Sender: TObject);
    procedure JvxRichEdit_01DblClick(Sender: TObject);
    procedure JvxRichEdit_33DblClick(Sender: TObject);
    procedure JvxRichEdit_34DblClick(Sender: TObject);
    procedure JvxRichEdit_35DblClick(Sender: TObject);
    procedure JvxRichEdit_36DblClick(Sender: TObject);
    procedure JvxRichEdit_37DblClick(Sender: TObject);
    procedure JvxRichEdit_38DblClick(Sender: TObject);
    procedure JvxRichEdit_39DblClick(Sender: TObject);
    procedure JvxRichEdit_40DblClick(Sender: TObject);
    procedure JvxRichEdit_41DblClick(Sender: TObject);
    procedure JvxRichEdit_42DblClick(Sender: TObject);
    procedure JvxRichEdit_43DblClick(Sender: TObject);
    procedure JvxRichEdit_44DblClick(Sender: TObject);
    procedure JvxRichEdit_45DblClick(Sender: TObject);
    procedure JvxRichEdit_46DblClick(Sender: TObject);
    procedure JvxRichEdit_47DblClick(Sender: TObject);
    procedure JvxRichEdit_48DblClick(Sender: TObject);
    procedure JvxRichEdit_49DblClick(Sender: TObject);
    procedure JvxRichEdit_50DblClick(Sender: TObject);
    procedure JvxRichEdit_51DblClick(Sender: TObject);
    procedure JvxRichEdit_52DblClick(Sender: TObject);
    procedure JvxRichEdit_53DblClick(Sender: TObject);
    procedure JvxRichEdit_54DblClick(Sender: TObject);
    procedure JvxRichEdit_55DblClick(Sender: TObject);
    procedure JvxRichEdit_56DblClick(Sender: TObject);
    procedure JvxRichEdit107DblClick(Sender: TObject);
    procedure JvxRichEdit_57DblClick(Sender: TObject);
    procedure JvxRichEdit_58DblClick(Sender: TObject);
    procedure JvxRichEdit_59DblClick(Sender: TObject);
    procedure JvxRichEdit_60DblClick(Sender: TObject);
    procedure JvxRichEdit_61DblClick(Sender: TObject);
    procedure JvxRichEdit_62DblClick(Sender: TObject);
    procedure JvxRichEdit_63DblClick(Sender: TObject);
    procedure JvxRichEdit_64DblClick(Sender: TObject);
    procedure JvxRichEdit_65DblClick(Sender: TObject);
    procedure JvxRichEdit_66DblClick(Sender: TObject);
    procedure JvxRichEdit_67DblClick(Sender: TObject);
    procedure JvxRichEdit_68DblClick(Sender: TObject);
    procedure JvxRichEdit_69DblClick(Sender: TObject);
    procedure JvxRichEdit_70DblClick(Sender: TObject);
    procedure JvxRichEdit_71DblClick(Sender: TObject);
    procedure JvxRichEdit_72DblClick(Sender: TObject);
    procedure JvxRichEdit_73DblClick(Sender: TObject);
    procedure JvxRichEdit_74DblClick(Sender: TObject);
    procedure JvxRichEdit_75DblClick(Sender: TObject);
    procedure JvxRichEdit_76DblClick(Sender: TObject);
    procedure JvxRichEdit_77DblClick(Sender: TObject);
    procedure JvxRichEdit_78DblClick(Sender: TObject);
    procedure JvxRichEdit_79DblClick(Sender: TObject);
    procedure JvxRichEdit_80DblClick(Sender: TObject);
    procedure JvxRichEdit_81DblClick(Sender: TObject);
    procedure JvxRichEdit_83DblClick(Sender: TObject);
    procedure JvxRichEdit_84DblClick(Sender: TObject);
    procedure JvxRichEdit_85DblClick(Sender: TObject);
    procedure JvxRichEdit_86DblClick(Sender: TObject);
    procedure JvxRichEdit_87DblClick(Sender: TObject);
    procedure JvxRichEdit_88DblClick(Sender: TObject);
    procedure JvxRichEdit_89DblClick(Sender: TObject);
    procedure JvxRichEdit_90DblClick(Sender: TObject);
    procedure JvxRichEdit_91DblClick(Sender: TObject);
    procedure JvxRichEdit_92DblClick(Sender: TObject);
    procedure JvxRichEdit_93DblClick(Sender: TObject);
    procedure JvxRichEdit_95DblClick(Sender: TObject);
    procedure JvxRichEdit_96DblClick(Sender: TObject);
    procedure JvxRichEdit_97DblClick(Sender: TObject);
    procedure JvxRichEdit_98DblClick(Sender: TObject);
    procedure JvxRichEdit_99DblClick(Sender: TObject);
    procedure JvxRichEdit_100DblClick(Sender: TObject);
    procedure JvxRichEdit_101DblClick(Sender: TObject);
    procedure JvxRichEdit_102DblClick(Sender: TObject);
    procedure JvxRichEdit_103DblClick(Sender: TObject);
    procedure JvxRichEdit_104DblClick(Sender: TObject);
    procedure JvxRichEdit_105DblClick(Sender: TObject);
    procedure JvxRichEdit_106DblClick(Sender: TObject);
    procedure JvxRichEdit_107DblClick(Sender: TObject);
    procedure JvxRichEdit_108DblClick(Sender: TObject);
    procedure JvxRichEdit_109DblClick(Sender: TObject);
    procedure JvxRichEdit_110DblClick(Sender: TObject);
    procedure JvxRichEdit_111DblClick(Sender: TObject);
    procedure JvxRichEdit_112DblClick(Sender: TObject);
    procedure JvxRichEdit_113DblClick(Sender: TObject);
    procedure JvxRichEdit_114DblClick(Sender: TObject);
    procedure JvxRichEdit_115DblClick(Sender: TObject);
    procedure JvxRichEdit_116DblClick(Sender: TObject);
    procedure JvxRichEdit_117DblClick(Sender: TObject);
    procedure JvxRichEdit_118DblClick(Sender: TObject);
    procedure JvxRichEdit_119DblClick(Sender: TObject);
    procedure JvxRichEdit106DblClick(Sender: TObject);
    procedure JvxRichEdit105DblClick(Sender: TObject);
    procedure JvxRichEdit104DblClick(Sender: TObject);
    procedure JvxRichEdit103DblClick(Sender: TObject);
    procedure JvxRichEdit102DblClick(Sender: TObject);
    procedure JvxRichEdit101DblClick(Sender: TObject);
    procedure JvxRichEdit100DblClick(Sender: TObject);
    procedure JvxRichEdit99DblClick(Sender: TObject);
    procedure JvxRichEdit98DblClick(Sender: TObject);
    procedure JvxRichEdit97DblClick(Sender: TObject);
    procedure JvxRichEdit96DblClick(Sender: TObject);
    procedure JvxRichEdit95DblClick(Sender: TObject);
    procedure JvxRichEdit94DblClick(Sender: TObject);
    procedure JvxRichEdit93DblClick(Sender: TObject);
    procedure JvxRichEdit92DblClick(Sender: TObject);
    procedure JvxRichEdit91DblClick(Sender: TObject);
    procedure JvxRichEdit90DblClick(Sender: TObject);
    procedure JvxRichEdit89DblClick(Sender: TObject);
    procedure JvxRichEdit88DblClick(Sender: TObject);
    procedure JvxRichEdit87DblClick(Sender: TObject);
    procedure JvxRichEdit86DblClick(Sender: TObject);
    procedure JvxRichEdit112DblClick(Sender: TObject);
    procedure JvxRichEdit111DblClick(Sender: TObject);
    procedure JvxRichEdit110DblClick(Sender: TObject);
    procedure JvxRichEdit109DblClick(Sender: TObject);
    procedure JvxRichEdit108DblClick(Sender: TObject);
    procedure JvxRichEdit85DblClick(Sender: TObject);
    procedure JvxRichEdit_120DblClick(Sender: TObject);
    procedure JvxRichEdit_121DblClick(Sender: TObject);
    procedure JvxRichEdit_123DblClick(Sender: TObject);
    procedure JvxRichEdit_124DblClick(Sender: TObject);
    procedure JvxRichEdit_125DblClick(Sender: TObject);
    procedure JvxRichEdit_127DblClick(Sender: TObject);
    procedure JvxRichEdit_128DblClick(Sender: TObject);
    procedure JvxRichEdit_129DblClick(Sender: TObject);
    procedure JvxRichEdit_130DblClick(Sender: TObject);
    procedure JvxRichEdit_131DblClick(Sender: TObject);
    procedure JvxRichEdit_132DblClick(Sender: TObject);
    procedure JvxRichEdit_133DblClick(Sender: TObject);
    procedure JvxRichEdit_134DblClick(Sender: TObject);
    procedure JvxRichEdit_135DblClick(Sender: TObject);
    procedure JvxRichEdit_136DblClick(Sender: TObject);
    procedure JvxRichEdit_137DblClick(Sender: TObject);
    procedure JvxRichEdit_138DblClick(Sender: TObject);
    procedure JvxRichEdit_139DblClick(Sender: TObject);
    procedure JvxRichEdit_140DblClick(Sender: TObject);
    procedure JvxRichEdit_141DblClick(Sender: TObject);
    procedure JvxRichEdit_142DblClick(Sender: TObject);
    procedure JvxRichEdit_143DblClick(Sender: TObject);
    procedure JvxRichEdit_144DblClick(Sender: TObject);
    procedure JvxRichEdit_145DblClick(Sender: TObject);
    procedure JvxRichEdit_146DblClick(Sender: TObject);
    procedure JvxRichEdit_147DblClick(Sender: TObject);
    procedure JvxRichEdit_148DblClick(Sender: TObject);
    procedure JvxRichEdit_149DblClick(Sender: TObject);
    procedure JvxRichEdit_150DblClick(Sender: TObject);
    procedure JvxRichEdit_151DblClick(Sender: TObject);
    procedure JvxRichEdit_152DblClick(Sender: TObject);
    procedure JvxRichEdit_153DblClick(Sender: TObject);
    procedure JvxRichEdit_154DblClick(Sender: TObject);
    procedure JvxRichEdit_155DblClick(Sender: TObject);
    procedure JvxRichEdit_156DblClick(Sender: TObject);
    procedure JvxRichEdit_157DblClick(Sender: TObject);
    procedure JvxRichEdit_158DblClick(Sender: TObject);
    procedure JvxRichEdit_159DblClick(Sender: TObject);
    procedure JvxRichEdit_160DblClick(Sender: TObject);
    procedure JvxRichEdit_161DblClick(Sender: TObject);
    procedure JvxRichEdit_162DblClick(Sender: TObject);
    procedure JvxRichEdit_163DblClick(Sender: TObject);
    procedure JvxRichEdit_164DblClick(Sender: TObject);
    procedure JvxRichEdit_165DblClick(Sender: TObject);
    procedure JvxRichEdit_166DblClick(Sender: TObject);
    procedure JvxRichEdit_167DblClick(Sender: TObject);
    procedure JvxRichEdit_168DblClick(Sender: TObject);
    procedure JvxRichEdit_169DblClick(Sender: TObject);
    procedure JvxRichEdit_170DblClick(Sender: TObject);
    procedure JvxRichEdit_171DblClick(Sender: TObject);
    procedure JvxRichEdit_173DblClick(Sender: TObject);
    procedure JvxRichEdit_174DblClick(Sender: TObject);
    procedure JvxRichEdit_175DblClick(Sender: TObject);
    procedure JvxRichEdit_176DblClick(Sender: TObject);
    procedure JvxRichEdit_177DblClick(Sender: TObject);
    procedure JvxRichEdit_178DblClick(Sender: TObject);
    procedure JvxRichEdit_179DblClick(Sender: TObject);
    procedure JvxRichEdit_180DblClick(Sender: TObject);
    procedure JvxRichEdit_182DblClick(Sender: TObject);
    procedure JvxRichEdit_183DblClick(Sender: TObject);
    procedure JvxRichEdit_184DblClick(Sender: TObject);
    procedure JvxRichEdit_185DblClick(Sender: TObject);
    procedure JvxRichEdit_186DblClick(Sender: TObject);
    procedure JvxRichEdit_187DblClick(Sender: TObject);
    procedure JvxRichEdit_188DblClick(Sender: TObject);
    procedure JvxRichEdit_189DblClick(Sender: TObject);
    procedure JvxRichEdit_190DblClick(Sender: TObject);
    procedure JvxRichEdit_191DblClick(Sender: TObject);
    procedure JvxRichEdit_192DblClick(Sender: TObject);
    procedure JvxRichEdit_193DblClick(Sender: TObject);
    procedure JvxRichEdit_194DblClick(Sender: TObject);
    procedure JvxRichEdit_195DblClick(Sender: TObject);
    procedure JvxRichEdit_196DblClick(Sender: TObject);
    procedure JvxRichEdit_197DblClick(Sender: TObject);
    procedure JvxRichEdit_198DblClick(Sender: TObject);
    procedure JvxRichEdit_199DblClick(Sender: TObject);
    procedure JvxRichEdit_200DblClick(Sender: TObject);
    procedure JvxRichEdit_201DblClick(Sender: TObject);
    procedure JvxRichEdit_82DblClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
  private    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form_Simbolo: TForm_Simbolo;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_Simbolo.FormActivate(Sender: TObject);
begin
   ComboBox_FontChange(Sender);

   JvxRichEdit_00.Lines.Clear;
   JvxRichEdit_Apresentacao.Lines.Clear;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Inserir
//------------------------------------------------------------------------------

procedure TForm_Simbolo.JvTransparentButton_InserirClick(Sender: TObject);
begin
   JvxRichEdit_00.CopyToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Simbolo.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento da mudanca da fonte
//------------------------------------------------------------------------------

procedure TForm_Simbolo.ComboBox_FontChange(Sender: TObject);
begin
  JvxRichEdit_Apresentacao.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_00.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_01.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_02.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_03.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_04.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_05.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_06.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_07.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_08.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_09.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_10.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_11.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_12.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_13.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_14.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_15.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_16.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_17.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_18.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_19.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_20.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_21.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_22.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_23.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_24.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_25.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_26.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_27.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_28.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_29.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_30.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_31.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_32.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_33.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_34.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_35.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_36.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_37.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_38.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_39.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_40.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_41.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_42.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_43.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_44.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_45.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_46.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_47.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_48.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_49.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_40.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_51.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_52.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_53.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_54.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_55.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_56.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_57.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_58.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_59.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_60.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_61.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_62.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_63.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_64.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_65.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_66.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_67.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_68.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_69.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_70.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_71.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_72.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_73.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_74.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_75.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_76.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_77.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_78.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_79.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_80.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_81.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_82.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_83.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_84.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_85.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_86.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_87.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_88.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_89.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_90.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_91.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_92.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_93.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_95.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_96.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_97.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_98.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_99.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_100.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_101.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_102.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_103.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_104.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_105.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_106.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_107.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_108.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_109.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_110.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_111.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_112.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_113.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_114.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_115.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_116.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_117.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_118.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_119.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_120.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_121.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_123.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_124.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_125.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_127.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_128.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_129.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_130.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_131.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_132.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_133.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_134.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_135.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_136.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_137.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_138.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_139.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_140.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_141.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_142.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_143.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_144.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_145.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_146.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_147.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_148.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_149.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_150.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_151.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_152.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_153.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_154.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_155.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_156.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_157.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_158.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_159.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_160.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_161.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_162.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_163.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_164.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_165.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_166.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_167.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_168.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_169.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_170.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_171.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_173.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_174.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_175.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_176.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_177.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_178.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_179.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_180.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_182.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_183.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_184.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_185.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_186.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_187.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_188.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_189.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_190.Font.Name:= ComboBox_Font.Text;

  JvxRichEdit_191.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_192.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_193.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_194.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_195.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_196.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_197.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_198.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_199.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_200.Font.Name:= ComboBox_Font.Text;
  JvxRichEdit_201.Font.Name:= ComboBox_Font.Text;
end;

//------------------------------------------------------------------------------
// Tratamento da insercao do caracter especial
//------------------------------------------------------------------------------

procedure TForm_Simbolo.InsereCaracter(Caracter: TJvxRichEdit);
begin
   JvxRichEdit_00.Lines.Clear;
   JvxRichEdit_Apresentacao.Lines.Clear;

   Caracter.CopyToClipboard;
   Caracter.SelStart:= 0;

   JvxRichEdit_00.PasteFromClipboard;

   JvxRichEdit_Apresentacao.SelectAll ;
   JvxRichEdit_Apresentacao.PasteFromClipboard;
   JvxRichEdit_Apresentacao.SelectAll ;
   JvxRichEdit_Apresentacao.Font.Name:= ComboBox_Font.Text;
   JvxRichEdit_Apresentacao.SelAttributes.Color:= clWhite;
   JvxRichEdit_Apresentacao.SelAttributes.Style:= [fsbold];
   JvxRichEdit_Apresentacao.SelAttributes.Size:= 48;
end;

procedure TForm_Simbolo.JvxRichEdit_01DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_01 );
end;

procedure TForm_Simbolo.JvxRichEdit_02DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_02 );
end;

procedure TForm_Simbolo.JvxRichEdit_03DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_03 );
end;

procedure TForm_Simbolo.JvxRichEdit_04DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_04 );
end;

procedure TForm_Simbolo.JvxRichEdit_05DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_05 );
end;

procedure TForm_Simbolo.JvxRichEdit_06DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_06 );
end;

procedure TForm_Simbolo.JvxRichEdit_07DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_07 );
end;

procedure TForm_Simbolo.JvxRichEdit_08DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_08 );
end;

procedure TForm_Simbolo.JvxRichEdit_09DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_09 );
end;

procedure TForm_Simbolo.JvxRichEdit_10DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_10 );
end;

procedure TForm_Simbolo.JvxRichEdit_11DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_11 );
end;

procedure TForm_Simbolo.JvxRichEdit_12DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_12 );
end;

procedure TForm_Simbolo.JvxRichEdit_13DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_13 );
end;

procedure TForm_Simbolo.JvxRichEdit_14DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_14 );
end;

procedure TForm_Simbolo.JvxRichEdit_15DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_15 );
end;

procedure TForm_Simbolo.JvxRichEdit_16DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_16 );
end;

procedure TForm_Simbolo.JvxRichEdit_17DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_17 );
end;

procedure TForm_Simbolo.JvxRichEdit_18DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_18 );
end;

procedure TForm_Simbolo.JvxRichEdit_19DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_19 );
end;

procedure TForm_Simbolo.JvxRichEdit_20DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_20 );
end;

procedure TForm_Simbolo.JvxRichEdit_21DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_21 );
end;

procedure TForm_Simbolo.JvxRichEdit_22DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_22 );
end;

procedure TForm_Simbolo.JvxRichEdit_23DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_23 );
end;

procedure TForm_Simbolo.JvxRichEdit_24DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_24 );
end;

procedure TForm_Simbolo.JvxRichEdit_25DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_25 );
end;

procedure TForm_Simbolo.JvxRichEdit_26DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_26 );
end;

procedure TForm_Simbolo.JvxRichEdit_27DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_27 );
end;

procedure TForm_Simbolo.JvxRichEdit_28DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_28 );
end;

procedure TForm_Simbolo.JvxRichEdit_29DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_29 );
end;

procedure TForm_Simbolo.JvxRichEdit_30DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_30 );
end;

procedure TForm_Simbolo.JvxRichEdit_31DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_31 );
end;

procedure TForm_Simbolo.JvxRichEdit_32DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_32 );
end;

procedure TForm_Simbolo.JvxRichEdit_33DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_33 );
end;

procedure TForm_Simbolo.JvxRichEdit_34DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_34 );
end;

procedure TForm_Simbolo.JvxRichEdit_35DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_35 );
end;

procedure TForm_Simbolo.JvxRichEdit_36DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_36 );
end;

procedure TForm_Simbolo.JvxRichEdit_37DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_37 );
end;

procedure TForm_Simbolo.JvxRichEdit_38DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_38 );
end;

procedure TForm_Simbolo.JvxRichEdit_39DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_39 );
end;

procedure TForm_Simbolo.JvxRichEdit_40DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_40 );
end;

procedure TForm_Simbolo.JvxRichEdit_41DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_41 );
end;

procedure TForm_Simbolo.JvxRichEdit_42DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_42 );
end;

procedure TForm_Simbolo.JvxRichEdit_43DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_43 );
end;

procedure TForm_Simbolo.JvxRichEdit_44DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_44 );
end;

procedure TForm_Simbolo.JvxRichEdit_45DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_45 );
end;

procedure TForm_Simbolo.JvxRichEdit_46DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_46 );
end;

procedure TForm_Simbolo.JvxRichEdit_47DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_47 );
end;

procedure TForm_Simbolo.JvxRichEdit_48DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_48 );
end;

procedure TForm_Simbolo.JvxRichEdit_49DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_49 );
end;

procedure TForm_Simbolo.JvxRichEdit_50DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_50 );
end;

procedure TForm_Simbolo.JvxRichEdit_51DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_51 );
end;

procedure TForm_Simbolo.JvxRichEdit_52DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_52 );
end;

procedure TForm_Simbolo.JvxRichEdit_53DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_53 );
end;

procedure TForm_Simbolo.JvxRichEdit_54DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_54 );
end;

procedure TForm_Simbolo.JvxRichEdit_55DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_55 );
end;

procedure TForm_Simbolo.JvxRichEdit_56DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_56 );
end;

procedure TForm_Simbolo.JvxRichEdit107DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit107 );
end;

procedure TForm_Simbolo.JvxRichEdit_57DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_57 );
end;

procedure TForm_Simbolo.JvxRichEdit_58DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_58 );
end;

procedure TForm_Simbolo.JvxRichEdit_59DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_59 );
end;

procedure TForm_Simbolo.JvxRichEdit_60DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_60 );
end;

procedure TForm_Simbolo.JvxRichEdit_61DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_61 );
end;

procedure TForm_Simbolo.JvxRichEdit_62DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_62 );
end;

procedure TForm_Simbolo.JvxRichEdit_63DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_63 );
end;

procedure TForm_Simbolo.JvxRichEdit_64DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_64 );
end;

procedure TForm_Simbolo.JvxRichEdit_65DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_65 );
end;

procedure TForm_Simbolo.JvxRichEdit_66DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_66 );
end;

procedure TForm_Simbolo.JvxRichEdit_67DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_67 );
end;

procedure TForm_Simbolo.JvxRichEdit_68DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_68 );
end;

procedure TForm_Simbolo.JvxRichEdit_69DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_69 );
end;

procedure TForm_Simbolo.JvxRichEdit_70DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_70 );
end;

procedure TForm_Simbolo.JvxRichEdit_71DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_71 );
end;

procedure TForm_Simbolo.JvxRichEdit_72DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_72 );
end;

procedure TForm_Simbolo.JvxRichEdit_73DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_73 );
end;

procedure TForm_Simbolo.JvxRichEdit_74DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_74 );
end;

procedure TForm_Simbolo.JvxRichEdit_75DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_75 );
end;

procedure TForm_Simbolo.JvxRichEdit_76DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_76 );
end;

procedure TForm_Simbolo.JvxRichEdit_77DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_77 );
end;

procedure TForm_Simbolo.JvxRichEdit_78DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_78 );
end;

procedure TForm_Simbolo.JvxRichEdit_79DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_79 );
end;

procedure TForm_Simbolo.JvxRichEdit_80DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_80 );
end;

procedure TForm_Simbolo.JvxRichEdit_81DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_81 );
end;

procedure TForm_Simbolo.JvxRichEdit_82DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_82 );
end;

procedure TForm_Simbolo.JvxRichEdit_83DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_83 );
end;

procedure TForm_Simbolo.JvxRichEdit_84DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_84 );
end;

procedure TForm_Simbolo.JvxRichEdit_85DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_85 );
end;

procedure TForm_Simbolo.JvxRichEdit_86DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_86 );
end;

procedure TForm_Simbolo.JvxRichEdit_87DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_87 );
end;

procedure TForm_Simbolo.JvxRichEdit_88DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_88 );
end;

procedure TForm_Simbolo.JvxRichEdit_89DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_89 );
end;

procedure TForm_Simbolo.JvxRichEdit_90DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_90 );
end;

procedure TForm_Simbolo.JvxRichEdit_91DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_91 );
end;

procedure TForm_Simbolo.JvxRichEdit_92DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_92 );
end;

procedure TForm_Simbolo.JvxRichEdit_93DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_93 );
end;

procedure TForm_Simbolo.JvxRichEdit_95DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_95 );
end;

procedure TForm_Simbolo.JvxRichEdit_96DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_96 );
end;

procedure TForm_Simbolo.JvxRichEdit_97DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_97 );
end;

procedure TForm_Simbolo.JvxRichEdit_98DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_98 );
end;

procedure TForm_Simbolo.JvxRichEdit_99DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_99 );
end;

procedure TForm_Simbolo.JvxRichEdit_100DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_100 );
end;

procedure TForm_Simbolo.JvxRichEdit_101DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_101 );
end;

procedure TForm_Simbolo.JvxRichEdit_102DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_102 );
end;

procedure TForm_Simbolo.JvxRichEdit_103DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_103 );
end;

procedure TForm_Simbolo.JvxRichEdit_104DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_104 );
end;

procedure TForm_Simbolo.JvxRichEdit_105DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_105 );
end;

procedure TForm_Simbolo.JvxRichEdit_106DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_106 );
end;

procedure TForm_Simbolo.JvxRichEdit_107DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_107 );
end;

procedure TForm_Simbolo.JvxRichEdit_108DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_108 );
end;

procedure TForm_Simbolo.JvxRichEdit_109DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_109 );
end;

procedure TForm_Simbolo.JvxRichEdit_110DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_110 );
end;

procedure TForm_Simbolo.JvxRichEdit_111DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_111 );
end;

procedure TForm_Simbolo.JvxRichEdit_112DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_112 );
end;

procedure TForm_Simbolo.JvxRichEdit_113DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_113 );
end;

procedure TForm_Simbolo.JvxRichEdit_114DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_114 );
end;

procedure TForm_Simbolo.JvxRichEdit_115DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_115 );
end;

procedure TForm_Simbolo.JvxRichEdit_116DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_116 );
end;

procedure TForm_Simbolo.JvxRichEdit_117DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_117 );
end;

procedure TForm_Simbolo.JvxRichEdit_118DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_118 );
end;

procedure TForm_Simbolo.JvxRichEdit_119DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_119 );
end;

procedure TForm_Simbolo.JvxRichEdit106DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit106 );
end;

procedure TForm_Simbolo.JvxRichEdit105DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit105 );
end;

procedure TForm_Simbolo.JvxRichEdit104DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit104 );
end;

procedure TForm_Simbolo.JvxRichEdit103DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit103 );
end;

procedure TForm_Simbolo.JvxRichEdit102DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit102 );
end;

procedure TForm_Simbolo.JvxRichEdit101DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit101 );
end;

procedure TForm_Simbolo.JvxRichEdit100DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit100 );
end;

procedure TForm_Simbolo.JvxRichEdit99DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit99 );
end;

procedure TForm_Simbolo.JvxRichEdit98DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit98 );
end;

procedure TForm_Simbolo.JvxRichEdit97DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit97 );
end;

procedure TForm_Simbolo.JvxRichEdit96DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit96 );
end;

procedure TForm_Simbolo.JvxRichEdit95DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit95 );
end;

procedure TForm_Simbolo.JvxRichEdit94DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit94 );
end;

procedure TForm_Simbolo.JvxRichEdit93DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit93 );
end;

procedure TForm_Simbolo.JvxRichEdit92DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit92 );
end;

procedure TForm_Simbolo.JvxRichEdit91DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit91 );
end;

procedure TForm_Simbolo.JvxRichEdit90DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit90 );
end;

procedure TForm_Simbolo.JvxRichEdit89DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit89 );
end;

procedure TForm_Simbolo.JvxRichEdit88DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit88 );
end;

procedure TForm_Simbolo.JvxRichEdit87DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit87 );
end;

procedure TForm_Simbolo.JvxRichEdit86DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit86 );
end;

procedure TForm_Simbolo.JvxRichEdit112DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit112 );
end;

procedure TForm_Simbolo.JvxRichEdit111DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit111 );
end;

procedure TForm_Simbolo.JvxRichEdit110DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit110 );
end;

procedure TForm_Simbolo.JvxRichEdit109DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit109 );
end;

procedure TForm_Simbolo.JvxRichEdit108DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit108 );
end;

procedure TForm_Simbolo.JvxRichEdit85DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit85 );
end;

procedure TForm_Simbolo.JvxRichEdit_120DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_120 );
end;

procedure TForm_Simbolo.JvxRichEdit_121DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_121 );
end;

procedure TForm_Simbolo.JvxRichEdit_123DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_123 );
end;

procedure TForm_Simbolo.JvxRichEdit_124DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_124 );
end;

procedure TForm_Simbolo.JvxRichEdit_125DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_125 );
end;

procedure TForm_Simbolo.JvxRichEdit_127DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_127 );
end;

procedure TForm_Simbolo.JvxRichEdit_128DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_128 );
end;

procedure TForm_Simbolo.JvxRichEdit_129DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_129 );
end;

procedure TForm_Simbolo.JvxRichEdit_130DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_130 );
end;

procedure TForm_Simbolo.JvxRichEdit_131DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_131 );
end;

procedure TForm_Simbolo.JvxRichEdit_132DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_132 );
end;

procedure TForm_Simbolo.JvxRichEdit_133DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_133 );
end;

procedure TForm_Simbolo.JvxRichEdit_134DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_134 );
end;

procedure TForm_Simbolo.JvxRichEdit_135DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_135 );
end;

procedure TForm_Simbolo.JvxRichEdit_136DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_136 );
end;

procedure TForm_Simbolo.JvxRichEdit_137DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_137 );
end;

procedure TForm_Simbolo.JvxRichEdit_138DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_138 );
end;

procedure TForm_Simbolo.JvxRichEdit_139DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_139 );
end;

procedure TForm_Simbolo.JvxRichEdit_140DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_140 );
end;

procedure TForm_Simbolo.JvxRichEdit_141DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_141 );
end;

procedure TForm_Simbolo.JvxRichEdit_142DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_142 );
end;

procedure TForm_Simbolo.JvxRichEdit_143DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_143 );
end;

procedure TForm_Simbolo.JvxRichEdit_144DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_144 );
end;

procedure TForm_Simbolo.JvxRichEdit_145DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_145 );
end;

procedure TForm_Simbolo.JvxRichEdit_146DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_146 );
end;

procedure TForm_Simbolo.JvxRichEdit_147DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_147 );
end;

procedure TForm_Simbolo.JvxRichEdit_148DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_148 );
end;

procedure TForm_Simbolo.JvxRichEdit_149DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_149 );
end;

procedure TForm_Simbolo.JvxRichEdit_150DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_150 );
end;

procedure TForm_Simbolo.JvxRichEdit_151DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_151 );
end;

procedure TForm_Simbolo.JvxRichEdit_152DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_152 );
end;

procedure TForm_Simbolo.JvxRichEdit_153DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_153 );
end;

procedure TForm_Simbolo.JvxRichEdit_154DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_154 );
end;

procedure TForm_Simbolo.JvxRichEdit_155DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_155 );
end;

procedure TForm_Simbolo.JvxRichEdit_156DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_156 );
end;

procedure TForm_Simbolo.JvxRichEdit_157DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_157 );
end;

procedure TForm_Simbolo.JvxRichEdit_158DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_158 );
end;

procedure TForm_Simbolo.JvxRichEdit_159DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_159 );
end;

procedure TForm_Simbolo.JvxRichEdit_160DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_160 );
end;

procedure TForm_Simbolo.JvxRichEdit_161DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_161 );
end;

procedure TForm_Simbolo.JvxRichEdit_162DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_162 );
end;

procedure TForm_Simbolo.JvxRichEdit_163DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_163 );
end;

procedure TForm_Simbolo.JvxRichEdit_164DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_164 );
end;

procedure TForm_Simbolo.JvxRichEdit_165DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_165 );
end;

procedure TForm_Simbolo.JvxRichEdit_166DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_166 );
end;

procedure TForm_Simbolo.JvxRichEdit_167DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_167 );
end;

procedure TForm_Simbolo.JvxRichEdit_168DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_168 );
end;

procedure TForm_Simbolo.JvxRichEdit_169DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_169 );
end;

procedure TForm_Simbolo.JvxRichEdit_170DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_170 );
end;

procedure TForm_Simbolo.JvxRichEdit_171DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_171 );
end;

procedure TForm_Simbolo.JvxRichEdit_173DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_173 );
end;

procedure TForm_Simbolo.JvxRichEdit_174DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_174 );
end;

procedure TForm_Simbolo.JvxRichEdit_175DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_175 );
end;

procedure TForm_Simbolo.JvxRichEdit_176DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_176 );
end;

procedure TForm_Simbolo.JvxRichEdit_177DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_177 );
end;

procedure TForm_Simbolo.JvxRichEdit_178DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_178 );
end;

procedure TForm_Simbolo.JvxRichEdit_179DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_179 );
end;

procedure TForm_Simbolo.JvxRichEdit_180DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_180 );
end;

procedure TForm_Simbolo.JvxRichEdit_182DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_182 );
end;

procedure TForm_Simbolo.JvxRichEdit_183DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_183 );
end;

procedure TForm_Simbolo.JvxRichEdit_184DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_184 );
end;

procedure TForm_Simbolo.JvxRichEdit_185DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_185 );
end;

procedure TForm_Simbolo.JvxRichEdit_186DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_186 );
end;

procedure TForm_Simbolo.JvxRichEdit_187DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_187 );
end;

procedure TForm_Simbolo.JvxRichEdit_188DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_188 );
end;

procedure TForm_Simbolo.JvxRichEdit_189DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_189 );
end;

procedure TForm_Simbolo.JvxRichEdit_190DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_190 );
end;

procedure TForm_Simbolo.JvxRichEdit_191DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_191 );
end;

procedure TForm_Simbolo.JvxRichEdit_192DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_192 );
end;

procedure TForm_Simbolo.JvxRichEdit_193DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_193 );
end;

procedure TForm_Simbolo.JvxRichEdit_194DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_194 );
end;

procedure TForm_Simbolo.JvxRichEdit_195DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_195 );
end;

procedure TForm_Simbolo.JvxRichEdit_196DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_196 );
end;

procedure TForm_Simbolo.JvxRichEdit_197DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_197 );
end;

procedure TForm_Simbolo.JvxRichEdit_198DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_198 );
end;

procedure TForm_Simbolo.JvxRichEdit_199DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_199 );
end;

procedure TForm_Simbolo.JvxRichEdit_200DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_200 );
end;

procedure TForm_Simbolo.JvxRichEdit_201DblClick(Sender: TObject);
begin
   InsereCaracter( JvxRichEdit_201 );
end;


end.
