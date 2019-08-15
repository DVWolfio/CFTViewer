object frmMain: TfrmMain
  Left = 342
  Top = 114
  Width = 638
  Height = 448
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1093#1088#1072#1085#1080#1083#1080#1097
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object sbMain: TStatusBar
    Left = 0
    Top = 375
    Width = 630
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 500
      end>
  end
  object tbMain: TToolBar
    Left = 0
    Top = 0
    Width = 630
    Height = 24
    AutoSize = True
    Caption = 'tbMain'
    EdgeBorders = [ebLeft, ebTop, ebRight]
    Flat = True
    Images = imgMain
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Transparent = False
    Wrapable = False
    object ToolButton25: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton25'
      ImageIndex = 66
      Style = tbsSeparator
    end
    object ToolButton24: TToolButton
      Left = 8
      Top = 0
      Action = aBack
    end
    object ToolButton26: TToolButton
      Left = 31
      Top = 0
      Action = aNext
    end
    object ToolButton2: TToolButton
      Left = 54
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 62
      Top = 0
      Action = aSearch
    end
    object ToolButton6: TToolButton
      Left = 85
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 25
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 93
      Top = 0
      Action = aExport
    end
    object ToolButton11: TToolButton
      Left = 116
      Top = 0
      Action = aCheck
    end
    object ToolButton12: TToolButton
      Left = 139
      Top = 0
      Action = aDelCheck
    end
    object ToolButton13: TToolButton
      Left = 162
      Top = 0
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 25
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 170
      Top = 0
      Action = aRename
    end
    object ToolButton9: TToolButton
      Left = 193
      Top = 0
      Action = aSaveExp
    end
    object ToolButton7: TToolButton
      Left = 216
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 25
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 224
      Top = 0
      Action = aShowAttribute
    end
    object ToolButton3: TToolButton
      Left = 247
      Top = 0
      Action = aShowMethods
    end
    object ToolButton4: TToolButton
      Left = 270
      Top = 0
      Action = aShowCriteria
    end
    object ToolButton21: TToolButton
      Left = 293
      Top = 0
      Action = aShowState
    end
    object ToolButton22: TToolButton
      Left = 316
      Top = 0
      Action = aShowTrans
    end
    object ToolButton23: TToolButton
      Left = 339
      Top = 0
      Action = aShowIndex
    end
    object ToolButton20: TToolButton
      Left = 362
      Top = 0
      Action = aShowConstTrig
    end
  end
  object pnlAll: TPanel
    Left = 0
    Top = 24
    Width = 630
    Height = 351
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object splSearch: TSplitter
      Left = 0
      Top = 189
      Width = 630
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Visible = False
    end
    object pnlMain: TPanel
      Left = 0
      Top = 0
      Width = 630
      Height = 189
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 241
        Top = 0
        Height = 189
      end
      object pnlItems: TPanel
        Left = 244
        Top = 0
        Width = 386
        Height = 189
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Constraints.MinWidth = 300
        TabOrder = 0
        OnResize = pnlItemsResize
        object grdItems: TDBGrid
          Left = 2
          Top = 26
          Width = 382
          Height = 161
          Align = alClient
          BorderStyle = bsNone
          Constraints.MinWidth = 300
          DataSource = dsItems
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          ParentFont = False
          PopupMenu = pmItems
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = grdItemsCellClick
          OnDrawColumnCell = grdItemsDrawColumnCell
          OnDblClick = aEditMethExecute
          OnTitleClick = grdItemsTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'name'
              Width = 325
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'attr_id'
              Width = 179
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'self_class_id'
              Width = 147
              Visible = True
            end>
        end
        object tbItems: TToolBar
          Left = 2
          Top = 2
          Width = 382
          Height = 24
          AutoSize = True
          EdgeBorders = [ebBottom]
          Flat = True
          Images = imgMain
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
          object ToolButton16: TToolButton
            Left = 0
            Top = 0
            Width = 8
            Caption = 'ToolButton16'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object ToolButton14: TToolButton
            Left = 8
            Top = 0
            Action = aSelectAllItems
          end
          object ToolButton15: TToolButton
            Left = 31
            Top = 0
            Action = aDeSelectAllItems
          end
        end
      end
      object pnlClasses: TPanel
        Left = 0
        Top = 0
        Width = 241
        Height = 189
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object tvClasses: TTreeView
          Left = 2
          Top = 24
          Width = 237
          Height = 163
          Align = alClient
          Constraints.MinHeight = 100
          Constraints.MinWidth = 200
          HideSelection = False
          Images = imgMain
          Indent = 19
          MultiSelectStyle = []
          ReadOnly = True
          TabOrder = 0
          OnChange = tvClassesChange
          OnClick = tvClassesClick
          OnExpanding = tvClassesExpanding
        end
        object tbClasses: TToolBar
          Left = 2
          Top = 2
          Width = 237
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          Images = imgMain
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
          object ToolButton17: TToolButton
            Left = 0
            Top = 0
            Width = 8
            Caption = 'ToolButton16'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object ToolButton18: TToolButton
            Left = 8
            Top = 0
            Action = aSelectAllClass
          end
          object ToolButton19: TToolButton
            Left = 31
            Top = 0
            Action = aDeSelectAllClass
          end
        end
      end
    end
    object pnlSearch: TPanel
      Left = 0
      Top = 192
      Width = 630
      Height = 159
      Align = alBottom
      BevelOuter = bvNone
      Constraints.MinHeight = 50
      TabOrder = 1
      Visible = False
      OnResize = pnlSearchResize
      DesignSize = (
        630
        159)
      object pcSearch: TPageControl
        Left = 0
        Top = 0
        Width = 630
        Height = 159
        ActivePage = tsRename
        Align = alClient
        Images = imgMain
        TabOrder = 0
        object tsSearchMain: TTabSheet
          Caption = #1053#1072#1081#1076#1077#1085#1086'(?)'
          ImageIndex = 47
          object grdSearch: TDBGrid
            Left = 0
            Top = 0
            Width = 899
            Height = 130
            Align = alClient
            DataSource = dsSearch
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
            PopupMenu = ppSearch
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = grdSearchDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'id_type'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'name'
                Width = 280
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'class_name'
                Width = 280
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'text_search'
                Width = 223
                Visible = True
              end>
          end
        end
        object tsSearchText: TTabSheet
          Caption = #1053#1072#1081#1076#1077#1085#1086' '#1074' '#1090#1077#1082#1089#1090#1072#1093' '#1086#1087#1077#1088#1072#1094#1080#1081'(?)'
          ImageIndex = 32
          object grdTextSearch: TDBGrid
            Left = 0
            Top = 0
            Width = 899
            Height = 130
            Align = alClient
            DataSource = dsTextSearch
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
            PopupMenu = ppSearch
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = grdSearchDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'id_type'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'name'
                Width = 280
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'class_name'
                Width = 280
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'text_search'
                Width = 223
                Visible = True
              end>
          end
        end
        object tsRename: TTabSheet
          Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1091#1077#1084#1099#1077' '#1086#1073#1098#1077#1082#1090#1099
          ImageIndex = 2
          OnResize = tsRenameResize
          object sgRename: TStringGrid
            Left = 0
            Top = 0
            Width = 622
            Height = 130
            Align = alClient
            ColCount = 4
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            ParentShowHint = False
            PopupMenu = pmRename
            ShowHint = True
            TabOrder = 0
            OnDblClick = sgRenameDblClick
            OnMouseMove = sgRenameMouseMove
            ColWidths = (
              113
              273
              246
              200)
          end
        end
        object tsSourceMain: TTabSheet
          Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1082#1086#1076#1072
          ImageIndex = 37
          OnResize = tsSourceMainResize
          object sgSource: TStringGrid
            Left = 0
            Top = 0
            Width = 899
            Height = 130
            Align = alClient
            ColCount = 3
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            ParentShowHint = False
            PopupMenu = pmSource
            ShowHint = True
            TabOrder = 0
            OnDblClick = sgSourceDblClick
            OnMouseMove = sgSourceMouseMove
            ColWidths = (
              231
              257
              246)
          end
        end
      end
      object btnCloseSearch: TButton
        Left = 593
        Top = 3
        Width = 27
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCloseSearchClick
      end
    end
  end
  object alMain: TActionList
    Images = imgMain
    Left = 673
    Top = 120
    object aLoadFile: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' MDB'
      ImageIndex = 31
      OnExecute = aLoadFileExecute
    end
    object aClose: TAction
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 42
      OnExecute = aCloseExecute
    end
    object aShowAttribute: TAction
      Category = 'filter'
      Caption = 'aShowAttribute'
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1088#1077#1082#1074#1080#1079#1080#1090#1099
      ImageIndex = 30
      OnExecute = aShowAttributeExecute
      OnUpdate = aSearchUpdate
    end
    object aShowMethods: TAction
      Category = 'filter'
      Caption = 'aShowMethods'
      Checked = True
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1087#1077#1088#1072#1094#1080#1080
      ImageIndex = 32
      OnExecute = aShowAttributeExecute
      OnUpdate = aSearchUpdate
    end
    object aShowConstTrig: TAction
      Category = 'filter'
      Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1080' '#1090#1088#1080#1075#1075#1077#1088#1099
      Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1080' '#1090#1088#1080#1075#1075#1077#1088#1099
      ImageIndex = 65
      OnExecute = aShowAttributeExecute
      OnUpdate = aSearchUpdate
    end
    object aShowCriteria: TAction
      Category = 'filter'
      Caption = 'aShowCriteria'
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103
      ImageIndex = 24
      OnExecute = aShowAttributeExecute
      OnUpdate = aSearchUpdate
    end
    object aRefresh: TAction
      Category = 'filter'
      Caption = 'aRefresh'
      OnExecute = aRefreshExecute
    end
    object aEditMeth: TAction
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072' ('#1055#1088#1086#1089#1084#1086#1090#1088')'
      Hint = #1057#1074#1086#1081#1089#1090#1074#1072' ('#1055#1088#1086#1089#1084#1086#1090#1088')'
      ImageIndex = 32
      ShortCut = 16499
      OnExecute = aEditMethExecute
      OnUpdate = aEditMethUpdate
    end
    object aCopyShort: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16451
      OnExecute = aCopyShortExecute
    end
    object aSearch: TAction
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1086#1080#1089#1082
      ImageIndex = 47
      ShortCut = 16454
      OnExecute = aSearchExecute
      OnUpdate = aSearchUpdate
    end
    object aGoto: TAction
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1101#1083#1077#1084#1077#1085#1090
      ImageIndex = 47
      OnExecute = aGotoExecute
      OnUpdate = aGotoUpdate
    end
    object aExport: TAction
      Category = 'export'
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072
      Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1093#1088#1072#1085#1080#1083#1080#1097#1077
      ImageIndex = 55
      ShortCut = 16469
      OnExecute = aExportExecute
      OnUpdate = aSearchUpdate
    end
    object aSaveExp: TAction
      Category = 'export'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1093#1088#1072#1085#1080#1083#1080#1097#1077
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1093#1088#1072#1085#1080#1083#1080#1097#1077
      ImageIndex = 58
      ShortCut = 16467
      OnExecute = aSaveExpExecute
      OnUpdate = aSaveExpUpdate
    end
    object aRename: TAction
      Category = 'export'
      Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100
      Hint = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100
      ImageIndex = 37
      ShortCut = 113
      OnExecute = aRenameExecute
      OnUpdate = aRenameUpdate
    end
    object aCheck: TAction
      Category = 'export'
      Caption = #1042#1099#1075#1088#1091#1078#1072#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077
      Checked = True
      Hint = #1042#1099#1075#1088#1091#1078#1072#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077
      ImageIndex = 56
      OnExecute = aCheckExecute
      OnUpdate = aCheckUpdate
    end
    object aDelCheck: TAction
      Category = 'export'
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1082#1086#1087#1080#1102' '#1080' '#1091#1076#1072#1083#1080#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077
      Hint = #1057#1076#1077#1083#1072#1090#1100' '#1082#1086#1087#1080#1102' '#1080' '#1091#1076#1072#1083#1080#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077
      ImageIndex = 57
      OnExecute = aCheckExecute
      OnUpdate = aCheckUpdate
    end
    object aDebug: TAction
      Category = 'debug'
      Caption = #1054#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1079#1072#1085#1080#1084#1072#1077#1084#1086#1081' '#1087#1072#1084#1103#1090#1080
      Enabled = False
      Hint = #1056#1072#1089#1095#1080#1090#1099#1074#1072#1090#1100' '#1079#1072#1085#1080#1084#1072#1077#1084#1086#1077' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1086
      ImageIndex = 44
      ShortCut = 16452
      OnExecute = aDebugExecute
    end
    object aReopen: TAction
      Category = 'debug'
      Caption = 'aReopen'
      Enabled = False
      ShortCut = 16466
      OnExecute = aReopenExecute
    end
    object aDebugClose: TAction
      Category = 'debug'
      Caption = 'aDebugClose'
      Enabled = False
      ShortCut = 16474
      OnExecute = aDebugCloseExecute
    end
    object aSelectAllClass: TAction
      Tag = 1
      Category = 'export'
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 60
      ShortCut = 16449
      OnExecute = aSelectAllClassExecute
      OnUpdate = aSaveExpUpdate
    end
    object aDeSelectAllClass: TAction
      Category = 'export'
      Caption = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1080
      Hint = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1080
      ImageIndex = 59
      ShortCut = 16465
      OnExecute = aSelectAllClassExecute
      OnUpdate = aSaveExpUpdate
    end
    object aSelectAllItems: TAction
      Tag = 1
      Category = 'export'
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 60
      OnExecute = aSelectAllItemsExecute
      OnUpdate = aSelectAllItemsUpdate
    end
    object aDeSelectAllItems: TAction
      Category = 'export'
      Caption = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1080
      Hint = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1080
      ImageIndex = 59
      OnExecute = aSelectAllItemsExecute
      OnUpdate = aSelectAllItemsUpdate
    end
    object aShowState: TAction
      Category = 'filter'
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
      ImageIndex = 61
      OnExecute = aShowAttributeExecute
      OnUpdate = aSearchUpdate
    end
    object aShowIndex: TAction
      Category = 'filter'
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1080#1085#1076#1077#1082#1089#1099
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1080#1085#1076#1077#1082#1089#1099
      ImageIndex = 63
      OnExecute = aShowAttributeExecute
      OnUpdate = aSearchUpdate
    end
    object aShowTrans: TAction
      Category = 'filter'
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1077#1088#1077#1093#1086#1076#1099
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1077#1088#1077#1093#1086#1076#1099
      ImageIndex = 62
      OnExecute = aShowAttributeExecute
      OnUpdate = aSearchUpdate
    end
    object aNext: TAction
      Category = 'history'
      Caption = #1042#1087#1077#1088#1077#1076
      Hint = #1042#1087#1077#1088#1077#1076
      ImageIndex = 69
      OnExecute = aNextExecute
      OnUpdate = aNextUpdate
    end
    object aBack: TAction
      Category = 'history'
      Caption = #1053#1072#1079#1072#1076
      Hint = #1053#1072#1079#1072#1076
      ImageIndex = 70
      OnExecute = aBackExecute
      OnUpdate = aBackUpdate
    end
    object aDelRename: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 42
      OnExecute = aDelRenameExecute
      OnUpdate = aDelRenameUpdate
    end
    object aEditMeth2: TAction
      Tag = 1
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072' ('#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077')'
      Hint = #1057#1074#1086#1081#1089#1090#1074#1072' ('#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077')'
      ImageIndex = 32
      ShortCut = 115
      OnExecute = aEditMethExecute
      OnUpdate = aEditMethUpdate
    end
    object aDelSource: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 42
      OnExecute = aDelSourceExecute
      OnUpdate = aDelSourceUpdate
    end
    object aSQL: TAction
      Caption = 'SQL '#1047#1072#1087#1088#1086#1089
      ImageIndex = 35
      OnExecute = aSQLExecute
      OnUpdate = aSQLUpdate
    end
  end
  object acMain: TADOConnection
    ConnectOptions = coAsyncConnect
    LoginPrompt = False
    Mode = cmShareDenyWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 704
    Top = 179
  end
  object MainMenu1: TMainMenu
    Images = imgMain
    Left = 704
    Top = 150
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object MDB1: TMenuItem
        Action = aLoadFile
      end
      object SQL1: TMenuItem
        Action = aSQL
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Action = aClose
      end
    end
    object N6: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
      object N7: TMenuItem
        Action = aSelectAllClass
      end
      object N8: TMenuItem
        Action = aDeSelectAllClass
      end
    end
  end
  object imgMain: TImageList
    Left = 673
    Top = 180
    Bitmap = {
      494C01014A004F00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004001000001002000000000000040
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000808000000080000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000000800000808000000080000000000000000000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C0C0C00000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000000000000080000000000000008000000000
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C0C0
      C00000000000FFFFFF0000000000C0C0C00000000000C0C0C000000000000000
      000000000000000000008000000080000000000000000000000000FF00000000
      0000008000000080000000FF0000008000000080000000800000000000000080
      0000000000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080000000800000000080000000800000008000000080
      000000FF00000080000000FF00000080000000FF00000080000000FF00000000
      000000FF00000000000000800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000C0C0C00000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080000000800000000080000000FF0000008000000080
      00000080000000FF00000080000000FF000000800000008000000080000000FF
      0000008000000080000000800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000800000008000000000800000FFFFFF000080000000FF
      0000008000000080000000FF0000008000000080000000FF0000008000000080
      00000080000000FF000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000008000000080000000000000000080000000FFFF000080
      000000FF000000FFFF000080000000FF0000008000000080000000FF00000080
      0000008000000080000000800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000008000000080
      0000FFFFFF000080000000FFFF00008000000080000000FF00000080000000FF
      0000008000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008000000080000000800000008000000080000000800000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      000000000000FF00000000000000FF0000000000000080008000FF00FF008000
      8000FF00FF0080008000FF00FF0080008000FF00FF0080008000FF00FF008000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000000000000000000000000000FFFF0000FFFF000080800000000000000000
      00000000000000000000FF0000000000000000000000FF00FF0080008000FF00
      FF0080008000FF00FF0080008000FF00FF0080008000FF00FF0080008000FF00
      FF0000000000FF00FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000FFFF
      000000000000000000000000000000000000C0C0C000FFFF000000000000C0C0
      C000000000000000000000000000FF0000000000000080008000FF00FF008000
      8000FF00FF0080008000FF00FF0080008000FF00FF0080008000FF00FF008000
      80000000000080008000FF00FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0000000000000000000000000000000000000000000C0C0C000000000000000
      0000C0C0C00000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00FF0080008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0000000000000000000000
      00000000000000000000FF00FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF00000000000000FF00000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF00FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FF000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000000000000000000000FF00000000000000FF0000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000
      00000000000000000000000000000000000000000000FF000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FF00000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000C0C0C0000000FF000000FF00000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF00FF00FF00000000000000
      00000000000000000000000000000000000000000000FF00000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FF00000000000000FF00000000000000C0C0C000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF00000000000000000000000000000000000000000000C0C0
      C0000000000000000000000000000000000000000000C0C0C000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000C0C0C000FFFF0000000000000000000000000000FF00000000000000C0C0
      C000FFFF0000C0C0C00000000000C0C0C00000000000C0C0C000C0C0C0000000
      0000C0C0C000FFFF000000000000000000000000000000000000000000000000
      FF000000FF00C0C0C00000000000000000000000000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF00000000000000C0C0
      C000FFFF00000000000000000000000000000000000000000000FF0000000000
      0000C0C0C000C0C0C00000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      FF00000000000000FF0000000000FF000000FF00000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00000000000000FFFF
      000000000000000000000000000000000000000000000000000000000000FF00
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000FF000000000000000000C0C0C000FF000000000000000000
      0000FF00000000000000FF00000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000C0C0
      C0000000FF00C0C0C00000000000C0C0C000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080808000C0C0C00080808000C0C0C0008080
      8000C0C0C0008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000FFFF0000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00080808000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF000000000000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00008080000080800000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000080000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000800000008000000000000000000000000000000000000000FF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000800000000000000080000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000800000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000FF000000FF00000080000000000000000000000080000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000080000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000800000008000C0C0C0000000000000000000C0C0C000000080000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000800000000000000080000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080800000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0000000000000000000C0C0C0000000000000000000C0C0C000000080000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000080000000000000000000000080000000FF000000FF000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000080800000FFFF0000FFFF0000FFFF0000FFFF00808080000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      80000000FF000000FF0000000000000000000000000000000000000080000000
      80000000800000000000000000000000000000000000000080000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      80000000000000000000000000000000000000000000000000000000FF000000
      00000000FF00000000000000FF0000000000FF00FF0080008000800080000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0000000000000000000C0C0C0000000000000000000C0C0C000000000000000
      80000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000080000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000080
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00F0FBFF0000000000FF00FF00FF00FF00800080000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0000000000000000000C0C0C0000000000000000000C0C0C000000000000000
      0000000080000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      FF000000FF000000000000000000000000000000000000FFFF00000000000080
      800000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF00808080000000000000FFFF0000000000000000000000FF000000FF000000
      FF00F0FBFF000000FF000000FF000000FF0000000000FF00FF00FF00FF000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000080000000800000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      FF000000FF000000000000000000000000000000000000000000000000000080
      800000FFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0000000000000000000C0C0C0000000000000000000C0C0C000000000000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000FF000000FF0000000000000000000000000000000000000000000080
      800000FFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF008080800000000000000000000000000000000000000000000000FF000000
      00000000FF00000000000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0000000000000000000C0C0C0000000000000000000C0C0C000000000000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000000000000000000000000000FFFF00000000000000
      00000080800000FFFF00000000000000000000FFFF0000FFFF0000FFFF008080
      8000000000000000000000FFFF00000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF0000FFFF0000FFFF0000FFFF00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000080808000808080008080800080808000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000FF000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6961006E6961006E6961006E6961006E6961006E69
      61006E6961006E6961006E696100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000FF000000FF00000000000000000000FFFF000000FF000000
      FF00000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E696100E0EFF600DBECF500D6EAF300D1E7F200CCE4
      F000C7E2EF00C1DFED006E696100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      0000000000000000FF000000FF0000000000000000000000000000FFFF000000
      FF000000FF000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E696100E5F1F700E0EFF600DBECF50000702600D1E7
      F200CCE4F000C7E2EF006E696100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      FF000000FF000000FF0000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E696100EAF4F900E5F1F700E0EFF60000702600D6EA
      F300D1E7F200CCE4F0006E696100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000FF000000FF000000FF00000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000056514A00B3B9BB0000541C0000541C0000541C000070
      260000702600D1E7F2006E696100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000FF000000FF000000FF000000800000000000000000008080
      800000000000000000000000000000000000000000006E6961006E6961006E69
      61006E6961006E6961006E6961006E6961006E6961006E69610000541C00E0EF
      F600DBECF500D6EAF3006E696100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0080808000808080008080
      800080808000808080008080800000000000000000006E696100E0EFF600DBEC
      F500D6EAF300D1E7F200CCE4F000C7E2EF00C1DFED006E69610000541C00E5F1
      F700E0EFF600DBECF5006E696100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      00000000000000FFFF0000FFFF000000000000FFFF000000FF000000FF000000
      FF000000FF000000800000000000808080000000000000000000000000008080
      800000000000000000000000000000000000000000006E696100E5F1F700E0EF
      F600DBECF50000702600D1E7F200CCE4F000C7E2EF006E696100B3B9BB00EAF4
      F900E5F1F700E0EFF6006E696100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00000000000000000000FF000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000FFFF000000FF000000
      FF000000FF000000FF0000008000000000008080800080808000808080008080
      800080808000808080008080800000000000000000006E696100EAF4F900E5F1
      F700E0EFF60000702600D6EAF300D1E7F200CCE4F0006E69610056514A006E69
      61006E6961006E6961006E696100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      FF000000FF000000FF0000008000808080000000000000000000000000008080
      800000000000000000000000000000000000000000006E696100EFF7FA000070
      260000702600007026000070260000702600D1E7F2006E696100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000FF000000FF000000FF00000080008080800080808000808080008080
      800080808000808080008080800000000000000000006E696100F4F9FC00EFF7
      FA00EAF4F90000702600E0EFF600DBECF500D6EAF3006E696100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000FF000000FF00000080000000000000000000000000008080
      800000000000000000000000000000000000000000006E696100F9FCFD00F4F9
      FC00EFF7FA0000702600E5F1F700E0EFF600DBECF5006E696100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF0000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000FFFF000000FF000000FF000000800080808000808080008080
      800080808000808080008080800000000000000000006E696100FEFEFE00F9FC
      FD00F4F9FC00EFF7FA00EAF4F900E5F1F700E0EFF6006E696100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000808000000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000008080000080800000000000000000000000000000000000000000
      0000808080000000000000FFFF000000FF000000800000000000000000008080
      800000000000000000000000000000000000000000006E6961006E6961006E69
      61006E6961006E6961006E6961006E6961006E6961006E696100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000808000000000
      00000000000000000000FF0000000000000000000000FF000000000000000000
      0000000000008080000080800000000000000000000000000000800000008000
      000080000000800000008000000000FFFF000000FF0080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6961006E6961006E6961006E6961006E6961006E69
      61006E6961006E6961006E696100000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000000000000000000000000000000000000000FF008080
      80008080800080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E696100E0EFF600DBECF500D6EAF300D1E7F200CCE4
      F000C7E2EF00C1DFED006E696100000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000008080800000000000000000000000
      000000000000C0C0C0000000000000000000000000000000FF000000FF000000
      FF000000FF008080800080808000000000000000000000000000000000000000
      000000000000C0C0C00080808000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      000000000000000000006E696100E5F1F700E0EFF600DBECF500D6EAF300D1E7
      F200CCE4F000C7E2EF006E696100000000000000000000000000C0C0C0000000
      0000000000008000000000000000808080008080800080808000000000000000
      000000000000C0C0C0000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0080808000000000000000000000000000000000000000
      00000000FF008080800000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      000000000000000000006E696100EAF4F900E5F1F700E0EFF600DBECF500D6EA
      F300D1E7F200CCE4F0006E696100000000000000000000000000C0C0C0000000
      0000FF000000FF00000080000000808080000000000080808000000000000000
      000000000000C0C0C000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0080808000808080000000000000000000000000000000
      FF000000FF00C0C0C00000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000056514A00B3B9BB004700990047009900470099004700
      990047009900D1E7F2006E696100000000000000000000000000C0C0C0000000
      0000FF000000FF000000FF000000800000000000000080808000808080000000
      000000000000C0C0C00000000000000000000000000000000000C0C0C0000000
      FF000000FF000000FF000000FF008080800080808000000000000000FF000000
      FF0080808000C0C0C00000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000008080000000000000000000000000006E6961006E6961006E69
      61006E6961006E6961006E6961006E6961006E6961006E696100ACB5B900E0EF
      F600DBECF500D6EAF3006E696100000000000000000000000000C0C0C000FF00
      00008000000000000000FF000000800000000000000000000000808080008080
      800000000000C0C0C00000000000000000000000000000000000C0C0C0000000
      00000000FF000000FF000000FF000000FF00808080000000FF000000FF008080
      800000000000C0C0C00000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000008080000000000000000000000000006E696100E0EFF600DBEC
      F500D6EAF300D1E7F200CCE4F000C7E2EF00C1DFED006E696100AFB7BA00E5F1
      F700E0EFF600DBECF5006E6961000000000000000000FF000000FF0000008000
      0000000000008080800000000000FF0000008000000000000000000000008080
      800000000000C0C0C00000000000000000000000000000000000C0C0C0000000
      0000000000000000FF000000FF000000FF000000FF000000FF00808080000000
      000000000000C0C0C00000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      000000808000008080000000000000000000000000006E696100E5F1F700E0EF
      F600DBECF500D6EAF300D1E7F200CCE4F000C7E2EF006E696100B3B9BB00EAF4
      F900E5F1F700E0EFF6006E6961000000000000000000FF000000FF0000008000
      0000000000008080800000000000FF000000FF00000080000000000000008080
      800080808000C0C0C00000000000000000000000000000000000C0C0C0000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF008080
      800000000000C0C0C00000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008080000000000000000000000000006E696100EAF4F900E5F1
      F700E0EFF600DBECF500D6EAF300D1E7F200CCE4F0006E69610056514A006E69
      61006E6961006E6961006E6961000000000000000000FF000000800000000000
      000080808000000000000000000000000000FF000000FF000000000000000000
      0000808080008080800000000000000000000000000000000000C0C0C0000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF008080
      800080808000C0C0C00000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008080000000000000000000000000006E696100EFF7FA004700
      990047009900470099004700990047009900D1E7F2006E696100000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      00000000000000000000000000000000000000000000FF000000800000000000
      0000000000008080800080808000808080000000000000000000C0C0C0000000
      FF000000FF000000FF000000FF0080808000000000000000FF000000FF000000
      FF000000FF008080800000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008080000000000000000000000000006E696100F4F9FC00EFF7
      FA00EAF4F900E5F1F700E0EFF600DBECF500D6EAF3006E696100000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      00000000000000000000000000000000000000000000FF000000FF0000008000
      000000000000C0C0C000000000000000000000000000000000000000FF000000
      FF000000FF000000FF00808080000000000000000000000000000000FF000000
      FF000000FF00C0C0C00080808000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008080000000000000000000000000006E696100F9FCFD00F4F9
      FC00EFF7FA00EAF4F900E5F1F700E0EFF600DBECF5006E696100000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF000000FF00
      000080000000800000000000000000000000000000000000FF000000FF000000
      FF000000FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      FF000000FF00C0C0C0000000FF00808080000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E696100FEFEFE00F9FC
      FD00F4F9FC00EFF7FA00EAF4F900E5F1F700E0EFF6006E696100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF0000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E6961006E6961006E69
      61006E6961006E6961006E6961006E6961006E6961006E696100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E6961006E69
      61006E6961006E6961006E6961006E6961006E6961006E6961006E6961006E69
      61006E6961006E69610000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0CA
      A600F0CAA60000000000F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA6000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000000000000000000000000000000000000000000006E696100DFEE
      F600DCEDF500D9EBF400D6EAF300D3E8F200D0E7F200CDE5F100CBE4F000C8E2
      EF00C5E1EE006E69610000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      800000000000000000000000000000000000000000000000000000000000F0CA
      A6000000000000000000F0CAA600000000000000000000000000000000000000
      0000F0CAA600F0CAA6000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000000000000000000000000000000000000000000006E696100E1EF
      F6007878750078787500D9EBF4007878750078787500D0E7F200787875007878
      7500C8E2EF006E69610000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C00080808000000000000000000000000000000000000000000000000000F0CA
      A600F0CAA60000000000F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA6000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000000000000000000000000000000000000000000006E696100E4F1
      F700E1EFF600DEEEF500DBECF500D8EBF400D6EAF300D3E8F200D0E7F100CDE5
      F100CAE4F0006E69610000000000000000000000000000000000000000000000
      000000FFFF0000000000000000000000000000000000C0C0C0000080000000FF
      000080808000000000000000000000000000000000000000000000000000F0CA
      A6000000000000000000F0CAA600000000000000000000000000000000000000
      0000F0CAA600F0CAA6000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF0000000000000000000000FF000000FF000000FF00
      0000FF00000000000000000000000000000000000000000000006E696100E7F2
      F8007878750078787500DEEEF5007878750078787500D5E9F300787875007878
      7500CDE5F1006E69610000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080808000000000000000000000000000000000000000000000000000F0CA
      A600F0CAA60000000000F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA60000000000000000000000000000000000000000000000
      0000FF000000FF0000000000000000FFFF000000000000000000FF000000FF00
      00000000000000000000000000000000000000000000000000006E696100E9F4
      F900E6F2F800E3F1F700E1EFF600DEEEF500DBECF500D8EBF400D5E9F300D2E8
      F200CFE6F1006E69610000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000F0CAA60000000000F0CAA600000000000000000000000000000000000000
      0000F0CAA600F0CAA60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E696100ECF5
      F9007878750078787500E3F1F7007878750078787500DBECF400787875007878
      7500D2E8F2006E69610000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      00000000000000000000F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA60000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E696100EEF6
      FA00ECF5F900E9F3F800E6F2F800E3F0F700E0EFF600DDEDF500DAECF400D8EB
      F400D5E9F3006E69610000000000000000000000000000000000FFFFFF000000
      0000FF00FF0000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0CAA600000000000000000000000000000000000000
      0000F0CAA600F0CAA60000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000006E696100F1F8
      FB007878750078787500E9F3F8007878750078787500E0EFF600787875007878
      7500D7EAF4006E69610000000000000000000000000000000000808080000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA60000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000FFFF00000000000000
      00000000000000000000000000000000000000000000000000006E696100F4F9
      FC00F1F8FB00EEF6FA00EBF5F900E8F3F800E5F2F800E3F0F700E0EFF600DDED
      F500DAECF4006E69610000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0CAA600000000000000000000000000000000000000
      0000F0CAA600F0CAA60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E6961006E69
      61006E6961006E6961006E6961006E6961006E6961006E6961006E6961006E69
      61006E6961006E69610000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF00000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E696100FEDB
      A200FED69B00FBCD9100F9C48700F6BC7E00F3B37400F1AA6A00EFA26100EC9A
      5700EA914D006E69610000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E6961006E69
      61006E6961006E6961006E6961006E6961006E6961006E6961006E6961006E69
      61006E6961006E69610000000000000000000000000000000000000000000000
      0000FFFF0000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0CAA600F0CAA600F0CAA600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000FF0000008000
      0000800000000000000000000000000000000000000000000000000000000000
      000000FF0000008000000080000000000000000000000000000000000000C0C0
      C00000000000C0C0C000000000000000000000FFFF000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000FF000000FF00
      0000800000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000800000000000000000000000000000000000000080
      8000000000000080800000000000008080000080800000000000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000000000000000000000000000000
      000000000000808080000000000000000000000000000000000000000000C000
      2000C000200000000000000000000000000000FFFF0000000000000000000000
      00000000000000FF000000FF0000000000000000000000000000000000000080
      800000000000008080000080800000808000000000000000000000FFFF000080
      8000008080000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000808000008080000080800000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      000000FFFF00000000000080800000808000C0C0C00000808000000000000080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000808000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000008080000080
      800000808000000000000000000000FFFF0000FFFF000000000000FFFF0000FF
      FF00000000000080800000808000000000000000000000000000FF0000000000
      0000FF000000FF000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000008080000080
      80000000000000FFFF000000000000000000000000000000000000000000C0C0
      C000000000000080800000808000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000808000000000000080
      800000FFFF008080800080808000000000008080800080808000000000000080
      800000FFFF00000000000000000000000000000000000000000000000000FF00
      0000FF000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      800000000000808080008080800000000000C0C0C00080808000000000008080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000000000000000000000000000000000000000FF00
      FF008000800080008000000000000000000000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000008080800080808000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000000000000000000000000000FF00
      FF00FF00FF008000800000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000080
      800000FFFF0000FFFF008080800000000000C0C0C00080808000000000000080
      800000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00FF00FF00FF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000008080008080800080808000C0C0C0008080800080808000000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080808000C0C0C00080808000C0C0C0008080
      8000C0C0C0008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000808080000000000000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00080808000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000808000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000808080000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080000000000000FFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C00000FFFF00808080000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00C0C0C00080808000FFFFFF00000000000000
      0000000000000000000000000000000000008080800000000000C0C0C00000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF00C0C0C00080808000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00C0C0C00080808000FFFFFF00000000000000
      000000000000000000000000000000000000808080000000000000FFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C00000FFFF0080808000000000000000000000000000000000000000000000FF
      FF0080808000808080008080800080808000808080008080800000FFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00808080008080800080808000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000008080800000000000C0C0C00000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF00C0C0C00080808000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000C6C6C6000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000FFFF0000FFFF000000000000FFFF00FFFFFF000000
      000000000000000000000000000000000000808080000000000000FFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C00000FFFF008080800000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000C6C6C6000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF00FFFF
      FF00000000000000000000000000000000008080800000000000C0C0C00000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF00C0C0C0008080800000000000000000000000000000000000000000000000
      000000FFFF0080808000808080008080800080808000808080008080800000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000000000000000000000000000000000808080000000000000FFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C00000FFFF008080800000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000080808000C0C0C00000FFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C0008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      800000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000080808000C0C0C00000FF
      FF00C0C0C00000FFFF00C0C0C000808080000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00000000000000FF00000000000000FF00
      000000000000FF00000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000C0C0C0000000000000000000000000000000000000000000FF0000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      0000FFFF000000000000FFFF000000000000C0C0C0000000000000000000C0C0
      C000000000000000000000000000FF0000000000000000000000000000008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000C0C0C00000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      000000000000FF000000000000000000FF000000FF00C0C0C000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      00000000000000000000000000000000FF00000000000000FF00000000000000
      00000000000000000000FF00000000000000000000000000000000000000C0C0
      C000000000008080800000000000000000008080800000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000C0C0C000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000FF00000000000000000000000000FF00000000000000FF0000000000C0C0
      C00000000000FF00000000000000000000000000000000000000000000008080
      800000000000000000000000000000000000808080000000000000FFFF0000FF
      FF00000000000000000080808000000000000000000000000000000000000000
      000000000000C0C0C0000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000C0C0C0000000
      000000000000FF00000000000000C0C0C0000000FF000000FF00000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      0000C0C0C000000000008080800000FFFF0000FFFF0080808000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      00000000000000000000C0C0C000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000000000000000000000000000C0C0
      C0000000000000000000000000000000000000000000C0C0C000000000000000
      000000000000FF00000000000000000000000000000000000000FF000000C0C0
      C000FF000000C0C0C000000000000000000000000000808080000000000000FF
      FF0000FFFF000000000000000000808080000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      FF000000FF00C0C0C00000000000000000000000000000000000000000000000
      0000FF00000000000000FF00000000000000000000000000000000000000FF00
      0000C0C0C000FF00000000000000808080000000000000000000808080000000
      0000000000000000000000000000808080000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000000000000000
      FF00000000000000FF0000000000FF000000FF00000000000000000000000000
      000000000000FF0000000000000000000000000000000000000000000000C0C0
      C000FF000000C0C0C000FF000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      FF00000000000000FF000000000000000000C0C0C000FF000000000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      0000C0C0C000FF000000C0C0C000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C0000000000000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      00008400000000000000000000000000000000000000FFFF000000000000C0C0
      C0000000FF00C0C0C00000000000C0C0C000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000FF000000C0C0C000FF000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C0000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000FFFF0000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000C0C0C000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF000000000000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000FF000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C0000000FF000000FF000000FF00C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C0C0C0000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080008080800080808000C0C0C000C0C0
      C00000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080000000000000FFFF008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00C0C0
      C000000000008080800000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C00000000000C0C0C00000000000000000000000FF000000000000FF
      FF000000FF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000808080000000000000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000C0C0C000000000000000000000000000000000000000FF0000FF
      FF000000FF0000FFFF000000FF00FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00C0C0C0000000000080808000000000000000000000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C00000000000C0C0C000000000000000000000FFFF0000FFFF000000
      FF000000FF000000FF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      000000FFFF008080800000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF0000FFFF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000808080000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      FF000000FF000000FF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000800000008000000000000000000000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF0000FF
      FF000000FF0000FFFF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF000000FF0000FFFF00000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF0000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000808080000000
      0000800000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00808080000000000000000000000000000000000000000000FF00FF008000
      80000000000000000000000000000000000000000000FFFF0000000000000000
      0000000000000000000000000000000000000000000000008000000080000000
      80000000000000000000000000000000FF000000FF000000FF000000FF000000
      0000000000000000800000008000000080000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00C0C0C00000000000000000000000000000000000FF00FF00800080008000
      8000000000000000000000800000008000000080000000000000000000000000
      0000000000008080000080800000000000000000800000008000000000000000
      80000000800000000000000000000000FF000000FF0000000000000000000000
      0000000000000000800000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000808000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000FFFF008080800000000000000000000000000080008000800080000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000800000008000000000000000
      80000000800000000000808080000000FF000000FF0000000000000000008080
      8000000000000000800000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      800080808000FFFFFF00808080008080800080808000FFFFFF00000000000000
      000000FFFF00000000000000000000000000000000000000000000000000FFFF
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000800000008000000000000000
      8000000080000000000000000000808080000000FF0000000000808080000000
      0000000080000000800000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00008080000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000800000008000000000000000000000000000000000000000
      0000FFFF00000000000000000000000000000000000000000000808000000000
      0000000000000000000000000000000000000000800000008000000000000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000080000000800000008000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000080800000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      800080808000FFFFFF00808080008080800080808000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF00000000000000000000000000008080000000000000FFFF
      0000000000000000000000000000000000000000800000008000000000000000
      8000000080000000000000000000000080000000800000000000000000000000
      0000000080000000800000008000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000808000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000FF00FF000000000000000000000000000000800000008000000000000000
      8000000080000000000000000000000080000000800000000000000000000000
      0000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00008080000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      800080808000FFFFFF00808080008080800080808000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000080800000000000000000000000
      0000FF00FF008000800000000000000000000000800000008000000000000000
      8000000080000000000000000000000080000000800000000000000000000000
      0000000080000000800000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF000080
      80000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000080800000000000000000000000
      0000FF00FF008000800000000000000000000000800000008000000000000000
      8000000080000000000000000000000080000000800000000000000000000000
      0000000080000000800000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008080000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      0000000000008000800000000000000000000000000000008000000080000000
      8000000000000000000000000000000080000000800000000000000000000000
      0000000080000000800000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C0000080800000FFFF00008080000080800000000000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF000080800000FFFF0000FFFF000080800000000000FFFF
      FF0000FFFF00C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C0008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C0008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF0000FFFF000080800000FFFF000080800000FFFF000000000000FF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000C0C0C000C0C0
      C000C0C0C0008080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000C0C0C000C0C0
      C000C0C0C0008080000080800000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000080
      800000808000000000000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000808000FFFFFF0000FFFF0000FFFF0000000000FFFF
      FF0000FFFF00C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080800000C0C0C000FFFFFF00C0C0
      C000C0C0C000C0C0C00080800000808000000000000000000000000000000000
      00000000000080808000FFFFFF000000000080800000C0C0C000FFFFFF00C0C0
      C000C0C0C000C0C0C000808000008080000000000000000000000000000000FF
      000000800000008000000000000000000000000000000000000000FFFF0000FF
      FF0000808000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF0000FFFF00008080000080800000808000008080000000000000FF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C0000000000080800000C0C0C000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808000000000000000000000000000000000
      000080808000C0C0C0000000000080800000C0C0C000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C0008080000000000000000000000000000000FF
      000000FF00000080000000000000000000000000000000000000FFFFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000808080000080
      8000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000080800000000000000000000000000000000000000000008080
      8000C0C0C0000000000080800000C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C000808000000000000000000000000000000000
      0000808080000000000080800000C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C00080800000000000000000000000000000FFFF
      FF0000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000008080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000080800000FFFF000080
      80000000000000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF000000000000FFFF0000808000000000000000000000000000000000000000
      000080808000C0C0C000C0C0C000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000080800000FF
      FF00008080000000000000808000FFFFFF00FFFFFF0000FFFF00FFFFFF000000
      000000FFFF000080800000000000000000000000000000000000000000000000
      000080808000C0C0C000C0C0C000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF008000800080008000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000FFFF00008080000000000000808000FFFFFF00FFFFFF000000000000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      00000000000080808000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      80008080800080808000808080008080800080808000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF00FF00FF0080008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000FFFF000080800000000000008080000000000000FFFF000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF00008080000000000000FFFF00008080000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080800000FFFF000080800000808000000000000000
      80000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000080800000FFFF0000000000000000000000
      80000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000000000000000000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF00008080
      0000000000000000000000000000FFFF0000FFFF000080800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C0C0C000FFFF
      0000000000000000000000000000FFFFFF00C0C0C000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000FFFFFF00FFFFFF00C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000FF0000000000
      0000FF0000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808000008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808000008080000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF008080800080808000000000008080800080808000FFFFFF00808080008080
      8000FFFFFF00000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000C0C0C000C0C0C000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008000000000000000000000000000000000000000000000008080
      8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000C0C0C000C0C0C000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00C0C0C00000000000000000000000
      000000000000000000000000000000000000000000000000000080000000FFFF
      FF000000000000000000FFFFFF008080800080808000FFFFFF00808080008080
      8000FFFFFF008000000000000000000000000000000000000000000000008080
      8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C000C0C0C00080800000000000000000
      000000000000000000000000000000000000000000000000000080000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008000000000000000000000000000000000000000000000000000
      000080808000C0C0C000C0C0C000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000C0C0C000C0C0C000C0C0C00080800000808000000000
      000000000000000000000000000000000000000000000000000080000000FFFF
      FF008080800080808000FFFFFF008080800080808000FFFFFF00808080008080
      8000FFFFFF008000000000000000000000000000000000000000000000000000
      000080808000C0C0C000C0C0C000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000808000008080
      000000000000000000000000000000000000000000000000000080000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008000000000000000000000000000000000000000000000000000
      00000000000080808000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      80008080800080808000808080008080800080808000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      0000808000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080800000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C0008080
      000080800000808000000000000000000000000000000000000080000000C0C0
      C0008000000080000000C0C0C0008000000080000000C0C0C000800000008000
      0000C0C0C0008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF008080800000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C00000000000000000000000000000000000C0C0C000000000000000
      00000000000000000000000000000000000000000000C0C0C00080808000C0C0
      C0000000000000FF0000FFFFFF00FFFFFF0000FF00000000000000000000FF00
      FF000000FF00FF00FF000000FF000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000008080800000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C0008080
      8000C0C0C00000000000C0C0C000C0C0C00080808000C0C0C00000000000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000FFFF008080800000FF
      FF000000000000FF0000FFFFFF0000FF000000FF000000000000000000000000
      FF00FF00FF000000FF00800080000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000FFFFFF008080
      8000C0C0C00000000000FFFFFF00C0C0C00080808000C0C0C00000000000C0C0
      C000FFFFFF00C0C0C000C0C0C0000000000000000000C0C0C00080808000C0C0
      C0000000000000FF0000FFFFFF00FFFFFF0000FF00000000000000000000FF00
      FF000000FF00FF00FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00C0C0C000C0C0
      C00080808000C0C0C000C0C0C000FFFFFF00C0C0C00080808000C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000FFFF008080800000FF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      FF00FF00FF000000FF0080008000000000000000000000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000080808000000000000000000000000000000000000000
      0000C0C0C000C0C0C00000000000C0C0C000FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000C0C0C0000000000000000000C0C0C00080808000C0C0
      C00000000000FFFFFF00FFFFFF0000FF000000FF00000000000000000000FF00
      FF0000000000000000000000FF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C0000000
      0000C0C0C000FFFFFF00FFFFFF00C0C0C0000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF0000FF00000080
      0000C0C0C000FFFFFF000080000000FF00000080000000FF00000080000000FF
      000000800000FFFFFF00C0C0C000000000000000000000FFFF008080800000FF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      FF00C0C0C000000000008000800000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C000FFFFFF00FFFF
      FF000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000C0C0C0000000000000000000C0C0C00080808000C0C0
      C0000000000000FF0000FFFFFF00FFFFFF0000FF00000000000000000000FF00
      FF00C0C0C000000000000000FF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFF00000000
      0000FFFFFF00FFFFFF00FFFFFF00C0C0C0000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF0000FF00000080
      0000FFFFFF00FFFFFF000080000000FF00000080000000FF00000080000000FF
      000000800000FFFFFF00C0C0C000000000000000000000FFFF008080800000FF
      FF000000000000FF0000FFFFFF0000FF000000FF000000000000000000000000
      FF00C0C0C000000000008000800000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFF00000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000C0C0C0000000000000000000C0C0C00080808000C0C0
      C00000000000000000000000000000000000000000000000000000000000FF00
      FF00C0C0C000000000000000FF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000FFFFFF0000800000C0C0
      C00000800000C0C0C00000800000C0C0C00000800000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000FFFF008080800000FF
      FF000000000000FF0000FFFFFF00FFFFFF0000FF000000000000000000000000
      FF00C0C0C000000000008000800000000000FFFFFF0000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00C0C0C00000FF
      0000C0C0C00000FF0000C0C0C00000FF0000C0C0C00000FF0000FFFFFF00C0C0
      C000FFFFFF00C0C0C000C0C0C0000000000000000000FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000000000000000000000000000FF00
      FF00C0C0C000000000000000FF0000000000FFFFFF00FFFFFF0000000000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000FF000000FF000000000000FFFFFF00000000000000
      FF00C0C0C000000000008000800000000000FFFFFF00FFFFFF00000000000000
      000000000000000000000000000080808000C0C0C00080808000C0C0C0008080
      8000C0C0C0008080800000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000C0C0C00000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF000000000000FF000000000000FFFFFF0000000000FF00
      FF00C0C0C000000000000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000C0C0C00080808000C0C0C0000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000C0C0C000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      FF00FF00FF000000FF008000800000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000FF0000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080000000FF00000080000000FF00000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      000000FF00000080000000FF0000000000000000000000000000000000000000
      FF000000FF00C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0C0000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000080000000FF
      00000080000000FF0000000000000000000000000000000000000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000080000000FF00000080
      000000FF000000000000000000000000000000000000000000000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000FF00000080000000FF
      000000000000000000000000000000000000000000000000FF00C0C0C000FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000FF000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000080000000FF00000080000000FF00000000
      000000000000000000000000000000000000000000000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF0000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF00000080000000FF0000000000000000
      000000000000000000000000000000000000000000000000FF00FFFFFF00FF00
      0000FFFFFF00FFFFFF00FFFFFF000000FF000000000000000000000000000000
      0000FFFFFF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000FF00000080000000FF000000000000000000000000
      000000000000000000000000000000000000000000000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080000000FF00000080000000FF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000FFFFFF00C0C0C00000FF0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF00FFFF
      FF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000080000000800000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF00C0C0C000FFFFFF00FF000000FFFFFF00C0C0C0000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C0000080800000FFFF00008080000080800000000000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000800080000000
      FF00800080000000FF00800080000000FF008000800000000000800080000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080808000808080000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF000080800000FFFF0000FFFF000080800000000000FFFF
      FF0000FFFF00C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF008000
      800000000000000000000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0080808000000000000000000080808000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0080808000FFFFFF008080800000000000000000000000000080808000FFFF
      FF00FFFFFF0000FFFF000080800000FFFF000080800000FFFF000000000000FF
      FF00FFFFFF00C0C0C0000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00000000000000FF00800080000000
      FF0080008000000000000000000000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000080808000FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFF
      FF008080800000FFFF008080800000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000808000FFFFFF0000FFFF0000FFFF0000000000FFFF
      FF0000FFFF00C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF008000
      80000000FF00800080000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0080808000000000000000000080808000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0080808000FFFFFF008080800000000000000000000000000080808000FFFF
      FF00FFFFFF0000FFFF00008080000080800000808000008080000000000000FF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00000000000000
      FF00800080000000FF008000800000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFFFF00FFFFFF0080808000000000000000000080808000FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFF
      FF008080800000FFFF0080808000000000000000000000000000808080000080
      8000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000080800000000000000000000000000000000000FFFFFF00C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000FF00800080000000FF0000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0080808000000000000000000080808000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0080808000FFFFFF0080808000000000000000000000000000000000000000
      000000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00FF00FF000000FF0000000000000000000000
      0000000000000000FF008000800000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000080808000FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFF
      FF008080800000FFFF008080800000000000000000000080800000FFFF000080
      80000000000000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF000000000000FFFF0000808000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FF00FF000000FF00FF00FF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000FF0000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0080808000000000000000000080808000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0080808000FFFFFF00808080000000000000000000000000000080800000FF
      FF00008080000000000000808000FFFFFF00FFFFFF0000FFFF00FFFFFF000000
      000000FFFF00008080000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C0C0C00080808000808080008080800000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFFFF00FFFFFF0080808000000000000000000080808000FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C000FFFFFF008080800080808000808080008080
      80008080800000FFFF0080808000000000000000000000000000000000000080
      800000FFFF00008080000000000000808000FFFFFF00FFFFFF000000000000FF
      FF00008080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C0C0C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0080808000000000000000000080808000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00C0C0C000FFFFFF00FFFFFF00C0C0
      C000808080008080800080808000000000000000000000000000000000000000
      00000080800000FFFF000080800000000000008080000000000000FFFF000080
      80000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF0000000000000000000000
      FF00FF00FF000000FF0000000000FFFFFF00000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00808080008080
      8000808080008080800080808000000000000000000080808000FFFFFF00C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C000FFFFFF00008080008080
      8000FFFFFF000080800080808000000000000000000000000000000000000000
      0000000000000080800000FFFF00008080000000000000FFFF00008080000000
      00000000FF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00C0C0C000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FF00
      FF000000FF00FF00FF00FFFFFF0000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00C0C0C000FFFF
      FF00FFFFFF00C0C0C00080808000000000000000000080808000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00C0C0C000C0C0C00080808000FFFF
      FF0000808000C0C0C00080808000000000000000000000000000000000000000
      000000000000000000000080800000FFFF000080800000808000000000000000
      80000000FF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000008080
      800080808000808080000000000000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFF
      FF00C0C0C0008080800000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000FFFFFF000080
      8000C0C0C0008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000080800000FFFF0000000000000000000000
      80000000FF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00C0C0C000C0C0
      C00080808000000000000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00C0C0C00000808000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000000000000000000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF00000000FF0000FF0000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF00000000000000000000FFFF00000000000000000000FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000008080000080
      80008080800000808000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF00000000FF000000FF0000FF00
      0000FF0000000000000000000000000000000000000000000000FFFF0000FFFF
      00000000000080808000808080000000000000000000FFFFFF00C0C0C000C0C0
      C00000000000000000000000000000000000000000000080800000808000FFFF
      FF00008080008080800000000000000000000080800080808000008080000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF00000000FF000000FF000000FF0000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000080808000808080008080800000000000FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000808000FFFFFF0000808000FFFF
      FF00808080000080800000808000FFFFFF00000000000080800080808000C0C0
      C000000000000080800000000000000000000000000000000000000000008080
      8000000000008080800000000000808080000000000080808000000000008080
      8000000000008080800080808000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF00000000FF000000FF000000FF000000FF000000FF
      0000FF000000FF00000000000000000000000000000000000000000000008080
      80008080800000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000808000FFFFFF0000808000FFFF
      FF000080800080808000C0C0C000000000000080800080808000008080000000
      0000000000008080800000808000000000000000000000000000000000008080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00080808000C0C0C000808080000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000FF000000FF000000FF000000FF000000FF
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800000000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000808000FFFFFF0000808000FFFF
      FF008080800000808000C0C0C000000000008080800000808000808080000080
      8000FFFFFF000000000080808000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C0000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000FF000000FF000000FF0000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000808080008080800080808000808080000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000808000FFFFFF0000808000FFFF
      FF000080800080808000C0C0C00000000000008080008080800000808000C0C0
      C000000000008080800000808000000000000000000000000000000000000000
      000080808000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0008080800000000000808080008080800000000000FF000000FF000000FF00
      0000FF00000000FF000000FF0000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000808000FFFFFF0000808000FFFF
      FF0080808000C0C0C0000080800000000000808080000080800080808000C0C0
      C000000000000080800080808000000000000000000000000000000000000000
      000080808000FFFFFF000000000080808000808080008080800080808000C0C0
      C0008080800080808000000000000000000000000000FF000000FF000000FF00
      000000FF000000FF0000FF000000FF000000FF00000000FF0000FF000000FF00
      0000FF000000FF00000000FF0000000000000000000000000000000000008080
      800080808000808080008080800080808000808080008080800000000000FFFF
      FF0000000000FFFFFF00000000000000000000808000FFFFFF00000000000080
      8000C0C0C000008080000000000080808000008080008080800000808000C0C0
      C000000000008080800000808000000000000000000000000000000000000000
      000080808000FFFFFF000000000000000000000000000000000080808000C0C0
      C0008080800080808000000000000000000000000000FF000000FF00000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000FF000000FF00
      0000FF00000000FF000000FF0000000000000000000000000000000000000000
      0000808080008080800080808000000000008080800000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000008080000000000000808000C0C0
      C000008080000000000080808000000000008080800000000000C0C0C0000080
      8000000000000080800080808000000000000000000000000000000000000000
      000080808000FFFFFF0000000000FFFF0000000000000000000080808000C0C0
      C0008080800080808000000000000000000000000000FF000000FF00000000FF
      000000FF000000FF000000FF000000FF000000FF0000FF000000FF000000FF00
      0000FF00000000FF000000FF0000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000008080000080800000FFFF000080
      800000000000C0C0C000000000008080800000000000C0C0C000008080000000
      0000008080000000000000808000000000000000000000000000000000000000
      000080808000FFFFFF000000000000000000000000000000000000000000C0C0
      C000808080008080800000000000000000000000000000000000FF00000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000FF000000FF00
      0000FF00000000FF000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080000000000000FFFF0000FFFF000000
      0000000000000000000000FFFF00000000000000000000808000008080000080
      800000808000C0C0C00000808000008080000080800000000000000000000080
      8000000000000080800000000000000000000000000000000000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00080808000808080000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000FF000000FF00
      000000FF000000FF000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000808000C0C0C00000000000000000000080800000000000008080000080
      8000FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C00080808000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF0000FF00000000FF0000FF000000FF000000FF00
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000808000C0C0C000C0C0C000C0C0C0000080800000000000000000000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      00000000000000FF000000FF0000FF000000FF00000000FF0000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C0000080800000FFFF00008080000080800000000000C0C0
      C000C0C0C000C0C0C0000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C0000080800000FFFF00008080000080800000000000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000FF00000000000000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF000080800000FFFF0000FFFF000080800000000000FFFF
      FF0000FFFF00C0C0C0000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF000080800000FFFF0000FFFF000080800000000000FFFF
      FF0000FFFF00C0C0C00000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000C0C0C000C0C0
      C0000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF000000000000000000000000000000000080808000FFFF
      FF00FFFFFF0000FFFF000080800000FFFF000080800000FFFF000000000000FF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000080808000FFFF
      FF00FFFFFF0000FFFF000080800000FFFF000080800000FFFF000000000000FF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000080000000800000000000000000
      0000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000808000FFFFFF0000FFFF0000FFFF0000000000FFFF
      FF0000FFFF00C0C0C0000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF0000808000FFFFFF0000FFFF0000FFFF0000000000FFFF
      FF0000FFFF00C0C0C0000000000000000000000000000000000000000000FF00
      0000FF000000000000000080000000000000C0C0C000C0C0C000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF0000FFFF00008080000080800000808000008080000000000000FF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000080808000FFFF
      FF00FFFFFF0000FFFF00008080000080800000808000008080000000000000FF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000000000FF00
      0000000000000080000000000000000000000000000000000000C0C0C000C0C0
      C000008000000080000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000080
      8000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000080800000000000000000000000000000000000808080000080
      8000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      0000008000000000000000000000800080008000800000000000000000000000
      0000C0C0C000C0C0C00000800000000000000000000000000000000000000000
      000000000000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000080
      000000000000FF00FF0000000000C0C0C000C0C0C00080008000800080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFF0000FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000080800000FFFF000080
      80000000000000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF000000000000FFFF000080800000000000000000000080800000FFFF000080
      80000000000000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF000000000000FFFF0000808000000000000000000000000000000000000000
      0000FF00FF00FF00FF00000000000000000000000000C0C0C000C0C0C0008000
      8000800080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000080800000FF
      FF00008080000000000000808000FFFFFF00FFFFFF0000FFFF00FFFFFF000000
      000000FFFF0000808000000000000000000000000000000000000080800000FF
      FF00008080000000000000808000FFFFFF00FFFFFF0000FFFF00FFFFFF000000
      000000FFFF00008080000000000000000000000000000000000000000000FF00
      FF00FF00FF0080808000FF00FF00FF00FF00FF00FF000000000000000000C0C0
      C000C0C0C0008000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000FFFF00008080000000000000808000FFFFFF00FFFFFF000000000000FF
      FF00008080000000000000000000000000000000000000000000000000000080
      800000FFFF00008080000000000000808000FFFFFF00FFFFFF000000000000FF
      FF00008080000000000000000000000000000000000000000000FF00FF00FF00
      FF0080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000FFFF000080800000000000008080000000000000FFFF000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000080800000FFFF000080800000000000008080000000000000FFFF000080
      8000000000000000000000000000000000000000000000000000FF00FF008080
      8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF00008080000000000000FFFF00008080000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF00008080000000000000FFFF00008080000000
      00000000FF00000000000000000000000000000000000000000080808000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080800000FFFF000080800000808000000000000000
      80000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000080800000FFFF000080800000808000000000000000
      80000000FF000000000000000000000000000000000000000000000000000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000080800000FFFF0000000000000000000000
      80000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000080800000FFFF0000000000000000000000
      80000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF00FF00FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000000000000000000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000000000000000000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C0000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000000000000000
      0000008080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C00000000000FFFFFF00FFFFFF0000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00808080000000000000000000000000000000000000FF
      FF000000000000FFFF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000FFFFFF00FFFFFF00FFFF0000FFFFFF000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000000000000080
      80000000000000FFFF0000FFFF0000FFFF0080808000808080008080800000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000C0C0C00000000000FFFFFF00FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF0000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFFFF00FFFFFF008080800000000000000000000000000000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0080808000808080008080
      80008080800000FFFF0000FFFF0000000000000000000000000000000000C0C0
      C00000000000FFFFFF00FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF000080
      00000000000000000000C0C0C00000000000000000000000FF000000FF000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000008080000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00808080008080800000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00808080000080
      000000800000FFFFFF000000000000000000000000000000FF000000FF000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF00000000000000FF000000000000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFF
      FF00FFFFFF00FFFFFF008080800000000000000000000000000000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00808080008080800000FF
      FF0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF008080800000FFFF008080
      8000FFFFFF00FFFFFF00000000000000000000000000000000000000FF000000
      00000000FF000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000008080000000
      000000FFFF0000FFFF008080800000FFFF0000FFFF00808080008080800000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF008080800000FFFF0080808000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFFFF00FFFFFF008080800000000000000000000000000000FFFF000000
      000000FFFF0000FFFF0000FFFF0080808000808080008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFF0000FFFFFF008080800000FFFF0080808000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000008080000000
      000000FFFF0000FFFF0000FFFF0080808000808080008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF008080800000FFFF0080808000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00808080008080
      80008080800080808000808080000000000000000000000000000000000000FF
      FF000000000000FFFF0000FFFF0000FFFF00808080008080800000FFFF0000FF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000080808000FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFF
      FF00FFFFFF00C0C0C00080808000000000000000000000000000000000000080
      80000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFF
      FF00C0C0C0008080800000000000000000000000000000000000000000000000
      0000008080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400100000100010000000000000A00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF81F00000000000FFC7F00000000
      000FFC7F00000000000FFC7F00000000000FFC3F00000000000FF81F00000000
      000FF04F00000000000FE40700000000000FC001000000000004800000000000
      00000000000000000000000000000000F800000000000000FC00800100000000
      FE04C00300000000FFFFF00F000000000007FFFFFFFF8E2A0003FFFFFFFF4401
      0001FFBFFDFF450A0000FF9FF9FF65910000FF8FF1FF8A223370FF87E1FF9EB4
      BF308003C001D2A2A010800180018A25BF31A0004001A7ABBF71BFE1A291A3E5
      B0018023D001AA6B8001FFA7E9FF6B25C001FF8FF5FF22E7C001FF9FF9FF5737
      F001FFBFFDFF02B7F07FFFFFFFFFF807FFFFFF1FFFFFFFFFFFFFFE1FFFFFFE7F
      FFE3FC0FFE3FFDBFF1C1F80FFC3FFC3FE0C10003F81FFDBFE0D16183F01FFC3F
      E8E36183E10FFC3FF1FF6D83C30FD81BF71F0001C787F00FD40F6DA1FF87E007
      E00F6DB0FFC3A305808F0000FFC3E787E31F6DB3FFE1E787D5FF6DB3FFE1B30D
      F7FF0003FFFFF81FFFFF0003FFFFEC37FFFFFFFF1FF18FFFFC01FFFF0FB087FF
      FC01FFFF0F10C3FFFC01FFFF8EB8C1FFFC01FFFFFEFFC000FC01FFFFFF7FD06E
      800183831D7100008001BABB08F002EE8001B83B0DF080008001BABB8FF8C0EE
      803F8383FFFFC000803FFFFFFFFFD0EE803FFFFF1DB1D000803FFFFF0810D46E
      803FFFFF0DB0C000FFFFFFFF8FF8C000FFFFFFFFFFFFFFFFFFFFF7FCFFFFFC01
      C003C003C001FC01DF7B81F98031FC01DA3B81F38031FC01D0BBC0E38031FC01
      D09BC04380018001C4CBD00B800180018A6BD81B800180018A23DC0B8FF18001
      9733D8038FF1803FDF98C0838FF1803FDF8BC1C18FF1803FC00380008FF1803F
      FFC38FFB8FF5803FFFFFFFFF8001FFFFFFFFFFFFFFFFFFFFC001C003C003F00F
      C001C003C003E007C0A1C003C0038003C001C003C003A003C0A1C003C003A003
      C001E087C003B003E0A1F24FC003B003F001FCBFC00383DFF8A1F95FC003878F
      F801FA9FC003BF0FF8A1F89FC0039BDFF801F81FC00383DFF801FC3FC003E3BF
      F801FFFFFFFFC67FFEBFFFFFFFFFFFFF8007FFFFFFFFFFFFBFF3C7F1FE3FF00F
      BBF182E0E227F00FBDF18260E003F00FBCF1A228E083F01FB071C71180018003
      B9F1FF0F86418101BCF1F80788018381BC71FC03A105C383BFF1E2018901E127
      B001C00FED13F85B8001C107E103EDDBC001D103F007EDC3C001E381FD9FE9E7
      F001FF80FE3FF3FFF07FFFFFFFFFFFFFFE7FFFFFFFFFFFFFF83FFFFFFFFFFFFF
      F83F8001800F07C1F83F0001800F07C1FC3F4001C01F07C1F83F4001C01F0101
      F81F4001C01F0001F01F4001E00F0001F00F4001E00F0001E00F4001E00F8003
      E0074001F007C107E0077FF9F007C107E0070003F007E38FE00F80FFC003E38F
      F00FC1FFE007E38FF83FFFFFFFFFFFFF82AAFFFFFFFFFFFF9041FF0FFFFFFFFF
      950AE007FFF3FE00D7F180E7CFFFFE00DA33279387E7FE00DEB5431387CF8000
      D6A34349C38F80009A258009E11F8000AFAB8024F03F8000A3E5C0C4F87F8001
      AA6BC0F2F03F80036B25E070E13F800722E7E00F838F807F5737F07F07C780FF
      02B7F07F1FE781FFF807F8FFFFFFFFFFFFFFFFFFFFFFFFFFF003007FFFC1C007
      F7FBFF3FFFBE8003F40BFF1FFF6F0001F7FBFF0FFEDF0001F40BFF07FE3F0001
      F7FBFF07FC6F0000F40BFF83F9D70000A3FBFF83872A8000C043FFC10CD5DFE0
      80D7FFC12829E82180CFFFE00001EFF7801FFFE02AA9F417C1FFFFF10001F7FB
      A2FFFFFF6AA9F803FFFFFFFF8003FFFFFFFFEABFFFE7FFF9F7FFFF9FFFC3FFF1
      F3FFFF8FFFC1FE03F1FFFF87FFC1FCC7F0FFFF87CF83F9E7F87FFFC384198A10
      F83F000300302273C01F000108202063E00F000184012443F0070010E38F2611
      F03F0011F0032671F81F001FF8212673F80F001FFC212673FC07001FFC212673
      FC03001FFC318E71FE01001FFE7BFFFFFFC3FFC3FFFFC001FFC3FFC3FFFFC001
      FFC3FFC3FFFFC001FF81FF81FFC7C001FF00FF00E383C001C000F800C183C001
      C000F000C183C001E000F000C1C78000E000E000E3FF8000F0FFE07FFE3FC001
      F0FFC03FFC1FE003F9FFC03FFC1FF003FFFFFFFFFC1FF803FFFFFFFFFE3FFC03
      FFFFFFFFFFFFFE23FFFFFFFFFFFFFF638E3FFFFFFFFFFFFF041FFFFFFFFFFFFF
      041FFFFFFFFFFFFF001FFFFFFFFFFC3F8002FFFFFFFFFC3F8002C03FF9FFFC3F
      C002C03FF0FFFC3FC001E07FF0FFFC3FC003E07FE07FF81FC003F0FFE07FF00F
      C003F0FFC03FE007C003F9FFC03FC003C003FFFFFFFF8001C003FFFFFFFF8001
      C003FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF00000000FFFF00000000
      0000FFFF000000000000FFFF000000000000303F000000000000001F00000000
      0000000F00000000000000070000000000000007000000000000000100000000
      000000000000000000003801000000000000FFFF000000000000FFFF00000000
      0000FFFF000000000000FFFFFFFF0000FFFFFFF8FFFFFFFFFFFFFFF0F83FFFFF
      FFFFFFE0E00FFEFFCC83FFC0C007FCFFCCFFFF818003F8FFC8C7FF038003F07F
      C893FE070001E27FC893FC0F0001C63FC493F81F0001FF3FC4C7F03F0001FF9F
      C4FFE07F0001FF8FCCFFC0FF8003FFCFCCFFC1FF8003FFE7FFFF83FFC007FFF3
      FFFF8FFFE00FFFF9FFFF3FFFF83FFFFDC001C01FC0018007C001800FC0018003
      C0010007C0018001C0010003C0018001C0010001C0018001C0018000C0018001
      C0018000C00180018000C000C00180018000E000C0018001C001C000C0018001
      E0038000C0018001F0030000C0018001F8038000C0018001FC03C080C0038003
      FE23E1FFC007C007FF63F3FFC00FE00FE7FFFFFFF81FFFFFC0FF8007E0070001
      801F8003C00380070003C0018001C0010000E0008001C0010000E00000008001
      0000F000000080010000F000000000000000F001000000010000F1C100000001
      0000F0C1000000000000F001800100008000F00180010001F301F801C0038003
      F021FC03E007C0FFF87FFFFFF81FFFFFFFFFC001C001FC3F07C1C001C001F80F
      07C1C001C001F00307C1C001C001E00106C1C001C001C003DC77C001C001C001
      D837C001C001C001C00780008000C001F83F80008000C001FC7FC001C001C003
      FEFFE003E0038003F83FF003F0038007F83FF803F803800FF83FFC03FC03C01F
      F83FFE23FE23F03FFFFFFF63FF63FC7FFF3FFFFFC001FE0FFE1FF01FC001F007
      FC0FF01FC001E003F807F01FC001C001F003F801C001C001E0010440C0018000
      C0000000C001800080000001C001800080018003C00180000003C041C0018000
      400783C1C0018001A00F83C1C001C001D01F83E3C001C003E83FC7FFC003E007
      F47FFFFFC007F00FF8FFFFFFC00FFC1F00000000000000000000000000000000
      000000000000}
  end
  object qClasses: TADOQuery
    Connection = acMain
    CursorType = ctStatic
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      
        'select distinct switch(cl.parent_id = '#39#39', cl.id, true, cl.parent' +
        '_id) as id,'
      
        '         switch(cl.parent_id = '#39#39', cl.name, true, cl.parent_id) ' +
        'as name,'
      
        '         switch(cl.parent_id = '#39#39', '#39#39', true, cl.parent_id) as pa' +
        'rent_id,'
      '         cl.entity_id,'
      
        '         switch(switch(cl.parent_id = '#39#39', cl.id, true, cl.parent' +
        '_id) in'
      #9#9#9#9#9'('#39'WWW_IN'#39', '#39'WWW_OUT'#39', '#39'DOCUM_RC'#39', '#39'DOCUMENT'#39', '#39'PL_ARC_USV'#39','
      
        #9#9#9#9#9' '#39'PL_ARC_US'#39', '#39'PL_ARC_US_D'#39', '#39'PLAN'#39', '#39'SYSTEM_JOBS'#39', '#39'INTERF' +
        'ACE'#39','
      
        #9#9#9#9#9' '#39'HELP_SYSTEM'#39', '#39'HOOK'#39', '#39'SYSTEM'#39', '#39'SYS_DIARYS'#39', '#39'SYS_EVENTS' +
        #39', '#39'RUN_SESSIONS'#39','
      
        #9#9#9#9#9' '#39'DOC_CARD'#39', '#39'CATALOG_APP'#39', '#39'MON'#39', '#39'ACCOUNT'#39', '#39'FINTOOL'#39', '#39'C' +
        'LIENT'#39', '#39'IP_CLIENT'#39','
      #9#9#9#9#9' '#39'USER'#39', '#39'PRODUCT'#39','#39'FS_FORMS'#39','#39'FM'#39','#39'UDOCUMENT'#39','#39'BUDGET'#39','
      
        '                     '#39'R2_AN_ACCOUNT'#39','#39'R2_DEPOSIT'#39','#39'R2_LONG_ORDER' +
        #39','#39'R2_TRUST'#39','#39'R2_LAST_WILL'#39','
      
        '                     '#39'R2_SALARY'#39','#39'R2_IP_ACCOUNTS'#39','#39'R2_IP_CARDS'#39',' +
        #39'R2_LOAN'#39','#39'R2_IP_MERCHANTS'#39','#39'R2_RES_PORT'#39'), 0,'
      #9#9#9#9'switch(cl.parent_id = '#39#39', cl.id, true, cl.parent_id) in '
      
        #9#9#9#9#9'('#39'BFILE'#39', '#39'BLOB'#39', '#39'BOOLSTRING'#39', '#39'CLASS_ATTR_REF'#39', '#39'CLOB'#39', '#39 +
        'INTERVAL'#39', '#39'INTERVAL_YM'#39', '
      
        #9#9#9#9#9' '#39'TIMESTAMP'#39', '#39'TIMESTAMP_LTZ'#39', '#39'TIMESTAMP_TZ'#39', '#39'REFSTRING'#39',' +
        ' '#39'LONG RAW'#39', '#39'LONG'#39','
      
        #9#9#9#9#9' '#39'METACLASS_REF'#39', '#39'METHOD_REF'#39', '#39'METH_CONTROL_REF'#39', '#39'BINARY' +
        '_DOUBLE'#39', '#39'BINARY_FLOAT'#39', '#39'INTEGER'#39', '
      
        #9#9#9#9#9' '#39'RAW'#39', '#39'ROWID'#39', '#39'STATE_REF'#39', '#39'COLLECTION'#39', '#39'FILE$PATH'#39', '#39'R' +
        'EFERENCE'#39', '
      
        #9#9#9#9#9' '#39'USERS_SE_REF'#39', '#39'USERS_ES_REF'#39', '#39'USERS_G_REF'#39', '#39'USERS_U_RE' +
        'F'#39', '#39'FILE$MASK'#39', '#39'FILE$LOAD'#39'), 2,'
      #9#9#9#9'cl.entity_id = '#39'TYPE'#39', 1,'
      #9#9#9#9'true, 2) as base_id,'
      
        '         switch(cl.agregate = '#39'VARIANT'#39', '#39'VARIANT'#39', true, cl.bas' +
        'e_class_id) as base_class_id,'
      '         cl.autonomous'
      '    from classes cl'
      '   where not exists'
      '   (select 1 from classes cl1 where cl1.id = cl.parent_id)'
      '   union all'
      '  select '#39'!PRINT_'#39' + id as id,'
      #9#9' driver_name,'
      #9#9' '#39#39' as parent_id,'
      #9#9' '#39#39' as entity_id,'
      #9#9' 3 as base_id,'
      #9#9' '#39#39' as base_class_id,'
      #9#9' '#39#39' as autonomous'
      #9'from printer_types ps'
      '   union all'
      '  select '#39'!PROCEDURES'#39' as id,'
      #9#9' '#39#1055#1088#1086#1094#1077#1076#1091#1088#1099#39' as name,'
      #9#9' '#39#39' as parent_id,'
      #9#9' '#39#39' as entity_id,'
      #9#9' 4 as base_id,'
      #9#9' '#39#39' as base_class_id,'
      #9#9' '#39#39' as autonomous'
      '     from procedures'
      '   group by '#39'1'#39
      '  having count(*) > 0'
      '   union all'
      '  select '#39'!'#39' + us.type as id,'
      #9#9' switch(us.type = '#39'G'#39', '#39#1043#1088#1091#1087#1087#1099#39','
      #9#9#9#9'true, '#39#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080#39') as name,'
      #9#9' '#39#39' as parent_id,'
      #9#9' '#39#39' as entity_id,'
      #9#9' 5 as base_id,'
      #9#9' '#39#39' as base_class_id,'
      #9#9' '#39#39' as autonomous'
      #9'from users us'
      '   group by us.type'
      '  having count(*) > 0'
      '   union all'
      '  select '#39'!REPORT'#39' as id,'
      #9#9' '#39#1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103#39' as name,'
      #9#9' '#39#39' as parent_id,'
      #9#9' '#39#39' as entity_id,'
      #9#9' 6 as base_id,'
      #9#9' '#39#39' as base_class_id,'
      #9#9' '#39#39' as autonomous'
      '     from report_views'
      '   group by '#39'1'#39
      '  having count(*) > 0'
      'order by 5,'
      '          2')
    Left = 80
    Top = 80
  end
  object odMDB: TOpenDialog
    DefaultExt = 'mdb'
    Filter = #1061#1088#1072#1085#1080#1083#1080#1097#1077' '#1062#1060#1058'(*.mdb)|*.mdb'
    Left = 704
    Top = 120
  end
  object dsClasses: TDataSource
    DataSet = qClasses
    Left = 80
    Top = 112
  end
  object qItems: TADOQuery
    AutoCalcFields = False
    CacheSize = 100
    Connection = acMain
    CursorType = ctStatic
    ExecuteOptions = [eoAsyncFetch]
    BeforeOpen = qItemsBeforeOpen
    AfterOpen = qItemsAfterOpen
    Parameters = <
      item
        Name = 'class'
        Size = -1
        Value = Null
      end
      item
        Name = 'struct'
        Size = -1
        Value = Null
      end
      item
        Name = 'class_id'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from ('
      
        'select tmp.name, tmp.attr_id, tmp.self_class_id, tmp.id_type, tm' +
        'p.filter_type, tmp.id, tmp.result_class_id, tmp.sort_id'
      
        '  from (select ca.class_id, ca.name, ca.attr_id, ca.self_class_i' +
        'd, '#39'0'#39' as id_type, '#39'0'#39' as filter_type, ca.attr_id as id, null as' +
        ' result_class_id, 1 as sort_id'
      '          from class_attributes ca'
      '       where ca.required <> '#39'A'#39
      '         union all'
      
        '          select ca.id as class_id, ca.name, ca.id, '#39#1047#1072#1087#1080#1089#1100' CLAS' +
        'SES'#39' as self_class_id, '#39'5'#39' as id_type, '#39'5'#39' as filter_type, ca.id' +
        ' as id, null as result_class_id, 0 as sort_id'
      '            from classes ca'
      '         where :class = 1'
      '        union all'
      
        '          select cl.id as class_id, cl1.name, cl1.id, '#39'STRUCTURE' +
        #39' as self_class_id, '#39'6'#39' as id_type, '#39'6'#39' as filter_type, cl1.id a' +
        's id, null as result_class_id, 0 as sort_id'
      '            from classes cl, classes cl1'
      '         where cl.target_class_id = cl1.id'
      '             and :struct = 1'
      '        union all'
      '        select m.class_id,'
      '               m.name,'
      '               m.short_name,'
      '               switch(m.flags = '#39'R'#39', '#39#1054#1090#1095#1077#1090#39','
      #9#9#9#9#9'  m.flags = '#39'P'#39', '#39#1055#1077#1095#1072#1090#1100#39','
      #9#9#9#9#9'  m.flags = '#39'M'#39', '#39#1055#1088#1086#1089#1090#1072#1103#39', '
      #9#9#9#9#9'  m.flags = '#39'Y'#39', '#39#1044#1077#1089#1090#1088#1091#1082#1090#1086#1088#39','
      #9#9#9#9#9'  m.flags = '#39'D'#39', '#39#1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077#39','
      #9#9#9#9#9'  m.flags = '#39'C'#39', '#39#1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088#39', '
      #9#9#9#9#9'  m.flags = '#39'A'#39', m.result_class_id,'
      #9#9#9#9#9'  m.flags = '#39'T'#39', '#39#1058#1088#1080#1075#1075#1077#1088#39', '
      #9#9#9#9#9'  m.flags = '#39'Z'#39', '#39#1060#1080#1083#1100#1090#1088#39','
      #9#9#9#9#9'  m.flags = '#39'O'#39', '#39#1042#1099#1073#1086#1088#39', '
      #9#9#9#9#9'  m.flags = '#39'G'#39', '#39#1057#1087#1080#1089#1086#1095#1085#1072#1103#39', '
      #9#9#9#9#9'  m.flags = '#39'L'#39', '#39#1041#1080#1073#1083#1080#1086#1090#1077#1095#1085#1072#1103#39','
      #9#9#9#9#9'  m.flags = '#39'S'#39', '#39#1043#1088#1091#1087#1087#1086#1074#1072#1103#39') as self_class_id,'
      '                  m.flags as id_type,'
      
        '                  switch(m.flags = '#39'A'#39', '#39'0'#39', 1=1, m.flags) as fi' +
        'lter_type,'
      '                  m.id as id,'
      '                  m.result_class_id, '
      '                  switch(m.flags = '#39'A'#39', 1, 1=1, 2) as sort_id'
      '          from methods m'
      '        union all'
      '        select cr.class_id,'
      '               cr.name,'
      '               cr.short_name,'
      
        '               switch(cr.flags = '#39'R'#39', '#39#1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1072#39 +
        ','
      #9#9#9#9#9'  true, '#39#1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1076#1083#1103' '#1087#1088#1086#1089#1084#1086#1090#1088#1072#39') as self_class_id,'
      
        '               '#39'1'#39' as id_type, '#39'1'#39' as filter_type, cr.id, null a' +
        's result_class_id, '
      #9#9#9'   3 as sort_id'
      '          from criteria cr'
      #9'  union all'
      #9'    select cc.class_id,'
      #9#9#9'   cc.name,'
      #9#9#9'   cc.name as short_name,'
      #9#9#9'   '#39#1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077#39' as self_class_id,'
      
        #9#9#9'   '#39'8'#39' as id_type, '#39'8'#39' as filter_type, cc.name as id, null as' +
        ' result_class_id,'
      #9#9#9'   7 as sort_id'
      #9#9'  from class_constraints cc'
      #9'  union all'
      #9'    select ct.class_id,'
      #9#9#9'   ct.name,'
      #9#9#9'   ct.name as short_name,'
      #9#9#9'   '#39#1058#1088#1080#1075#1075#1077#1088#39' as self_class_id,'
      
        #9#9#9'   '#39'9'#39' as id_type, '#39'9'#39' as filter_type, ct.name as id, null as' +
        ' result_class_id,'
      #9#9#9'   8 as sort_id'
      #9#9'  from class_triggers ct'
      #9'  union all'
      #9'    select s.class_id,'
      #9#9'       s.name,'
      #9#9#9'   s.id,'
      #9#9#9'   '#39#1057#1086#1089#1090#1086#1103#1085#1080#1077#39' as self_class_id,'
      
        #9#9#9'   '#39'!'#39' as id_type, '#39'!'#39' as filter_type, s.id, null as result_c' +
        'lass_id,'
      #9#9#9'   4 as sort_id'
      #9#9'  from states s'
      #9'   union all'
      #9'    select t.class_id,'
      #9#9'       t.name,'
      #9#9#9'   t.short_name,'
      #9#9#9'   '#39#1055#1077#1088#1077#1093#1086#1076#39' as self_class_id,'
      
        #9#9#9'   '#39'>'#39' as id_type, '#39'>'#39' as filter_type, t.id, null as result_c' +
        'lass_id,'
      #9#9#9'   5 as sort_id'
      #9#9'  from transitions t  '
      #9'    union all'
      #9'    select cl.class_id,'
      #9#9'       cl.name,'
      #9#9#9'   cl.name,'
      #9#9#9'   '#39#1048#1085#1076#1077#1082#1089#39' as self_class_id,'
      
        #9#9#9'   '#39'*'#39' as id_type, '#39'*'#39' as filter_type, cl.name, null as resul' +
        't_class_id,'
      #9#9#9'   6 as sort_id'
      #9#9'  from class_indexes cl'
      '      union all'
      '        select '#39'!PRINT_'#39' + mv.driver_id as class_id,'
      '               mv.description,'
      #9#9#9'   mv.macro_name,'
      #9#9#9'   '#39#1052#1072#1082#1088#1086#1089' '#1087#1077#1095#1072#1090#1080#39' as self_class_id,'
      #9#9#9'   '#39'7'#39' as id_type, '#39'7'#39' as filter_type,'
      #9#9#9'   macro_id as id, '
      #9#9#9'   null as result_class_id, '
      #9#9#9'   4 as sort_id'
      #9#9'  from macro_values mv'
      #9'     union all'
      #9#9'select '#39'!PROCEDURES'#39' as class_id,'
      #9#9#9'   mid(DESCRIPTION,1,255) as name,'
      #9#9#9'   name,'
      #9#9#9'   '#39#1055#1088#1086#1094#1077#1076#1091#1088#1072#39' as self_class_id,'
      #9#9#9'   '#39'2'#39' as id_type, '#39'2'#39' as filter_type,'
      #9#9#9'   id, '
      #9#9#9'   null as result_class_id, '
      #9#9#9'   4 as sort_id'
      #9#9'  from procedures'
      #9#9' union all'
      #9#9'select '#39'!REPORT'#39' as class_id,'
      #9#9#9'   mid(DESCRIPTION,1,255) as name,'
      #9#9#9'   name,'
      #9#9#9'   '#39#1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077#39' as self_class_id,'
      #9#9#9'   '#39'&'#39' as id_type, '#39'&'#39' as filter_type,'
      #9#9#9'   name as id, '
      #9#9#9'   null as result_class_id, '
      #9#9#9'   4 as sort_id'
      #9#9'  from report_views'
      #9#9' union all'
      #9#9'select '#39'!'#39' + us.type as class_id,'
      #9#9#9'   us.name,'
      #9#9#9'   us.username,'
      #9#9#9'   switch(us.type = '#39'G'#39', '#39#1043#1088#1091#1087#1087#1072#39','
      #9#9#9'          true, '#39#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#39') as self_class_id,'
      #9#9#9'   switch(us.type = '#39'G'#39', '#39'3'#39','
      #9#9#9'          true, '#39'4'#39') as id_type,'
      
        '                                                   switch(us.typ' +
        'e = '#39'G'#39', '#39'3'#39','
      #9#9#9'          true, '#39'4'#39') as filter_type,'
      #9#9#9'   us.username as id, '
      #9#9#9'   null as result_class_id, '
      #9#9#9'   4 as sort_id'
      #9#9'  from users us'
      ') tmp'
      ' where tmp.class_id = :class_id) tmp'
      ' order by tmp.sort_id, tmp.name')
    Left = 312
    Top = 48
    object qItemsname: TStringField
      Tag = 90
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 45
      FieldName = 'name'
      Size = 255
    end
    object qItemsattr_id: TStringField
      Tag = 90
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1080#1084#1103
      DisplayWidth = 30
      FieldName = 'attr_id'
      Size = 255
    end
    object qItemsself_class_id: TStringField
      Tag = 90
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 20
      FieldName = 'self_class_id'
      Size = 255
    end
    object qItemsid_type: TStringField
      DisplayLabel = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
      FieldName = 'id_type'
      Visible = False
      Size = 1
    end
    object qItemsid: TStringField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      FieldName = 'id'
      Visible = False
      Size = 255
    end
    object qItemsresult_class_id: TStringField
      FieldName = 'result_class_id'
    end
  end
  object dsItems: TDataSource
    DataSet = qItems
    Left = 312
    Top = 80
  end
  object fsMain: TFormStorage
    Active = False
    IniFileName = 'Software\FTC\IBS\Viewer'
    UseRegistry = True
    OnSavePlacement = fsMainSavePlacement
    OnRestorePlacement = fsMainRestorePlacement
    StoredProps.Strings = (
      'aShowAttribute.Checked'
      'aShowCriteria.Checked'
      'aShowMethods.Checked'
      'aShowConstTrig.Checked'
      'aShowState.Checked'
      'aShowIndex.Checked'
      'aShowTrans.Checked'
      'pnlSearch.Height')
    StoredValues = <
      item
        Name = 'TextSearch'
        Value = ''
        KeyString = 'TextSearch'
      end
      item
        Name = 'HistorySearch'
        KeyString = 'HistorySearch'
      end>
    Left = 673
    Top = 150
  end
  object pmItems: TPopupMenu
    Images = imgMain
    Left = 735
    Top = 150
    object N9: TMenuItem
      Action = aSelectAllItems
    end
    object N10: TMenuItem
      Action = aDeSelectAllItems
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N14: TMenuItem
      Action = aRename
    end
    object N3: TMenuItem
      Action = aEditMeth
    end
    object N13: TMenuItem
      Action = aEditMeth2
    end
  end
  object dsSearch: TDataSource
    Left = 256
    Top = 416
  end
  object qSearch: TADOQuery
    Connection = acMain
    ExecuteOptions = [eoAsyncExecute]
    LockType = ltReadOnly
    AfterOpen = qSearchAfterAction
    AfterClose = qSearchAfterAction
    Parameters = <>
    Left = 288
    Top = 416
    object qSearchclass_id: TStringField
      Tag = 100
      DisplayLabel = #1058#1041#1055
      FieldName = 'class_id'
    end
    object qSearchname: TStringField
      Tag = 280
      DisplayLabel = #1048#1084#1103
      FieldName = 'name'
      Size = 255
    end
    object qSearchshort_name: TStringField
      Tag = 280
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1080#1084#1103
      FieldName = 'short_name'
    end
    object qSearchid_type: TStringField
      Tag = 100
      DisplayLabel = #1069#1083#1077#1084#1077#1085#1090
      FieldName = 'id_type'
    end
    object qSearchid: TStringField
      Tag = 124
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      FieldName = 'id'
    end
    object qSearchtext: TStringField
      Tag = 100
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'text_search'
      Size = 255
    end
    object qSearchclass_name: TStringField
      Tag = 280
      DisplayLabel = #1058#1041#1055
      FieldName = 'class_name'
      Size = 255
    end
  end
  object qTextSearch: TADOQuery
    Connection = acMain
    ExecuteOptions = [eoAsyncExecute]
    LockType = ltReadOnly
    AfterOpen = qSearchAfterAction
    AfterClose = qSearchAfterAction
    Parameters = <>
    Left = 408
    Top = 448
    object StringField1: TStringField
      Tag = 124
      DisplayLabel = #1058#1041#1055
      FieldName = 'class_id'
    end
    object StringField2: TStringField
      Tag = 280
      DisplayLabel = #1048#1084#1103
      FieldName = 'name'
      Size = 255
    end
    object StringField3: TStringField
      Tag = 124
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1080#1084#1103
      FieldName = 'short_name'
    end
    object StringField4: TStringField
      Tag = 100
      DisplayLabel = #1069#1083#1077#1084#1077#1085#1090
      FieldName = 'id_type'
    end
    object StringField5: TStringField
      Tag = 124
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      FieldName = 'id'
    end
    object StringField6: TStringField
      Tag = 100
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'text_search'
      Size = 255
    end
    object StringField7: TStringField
      Tag = 280
      DisplayLabel = #1058#1041#1055
      FieldName = 'class_name'
      Size = 255
    end
  end
  object dsTextSearch: TDataSource
    Left = 376
    Top = 448
  end
  object ppSearch: TPopupMenu
    Images = imgMain
    Left = 468
    Top = 457
    object N5: TMenuItem
      Action = aGoto
    end
  end
  object ilStateCheck: TImageList
    Left = 673
    Top = 210
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000008000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000800000008000000080000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000080808000808080008080800000000000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000080000000800000008000000080000000800000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000008080800080808000808080008080800080808000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000080000000800000000000000080000000800000008000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000008080800080808000000000008080800080808000808080000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000080000000000000000000000000000000800000008000000080
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000008080800000000000000000000000000080808000808080008080
      8000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000008000000080
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFC001C001C001
      C003DFFDDFFDDFFDDFFBDFFDDFFDDFFDDFFBDFFDDEFDDEFDDFFBDFFDDC7DDC7D
      DFFBDFFDD83DD83DDFFBDFFDD91DD91DDFFBDFFDDB8DDB8DDFFBDFFDDFCDDFCD
      DFFBDFFDDFEDDFEDDFFBDFFDDFFDDFFDDFFBDFFDDFFDDFFDC003C001C001C001
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object odSaveMDB: TSaveDialog
    DefaultExt = 'mdb'
    Filter = #1061#1088#1072#1085#1080#1083#1080#1097#1077' '#1062#1060#1058'(*.mdb)|*.mdb'
    Left = 735
    Top = 120
  end
  object acSaveMDB: TADOConnection
    ConnectOptions = coAsyncConnect
    LoginPrompt = False
    Mode = cmShareExclusive
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 735
    Top = 179
  end
  object tDelayChangeClass: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tDelayChangeClassTimer
    Left = 345
    Top = 49
  end
  object ilStateDel: TImageList
    Left = 705
    Top = 210
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000FF000000FF000000000000000000000000000000FF000000
      FF00000000000000000080808000000000000000000000000000808080000000
      0000000000008080800080808000000000000000000000000000808080008080
      8000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000FF000000FF000000FF00000000000000FF000000FF000000
      FF00000000000000000080808000000000000000000000000000808080000000
      0000000000008080800080808000808080000000000080808000808080008080
      8000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000080808000808080008080800080808000808080000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000808080008080800080808000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000080808000808080008080800080808000808080000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000FF000000FF000000FF00000000000000FF000000FF000000
      FF00000000000000000080808000000000000000000000000000808080000000
      0000000000008080800080808000808080000000000080808000808080008080
      8000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000FF000000FF000000000000000000000000000000FF000000
      FF00000000000000000080808000000000000000000000000000808080000000
      0000000000008080800080808000000000000000000000000000808080008080
      8000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFC001C001C001
      C003DFFDDFFDDFFDDFFBDFFDDFFDDFFDDFFBDFFDD9CDD9CDDFFBDFFDD88DD88D
      DFFBDFFDDC1DDC1DDFFBDFFDDE3DDE3DDFFBDFFDDC1DDC1DDFFBDFFDD88DD88D
      DFFBDFFDD9CDD9CDDFFBDFFDDFFDDFFDDFFBDFFDDFFDDFFDC003C001C001C001
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object tTotalmemory: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tTotalmemoryTimer
    Left = 380
    Top = 49
  end
  object pmRename: TPopupMenu
    Images = imgMain
    Left = 532
    Top = 457
    object N12: TMenuItem
      Action = aDelRename
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 644
    Top = 120
  end
  object pmSource: TPopupMenu
    Images = imgMain
    Left = 572
    Top = 457
    object MenuItem1: TMenuItem
      Action = aDelSource
    end
  end
end
