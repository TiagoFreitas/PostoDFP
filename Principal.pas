unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    MmnPrincipal: TMainMenu;
    Config1: TMenuItem;
    Sobre1: TMenuItem;
    Relatorio1: TMenuItem;
    Config2: TMenuItem;
    Sobre2: TMenuItem;
    StatusBar: TStatusBar;
    anque1: TMenuItem;
    Bomba1: TMenuItem;
    Sistema1: TMenuItem;
    Abastecimento1: TMenuItem;
    procedure Config2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure anque1Click(Sender: TObject);
    procedure Bomba1Click(Sender: TObject);
    procedure Sistema1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Abastecimento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Config, DmPrincipal, Formulario.Tanque, Formulario.Bomba,
  Formulario.Sistema, Formulario.Abastecimento, Impressao.Abastecimento;

procedure TfrmPrincipal.Abastecimento1Click(Sender: TObject);
begin
  if frmImpressaoAbastecimento = nil then
    frmImpressaoAbastecimento := TfrmImpressaoAbastecimento.Create(Application)
  else
    frmImpressaoAbastecimento.Show;
end;

procedure TfrmPrincipal.anque1Click(Sender: TObject);
begin
  if frmTanque = nil then
    frmTanque := TfrmTanque.Create(Application)
  else
    frmTanque.Show;
end;

procedure TfrmPrincipal.Bomba1Click(Sender: TObject);
begin
  if frmBomba = nil then
    frmBomba := TfrmBomba.Create(Application)
  else
    frmBomba.Show;
end;

procedure TfrmPrincipal.Config2Click(Sender: TObject);
begin
  if FrmConfig = nil then
    FrmConfig := TFrmConfig.Create(Application)
  else
    FrmConfig.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  try
    if DtmPrincipal.VerificarBanco then
    begin
      if DtmPrincipal.VerificarIni then
      begin
        DtmPrincipal.ConectarBanco(DtmPrincipal.LerIni('Database'),
                                   DtmPrincipal.LerIni('User'),
                                   DtmPrincipal.LerIni('Password'))
      end
      else
        ShowMessage('Arquivo Config.ini não encontrado');
    end
    else
      ShowMessage('Banco de dados não encontrado!');
  except on E: Exception do
    begin
      Application.Terminate;
    end;
  end;
end;

procedure TfrmPrincipal.Sistema1Click(Sender: TObject);
begin
  if frmSistema = nil then
    frmSistema := TfrmSistema.Create(Application)
  else
    frmSistema.Show;
end;

procedure TfrmPrincipal.Sobre1Click(Sender: TObject);
begin
  if frmAbastecimento = nil then
    frmAbastecimento := TfrmAbastecimento.Create(Application)
  else
    frmAbastecimento.Show;
end;

end.
