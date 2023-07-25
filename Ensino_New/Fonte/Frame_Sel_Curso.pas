unit Frame_Sel_Curso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Rotinas, Mask, DBCtrls, JvComponent, JvLookOut,
  JvShape, ExtCtrls, JvGradient, Rotinas_SUE, JvLabel, JvBlinkingLabel,
  ComCtrls;

type
  TFrame_SelCurso = class(TFrame)
    Panel_SelCurso: TPanel;
    JvGradient_Tela01: TJvGradient;
    Label_CodCurso: TLabel;
    Label_Turma: TLabel;
    Label_Termino: TLabel;
    Label_Local1: TLabel;
    Label_TerminoDist: TLabel;
    Label_Local2: TLabel;
    Label_Inicio: TLabel;
    Label_Inicio_dist: TLabel;
    JvShape_Base: TJvShape;
    JvExpressButton_Base: TJvExpressButton;
    ComboBox_Curso: TComboBox;
    ComboBox_Turma: TComboBox;
    DBEdit_Inicio: TDBEdit;
    DBEdit_Termino: TDBEdit;
    DBEdit_Local1: TDBEdit;
    DBEdit_InicioDist: TDBEdit;
    DBEdit_TerminoDist: TDBEdit;
    DBEdit_Local2: TDBEdit;
    JvShape_MostraTurma: TJvShape;
    JvExpressButton_MostraTurma: TJvExpressButton;
    ProgressBar: TProgressBar;
    Label_SemiPresencial: TLabel;
    Label_Presencial: TLabel;

    procedure AlturaPresencial(VI_Top: Integer);

    procedure InserirDisciplinaBase;
    procedure InserirQGABase;
    procedure Inserir_ItensBase;
    procedure Inserir_PTS_NovoBase;

    procedure TratarTurmaSemiPresencial(Status: Boolean; Cor : TColor);
    procedure TrataCurso(VS_Opcao, VS_Tratar: String);
    procedure MontaCurso(PS_Curso: String);

    procedure Monta_ComboTurma_Cadastro;
    procedure Monta_ComboTurma_Selecao;
    procedure DefinirTurma(Cor : TColor; Status: boolean);
    procedure TurmaDefault(VS_Comando: String);

    procedure ComboBox_CursoChange(Sender: TObject);
    procedure ComboBox_TurmaChange(Sender: TObject);
    procedure ComboBox_TurmaKeyPress(Sender: TObject; var Key: Char);
    procedure JvExpressButton_BaseClick(Sender: TObject);
    procedure JvExpressButton_MostraTurmaClick(Sender: TObject);

  private            { Private declarations }
    VS_CodCurso: String;
    VS_MontaCurso, VS_SelTurma, VS_Modalidade, VS_TratarTurmaBase: String;
    MS_Turma: Array[1..1500] of String;

  public             { Public declarations }
     VS_DescCurso: String;
  end;

var
   Frame_SelCurso: TFrame_SelCurso;

implementation

uses Module, MenuPrincipal, Sel_Disciplina, Cad_GQA, Sel_QGA, Sel_ItemProva, Cad_Turma,
  Sel_PTS_Novo;

{$R *.dfm}

procedure TFrame_SelCurso.TrataCurso(VS_Opcao, VS_Tratar: String);
begin
   JvGradient_Tela01.StartColor:= Cor_Tela;

   ProgressBar.Visible:= False;
   DefinirTurma($00F2F2F2, True);

   if VS_Opcao = 'Cadastro' then
   begin
      JvExpressButton_Base.Caption:= '';
      JvExpressButton_Base.Hint:= '';
      VS_SelTurma:= VS_Tratar;
      VS_MontaCurso:= 'Cadastro'
   end
   else
   begin
      JvExpressButton_Base.Caption:= VS_Opcao;
      JvExpressButton_Base.Hint:= VS_Tratar;
      VS_SelTurma:= '';
      VS_TratarTurmaBase:= VS_Opcao;
      if (( VS_Opcao = 'Inserir QGA Base') or ( VS_Opcao = 'Inserir Disciplina Base') or ( VS_Opcao = 'Inserir Itens Prova Base')) then
         VS_MontaCurso:= 'Seleção'
      else
         VS_MontaCurso:= 'Tratar';
   end;

   VS_CodCurso:= '';
   Funcoes_Sue.AlimentaCurso(ComboBox_Curso);

   MontaCurso(Funcoes.GetCodCurso);
