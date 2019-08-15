unit uEditMethod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, SynEdit, SynEditHighlighter, SynHighlighterSQL,
  SynHighlighterVBScript, SynEditMiscClasses, SynEditSearch, ActnList,
  Menus, ImgList, SynEditRegexSearch, Placemnt, StdCtrls, ExtCtrls, Grids,
  DBGrids, DB, ADODB, Mask, ToolEdit, CurrEdit, uFormShow, uDBGridExt, uSourceFunc;

type
  TRadioButtonExt = class(TRadioButton)
    public
      id: string;
      procedure SetVisibles;
      procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
  end;
  TPanelExt = class(TPanel)
    public
      depend: string;
  end;
  TfrmEditMethod = class(TForm)
    pcMethod: TPageControl;
    tsPerference: TTabSheet;
    tsOper: TTabSheet;
    pcOper: TPageControl;
    tsExecute: TTabSheet;
    tsValidate: TTabSheet;
    tsPublic: TTabSheet;
    tsPrivate: TTabSheet;
    tsVBA: TTabSheet;
    SynSQLSyn1: TSynSQLSyn;
    seExecute: TSynEdit;
    seValidate: TSynEdit;
    sePublic: TSynEdit;
    sePrivate: TSynEdit;
    seVBA: TSynEdit;
    SynVBScriptSyn1: TSynVBScriptSyn;
    alMethod: TActionList;
    aSearch: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    imgSearch: TImageList;
    aNext: TAction;
    aBack: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    aLine: TAction;
    fsMethod: TFormStorage;
    pnlHeader: TPanel;
    pcPerference: TPageControl;
    tsParam: TTabSheet;
    tsVariable: TTabSheet;
    grdParam: TDBGrid;
    grdVariable: TDBGrid;
    qParam: TADOQuery;
    qVariable: TADOQuery;
    dsParam: TDataSource;
    dsVariable: TDataSource;
    qParamname: TStringField;
    qParamshort_name: TStringField;
    qParamclass_id: TStringField;
    qVariablename: TStringField;
    qVariableshort_name: TStringField;
    qVariableclass_id: TStringField;
    qParamdefval: TStringField;
    qVariabledefval2: TStringField;
    aCopy: TAction;
    aSelectAll: TAction;
    aShowForm: TAction;
    aSettings: TAction;
    N5: TMenuItem;
    imgHeader: TImageList;
    pnlTeal: TPanel;
    btnClose: TButton;
    btnForm: TButton;
    pnlName: TPanel;
    edName: TEdit;
    edResult: TEdit;
    edShort: TEdit;
    edType: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnlMain: TPanel;
    procedure aSearchExecute(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
    procedure aBackExecute(Sender: TObject);
    procedure aBackUpdate(Sender: TObject);
    procedure aLineExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aSelectAllExecute(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure aShowFormExecute(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure seExecuteChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure seValidateChange(Sender: TObject);
    procedure sePublicChange(Sender: TObject);
    procedure sePrivateChange(Sender: TObject);
    procedure seVBAChange(Sender: TObject);
  private
    { Private declarations }
    fMethId: String;
    fReadOnly: boolean;
    fForm: TFormShow;
    function GetActiveEdit: TSynEdit;
  public
    fHaveBody:      boolean;
    fHaveValidate:  boolean;
    fHaveGlobal:    boolean;
    fHaveLocal:     boolean;
    fHaveVBA:     boolean;

    { Public declarations }
    constructor CreateMeth(pConnect: TADOConnection; AOwner: TComponent; pMethId : string; pName, pAttr, pSelfClass, pResult: string; pReadOnly: boolean; pSources: TSourceFunc);
  end;

var
  frmEditMethod: TfrmEditMethod;

implementation

{$R *.dfm}

uses dlgSearchText, SynEditTypes, uLine, ClipBrd, uEditSetting;

constructor TfrmEditMethod.CreateMeth(pConnect: TADOConnection; AOwner: TComponent; pMethId : string; pName, pAttr, pSelfClass, pResult: string; pReadOnly: boolean; pSources: TSourceFunc);
var
  k: integer;
  fSetting: TfrmEditSetting;
  fSrc: TSource;
  procedure setTab(p_tab: TTabSheet; p_edit: TSynEdit);
  var
    cntNum: integer;
  begin
    cntNum := p_edit.Lines.Count;
    p_edit.ReadOnly := fReadOnly;
    if cntNum = 0 then
      p_tab.TabVisible := false
    else
      p_edit.Gutter.DigitCount := Length(IntToStr(cntNum));
  end;
begin
  frmEditMethod := inherited Create(AOwner);
  try
    fSetting := TfrmEditSetting.Create(Self, SynSQLSyn1, SynVBScriptSyn1, [seExecute, seValidate, sePublic, sePrivate], [seVBA], pcOper.ActivePage = tsVBA);
    try
      fSetting.ApplySettings;
    finally
      FreeAndNil(fSetting);
    end;
  except
    on e: Exception do
      MessageDlg('Ошибка восстановления настроек:' + e.message, mtError, [mbOk], 0);
  end;

  fsMethod.Active := true;
  fMethId := pMethId;
  fReadOnly := pReadOnly;
  fHaveBody := false;
  fHaveValidate := false;
  fHaveGlobal := false;
  fHaveLocal := false;
  fHaveVBA := false;
  pcOper.ActivePageIndex := 0;
  pcMethod.ActivePageIndex := 0;
  pcPerference.ActivePageIndex := 0;

  // Короткая информация
  edName.Text := pName;
  edShort.Text := pAttr;
  edType.Text := pSelfClass;
  edResult.Text := pResult;
  // Параметры и переменные
  qParam.Close;
  qParam.Parameters.ParamByName('meth').DataType := ftString;
  qParam.Parameters.ParamByName('meth').Value := pMethId;
  qParam.Open;
  if qParam.RecordCount = 0 then
    qParam.Close;
  qVariable.Close;
  qVariable.Parameters.ParamByName('meth').DataType := ftString;
  qVariable.Parameters.ParamByName('meth').Value := pMethId;
  qVariable.Open;
  if qVariable.RecordCount = 0 then
    qVariable.Close;
  // Код операции
  with TADOQuery.Create(Self) do
  try
    Connection := pConnect;
    SQL.Text := 'select sl.type, sl.text from sources_long sl where sl.method_id = :id;';
    Parameters.ParamByName('id').DataType := ftString;
    Parameters.ParamByName('id').Value := fMethId;
    Open;
    First;
    for k:=0 to RecordCount-1 do
    begin
      if FieldByName('type').AsString = 'EXECUTE' then
        seExecute.Text := FieldByName('text').AsString
      else if FieldByName('type').AsString = 'VALIDATE' then
        seValidate.Text := FieldByName('text').AsString
      else if FieldByName('type').AsString = 'PUBLIC' then
        sePublic.Text := FieldByName('text').AsString
      else if FieldByName('type').AsString = 'PRIVATE' then
        sePrivate.Text := FieldByName('text').AsString
      else if ((FieldByName('type').AsString = 'VBSSCRIPT') or
              (FieldByName('type').AsString = 'VBSCRIPT')) then
        seVBA.Text := FieldByName('text').AsString;
      Next;
    end;
  finally
    Close;
    Free;
  end;

  // Если были редактирования
  if pSources.GetSource(fMethId, 'EXECUTE', fSrc) then
    seExecute.Text := fSrc.fNewSource;
  if pSources.GetSource(fMethId, 'VALIDATE', fSrc) then
    seValidate.Text := fSrc.fNewSource;
  if pSources.GetSource(fMethId, 'PUBLIC', fSrc) then
    sePublic.Text := fSrc.fNewSource;
  if pSources.GetSource(fMethId, 'PRIVATE', fSrc) then
    sePrivate.Text := fSrc.fNewSource;
  if pSources.GetSource(fMethId, 'VBSCRIPT', fSrc) then
    seVBA.Text := fSrc.fNewSource;

  setTab(tsExecute, seExecute);
  setTab(tsValidate, seValidate);
  setTab(tsPublic, sePublic);
  setTab(tsPrivate, sePrivate);
  setTab(tsVBA, seVBA);

  tsOper.TabVisible := tsExecute.TabVisible or tsValidate.TabVisible or
    tsPublic.TabVisible or tsPrivate.TabVisible or tsVBA.TabVisible;
end;

procedure TfrmEditMethod.aSearchExecute(Sender: TObject);
begin
  ShowSearchReplaceDialog(GetActiveEdit);
end;

procedure TfrmEditMethod.aNextExecute(Sender: TObject);
begin
  DoSearchReplaceText(GetActiveEdit, FALSE);
end;

procedure TfrmEditMethod.aBackExecute(Sender: TObject);
begin
  DoSearchReplaceText(GetActiveEdit, TRUE);
end;

procedure TfrmEditMethod.aBackUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := gsSearchText <> '';
end;

function TfrmEditMethod.GetActiveEdit: TSynEdit;
begin
  if pcOper.ActivePage = tsExecute then
    Result := seExecute
  else if pcOper.ActivePage = tsValidate then
    Result := seValidate
  else if pcOper.ActivePage = tsPublic then
    Result := sePublic
  else if pcOper.ActivePage = tsPrivate then
    Result := sePrivate
  else if pcOper.ActivePage = tsVBA then
    Result := seVBA
  else
    Result := seExecute;
end;

procedure TfrmEditMethod.aLineExecute(Sender: TObject);
var
  fForm: TfrmLine;
  fActive: TSynEdit;
begin
  fForm := TfrmLine.Create(self);
  try
    fActive := GetActiveEdit;
    fForm.setRange(fActive.Lines.Count);
    if fForm.ShowModal = mrOk then
    begin
      fActive.CaretX := 1;
      fActive.CaretY := fForm.fResult;
    end;
  finally
    FreeAndNil(fForm);
  end;
end;

procedure TfrmEditMethod.FormResize(Sender: TObject);
begin
  uDBGridExt.OnPanelResize(grdParam);
  uDBGridExt.OnPanelResize(grdVariable);
end;

procedure TfrmEditMethod.aCopyExecute(Sender: TObject);
begin
  if Self.ActiveControl is DBGrids.TDBGrid then
    Clipboard.AsText := (Self.ActiveControl as DBGrids.TDBGrid).SelectedField.AsString
  else if Self.ActiveControl is TSynEdit then
    Clipboard.AsText := (Self.ActiveControl as TSynEdit).SelText
  else if Self.ActiveControl is TEdit then
    Clipboard.AsText := (Self.ActiveControl as TEdit).SelText;
end;

procedure TfrmEditMethod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fForm <> nil then
    fForm.Free;
end;

procedure TfrmEditMethod.aSelectAllExecute(Sender: TObject);
begin
  if Self.ActiveControl is TSynEdit then
  begin
    (Self.ActiveControl as TSynEdit).SelStart := 0;
    (Self.ActiveControl as TSynEdit).SelEnd := Length((Self.ActiveControl as TSynEdit).Text);
  end else if Self.ActiveControl is TEdit then
  begin
    (Self.ActiveControl as TEdit).SelStart := 0;
    (Self.ActiveControl as TEdit).SelLength := Length((Self.ActiveControl as TEdit).Text);
  end;
end;

procedure TfrmEditMethod.btnCloseClick(Sender: TObject);
begin
  frmEditMethod.Close;
end;

procedure TfrmEditMethod.aShowFormExecute(Sender: TObject);
const
  querySelect = 'select cl.id, cl.control, cl.top, cl.left, cl.height, cl.width, cl.caption, cl.parent, cl.tab_index, cl.validate_name, cl.depend, cl.class_id from controls cl where cl.meth_id = :meth';
  twinsToPoint = 15;
var
  i: integer;
  fVariants: array of TRadioButtonExt;
  procedure CreateObjForm(p_id: string; p_control: string; p_top, p_left, p_height, p_width: integer; p_caption, p_validate_name: string; p_tab_index: integer; p_depend: string; p_class_id: string; p_parent: TComponent);
  var
    fNewObj: TComponent;
    function SetPropertiesNewObj(pNew: TComponent; pParent: TWinControl): TComponent;
    begin
      //pNew.Name := p_validate_name;
      if pNew is TWinControl then
        (pNew as TWinControl).TabOrder := p_tab_index;
      if pNew is TControl then
        with pNew as TControl do
        begin
          Top := p_top;
          Left := p_left;
          Height := p_height;
          Width := p_width;
          Parent := pParent;
        end;
      Result := pNew;
    end;
  begin
    fNewObj := nil;
    // Создаем текущий элемент
    if p_id <> '' then
    begin
      if ((p_control = 'FORM') or (p_control = 'MEMO')) and (p_parent is TPageControl) then
      begin
        fNewObj := TTabSheet.Create((p_parent as TPageControl));
        with fNewObj as TTabSheet do
        begin
          PageControl := (p_parent as TPageControl);
          Caption := p_caption;
          Font.Size := 10;
          Height := p_height;
          Width := p_width;
        end;
        if (p_control = 'MEMO') then
        begin
           with TMemo.Create(fForm) do
           begin
              Name := p_validate_name;
              TabOrder := p_tab_index;
              Parent := (fNewObj as TTabSheet);
              Align := alClient;
           end;
        end;
        with p_parent as TPageControl do
        begin
          if (p_parent as TPageControl).Width < p_width+8 then
            (p_parent as TPageControl).Width := p_width+8;
          if (p_parent as TPageControl).Height < p_height+29 then
            (p_parent as TPageControl).Height := p_height+29;
        end;
      end else if (p_control = 'SUBFORM') and (p_parent is TTabSheet) then
      begin
        fNewObj := TTabSheet.Create((p_parent as TTabSheet).PageControl);
        with fNewObj as TTabSheet do
        begin
          PageControl := (p_parent as TTabSheet).PageControl;
          Caption := p_caption;
          Font.Size := 10;
          Height := p_height;
          Width := p_width;
          Name := p_validate_name;
          TabOrder := p_tab_index;
        end;
      end else if (p_control = 'LABEL') and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TPanel.Create(fForm), (p_parent as TWinControl));
        (fNewObj as TPanel).Caption := '';
        (fNewObj as TPanel).BevelOuter := bvLowered;
        fNewObj := SetPropertiesNewObj(TLabel.Create(fForm), (fNewObj as TPanel));
        (fNewObj as TLabel).Caption := p_caption;
        (fNewObj as TLabel).Font.Size := 10;
        (fNewObj as TLabel).Left := 1;
        (fNewObj as TLabel).Top := trunc((((fNewObj as TLabel).Parent as TPanel).Height - (fNewObj as TLabel).Height) / 2);

      end else if (p_control = 'NUMBER') and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TRxCalcEdit.Create(fForm), (p_parent as TWinControl));
      end else if ((p_control = 'TEXT') or (p_control = 'OLE')) and (p_parent is TWinControl) then
      begin
        if p_class_id = 'FILE$MASK' then
        begin
          fNewObj := SetPropertiesNewObj(TButton.Create(fForm), (p_parent as TWinControl));
          (fNewObj as TButton).Caption := p_caption;
          (fNewObj as TButton).Font.Size := 10;
        end else
        begin
          fNewObj := SetPropertiesNewObj(TEdit.Create(fForm), (p_parent as TWinControl));
          if p_control = 'OLE' then
            (fNewObj as TEdit).Text := 'Оле'
          else
            (fNewObj as TEdit).Text := 'Строка текста'
        end;
      end else if (p_control = 'DATE') and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TDateEdit.Create(fForm), (p_parent as TWinControl));
      end else if (p_control = 'DEPEND') and (p_parent is TWinControl) then
      begin
        if (p_parent is TButton) then
          fNewObj := SetPropertiesNewObj(TEdit.Create(fForm), (p_parent as TButton).Parent)
        else
          fNewObj := SetPropertiesNewObj(TEdit.Create(fForm), (p_parent as TWinControl));
      end else if ((p_control = 'BUTTON') or (p_control = 'OBJECT') or (p_control = 'ARRAY') or (p_control = 'BTNOLE') or (p_control = 'TABLE')) and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TButton.Create(fForm), (p_parent as TWinControl));
        (fNewObj as TButton).Caption := p_caption;
        (fNewObj as TButton).Font.Size := 10;
      end else if (p_control = 'CHECK') and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TCheckBox.Create(fForm), (p_parent as TWinControl));
        (fNewObj as TCheckBox).Caption := p_caption;
        (fNewObj as TCheckBox).Font.Size := 10;
      end else if (p_control = 'COMBO') and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TComboBox.Create(fForm), (p_parent as TWinControl));
        (fNewObj as TComboBox).Text := p_caption;
        (fNewObj as TComboBox).Font.Size := 10;
      end else if (p_control = 'MEMO') and (not (p_parent is TPageControl)) and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TMemo.Create(fForm), (p_parent as TWinControl));
        (fNewObj as TMemo).Text := p_caption;
        (fNewObj as TMemo).Font.Size := 10;
      end else if (p_control = 'TABBED') and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TPageControl.Create(fForm), (p_parent as TWinControl));
      end else if (p_control = 'FRAME') and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TGroupBox.Create(fForm), (p_parent as TWinControl));
        (fNewObj as TGroupBox).Caption := p_caption;
        (fNewObj as TGroupBox).Font.Size := 10;
      end else if (p_control = 'PANEL') and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TPanelExt.Create(fForm), (p_parent as TWinControl));
        (fNewObj as TPanelExt).Visible := false;
        (fNewObj as TPanelExt).depend := p_depend;
        (fNewObj as TPanelExt).Caption := '';
        (fNewObj as TPanelExt).BevelOuter := bvLowered;
      end else if (p_control = 'VARIANT') and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TRadioButtonExt.Create(fForm), (p_parent as TWinControl));
        (fNewObj as TRadioButtonExt).Caption := p_caption;
        (fNewObj as TRadioButtonExt).Font.Size := 10;
        (fNewObj as TRadioButtonExt).id := p_id;
        SetLength(fVariants,Length(fVariants)+1);
        fVariants[Length(fVariants)-1] := (fNewObj as TRadioButtonExt);
      end else if (p_control = 'GRID') and (p_parent is TWinControl) then
      begin
        fNewObj := SetPropertiesNewObj(TStringGrid.Create(fForm), (p_parent as TWinControl));
        with fNewObj as TStringGrid do
        begin
          RowCount := 2;
          ColCount := 1;
          FixedRows := 1;
          FixedCols := 0;
          Font.Size := 10;
          DefaultRowHeight := 20;
        end;
      end else if (p_control = 'GRIDCOL') and (p_parent is TStringGrid) then
      begin
        fNewObj := nil;
        with p_parent as TStringGrid do
        begin
          if p_left = 0 then
          begin
            ColWidths[0] := p_width;
            Cells[0,0] := p_caption;
          end else
          begin
            ColCount := ColCount + 1;
            ColWidths[ColCount-1] := p_width;
            Cells[ColCount-1,0] := p_caption;
          end;
        end;
      end else if (p_control = 'LINE') then
      begin
        fForm.AddLine(p_left,p_top,p_width,p_height,(p_parent as TWinControl));
      end else
      begin
        MessageDlg('Не предусмотренная ситуация при создании элемента: ' + p_id, mtError, [mbOk], 0);
      end;
    end;
    // Дочки
    if Assigned(fNewObj) or (p_id = '') then
      with TADOQuery.Create(self) do
      try
        Connection := qParam.Connection;
        SQL.Text := querySelect;
        if p_id <> '' then
        begin
          SQL.Text := SQL.Text + ' and parent = :id order by switch(cl.control = ''GRIDCOL'',cl.left, 1=1, 10000 - cl.[position])';
          Parameters.ParamByName('id').DataType := ftString;
          Parameters.ParamByName('id').Value := p_id;
        end else
          SQL.Text := SQL.Text + ' and parent = '''' order by cl.[position] desc';
        Parameters.ParamByName('meth').DataType := ftString;
        Parameters.ParamByName('meth').Value := fMethId;
        Open;
        First;
        while not eof do
        begin
          if p_id = '' then
            CreateObjForm(FieldByName('id').AsString,
                          FieldByName('control').AsString,
                          trunc(FieldByName('top').AsInteger/twinsToPoint),
                          trunc(FieldByName('left').AsInteger/twinsToPoint),
                          trunc(FieldByName('height').AsInteger/twinsToPoint),
                          trunc(FieldByName('width').AsInteger/twinsToPoint),
                          FieldByName('caption').AsString,
                          FieldByName('validate_name').AsString,
                          FieldByName('tab_index').AsInteger,
                          FieldByName('depend').AsString,
                          FieldByName('class_id').AsString,
                          p_parent)
          else
            CreateObjForm(FieldByName('id').AsString,
                          FieldByName('control').AsString,
                          trunc(FieldByName('top').AsInteger/twinsToPoint),
                          trunc(FieldByName('left').AsInteger/twinsToPoint),
                          trunc(FieldByName('height').AsInteger/twinsToPoint),
                          trunc(FieldByName('width').AsInteger/twinsToPoint),
                          FieldByName('caption').AsString,
                          FieldByName('validate_name').AsString,
                          FieldByName('tab_index').AsInteger,
                          FieldByName('depend').AsString,
                          FieldByName('class_id').AsString,
                          fNewObj);
          Next;
        end;
      finally
        Free;
      end;
  end;
begin
  fForm := TFormShow.Create(nil);

  CreateObjForm('','', 0, 0, 0, 0, '', '', 0,'0','',fForm.pcMain);
  if (fForm.pcMain.Width = 0) and (fForm.pcMain.Height = 0) then
    FreeAndNil(fForm)
  else
  begin
    fForm.ClientWidth := fForm.pcMain.Width;
    fForm.ClientHeight := fForm.pcMain.Height;
    for i:=0 to Length(fVariants)-1 do
    begin
      fVariants[i].SetVisibles;
      fVariants[i].Checked := true;
    end;
    fForm.Caption := fForm.Caption + ' [' + edShort.Text + ']';
    fForm.Show;
    fForm.paintLines;
  end;
end;

procedure TRadioButtonExt.SetVisibles;
var
  i : integer;
begin
  if parent is TGroupBox then
  begin
    for i := 0 to (parent as TGroupBox).ControlCount-1 do
      if ((parent as TGroupBox).Controls[i] is TPanelExt) then
        (parent as TGroupBox).Controls[i].Visible := ((parent as TGroupBox).Controls[i] as TPanelExt).depend = id;
  end;
end;

procedure TRadioButtonExt.WMLButtonDown(var Message: TWMLButtonDown);
begin
  inherited;
  SetVisibles;
end;

procedure TfrmEditMethod.aSettingsExecute(Sender: TObject);
var
  fForm: TfrmEditSetting;
begin
  try
    fForm := TfrmEditSetting.Create(Self, SynSQLSyn1, SynVBScriptSyn1, [seExecute, seValidate, sePublic, sePrivate], [seVBA], pcOper.ActivePage = tsVBA);
    try
      if fForm.ShowModal = mrOk then
        fForm.ApplySettings;
    finally
      FreeAndNil(fForm);
    end;
  except
    on E: Exception do
      MessageDlg('Ошибка восстановления настроек: ' + e.Message, mtError, [mbOk], 0);
  end;
end;

procedure TfrmEditMethod.FormShow(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

procedure TfrmEditMethod.seExecuteChange(Sender: TObject);
begin
  fHaveBody := true;
end;

procedure TfrmEditMethod.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := true;
  ModalResult := mrNo;
  if fHaveBody or fHaveValidate or fHaveGlobal or fHaveLocal or fHaveVBA then
  begin
    ModalResult := MessageDlg('Были изменения, сохранить их?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if ModalResult = mrCancel then
      CanClose := false;
  end;
end;

procedure TfrmEditMethod.seValidateChange(Sender: TObject);
begin
  fHaveValidate := true;
end;

procedure TfrmEditMethod.sePublicChange(Sender: TObject);
begin
  fHaveGlobal := true;
end;

procedure TfrmEditMethod.sePrivateChange(Sender: TObject);
begin
  fHaveLocal := true;
end;

procedure TfrmEditMethod.seVBAChange(Sender: TObject);
begin
  fHaveVBA := true;
end;

end.
