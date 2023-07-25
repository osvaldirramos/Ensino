program P_CadItemInstrutor;

uses
  Forms,
  DM_Item in 'DM_Item.pas' {DMItem},
  Cad_ItemProva in 'Cad_ItemProva.pas' {Form_Cad_ItemProva},
  Sel_ItemProva in 'Sel_ItemProva.pas' {Form_Sel_ItemProva},
  Module in 'Module.pas' {DM: TDataModule},
  Abertura in 'Abertura.pas' {Form_Abertura},
  Rotinas in 'Rotinas.pas',
  frmSimbolo in 'frmSimbolo.pas' {Form_Simbolo},
  ImageWin in 'ImageWin.pas' {Form_SelFoto},
  Rotinas_SUE in 'Rotinas_SUE.pas',
  Cad_IndiceFacilidade in 'Cad_IndiceFacilidade.pas' {Form_Item_IndiceFacilidade},
  AlterarSenha in 'AlterarSenha.pas' {Form_AlterarSenha};

//  VerificaSenha in '..\..\..\Rotinas Gerais\VerificaSenha.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Itens Instrutor';
  Application.CreateForm(TForm_Abertura, Form_Abertura);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMItem, DMItem);
  Application.CreateForm(TForm_Simbolo, Form_Simbolo);
  Application.CreateForm(TForm_SelFoto, Form_SelFoto);
  Application.CreateForm(TForm_Item_IndiceFacilidade, Form_Item_IndiceFacilidade);
  Application.CreateForm(TForm_AlterarSenha, Form_AlterarSenha);
  //  Application.CreateForm(TForm_MontarProva, Form_MontarProva);
  Application.Run;
end.