end;

//------------------------------------------------------------------------------
// Tratamento do Combox de Selecao de Curso
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.ComboBox_CursoChange(Sender: TObject);
begin
   DM.IBQuery_Executa.Close;
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

         Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select IdCurso, CodCurso, NomeCurso, Numero_Ideal_Itens '+
                                                  'From Curso '+
                                                  ' where codcurso = '+#39+PS_Curso+#39
                             );

         if Trim(DM.IBQuery_Executa.FieldByName('CodCurso').AsString) <> '' then
         begin
            //--- Inicia Montagem da arvore

            ComboBox_Curso.Text:= DM.IBQuery_Executa.FieldByName('CodCurso').AsString;

            Funcoes.SetIdCurso(DM.IBQuery_Executa.FieldByName('IdCurso').AsString);
            Funcoes.SetNumItenIdel(DM.IBQuery_Executa.FieldByName('Numero_Ideal_Itens').AsInteger);

            Funcoes.SetCodCurso(ComboBox_Curso.Text);
            VS_CodCurso:= ComboBox_Curso.Text;
            VS_DescCurso:= DM.IBQuery_Executa.FieldByNAme('NomeCurso').AsString;
            Funcoes.SetIdCurso(DM.IBQuery_Executa.FieldByNAme('IdCurso').AsString);

            if VS_MontaCurso = 'Cadastro' then
               Monta_ComboTurma_Cadastro
            else
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
   VS_IdCurso: String;
begin
   VS_IdCurso:= Funcoes.GetIdCurso;

   //--- Tratamento para selecao da turma para o comboBox quando a selecao for feita na Form Selecao Turma

   if Funcoes.GetCadCurso <> 'MenuPrincipal' then
   begin
      Funcoes.OpenQuery('Select idTurma, turma, Ano, Descricao, Modalidade From Turma where IdCurso = '+VS_IdCurso+' and (Status = '+#39+'A'+#39+' or Status = '+#39+'B'+#39+')');

      if  DM.IBQuery_Executa.FieldByName('IdTurma').AsString = '' then
          Form_MenuPrincipal.MontaTurma(VS_IdCurso, '-1')
       else
          Form_MenuPrincipal.MontaTurma(VS_IdCurso, DM.IBQuery_Executa.FieldByName('IdTurma').AsString);
   end;

   //--- Tratamento da Alimentacao do Combo de selecao da Turma

   Funcoes.OpenQuery('Select idTurma, turma, Ano, Descricao, Modalidade From Turma where IdCurso = '+VS_IdCurso+' and (Status = '+#39+'A'+#39+' or Status = '+#39+'B'+#39+') order by idTurma desc ');

   VI_Indice:= 1;
   Label_Turma.Visible:= True;
   ComboBox_Turma.Visible:= True;

   if VS_MontaCurso = 'Seleção' then
   begin
      ComboBox_Turma.Items.Clear;
      if ((Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString) <> '') and (Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString) <> 'TURMA')) then
      begin
         ComboBox_Turma.Text:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
         MS_Turma[VI_Indice]:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      end
      else
      begin
         if ((DM.IBQuery_Executa.FieldByName('Turma').AsString <> '')) then
         begin
            ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString;
            MS_Turma[VI_Indice]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
         end
         else
         begin
            Label_Turma.Visible:= False;
            ComboBox_Turma.Visible:= False;
            ComboBox_Turma.Text:= '';
            MS_Turma[VI_Indice]:= '-2';
         end;
      end;

      DM.IBQuery_Executa.First;
