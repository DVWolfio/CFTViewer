object frmSQL: TfrmSQL
  Left = 351
  Top = 118
  Width = 523
  Height = 392
  Caption = 'SQL '#1047#1072#1087#1088#1086#1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmSQL
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbResult: TDBGrid
    Left = 0
    Top = 161
    Width = 515
    Height = 177
    Align = alClient
    DataSource = dsSQL
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 515
    Height = 161
    Align = alTop
    TabOrder = 1
    object mSQL: TMemo
      Left = 1
      Top = 1
      Width = 513
      Height = 159
      Align = alTop
      TabOrder = 0
    end
  end
  object dsSQL: TDataSource
    DataSet = adSQL
    Left = 424
    Top = 104
  end
  object adSQL: TADOQuery
    Connection = frmMain.acMain
    Parameters = <>
    Left = 424
    Top = 64
  end
  object mmSQL: TMainMenu
    Images = frmMain.imgMain
    Left = 448
    Top = 64
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N3: TMenuItem
        Action = aExec
      end
      object N2: TMenuItem
        Action = aSave
      end
    end
  end
  object ActionList1: TActionList
    Images = frmMain.imgMain
    Left = 384
    Top = 80
    object aSave: TAction
      Caption = #1042' Excel'
      Hint = #1042' Excel'
      ImageIndex = 58
      OnExecute = aSaveExecute
      OnUpdate = aSaveUpdate
    end
    object aExec: TAction
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      ImageIndex = 19
      OnExecute = aExecExecute
    end
  end
end
