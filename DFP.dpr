program DFP;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  DmPrincipal in 'DmPrincipal.pas' {dtmPrincipal: TDataModule},
  Config in 'Config.pas' {frmConfig},
  Formulario.Bomba in 'Formulario.Bomba.pas' {frmBomba},
  Formulario.Tanque in 'Formulario.Tanque.pas' {frmTanque},
  Classe in 'Classe.pas',
  Classe.Tanque in 'Classe.Tanque.pas',
  Classe.Bomba in 'Classe.Bomba.pas',
  Formulario.Sistema in 'Formulario.Sistema.pas' {frmSistema},
  Classe.Sistema in 'Classe.Sistema.pas',
  Classe.Abastecimento in 'Classe.Abastecimento.pas',
  Formulario.Abastecimento in 'Formulario.Abastecimento.pas' {frmAbastecimento},
  Impressao.Abastecimento in 'Impressao.Abastecimento.pas' {frmImpressaoAbastecimento},
  Relatorio.Abastecimento in 'Relatorio.Abastecimento.pas' {frlAbastecimento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
