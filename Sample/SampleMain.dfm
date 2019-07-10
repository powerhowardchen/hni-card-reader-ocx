object Form1: TForm1
  Left = 598
  Top = 105
  Caption = 'Form1'
  ClientHeight = 319
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 12
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Read'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 92
    Top = 12
    Width = 477
    Height = 293
    TabOrder = 1
  end
  object PCSCConnector: TPCSCConnector
    AutoConnect = False
    Protocol = pcpT1
    OnError = PCSCConnectorError
    Left = 28
    Top = 52
  end
end
