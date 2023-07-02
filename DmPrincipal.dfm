object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 196
  Width = 187
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=C:\DFP\Win32\Debug\DFP.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 48
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 88
  end
end
