object frmRename: TfrmRename
  Left = 440
  Top = 246
  Width = 486
  Height = 124
  BorderIcons = [biSystemMenu]
  Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  Color = clBtnFace
  Constraints.MaxHeight = 124
  Constraints.MinHeight = 124
  Constraints.MinWidth = 486
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  DesignSize = (
    470
    86)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 7
    Width = 128
    Height = 13
    Alignment = taRightJustify
    Caption = #1050#1086#1088#1086#1090#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 11
    Top = 32
    Width = 125
    Height = 13
    Alignment = taRightJustify
    Caption = #1044#1083#1080#1085#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 291
    Height = 13
    Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1080#1079#1086#1081#1076#1077#1090' '#1090#1086#1083#1100#1082#1086' '#1074' '#1085#1086#1074#1086#1084' '#1093#1088#1072#1085#1080#1083#1080#1097#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edShort: TEdit
    Left = 140
    Top = 4
    Width = 158
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 16
    TabOrder = 0
    OnKeyPress = edShortKeyPress
  end
  object edName: TEdit
    Left = 140
    Top = 29
    Width = 326
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 128
    TabOrder = 1
  end
  object Button1: TButton
    Left = 312
    Top = 56
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 391
    Top = 56
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
end
