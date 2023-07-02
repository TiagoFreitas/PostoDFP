object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Posto DFP'
  ClientHeight = 438
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MmnPrincipal
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 416
    Width = 558
    Height = 22
    Panels = <
      item
        Width = 50
      end>
  end
  object MmnPrincipal: TMainMenu
    Left = 48
    Top = 56
    object Config1: TMenuItem
      Caption = 'Cadastro'
      object anque1: TMenuItem
        Caption = 'Tanque'
        OnClick = anque1Click
      end
      object Bomba1: TMenuItem
        Caption = 'Bomba'
        OnClick = Bomba1Click
      end
      object Sistema1: TMenuItem
        Caption = 'Sistema'
        OnClick = Sistema1Click
      end
    end
    object Sobre1: TMenuItem
      Caption = 'Abastecer'
      OnClick = Sobre1Click
    end
    object Relatorio1: TMenuItem
      Caption = 'Relatorio'
      object Abastecimento1: TMenuItem
        Caption = 'Abastecimento'
        OnClick = Abastecimento1Click
      end
    end
    object Config2: TMenuItem
      Caption = 'Config'
      OnClick = Config2Click
    end
    object Sobre2: TMenuItem
      Caption = 'Sobre'
    end
  end
end
