object frmWait: TfrmWait
  Left = 600
  Top = 262
  BorderStyle = bsNone
  Caption = #1054#1078#1080#1076#1072#1081#1090#1077
  ClientHeight = 69
  ClientWidth = 286
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lMessage: TLabel
    Left = 5
    Top = 5
    Width = 215
    Height = 40
    Alignment = taCenter
    Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072' '#1087#1086#1076#1086#1078#1076#1080#1090#1077', '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103' '#1087#1086#1080#1089#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object lDescripton: TLabel
    Left = 5
    Top = 48
    Width = 149
    Height = 13
    Caption = '100% '#1054#1095#1080#1097#1072#1077#1090#1089#1103' '#1090#1072#1073#1083#1080#1094#1072': %s'
  end
  object pgFirst: TProgressBar
    Left = 5
    Top = 5
    Width = 217
    Height = 17
    Step = 1
    TabOrder = 0
  end
  object pgSecond: TProgressBar
    Left = 5
    Top = 27
    Width = 217
    Height = 17
    Step = 1
    TabOrder = 1
  end
  object btnStop: TButton
    Left = 230
    Top = 5
    Width = 49
    Height = 25
    Caption = #1057#1090#1086#1087
    TabOrder = 2
    OnClick = btnStopClick
  end
end
