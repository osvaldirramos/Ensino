//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Prova Eletronica                               //
//                                                                            //
// PROGRAMA                  : Abertura.PAS                                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade tratar da entrada   //
//                             Sistema.                                       //
//                                                                            //
// INICIO DA ELABORACAO      : 04/11/2005                                     //
// GERENTE                   : TCel Souza Gerente                             //
//                             Osvaldir   Desenvolvedor                       //
//                             Mansano    Colaborador                         //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Abertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, ImgList, Mask, ExtCtrls, Rotinas,
  DB, IBCustomDataSet, IBQuery, IBTable, DBTables, jpeg, JvSpecialLabel,
  JvGradient, JvBlinkingLabel, JvBouncingLabel, JvLabel, JvAngleLabel,
  JvComponent, JvxCtrls, Menus, JvShape, XPMan, JvTransBtn, JvEnterTab, Buttons;

type
  TForm_Abertura = class(TForm)
    JvGradient1: TJvGradient;
    Panel_Cabecalho: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image_Brasao: TImage;
    Label_Versao: TLabel;
    Panel_Informacoes: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    MaskEdit_Senha: TMaskEdit;
    MaskEdit_Nome: TMaskEdit;
    ComboBox_Curso: TComboBox;
    ComboBox_prova: TComboBox;
    ComboBox_Turma: TComboBox;
    StatusBar1: TStatusBar;
    JvShape_VisualizarProva: TJvShape;
    JvTransparentButton_Iniciar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;

    procedure AppMessage(var Msg: TMSG; var HAndled: Boolean);
    Function  Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
    Function TratarAcento(VS_Nome: String): String;

    procedure Abertura(VS_Usuario: String; VS_Senha: String; VS_Acesso: String; PS_CodUsuario: String);
    procedure Usuario_Nao_Encontrado;
    procedure MaskEdit_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_IniciarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox_CursoExit(Sender: TObject);
    procedure ComboBox_TurmaExit(Sender: TObject);

  private    { Private declarations }
    VI_Tentativas: integer;
  public    { Public declarations }
    Fecha_Sistama: Integer;
    VS_IdTurma, VS_IdCurso: String;
  end;

var
  Form_Abertura: TForm_Abertura;

implementation

uses Module, Prova, PedidoRevisaoItem, ConsultaRespostasProva;

{$R *.dfm}


procedure TForm_Abertura.AppMessage(var Msg: TMSG; var HAndled: Boolean);
begin
  Handled := False;
  case Msg.Message of
    WM_SYSKEYDOWN:
      if Msg.wParam = VK_F4 then
      begin
        Handled := True; // Bloqueia o ALT+F4
        ShowMessage('Tecla ALT+F4 foi bloqueada pelo administrador.');
      end;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento da Form Principal
//------------------------------------------------------------------------------

procedure TForm_Abertura.FormActivate(Sender: TObject);
begin
   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Brasao_Ensino.jpg') = True then
      Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Brasao_Ensino.jpg');


   Label_Versao.Caption:= Versao;
   Fecha_Sistama:= 0;
   VS_IdCurso:= '';
   VS_IdTurma:= '';

   //--- Monta a relação de Cursos Ativos

   Funcoes.OpenQuery('Select Distinct tu.IdCurso, tu.CodCurso '+
                     ' From Turmas_View tu, Teste te '+
                     ' Where Status = '+#39+'A'+#39+
                     ' and tu.IdCurso = te.IdCurso '+
                     ' and tu.idTurma = te.IdTurma '+
                     ' and te.Status_Aplicacao is not null '+
//                     ' and (te.Status_Aplicacao is not null and te.Status_Aplicacao <> '+#39+'STANDY BY'+#39+' and te.Status_Aplicacao <> '+#39+'EM PAPEL'+#39+')'+
                     ' and (te.Status_Aplicacao is not null and te.Status_Aplicacao <> '+#39+'ENCERRADA'+#39+' and te.Status_Aplicacao <> '+#39+'FINALIZADA'+#39+' and te.Status_Aplicacao <> '+#39+'STANDY BY'+#39+' and te.Status_Aplicacao <> '+#39+'EM PAPEL'+#39+')'+
                     ' order by tu.CodCurso'
                    );

   ComboBox_Curso.Text:= '';
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_Curso.Items.Add(DM.IBQuery_Executa.FieldByName('CodCurso').AsString);
      DM.IBQuery_Executa.Next;
   end;

   //--- Tratamento para verificar se

   MaskEdit_Nome.Text:= '';
   ComboBox_Curso.SetFocus;
