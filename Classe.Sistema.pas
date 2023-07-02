unit Classe.Sistema;

interface

uses
  Classe, SysUtils;

type
  TSistema = Class(TClasse)
  private
    procedure SetCodigo(const Value: Integer);
    procedure SetImposto(const Value: Extended);
    procedure SetValorGasolina(const Value: Extended);
    procedure SetValorDiesel(const Value: Extended);

    function GetCodigo: Integer;
    function GetImposto: Extended;
    function GetValorGasolina: Extended;
    function GetValorDiesel: Extended;
  public
    function GetNomeTabela: string; override;
    function GetCampoChave: string; override;
  published
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Imposto: Extended read GetImposto write SetImposto;
    property ValorDiesel: Extended read GetValorDiesel write SetValorDiesel;
    property ValorGasolina: Extended read GetValorGasolina write SetValorGasolina;
  end;

implementation

{ TSistema }

function TSistema.GetCampoChave: string;
begin
  Result := 'CODIGO';
end;

function TSistema.GetCodigo: Integer;
begin
  Result := FieldByName('CODIGO').AsInteger;
end;

function TSistema.GetImposto: Extended;
begin
  Result := FieldByName('IMPOSTO').AsExtended;
end;

function TSistema.GetNomeTabela: string;
begin
  Result := 'SISTEMA';
end;

function TSistema.GetValorDiesel: Extended;
begin
  Result := FieldByName('VALOR_DIESEL').AsExtended;
end;

function TSistema.GetValorGasolina: Extended;
begin
  Result := FieldByName('VALOR_GASOLINA').AsExtended;
end;

procedure TSistema.SetCodigo(const Value: Integer);
begin
  FieldByName('CODIGO').AsInteger := Value;
end;

procedure TSistema.SetImposto(const Value: Extended);
begin
  FieldByName('IMPOSTO').AsExtended := Value;
end;

procedure TSistema.SetValorDiesel(const Value: Extended);
begin
  FieldByName('VALOR_DIESEL').AsExtended := Value;
end;

procedure TSistema.SetValorGasolina(const Value: Extended);
begin
  FieldByName('VALOR_GASOLINA').AsExtended := Value;
end;

end.