//      ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString;
      While not DM.IBQuery_Executa.Eof do
      begin
         ComboBox_Turma.Items.Add( DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString);
         VI_Indice:= VI_Indice + 1;
         MS_Turma[VI_Indice]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
         DM.IBQuery_Executa.Next;
      end;
   end
   else
   begin
      if VS_MontaCurso = 'Tratar' then
      begin
         ComboBox_Turma.Items.Clear;
         if ((Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString) <> '') and (Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString) <> 'TURMA')) then
         begin
            ComboBox_Turma.Text:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
            MS_Turma[VI_Indice]:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
         end
         else
         begin
            if ((DM.IBQuery_Executa.FieldByName('Turma').AsString <> '') and (Trim(DM.IBQuery_Executa.FieldByName('Turma').AsString) <> 'TURMA')) then
            begin
               ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString;
               MS_Turma[VI_Indice]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
            end
            else
            begin
               Label_Turma.Visible:= False;
               ComboBox_Turma.Visible:= False;
               ComboBox_Turma.Text:= '';
               MS_Turma[VI_Indice]:= '-2';
            end;
         end;

         DM.IBQuery_Executa.First;
//         ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString;
         While not DM.IBQuery_Executa.Eof do
         begin
            if ((DM.IBQuery_Executa.FieldByName('Turma').AsString <> '') and (Trim(DM.IBQuery_Executa.FieldByName('Turma').AsString) <> 'TURMA')) then
            begin
               ComboBox_Turma.Items.Add( DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString);
               VI_Indice:= VI_Indice + 1;
               MS_Turma[VI_Indice]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
            end;
            DM.IBQuery_Executa.Next;
         end;
      end;
   end;
end;


//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.Monta_ComboTurma_Cadastro;
var
   VI_Indice: Integer;
   VS_IdCurso: String;
begin
   VS_IdCurso:= Funcoes.GetIdCurso;

   //--- Tratamento para selecao da turma para o comboBox quando a selecao for feita na Form Selecao Turma

   VI_Indice:= 1;

   if ((VS_SelTurma = 'Default-in') or (VS_SelTurma = 'Default')) then
   begin
      VS_SelTurma:= 'Default';
       TurmaDefault( 'Select idTurma, turma, Ano, Descricao, Modalidade '+
                         ' From Turma '+
                         ' where IdCurso = '+VS_IdCurso+
                         ' and (Status = '+#39+'A'+#39+' or Status = '+#39+'P'+#39+')'+
                         ' order by Ano desc, Turma '
                       );
   end
   else
   begin
      if VS_SelTurma = 'Em Andamento' then
      begin
          TurmaDefault('Select idTurma, turma, Ano, Descricao, Modalidade '+
                       ' From Turma '+
                       ' where IdCurso = '+VS_IdCurso+
                       ' and Status = '+#39+'A'+#39+
                       ' order by Ano desc, Turma '
                      );
      end
      else
      begin
         if VS_SelTurma = 'Planejados' then
         begin
            TurmaDefault('Select idTurma, turma, Ano, Descricao, Modalidade '+
                          ' From Turma '+
                          ' where IdCurso = '+VS_IdCurso+
                          ' and Status = '+#39+'P'+#39+
                          ' order by Ano desc, Turma '
                        );
         end
         else
         begin
            if VS_SelTurma = 'Executados' then
            begin
                TurmaDefault('Select idTurma, turma, Ano, Descricao, Modalidade '+
                             ' From Turma '+
                             ' where IdCurso = '+VS_IdCurso+
                             ' and Status = '+#39+'E'+#39+
                             ' order by Ano desc, Turma '
                            );
            end
            else
            begin
                if VS_SelTurma = 'Todos' then
                begin
                   TurmaDefault( 'Select idTurma, turma, Ano, Descricao, Modalidade '+
                                ' From Turma '+
                                ' where IdCurso = '+VS_IdCurso+
                                ' and Status <> '+#39+'B'+#39+
                                ' order by Ano desc, Turma '
                               );
               end;
            end;
         end;
      end;
   end;

   ComboBox_Turma.Items.Clear;
   if ((Trim(DM.IBQuery_Executa.FieldByName('Turma').AsString) = '') or (Trim(DM.IBQuery_Executa.FieldByName('Turma').AsString) = 'TURMA')) then
   begin
      ComboBox_Turma.Text:= '';
      MS_Turma[VI_Indice]:= '-2';
   end
   else
   begin
      Label_Turma.Visible:= True;
      ComboBox_Turma.Visible:= True;
      Label_Presencial.Visible:= True;
      Label_Inicio.Visible:= True;
      DBEdit_Inicio.Visible:= True;
      Label_Termino.Visible:= True;
      DBEdit_Termino.Visible:= True;
      Label_Local1.Visible:= True;
      DBEdit_Local1.Visible:= True;

      if DM.IBQuery_MontaTurma.FieldByName('Turma').AsString <> '' then
      begin
         ComboBox_Turma.Text:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
         MS_Turma[VI_Indice]:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
