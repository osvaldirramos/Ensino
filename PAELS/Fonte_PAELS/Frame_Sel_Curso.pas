unit Frame_Sel_Curso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Rotinas, Mask, DBCtrls, JvComponent, JvLookOut,
  JvShape, ExtCtrls, JvGradient, Rotinas_SUE;

type
  TFrame_SelCurso = class(TFrame)
    Panel_SelCurso: TPanel;
    JvGradient3: TJvGradient;
    Label_CodCurso: TLabel;
    Label_Turma: TLabel;
    Label_Termino: TLabel;
    Label_Inicio: TLabel;
    ComboBox_Curso: TComboBox;
    ComboBox_Turma: TComboBox;
    DBEdit_Inicio: TDBEdit;
    DBEdit_Termino: TDBEdit;
    Label_TerminoDist: TLabel;
    DBEdit_Coordenador: TDBEdit;

    procedure TrataCurso(VS_Opcao, VS_Tratar: String);
    procedure MontaCurso(PS_Curso: String);

    procedure Monta_ComboTurma_Selecao;
    procedure DefinirTurma(Cor : TColor; Status: boolean);
    procedure TurmaDefault(VS_Comando: String);

    procedure ComboBox_CursoChange(Sender: TObject);
    procedure ComboBox_TurmaChange(Sender: TObject);
    procedure ComboBox_TurmaKeyPress(Sender: TObject; var Key: Char);

  private            { Private declarations }
    VS_DescCurso, VS_CodCurso, VS_IdCurso: String;

    MS_Turma: Array[1..1500] of String;

  public             { Public declarations }
  end;

var
   Frame_SelCurso: TFrame_SelCurso;

implementation

uses Module;

{$R *.dfm}

procedure TFrame_SelCurso.TrataCurso(VS_Opcao, VS_Tratar: String);
begin
   DefinirTurma($00F2F2F2, True);

   VS_CodCurso:= '';
   Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
   ComboBox_Curso.Text:= Funcoes.GetCodCurso;
   MontaCurso(Funcoes.GetCodCurso);
end;

//------------------------------------------------------------------------------
// Tratamento do Combox de Selecao de Curso
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.ComboBox_CursoChange(Sender: TObject);
begin
   DM.IBQuery_ExecutaEnsino.Close;
   MontaCurso(ComboBox_Curso.Text);
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.MontaCurso(PS_Curso: String);
var
   Sender: TObject;
begin
   if VS_CodCurso <> PS_Curso then
   begin
      if trim(PS_Curso) <> '' then
      begin
         //--- Monta query de selecao de curso

         Funcoes.ExecutaQuery(DM.IBQuery_ExecutaEnsino, 'Select IdCurso, CodCurso, NomeCurso, Numero_Ideal_Itens '+
                                                  'From Curso '+
                                                  ' where codcurso = '+#39+PS_Curso+#39
                             );

         if Trim(DM.IBQuery_ExecutaEnsino.FieldByName('CodCurso').AsString) <> '' then
         begin
            //--- Inicia Montagem da arvore

            ComboBox_Curso.Text:= DM.IBQuery_ExecutaEnsino.FieldByName('CodCurso').AsString;

            VS_IdCurso:= DM.IBQuery_ExecutaEnsino.FieldByName('IdCurso').AsString;
            Funcoes.SetCodCurso(ComboBox_Curso.Text);
            VS_CodCurso:= ComboBox_Curso.Text;
            VS_DescCurso:= DM.IBQuery_ExecutaEnsino.FieldByNAme('NomeCurso').AsString;
            Funcoes.SetIdCurso(DM.IBQuery_ExecutaEnsino.FieldByNAme('IdCurso').AsString);

            Monta_ComboTurma_Selecao;
            ComboBox_TurmaChange(Sender);

          end
          else
          begin
             Showmessage('Curso não Cadastrado.');
          end;
       end;
   end;
end;

//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.Monta_ComboTurma_Selecao;
var
   VI_Indice: Integer;
   VS_Comando, VS_Opcao: String;
