unit CadNotasPraticas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, ToolWin, ExtCtrls, ImgList, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    StringGrid_Executados: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ImageList1: TImageList;
    Panel6: TPanel;
    SpeedButton_Fechar: TSpeedButton;
    SpeedButton_Gravar: TSpeedButton;
    Panel4: TPanel;
    Label1: TLabel;
    Label_Curso: TLabel;
    Label2: TLabel;
    Label_Turma: TLabel;
    Panel5: TPanel;
    Label3: TLabel;
    Label_CodProva: TLabel;

    Function DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
    Function StrIsFloat(S: string): boolean;
    Function ReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;

    procedure MontarCabecalho;
    procedure AbreArquivo;

    procedure FormActivate(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure SpeedButton_FecharClick(Sender: TObject);
    procedure SpeedButton_GravarClick(Sender: TObject);
    procedure StringGrid_ExecutadosDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  private    { Private declarations }
     VI_Linha: Integer;
     VS_IdCurso, VS_IdTurma, VS_FaseAplicacao, VS_ReferenciaAvaliacao, VS_CodMateria, VS_DataAplicacao, VS_CodProva, nomeDoArquivo: String;
     Identidade: array[1..500] of String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.FormActivate(Sender: TObject);
begin
   MontarCabecalho;
   nomeDoArquivo:= 'Relacao.txt';
   AbreArquivo;
end;

procedure TForm1.MontarCabecalho;
begin
   StringGrid_Executados.Cells[0,0]:= '   GUERRA';
   StringGrid_Executados.Cells[1,0]:= '        NOME COMPLETO';
   StringGrid_Executados.Cells[2,0]:= 'NOTA';
end;

procedure TForm1.AbreArquivo;
   var arq: TextFile;

   Curso, Turma, VS_Identidade, Nome, NomeGuerra, linha: String;
begin
   VI_Linha:= 1;
   AssignFile ( arq, nomeDoArquivo );
   Reset ( arq );
   ReadLn ( arq, linha );
   Label_Curso.Caption:= Copy(linha, 44, 10);
   Label_Turma.Caption:= Copy(linha, 54, 15);

   VS_IdCurso:= Copy(linha, 1, 5);
   VS_IdTurma:= Copy(linha, 6, 5);
   VS_FaseAplicacao:= Copy(linha, 11, 1);
   VS_ReferenciaAvaliacao:= Copy(linha, 12, 3);
   VS_CodMateria:= Copy(linha, 15, 6);
   VS_DataAplicacao:= Copy(linha, 21, 12);
   VS_CodProva:= Copy(linha, 37, 6);
   Label_CodProva.Caption:= VS_CodProva;
   ReadLn ( arq, linha );


   while not Eof ( arq ) do
   begin
      VI_Linha:= VI_Linha+1;
      VS_Identidade:=  Copy(linha, 1, 20);
      Nome:= Copy(linha, 21, 20);
      NomeGuerra:= Copy(linha, 42, 125);
      Identidade[VI_Linha]:= VS_Identidade;
      StringGrid_Executados.Cells[0,VI_Linha]:= Nome;
      StringGrid_Executados.Cells[1,VI_Linha]:= NomeGuerra;
      ReadLn ( arq, linha );
   end;
      VI_Linha:= VI_Linha+1;
      VS_Identidade:=  Copy(linha, 1, 20);
      Nome:= Copy(linha, 21, 20);
      NomeGuerra:= Copy(linha, 42, 125);
      Identidade[VI_Linha]:= VS_Identidade;
      StringGrid_Executados.Cells[0,VI_Linha]:= Nome;
      StringGrid_Executados.Cells[1,VI_Linha]:= NomeGuerra;
      ReadLn ( arq, linha );
   CloseFile ( arq );
end;



procedure TForm1.ToolButton8Click(Sender: TObject);
begin
   Close;
end;

procedure TForm1.SpeedButton_GravarClick(Sender: TObject);
var
   arq: TextFile;
   linha: String;
   i: Integer;
   Nota, Nome, NomeGuerra: String;
begin
   AssignFile ( arq, 'Notas.txt' );
   Rewrite ( arq );


   Linha:=  ReplStr(VS_IdCurso, ' ', 5)+
            ReplStr(VS_IdTurma,  ' ', 5)+
            ReplStr(VS_FaseAplicacao,  ' ', 1)+
            ReplStr(VS_ReferenciaAvaliacao,  ' ', 3)+
            ReplStr(VS_CodMateria,  ' ', 6)+
            ReplStr(VS_DataAplicacao,  ' ', 12)+
            ReplStr(VS_CodProva,  ' ', 6);
   WriteLn ( arq, Linha );

   For i:= 1 to VI_Linha do
   begin
      Linha:= ReplStr(StringGrid_Executados.Cells[2,I], ' ', 5)+
              ReplStr(Identidade[I], ' ', 10)+
              StringGrid_Executados.Cells[0,I]+
              StringGrid_Executados.Cells[1,I];
     WriteLn ( arq, Linha );
   end;
   CloseFile ( arq );
end;

procedure TForm1.SpeedButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Descricao: Replica uma string até atingir o tamanho especificado
// Data     : 01/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function TForm1.ReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Tam: Integer;
begin
  VS_Retorno:= VS_Variavel;
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     VS_Retorno := VS_Retorno + VS_Repl;
     VI_Tam:= VI_Tam + 1;
  end;
  ReplStr:= VS_Retorno;
end;


procedure TForm1.StringGrid_ExecutadosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol = 2 then
  begin
     if ((ARow >= 2) and (ARow <= VI_Linha)) then
     begin
        if ((StringGrid_Executados.Cells[ACol, ARow] <> '') and (Trim(StringGrid_Executados.Cells[ACol, ARow]) <> 'NOTA')) then
        begin
           if StrIsFloat(StringGrid_Executados.Cells[ACol, ARow]) = True then
              StringGrid_Executados.Cells[ACol, ARow]:= FormatFloat( '#0.00', StrToFloat(DePara(StringGrid_Executados.Cells[ACol, ARow], '.', ',')))
           else
              StringGrid_Executados.Cells[ACol, ARow]:=  '';
        end;
     end
     else
     begin
        StringGrid_Executados.Cells[ACol, ARow]:=  '';
     end;
  end;
end;

Function TForm1.StrIsFloat(S: string): boolean;
begin
  try
     s:= DePara(s, '.', ',');

     StrToFloat(S);
     if (StrToFloat(S) > 10) then
     begin
        ShowMessage('A Nota não pode ser maior que 10...');
        Result := false;
     end
     else
        if (StrToFloat(S) < 0) then
        begin
           ShowMessage('A Nota não pode ser Menor que 0...');
           Result := false;
        end
        else
        begin
          Result := true;
        end;
  except
     Result := false;
  end;
end;

//------------------------------------------------------------------------------
// Descricao: Troca o valor da Variavel VS_De para o conteudo da variavel VS_Para
// Data     : 15/03/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function TForm1.DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
var
   VS_Retorno: String;
   VI_Cont: Integer;
begin
   VS_Retorno:= '';
   For VI_Cont:= 1 to Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) = VS_De then
          VS_Retorno:= VS_Retorno+VS_Para
      else
          VS_Retorno:= VS_Retorno+Copy(VS_Valor,VI_Cont,1);
   end;
   DePara:= VS_Retorno;
end;


end.
