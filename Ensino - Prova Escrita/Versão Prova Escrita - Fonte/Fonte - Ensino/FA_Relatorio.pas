unit FA_Relatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls, Rotinas;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Module;

{$R *.dfm}


procedure TForm1.Button2Click(Sender: TObject);
var
   vIn, vOut: OleVariant;
begin
    WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;


procedure TForm1.Button3Click(Sender: TObject);
var
   HTML:TStringList;

   VS_Comando, VS_IdCurso, VS_IdTurma, VS_IdFicha: String;

begin
   HTML := TSTringList.Create;

    //---
   //Pega a Identificacao do Instituto

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, ' Select nome, divisao, subdivisao From configuracao ');

   HTML.Add('<center>');
   HTML.Add('<font size=3>'+DM.IBQuery_Executa.FieldByName('Nome').AsString+'</font><br/>');
   HTML.Add('<font size=3>'+DM.IBQuery_Executa.FieldByName('divisao').AsString+'</font><br/>');
   HTML.Add('<font size=3>'+DM.IBQuery_Executa.FieldByName('subdivisao').AsString+'</font><br/>');
   HTML.Add('<br/>');

   HTML.Add('<font size=3>Extrato do Curso</font><br/>');
   HTML.Add('</center>');

    //---
   //Pega a Identificacao do Curso

   Funcoes.ExecutaQuery( DM.IBQuery_Executa,'Select IdCurso, CodCurso, NomeCurso From Curso where codcurso = '+#39+Funcoes.GetCodCurso+#39 );

   HTML.Add('<hr size='+#39+'1'+#39+'/>');
   HTML.Add('<div><table>');
   HTML.Add('         <tr>');
   HTML.Add('           <td width='+#39+'820'+#39+'style='+#39+'font-size:12px'+#39+'>Nome do curso: <b style='+#39+'font-size:10px'+#39+'>'+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' -  '+DM.IBQuery_Executa.FieldByName('NomeCurso').AsString+' </b></td>');
   HTML.Add('         </tr>');
   HTML.Add('         <tr>');
   HTML.Add('             <td width='+#39+'250'+#39+' style='+#39+'font-size:12px'+#39+'>Turma: <b style='+#39+'font-size:11px'+#39+'>'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' de '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+'</b></td>');
   HTML.Add('         </tr>');
   HTML.Add('            <td width='+#39+'400'+#39+'style='+#39+'font-size:12px'+#39+'>Período: <b style='+#39+'font-size:11px'+#39+'>'+DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString+' a '+DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString+'</b></td>');
  HTML.Add('            <td width='+#39+'270'+#39+' style='+#39+'font-size:12px'+#39+'>Data Avaliação:<b style='+#39+'font-size:11px'+#39+'> $Data[DATAAVALIACAO]'+#39+' </b></td>');
   HTML.Add('          </tr>');
   HTML.Add('        </table>');
   HTML.Add('<div/>');



   HTML.Add('<table border='+#39+'1'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' bgcolor='+#39+'#cccccc'+#39+' bordercolor='+#39+'#FFFFFF'+#39+' >'+
               '<tr> '+
                  '<td width='+#39+'810'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' ><?=$Topicos[DESCRICAO]?></b></div></td>');
   HTML.Add('<td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >Nº</b></div></td>');
   HTML.Add('<td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >1</b></div></td>');
   HTML.Add('<td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >2</b></div></td>');
   HTML.Add('<td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >3</b></div></td>');
   HTML.Add('<td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >4</b></div></td>');
   HTML.Add('<td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >5</b></div></td>');
   HTML.Add('<td width='+#39+'40'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >Nº Obs</b></div></td>');
   HTML.Add('<td width='+#39+'50'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >Média</b></div></td>');

   HTML.SaveToFile('C:\Tmp\TesteWebDelphi.html');
   HTML.Free;

  WebBrowser1.Navigate('file:///C:/TMP/TesteWebDelphi.html')

end;

end.
