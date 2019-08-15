object frmLine: TfrmLine
  Left = 244
  Top = 116
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1089#1090#1088#1086#1082#1091
  ClientHeight = 76
  ClientWidth = 168
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lStr: TLabel
    Left = 8
    Top = 8
    Width = 74
    Height = 13
    Caption = #1057#1090#1088#1086#1082#1072' (1 - %d)'
  end
  object edLine: TEdit
    Left = 8
    Top = 24
    Width = 153
    Height = 21
    TabOrder = 0
    OnKeyPress = edLineKeyPress
  end
  object btnOk: TButton
    Left = 8
    Top = 48
    Width = 75
    Height = 25
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 88
    Top = 48
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