begin


   VS_Comando:= 'Select IdCurso, IdTurma, Turma, CodCurso, Ano, DataInicio, DataTermino, Coordenador, Status, Descricao From turmas_Todas_View where IdCurso = '+Funcoes.GetIdCurso;

   if DM.IBQuery_Login_Instrutor.FieldByName('IdTurma').AsString <> '' then
   begin
      VS_Opcao:= ' and ';
      DM.IBQuery_Login_Instrutor.First;
      While not DM.IBQuery_Login_Instrutor.eof do
      begin
         if VS_Opcao = ' and ' then
         begin
            VS_Comando:= VS_Comando+' and ( IdTurma = '+DM.IBQuery_Login_Instrutor.FieldByName('IdTurma').AsString;
            VS_Opcao:= ' or ';
         end
         else
         begin
            VS_Comando:= VS_Comando+' or IdTurma = '+DM.IBQuery_Login_Instrutor.FieldByName('IdTurma').AsString;
         end;

         DM.IBQuery_Login_Instrutor.Next;
      end;
      VS_Comando:= VS_Comando+' )';
   end;

   VS_Comando:= VS_Comando+' and Status <> '+#39+'P'+#39+' Order By IdTurma desc';

   Funcoes.OpenQueryEnsino(DM.IBQuery_MontaTurma,VS_Comando);
   DM.IBQuery_MontaTurma.First;

   VI_Indice:= 1;

   While not DM.IBQuery_MontaTurma.Eof do
   begin
      if ((Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'PIL') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,5,4) <> 'COPM') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'BDS') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'VAL') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'VLD') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'BDS')) then
         Break
     else
         DM.IBQuery_MontaTurma.Next;
   end;

   ComboBox_Turma.Items.Clear;
   if Trim(DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString) = '' then
   begin
      ComboBox_Turma.Text:= '';
      MS_Turma[VI_Indice]:= '-2';
   end
   else
   begin
     if ((Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'PIL') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,5,4) <> 'COPM') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'BDS') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'VAL') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'VLD') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'BDS')) then
     begin
        ComboBox_Turma.Text:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
        MS_Turma[VI_Indice]:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
     end;
   end;

   While not DM.IBQuery_MontaTurma.Eof do
   begin
     if ((Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'PIL') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,5,4) <> 'COPM') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'BDS') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'VAL') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'VLD') and
         (Copy(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'BDS')) then
      begin
         ComboBox_Turma.Items.Add( DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString);
         VI_Indice:= VI_Indice + 1;
         MS_Turma[VI_Indice]:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      end;
      DM.IBQuery_MontaTurma.Next;
   end;
end;

//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.TurmaDefault(VS_Comando: String);
begin
   Funcoes.OpenQueryEnsino(DM.IBQuery_ExecutaEnsino, VS_Comando);
   if DM.IBQuery_ExecutaEnsino.FieldByName('Descricao').AsString = '' then
   begin
      if DM.IBQuery_ExecutaEnsino.FieldByName('Turma').AsString <> '' then
      begin
         ComboBox_Turma.Text:= DM.IBQuery_ExecutaEnsino.FieldByName('Turma').AsString+' - '+DM.IBQuery_ExecutaEnsino.FieldByName('Ano').AsString+' - '+VS_DescCurso;
         MS_Turma[1]:= DM.IBQuery_ExecutaEnsino.FieldByName('IdTurma').AsString;
      end
      else
      begin
         ComboBox_Turma.Text:= '';
         MS_Turma[1]:= '-2';
      end;
   end
   else
   begin
      ComboBox_Turma.Text:= DM.IBQuery_ExecutaEnsino.FieldByName('Turma').AsString+' - '+DM.IBQuery_ExecutaEnsino.FieldByName('Ano').AsString+' - '+DM.IBQuery_ExecutaEnsino.FieldByName('Descricao').AsString;
      MS_Turma[1]:= DM.IBQuery_ExecutaEnsino.FieldByName('IdTurma').AsString;
   end;
end;
//------------------------------------------------------------------------------
// Tratamento da selecao da turma
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.ComboBox_TurmaChange(Sender: TObject);
var
   VS_Turma: String;
   VI_IdTurma: Integer;
begin
   VS_Turma:= Trim(Funcoes.ExtraiAntesDe(ComboBox_Turma.Text, '-'));

   VI_IdTurma:= ComboBox_Turma.ItemIndex+2;
   if MS_Turma[VI_IdTurma] <> '-2' then
      Funcoes.MontaTurma(VS_IdCurso, MS_Turma[VI_IdTurma])
   else
      Funcoes.MontaTurma(VS_IdCurso, MS_Turma[1]);

   if VS_Turma = 'TURMA' then
      DefinirTurma($00FEC0B8, True)
   else
      DefinirTurma($00F2F2F2, False);
end;

//------------------------------------------------------------------------------
// Procedure para tratar a selecao da Turma Base
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.DefinirTurma(Cor : TColor; Status: boolean);
var
   VB_Status: Boolean;
begin
   //--- Tratamento para Turma Base

   if Copy(ComboBox_Turma.Text,1,5) = 'TURMA' then
   begin
      ComboBox_Turma.Color:= Cor;

      Label_Inicio.Visible:= False;
      Label_Termino.Visible:= False;

      DBEdit_Inicio.Visible:= False;
      DBEdit_Termino.Visible:= False;
      DBEdit_Coordenador.Visible:= False;

   end
   else
   begin      //--- Ajustar de acordo com a apresentacao da turma (Presencial/Semi)
      ComboBox_Turma.Color:= Cor;
      DBEdit_Inicio.Color:= Cor;
      DBEdit_Termino.Color:= Cor;
      DBEdit_Coordenador.Color:= Cor;

      //--- Ajustar de acordo com a selecao da turma

      if ComboBox_Curso.Text = '' then
         VB_Status:= False
      else
         VB_Status:= True;

      ComboBox_Turma.Visible:= VB_Status;
      DBEdit_Inicio.Visible:= VB_Status;
      DBEdit_Termino.Visible:= VB_Status;
      DBEdit_Coordenador.Visible:= VB_Status;

      Label_Turma.Visible:= VB_Status;
      Label_Inicio.Visible:= VB_Status;
      Label_Termino.Visible:= VB_Status;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para evitar de digitacao no campo de selecao da turma
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.ComboBox_TurmaKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= #0;
end;


end.
