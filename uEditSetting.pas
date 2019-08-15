unit uEditSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Placemnt, ComCtrls, StdCtrls, ExtCtrls, RxCombos, Registry, SynEdit,
  SynEditHighlighter, SynHighlighterSQL, SynHighlighterVBScript;

type
  TColorRec = record
    TypeColor: integer;
    Color: TColor;
  end;
  PColorRec = ^TColorRec;
  TfrmEditSetting = class(TForm)
    fsEditMethod: TFormStorage;
    pcMain: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    btnDefault: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    Label1: TLabel;
    cbLanguage: TComboBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edTabSize: TEdit;
    GroupBox2: TGroupBox;
    cbColorSyn: TCheckBox;
    cbHorScroll: TCheckBox;
    cbVertScroll: TCheckBox;
    GroupBox3: TGroupBox;
    cbShowNum: TCheckBox;
    Label3: TLabel;
    edStartSel: TEdit;
    tvColors: TTreeView;
    lColor: TLabel;
    lBack: TLabel;
    lStyleFont: TLabel;
    cbStyleFont: TComboBox;
    Label7: TLabel;
    edFont: TEdit;
    btnFont: TButton;
    cbColor: TComboBox;
    cbBackground: TComboBox;
    cdExt: TColorDialog;
    fdCustom: TFontDialog;
    procedure FormCreate(Sender: TObject);
    procedure fsEditMethodStoredValues0Restore(Sender: TStoredValue;
      var Value: Variant);
    procedure fsEditMethodStoredValues0Save(Sender: TStoredValue;
      var Value: Variant);
    procedure cbLanguageChange(Sender: TObject);
    procedure edTabSizeChange(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure fsEditMethodStoredValues2Restore(Sender: TStoredValue;
      var Value: Variant);
    procedure fsEditMethodStoredValues2Save(Sender: TStoredValue;
      var Value: Variant);
    procedure fsEditMethodStoredValues4Restore(Sender: TStoredValue;
      var Value: Variant);
    procedure fsEditMethodStoredValues4Save(Sender: TStoredValue;
      var Value: Variant);
    procedure fsEditMethodStoredValues6Restore(Sender: TStoredValue;
      var Value: Variant);
    procedure fsEditMethodStoredValues6Save(Sender: TStoredValue;
      var Value: Variant);
    procedure fsEditMethodStoredValues8Restore(Sender: TStoredValue;
      var Value: Variant);
    procedure fsEditMethodStoredValues8Save(Sender: TStoredValue;
      var Value: Variant);
    procedure fsEditMethodStoredValues10Restore(Sender: TStoredValue;
      var Value: Variant);
    procedure fsEditMethodStoredValues10Save(Sender: TStoredValue;
      var Value: Variant);
    procedure cbColorDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbColorChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure tvColorsChange(Sender: TObject; Node: TTreeNode);
    procedure fsEditMethodRestorePlacement(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbStyleFontChange(Sender: TObject);
  private
    { Private declarations }
    fSynPLPlus: TSynSQLSyn;
    fSynPLVBA: TSynVBScriptSyn;
    fEditsPLPlus: array of TSynEdit;
    fEditsVBA: array of TSynEdit;
    fCurVBA: boolean;
    procedure SetColorCombo(pCombo: TComboBox; pColor: TColor);
  public
    { Public declarations }
    procedure ApplySettings;
    constructor Create(AOwner: TComponent; pSynPLPlus: TSynSQLSyn; pSynPLVBA: TSynVBScriptSyn; pEditsPLPlus: array of TSynEdit; pEditsVBA: array of TSynEdit; pCurVBA: boolean);
  end;

var
  fColorArr: array of TColorRec;

implementation

{$R *.dfm}

uses SynEditMiscClasses, DB;

constructor TfrmEditSetting.Create(AOwner: TComponent; pSynPLPlus: TSynSQLSyn; pSynPLVBA: TSynVBScriptSyn; pEditsPLPlus: array of TSynEdit; pEditsVBA: array of TSynEdit; pCurVBA: boolean);
var
  i: integer;
begin
  inherited Create(AOwner);
  fSynPLPlus:= pSynPLPlus;
  fSynPLVBA:= pSynPLVBA;
  fCurVBA := pCurVBA;
  SetLength(fEditsPLPlus, Length(pEditsPLPlus));
  for i:=0 to Length(pEditsPLPlus)-1 do
    fEditsPLPlus[i] := pEditsPLPlus[i];
  SetLength(fEditsVBA, Length(pEditsVBA));
  for i:=0 to Length(pEditsVBA)-1 do
    fEditsVBA[i] := pEditsVBA[i];
end;

function AddColor(pType: integer; pColor: TColor): TColorRec;
begin
  Result.TypeColor := pType;
  Result.Color := pColor;
end;

procedure TfrmEditSetting.FormCreate(Sender: TObject);
var
  fRoot: TTreeNode;
  procedure FillComboBox(pCombo: TComboBox);
  var
    idx: integer;
    pColor: PColorRec;
  begin
    for idx:=0 to Length(fColorArr) - 1 do
    begin
      New(pColor);
      pColor.TypeColor := fColorArr[idx].TypeColor;
      pColor.Color := fColorArr[idx].Color;
      if fColorArr[idx].TypeColor = 1 then
        pCombo.AddItem('Автоматически', TObject(pColor))
      else if fColorArr[idx].TypeColor = 2 then
        pCombo.AddItem('Другие...', TObject(pColor))
      else
        pCombo.AddItem('', TObject(pColor));
    end;
  end;
begin
  if fCurVBA then
    cbLanguage.ItemIndex := 0
  else
    cbLanguage.ItemIndex := 1;
  pcMain.ActivePageIndex := 0; 

  FillComboBox(cbColor);
  FillComboBox(cbBackground);

  fRoot := tvColors.Items.AddChild(nil, 'Другое');
  tvColors.Items.AddChildObject(fRoot, 'Верт. разделит. строки', PChar('LeftBreak'));
  tvColors.Items.AddChildObject(fRoot, 'Нумерация строк', PChar('NumStr'));
  tvColors.Items.AddChildObject(fRoot, 'Окно', PChar('Window'));

  fRoot := tvColors.Items.AddChild(nil, 'Basic');
  tvColors.Items.AddChildObject(fRoot, 'Comment', PChar('BasicComment'));
  tvColors.Items.AddChildObject(fRoot, 'Keywords', PChar('BasicKeywords'));
  tvColors.Items.AddChildObject(fRoot, 'Number', PChar('BasicNumber'));
  tvColors.Items.AddChildObject(fRoot, 'Operators', PChar('BasicOperators'));
  tvColors.Items.AddChildObject(fRoot, 'Strings', PChar('BasicStrings'));
  tvColors.Items.AddChildObject(fRoot, 'Text', PChar('BasicText'));

  fRoot := tvColors.Items.AddChild(nil, 'PLPlus');
  tvColors.Items.AddChildObject(fRoot, 'Comment', PChar('PLPlusComment'));
  tvColors.Items.AddChildObject(fRoot, 'Keywords', PChar('PLPlusKeywords'));
  tvColors.Items.AddChildObject(fRoot, 'Number', PChar('PLPlusNumber'));
  tvColors.Items.AddChildObject(fRoot, 'Operators', PChar('PLPlusOperators'));
  tvColors.Items.AddChildObject(fRoot, 'Strings', PChar('PLPlusStrings'));
  tvColors.Items.AddChildObject(fRoot, 'Text', PChar('PLPlusText'));

  fsEditMethod.Active := true;
end;

procedure TfrmEditSetting.ApplySettings;
var
  i: integer;
  function GetStyle(pStyle: integer): TFontStyles;
  begin
    Result := [];
    if pStyle in [1, 3] then
      Result := Result + [fsBold];
    if pStyle in [2, 3] then
      Result := Result + [fsItalic];
    if pStyle in [4] then
      Result := Result + [fsUnderline];
  end;
  procedure SetBasicSetting(pEdit: TSynEdit);
  begin
    if Boolean(fsEditMethod.StoredValue['ColorSynBasic']) then
      pEdit.Highlighter := fSynPLVBA
    else
      pEdit.Highlighter := nil;
    if Boolean(fsEditMethod.StoredValue['HorScrollBasic']) and Boolean(fsEditMethod.StoredValue['VertScrollBasic']) then
      pEdit.ScrollBars := ssBoth
    else if Boolean(fsEditMethod.StoredValue['HorScrollBasic']) then
      pEdit.ScrollBars := ssHorizontal
    else if Boolean(fsEditMethod.StoredValue['VertScrollBasic']) then
      pEdit.ScrollBars := ssVertical
    else
      pEdit.ScrollBars := ssNone;
    pEdit.Gutter.Visible := Boolean(fsEditMethod.StoredValue['ShowNumBasic']);
    pEdit.Gutter.LineNumberStart := Integer(fsEditMethod.StoredValue['StartNumBasic']);
    pEdit.TabWidth := Integer(fsEditMethod.StoredValue['TabSizeBasic']);
    pEdit.Font := fdCustom.Font;
    pEdit.Gutter.Font.Name := fdCustom.Font.Name;
    pEdit.Gutter.Font.Size := fdCustom.Font.Size;
    // Цветовая и стилестическая настройка
    pEdit.Color := fsEditMethod.StoredValue['WindowColor'];
    pEdit.Gutter.Font.Color := fsEditMethod.StoredValue['NumStrColor'];
    pEdit.Gutter.Color := fsEditMethod.StoredValue['NumStrBackground'];
    if pEdit.Gutter.Color = clNone then
      pEdit.Gutter.Color := pEdit.Color;
    pEdit.Gutter.BorderColor := fsEditMethod.StoredValue['LeftBreakColor'];
    if pEdit.Gutter.BorderColor = clNone then
      pEdit.Gutter.BorderColor := pEdit.Gutter.Color;
    pEdit.Gutter.Font.Style := GetStyle(fsEditMethod.StoredValue['NumStrStyle']);

    with fSynPLVBA do
    begin
      CommentAttri.Foreground := fsEditMethod.StoredValue['BasicCommentColor'];
      CommentAttri.Background := fsEditMethod.StoredValue['BasicCommentBackground'];
      CommentAttri.Style := GetStyle(fsEditMethod.StoredValue['BasicCommentStyle']);

      KeyAttri.Foreground := fsEditMethod.StoredValue['BasicKeywordsColor'];
      KeyAttri.Background := fsEditMethod.StoredValue['BasicKeywordsBackground'];
      KeyAttri.Style  := GetStyle(fsEditMethod.StoredValue['BasicKeywordsStyle']);

      NumberAttri.Foreground := fsEditMethod.StoredValue['BasicNumberColor'];
      NumberAttri.Background := fsEditMethod.StoredValue['BasicNumberBackground'];
      NumberAttri.Style := GetStyle(fsEditMethod.StoredValue['BasicNumberStyle']);

      SymbolAttri.Foreground := fsEditMethod.StoredValue['BasicOperatorsColor'];
      SymbolAttri.Background := fsEditMethod.StoredValue['BasicOperatorsBackground'];
      SymbolAttri.Style := GetStyle(fsEditMethod.StoredValue['BasicOperatorsStyle']);

      StringAttri.Foreground := fsEditMethod.StoredValue['BasicStringsColor'];
      StringAttri.Background := fsEditMethod.StoredValue['BasicStringsBackground'];
      StringAttri.Style := GetStyle(fsEditMethod.StoredValue['BasicStringsStyle']);

      IdentifierAttri.Foreground := fsEditMethod.StoredValue['BasicTextColor'];
      IdentifierAttri.Background := fsEditMethod.StoredValue['BasicTextBackground'];
      IdentifierAttri.Style := GetStyle(fsEditMethod.StoredValue['BasicTextStyle']);
    end;
  end;
  procedure SetPLPlusSetting(pEdit: TSynEdit);
  begin
    if Boolean(fsEditMethod.StoredValue['ColorSynPLPlus']) then
      pEdit.Highlighter := fSynPLPlus
    else
      pEdit.Highlighter := nil;
    if Boolean(fsEditMethod.StoredValue['HorScrollPLPlus']) and Boolean(fsEditMethod.StoredValue['VertScrollPLPlus']) then
      pEdit.ScrollBars := ssBoth
    else if Boolean(fsEditMethod.StoredValue['HorScrollPLPlus']) then
      pEdit.ScrollBars := ssHorizontal
    else if Boolean(fsEditMethod.StoredValue['VertScrollPLPlus']) then
      pEdit.ScrollBars := ssVertical
    else
      pEdit.ScrollBars := ssNone;
    pEdit.Gutter.Visible := Boolean(fsEditMethod.StoredValue['ShowNumPLPlus']);
    pEdit.Gutter.LineNumberStart := Integer(fsEditMethod.StoredValue['StartNumPLPlus']);
    pEdit.TabWidth := Integer(fsEditMethod.StoredValue['TabSizePLPlus']);
    pEdit.Font := fdCustom.Font;
    pEdit.Gutter.Font.Name := fdCustom.Font.Name;
    pEdit.Gutter.Font.Size := fdCustom.Font.Size;

    pEdit.Color := fsEditMethod.StoredValue['WindowColor'];
    pEdit.Gutter.Font.Color := fsEditMethod.StoredValue['NumStrColor'];
    pEdit.Gutter.Color := fsEditMethod.StoredValue['NumStrBackground'];
    if pEdit.Gutter.Color = clNone then
      pEdit.Gutter.Color := pEdit.Color;
    pEdit.Gutter.BorderColor := fsEditMethod.StoredValue['LeftBreakColor'];
    if pEdit.Gutter.BorderColor = clNone then
      pEdit.Gutter.BorderColor := pEdit.Color;
    pEdit.Gutter.Font.Style := GetStyle(fsEditMethod.StoredValue['NumStrStyle']);
    with fSynPLPlus do
    begin
      CommentAttri.Foreground := fsEditMethod.StoredValue['PLPlusCommentColor'];
      CommentAttri.Background := fsEditMethod.StoredValue['PLPlusCommentBackground'];
      CommentAttri.Style := GetStyle(fsEditMethod.StoredValue['PLPlusCommentStyle']);
      ConditionalCommentAttri.Foreground := CommentAttri.Foreground;
      ConditionalCommentAttri.Background := CommentAttri.Background;
      ConditionalCommentAttri.Style := CommentAttri.Style;

      KeyAttri.Foreground := fsEditMethod.StoredValue['PLPlusKeywordsColor'];
      KeyAttri.Background := fsEditMethod.StoredValue['PLPlusKeywordsBackground'];
      KeyAttri.Style := GetStyle(fsEditMethod.StoredValue['PLPlusKeywordsStyle']);
      DataTypeAttri.Foreground := KeyAttri.Foreground;
      DataTypeAttri.Background := KeyAttri.Background;
      DataTypeAttri.Style := KeyAttri.Style;
      FunctionAttri.Foreground := KeyAttri.Foreground;
      FunctionAttri.Background := KeyAttri.Background;
      FunctionAttri.Style := KeyAttri.Style;
      PLSQLAttri.Foreground := KeyAttri.Foreground;
      PLSQLAttri.Background := KeyAttri.Background;
      PLSQLAttri.Style := KeyAttri.Style;
      SQLPlusAttri.Foreground := KeyAttri.Foreground;
      SQLPlusAttri.Background := KeyAttri.Background;
      SQLPlusAttri.Style := KeyAttri.Style;
      TableNameAttri.Foreground := KeyAttri.Foreground;
      TableNameAttri.Background := KeyAttri.Background;
      TableNameAttri.Style := KeyAttri.Style;

      NumberAttri.Foreground := fsEditMethod.StoredValue['PLPlusNumberColor'];
      NumberAttri.Background := fsEditMethod.StoredValue['PLPlusNumberBackground'];
      NumberAttri.Style := GetStyle(fsEditMethod.StoredValue['PLPlusNumberStyle']);

      SymbolAttri.Foreground := fsEditMethod.StoredValue['PLPlusOperatorsColor'];
      SymbolAttri.Background := fsEditMethod.StoredValue['PLPlusOperatorsBackground'];
      SymbolAttri.Style := GetStyle(fsEditMethod.StoredValue['PLPlusOperatorsStyle']);

      StringAttri.Foreground := fsEditMethod.StoredValue['PLPlusStringsColor'];
      StringAttri.Background := fsEditMethod.StoredValue['PLPlusStringsBackground'];
      StringAttri.Style := GetStyle(fsEditMethod.StoredValue['PLPlusStringsStyle']);

      IdentifierAttri.Foreground := fsEditMethod.StoredValue['PLPlusTextColor'];
      IdentifierAttri.Background := fsEditMethod.StoredValue['PLPlusTextBackground'];
      IdentifierAttri.Style := GetStyle(fsEditMethod.StoredValue['PLPlusTextStyle']);
      DefaultPackageAttri.Foreground := IdentifierAttri.Foreground;
      DefaultPackageAttri.Background := IdentifierAttri.Background;
      DefaultPackageAttri.Style := IdentifierAttri.Style;
      DelimitedIdentifierAttri.Foreground := IdentifierAttri.Foreground;
      DelimitedIdentifierAttri.Background := IdentifierAttri.Background;
      DelimitedIdentifierAttri.Style := IdentifierAttri.Style;
      ExceptionAttri.Foreground := IdentifierAttri.Foreground;
      ExceptionAttri.Background := IdentifierAttri.Background;
      ExceptionAttri.Style := IdentifierAttri.Style;
    end;
  end;
begin
  fsEditMethod.SaveFormPlacement;
  fsEditMethod.RestoreFormPlacement;
  for i:=0 to Length(fEditsPLPlus)-1 do
    SetPLPlusSetting(fEditsPLPlus[i]);
  for i:= 0 to Length(fEditsVBA)-1 do
    SetBasicSetting(fEditsVBA[i]);
  btnApply.Enabled := false;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues0Restore(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    cbColorSyn.Checked := Value;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues0Save(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    Value := cbColorSyn.Checked
  else
    Value := Sender.Value;
end;

procedure TfrmEditSetting.cbLanguageChange(Sender: TObject);
begin
  fsEditMethod.RestoreFormPlacement;
end;

procedure TfrmEditSetting.edTabSizeChange(Sender: TObject);
begin
  btnApply.Enabled := true;
end;

procedure TfrmEditSetting.btnApplyClick(Sender: TObject);
begin
  ApplySettings;
end;

procedure TfrmEditSetting.btnDefaultClick(Sender: TObject);
var
  OldKey, OldKey2, OldKey3: string;
  i: integer;
  fReg: TRegistry;
  procedure SetExistsWithRestore(pCodeStore: string; pCodeReg: string; pType: TFieldType);
  var
    fValue: Variant;
  begin
    with fReg do
      if ValueExists(pCodeReg) then
      begin
        if pType = ftString then
          fsEditMethod.StoredValue[pCodeStore] := ReadString(pCodeReg)
        else if pType = ftInteger then
          fsEditMethod.StoredValue[pCodeStore] := ReadInteger(pCodeReg)
        else if pType = ftBoolean then
          fsEditMethod.StoredValue[pCodeStore] := ReadString(pCodeReg) = 'True';
        if Assigned(fsEditMethod.StoredValues.Values[pCodeStore].OnRestore) then
        begin
          fValue := fsEditMethod.StoredValue[pCodeStore];
          fsEditMethod.StoredValues.Values[pCodeStore].OnRestore(fsEditMethod.StoredValues.Values[pCodeStore], fValue);
        end;
      end;
  end;
begin
  // Нужно сопоставить значения с админом
  fReg := TRegistry.Create;
  with fReg do
  try
    RootKey := HKEY_CURRENT_USER;
    if OpenKeyReadOnly('Software\FTC\IBS\Administrator\CodeMax4') then
    begin
      OldKey := CurrentPath;
      if OpenKeyReadOnly('LineNumbering') then
      try
        SetExistsWithRestore('ShowNumBasic','Basic', ftBoolean);
        SetExistsWithRestore('ShowNumPLPlus', 'PLPlus', ftBoolean);
      finally
        CloseKey;
        OpenKeyReadOnly(OldKey);
      end;
      OldKey := CurrentPath;
      if OpenKeyReadOnly('TabSize') then
      try
        SetExistsWithRestore('TabSizeBasic','Basic', ftString);
        SetExistsWithRestore('TabSizePLPlus', 'PLPlus', ftString);
      finally
        CloseKey;
        OpenKeyReadOnly(OldKey);
      end;
      OldKey := CurrentPath;
      if OpenKeyReadOnly('LineNumberStart') then
      try
        SetExistsWithRestore('StartNumBasic','Basic', ftString);
        SetExistsWithRestore('StartNumPLPlus', 'PLPlus', ftString);
      finally
        CloseKey;
        OpenKeyReadOnly(OldKey);
      end;
      OldKey := CurrentPath;
      if OpenKeyReadOnly('EditBasic') then
      try
        SetExistsWithRestore('ColorSynBasic', 'ColorSyntax', ftInteger);
        SetExistsWithRestore('HorScrollBasic', 'HScroll', ftInteger);
        SetExistsWithRestore('VertScrollBasic', 'VScroll', ftInteger);
      finally
        CloseKey;
        OpenKeyReadOnly(OldKey);
      end;
      OldKey := CurrentPath;
      if OpenKeyReadOnly('EditPLPlus') then
      try
        SetExistsWithRestore('ColorSynPLPlus', 'ColorSyntax', ftInteger);
        SetExistsWithRestore('HorScrollPLPlus', 'HScroll', ftInteger);
        SetExistsWithRestore('VertScrollPLPlus', 'VScroll', ftInteger);
        SetExistsWithRestore('NumStrColor', 'LineNumberColor', ftInteger);
        SetExistsWithRestore('NumStrBackground', 'LineNumberBkColor', ftInteger);
        SetExistsWithRestore('NumStrStyle', 'LineNumberFontStyle', ftInteger);
        SetExistsWithRestore('WindowColor', 'WindowColor', ftInteger);
        if ValueExists('FontName') then
          fdCustom.Font.Name := ReadString('FontName');
        if ValueExists('FontSize') then
          fdCustom.Font.Size := ReadInteger('FontSize');
        SetExistsWithRestore('LeftBreakColor', 'VDividerLineColor', ftInteger);
      finally
        CloseKey;
        OpenKeyReadOnly(OldKey);
      end;
      OldKey := CurrentPath;
      if OpenKeyReadOnly('Language') then
      try
        OldKey2 := CurrentPath;
        if OpenKeyReadOnly('Basic') then
        try
          OldKey3 := CurrentPath;
          if OpenKeyReadOnly('Comment') then
          try
            SetExistsWithRestore('BasicCommentColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('BasicCommentBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('BasicCommentStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
          if OpenKeyReadOnly('Keywords') then
          try
            SetExistsWithRestore('BasicKeywordsColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('BasicKeywordsBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('BasicKeywordsStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
          if OpenKeyReadOnly('Number') then
          try
            SetExistsWithRestore('BasicNumberColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('BasicNumberBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('BasicNumberStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
          if OpenKeyReadOnly('Number') then
          try
            SetExistsWithRestore('BasicOperatorsColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('BasicOperatorsBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('BasicOperatorsStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
          if OpenKeyReadOnly('Strings') then
          try
            SetExistsWithRestore('BasicStringsColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('BasicStringsBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('BasicStringsStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
          if OpenKeyReadOnly('Text') then
          try
            SetExistsWithRestore('BasicTextColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('BasicTextBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('BasicTextStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
        finally
          CloseKey;
          OpenKeyReadOnly(OldKey2);
        end;
        OldKey2 := CurrentPath;
        if OpenKeyReadOnly('PLPlus') then
        try
          OldKey3 := CurrentPath;
          if OpenKeyReadOnly('Comment') then
          try
            SetExistsWithRestore('PLPlusCommentColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('PLPlusCommentBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('PLPlusCommentStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
          if OpenKeyReadOnly('Keywords') then
          try
            SetExistsWithRestore('PLPlusKeywordsColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('PLPlusKeywordsBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('PLPlusKeywordsStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
          if OpenKeyReadOnly('Number') then
          try
            SetExistsWithRestore('PLPlusNumberColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('PLPlusNumberBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('PLPlusNumberStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
          if OpenKeyReadOnly('Operators') then
          try
            SetExistsWithRestore('PLPlusOperatorsColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('PLPlusOperatorsBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('PLPlusOperatorsStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
          if OpenKeyReadOnly('Strings') then
          try
            SetExistsWithRestore('PLPlusStringsColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('PLPlusStringsBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('PLPlusStringsStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
          if OpenKeyReadOnly('Text') then
          try
            SetExistsWithRestore('PLPlusTextColor', 'ForeColor', ftInteger);
            SetExistsWithRestore('PLPlusTextBackground', 'BackColor', ftInteger);
            SetExistsWithRestore('PLPlusTextStyle', 'FontStyle', ftInteger);
          finally
            CloseKey;
            OpenKeyReadOnly(OldKey3);
          end;
        finally
          CloseKey;
          OpenKeyReadOnly(OldKey2);
        end;
      finally
        CloseKey;
        OpenKeyReadOnly(OldKey);
      end;
    end;
  finally
    Free;
  end;
  // В админском реестре цвет clNone хранится как -1, зименим все такие значения
  for i:=0 to fsEditMethod.StoredValues.Count-1 do
    if ((Pos('Color', fsEditMethod.StoredValues.Items[i].Name) = Length(fsEditMethod.StoredValues.Items[i].Name) - 4) or
        (Pos('Background', fsEditMethod.StoredValues.Items[i].Name) = Length(fsEditMethod.StoredValues.Items[i].Name) - 9)) and
        (fsEditMethod.StoredValues.Items[i].Value = -1) then
      fsEditMethod.StoredValues.Items[i].Value := clNone;
  
  fsEditMethodRestorePlacement(fsEditMethod);
  if Assigned(tvColors.Selected) then
    tvColorsChange(tvColors, tvColors.Selected);
  btnApply.Enabled := true;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues2Restore(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    cbHorScroll.Checked := Value;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues2Save(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    Value := cbHorScroll.Checked
  else
    Value := Sender.Value;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues4Restore(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    cbVertScroll.Checked := Value;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues4Save(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    Value := cbVertScroll.Checked
  else
    Value := Sender.Value;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues6Restore(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    cbShowNum.Checked := Value;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues6Save(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    Value := cbShowNum.Checked
  else
    Value := Sender.Value;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues8Restore(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    edStartSel.Text := Value;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues8Save(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    try
      Value := StrToInt(edStartSel.Text)
    except
      Value := 1;
    end
  else
    Value := Sender.Value;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues10Restore(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    edTabSize.Text := Value;
end;

procedure TfrmEditSetting.fsEditMethodStoredValues10Save(
  Sender: TStoredValue; var Value: Variant);
begin
  if Copy(Sender.Name, Pos(cbLanguage.Text, Sender.Name), Length(Sender.Name)) = cbLanguage.Text then
    try
      Value := StrToInt(edTabSize.Text)
    except
      Value := 1;
    end
  else
    Value := Sender.Value;
end;

procedure TfrmEditSetting.cbColorDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
   Rect1, Rect2: TRect;
begin
  inherited;
  with TComboBox(Control) do
  begin
    Canvas.Brush.Color := clWindow;
    Canvas.FillRect(Rect);

    Rect1.Left  :=Rect.Left+1;
    Rect1.Top   :=Rect.Top+1;
    Rect1.Right :=Rect.Right-1;
    Rect1.Bottom:=Rect.Bottom-1;

    Canvas.Brush.Color := clBlack;
    Canvas.FillRect(Rect1);

    Rect2.Left  :=Rect1.Left+1;
    Rect2.Top   :=Rect1.Top+1;
    Rect2.Right :=Rect1.Right-1;
    Rect2.Bottom:=Rect1.Bottom-1;

    Canvas.Brush.Color:= PColorRec(Items.Objects[Index]).Color;
    if Canvas.Brush.Color = clNone then
      Canvas.Brush.Color := clWhite;
    Canvas.FillRect(Rect2);

    Canvas.Font.Color:=Font.Color;
    Canvas.Brush.Color:=Color;

    if Items[Index] <> '' then
    begin
      Canvas.Pen.Color:= Canvas.Brush.Color;
      DrawText(Canvas.Handle, PChar(Items[Index]), Length(Items[Index]), Rect2, DT_CENTER);
    end;
  end;
end;

procedure TfrmEditSetting.SetColorCombo(pCombo: TComboBox; pColor: TColor);
var
  idx: integer;
  pCurColorRef: PColorRec;
begin
  for idx := 0 to pred(pCombo.Items.Count) do
  begin
    pCurColorRef := PColorRec(pCombo.Items.Objects[idx]);
    if ((pCurColorRef.TypeColor = 1) and ((pColor = clNone) or (pColor = -1))) or
       ((pCurColorRef.TypeColor in [0,3]) and (pColor = pCurColorRef.Color)) then
    begin
      pCombo.ItemIndex := idx;
      exit;
    end;
  end;
  // Если так и не нашли то добавляем
  if PColorRec(pCombo.Items.Objects[pCombo.Items.Count-2]).TypeColor = 3 then
  begin
    PColorRec(pCombo.Items.Objects[pCombo.Items.Count-2]).Color := pColor;
    pCombo.ItemIndex := pCombo.Items.Count-2;
    exit;
  end else
  begin
    New(pCurColorRef);
    pCurColorRef.TypeColor := 3;
    pCurColorRef.Color := pColor;
    pCombo.Items.InsertObject(pCombo.Items.Count-1, '', TObject(pCurColorRef));
    pCombo.ItemIndex := pCombo.Items.Count-2;
    exit;
  end;
end;

procedure TfrmEditSetting.cbColorChange(Sender: TObject);
var
  pColor: PColorRec;
  function GetConstVal: string;
  begin
    if TComboBox(Sender).Name = 'cbColor' then
      Result := 'Color'
    else
      Result := 'Background';
  end;
begin
  pColor := PColorRec(TComboBox(Sender).Items.Objects[TComboBox(Sender).ItemIndex]);
  if pColor.TypeColor = 2 then
  begin
    if cdExt.Execute then
    begin
      SetColorCombo(TComboBox(Sender), cdExt.Color);
    end else
      TComboBox(Sender).ItemIndex := 0;
  end;

  fsEditMethod.StoredValue[PChar(tvColors.Selected.Data) + GetConstVal] :=
    PColorRec(TComboBox(Sender).Items.Objects[TComboBox(Sender).ItemIndex]).Color;
  btnApply.Enabled := true;
end;

procedure TfrmEditSetting.FormDestroy(Sender: TObject);
  procedure ClearList(List: TStrings);
  var
    i: Integer;
  begin
    for i := 0 to pred(List.Count) do
      Dispose(PColorRec(List.Objects[i]));
    List.Clear;
  end;
begin
  ClearList(cbColor.Items);
  ClearList(cbBackground.Items);
  SetLength(fEditsPLPlus,0);
  SetLength(fEditsVBA,0);
  fSynPLPlus:= nil;
  fSynPLVBA:= nil;
end;

procedure TfrmEditSetting.btnFontClick(Sender: TObject);
begin
  if fdCustom.Execute then
  begin
    edFont.Text := fdCustom.Font.Name + ', ' + IntToStr(fdCustom.Font.Size) + 'pt';
    btnApply.Enabled := true;
  end;
end;

procedure TfrmEditSetting.tvColorsChange(Sender: TObject; Node: TTreeNode);
begin
  // Загрузка настроек по текущему пункту в TreeView
  cbColor.Enabled := Node.Level = 1;
  cbBackground.Enabled := cbColor.Enabled;
  cbStyleFont.Enabled := cbColor.Enabled;
  if Node.Level = 1 then
  begin
    lBack.Visible := not ((Node.Parent.Text = 'Другое') and ((PChar(Node.Data) = 'Window') or (PChar(Node.Data) = 'LeftBreak')));
    cbBackground.Visible := lBack.Visible;
    lStyleFont.Visible := lBack.Visible;
    cbStyleFont.Visible := lBack.Visible;
    SetColorCombo(cbColor, fsEditMethod.StoredValue[PChar(Node.Data) + 'Color']);
    if lBack.Visible then
    begin
      SetColorCombo(cbBackground, fsEditMethod.StoredValue[PChar(Node.Data) + 'Background']);
      cbStyleFont.ItemIndex := fsEditMethod.StoredValue[PChar(Node.Data) + 'Style'];
    end;
  end else
  begin
    cbColor.ItemIndex := -1;
    cbBackground.ItemIndex := -1;
    cbStyleFont.ItemIndex := -1;
  end;
end;

procedure TfrmEditSetting.fsEditMethodRestorePlacement(Sender: TObject);
begin
  edFont.Text := fdCustom.Font.Name + ', ' + IntToStr(fdCustom.Font.Size) + 'pt';
end;

procedure TfrmEditSetting.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // Чтобы не сохранились изменения на форме
  if ModalResult = mrCancel then
    fsEditMethod.RestoreFormPlacement;
end;

procedure TfrmEditSetting.cbStyleFontChange(Sender: TObject);
begin
  fsEditMethod.StoredValue[PChar(tvColors.Selected.Data) + 'Style'] := cbStyleFont.ItemIndex;
  btnApply.Enabled := true; 
end;

initialization
  SetLength(fColorArr, 18);
  fColorArr[ 0] := AddColor(1, clNone);
  fColorArr[ 1] := AddColor(0, clBlack);
  fColorArr[ 2] := AddColor(0, clMaroon);
  fColorArr[ 3] := AddColor(0, clGreen);
  fColorArr[ 4] := AddColor(0, clOlive);
  fColorArr[ 5] := AddColor(0, clNavy);
  fColorArr[ 6] := AddColor(0, clPurple);
  fColorArr[ 7] := AddColor(0, clTeal);
  fColorArr[ 8] := AddColor(0, clGray);
  fColorArr[ 9] := AddColor(0, clSilver);
  fColorArr[10] := AddColor(0, clRed);
  fColorArr[11] := AddColor(0, clLime);
  fColorArr[12] := AddColor(0, clYellow);
  fColorArr[13] := AddColor(0, clBlue);
  fColorArr[14] := AddColor(0, clFuchsia);
  fColorArr[15] := AddColor(0, clAqua);
  fColorArr[16] := AddColor(0, clWhite);
  fColorArr[17] := AddColor(2, clWhite);

end.
