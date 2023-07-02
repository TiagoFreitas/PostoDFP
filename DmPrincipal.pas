unit DmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, Data.DB,
  FireDAC.Comp.Client, Forms, IniFiles, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TdtmPrincipal = class(TDataModule)
    FDConexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    function ConectarBanco(ADataBase, AUser, APassword: string): Boolean;
    function VerificarBanco: Boolean;
    function VerificarIni: Boolean;
    function LerIni(ACampo: String): String;
    procedure GravarIni(ACampo, AValor: string);
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmPrincipal }

function TdtmPrincipal.ConectarBanco(ADataBase, AUser, APassword: string): Boolean;
begin
  Result := False;
  try
    FDConexao.Connected := False;
    FDConexao.Params.Clear;
    FDConexao.LoginPrompt := False;
    FDConexao.DriverName := 'FB';

    FDConexao.Params.Add('DriverID='  + 'FB');
    FDConexao.Params.Add('Database='  + ADataBase);//C:\DFP\DFP.FDB
    FDConexao.Params.Add('User_Name=' + AUser);    //SYSDBA
    FDConexao.Params.Add('Password='  + APassword);//masterkey

    FDConexao.Connected := True;
    Result := True;
  except on E: Exception do
    begin
      raise Exception.Create('Problemas na conexão com o banco de dados! '+E.Message);
    end;
  end;
end;

procedure TdtmPrincipal.GravarIni(ACampo, AValor: string);
var
  Arquivo: TIniFile;
begin
  Arquivo := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Config.ini');
  Arquivo.WriteString('Config', ACampo, AValor);
  Arquivo.Free;
end;

function TdtmPrincipal.LerIni(ACampo: String): String;
var
  Arquivo: TIniFile;
begin
  try
    Arquivo := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Config.ini');
    Result := Arquivo.ReadString('Config', ACampo, EmptyStr);
  finally
    Arquivo.Free;
  end;
end;

function TdtmPrincipal.VerificarBanco: Boolean;
begin
  Result := FileExists(ExtractFileDir(Application.ExeName) + '\DFP.FDB');
end;

function TdtmPrincipal.VerificarIni: Boolean;
begin
  Result := (FileExists(ExtractFileDir(Application.ExeName) + '\Config.ini'));
end;

end.
