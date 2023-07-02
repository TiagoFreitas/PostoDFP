object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Config'
  ClientHeight = 155
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 8
    Width = 286
    Height = 233
    Caption = '  Conex'#227'o  '
    TabOrder = 0
    object Label3: TLabel
      Left = 25
      Top = 81
      Width = 50
      Height = 13
      Caption = 'DataBase:'
    end
    object Label1: TLabel
      Left = 25
      Top = 57
      Width = 50
      Height = 13
      Caption = 'Password:'
    end
    object Label4: TLabel
      Left = 49
      Top = 33
      Width = 26
      Height = 13
      Caption = 'User:'
    end
    object btnOpenFile: TSpeedButton
      Left = 222
      Top = 72
      Width = 23
      Height = 20
      Caption = ':::'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnOpenFileClick
    end
    object edtdatabase: TEdit
      Left = 81
      Top = 73
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object edtPassword: TEdit
      Left = 81
      Top = 49
      Width = 159
      Height = 21
      TabOrder = 1
    end
    object btnTeste: TButton
      Left = 37
      Top = 103
      Width = 99
      Height = 25
      Caption = 'Teste'
      TabOrder = 3
      OnClick = btnTesteClick
    end
    object edtUser: TEdit
      Left = 81
      Top = 25
      Width = 159
      Height = 21
      TabOrder = 0
    end
    object btnConectar: TButton
      Left = 142
      Top = 103
      Width = 99
      Height = 25
      Caption = 'Conectar'
      ModalResult = 1
      TabOrder = 4
      OnClick = btnConectarClick
    end
  end
  object DlgOpen: TOpenDialog
    Left = 88
    Top = 65528
  end
end
