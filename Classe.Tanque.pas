unit Classe.Tanque;

interface

uses
  Classe, SysUtils;

type
  TTanque = Class(TClasse)
  private
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetTipo(const Value: Integer);
    function GetCodigo: Integer;
    function GetDescricao: string;
    function GetTipo: Integer;
  public
    function GetNomeTabela: string; override;
    function GetCampoChave: string; override;
    class function GetNome(const ACodigo: Integer): string;
  published
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
    property Tipo : Integer read GetTipo write SetTipo;
  end;

implementation

{ TTanque }

function TTanque.GetCampoChave: string;
begin
  Result := 'CODIGO';
end;

function TTanque.GetCodigo: Integer;
begin
  Result := FieldByName('CODIGO').AsInteger;
end;

class function TTanque.GetNome(const ACodigo: Integer): string;
var
  Tanque: TTanque;
begin
  Tanque := TTanque.Create;
  try
    Tanque.Consulta(ACodigo);
    Result := Tanque.Descricao;
  finally
    FreeAndNil(Tanque);
  end;
end;

function TTanque.GetDescricao: string;
begin
  Result := FieldByName('DESCRICAO').AsString;
end;

function TTanque.GetNomeTabela: string;
begin
  Result := 'TANQUE';
end;

function TTanque.GetTipo: Integer;
begin
  Result := FieldByName('TIPO').AsInteger;
end;

procedure TTanque.SetCodigo(const Value: Integer);
begin
  FieldByName('CODIGO').AsInteger := Value;
end;

procedure TTanque.SetDescricao(const Value: string);
begin
  FieldByName('DESCRICAO').AsString := Value;
end;

procedure TTanque.SetTipo(const Value: Integer);
begin
  FieldByName('TIPO').AsInteger := Value;
end;

end.
