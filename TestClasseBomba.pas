unit TestClasseBomba;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, SysUtils, Classe.Bomba, Classe;

type
  // Test methods for class TBomba

  TestTBomba = class(TTestCase)
  strict private
    FBomba: TBomba;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestGetNomeTabela;
    procedure TestGetCampoChave;
  end;

implementation

procedure TestTBomba.SetUp;
begin
  FBomba := TBomba.Create;
end;

procedure TestTBomba.TearDown;
begin
  FreeAndNil(FBomba);
end;

procedure TestTBomba.TestGetNomeTabela;
var
  ReturnValue: string;
begin
  ReturnValue := FBomba.GetNomeTabela;

  CheckTrue(SameText(ReturnValue, 'BOMBA'));
end;

procedure TestTBomba.TestGetCampoChave;
var
  ReturnValue: string;
begin
  ReturnValue := FBomba.GetCampoChave;

  CheckTrue(SameText(ReturnValue, 'CODIGO'));
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTBomba.Suite);
end.
