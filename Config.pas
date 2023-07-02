unit Config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TfrmConfig = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    edtdatabase: TEdit;
    edtPassword: TEdit;
    btnTeste: TButton;
    edtUser: TEdit;
    btnOpenFile: TSpeedButton;
    btnConectar: TButton;
    DlgOpen: TOpenDialog;
    procedure btnTesteClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnOpenFileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses DmPrincipal;

procedure TfrmConfig.btnConectarClick(Sender: TObject);
begin
  if DtmPrincipal.ConectarBanco(edtdatabase.Text, edtUser.Text, edtPassword.Text) then
  begin
    DtmPrincipal.GravarIni('Database', edtdatabase.Text);
    DtmPrincipal.GravarIni('User', edtUser.Text);
    DtmPrincipal.GravarIni('Password', edtPassword.Text);

    Close;
  end;
end;

procedure TfrmConfig.btnOpenFileClick(Sender: TObject);
begin
  if DlgOpen.Execute then
    edtdatabase.Text := DlgOpen.FileName;
end;

procedure TfrmConfig.btnTesteClick(Sender: TObject);
begin
  if DtmPrincipal.ConectarBanco(edtdatabase.Text, edtUser.Text, edtPassword.Text) then
      MessageBox(Handle,'Conectado com sucesso!', 'Teste de conexão', MB_ICONINFORMATION);
end;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action    := caFree;
  FrmConfig := nil;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  edtdatabase.Text := DtmPrincipal.LerIni('Database');
  edtUser.Text     := DtmPrincipal.LerIni('User');
  edtPassword.Text := DtmPrincipal.LerIni('Password');
end;

end.
