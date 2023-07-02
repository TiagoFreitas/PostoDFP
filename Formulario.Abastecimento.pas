unit Formulario.Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Classe.Abastecimento, Vcl.ComCtrls, Classe.Bomba, Classe.Tanque, Classe.Sistema;

type
  TfrmAbastecimento = class(TForm)
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnIcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    lblTitulo: TLabel;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    edtDescricao: TEdit;
    edtValor: TEdit;
    Label1: TLabel;
    edtLitros: TEdit;
    Label2: TLabel;
    edtImposto: TEdit;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
  private
    FAbastecimento: TAbastecimento;
    FBomba: TBomba;
    FTanque: TTanque;
    procedure LimpaTela;
    procedure HabilitaComponente(AControl: Boolean);
  public
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

procedure TfrmAbastecimento.btnCancelarClick(Sender: TObject);
begin
  FAbastecimento.Cancel;
  LimpaTela;
  HabilitaComponente(False);
end;

procedure TfrmAbastecimento.btnGravarClick(Sender: TObject);
var
  Sistema: TSistema;
begin
  if MessageDlg('Deseja salvar o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    Sistema := TSistema.Create;
    try
      FAbastecimento.Bomba   := StrToIntDef(edtCodigo.Text, 0);
      FAbastecimento.Valor   := StrToFloatDef(edtValor.Text, 1);
      FAbastecimento.Imposto := StrToFloatDef(edtValor.Text, 1) * (Sistema.Imposto / 100);
      FAbastecimento.Data    := Now;

      if FTanque.Tipo = 0 then
        FAbastecimento.Litro := FAbastecimento.Valor / Sistema.ValorGasolina
      else
        FAbastecimento.Litro := FAbastecimento.Valor / Sistema.ValorDiesel;

      FAbastecimento.Post;
      HabilitaComponente(False);

      edtLitros.Text  := FloatToStr(FAbastecimento.Litro);
      edtImposto.Text := FloatToStr(FAbastecimento.Imposto);
    finally
      FreeAndNil(Sistema);
    end;
  end;
end;

procedure TfrmAbastecimento.btnIcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja incluir o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    FAbastecimento.Append;
    LimpaTela;
    HabilitaComponente(True);
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmAbastecimento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbastecimento.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if FBomba.Consulta(StrToIntDef(edtCodigo.Text, 0)) then
    begin
      edtDescricao.Text := FBomba.Descricao;
      FTanque.Consulta(FBomba.Tanque);
    end
    else
    begin
      ShowMessage('Registro nao localizado');
      edtCodigo.Clear;
    end;
  end;
end;

procedure TfrmAbastecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action    := caFree;
  frmAbastecimento  := nil;
end;

procedure TfrmAbastecimento.FormCreate(Sender: TObject);
begin
  FAbastecimento := TAbastecimento.Create;
  FTanque := TTanque.Create;
  FBomba := TBomba.Create;
  LimpaTela;
  HabilitaComponente(False);
end;

procedure TfrmAbastecimento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FAbastecimento);
  FreeAndNil(FTanque);
  FreeAndNil(FBomba);
end;

procedure TfrmAbastecimento.HabilitaComponente(AControl: Boolean);
begin
  edtCodigo.Enabled := AControl;
  edtValor.Enabled := AControl;
end;

procedure TfrmAbastecimento.LimpaTela;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtValor.Clear;
  edtLitros.Clear;
  edtImposto.Clear;
end;

end.
