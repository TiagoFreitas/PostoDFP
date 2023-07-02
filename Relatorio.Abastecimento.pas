unit Relatorio.Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TfrlAbastecimento = class(TForm)
    rlAbastecimento: TRLReport;
    RLBand1: TRLBand;
    lbtitulo: TRLLabel;
    RLLabel2: TRLLabel;
    lbFiltro: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfoLastPage: TRLSystemInfo;
    RLSystemInfo1: TRLSystemInfo;
    lbEmpresa: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLBand4: TRLBand;
    RLDBText2: TRLDBText;
    dsAbastecimento: TDataSource;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand5: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLBand6: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand2: TRLBand;
    RLLabelValorTotalCaption: TRLLabel;
    RLLabel8: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FValorTotal: Extended;
  public
    { Public declarations }
  end;

var
  frlAbastecimento: TfrlAbastecimento;

implementation

{$R *.dfm}

procedure TfrlAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action           := caFree;
  frlAbastecimento := nil;
end;

procedure TfrlAbastecimento.FormCreate(Sender: TObject);
begin
  FValorTotal := 0;
end;

procedure TfrlAbastecimento.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel8.Caption := FormatFloat('0.00', FValorTotal);
end;

procedure TfrlAbastecimento.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  FValorTotal := FValorTotal + dsAbastecimento.DataSet.FieldByName('VALOR').AsExtended;
end;

end.