//         ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString;
//         MS_Turma[VI_Indice]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
      end
      else
      begin
         ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString;
         MS_Turma[VI_Indice]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
      end;

      DM.IBQuery_Executa.First;
      While not DM.IBQuery_Executa.Eof do
      begin
         if DM.IBQuery_Executa.FieldByName('Descricao').AsString = '' then
            ComboBox_Turma.Items.Add( DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+VS_DescCurso)
         else
            ComboBox_Turma.Items.Add( DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString);

         VI_Indice:= VI_Indice + 1;
         MS_Turma[VI_Indice]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;

         DM.IBQuery_Executa.Next;
      end;
   end;

end;

//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.TurmaDefault(VS_Comando: String);
begin
   Funcoes.OpenQuery(VS_Comando);
   if DM.IBQuery_Executa.FieldByName('Descricao').AsString = '' then
   begin
      if DM.IBQuery_Executa.FieldByName('Turma').AsString <> '' then
      begin
         ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+VS_DescCurso;
         MS_Turma[1]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
      end
      else
      begin
         ComboBox_Turma.Text:= '';
         MS_Turma[1]:= '-2';
      end;
   end
   else
   begin
      ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString;
      MS_Turma[1]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da turma
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.ComboBox_TurmaChange(Sender: TObject);
var
   VS_IdCurso, VS_Turma: String;
   VI_IdTurma: Integer;
