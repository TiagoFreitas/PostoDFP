unit Classe.Bomba;

interface

uses
  Classe, SysUtils;

type
  TBomba = Class(TClasse)
  private
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetTanque(const Value: Integer);
    function GetCodigo: Integer;
    function GetDescricao: string;
    function GetTanque: Integer;
  public
    function GetNomeTabela: string; override;
    function GetCampoChave: string; override;
  published
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
    property Tanque: Integer read GetTanque write SetTanque;
  end;

implementation

{ TBomba }

function TBomba.GetTanque: Integer;
begin
  Result := FieldByName('TANQUE').AsInteger;
end;

function TBomba.GetCampoChave: string;
begin
  Result := 'CODIGO';
end;

function TBomba.GetCodigo: Integer;
begin
  Result := FieldByName('CODIGO').AsInteger;
end;

function TBomba.GetDescricao: string;
begin
  Result := FieldByName('DESCRICAO').AsString;
end;

function TBomba.GetNomeTabela: string;
begin
  Result := 'BOMBA';
end;

procedure TBomba.SetTanque(const Value: Integer);
begin
  FieldByName('TANQUE').AsInteger := Value;
end;

procedure TBomba.SetCodigo(const Value: Integer);
begin
  FieldByName('CODIGO').AsInteger := Value;
end;

procedure TBomba.SetDescricao(const Value: string);
begin
  FieldByName('DESCRICAO').AsString := Value;
end;

end.
