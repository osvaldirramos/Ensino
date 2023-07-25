unit PTS_Novo_Carga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBTable, Grids, DBGrids, rotinas,
  JvRichEd, JvDBRichEd, ExtCtrls, DBCtrls, IBQuery;

type
  TForm_PTS_Novo_Carga = class(TForm)
    IBTable_PTS_base_Principal: TIBTable;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    IBTable_PTS_base: TIBTable;
    DST_PTS: TDataSource;
    IBTable_PTS_baseIDCURSO: TSmallintField;
    IBTable_PTS_baseSEMANA: TSmallintField;
    IBTable_PTS_baseDATA_02: TIBStringField;
    IBTable_PTS_baseDIA_SEMANA_02: TIBStringField;
    IBTable_PTS_baseHORARIO_01_02: TIBStringField;
    IBTable_PTS_baseHORARIO_02_02: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_01_02: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_02_02: TIBStringField;
    IBTable_PTS_baseEQUIPE_01_02: TIBStringField;
    IBTable_PTS_baseEQUIPE_02_02: TIBStringField;
    IBTable_PTS_baseLOCAL_01_02: TIBStringField;
    IBTable_PTS_baseLOCAL_02_02: TIBStringField;
    IBTable_PTS_baseDATA_03: TIBStringField;
    IBTable_PTS_baseDIA_SEMANA_03: TIBStringField;
    IBTable_PTS_baseHORARIO_01_03: TIBStringField;
    IBTable_PTS_baseHORARIO_02_03: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_01_03: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_02_03: TIBStringField;
    IBTable_PTS_baseEQUIPE_01_03: TIBStringField;
    IBTable_PTS_baseEQUIPE_02_03: TIBStringField;
    IBTable_PTS_baseLOCAL_01_03: TIBStringField;
    IBTable_PTS_baseLOCAL_02_03: TIBStringField;
    IBTable_PTS_baseDATA_04: TIBStringField;
    IBTable_PTS_baseDIA_SEMANA_04: TIBStringField;
    IBTable_PTS_baseHORARIO_01_04: TIBStringField;
    IBTable_PTS_baseHORARIO_02_04: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_01_04: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_02_04: TIBStringField;
    IBTable_PTS_baseEQUIPE_01_04: TIBStringField;
    IBTable_PTS_baseEQUIPE_02_04: TIBStringField;
    IBTable_PTS_baseLOCAL_01_04: TIBStringField;
    IBTable_PTS_baseLOCAL_02_04: TIBStringField;
    IBTable_PTS_baseDATA_05: TIBStringField;
    IBTable_PTS_baseDIA_SEMANA_05: TIBStringField;
    IBTable_PTS_baseHORARIO_01_05: TIBStringField;
    IBTable_PTS_baseHORARIO_02_05: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_01_05: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_02_05: TIBStringField;
    IBTable_PTS_baseEQUIPE_01_05: TIBStringField;
    IBTable_PTS_baseEQUIPE_02_05: TIBStringField;
    IBTable_PTS_baseLOCAL_01_05: TIBStringField;
    IBTable_PTS_baseLOCAL_02_05: TIBStringField;
    IBTable_PTS_baseDATA_06: TIBStringField;
    IBTable_PTS_baseDIA_SEMANA_06: TIBStringField;
    IBTable_PTS_baseHORARIO_01_06: TIBStringField;
    IBTable_PTS_baseHORARIO_02_06: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_01_06: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_02_06: TIBStringField;
    IBTable_PTS_baseEQUIPE_01_06: TIBStringField;
    IBTable_PTS_baseEQUIPE_02_06: TIBStringField;
    IBTable_PTS_baseLOCAL_01_06: TIBStringField;
    IBTable_PTS_baseLOCAL_02_06: TIBStringField;
    IBTable_PTS_baseATUALIZACAO: TDateTimeField;
    IBTable_PTS_baseANO: TIBStringField;
    IBTable_PTS_baseMSG: TIBStringField;
    ScrollBox_PTS: TScrollBox;
    Panel_QuaFeira: TPanel;
    Panel_4: TPanel;
    Label_Quarta: TLabel;
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
    Label_Sexta: TLabel;
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
    Label_Quinta: TLabel;
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
    Label_Terca: TLabel;
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
    Label_Segunda: TLabel;
    IBTable_PTS_base_PrincipalIDCURSO: TSmallintField;
    IBTable_PTS_base_PrincipalRESPONSAVEL: TIBStringField;
    IBTable_PTS_base_PrincipalATUALIZACAO: TDateTimeField;
    IBTable_PTS_base_PrincipalANO: TIBStringField;
    IBTable_PTS_base_PrincipalMSG: TIBStringField;
    IBTable_PTS_base_PrincipalARQUIVO_QUADRO_PERFIL: TIBStringField;
    IBTable_PTS_base_Semana: TIBTable;
    DST_PTS_base_Semana: TDataSource;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button2: TButton;
    DBGrid4: TDBGrid;
    DataSource1: TDataSource;
    Button3: TButton;
    IBQuery_PTS_base: TIBQuery;
    IBQuery_PTS_baseIDCURSO: TSmallintField;
    IBQuery_PTS_baseCODCURSO: TIBStringField;
    Button4: TButton;

    Function TrabalhoEscolar(IdCurso, VS_Opcao: String): String;
    procedure Cad_Semana(IDCurso, IdSemana, Dia_Semana, HORARIO, TRAB_ESCOLAR, LOCAL, DISCIPLINA, QTD_INSTRUTOR, ESPECIALIDADE: String);

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PTS_Novo_Carga: TForm_PTS_Novo_Carga;

