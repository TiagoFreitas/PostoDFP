unit TestDmPrincipal;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, DmPrincipal, FireDAC.Stan.Error, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Comp.Client, FireDAC.Stan.Async, FireDAC.UI.Intf, FireDAC.Phys, IniFiles,
  FireDAC.Comp.UI, FireDAC.Stan.Option, System.Classes, System.SysUtils,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Def, Forms, FireDAC.Phys.FB, FireDAC.Stan.Pool,
  FireDAC.Phys.Intf;

type
  // Test methods for class TdtmPrincipal

  TestTdtmPrincipal = class(TTestCase)
  strict private
    FdtmPrincipal: TdtmPrincipal;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestConectarBanco;
    procedure TestVerificarBanco;
    procedure TestVerificarIni;
  end;

implementation

procedure TestTdtmPrincipal.SetUp;
begin
  FdtmPrincipal := TdtmPrincipal.Create(nil);
end;

procedure TestTdtmPrincipal.TearDown;
begin
  FreeAndNil(FdtmPrincipal);
end;

procedure TestTdtmPrincipal.TestConectarBanco;
var
  ReturnValue: Boolean;
  APassword: string;
  AUser: string;
  ADataBase: string;
begin
  ReturnValue := FdtmPrincipal.ConectarBanco('C:\DFP\Win32\Debug\DFP.FDB', 'SYSDBA', 'masterkey');

  CheckTrue(ReturnValue);
end;

procedure TestTdtmPrincipal.TestVerificarBanco;
var
  ReturnValue: Boolean;
begin
  ReturnValue := FdtmPrincipal.VerificarBanco;

  CheckTrue(ReturnValue);
end;

procedure TestTdtmPrincipal.TestVerificarIni;
var
  ReturnValue: Boolean;
begin
  ReturnValue := FdtmPrincipal.VerificarIni;

  CheckTrue(ReturnValue);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTdtmPrincipal.Suite);
end.