begin
   VS_IdCurso:= Funcoes.GetIdCurso;

   VS_Turma:= Trim(Funcoes.ExtraiAntesDe(ComboBox_Turma.Text, '-'));

   JvExpressButton_Base.Visible:= True;
   JvShape_Base.Visible:= True;

   VI_IdTurma:= ComboBox_Turma.ItemIndex+2;
   if MS_Turma[VI_IdTurma] <> '-2' then
      Form_MenuPrincipal.MontaTurma(VS_IdCurso, MS_Turma[VI_IdTurma])
   else
      Form_MenuPrincipal.MontaTurma(VS_IdCurso, MS_Turma[1]);

   VS_Modalidade:= UpperCase(DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString);

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

   AlturaPresencial(85);

   JvShape_MostraTurma.Visible:= True;
   JvExpressButton_MostraTurma.Visible:= True;

   if ((ComboBox_Turma.Text = '') or (Copy(ComboBox_Turma.Text,1,5) = 'TURMA')) then
   begin
      ComboBox_Turma.Color:= Cor;


      JvShape_MostraTurma.Visible:= False;
      JvExpressButton_MostraTurma.Visible:= False;

      JvShape_Base.Visible:= False;
      JvExpressButton_Base.Visible:= False;

      Label_Turma.Visible:= False;
      ComboBox_Turma.Visible:= False;

      if ((VS_MontaCurso = 'Cadastro') or (Copy(ComboBox_Turma.Text,1,5) = 'TURMA')) then
      begin
         Label_Turma.Visible:= True;
         ComboBox_Turma.Visible:= True;
      end;

      Label_Presencial.Visible:= False;
      Label_Inicio.Visible:= False;
      Label_Termino.Visible:= False;
      Label_Local1.Visible:= False;

      DBEdit_Inicio.Visible:= False;
      DBEdit_Termino.Visible:= False;
      DBEdit_Local1.Visible:= False;

      TratarTurmaSemiPresencial(False, Cor);
   end
   else
   begin      //--- Ajustar de acordo com a apresentacao da turma (Presencial/Semi)
      ComboBox_Turma.Color:= Cor;
      DBEdit_Inicio.Color:= Cor;
      DBEdit_Termino.Color:= Cor;
      DBEdit_Local1.Color:= Cor;
      DBEdit_InicioDist.Color:= Cor;
      DBEdit_TerminoDist.Color:= Cor;
      DBEdit_Local2.Color:= Cor;

      if ((VS_Modalidade = 'PRESENCIAL') or (VS_Modalidade = ''))  then
         TratarTurmaSemiPresencial(False, Cor)
      else
         TratarTurmaSemiPresencial(True, Cor);

      //--- Ajustar de acordo com a selecao da turma

      if ComboBox_Curso.Text = '' then
         VB_Status:= False
      else
         VB_Status:= True;

      ComboBox_Turma.Visible:= VB_Status;
      Label_Turma.Visible:= VB_Status;
      Label_Presencial.Visible:= VB_Status;
      Label_Inicio.Visible:= VB_Status;
      Label_Termino.Visible:= VB_Status;
      Label_Local1.Visible:= VB_Status;

      if Label_SemiPresencial.Visible = True then
         TratarTurmaSemiPresencial(VB_Status, Cor);

      if JvExpressButton_Base.Caption = '' then
         VB_Status:= False
      else
         if Status = True then
            VB_Status:= False
         else
            VB_Status:= True;

      JvShape_Base.Visible:= VB_Status;
      JvExpressButton_Base.Visible:= VB_Status;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da turma semi presencial
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.TratarTurmaSemiPresencial(Status: Boolean; Cor : TColor);
begin
   Label_SemiPresencial.Visible:= Status;
   Label_Inicio_dist.Visible:= Status;
   Label_TerminoDist.Visible:= Status;
   Label_Local2.Visible:= Status;

   DBEdit_InicioDist.Visible:= Status;
   DBEdit_TerminoDist.Visible:= Status;
   DBEdit_Local2.Visible:= Status;

   if Status = False then
      AlturaPresencial(61);
end;

//------------------------------------------------------------------------------
// Tratamento para evitar de digitacao no campo de selecao da turma
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.AlturaPresencial(VI_Top: Integer);
begin
   DBEdit_Inicio.Top:= VI_Top;
   DBEdit_Termino.Top:= VI_Top;
   DBEdit_Local1.Top:= VI_Top;

   Label_Presencial.Top:= VI_Top;
   Label_Inicio.Top:= VI_Top;
   Label_Termino.Top:= VI_Top;
   Label_Local1.Top:= VI_Top;
end;

//------------------------------------------------------------------------------
// Tratamento para evitar de digitacao no campo de selecao da turma
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.ComboBox_TurmaKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= #0;
end;

//------------------------------------------------------------------------------
//
//---- Tratamento para inserir turma Base
//
//------------------------------------------------------------------------------


procedure TFrame_SelCurso.JvExpressButton_BaseClick(Sender: TObject);
begin
   if  VS_TratarTurmaBase = 'Inserir QGA Base' then
       InserirQGABase
   else
      if  VS_TratarTurmaBase = 'Inserir Disciplina Base' then
          InserirDisciplinaBase
      else
         if  VS_TratarTurmaBase =  'Inserir Itens Prova Base' then
            Inserir_ItensBase
         else
            if  VS_TratarTurmaBase =  'Inserir PTS Base' then
               Inserir_PTS_NovoBase;
end;

//------------------------------------------------------------------------------
//  Insere a disciplina Base na Turma selecionada
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.InserirDisciplinaBase;
var
   VI_Retorno, Atualizar: Integer;
   VS_IdCurso: String;
