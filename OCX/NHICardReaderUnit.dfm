object NHICardReader: TNHICardReader
  Left = 192
  Top = 124
  Width = 348
  Height = 107
  Caption = 'NHICardReader'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 348
    Height = 107
    Align = alClient
    Caption = 'NHI Card Reader'
    Color = 16775150
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pcscconMain: TPCSCConnector
    AutoConnect = False
    Protocol = pcpT1
    Left = 16
    Top = 16
  end
end