implementation

uses Module;

{$R *.dfm}

procedure TForm_PTS_Novo_Carga.FormActivate(Sender: TObject);
begin
   IBQuery_PTS_base.Open;
   IBTable_PTS_base.Open;
   IBTable_PTS_base_Principal.Open;
   IBTable_PTS_base_Semana.Open;

   IBTable_PTS_base.Filtered:= True;

end;


procedure TForm_PTS_Novo_Carga.Button1Click(Sender: TObject);
var
    Hora: Array[1..100] of string;
    Trabalho: Array[1..100] of string;
    VS_Horario, VS_Trab_Escolar, VS_Docente, VS_Local: String;
    VI_Hora, VI_Trabalho, i: integer;
    VI_IdCurso: Integer;

begin
//IBQuery_PTS_base.First;
//While not IBQuery_PTS_base.Eof do
//begin
   VI_IdCurso:= -111;

    VI_Hora:= 0;
    VI_Trabalho:= 0;

    while not IBTable_PTS_base.eof do
    begin
       if VI_IdCurso <> IBTable_PTS_base.FieldByName('IDCURSO').AsInteger then
       begin
          VI_IdCurso:= IBTable_PTS_base.FieldByName('IDCURSO').AsInteger;

         //--- Grava o PTS Principal

          IBTable_PTS_base_Principal.Append;
          IBTable_PTS_base_Principal.FieldByName('IDCURSO').AsString:= IBTable_PTS_base.FieldByName('IDCURSO').AsString;
          IBTable_PTS_base_Principal.FieldByName('RESPONSAVEL').AsString:= '';
          IBTable_PTS_base_Principal.FieldByName('ATUALIZACAO').AsString:= IBTable_PTS_base.FieldByName('ATUALIZACAO').AsString;
          IBTable_PTS_base_Principal.FieldByName('ANO').AsString:= IBTable_PTS_base.FieldByName('ANO').AsString;
          IBTable_PTS_base_Principal.FieldByName('MSG').AsString:=  IBTable_PTS_base.FieldByName('MSG').AsString;
          IBTable_PTS_base_Principal.FieldByName('ARQUIVO_QUADRO_PERFIL').AsString:= '';
          IBTable_PTS_base_Principal.Post;
          Funcoes.ExecutaTransacao;
       end;

       for i := 0 to JvDBRichEdit_Hor_1.Lines.Count -1 do
       begin
          VS_Horario:= JvDBRichEdit_Hor_1.Lines[i];        { Faz o que quiser com a linha }
          VS_Trab_Escolar := JvDBRichEdit_Segunda_1.Lines[i];

          VS_Docente := JvDBRichEdit_Doc_1.Lines[i];        { Faz o que quiser com a linha }
          VS_Local := JvDBRichEdit_Loc_1.Lines[i];        { Faz o que quiser com a linha }

          Cad_Semana(IBTable_PTS_base.FieldByName('IDCURSO').AsString,
                     IBTable_PTS_base.FieldByName('SEMANA').AsString,
                     IBTable_PTS_base.FieldByName('DIA_SEMANA_02').AsString,
                     VS_Horario,
                     VS_Trab_Escolar,
                     VS_Local,
                     '',
                     '',
                    '');

          VS_Horario:= JvDBRichEdit_Hor_2.Lines[i];        { Faz o que quiser com a linha }
          VS_Trab_Escolar := JvDBRichEdit_Segunda_2.Lines[i];

          VS_Docente := JvDBRichEdit_Doc_2.Lines[i];        { Faz o que quiser com a linha }
          VS_Local := JvDBRichEdit_Loc_2.Lines[i];        { Faz o que quiser com a linha }

          Cad_Semana(IBTable_PTS_base.FieldByName('IDCURSO').AsString,
                     IBTable_PTS_base.FieldByName('SEMANA').AsString,
                     IBTable_PTS_base.FieldByName('DIA_SEMANA_02').AsString,
                     VS_Horario,
                     VS_Trab_Escolar,
                     VS_Local,
                     '',
                     '',
                    '');

          // Terca

          VS_Horario:= JvDBRichEdit_Hor_3.Lines[i];        { Faz o que quiser com a linha }
          VS_Trab_Escolar := JvDBRichEdit_Terca_1.Lines[i];
          VS_Docente := JvDBRichEdit_Doc_3.Lines[i];        { Faz o que quiser com a linha }
          VS_Local := JvDBRichEdit_Loc_3.Lines[i];        { Faz o que quiser com a linha }

          Cad_Semana(IBTable_PTS_base.FieldByName('IDCURSO').AsString,
                     IBTable_PTS_base.FieldByName('SEMANA').AsString,
                     IBTable_PTS_base.FieldByName('DIA_SEMANA_03').AsString,
                     VS_Horario,
                     VS_Trab_Escolar,
                     VS_Local,
                     '',
                     '',
                    '');

          VS_Horario:= JvDBRichEdit_Hor_4.Lines[i];        { Faz o que quiser com a linha }
          VS_Trab_Escolar := JvDBRichEdit_Terca_2.Lines[i];
          VS_Docente := JvDBRichEdit_Doc_4.Lines[i];        { Faz o que quiser com a linha }
          VS_Local := JvDBRichEdit_Loc_4.Lines[i];        { Faz o que quiser com a linha }

          Cad_Semana(IBTable_PTS_base.FieldByName('IDCURSO').AsString,
                     IBTable_PTS_base.FieldByName('SEMANA').AsString,
                     IBTable_PTS_base.FieldByName('DIA_SEMANA_03').AsString,
                     VS_Horario,
                     VS_Trab_Escolar,
                     VS_Local,
                     '',
                     '',
                    '');

          // Quarta

          VS_Horario:= JvDBRichEdit_Hor_5.Lines[i];        { Faz o que quiser com a linha }
          VS_Trab_Escolar := JvDBRichEdit_Quarta_1.Lines[i];
          VS_Docente := JvDBRichEdit_Doc_5.Lines[i];        { Faz o que quiser com a linha }
          VS_Local := JvDBRichEdit_Loc_5.Lines[i];        { Faz o que quiser com a linha }

          Cad_Semana(IBTable_PTS_base.FieldByName('IDCURSO').AsString,
                     IBTable_PTS_base.FieldByName('SEMANA').AsString,
                     IBTable_PTS_base.FieldByName('DIA_SEMANA_04').AsString,
                     VS_Horario,
                     VS_Trab_Escolar,
                     VS_Local,
                     '',
                     '',
                    '');

          VS_Horario:= JvDBRichEdit_Hor_6.Lines[i];        { Faz o que quiser com a linha }
          VS_Trab_Escolar := JvDBRichEdit_Quarta_2.Lines[i];
          VS_Docente := JvDBRichEdit_Doc_6.Lines[i];        { Faz o que quiser com a linha }
          VS_Local := JvDBRichEdit_Loc_6.Lines[i];        { Faz o que quiser com a linha }

          Cad_Semana(IBTable_PTS_base.FieldByName('IDCURSO').AsString,
                     IBTable_PTS_base.FieldByName('SEMANA').AsString,
                     IBTable_PTS_base.FieldByName('DIA_SEMANA_04').AsString,
                     VS_Horario,
                     VS_Trab_Escolar,
                     VS_Local,
                     '',
                     '',
                    '');

          // Quinta

          VS_Horario:= JvDBRichEdit_Hor_7.Lines[i];        { Faz o que quiser com a linha }
          VS_Trab_Escolar := JvDBRichEdit_Quinta_1.Lines[i];
          VS_Docente := JvDBRichEdit_Doc_7.Lines[i];        { Faz o que quiser com a linha }
          VS_Local := JvDBRichEdit_Loc_7.Lines[i];        { Faz o que quiser com a linha }

          Cad_Semana(IBTable_PTS_base.FieldByName('IDCURSO').AsString,
                     IBTable_PTS_base.FieldByName('SEMANA').AsString,
                     IBTable_PTS_base.FieldByName('DIA_SEMANA_05').AsString,
                     VS_Horario,
                     VS_Trab_Escolar,
                     VS_Local,
                     '',
                     '',
                    '');

          VS_Horario:= JvDBRichEdit_Hor_8.Lines[i];        { Faz o que quiser com a linha }
          VS_Trab_Escolar := JvDBRichEdit_Quinta_2.Lines[i];
          VS_Docente := JvDBRichEdit_Doc_8.Lines[i];        { Faz o que quiser com a linha }
          VS_Local := JvDBRichEdit_Loc_8.Lines[i];        { Faz o que quiser com a linha }

          Cad_Semana(IBTable_PTS_base.FieldByName('IDCURSO').AsString,
                     IBTable_PTS_base.FieldByName('SEMANA').AsString,
                     IBTable_PTS_base.FieldByName('DIA_SEMANA_05').AsString,
                     VS_Horario,
                     VS_Trab_Escolar,
                     VS_Local,
                     '',
                     '',
                    '');

          // Sexta

          VS_Horario:= JvDBRichEdit_Hor_9.Lines[i];        { Faz o que quiser com a linha }
          VS_Trab_Escolar := JvDBRichEdit_Sexta_1.Lines[i];
          VS_Docente := JvDBRichEdit_Doc_9.Lines[i];        { Faz o que quiser com a linha }
          VS_Local := JvDBRichEdit_Loc_9.Lines[i];        { Faz o que quiser com a linha }

          Cad_Semana(IBTable_PTS_base.FieldByName('IDCURSO').AsString,
                     IBTable_PTS_base.FieldByName('SEMANA').AsString,
                     IBTable_PTS_base.FieldByName('DIA_SEMANA_06').AsString,
                     VS_Horario,
                     VS_Trab_Escolar,
                     VS_Local,
                     '',
                     '',
                    '');

          VS_Horario:= JvDBRichEdit_Hor_10.Lines[i];        { Faz o que quiser com a linha }
          VS_Trab_Escolar:= JvDBRichEdit_Sexta_2.Lines[i];
          VS_Docente := JvDBRichEdit_Doc_10.Lines[i];        { Faz o que quiser com a linha }
          VS_Local := JvDBRichEdit_Loc_10.Lines[i];        { Faz o que quiser com a linha }

          Cad_Semana(IBTable_PTS_base.FieldByName('IDCURSO').AsString,
                     IBTable_PTS_base.FieldByName('SEMANA').AsString,
                     IBTable_PTS_base.FieldByName('DIA_SEMANA_06').AsString,
                     VS_Horario,
                     VS_Trab_Escolar,
                     VS_Local,
                     '',
                     '',
                    '');

       end;
       IBTable_PTS_base.Next;
    end;

    IBQuery_PTS_base.Close;
    IBQuery_PTS_base.Open;
