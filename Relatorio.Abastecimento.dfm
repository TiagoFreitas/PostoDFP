object frlAbastecimento: TfrlAbastecimento
  Left = 0
  Top = 0
  Caption = 'Relatorio Abastecimento'
  ClientHeight = 653
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rlAbastecimento: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    AdjustableMargins = True
    DataSource = dsAbastecimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 50
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      Color = clWhite
      ParentColor = False
      Transparent = False
      object lbtitulo: TRLLabel
        Left = 279
        Top = 1
        Width = 160
        Height = 14
        Align = faCenterTop
        Alignment = taCenter
        Caption = 'Listagem de Abastecimento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 5
        Top = 32
        Width = 32
        Height = 16
        AutoSize = False
        Caption = 'Filtro:'
        Color = clWhite
        ParentColor = False
        Transparent = False
      end
      object lbFiltro: TRLLabel
        Left = 44
        Top = 32
        Width = 34
        Height = 14
        Color = clWhite
        ParentColor = False
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 622
        Top = 32
        Width = 33
        Height = 14
        Alignment = taRightJustify
        Color = clWhite
        ParentColor = False
        Text = ''
        Transparent = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 659
        Top = 32
        Width = 39
        Height = 16
        Color = clWhite
        Info = itHour
        ParentColor = False
        Text = ''
        Transparent = False
      end
      object RLSystemInfoLastPage: TRLSystemInfo
        Left = 613
        Top = 14
        Width = 99
        Height = 14
        Alignment = taRightJustify
        Color = clWhite
        Info = itLastPageNumber
        Layout = tlCenter
        ParentColor = False
        Text = '/ '
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 580
        Top = 14
        Width = 113
        Height = 14
        Alignment = taRightJustify
        Color = clWhite
        Info = itPageNumber
        Layout = tlCenter
        ParentColor = False
        Text = 'P'#225'gina : '
        Transparent = False
      end
      object lbEmpresa: TRLLabel
        Left = 4
        Top = 14
        Width = 79
        Height = 16
        Caption = 'POSTO DFP'
        Color = clWhite
        ParentColor = False
        Transparent = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 88
      Width = 718
      Height = 89
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      DataFields = 'TANQUE'
      object RLBand3: TRLBand
        Left = 0
        Top = 40
        Width = 718
        Height = 20
        BandType = btColumnHeader
        object RLDBText1: TRLDBText
          Left = 16
          Top = 1
          Width = 57
          Height = 16
          DataField = 'TANQUE'
          DataSource = dsAbastecimento
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 74
          Top = 3
          Width = 140
          Height = 16
          DataField = 'TANQUE_DESCRICAO'
          DataSource = dsAbastecimento
          Text = ''
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 60
        Width = 718
        Height = 20
        BeforePrint = RLBand4BeforePrint
        object RLDBText2: TRLDBText
          Left = 79
          Top = 3
          Width = 52
          Height = 16
          DataField = 'BOMBA'
          DataSource = dsAbastecimento
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 137
          Top = 3
          Width = 135
          Height = 16
          DataField = 'BOMBA_DESCRICAO'
          DataSource = dsAbastecimento
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 291
          Top = 3
          Width = 38
          Height = 16
          DataField = 'DATA'
          DataSource = dsAbastecimento
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 445
          Top = 3
          Width = 48
          Height = 16
          DataField = 'VALOR'
          DataSource = dsAbastecimento
          DisplayMask = '0.00'
          Text = ''
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 20
        BandType = btHeader
        object RLLabel3: TRLLabel
          Left = 16
          Top = 2
          Width = 46
          Height = 16
          Caption = 'Tanque'
          Color = clWhite
          ParentColor = False
          Transparent = False
        end
        object RLLabel4: TRLLabel
          Left = 74
          Top = 2
          Width = 62
          Height = 16
          Caption = 'Descri'#231#227'o'
          Color = clWhite
          ParentColor = False
          Transparent = False
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 20
        Width = 718
        Height = 20
        BandType = btHeader
        object RLLabel1: TRLLabel
          Left = 79
          Top = 2
          Width = 45
          Height = 16
          Caption = 'Bomba'
          Color = clWhite
          ParentColor = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 137
          Top = 2
          Width = 62
          Height = 16
          Caption = 'Descri'#231#227'o'
          Color = clWhite
          ParentColor = False
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 291
          Top = 2
          Width = 31
          Height = 16
          Caption = 'Data'
          Color = clWhite
          ParentColor = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 445
          Top = 2
          Width = 34
          Height = 16
          Caption = 'Valor'
          Color = clWhite
          ParentColor = False
          Transparent = False
        end
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 177
      Width = 718
      Height = 20
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      BeforePrint = RLBand2BeforePrint
      object RLLabelValorTotalCaption: TRLLabel
        Left = 528
        Top = 1
        Width = 78
        Height = 16
        Alignment = taCenter
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 609
        Top = 1
        Width = 78
        Height = 16
        Alignment = taCenter
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object dsAbastecimento: TDataSource
    Left = 376
    Top = 280
  end
end
