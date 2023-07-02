unit Formulario.Bomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Classe.Bomba;

type
  TfrmBomba = class(TForm)
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnIcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    btnExcluir: TSpeedButton;
    lblTitulo: TLabel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtTanque: TEdit;
    edtTanqueDescricao: TEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtTanqueKeyPress(Sender: TObject; var Key: Char);
  private
    FBomba: TBomba;
    procedure LimpaTela;
    procedure HabilitaComponente(AControl: Boolean);
  public
    { Public declarations }
  end;

var
  frmBomba: TfrmBomba;

implementation

{$R *.dfm}

uses Classe.Tanque;

procedure TfrmBomba.btnCancelarClick(Sender: TObject);
begin
  FBomba.Cancel;
  LimpaTela;
  HabilitaComponente(False);
  edtCodigo.Enabled := True;
end;

procedure TfrmBomba.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    FBomba.Delete;
    LimpaTela;
  end;
end;

procedure TfrmBomba.btnGravarClick(Sender: TObject);
begin
  if MessageDlg('Deseja salvar o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    FBomba.Descricao := edtDescricao.Text;
    FBomba.Tanque    := StrToIntDef(edtTanque.Text, 0);
    FBomba.Post;
    HabilitaComponente(False);
    edtCodigo.Enabled := True;
  end;
end;

procedure TfrmBomba.btnIcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja incluir o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    FBomba.Append;
    LimpaTela;
    HabilitaComponente(True);
    edtCodigo.Enabled := False;
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmBomba.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBomba.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if FBomba.Consulta(StrToIntDef(edtCodigo.Text, 0)) then
    begin
      edtDescricao.Text := FBomba.Descricao;
      edtTanque.Text    := IntToStr(FBomba.Tanque);
      edtTanqueDescricao.Text := TTanque.GetNome(FBomba.Tanque);
    end
    else
    begin
      ShowMessage('Registro nao localizado');
      edtCodigo.Clear;
    end;
  end;
end;

procedure TfrmBomba.edtTanqueKeyPress(Sender: TObject; var Key: Char);
var
  Tanque: TTanque;
begin
  if Key = #13 then
  begin
    Tanque := TTanque.Create;
    try
      if Tanque.Consulta(StrToIntDef(edtTanque.Text, 0)) then
        edtTanqueDescricao.Text := Tanque.Descricao
      else
      begin
        ShowMessage('Registro nao localizado');
        edtTanque.Clear;
      end;
    finally
      FreeAndNil(Tanque);
    end;
  end;
end;

procedure TfrmBomba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action    := caFree;
  frmBomba  := nil;
end;

procedure TfrmBomba.FormCreate(Sender: TObject);
begin
  FBomba := TBomba.Create;
  LimpaTela;
  HabilitaComponente(False);
end;

procedure TfrmBomba.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FBomba);
end;

procedure TfrmBomba.HabilitaComponente(AControl: Boolean);
begin
  edtCodigo.Enabled := not AControl;
  edtDescricao.Enabled := AControl;
  edtTanque.Enabled := AControl;
end;

procedure TfrmBomba.LimpaTela;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtTanque.Clear;
  edtTanqueDescricao.Clear;
end;

end.