//IBQuery_PTS_base.Next;
//end;
end;

procedure TForm_PTS_Novo_Carga.Cad_Semana(IDCurso, IdSemana, Dia_Semana, HORARIO, TRAB_ESCOLAR, LOCAL, DISCIPLINA, QTD_INSTRUTOR, ESPECIALIDADE: String);
var
   VS_Trab_Escolar, VS_Horario: String;
begin

   if ((IdSemana = '4') and (dia_semana = '6º Feira')) then
       VS_Trab_Escolar:= trim(TRAB_ESCOLAR);


   VS_Trab_Escolar:= trim(TRAB_ESCOLAR);
   VS_Trab_Escolar:= Uppercase(VS_Trab_Escolar);
   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, #9, '');
   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, #$D, '');
   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, #$A, '');

   //--- Tratameno para os acentos

   VS_Trab_Escolar:= Funcoes.AjustarMaiscula(VS_Trab_Escolar);

//   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, 'ç', 'Ç');
//   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, 'á', 'Á');
//   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, 'é', 'É');
//   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, 'í', 'Í');
//   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, 'ó', 'Ó');
//   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, 'ú', 'Ú');
//   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, 'ã', 'Ã');
//   VS_Trab_Escolar:= Funcoes.DePara(VS_Trab_Escolar, 'õ', 'Õ');

   VS_Trab_Escolar:= trim(VS_Trab_Escolar);


   //----- Tratamento do Horario

   VS_Horario:= trim(HORARIO);

   if ((VS_Trab_Escolar <> '') and (VS_Horario <> '')) then
   begin
      IBTable_PTS_base_Semana.Append;
      IBTable_PTS_base_Semana.FieldByName('IDCURSO').AsString:= IDCurso;
      IBTable_PTS_base_Semana.FieldByName('IDSEMANA').AsString:= IdSemana;
      IBTable_PTS_base_Semana.FieldByName('DIA_SEMANA').AsString:= Dia_Semana;
      IBTable_PTS_base_Semana.FieldByName('HORARIO').AsString:= HORARIO;
      IBTable_PTS_base_Semana.FieldByName('TRAB_ESCOLAR').AsString:= VS_Trab_Escolar;
      IBTable_PTS_base_Semana.FieldByName('LOCAL').AsString:= LOCAL;
      IBTable_PTS_base_Semana.FieldByName('DISCIPLINA').AsString:= TrabalhoEscolar(IdCurso, VS_Trab_Escolar);
      IBTable_PTS_base_Semana.FieldByName('QTD_INSTRUTOR').AsString:= QTD_INSTRUTOR;
      IBTable_PTS_base_Semana.FieldByName('ESPECIALIDADE').AsString:= ESPECIALIDADE;
      IBTable_PTS_base_Semana.Post;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do trabalho Escolar
