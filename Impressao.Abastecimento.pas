unit Impressao.Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmImpressaoAbastecimento = class(TForm)
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnExibir: TSpeedButton;
    btnImprimir: TSpeedButton;
    lblTitulo: TLabel;
    dtpDataInicial: TDateTimePicker;
    LabelDataInicial: TLabel;
    LabelDataFinal: TLabel;
    dtpDataFinal: TDateTimePicker;
    FDAbastecimento: TFDQuery;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExibirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    function Valida: Boolean;
    function GetSQL: string;
    function Relatorio(ATipo:Integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmImpressaoAbastecimento: TfrmImpressaoAbastecimento;

implementation

{$R *.dfm}

uses Relatorio.Abastecimento, DmPrincipal;

procedure TfrmImpressaoAbastecimento.btnExibirClick(Sender: TObject);
begin
  Relatorio(1);
end;

procedure TfrmImpressaoAbastecimento.btnImprimirClick(Sender: TObject);
begin
  Relatorio(0);
end;

procedure TfrmImpressaoAbastecimento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImpressaoAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action                    := caFree;
  frmImpressaoAbastecimento := nil;
end;

function TfrmImpressaoAbastecimento.GetSQL: string;
begin
  Result := 'SELECT A.BOMBA AS BOMBA, B.DESCRICAO AS BOMBA_DESCRICAO, A.DATA , '+
            'T.CODIGO AS TANQUE, T.DESCRICAO AS TANQUE_DESCRICAO, A.VALOR '+
            'FROM ABASTECIMENTO A '+
            'INNER JOIN BOMBA B ON A.BOMBA = B.CODIGO '+
            'INNER JOIN TANQUE T ON B.TANQUE = T.CODIGO '+
            'WHERE A.DATA BETWEEN '+QuotedStr(FormatDateTime('yyyy-mm-dd 00:00', dtpDataInicial.Date))+
            ' AND '+QuotedStr(FormatDateTime('yyyy-mm-dd 23:59', dtpDataFinal.Date))+
            ' ORDER BY T.CODIGO, A.BOMBA ';
end;

function TfrmImpressaoAbastecimento.Relatorio(ATipo: Integer): Boolean;
begin
  if Valida then
  begin
    FDAbastecimento.SQL.Clear;
    FDAbastecimento.Open(GetSQL);

    if FDAbastecimento.RecordCount > 0 then
    begin
      Application.CreateForm(TfrlAbastecimento,frlAbastecimento);
      try
        frlAbastecimento.dsAbastecimento.DataSet := FDAbastecimento;
        frlAbastecimento.lbFiltro.Caption := 'Data: '+FormatDateTime('dd/mm/yyyy', dtpDataInicial.Date)+
         ' a '+FormatDateTime('dd/mm/yyyy', dtpDataFinal.Date);

        if ATipo = 1 then
          frlAbastecimento.rlAbastecimento.PreviewModal
        else
          frlAbastecimento.rlAbastecimento.Print;
      finally
        FreeAndNil(frlAbastecimento);
      end;
    end
    else
      ShowMessage('Relatório gerado vazio !');
  end;
end;

function TfrmImpressaoAbastecimento.Valida: Boolean;
begin
  Result := False;

  if (dtpDataInicial.Date > dtpDataFinal.Date) then
  begin
    ShowMessage('Data inicial não pode ser maior que a data final.');
    Exit;
  end;

  Result := True;
end;

end.
