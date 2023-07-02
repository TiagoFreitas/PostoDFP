unit Formulario.Tanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Classe.Tanque;

type
  TfrmTanque = class(TForm)
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnIcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    btnExcluir: TSpeedButton;
    edtCodigo: TEdit;
    lblTitulo: TLabel;
    edtDescricao: TEdit;
    rdgTipo: TRadioGroup;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    FTanque: TTanque;
    procedure LimpaTela;
    procedure HabilitaComponente(AControl: Boolean);
  public
    { Public declarations }
  end;

var
  frmTanque: TfrmTanque;

implementation

{$R *.dfm}

procedure TfrmTanque.btnCancelarClick(Sender: TObject);
begin
  FTanque.Cancel;
  LimpaTela;
  HabilitaComponente(False);
  edtCodigo.Enabled := True;
end;

procedure TfrmTanque.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    FTanque.Delete;
    LimpaTela;
  end;
end;

procedure TfrmTanque.btnGravarClick(Sender: TObject);
begin
  if MessageDlg('Deseja salvar o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    FTanque.Descricao := edtDescricao.Text;
    FTanque.Tipo      := rdgTipo.ItemIndex;
    FTanque.Post;
    HabilitaComponente(False);
    edtCodigo.Enabled := True;
  end;
end;

procedure TfrmTanque.btnIcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja incluir o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    FTanque.Append;
    LimpaTela;
    HabilitaComponente(True);
    edtCodigo.Enabled := False;
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmTanque.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTanque.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if FTanque.Consulta(StrToIntDef(edtCodigo.Text, 0)) then
    begin
      edtDescricao.Text := FTanque.Descricao;
      rdgTipo.ItemIndex := FTanque.Tipo;
    end
    else
    begin
      ShowMessage('Registro nao localizado');
    end;
  end;
end;

procedure TfrmTanque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action    := caFree;
  frmTanque := nil;
end;

procedure TfrmTanque.FormCreate(Sender: TObject);
begin
  FTanque := TTanque.Create;
  LimpaTela;
end;

procedure TfrmTanque.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FTanque);
end;

procedure TfrmTanque.FormShow(Sender: TObject);
begin
  HabilitaComponente(False);
end;

procedure TfrmTanque.HabilitaComponente(AControl: Boolean);
begin
  edtCodigo.Enabled := not AControl;
  edtDescricao.Enabled := AControl;
  rdgTipo.Enabled := AControl;
end;

procedure TfrmTanque.LimpaTela;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
end;

end.
