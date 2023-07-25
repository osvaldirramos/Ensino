//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_Instrutor.pas                              //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             dos Instrutores.                                    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 16/07/2011                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//


unit Cad_Instrutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, JvToolEdit, JvDBCtrl, DBCtrls, Rotinas_Sue, Rotinas,
  Mask, DB, IBCustomDataSet, IBTable, Buttons, JvDBTreeView, JvEditor,
  ExtCtrls, JvComponentPanel, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, JvDBDatePickerEdit, Grids, DBGrids, JvSwitch,
  JvComponent, JvClock, JvClipView, Menus, JvTransBtn, JvShape;

type
  TForm_Cad_Instrutor111 = class(TForm)
    PageControl_CadInstrutor: TPageControl;
    TabSheet_DadosPessoais: TTabSheet;
    GroupBox_Documentacao: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit_CPF: TDBEdit;
    DBEdit1: TDBEdit;
    GroupBox_NomeCargo: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label53: TLabel;
    DBEdit_NomeCompleto: TDBEdit;
    DBEdit_NomeGuerra: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    TabSheet_Endereco: TTabSheet;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label20: TLabel;
    DBEdit_CidadeAl: TDBEdit;
    DBEdit_CepAl: TDBEdit;
    DBEdit_EnderecoAl: TDBRichEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    GroupBox_EnderecoEletronico: TGroupBox;
    Label30: TLabel;
    DBEdit_EMailAl: TDBEdit;
    GroupBox6: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    DBEdit_Residencial: TDBEdit;
    DBEdit_Fax: TDBEdit;
    DBEdit_Comercial: TDBEdit;
    DBEdit_Celular: TDBEdit;
    TabSheet_Capacitacao: TTabSheet;
    GroupBox2: TGroupBox;
    DBEdit4: TDBEdit;
    CheckBox_CTP001: TCheckBox;
    CheckBox_CTP006: TCheckBox;
    CheckBox_CPI: TCheckBox;
    CheckBox_CTP011: TCheckBox;
    CheckBox_CTP500: TCheckBox;
    CheckBox_Licenciatura: TCheckBox;
    IBTable_Pessoa: TIBTable;
    IBTable_PessoaIDENTIDADE: TIBStringField;
    IBTable_PessoaNOME: TIBStringField;
    IBTable_PessoaNOMEGUERRA: TIBStringField;
    IBTable_PessoaPOSTOGRADUACAO: TIBStringField;
    IBTable_PessoaULTIMAPROMOCAO: TDateTimeField;
    IBTable_PessoaSEXO: TIBStringField;
    IBTable_PessoaSARAM: TIBStringField;
    IBTable_PessoaEMAIL: TIBStringField;
    IBTable_PessoaCPF_CIC: TIBStringField;
    IBTable_PessoaNOMEPAIS: TIBStringField;
    IBTable_PessoaQUADROESP: TIBStringField;
    IBTable_Endereco: TIBTable;
    IBTable_EnderecoIDENTIDADE: TIBStringField;
    IBTable_EnderecoENDERECO: TIBStringField;
    IBTable_EnderecoCIDADE: TIBStringField;
    IBTable_EnderecoUF: TIBStringField;
    IBTable_EnderecoCEP: TIBStringField;
    IBTable_EnderecoPAIS: TIBStringField;
    IBTable_Telefone: TIBTable;
    DST_Telefone: TDataSource;
    DST_Endereco: TDataSource;
    DST_Pessoa: TDataSource;
    IBTable_Instrutor: TIBTable;
    IBTable_InstrutorIDENTIDADE: TIBStringField;
    IBTable_InstrutorCTP001: TIBStringField;
    IBTable_InstrutorCTP006: TIBStringField;
    IBTable_InstrutorCTP011: TIBStringField;
    IBTable_InstrutorCPI: TIBStringField;
    IBTable_InstrutorCTP500: TIBStringField;
    IBTable_InstrutorLICENCIATURA: TIBStringField;
    DST_instrutor: TDataSource;
    IBTable_InstrutorDESCLICENCIATURA: TIBStringField;
    IBTable_TelefoneIDENTIDADE: TIBStringField;
    IBTable_TelefoneCELULAR1: TIBStringField;
    IBTable_TelefoneTEL_RESIDENCIAL: TIBStringField;
    IBTable_TelefoneTEL_CONTATO: TIBStringField;
    IBTable_TelefoneTEL_COMERCIAL: TIBStringField;
    IBTable_TelefoneCELULAR: TIBStringField;
    IBTable_TelefoneFAX: TIBStringField;
    Panel_BotoesPrincipal: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    Memo2: TMemo;

    procedure TrataCapacitacao;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
  private         { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Cad_Instrutor111: TForm_Cad_Instrutor111;

implementation

uses Con_InstrutoresMateria;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Instrutor111.FormActivate(Sender: TObject);
begin
   IBTable_Pessoa.Open;
   IBTable_Endereco.Open;
   IBTable_Telefone.Open;
   IBTable_Instrutor.Open;
   TrataCapacitacao;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Instrutor111.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_Pessoa.Close;
   IBTable_Endereco.Close;
   IBTable_Telefone.Close;
   IBTable_Instrutor.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Instrutor111.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Trata Apresentacao da Capacitacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Instrutor111.TrataCapacitacao;
begin
   if IBTable_Instrutor.FieldByName('CTP001').AsString = 'S' then
      CheckBox_CTP001.Checked:= True
   else
      CheckBox_CTP001.Checked:= False;

   if IBTable_Instrutor.FieldByName('CTP006').AsString = 'S' then
      CheckBox_CTP006.Checked:= True
   else
      CheckBox_CTP006.Checked:= False;

   if IBTable_Instrutor.FieldByName('CTP011').AsString = 'S' then
      CheckBox_CTP011.Checked:= True
   else
      CheckBox_CTP011.Checked:= False;

   if IBTable_Instrutor.FieldByName('CPI').AsString = 'S' then
      CheckBox_CPI.Checked:= True
   else
      CheckBox_CPI.Checked:= False;

   if IBTable_Instrutor.FieldByName('CTP500').AsString = 'S' then
      CheckBox_CTP500.Checked:= True
   else
      CheckBox_CTP500.Checked:= False;

   if IBTable_Instrutor.FieldByName('LICENCIATURA').AsString = 'S' then
      CheckBox_Licenciatura.Checked:= True
   else
      CheckBox_Licenciatura.Checked:= False;
end;

end.
