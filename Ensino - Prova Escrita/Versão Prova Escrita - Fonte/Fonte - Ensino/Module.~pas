unit Module;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBQuery, IBDatabase, IBCustomDataSet, IBTable, ImgList, Menus;

type
  TDM = class(TDataModule)
    Query_PerfilAcesso: TIBQuery;
    IBQuery_Executa: TIBQuery;
    Query_Usuario: TIBQuery;
    Query_PerfilAcessoIDCODIGO: TIBStringField;
    Query_PerfilAcessoMODULO: TIBStringField;
    Query_PerfilAcessoPOSSUIACESSO: TIBStringField;
    Query_PerfilAcessoINSERIR: TIBStringField;
    Query_PerfilAcessoALTERAR: TIBStringField;
    Query_PerfilAcessoEXCLUIR: TIBStringField;
    Query_PerfilAcessoGRAVAACESSO: TIBStringField;
    IBDatabase_Ensino: TIBDatabase;
    IBTransaction_Ensino: TIBTransaction;
    IBQuery_Cargo: TIBQuery;
    DSQ_Cargo: TDataSource;
    IBTable_Configuracao: TIBTable;
    DST_Configuracao: TDataSource;
    Query_UsuarioIDCODIGO: TIBStringField;
    Query_UsuarioNOME: TIBStringField;
    Query_UsuarioSENHA: TIBStringField;
    Query_UsuarioACESSO: TIBStringField;
    Query_UsuarioSECAO: TIBStringField;
    IBQuery_ExecSql: TIBQuery;
    IBQuery_MontaTurma: TIBQuery;
    DSQ_MontaTurma: TDataSource;
    IBQuery_MontaTurmaIDCURSO: TSmallintField;
    IBQuery_MontaTurmaIDTURMA: TIntegerField;
    IBQuery_MontaTurmaTURMA: TIBStringField;
    IBQuery_MontaTurmaANO: TIBStringField;
    IBQuery_MontaTurmaDATAINICIO: TDateTimeField;
    IBQuery_MontaTurmaDATATERMINO: TDateTimeField;
    IBQuery_MontaTurmaCOORDENADOR: TIBStringField;
    IBQuery_MontaTurmaSTATUS: TIBStringField;
    IBQuery_MontaTurmaDESCRICAO: TIBStringField;
    IBQuery_MontaTurmaCODSALA: TIBStringField;
    DSQ_usuario: TDataSource;
    Query_UsuarioATUALIZACAO: TDateTimeField;
    ImageList_Editor: TImageList;
    IBTable_ConfiguracaoNOME: TIBStringField;
    IBTable_ConfiguracaoSIGLA: TIBStringField;
    IBTable_ConfiguracaoENDERECO: TIBStringField;
    IBTable_ConfiguracaoNUMERO: TIBStringField;
    IBTable_ConfiguracaoBAIRRO: TIBStringField;
    IBTable_ConfiguracaoCIDADE: TIBStringField;
    IBTable_ConfiguracaoESTADO: TIBStringField;
    IBTable_ConfiguracaoCEP: TIBStringField;
    IBTable_ConfiguracaoTELEFONE: TIBStringField;
    IBTable_ConfiguracaoFAX: TIBStringField;
    IBTable_ConfiguracaoEMAIL: TIBStringField;
    IBTable_ConfiguracaoDIVISAO: TIBStringField;
    IBTable_ConfiguracaoSUBDIVISAO: TIBStringField;
    IBTable_Abrangencia: TIBTable;
    IBTable_AbrangenciaIDCURSO: TSmallintField;
    IBTable_AbrangenciaIDTURMA: TIntegerField;
    IBTable_AbrangenciaFASEAPLICACAO: TIBStringField;
    IBTable_AbrangenciaREFERENCIAAVALIACAO: TIBStringField;
    IBTable_AbrangenciaCODMATERIA: TIBStringField;
    IBTable_AbrangenciaMATERIA: TIBStringField;
    IBQuery_Instrutor: TIBQuery;
    IBQuery_InstrutorCODCURSO: TIBStringField;
    IBQuery_InstrutorNOME: TIBStringField;
    IBQuery_InstrutorNOMEGUERRA: TIBStringField;
    IBQuery_InstrutorIDENTIDADE: TIBStringField;
    IBQuery_InstrutorCPF: TIBStringField;
    IBQuery_InstrutorPOSTO: TIBStringField;
    IBQuery_InstrutorSTATUS: TIBStringField;
    IBQuery_InstrutorCTP001: TIBStringField;
    IBQuery_InstrutorCTP006: TIBStringField;
    IBQuery_InstrutorCTP011: TIBStringField;
    IBQuery_InstrutorCPI: TIBStringField;
    IBQuery_InstrutorCTP500: TIBStringField;
    IBQuery_InstrutorLICENCIATURA: TIBStringField;
    IBQuery_InstrutorCG015: TIBStringField;
    IBQuery_InstrutorNENHUM: TIBStringField;
    IBQuery_InstrutorDESCLICENCIATURA: TSmallintField;
    IBQuery_InstrutorIDCURSO: TSmallintField;
    IBQuery_InstrutorIDUNIDADE: TIBStringField;
    IBQuery_InstrutorIDSUBUNIDADE: TIBStringField;
    DSQ_Instrutor: TDataSource;
    IBQuery_ExecutaBase: TIBQuery;
    ImageList_Principal: TImageList;
    IBQuery_MontaTurmaDATAINICIODIST: TDateTimeField;
    IBQuery_MontaTurmaDATATERMINODIST: TDateTimeField;
    IBQuery_MontaTurmaLOCAL1: TIBStringField;
    IBQuery_MontaTurmaLOCAL2: TIBStringField;
    IBQuery_MontaTurmaMODALIDADE: TIBStringField;
    IBTable_Item_Prova: TIBTable;
    IBTable_Item_ProvaIDCURSO: TSmallintField;
    IBTable_Item_ProvaIDTURMA: TIntegerField;
    IBTable_Item_ProvaNUMITEM: TIntegerField;
    IBTable_Item_ProvaCODMATERIA: TIBStringField;
    IBTable_Item_ProvaDISCIPLINA: TIBStringField;
    IBTable_Item_ProvaUNIDADE: TIBStringField;
    IBTable_Item_ProvaSUBUNIDADE: TIBStringField;
    IBTable_Item_ProvaOBJETIVO: TIBStringField;
    IBTable_Item_ProvaQUARENTENA: TDateTimeField;
    IBTable_Item_ProvaSERIE: TIBStringField;
    IBTable_Item_ProvaSTATUS: TIBStringField;
    IBTable_Avaliacao: TIBTable;
    IBTable_AvaliacaoIDCURSO: TSmallintField;
    IBTable_AvaliacaoFASEAPLICACAO: TIBStringField;
    IBTable_AvaliacaoREFERENCIAAVALIACAO: TIBStringField;
    IBTable_AvaliacaoCODMATERIA: TIBStringField;
    IBTable_AvaliacaoMEDIAPARCIAL: TIBStringField;
    IBTable_AvaliacaoPESOAPLICACAO: TSmallintField;
    IBTable_AvaliacaoMEDIAMINIMA: TIBBCDField;
    IBTable_AvaliacaoCODPROVA: TIBStringField;
    IBTable_AvaliacaoPESODISCIPLINA: TSmallintField;
    IBTable_AvaliacaoIDTURMA: TIntegerField;
    IBTable_AvaliacaoMEDIA: TIBStringField;
    IBTable_AvaliacaoOBSERVACAO: TIBStringField;
    IBTable_AvaliacaoORDEM: TIntegerField;
    IBTable_Materia: TIBTable;
    IBTable_MateriaIDCURSO: TSmallintField;
    IBTable_MateriaIDTURMA: TIntegerField;
    IBTable_MateriaCODMATERIA: TIBStringField;
    IBTable_MateriaNOMEMATERIA: TIBStringField;
    IBTable_MateriaNUMEROAULASTEORICAS: TSmallintField;
    IBTable_MateriaNUMEROAULASPRATICAS: TSmallintField;
    IBTable_MateriaFASE: TIBStringField;
    IBTable_MateriaPERGUNTACHEFE: TIBStringField;
    IBTable_MateriaPERGUNTAALUNO: TIBStringField;
    IBTable_MateriaESPECIALIDADE: TIBStringField;
    IBTable_MateriaQTD_OBJETIVOS: TIntegerField;
    IBTable_MateriaATUALIZACAO: TDateTimeField;
    IBTable_MateriaANO: TIBStringField;
    IBTable_Turma: TIBTable;
    IBTable_TurmaIDCURSO: TSmallintField;
    IBTable_TurmaIDTURMA: TIntegerField;
    IBTable_TurmaANO: TIBStringField;
    IBTable_TurmaDATAINICIO: TDateTimeField;
    IBTable_TurmaDATATERMINO: TDateTimeField;
    IBTable_TurmaDATAINICIODIST: TDateTimeField;
    IBTable_TurmaDATATERMINODIST: TDateTimeField;
    IBTable_TurmaCOORDENADOR: TIBStringField;
    IBTable_TurmaSTATUS: TIBStringField;
    IBTable_TurmaCODSALA: TIBStringField;
    IBTable_TurmaTURMA: TIBStringField;
    IBTable_TurmaMODALIDADE: TIBStringField;
    IBTable_TurmaCOD: TIntegerField;
    IBTable_TurmaCERTIFICADO: TIntegerField;
    IBTable_TurmaRADIO: TIBStringField;
    IBTable_TurmaQTDBRASILEIROS: TIntegerField;
    IBTable_TurmaQTDESTRANGEIROS: TIntegerField;
    IBTable_TurmaDURACAO: TIntegerField;
    IBTable_TurmaDESCRICAO: TIBStringField;
    IBTable_TurmaLOCAL1: TIBStringField;
    IBTable_TurmaPARTICIPA_ESTATISTICA: TIBStringField;
    IBTable_TurmaLOCAL2: TIBStringField;
    DST_Turma: TDataSource;
    IBQuery_MontaTurmaQTDBRASILEIROS: TIntegerField;
    IBQuery_MontaTurmaQTDESTRANGEIROS: TIntegerField;
    ImageList_MenuPrincipal: TImageList;
    IBTable_TurmaADMINISTRATIVAS: TIntegerField;
    IBTable_TurmaINSTRUCAO: TIntegerField;
    IBTable_TurmaFLEXIBILIZACAO: TIntegerField;
    IBTable_TurmaAVALIACAO: TIntegerField;

    Function descriptografar (Armazena: String): string;
    procedure SetaServidor(P_Endereco: String);
    procedure DataModuleCreate(Sender: TObject);
  private    { Private declarations }
     arq: TextFile;
     VS_Secao, VS_Linha: String;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Sobre;

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
   VS_EndServidor, VS_ServidorBC: String;
begin
   VS_ServidorBC:= 'BD_Ensino.gdb';

   AssignFile ( arq, P_Endereco );
   Reset ( arq );
   ReadLn ( arq, VS_Linha );
   ReadLn ( arq, VS_Secao );
    CloseFile ( arq );

   VS_EndServidor:= descriptografar (VS_Linha);

   IBDatabase_Ensino.Connected:= False;
   IBDatabase_Ensino.DatabaseName:= VS_EndServidor+VS_ServidorBC;
   Try
      IBDatabase_Ensino.Connected:= True;
      IBTransaction_Ensino.Active:= True;
   except
      MessageDlg('Servidor ('+VS_EndServidor+VS_ServidorBC+') fora do ar, tente novamente ou entre em contato com o Responsável',mtError, [mbOk],0);
      Application.terminate;
   end;

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
