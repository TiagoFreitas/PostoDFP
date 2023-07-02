program DFPTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  DmPrincipal in '..\DmPrincipal.pas' {dtmPrincipal: TDataModule},
  TestClasseAbastecimento in 'TestClasseAbastecimento.pas',
  Classe.Abastecimento in '..\Classe.Abastecimento.pas',
  Classe in '..\Classe.pas',
  TestDmPrincipal in 'TestDmPrincipal.pas',
  TestClasseBomba in 'TestClasseBomba.pas',
  Classe.Bomba in '..\Classe.Bomba.pas',
  TestClasseSistema in 'TestClasseSistema.pas',
  Classe.Sistema in '..\Classe.Sistema.pas',
  TestClasseTanque in 'TestClasseTanque.pas',
  Classe.Tanque in '..\Classe.Tanque.pas',
  Principal in '..\Principal.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

