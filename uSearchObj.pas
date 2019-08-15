unit uSearchObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Placemnt, ADODB;

const
  selAttr = 'select ca.class_id, ca.name, ca.attr_id as short_name, ''Реквизит'' as id_type, '''' as id from class_attributes ca';
  selMeth = 'select m.class_id, m.name, m.short_name, ''Операция'' as id_type, m.id from methods m';
  selCrit = 'select cr.class_id, cr.name, cr.short_name, ''Представление'' as id_type, cr.id from criteria cr';
  selType = 'select cl.id as class_id, cl.name, cl.id as short_name, ''Тип'' as id_type, '''' as id from classes cl';
  selOpers = 'select cl.id as class_id, m.name, m.short_name, sl.type as id_type, m.id, mid(sl.text,1,255) as text_search, cl.name as class_name' +
             ' from sources_long sl, methods m, classes cl where m.id = sl.method_id and cl.id = m.class_id and instr(sl.text,:txt) > 0';

type
  TfrmSearchObj = class(TForm)
    Label1: TLabel;
    cbSearch: TComboBox;
    btnSearch: TButton;
    btnCancel: TButton;
    pcSearch: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    cbType: TCheckBox;
    cbAttr: TCheckBox;
    cbMeth: TCheckBox;
    cbCrit: TCheckBox;
    GroupBox2: TGroupBox;
    rbName: TRadioButton;
    rbShort: TRadioButton;
    Label2: TLabel;
    cbLike: TComboBox;
    GroupBox3: TGroupBox;
    cbTextMeth: TCheckBox;
    GroupBox4: TGroupBox;
    rbAll: TRadioButton;
    rbCurSub: TRadioButton;
    rbCur: TRadioButton;
    fsSearch: TFormStorage;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function GetSearchTextHistory: string;
    procedure SetSearchTextHistory(Value: string);
    function GetSearchText: string;
    procedure SetSearchText(Value: string);
  public
    { Public declarations }
    function getQuerySelect: string;
    function getQuerySelectText: string;
    function getFilterTxt: string;
    property SearchTextHistory: string read GetSearchTextHistory
      write SetSearchTextHistory;
    property SearchText: string read GetSearchText
      write SetSearchText;
    function getSearchInMeth: boolean;
    function getNeedClass: boolean;
  end;

var
  frmSearchObj: TfrmSearchObj;

implementation

{$R *.dfm}

function TfrmSearchObj.getQuerySelect: string;
var
  colComp, filComp: string;
  procedure AddText(pText: string);
  begin
    if Result <> '' then
      Result := Result + ' union all ';
    Result := Result + pText;
  end;
begin
  Result := '';
  // В каких таблицах искать
  if cbType.Checked then
    AddText(selType);
  if cbAttr.Checked then
    AddText(selAttr);
  if cbMeth.Checked then
    AddText(selMeth);
  if cbCrit.Checked then
    AddText(selCrit);
  // Длинное или короткое наименование
  filComp := '';
  if rbName.Checked then
    colComp := 'tmp.name'
  else
    colComp := 'tmp.short_name';

  if cbLike.ItemIndex in [1,2] then
    filComp := colComp + ' like ''%'' + '
  else
    filComp := colComp + ' like ';

  filComp := filComp + ':txt';

  if cbLike.ItemIndex in [0,1] then
    filComp := filComp + ' + ''%''';

  if rbCur.Checked then
    filComp := filComp + ' and :p_class = cl1.id'
  else if rbCurSub.Checked then
    filComp := filComp + ' and :p_class in (cl1.id,cl1.parent_id)';

  Result := 'select tmp.*, ' + colComp + ' as text_search, cl1.name as class_name from (' + Result + ') tmp, classes cl1 where cl1.id = tmp.class_id and ' + filComp;
end;

function TfrmSearchObj.getQuerySelectText: string;
begin
  Result := selOpers;
  if rbCur.Checked then
    Result := Result + ' and :p_class = cl.id'
  else if rbCurSub.Checked then
    Result := Result + ' and :p_class in (cl.id,cl.parent_id)';
end;

procedure TfrmSearchObj.FormCreate(Sender: TObject);
begin
  pcSearch.ActivePageIndex := 0;
  fsSearch.Active := true;
end;

procedure TfrmSearchObj.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  s: string;
  i: integer;
begin
  if cbSearch.Text = '' then
  begin
    MessageDlg('Не задан текст для поиска', mtWarning, [mbOk], 0);
    cbSearch.SetFocus;
    ModalResult := mrNone;
  end;
  if not cbType.Checked and
     not cbAttr.Checked and
     not cbMeth.Checked and
     not cbCrit.Checked and
     not cbTextMeth.Checked then
  begin
    MessageDlg('Не выбраны объекты для поиска', mtWarning, [mbOk], 0);
    cbType.SetFocus;
    ModalResult := mrNone;
  end;

  if ModalResult = mrOK then begin
    s := cbSearch.Text;
    if s <> '' then begin
      i := cbSearch.Items.IndexOf(s);
      if i > -1 then begin
        cbSearch.Items.Delete(i);
        cbSearch.Items.Insert(0, s);
        cbSearch.Text := s;
      end else
        cbSearch.Items.Insert(0, s);
    end;
  end;
end;

function TfrmSearchObj.getFilterTxt: string;
begin
  Result := StringReplace(cbSearch.Text,'_','[_]', [rfReplaceAll]);
end;

function TfrmSearchObj.GetSearchTextHistory: string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to cbSearch.Items.Count - 1 do begin
    if i >= 10 then
      break;
    if i > 0 then
      Result := Result + #13#10;
    Result := Result + cbSearch.Items[i];
  end;
end;

procedure TfrmSearchObj.SetSearchTextHistory(Value: string);
begin
  cbSearch.Items.Text := Value;
end;

function TfrmSearchObj.GetSearchText: string;
begin
  Result := cbSearch.Text;
end;

procedure TfrmSearchObj.SetSearchText(Value: string);
begin
  cbSearch.Text := Value;
end;

function TfrmSearchObj.getSearchInMeth: boolean;
begin
  Result := cbTextMeth.Checked;
end;

function TfrmSearchObj.getNeedClass: boolean;
begin
  Result := not rbAll.Checked;
end;

end.