//------------------------------------------------------------------------------

Function TForm_PTS_Novo_Carga.TrabalhoEscolar(IdCurso, VS_Opcao: String): String;
var
   VS_CodMateria, Retorno, VS_Comando: String;
begin
   VS_CodMateria:= Funcoes.TrocarAcentoPor_(VS_Opcao);
   Retorno:= '';
   VS_Comando:='Select distinct CodMateria '+
                     ' From MateriaCurso '+
                     ' where IdCurso = '+IdCurso+
                     ' and upper(NomeMateria) like '+#39+VS_CodMateria+#39;
   Funcoes.OpenQuery(VS_Comando );

   if trim(DM.IBQuery_Executa.FieldByName('CodMateria').AsString) <> '' then
      Retorno:=  DM.IBQuery_Executa.FieldByName('CodMateria').AsString ;

   TrabalhoEscolar:= Retorno;
end;

procedure TForm_PTS_Novo_Carga.Button2Click(Sender: TObject);
begin
   IBTable_PTS_base.Filter:=  'idcurso = '+Edit1.Text;
   IBTable_PTS_base.Filtered:= True;
end;

procedure TForm_PTS_Novo_Carga.Button3Click(Sender: TObject);
begin
   Close;
end;


procedure TForm_PTS_Novo_Carga.DBGrid1CellClick(Column: TColumn);
begin
     edit1.Text:= IBQuery_PTS_base.FieldByName('IdCurso').AsString;
end;

procedure TForm_PTS_Novo_Carga.Button4Click(Sender: TObject);
begin
   While not IBQuery_PTS_base.eof do
   begin
      Edit1.Text:= IBQuery_PTS_base.FieldByName('IdCurso').AsString;

      IBTable_PTS_base.Filter:=  'idcurso = '+Edit1.Text;
      IBTable_PTS_base.Filtered:= True;
      Button1Click(Sender);
      
  //    IBQuery_PTS_base.Next;
   end;

end;

end.
