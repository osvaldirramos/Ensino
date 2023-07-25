unit Module;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBQuery, IBDatabase, IBCustomDataSet, IBTable, ImgList, Menus;

type
  TDM = class(TDataModule)
    IBQuery_Usuario: TIBQuery;
    IBDatabase_Ensino: TIBDatabase;
    IBTransaction_Ensino: TIBTransaction;
    IBQuery_UsuarioIDCODIGO: TIBStringField;
    IBQuery_UsuarioNOME: TIBStringField;
    IBQuery_UsuarioSENHA: TIBStringField;
    IBQuery_UsuarioSECAO: TIBStringField;
    IBQuery_ExecSql: TIBQuery;
    ImageList_Ensino: TImageList;
    IBQuery_MontaTurma: TIBQuery;
    DSQ_MontaTurma: TDataSource;
    DSQ_usuario: TDataSource;
    IBQuery_ExecutaEnsino: TIBQuery;
    IBQuery_Login_Instrutor: TIBQuery;
    DSQ_Login_Instrutor: TDataSource;
    IBQuery_Login_InstrutorIDCURSO: TSmallintField;
    IBQuery_Login_InstrutorIDTURMA: TIntegerField;
    IBQuery_Login_InstrutorNOME: TIBStringField;
    IBQuery_Login_InstrutorNOMEGUERRA: TIBStringField;
    IBQuery_Login_InstrutorIDENTIDADE: TIBStringField;
    IBQuery_Login_InstrutorFUNCAO: TIBStringField;
    IBQuery_Login_InstrutorSENHA: TIBStringField;
    IBDatabase_Paels: TIBDatabase;
    IBTransaction_Paels: TIBTransaction;
    IBQuery_ExecutaProsima: TIBQuery;
    IBQuery_OpenProsima: TIBQuery;
    IBQuery_AlunoTurma: TIBQuery;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaNUMORDEM: TSmallintField;
    IBQuery_AlunoTurmaNOME: TIBStringField;
    IBQuery_AlunoTurmaNOMECOMPLETO: TIBStringField;
    IBQuery_AlunoTurmaNOMEGUERRA: TIBStringField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    IBQuery_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBQuery_AlunoTurmaSEXO: TIBStringField;
    IBQuery_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBQuery_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBQuery_AlunoTurmaULTIMAPROMOCAO: TDateTimeField;
    IBQuery_AlunoTurmaIDUNIDADE: TIBStringField;
    IBQuery_AlunoTurmaIDSUBUNIDADE: TIBStringField;
    IBQuery_AlunoTurmaSARAM: TIBStringField;
    IBQuery_AlunoTurmaDATAMATRICULA: TDateTimeField;
    IBQuery_AlunoTurmaDATADESLIGAMENTO: TDateTimeField;
    IBQuery_AlunoTurmaCPF: TIBStringField;
    IBQuery_InstrutorTurma: TIBQuery;
    IBQuery_InstrutorTurmaIDCURSO: TSmallintField;
    IBQuery_InstrutorTurmaIDTURMA: TIntegerField;
    IBQuery_InstrutorTurmaCODIGOINSTRUTOR: TIntegerField;
    IBQuery_InstrutorTurmaNOME: TIBStringField;
    IBQuery_InstrutorTurmaNOMEGUERRA: TIBStringField;
    IBQuery_InstrutorTurmaNOMECOMPLETO: TIBStringField;
    IBQuery_InstrutorTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_InstrutorTurmaIDENTIDADE: TIBStringField;
    IBQuery_InstrutorTurmaIDUNIDADE: TIBStringField;
    IBQuery_InstrutorTurmaIDSUBUNIDADE: TIBStringField;
    IBQuery_InstrutorTurmaFUNCAO: TIBStringField;
    IBQuery_InstrutorTurmaDATACHEGADA: TDateTimeField;
    IBQuery_InstrutorTurmaDATASAIDA: TDateTimeField;
    IBQuery_InstrutorTurmaAPRESENTACAO: TDateTimeField;
    IBQuery_InstrutorTurmaFICHA: TIBStringField;
    IBQuery_InstrutorTurmaSARAM: TIBStringField;
    DSQ_InstrutorTurma: TDataSource;
    DSQ_AlunoTurma: TDataSource;
    IBQuery_CadFichaAvl: TIBQuery;
    DSQ_Cad_FichaAvl: TDataSource;
    IBTable_Aluno: TIBTable;
    IBTable_AlunoIDCURSO: TSmallintField;
    IBTable_AlunoIDTURMA: TIntegerField;
    IBTable_AlunoIDENTIDADE: TIBStringField;
    IBTable_AlunoNOMECOMPLETO: TIBStringField;
    IBTable_AlunoIDUNIDADE: TIBStringField;
    IBTable_AlunoIDSUBUNIDADE: TIBStringField;
    IBTable_AlunoESTAGIARIO: TIBStringField;
    DST_AlunoTurma: TDataSource;
    IBTable_Cad_FichaAvl: TIBTable;
    IBTable_Cad_FichaAvlIDCURSO: TSmallintField;
    IBTable_Cad_FichaAvlIDTURMA: TIntegerField;
    IBTable_Cad_FichaAvlID_FICHA: TIntegerField;
    IBTable_Cad_FichaAvlID_ATCO: TIBStringField;
    IBTable_Cad_FichaAvlID_EXERCICIO: TIntegerField;
    IBTable_Cad_FichaAvlDATA_AVL: TDateTimeField;
    IBTable_Cad_FichaAvlLOCAL: TIBStringField;
    IBTable_Cad_FichaAvlMEDIA: TIBBCDField;
    IBTable_Cad_FichaAvlPARECER: TBlobField;
    IBTable_Cad_FichaAvlNS: TIBStringField;
    IBTable_Cad_FichaAvlID_INSTRUTOR: TIBStringField;
    IBTable_Cad_FichaAvlFICHACOMPLETA: TIBStringField;
    DST_Cad_FichaAvl: TDataSource;
    IBQuery_PR_Avaliacao: TIBQuery;
    DSQ_PR_Avaliacao: TDataSource;
    IBTable_PR_Avaliacao: TIBTable;
    DST_Cad_Avaliacao: TDataSource;
    IBTable_Cad_FichaAvlSETOR: TIBStringField;
    IBTable_Cad_FichaAvlHORARIO_INICIO: TIBStringField;
    IBTable_Cad_FichaAvlNOMEALUNO: TIBStringField;
    IBTable_Cad_FichaAvlNOMEINSTRUTOR: TIBStringField;
    IBTable_PR_AvaliacaoIDCURSO: TSmallintField;
    IBTable_PR_AvaliacaoIDTURMA: TIntegerField;
    IBTable_PR_AvaliacaoID_FICHA: TIntegerField;
    IBTable_PR_AvaliacaoID_ATCO: TIBStringField;
    IBTable_PR_AvaliacaoID_INSTRUTOR: TIBStringField;
    IBTable_PR_AvaliacaoID_EXERCICIO: TIntegerField;
    IBTable_PR_AvaliacaoID_ITEM: TIBStringField;
    IBTable_PR_AvaliacaoOTIMO: TIBStringField;
    IBTable_PR_AvaliacaoBOM: TIBStringField;
    IBTable_PR_AvaliacaoREGULAR: TIBStringField;
    IBTable_PR_AvaliacaoNS: TIBStringField;
    IBTable_PR_AvaliacaoNA: TIBStringField;
    IBTable_PR_AvaliacaoAREA_AVALIACAO: TIBStringField;
    IBTable_PR_AvaliacaoDESCRICAO: TIBStringField;
    IBQuery_PR_AvaliacaoIDCURSO: TSmallintField;
    IBQuery_PR_AvaliacaoIDTURMA: TIntegerField;
    IBQuery_PR_AvaliacaoID_FICHA: TIntegerField;
    IBQuery_PR_AvaliacaoID_ATCO: TIBStringField;
    IBQuery_PR_AvaliacaoID_INSTRUTOR: TIBStringField;
    IBQuery_PR_AvaliacaoID_EXERCICIO: TIntegerField;
    IBQuery_PR_AvaliacaoID_ITEM: TIBStringField;
    IBQuery_PR_AvaliacaoOTIMO: TIBStringField;
    IBQuery_PR_AvaliacaoBOM: TIBStringField;
    IBQuery_PR_AvaliacaoREGULAR: TIBStringField;
    IBQuery_PR_AvaliacaoNA: TIBStringField;
    IBQuery_PR_AvaliacaoNS: TIBStringField;
    IBQuery_PR_AvaliacaoAREA_AVALIACAO: TIBStringField;
    IBQuery_PR_AvaliacaoDESCRICAO: TIBStringField;
    IBTable_Rel_NS: TIBTable;
    IBTable_Rel_NSIDCURSO: TSmallintField;
    IBTable_Rel_NSIDTURMA: TIntegerField;
    IBTable_Rel_NSID_FICHA: TIntegerField;
    IBTable_Rel_NSID_ATCO: TIBStringField;
    IBTable_Rel_NSID_INSTRUTOR: TIBStringField;
    IBTable_Rel_NSID_EXERCICIO: TIntegerField;
    IBTable_Rel_NSDESCRICAO: TIBStringField;
    IBQuery_Ficha_Item_View: TIBQuery;
    IBQuery_Ficha_Item_ViewID_FICHA: TIntegerField;
    IBQuery_Ficha_Item_ViewID_ITEM: TIBStringField;
    IBQuery_Ficha_Item_ViewID_AVL: TIntegerField;
    IBQuery_Ficha_Item_ViewAREA_AVALIACAO: TIBStringField;
    IBQuery_Ficha_Item_ViewDESCRICAO: TIBStringField;
    DSQ_Ficha_Item_View: TDataSource;
    IBTable_PR_AvaliacaoID_AVL: TIntegerField;
    IBQuery_PR_AvaliacaoID_AVL: TIntegerField;
    IBQuery_CadFichaAvlIDCURSO: TSmallintField;
    IBQuery_CadFichaAvlIDTURMA: TIntegerField;
    IBQuery_CadFichaAvlID_FICHA: TIntegerField;
    IBQuery_CadFichaAvlID_ATCO: TIBStringField;
    IBQuery_CadFichaAvlID_EXERCICIO: TIntegerField;
    IBQuery_CadFichaAvlID_INSTRUTOR: TIBStringField;
    IBQuery_CadFichaAvlNOMEINSTRUTOR: TIBStringField;
    IBQuery_CadFichaAvlDATA_AVL: TDateTimeField;
    IBQuery_CadFichaAvlFICHACOMPLETA: TIBStringField;
    IBQuery_CadFichaAvlLOCAL: TIBStringField;
    IBQuery_CadFichaAvlMEDIA: TIBBCDField;
    IBQuery_CadFichaAvlNOMEALUNO: TIBStringField;
    IBQuery_CadFichaAvlNS: TIBStringField;
    IBQuery_CadFichaAvlPARECER: TBlobField;
    IBQuery_CadFichaAvlSETOR: TIBStringField;
    IBQuery_CadFichaAvlHORARIO_INICIO: TIBStringField;
    IBQuery_MontaTurmaIDCURSO: TSmallintField;
    IBQuery_MontaTurmaIDTURMA: TIntegerField;
    IBQuery_MontaTurmaTURMA: TIBStringField;
    IBQuery_MontaTurmaCODCURSO: TIBStringField;
    IBQuery_MontaTurmaANO: TIBStringField;
    IBQuery_MontaTurmaDATAINICIO: TDateTimeField;
    IBQuery_MontaTurmaDATATERMINO: TDateTimeField;
    IBQuery_MontaTurmaCOORDENADOR: TIBStringField;
    IBQuery_MontaTurmaSTATUS: TIBStringField;
    IBQuery_MontaTurmaDESCRICAO: TIBStringField;
    IBTable_PR_AvaliacaoSETOR: TIBStringField;
    IBQuery_PR_AvaliacaoSETOR: TIBStringField;
    IBTable_Rel_NSSETOR: TIBStringField;
    IBQuery_Resultado_FichaAluno: TIBQuery;
    IBQuery_Resultado_FichaAlunoIDCURSO: TSmallintField;
    IBQuery_Resultado_FichaAlunoIDTURMA: TIntegerField;
    IBQuery_Resultado_FichaAlunoID_FICHA: TIntegerField;
    IBQuery_Resultado_FichaAlunoID_ATCO: TIBStringField;
    IBQuery_Resultado_FichaAlunoID_EXERCICIO: TIntegerField;
    IBQuery_Resultado_FichaAlunoMEDIA: TIBBCDField;
    IBQuery_Resultado_FichaAlunoSETOR: TIBStringField;
    IBTable_ResultadoFichaAvl: TIBTable;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IBStringField1: TIBStringField;
    IntegerField3: TIntegerField;
    IBStringField2: TIBStringField;
    DateTimeField1: TDateTimeField;
    IBStringField3: TIBStringField;
    IBBCDField1: TIBBCDField;
    BlobField1: TBlobField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBQuery_CadFichaAvlEXERCICIO: TIBStringField;
    IBTable_Cad_FichaAvlEXERCICIO: TIBStringField;
    IBQuery_Resultado_FichaAlunoHORARIO_INICIO: TIBStringField;
    IBTable_pessoaAluno: TIBTable;
    IBTable_PessoaInstrutor: TIBTable;
    IBTable_pessoaAlunoIDENTIDADE: TIBStringField;
    IBTable_pessoaAlunoNOME: TIBStringField;
    IBTable_pessoaAlunoNOMEGUERRA: TIBStringField;
    IBTable_PessoaInstrutorIDENTIDADE: TIBStringField;
    IBTable_PessoaInstrutorNOME: TIBStringField;
    IBTable_PessoaInstrutorNOMEGUERRA: TIBStringField;
    IBTable_PessoaInstrutorPOSTOGRADUACAO: TIBStringField;

    Function descriptografar (Armazena: String): string;
    procedure SetaServidor(P_Endereco: String);
    procedure DataModuleCreate(Sender: TObject);
  private    { Private declarations }
     arq: TextFile;
     VS_Secao, VS_Linha: String;
  public    { Public declarations }

  end;

