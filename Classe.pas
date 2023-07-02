unit Classe;

interface

uses
  FireDAC.Comp.Client, SysUtils, FireDAC.FMXUI.Wait, Firedac.DApt;

type
  TClasse = class(TFDQuery)
  private
  Public
    constructor Create;
    function GetNomeTabela: string; virtual; abstract;
    function GetCampoChave: string; virtual; abstract;
    function Consulta: Boolean; overload;
    function Consulta(AID: Integer): Boolean; overload;
    function Consulta(ASQL: string): Boolean; overload;
  end;

implementation

{ TClasse }

uses DmPrincipal;

function TClasse.Consulta(AID: Integer): Boolean;
begin
  Result := Consulta('SELECT * FROM '+GetNomeTabela+' WHERE '+GetCampoChave+' = '+IntToStr(AID));
end;

function TClasse.Consulta: Boolean;
begin
  Result := Consulta('SELECT * FROM '+GetNomeTabela);
end;

function TClasse.Consulta(ASQL: string): Boolean;
begin
  Close;
  SQL.Clear;
  SQL.Text := ASQL;
  Open;
  Result := not IsEmpty;
end;

constructor TClasse.Create;
begin
  inherited Create(nil);
  {$IFDEF _CONSOLE_TESTRUNNER}
  {$ELSE}
  Connection := DtmPrincipal.FDConexao;
  Consulta;
  Last;
  {$ENDIF}
end;

end.
