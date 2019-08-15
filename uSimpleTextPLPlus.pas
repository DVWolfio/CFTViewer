unit uSimpleTextPLPlus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SynEdit, Menus, ActnList, ImgList, SynEditHighlighter,
  SynHighlighterSQL, uClass, StdCtrls, Placemnt, ADODB, DB;

type
  TfrmSimpleTextPLPlus = class(TForm)
    pnlTrigger: TPanel;
    seText: TSynEdit;
    alMethod: TActionList;
    aSearch: TAction;
    aNext: TAction;
    aBack: TAction;
    aLine: TAction;
    aSettings: TAction;
    imgSearch: TImageList;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    SynSQLSyn1: TSynSQLSyn;
    aCopy: TAction;
    aSelectAll: TAction;
    GroupBox1: TGroupBox;
    rbBefore: TRadioButton;
    rbAfter: TRadioButton;
    GroupBox2: TGroupBox;
    rbRow: TRadioButton;
    rbArrayRows: TRadioButton;
    GroupBox3: TGroupBox;
    cbInsert: TCheckBox;
    cbEdit: TCheckBox;
    cbDelete: TCheckBox;
    Label1: TLabel;
    edCols: TEdit;
    fsSimple: TFormStorage;
    procedure aSearchExecute(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
    procedure aBackExecute(Sender: TObject);
    procedure aBackUpdate(Sender: TObject);
    procedure aLineExecute(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(fConnect: TADOConnection; AOwner: TComponent; pClass, pName: string; pType: TTypeObj);
  end;

var
  frmSimpleTextPLPlus: TfrmSimpleTextPLPlus;

implementation

{$R *.dfm}

uses dlgSearchText, uLine, uEditSetting, ClipBrd;

constructor TfrmSimpleTextPLPlus.Create(fConnect: TADOConnection; AOwner: TComponent; pClass, pName: string; pType: TTypeObj);
var
  fSetting: TfrmEditSetting;
begin
  frmSimpleTextPLPlus := inherited Create(AOwner);
  try
    fSetting := TfrmEditSetting.Create(Self, SynSQLSyn1, nil, [seText], [], false);
    try
      fSetting.ApplySettings;
    finally
      FreeAndNil(fSetting);
    end;
  except
    on e: Exception do
      MessageDlg('Ошибка восстановления настроек:' + e.message, mtError, [mbOk], 0);
  end;
  pnlTrigger.Visible := pType = toTrigger;
  // Код операции
  with TADOQuery.Create(Self) do
  try
    Connection := fConnect;
    if pType = toView then
    begin
      SQL.Text := 'select ct.* from VIEWS_TEXT ct where ct.name = :name;';
    end else
    begin
      if pType = toTrigger then
      begin
        SQL.Text := 'select ct.* from class_triggers ct where ct.class_id = :id_class and ct.name = :name;';
      end else
      begin
        SQL.Text := 'select ct.* from class_constraints ct where ct.class_id = :id_class and ct.name = :name;';
      end;
      Parameters.ParamByName('id_class').DataType := ftString;
      Parameters.ParamByName('id_class').Value := pClass;
    end;
    Parameters.ParamByName('name').DataType := ftString;
    Parameters.ParamByName('name').Value := pName;
    Open;
    if RecordCount > 0 then
    begin
      seText.Text := FieldByName('TEXT').AsString;
      seText.Gutter.DigitCount := Length(IntToStr(seText.Lines.Count));
      if pType = toTrigger then
      begin
        edCols.Text := FieldByName('LIST').AsString;
        cbInsert.Checked := Pos('INSERT', FieldByName('EVENT').AsString) > 0;
        cbEdit.Checked := Pos('UPDATE', FieldByName('EVENT').AsString) > 0;
        cbDelete.Checked := Pos('DELETE', FieldByName('EVENT').AsString) > 0;
        rbBefore.Checked := Pos('BEFORE', FieldByName('TYPE').AsString) > 0;
        rbAfter.Checked := Pos('AFTER', FieldByName('TYPE').AsString) > 0;
        rbRow.Checked := Pos('EACH ROW', FieldByName('TYPE').AsString) > 0;
        rbArrayRows.Checked := not rbRow.Checked;
      end;
    end;
  finally
    Close;
    Free;
  end;
  fsSimple.Active := true;
end;

procedure TfrmSimpleTextPLPlus.aSearchExecute(Sender: TObject);
begin
  ShowSearchReplaceDialog(seText);
end;

procedure TfrmSimpleTextPLPlus.aNextExecute(Sender: TObject);
begin
  DoSearchReplaceText(seText, FALSE);
end;

procedure TfrmSimpleTextPLPlus.aBackExecute(Sender: TObject);
begin
  DoSearchReplaceText(seText, TRUE);
end;

procedure TfrmSimpleTextPLPlus.aBackUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := gsSearchText <> '';
end;

procedure TfrmSimpleTextPLPlus.aLineExecute(Sender: TObject);
var
  fForm: TfrmLine;
begin
  fForm := TfrmLine.Create(self);
  try
    fForm.setRange(seText.Lines.Count);
    if fForm.ShowModal = mrOk then
    begin
      seText.CaretX := 1;
      seText.CaretY := fForm.fResult;
    end;
  finally
    FreeAndNil(fForm);
  end;
end;

procedure TfrmSimpleTextPLPlus.aSettingsExecute(Sender: TObject);
var
  fForm: TfrmEditSetting;
begin
  try
    fForm := TfrmEditSetting.Create(Self, SynSQLSyn1, nil, [seText], [], false);
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

procedure TfrmSimpleTextPLPlus.aCopyExecute(Sender: TObject);
begin
  if Self.ActiveControl is TSynEdit then
    Clipboard.AsText := (Self.ActiveControl as TSynEdit).SelText;
end;

procedure TfrmSimpleTextPLPlus.aSelectAllExecute(Sender: TObject);
begin
  if Self.ActiveControl is TSynEdit then
  begin
    (Self.ActiveControl as TSynEdit).SelStart := 0;
    (Self.ActiveControl as TSynEdit).SelEnd := Length((Self.ActiveControl as TSynEdit).Text);
  end;
end;

procedure TfrmSimpleTextPLPlus.FormShow(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

end.
