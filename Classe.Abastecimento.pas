unit Classe.Abastecimento;

interface

uses
  Classe, SysUtils;

type
  TAbastecimento = Class(TClasse)
  private
    procedure SetCodigo(const Value: Integer);
    procedure SetBomba(const Value: Integer);
    procedure SetValor(const Value: Extended);
    procedure SetLitro(const Value: Extended);
    procedure SetImposto(const Value: Extended);
    procedure SetData(const Value: TDateTime);
    function GetCodigo: Integer;
    function GetBomba: Integer;
    function GetValor: Extended;
    function GetLitro: Extended;
    function GetImposto: Extended;
    function GetData: TDateTime;
  public
    function GetNomeTabela: string; override;
    function GetCampoChave: string; override;
  published
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Bomba: Integer read GetBomba write SetBomba;
    property Valor: Extended read GetValor write SetValor;
    property Litro: Extended read GetLitro write SetLitro;
    property Imposto: Extended read GetImposto write SetImposto;
    property Data: TDateTime read GetData write SetData;
  end;

implementation

{ TSistema }

function TAbastecimento.GetBomba: Integer;
begin
  Result := FieldByName('BOMBA').AsInteger;
end;

function TAbastecimento.GetCampoChave: string;
begin
  Result := 'CODIGO';
end;

function TAbastecimento.GetCodigo: Integer;
begin
  Result := FieldByName('CODIGO').AsInteger;
end;

function TAbastecimento.GetData: TDateTime;
begin
  Result := FieldByName('DATA').AsDateTime;
end;

function TAbastecimento.GetImposto: Extended;
begin
  Result := FieldByName('IMPOSTO').AsExtended;
end;

function TAbastecimento.GetLitro: Extended;
begin
  Result := FieldByName('LITRO').AsExtended;
end;

function TAbastecimento.GetNomeTabela: string;
begin
  Result := 'ABASTECIMENTO';
end;

function TAbastecimento.GetValor: Extended;
begin
  Result := FieldByName('VALOR').AsExtended;
end;

procedure TAbastecimento.SetBomba(const Value: Integer);
begin
  FieldByName('BOMBA').AsExtended := Value;
end;

procedure TAbastecimento.SetCodigo(const Value: Integer);
begin
  FieldByName('CODIGO').AsInteger := Value;
end;

procedure TAbastecimento.SetData(const Value: TDateTime);
begin
  FieldByName('DATA').AsDateTime := Value;
end;

procedure TAbastecimento.SetImposto(const Value: Extended);
begin
  FieldByName('IMPOSTO').AsExtended := Value;
end;

procedure TAbastecimento.SetLitro(const Value: Extended);
begin
  FieldByName('LITRO').AsExtended := Value;
end;

procedure TAbastecimento.SetValor(const Value: Extended);
begin
  FieldByName('VALOR').AsExtended := Value;
end;

end.