var
  DM: TDM;

implementation

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento quando o DataModule esta sendo criado
//------------------------------------------------------------------------------

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   if FileExists('C:\DataBase_ICEA\Ensino\servidor.cnf') = True then
   begin
      SetaServidor('C:\DataBase_ICEA\Ensino\servidor.cnf');
   end
   else
   begin
      if FileExists('servidor.cnf') = True then
      begin
         SetaServidor('servidor.cnf');
      end
      else
      begin
         MessageDlg('O arquivo "Servidor.cnf" não foi encontrado na pasta "C:\DataBase_ICEA\Ensino" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
         Application.terminate;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para setar o Servidor
//------------------------------------------------------------------------------

procedure TDM.SetaServidor(P_Endereco: String);
var
   VS_EndServidor, VS_ServidorBC, VS_ServidorProsima: String;
begin
    VS_ServidorBC:= 'BD_Ensino.gdb';
    VS_ServidorProsima:= 'BD_Paels.gdb';
    AssignFile ( arq, P_Endereco );
    Reset ( arq );
    ReadLn ( arq, VS_Linha );
    ReadLn ( arq, VS_Secao );
    CloseFile ( arq );

    VS_EndServidor:= descriptografar (VS_Linha);
//    Funcoes.
    IBDatabase_Ensino.Connected:= False;
    IBDatabase_Ensino.DatabaseName:= VS_EndServidor+VS_ServidorBC;
    IBDatabase_Ensino.Connected:= True;

//    IBTransaction_Ensino.Active:= True;

    IBDatabase_Paels.Connected:= False;
    IBDatabase_Paels.DatabaseName:= VS_EndServidor+VS_ServidorProsima;
    IBDatabase_Paels.Connected:= True;

    IBTransaction_Paels.Active:= True;
end;

//------------------------------------------------------------------------------
// Descricao: Descriptografa uma variavel fornecida
//
// Data     :
//
// Atualizado em: 15/08/2005
//------------------------------------------------------------------------------

Function TDM.descriptografar (Armazena: String): string;
var
    Resultado: string;
    Temp: char;
    CodIndex,Cont: integer;
begin
   Resultado:= '';

   for Cont := 1 to length(Armazena) do
   begin
      if ((copy(Armazena, Cont, 1) = 'V') or (copy(Armazena, Cont, 1) = 'W')  or
          (copy(Armazena, Cont, 1) = 'X') or (copy(Armazena, Cont, 1) = 'Y')  or
          (copy(Armazena, Cont, 1) = 'Z')) then
      begin
         Resultado:= Resultado + copy(Armazena, Cont, 1);
      end
      else
      begin
         for CodIndex := 1 to 2 do
         begin
            Temp:= Pred(Armazena[cont]);
            Armazena[cont]:= Temp;
         end;
         Resultado:= Resultado + Temp;
      end;
   end;
   descriptografar:= Resultado;
end;
end.
