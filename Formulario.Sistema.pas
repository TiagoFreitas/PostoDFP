unit Formulario.Sistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Classe.Sistema;

type
  TfrmSistema = class(TForm)
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    lblTitulo: TLabel;
    edtImposto: TEdit;
    lblImposto: TLabel;
    lblGasolina: TLabel;
    edtValorGasolina: TEdit;
    edtValorDiesel: TEdit;
    lblDiesel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FSistema: TSistema;
    procedure HabilitaComponente(AControl: Boolean);
  public
    { Public declarations }
  end;

var
  frmSistema: TfrmSistema;

implementation

{$R *.dfm}

procedure TfrmSistema.btnAlterarClick(Sender: TObject);
begin
  if MessageDlg('Deseja alterar o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    FSistema.Edit;
    HabilitaComponente(True);
    edtImposto.SetFocus;
  end;
end;

procedure TfrmSistema.btnCancelarClick(Sender: TObject);
begin
  FSistema.Cancel;
  HabilitaComponente(False);
end;

procedure TfrmSistema.btnGravarClick(Sender: TObject);
begin
  if MessageDlg('Deseja salvar o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    FSistema.Imposto       := StrToFloatDef(edtImposto.Text, 0);
    FSistema.ValorDiesel   := StrToFloatDef(edtValorDiesel.Text, 0);
    FSistema.ValorGasolina := StrToFloatDef(edtValorGasolina.Text, 0);
    FSistema.Post;
    HabilitaComponente(False);
  end;
end;

procedure TfrmSistema.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSistema.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action     := caFree;
  frmSistema := nil;
end;

procedure TfrmSistema.FormCreate(Sender: TObject);
begin
  FSistema := TSistema.Create;
end;

procedure TfrmSistema.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FSistema);
end;

procedure TfrmSistema.FormShow(Sender: TObject);
begin
  edtImposto.Text       := FloatToStr(FSistema.Imposto);
  edtValorDiesel.Text   := FloatToStr(FSistema.ValorDiesel);
  edtValorGasolina.Text := FloatToStr(FSistema.ValorGasolina);

  HabilitaComponente(False);
end;

procedure TfrmSistema.HabilitaComponente(AControl: Boolean);
begin
  edtImposto.Enabled       := AControl;
  edtValorGasolina.Enabled := AControl;
  edtValorDiesel.Enabled   := AControl;
end;

end.