end;

//------------------------------------------------------------------------------
// Sai do Sistema e retorna para o Windows
//------------------------------------------------------------------------------

procedure TForm_Abertura.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Application.Terminate;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar o programa
//------------------------------------------------------------------------------

procedure TForm_Abertura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Continuar
//------------------------------------------------------------------------------

procedure TForm_Abertura.JvTransparentButton_IniciarClick(Sender: TObject);
begin
  if Funcoes.GetDispRede = 'Rede indisponível ' then
  begin
      if Application.MessageBox(PChar('Erro na conexão da rede...'+#13+
                                      'Solicite ao Fiscal da Prova verificar se o cabo de rede esta conectado,'+#13+
                                      'se o cabo estiver conectado solicite para o Fiscal da Prova mudá-lo de maquina..'+
                                      #13+#13+'Deseja verificar novamente a conexão com a rede...'), 'Atenção',
          MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDNo then
         if  Application.MessageBox(PChar(#13+#13+'Deseja fechar o programa nesta maquina...'), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDYes then
             Application.terminate
  end
  else
  begin
     if Busca_Usuario(MaskEdit_Nome.Text, MaskEdit_Senha.Text) = False then
        Usuario_Nao_Encontrado
     else
        Abertura(MaskEdit_Nome.Text, MaskEdit_Senha.Text, '', '');
  end;
end;

//------------------------------------------------------------------------------
// Tratamento de verificacao do usuario e seu acesso
//------------------------------------------------------------------------------

procedure TForm_Abertura.Abertura(VS_Usuario: String; VS_Senha: String; VS_Acesso: String; PS_CodUsuario: String);
begin
   Form_Abertura.Left:= -3001;
   Application.CreateForm(TForm_Prova,Form_Prova);
   Form_Prova.ShowModal;
   Form_Prova.Free;

   if Form_Abertura.Fecha_Sistama = 2 then
   begin
      Application.CreateForm(TForm_PedidoRevisaoItem, Form_PedidoRevisaoItem);
      Form_PedidoRevisaoItem.ShowModal;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando eh pressionado a tecla ENTER no campo nome
//------------------------------------------------------------------------------

procedure TForm_Abertura.MaskEdit_NomeKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      MaskEdit_Senha.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento quando eh pressionado a tecla ENTER no campo senha
//------------------------------------------------------------------------------

procedure TForm_Abertura.MaskEdit_SenhaKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      JvTransparentButton_IniciarClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento quando o usuario não foi encontrado
//------------------------------------------------------------------------------

procedure TForm_Abertura.Usuario_Nao_Encontrado;
begin
   MaskEdit_Nome.Text:= '';
   MaskEdit_Senha.Text:= '';
   VI_Tentativas:= VI_Tentativas + 1;
   if VI_Tentativas > 3 then
      Application.Terminate
   else
      MaskEdit_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Descricao: Verifica se o usuario consta na lista de usuarios
// Data     :
//
// Atualizado em: 12/04/2005
// Descricao    : Auterado as mensagens.
//------------------------------------------------------------------------------

Function TForm_Abertura.Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
Var
   Status: Boolean;
begin
   Status:= False;

   if Trim(ComboBox_Curso.Text) = '' then
   begin
      MessageDlg('NÃO FOI SELECIONADO CURSO, Para logar o sistema necessita selecionar o Curso...',mtError, [mbOk],0);
      ComboBox_Curso.SetFocus;
   end
   else
   begin
      if Trim(ComboBox_Turma.Text) = '' then
      begin
         MessageDlg('NÃO FOI SELECIONADO TURMA, Para logar o sistema necessita selecionar a Turma...',mtError, [mbOk],0);
         ComboBox_Turma.SetFocus;
      end
      else
      begin
         if Trim(ComboBox_prova.Text) = '' then
         begin
            MessageDlg('NÃO FOI SELECIONADO PROVA, Para logar o sistema necessita selecionar a Prova...',mtError, [mbOk],0);
            ComboBox_prova.SetFocus;
         end
         else
         begin
            if Trim(VS_Usuario) = '' then
            begin
               MessageDlg('NOME EM BRANCO, Para logar o sistema o nome do usuário não pode ser branco...',mtError, [mbOk],0);
               MaskEdit_Nome.SetFocus;
            end
            else
            begin
               if Trim(VS_Senha) = '' then
               begin
                  MessageDlg('SENHA EM BRANCO, Para logar o sistema a senha do usuário não pode ser branco...',mtError, [mbOk],0);
                  MaskEdit_Senha.SetFocus;
               end
               else
               begin
{
                                                         ' and   (t.status_aplicacao = '+#39+'ANDAMENTO'+#39+' or t.status_aplicacao = '+#39+'DISCUSSÃO'+#39+' or t.status_aplicacao = '+#39+'APLICAR'+#39+' or t.status_aplicacao = '+#39+'FINALIZADA'+#39+' or t.status_aplicacao = '+#39+'ENCERRADA'+#39+')'+

}
                  Funcoes.ExecutaQuery(DM.Query_Usuario, 'select a.idcurso, a.idturma, t.FaseAplicacao, t.referenciaavaliacao, t.CodProva,t.DataAplicacao, t.CodMateria, t.status_aplicacao,' +
                                                         ' a.Identidade, a.nomeguerra, a.nomeCompleto, a.codigoaluno '+
                                                         ' From aluno_turmas_view a, testes_view t'+
                                                         ' where a.idcurso = t.idcurso '+
                                                         ' and   a.idturma = t.idturma '+
                                                         ' and   t.IdCurso = '+VS_IdCurso+
                                                         ' and   t.idturma = '+VS_Idturma+
                                                         ' and   t.CodProva  = '+#39+ComboBox_prova.Text+#39+
                                                         ' and   (t.status_aplicacao = '+#39+'ANDAMENTO'+#39+' or t.status_aplicacao = '+#39+'DISCUSSÃO'+#39+' or t.status_aplicacao = '+#39+'APLICAR'+#39+')'+
                                                         ' and   a.NomeGuerra = '+#39+TratarAcento(VS_Usuario)+#39
                                      );

                  if DM.Query_Usuario.FieldByName('NomeGuerra').AsString = '' then
                  begin
                     MessageDlg('ALUNO NÃO ENCONTRADO,'+#13+#13+'O Aluno não encontra-se na lista para realizar prova selecionada '+#13+#13+'Favor verificar com o "Fiscal da Prova"...',mtError, [mbOk],0);
                     MaskEdit_Nome.SetFocus;
                  end
                  else
                  begin
                      //---
                     //--- Verifica se o aluno já encerrou a prova

                     Funcoes.OpenQuery( ' Select Status, Senha, ProvaAberta '+
                                        ' From TesteAplicacao '+
                                        ' where IdCurso = '+VS_IdCurso+
                                        ' and IdTurma = '+VS_IdTurma+
                                        ' and faseAplicacao = '+#39+DM.Query_Usuario.FieldByName('FaseAplicacao').AsString+#39+
                                        ' and ReferenciaAvaliacao = '+#39+DM.Query_Usuario.FieldByName('referenciaavaliacao').AsString+#39+
                                        ' and CodMateria = '+#39+DM.Query_Usuario.FieldByName('CodMateria').AsString+#39+
                                        ' and Identidade = '+#39+DM.Query_Usuario.FieldByName('Identidade').AsString+#39
                                       );

                     if ((DM.IBQuery_Executa.FieldByName('Status').AsString = 'Respondendo') and (DM.IBQuery_Executa.FieldByName('ProvaAberta').AsString = 'S')) Then
                     begin
                        MessageDlg('PROVA ABERTA,'+#13+#13+'A prova encontra-se aberta.'+#13+'Para continuar a prova solicite ao "Fiscal da Prova"'+#13+' liberar a prova pressionando o botão "Retornar Prova" .',mtError, [mbOk],0);
                        MaskEdit_Nome.SetFocus;
                     end
                     else
                     begin
                        if DM.IBQuery_Executa.FieldByName('Senha').AsString <> VS_Senha Then
                        begin
                           MessageDlg('SENHA ERRADA,'+#13+#13+'Aluno não possui autorização para realizar a prova...'+#13+#13+'Favor verificar a senha ou fale com o "Fiscal da Prova".',mtError, [mbOk],0);
                           MaskEdit_Nome.SetFocus;
                        end
                        else
                        begin
                           if (( DM.IBQuery_Executa.FieldByName('Status').AsString = 'Interrompido')) then
                           begin
                              MessageDlg('PROVA PARADA,'+#13+#13+'Prova foi interrompida pelo Fiscal da Prova para o Aluno, não sendo mais permitido seu acesso.'+#13+#13+'Verificar junto ao "Fiscal da Prova".',mtError, [mbOk],0);
                              Application.terminate;
                           end
                           else
                           begin
                              if ((DM.IBQuery_Executa.FieldByName('Status').AsString = 'Encerrado') and (DM.Query_Usuario.FieldByName('status_aplicacao').AsString = 'FINALIZADA')  ) then
                              begin
                                 MessageDlg('PROVA FINALIZADA,'+#13+#13+'O Aluno já finalizou sua prova, não sendo mais permitido seu acesso.'+#13+#13+'Aguardar o "Fiscal da Prova" habilitar a Discussão da prova.',mtError, [mbOk],0);
                                 MaskEdit_Nome.SetFocus;
                              end
                              else
                              begin
                                 if ((DM.IBQuery_Executa.FieldByName('Status').AsString = 'Encerrado') and ((DM.Query_Usuario.FieldByName('status_aplicacao').AsString = 'ENCERRADA') or (DM.Query_Usuario.FieldByName('status_aplicacao').AsString = 'ENCERRADA'))) then
                                 begin
                                    Form_ConsultaRespostasProva.ShowModal;
                                 end
                                 else
                                 begin
                                     //---
                                    //--- Verifica se o aluno esta iniciando a prova

                                    if DM.IBQuery_Executa.FieldByName('Status').AsString = 'Iniciar' then
                                        Funcoes.ApagarImagens(Diretorio_Imagens);                          //--- Apaga as imagens geradas da prova anterior

                                     //---
                                    //--- Procura gabarito criado para o aluno

                                   Funcoes.OpenQuery(' Select count(1) as Qtd '+
                                                     ' From RespostaAluno '+
                                                     ' where IdCurso = '+VS_IdCurso+
                                                     ' and IdTurma = '+VS_IdTurma+
                                                     ' and FaseAplicacao = '+#39+DM.Query_Usuario.FieldByName('FaseAplicacao').AsString+#39+
                                                     ' and ReferenciaAvaliacao = '+#39+DM.Query_Usuario.FieldByName('Referenciaavaliacao').AsString+#39+
                                                     ' and CodMateria = '+#39+DM.Query_Usuario.FieldByName('CodMateria').AsString+#39+
                                                     ' and Identidade = '+#39+DM.Query_Usuario.FieldByName('Identidade').AsString+#39
                                                    );

                                    if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then
                                    begin
                                        MessageDlg('PROVA NÃO DISPONIVEL,'+#13+#13+'Não possuí prova criada para aluno '+#13+#13+'Favor verificar junto ao "Fiscal da Prova".',mtError, [mbOk],0);
                                        MaskEdit_Nome.SetFocus;
                                    end
                                    else
                                    begin
                                       Status:= True;
                                    end;
                                 end;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
   Busca_Usuario:= Status;
end;

procedure TForm_Abertura.FormCreate(Sender: TObject);
begin
   Application.OnMessage := AppMessage;
end;

//------------------------------------------------------------------------------
// Tratamento quanto o nome possuir apostrofo
//------------------------------------------------------------------------------

Function TForm_Abertura.TratarAcento(VS_Nome: String): String;
var
   VS_Retorno: String;
   i: Integer;
begin
   VS_Retorno:= '';

   For i:= 1 to length(VS_Nome) do
   begin
      if copy(VS_Nome, i,1) = chr(39) then
        VS_Retorno:= VS_Retorno+chr(39);

      VS_Retorno:= VS_Retorno+copy(VS_Nome, i,1);
   end;
   TratarAcento:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Tratamento para montar a lista de turmas ativas para o curso
//------------------------------------------------------------------------------

procedure TForm_Abertura.ComboBox_CursoExit(Sender: TObject);
begin
   if trim(ComboBox_Curso.Text) <> '' then
   begin
      ComboBox_Turma.Items.Clear;
      Funcoes.OpenQuery('Select IdCurso, IdTurma, Turma '+
                        ' From Turmas_Em_Andamento_View '+
                        ' Where CodCurso = '+#39+ComboBox_Curso.Text+#39+' and Status = '+#39+'A'+#39+' order by Turma');

      VS_IdCurso:= DM.IBQuery_Executa.FieldByName('IdCurso').AsString;

      Funcoes.OpenQuery('select t.idcurso, t.IdTurma, a.Turma '+                 // Query inserida para pegar somente a turma que possuí prova hablitada  - 16/08/2018 15:00 hs
                        ' From testes_view t, turma_em_andamento_view a '+       // atendendo a constatação deste erro por parte do SO Roberto
                        ' Where t.IdCurso = '+VS_IdCurso+
                        ' and   t.idCurso = a.IdCurso '+
                        ' and   t.idturma = a.IdTurma   '+
                        ' and   Status_aplicacao <> '+#39+'ENCERRADA'+#39+
                        ' and   Status_aplicacao <> '+#39+'STANDY BY'+#39);

      DM.IBQuery_Executa.First;
      While not DM.IBQuery_Executa.Eof do
      begin
         ComboBox_Turma.Items.Add(DM.IBQuery_Executa.FieldByName('Turma').AsString);
         DM.IBQuery_Executa.Next;
      end;
     ComboBox_Turma.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para montar a lista de provas ativas para o curso
//------------------------------------------------------------------------------

procedure TForm_Abertura.ComboBox_TurmaExit(Sender: TObject);
begin
   if trim(ComboBox_Turma.Text) <> '' then
   begin
      Funcoes.OpenQuery('select t.idcurso, t.IdTurma '+                          // Query inserida para pegar somente a turma que possuí prova hablitada - 16/08/18  - 15:00 hs
                        ' From testes_view t, turma_em_andamento_view a '+       // atendendo a constatação deste erro por parte do SO Roberto
                        ' Where t.IdCurso = '+VS_IdCurso+
                        ' and   t.IdCurso = '+VS_IdCurso+
                        ' and   t.idCurso = a.IdCurso '+
                        ' and   t.idturma = a.IdTurma '+
                        ' and   a.turma = '+#39+ComboBox_Turma.Text+#39+
                        ' and   Status_aplicacao <> '+#39+'ENCERRADA'+#39+
                        ' and   Status_aplicacao <> '+#39+'STANDY BY'+#39);

      ComboBox_prova.Items.Clear;

      Funcoes.OpenQuery('select idcurso, idturma, CodProva ' +
                        ' From  Testes_view t'+
                        ' where IdCurso = '+DM.IBQuery_Executa.FieldByName('IdCurso').AsString+
                        ' and   idturma  = '+DM.IBQuery_Executa.FieldByName('IdTurma').AsString+
                        ' and (   status_aplicacao = '+#39+'APLICAR'+#39+
                        '      or status_aplicacao = '+#39+'ANDAMENTO'+#39+
                        '      or status_aplicacao = '+#39+'DISCUSSÃO'+#39+
                        '      or status_aplicacao = '+#39+'RECURSO'+#39+
                        '     )'+
                        ' order by CodProva '
                       );

      VS_IdCurso:= DM.IBQuery_Executa.FieldByName('IdCurso').AsString;
      VS_IdTurma:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;

      DM.IBQuery_Executa.First;
      While not DM.IBQuery_Executa.Eof do
      begin
         ComboBox_prova.Items.Add(DM.IBQuery_Executa.FieldByName('CodProva').AsString);
         DM.IBQuery_Executa.Next;
      end;
      ComboBox_prova.SetFocus;
   end;
end;

end.