begin
   VS_IdCurso:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
   Atualizar:= 1;
   Funcoes.OpenQuery( 'Select count(1) Qtd '+
                      ' From MateriaCurso '+
                      '  Where IdCurso = '+VS_IdCurso+
                      ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                    );

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
   begin
      VI_Retorno:= Application.MessageBox('Já existe Disciplina(s) inseridas na turma selecionada'+#13+
                                          'Deseja realmente atualizá-la com a Turma Base ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
         Funcoes.ExecusaoQuery( 'Delete From MateriaCurso '+
                                '  Where IdCurso = '+VS_IdCurso+
                                ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                              )
      else
         Atualizar:= 0;
   end;

   if Atualizar = 1 then
   begin
      Funcoes.OpenQuery( 'Select count(1) Qtd From MateriaCurso Where IdCurso = '+VS_IdCurso+' and IdTurma = 0' );
      ProgressBar.Visible:= True;
      ProgressBar.Max:= DM.IBQuery_Executa.FieldByName('Qtd').AsInteger;
      ProgressBar.Position := 0;
      update;

      Funcoes.ExecutaQuery( DM.IBQuery_ExecutaBase, 'Select * From MateriaCurso Where IdCurso = '+VS_IdCurso+' and IdTurma = 0' );

      DM.IBTable_Materia.Open;
      DM.IBQuery_ExecutaBase.First;
      While not DM.IBQuery_ExecutaBase.eof do
      begin
         Funcoes.Grava_Disciplina( VS_IdCurso,
                                   DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('CODMATERIA').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('NOMEMATERIA').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('NUMEROAULASTEORICAS').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('NUMEROAULASPRATICAS').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('FASE').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('PERGUNTACHEFE').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('PERGUNTAALUNO').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('ESPECIALIDADE').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('QTD_OBJETIVOS').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('ATUALIZACAO').AsString,
                                   DM.IBQuery_ExecutaBase.FieldByName('ANO').AsString
                                 );
         DM.IBQuery_ExecutaBase.Next;
         ProgressBar.StepBy(1);
         Update;
      end;
      ProgressBar.Visible:= False;
      update;

      DM.IBTable_Materia.Close;
      Funcoes.AtualizaQuery(Form_Sel_Disciplina.IBQuery_Materia);
   end;
end;

//------------------------------------------------------------------------------
//  Insere o QGA Base na Turma selecionada
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.InserirQGABase;
var
   Sender: TObject;
   VI_Retorno, Atualizar: Integer;
   VS_IdCurso, VS_IdTurma: String;
begin
   VS_IdCurso:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
   VS_IdTurma:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;

   Atualizar:= 1;
   Funcoes.OpenQuery('Select count(1) Qtd From Avaliacao Where IdCurso = '+VS_IdCurso+' and IdTurma = '+VS_IdTurma);

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
   begin
      VI_Retorno:= Application.MessageBox('Já existe QGA inserido na turma selecionada '+#13+
                                          'Deseja realmente atualizá-la com a Turma Base ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         Funcoes.ExecusaoQuery('Delete From Avaliacao Where IdCurso = '+VS_IdCurso+' and IdTurma = '+VS_IdTurma);
         Funcoes.ExecusaoQuery('Delete From Abrangencia_Prova Where IdCurso = '+VS_IdCurso+' and IdTurma = '+VS_IdTurma);
      end
      else
         Atualizar:= 0;
   end;

   if Atualizar = 1 then
   begin
      Funcoes.OpenQuery( 'Select count(1) Qtd From Avaliacao Where IdCurso = '+VS_IdCurso+' and IdTurma = 0');
      ProgressBar.Visible:= True;
      ProgressBar.Max:= DM.IBQuery_Executa.FieldByName('Qtd').AsInteger;
      ProgressBar.Position := 0;
      update;

      Funcoes.ExecutaQuery( DM.IBQuery_ExecutaBase, 'Select * From Avaliacao Where IdCurso = '+VS_IdCurso+' and IdTurma = 0');

      DM.IBTable_Avaliacao.Open;
      DM.IBQuery_ExecutaBase.First;
      While not DM.IBQuery_ExecutaBase.eof do
      begin
         Funcoes.Grava_Avaliacao( DM.IBQuery_ExecutaBase.FieldByName('IDCURSO').AsString,
                                  VS_IdTurma,
                                  DM.IBQuery_ExecutaBase.FieldByName('FASEAPLICACAO').AsString,
                                  DM.IBQuery_ExecutaBase.FieldByName('REFERENCIAAVALIACAO').AsString,
                                  DM.IBQuery_ExecutaBase.FieldByName('CODMATERIA').AsString,
                                  DM.IBQuery_ExecutaBase.FieldByName('MEDIAPARCIAL').AsString,
                                  DM.IBQuery_ExecutaBase.FieldByName('PESOAPLICACAO').AsString,
                                  DM.IBQuery_ExecutaBase.FieldByName('MEDIAMINIMA').AsString,
                                  DM.IBQuery_ExecutaBase.FieldByName('CODPROVA').AsString,
                                  DM.IBQuery_ExecutaBase.FieldByName('PESODISCIPLINA').AsString,
                                  DM.IBQuery_ExecutaBase.FieldByName('MEDIA').AsString,
                                  DM.IBQuery_ExecutaBase.FieldByName('OBSERVACAO').AsString,
                                  DM.IBQuery_ExecutaBase.FieldByName('ORDEM').AsString
                                );
         DM.IBQuery_ExecutaBase.Next;
      end;
      DM.IBTable_Avaliacao.Close;

       //---
      //--- Cadastramento da Abrangencia da Prova

      Funcoes.ExecutaQuery( DM.IBQuery_ExecutaBase, 'Select * From Abrangencia_Prova Where IdCurso = '+VS_IdCurso+' and IdTurma = 0');

      DM.IBTable_Abrangencia.Open;
      DM.IBQuery_ExecutaBase.First;
      While not DM.IBQuery_ExecutaBase.eof do
      begin
         Funcoes.Grava_Abrangencia( DM.IBQuery_ExecutaBase.FieldByName('IDCURSO').AsString,
                                    VS_IdTurma,
                                    DM.IBQuery_ExecutaBase.FieldByName('FASEAPLICACAO').AsString,
                                    DM.IBQuery_ExecutaBase.FieldByName('REFERENCIAAVALIACAO').AsString,
                                    DM.IBQuery_ExecutaBase.FieldByName('CODMATERIA').AsString,
                                    DM.IBQuery_ExecutaBase.FieldByName('MATERIA').AsString
                                  );
         DM.IBQuery_ExecutaBase.Next;
         ProgressBar.StepBy(1);
         Update;
      end;
      ProgressBar.Visible:= False;
      update;
      DM.IBTable_Abrangencia.Close;
   end;
   DM.IBQuery_ExecutaBase.Close;
   Form_Sel_QGA.JvTransparentButton_AtualizaClick(Sender);
end;

//------------------------------------------------------------------------------
//  Insere a Itens Base na Turma selecionada
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.Inserir_ItensBase;
var
   VI_Retorno, Atualizar: Integer;
   VS_Where: String;
begin
   if Funcoes.GetDisciplina = '' then
      VS_Where:= ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
   else
      VS_Where:= ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                 ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                 ' and CodMateria like '+#39+Funcoes.GetDisciplina+'%'+#39;

   Atualizar:= 1;
   Funcoes.OpenQuery( 'Select count(1) Qtd From Item_Prova '+VS_Where );

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
   begin
      VI_Retorno:= Application.MessageBox('Já existe Itens inseridos na turma selecionada'+#13+
                                          'Deseja realmente atualizá-la com a Turma Base ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
         Funcoes.ExecusaoQuery( 'Delete From Item_Prova '+VS_Where )
      else
         Atualizar:= 0;
   end;

   if Atualizar = 1 then
   begin
      if Funcoes.GetDisciplina = '' then
         VS_Where:= ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' and IdTurma = 0 '
      else
         VS_Where:= ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                    ' and IdTurma = 0 '+
                    ' and CodMateria like '+#39+Funcoes.GetDisciplina+'%'+#39;

      Funcoes.ExecutaQuery(DM.IBQuery_ExecutaBase, 'Select IdCurso, IdTurma, NUMITEM, CodMateria, DISCIPLINA, UNIDADE, SUBUNIDADE, OBJETIVO, QUARENTENA, SERIE From Item_Prova '+VS_Where );

      Funcoes.OpenQuery( 'Select count(1) Qtd From Item_Prova '+VS_Where );
      ProgressBar.Visible:= True;
      ProgressBar.Max:= DM.IBQuery_Executa.FieldByName('Qtd').AsInteger;
      ProgressBar.Position := 0;
      update;

      DM.IBTable_Item_Prova.Open;
      DM.IBQuery_ExecutaBase.First;
      While not DM.IBQuery_ExecutaBase.eof do
      begin
         if trim(DM.IBQuery_ExecutaBase.FieldByName('DISCIPLINA').AsString) <> '' then
         begin
            Funcoes.Grava_Item_Prova( DM.IBQuery_ExecutaBase.FieldByName('IDCURSO').AsString,
                                      DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString,
                                      DM.IBQuery_ExecutaBase.FieldByName('NUMITEM').AsString,
                                      DM.IBQuery_ExecutaBase.FieldByName('CODMATERIA').AsString,
                                      DM.IBQuery_ExecutaBase.FieldByName('DISCIPLINA').AsString,
                                      DM.IBQuery_ExecutaBase.FieldByName('UNIDADE').AsString,
                                      DM.IBQuery_ExecutaBase.FieldByName('SUBUNIDADE').AsString,
                                      DM.IBQuery_ExecutaBase.FieldByName('OBJETIVO').AsString,
                                      DM.IBQuery_ExecutaBase.FieldByName('QUARENTENA').AsString,
                                      DM.IBQuery_ExecutaBase.FieldByName('Serie').AsString,
                                      'R'
                                    );

              Funcoes.ExecusaoQuery( ' Update Item_Prova set Status = '+#39+'R'+#39+
                                     ' Where IdCurso = '+DM.IBQuery_ExecutaBase.FieldByName( 'IDCURSO').AsString+
                                     ' and  IdTurma = 0 '+
                                     ' and  NumItem  = '+DM.IBQuery_ExecutaBase.FieldByName('NumItem').AsString
                                   );
         end;
         DM.IBQuery_ExecutaBase.Next;

         ProgressBar.StepBy(1);
         Update;
      end;
      ProgressBar.Visible:= False;
      update;

      DM.IBTable_Item_Prova.Close;
      Funcoes.ExecutaTransacao;
      DM.IBQuery_ExecutaBase.Close;
      Funcoes.AtualizaQuery(Form_Sel_ItemProva.Query_MontaMateria);
      Funcoes.AtualizaQuery(Form_Sel_ItemProva.Query_Item);
   end;

end;


//------------------------------------------------------------------------------
// Modulo de tratamento da inserção do PTS Base no PTS da turma atual
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.Inserir_PTS_NovoBase;
var
   Sender: TObject;
begin
   Form_Sel_PTS_Novo.JvExpressButton_PTSBaseClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento da chamada da turma para consulta
//------------------------------------------------------------------------------

procedure TFrame_SelCurso.JvExpressButton_MostraTurmaClick(Sender: TObject);
begin
   DM.IBTable_Turma.Open;
   Application.CreateForm(TForm_Cad_Turma, Form_Cad_Turma);
   Funcoes.CabecalhoForm( Form_Cad_Turma, 'Consulta Turma');
   Form_Cad_Turma.ShowModal;
   Form_Cad_Turma.Free;
   DM.IBTable_Turma.Close;
end;

end.
