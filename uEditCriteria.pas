unit uEditCriteria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Menus, SynEditHighlighter,
  SynHighlighterSQL, ImgList, Placemnt, ActnList, SynEdit, DB, ADODB,
  Grids, DBGrids, ExtCtrls, uDBGridExt;

type
  TfrmEditCriteria = class(TForm)
    pcMain: TPageControl;
    tsPreference: TTabSheet;
    tsColumns: TTabSheet;
    alMethod: TActionList;
    aSearch: TAction;
    aNext: TAction;
    aBack: TAction;
    aLine: TAction;
    aSettings: TAction;
    aCopy: TAction;
    aSelectAll: TAction;
    fsCriteria: TFormStorage;
    imgSearch: TImageList;
    SynSQLSyn1: TSynSQLSyn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    dsColumns: TDataSource;
    qColumns: TADOQuery;
    grdColumns: TDBGrid;
    qColumnsposition: TFloatField;
    qColumnsname: TWideStringField;
    qColumnsalias: TWideStringField;
    qColumnsbase_class_id: TWideStringField;
    qColumnstarget_class_id: TWideStringField;
    qColumnsdata_precision: TFloatField;
    qColumnswidth: TFloatField;
    qColumnsdata_source: TWideStringField;
    qColumnsreference_id: TWideStringField;
    tvStruct: TTreeView;
    sTree: TSplitter;
    ilCriteria: TImageList;
    imgHeader: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    edHints: TEdit;
    Panel2: TPanel;
    pcEdits: TPageControl;
    tsCondition: TTabSheet;
    seCondition: TSynEdit;
    tsGroup: TTabSheet;
    seGroup: TSynEdit;
    tsOrder: TTabSheet;
    seOrder: TSynEdit;
    procedure aSearchExecute(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
    procedure aBackExecute(Sender: TObject);
    procedure aLineExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure grdColumnsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fCritId: string;
    function GetActiveEdit: TSynEdit;
  public
    { Public declarations }
    constructor Create(fConnect: TADOConnection; AOwner: TComponent; pIdCrit: string);
  end;

var
  frmEditCriteria: TfrmEditCriteria;

implementation

{$R *.dfm}

uses dlgSearchText, uLine, ClipBrd, uEditSetting, uShowAttrCrit;

function TfrmEditCriteria.GetActiveEdit: TSynEdit;
begin
  if pcEdits.ActivePage = tsCondition then
    Result := seCondition
  else if pcEdits.ActivePage = tsGroup then
    Result := seGroup
  else
    Result := seOrder;
end;

constructor TfrmEditCriteria.Create(fConnect: TADOConnection; AOwner: TComponent; pIdCrit: string);
var
  fSetting: TfrmEditSetting;
  fParent: TTreeNode;
  function GetImageIndex(pJoin: string): integer;
  begin
    if pJoin = 'REFERENCE' then
      Result := 2
    else if pJoin = 'COLLECTION' then
      Result := 3
    else if pJoin = 'CHILD' then
      Result := 4
    else if pJoin = 'JOIN_OUTER' then
      Result := 1
    else
      Result := 0;
  end;
  procedure AddChildsTree(pRoot: TTreeNode; pCode: string);
  var
    fNode: TTreeNode;
  begin
    with TADOQuery.Create(AOwner) do
    try
      Connection := frmEditCriteria.qColumns.Connection;
      SQL.Text := 'select * from criteria_tries cc where cc.criteria_id = :crit_id and cc.parent_key = :par_key';
      Parameters.ParamByName('crit_id').DataType := ftString;
      Parameters.ParamByName('crit_id').Value := pIdCrit;
      Parameters.ParamByName('par_key').DataType := ftString;
      Parameters.ParamByName('par_key').Value := pCode;
      Open;
      First;
      while not eof do
      begin
        fNode := tvStruct.Items.AddChild(pRoot,
                      FieldByName('NAME').AsString + '"(' + FieldByName('KEY').AsString + ')');
        fNode.ImageIndex := GetImageIndex(FieldByName('JOIN_TYPE').AsString);
        fNode.SelectedIndex := fNode.ImageIndex;
        AddChildsTree(fNode, FieldByName('KEY').AsString);
        Next;
      end;
    finally
      Close;
      Free;
    end;
  end;
begin
  frmEditCriteria := inherited Create(AOwner);
  try
    fSetting := TfrmEditSetting.Create(Self, SynSQLSyn1, nil, [seCondition, seGroup, seOrder], [], false);
    try
      fSetting.ApplySettings;
    finally
      FreeAndNil(fSetting);
    end;
  except
    on e: Exception do
      MessageDlg('Ошибка восстановления настроек:' + e.message, mtError, [mbOk], 0);
  end;
  fCritId := pIdCrit;
  // Код операции
  with TADOQuery.Create(Self) do
  try
    Connection := fConnect;
    SQL.Text := 'select ct.* from criteria ct where ct.id = :id_;';
    Parameters.ParamByName('id_').DataType := ftString;
    Parameters.ParamByName('id_').Value := pIdCrit;
    Open;
    if RecordCount > 0 then
    begin
      seCondition.Text := FieldByName('CONDITION').AsString;
      seGroup.Text := FieldByName('GROUP_BY').AsString;
      seOrder.Text := FieldByName('ORDER_BY').AsString;
      if Pos('|PlPlus|',FieldByName('PROPERTIES').AsString) > 0 then
      begin
        tsGroup.TabVisible := false;
        tsOrder.TabVisible := false;
        tsCondition.Caption := 'PLPlus';
        seCondition.Text := seCondition.Text + seOrder.Text + seGroup.Text;
        sTree.Visible := false;
        tvStruct.Visible := false;
        grdColumns.Align := alClient;
      end;
      seCondition.Gutter.DigitCount := Length(IntToStr(seCondition.Lines.Count));
      seGroup.Gutter.DigitCount := Length(IntToStr(seGroup.Lines.Count));
      seOrder.Gutter.DigitCount := Length(IntToStr(seOrder.Lines.Count));

      edHints.Text := FieldByName('HINTS').AsString;
    end;
  finally
    Close;
    Free;
  end;
  qColumns.Parameters.ParamByName('id_').DataType := ftString;
  qColumns.Parameters.ParamByName('id_').Value := pIdCrit;
  qColumns.Open;
  pcMain.ActivePageIndex := 0;
  pcEdits.ActivePageIndex := 0;

  if tvStruct.Visible then
    // Построем дерево отчета
    with TADOQuery.Create(AOwner) do
    try
      Connection := frmEditCriteria.qColumns.Connection;
      SQL.Text := 'select * from criteria_tries cc where cc.criteria_id = :crit_id and IIF(ISNULL(cc.parent_key),'''',cc.parent_key) = ''''';
      Parameters.ParamByName('crit_id').DataType := ftString;
      Parameters.ParamByName('crit_id').Value := pIdCrit;
      Open;
      First;
      while not eof do
      begin
        fParent := tvStruct.Items.Add(nil, FieldByName('NAME').AsString + '(' + FieldByName('KEY').AsString + ')');
        fParent.ImageIndex := GetImageIndex(FieldByName('JOIN_TYPE').AsString);
        fParent.SelectedIndex := fParent.ImageIndex;
        AddChildsTree(fParent, FieldByName('KEY').AsString);
        Next;
      end;
    finally
      Close;
      Free;
    end;
  fsCriteria.Active := true;
end;

procedure TfrmEditCriteria.aSearchExecute(Sender: TObject);
begin
  ShowSearchReplaceDialog(GetActiveEdit);
end;

procedure TfrmEditCriteria.aNextExecute(Sender: TObject);
begin
  DoSearchReplaceText(GetActiveEdit, FALSE);
end;

procedure TfrmEditCriteria.aBackExecute(Sender: TObject);
begin
  DoSearchReplaceText(GetActiveEdit, TRUE);
end;

procedure TfrmEditCriteria.aLineExecute(Sender: TObject);
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

procedure TfrmEditCriteria.aCopyExecute(Sender: TObject);
begin
  if Self.ActiveControl is DBGrids.TDBGrid then
    Clipboard.AsText := (Self.ActiveControl as DBGrids.TDBGrid).SelectedField.AsString
  else if Self.ActiveControl is TSynEdit then
    Clipboard.AsText := (Self.ActiveControl as TSynEdit).SelText
  else if Self.ActiveControl is TEdit then
    Clipboard.AsText := (Self.ActiveControl as TEdit).SelText
  else if Self.ActiveControl is TTreeView then
   Clipboard.AsText := (Self.ActiveControl as TTreeView).Selected.Text
end;

procedure TfrmEditCriteria.aSelectAllExecute(Sender: TObject);
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

procedure TfrmEditCriteria.aSettingsExecute(Sender: TObject);
var
  fForm: TfrmEditSetting;
begin
  try
    fForm := TfrmEditSetting.Create(Self, SynSQLSyn1, nil, [seCondition, seGroup, seOrder], [], false);
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

procedure TfrmEditCriteria.FormResize(Sender: TObject);
begin
  uDBGridExt.OnPanelResize(grdColumns, 1);
end;

procedure TfrmEditCriteria.grdColumnsDblClick(Sender: TObject);
var
  fForm: TfrmShowAttrCrit;
begin
  fForm := TfrmShowAttrCrit.Create(Self, fCritId,qColumns.FieldByName('position').AsInteger);
  try
    fForm.ShowModal;
  finally
    FreeAndNil(fForm);
  end;
end;

procedure TfrmEditCriteria.FormShow(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

end.
