unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, DB, ADODB, Menus, ExtCtrls, Grids, ToolWin,
  ComCtrls, ImgList, DBGrids, DBCtrls, Placemnt, uEditMethod, uWait, SyncObjs,
  uClass, ComObj, uStructMDB, uRenameFunc, consts, uDBGridExt, AppEvnts, JCLDebug,
  uSourceFunc;

type
  TDBGrid = class(uDBGridExt.TDBGrid)
    protected
      procedure DrawCell (ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  end;
  TfrmMain = class(TForm)
    alMain: TActionList;
    aLoadFile: TAction;
    acMain: TADOConnection;
    Splitter1: TSplitter;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    aClose: TAction;
    imgMain: TImageList;
    sbMain: TStatusBar;
    qClasses: TADOQuery;
    odMDB: TOpenDialog;
    MDB1: TMenuItem;
    N2: TMenuItem;
    tvClasses: TTreeView;
    dsClasses: TDataSource;
    qItems: TADOQuery;
    qItemsname: TStringField;
    qItemsattr_id: TStringField;
    qItemsself_class_id: TStringField;
    dsItems: TDataSource;
    qItemsid_type: TStringField;
    tbMain: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    aShowAttribute: TAction;
    aShowMethods: TAction;
    aShowCriteria: TAction;
    aRefresh: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    pnlItems: TPanel;
    grdItems: TDBGrid;
    fsMain: TFormStorage;
    qItemsid: TStringField;
    aEditMeth: TAction;
    pmItems: TPopupMenu;
    N3: TMenuItem;
    qItemsresult_class_id: TStringField;
    aCopyShort: TAction;
    pnlSearch: TPanel;
    pnlMain: TPanel;
    splSearch: TSplitter;
    dsSearch: TDataSource;
    qSearch: TADOQuery;
    aSearch: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    qSearchclass_id: TStringField;
    qSearchname: TStringField;
    qSearchshort_name: TStringField;
    qSearchid_type: TStringField;
    qSearchid: TStringField;
    pcSearch: TPageControl;
    tsSearchMain: TTabSheet;
    grdSearch: TDBGrid;
    tsSearchText: TTabSheet;
    qSearchtext: TStringField;
    qSearchclass_name: TStringField;
    qTextSearch: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    dsTextSearch: TDataSource;
    grdTextSearch: TDBGrid;
    btnCloseSearch: TButton;
    ppSearch: TPopupMenu;
    aGoto: TAction;
    N5: TMenuItem;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    aExport: TAction;
    aSaveExp: TAction;
    aRename: TAction;
    aCheck: TAction;
    aDelCheck: TAction;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ilStateCheck: TImageList;
    pnlAll: TPanel;
    odSaveMDB: TSaveDialog;
    acSaveMDB: TADOConnection;
    tDelayChangeClass: TTimer;
    ilStateDel: TImageList;
    tTotalmemory: TTimer;
    aDebug: TAction;
    aReopen: TAction;
    aDebugClose: TAction;
    N6: TMenuItem;
    aSelectAllClass: TAction;
    aDeSelectAllClass: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    tbItems: TToolBar;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    aSelectAllItems: TAction;
    aDeSelectAllItems: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    pnlClasses: TPanel;
    tbClasses: TToolBar;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    aShowConstTrig: TAction;
    ToolButton20: TToolButton;
    aShowState: TAction;
    ToolButton21: TToolButton;
    aShowIndex: TAction;
    aShowTrans: TAction;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    tsRename: TTabSheet;
    sgRename: TStringGrid;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    aNext: TAction;
    aBack: TAction;
    pmRename: TPopupMenu;
    aDelRename: TAction;
    N12: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    aEditMeth2: TAction;
    N13: TMenuItem;
    tsSourceMain: TTabSheet;
    sgSource: TStringGrid;
    aDelSource: TAction;
    pmSource: TPopupMenu;
    MenuItem1: TMenuItem;
    N14: TMenuItem;
    aSQL: TAction;
    SQL1: TMenuItem;
    procedure aLoadFileExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvClassesChange(Sender: TObject; Node: TTreeNode);
    procedure grdItemsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure aShowAttributeExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure pnlItemsResize(Sender: TObject);
    procedure grdItemsTitleClick(Column: TColumn);
    procedure aEditMethExecute(Sender: TObject);
    procedure aCopyShortExecute(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure pnlSearchResize(Sender: TObject);
    procedure qSearchAfterAction(DataSet: TDataSet);
    procedure btnCloseSearchClick(Sender: TObject);
    procedure grdSearchDblClick(Sender: TObject);
    procedure aGotoExecute(Sender: TObject);
    procedure aGotoUpdate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure fsMainRestorePlacement(Sender: TObject);
    procedure fsMainSavePlacement(Sender: TObject);
    procedure aExportExecute(Sender: TObject);
    procedure aSaveExpUpdate(Sender: TObject);
    procedure aCheckExecute(Sender: TObject);
    procedure tvClassesClick(Sender: TObject);
    procedure grdItemsCellClick(Column: TColumn);
    procedure tvClassesExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure aRenameExecute(Sender: TObject);
    procedure aSaveExpExecute(Sender: TObject);
    procedure qItemsBeforeOpen(DataSet: TDataSet);
    procedure qItemsAfterOpen(DataSet: TDataSet);
    procedure tDelayChangeClassTimer(Sender: TObject);
    procedure aDebugExecute(Sender: TObject);
    procedure tTotalmemoryTimer(Sender: TObject);
    procedure aReopenExecute(Sender: TObject);
    procedure aDebugCloseExecute(Sender: TObject);
    procedure aSelectAllClassExecute(Sender: TObject);
    procedure aSelectAllItemsUpdate(Sender: TObject);
    procedure aSelectAllItemsExecute(Sender: TObject);
    procedure aSearchUpdate(Sender: TObject);
    procedure aEditMethUpdate(Sender: TObject);
    procedure aRenameUpdate(Sender: TObject);
    procedure sgRenameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tsRenameResize(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
    procedure aBackExecute(Sender: TObject);
    procedure aNextUpdate(Sender: TObject);
    procedure aBackUpdate(Sender: TObject);
    procedure aDelRenameUpdate(Sender: TObject);
    procedure aDelRenameExecute(Sender: TObject);
    procedure sgRenameDblClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure aDelSourceExecute(Sender: TObject);
    procedure aDelSourceUpdate(Sender: TObject);
    procedure sgSourceDblClick(Sender: TObject);
    procedure sgSourceMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tsSourceMainResize(Sender: TObject);
    procedure aCheckUpdate(Sender: TObject);
    procedure aSQLUpdate(Sender: TObject);
    procedure aSQLExecute(Sender: TObject);
  private
    { Private declarations }
    fFileOpen: String;
    ColumnIdx: Integer;
    fSearchHistory: string;
    fSearchText: string;
    fCheckedTree: array of TTreeNode;
    fHaveChildNodes: TStrings;
    fCurrentNode: TTreeNode;
    fRename: TRenameFunc;
    fSource: TSourceFunc;
    fHistoryClass: TStrings;
    fHistoryIndex: integer;
    fHistoryBlock: boolean;
    function ExportChecked: Boolean;
    procedure LoadMDB(pSource: string);
    function AddChildType(vRoot: TTreeNode; vName: string; vCode: string; vImage: integer; pNotFaik: boolean = false): TTreeNode;
    procedure CloseMDB;
    procedure SetPanelSearch;
    procedure DisableAll(Value: Boolean);
    procedure FMove(var msg:TMessage); message WM_MOVE;
    procedure RefreshStateIndex;
    procedure SetStateNode(pNode: TTreeNode; pSelectAll: boolean; pValue: boolean);
    procedure InitHaveChild;
    function FindNodeByCode(p_class: string; p_set_focus: boolean): TTreeNode;
    procedure setStateIndex(pNode: TTreeNode);
    procedure CalcChild(pNode: TTreeNode);

    function getSelectedClassNode: TObjectClass;
    property SelectedClassNode: TObjectClass read getSelectedClassNode;
    procedure CompactDatabase(DatabaseName: string);
    procedure DeleteNode(pNode: TTreeNode);
    procedure SetFilerItems;
    function CurrentItemsIsSelect: boolean;
    procedure ChangeItemCheck;
    function GetTablenameFromQuery(fCommand: string) : string;
    procedure QueryObjectInMDB(fCommand: TStrings; p_filter_id: TStrings; pNext: boolean = true);
    procedure CopyObjectFromMDB(fStruct: TStruct; fCommand: TStrings; p_filter_id: TStrings);
    procedure QueryRename(fCommand: TStrings; pRename: TRename);
    procedure QuerySource(fCommand: TStrings; pSource: TSource);
    procedure QueryActualGuide;
    function CopyFileWithWait(PNewName: string): boolean;
    procedure CreateSimpleDB(PNewName: string);
  public
    { Public declarations }
    fSignalEndWait: boolean;
    procedure CreateWait(pMode: integer; pDescr: string);
    procedure CancelWait(pFree: boolean);
  end;

var
  frmMain: TfrmMain;
  fWait: TfrmWait;

implementation

{$R *.dfm}

uses ClipBrd, uSearchObj, psAPI, ADOInt, uRename, uSimpleTextPLPlus, uEditIndex, uEditCriteria, uExceptionHandler, uSQL;


function TfrmMain.ExportChecked: Boolean;
begin
  Result := aCheck.Checked and aExport.Checked;
end;

function TfrmMain.AddChildType(vRoot: TTreeNode; vName: string; vCode: string; vImage: integer; pNotFaik: boolean = false): TTreeNode;
var
  vNode, vTmp: TTreeNode;
begin
  vNode := tvClasses.Items.AddChild(vRoot, vName);
  vNode.Data := TObjectClass.Create(vCode, ((vImage = 20) or (vImage = 21)), vNode);

  vNode.ImageIndex := vImage;
  vNode.SelectedIndex := vImage;
  if (vCode = '') then
    vNode.StateIndex := 0
  else
    vNode.StateIndex := 1;

  // Файковый Child
  if (vCode <> '') and (not pNotFaik) and (fHaveChildNodes.IndexOf(vCode) >= 0) then
  begin
    vTmp := tvClasses.Items.AddChild(vNode, 'Фэйковый');
    vTmp.Data := TObjectClass.Create('!FOR_DELETE!', false, vTmp);
  end;
  Result := vNode;
end;

procedure TfrmMain.LoadMDB(pSource: string);
var
  vBase, vType, vMeta, vPrint, vTmpNode, vUsr : TTreeNode;
  vDate, vOle, vCollection, vNumber, vMemo, vTable, vString, vReference, vBoolean,
    vStructure, vDict, vVariant: TTreeNode;
  vBaseClassID: string;
  function getImageIndexBase(p_code: string): Integer;
  begin
    if (p_code = 'WWW_IN') or
         (p_code = 'WWW_OUT') or
         (p_code = 'DOCUM_RC') or
         (p_code = 'DOCUMENT') or
         (p_code = 'UDOCUMENT') then
      Result := 14
    else if (p_code = 'PL_ARC_USV') or
          (p_code = 'PL_ARC_US') or
          (p_code = 'PL_ARC_US_D') or
          (p_code = 'PLAN') or
          (p_code = 'BUDGET') then
      Result := 7
    else if (p_code = 'SYSTEM_JOBS') or
          (p_code = 'INTERFACE') or
          (p_code = 'HELP_SYSTEM') or
          (p_code = 'HOOK') or
          (p_code = 'SYSTEM') or
          (p_code = 'SYS_DIARYS') or
          (p_code = 'SYS_EVENTS') or
          (p_code = 'RUN_SESSIONS') or
          (p_code = 'FS_FORMS') then
      Result := 9
    else if (p_code = 'DOC_CARD') or
          (p_code = 'CATALOG_APP') or
          (p_code = 'MON') or
          (p_code = 'FM') then
      Result := 5
    else if (p_code = 'ACCOUNT') or
          (p_code = 'R2_AN_ACCOUNT') or
          (p_code = 'R2_IP_ACCOUNTS') then
      Result := 0
    else if p_code = 'FINTOOL' then
      Result := 3
    else if (p_code = 'CLIENT') or
          (p_code = 'IP_CLIENT') then
      Result := 1
    else if p_code = 'USER' then
      Result := 11
    else if (p_code = 'CLASS_ATTRIBUTES') or
          (p_code = 'METACLASS') or
          (p_code = 'METHOD') or
          (p_code = 'METHOD_CONTROLS') or
          (p_code = 'OBJECT') or
          (p_code = 'RUNTIME') or
          (p_code = 'STATES') or
          (p_code = 'USERS') then
      Result := 4
    else if (p_code = 'USERS_REF') or
          (p_code = 'CLASS_ATTR_REF') or
          (p_code = 'METACLASS_REF') or
          (p_code = 'METHOD_REF') or
          (p_code = 'METH_CONTROL_REF') or
          (p_code = 'STATE_REF') or
          (p_code = 'REFERENCE') or
          (p_code = 'USERS_SE_REF') or
          (p_code = 'USERS_ES_REF') or
          (p_code = 'USERS_G_REF') or
          (p_code = 'USERS_U_REF') then
      Result := 21
    else if (p_code = 'BFILE') or
          (p_code = 'BLOB') or
          (p_code = 'CLOB') or
          (p_code = 'LONG RAW') or
          (p_code = 'LONG') or
          (p_code = 'RAW') or
          (p_code = 'ROWID') then
      Result := 35
    else if (p_code = 'BOOLSTRING') or
          (p_code = 'REFSTRING') or
          (p_code = 'FILE$PATH') or
          (p_code = 'FILE$MASK') then
      Result := 17
    else if (p_code = 'INTERVAL') or
          (p_code = 'INTERVAL_YM') or
          (p_code = 'TIMESTAMP') or
          (p_code = 'TIMESTAMP_LTZ') or
          (p_code = 'TIMESTAMP_TZ') then
      Result := 18
    else if (p_code = 'BINARY_DOUBLE') or
          (p_code = 'BINARY_FLOAT') or
          (p_code = 'INTEGER') then
      Result := 16
    else if p_code = 'COLLECTION' then
      Result := 20
    else if p_code = 'FILE$LOAD' then
      Result := 23
    else
      Result := 8;
  end;
begin
  qSearch.Close;
  fFileOpen := pSource;
  fHistoryClass := TStringList.Create;
  fHistoryIndex := -1;
  fHistoryBlock := false;
  fRename := TRenameFunc.Create;
  fSource := TSourceFunc.Create;
  sbMain.Panels.Items[1].Text := pSource;
  acMain.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;Data Source=' + pSource;
  acMain.Open;
  InitHaveChild;
  // Обнулим переменные
  vBase := nil;
  vType := nil;
  vMeta := nil;
  vPrint := nil;
  vUsr := nil;
  vDate := nil;
  vOle := nil;
  vCollection := nil;
  vNumber := nil;
  vMemo := nil;
  vTable := nil;
  vString := nil;
  vReference := nil;
  vBoolean := nil;
  vStructure := nil;
  vDict := nil;
  vVariant := nil;
  try
    tvClasses.Items.BeginUpdate;
    tvClasses.SortType := stNone;
    with qClasses do
    begin
      Connection := acMain;
      Open;
      First;
      while not eof do
      begin
        if FieldByName('BASE_ID').AsInteger = 0 then
        begin
          if vBase = nil then
            vBase := AddChildType(nil, 'Базовые понятия', '', 5);
          AddChildType(vBase, FieldByName('NAME').AsString, FieldByName('ID').AsString, getImageIndexBase(FieldByName('ID').AsString));
        end else if FieldByName('BASE_ID').AsInteger = 2 then
        begin
          if vMeta = nil then
            vMeta := AddChildType(nil, 'Метаданные', '', 4);
          AddChildType(vMeta, FieldByName('NAME').AsString, FieldByName('ID').AsString, getImageIndexBase(FieldByName('ID').AsString));
        end else if FieldByName('BASE_ID').AsInteger = 3 then
        begin
          if vPrint = nil then
            vPrint := AddChildType(nil, 'Макросы печати', '', 39);
          AddChildType(vPrint, FieldByName('NAME').AsString, FieldByName('ID').AsString, 39, true);
        end else if FieldByName('BASE_ID').AsInteger = 4 then
        begin
          AddChildType(nil, FieldByName('NAME').AsString, FieldByName('ID').AsString, 50, true);
        end else if FieldByName('BASE_ID').AsInteger = 5 then
        begin
          if vUsr = nil then
            vUsr := AddChildType(nil, 'Субъекты доступа', '', 52);
          if FieldByName('ID').AsString = '!G' then
            AddChildType(vUsr, FieldByName('NAME').AsString, FieldByName('ID').AsString, 51, true)
          else
            AddChildType(vUsr, FieldByName('NAME').AsString, FieldByName('ID').AsString, 53, true);
        end else if FieldByName('BASE_ID').AsInteger = 6 then
        begin
          AddChildType(nil, FieldByName('NAME').AsString, FieldByName('ID').AsString, 54, true);
        end else
        begin
          if vType = nil then
          begin
            vType := AddChildType(nil, 'Типы данных', '', 10);
            // Сразу проинициализируем все базовые подтипы
            // После окончания добавления, удалим пустые подтипы
            vOle := AddChildType(vType, 'OLE объекты', '', 35);
            vVariant := AddChildType(vType, 'Варианты', '', 13);
            vTable := AddChildType(vType, 'Вложенные массивы', '', 68);
            vDate := AddChildType(vType, 'Даты', '', 18);
            vBoolean := AddChildType(vType, 'Логические', '', 19);
            vCollection := AddChildType(vType, 'Массивы', '', 20);
            vDict := AddChildType(vType, 'Справочники', '', 15);
            vReference := AddChildType(vType, 'Ссылки', '', 21);
            vString := AddChildType(vType, 'Строки', '', 17);
            vStructure := AddChildType(vType, 'Структуры', '', 23);
            vMemo := AddChildType(vType, 'Текстовые', '', 22);
            vNumber := AddChildType(vType, 'Числа', '', 16);
          end;

          vBaseClassID := FieldByName('BASE_CLASS_ID').AsString;
          if vBaseClassID = 'DATE' then
            vTmpNode := vDate
          else if vBaseClassID = 'OLE' then
            vTmpNode := vOle
          else if vBaseClassID = 'COLLECTION' then
            vTmpNode := vCollection
          else if vBaseClassID = 'NUMBER' then
            vTmpNode := vNumber
          else if vBaseClassID = 'MEMO' then
            vTmpNode := vMemo
          else if vBaseClassID = 'TABLE' then
            vTmpNode := vTable
          else if vBaseClassID = 'STRING' then
            vTmpNode := vString
          else if vBaseClassID = 'REFERENCE' then
            vTmpNode := vReference
          else if vBaseClassID = 'BOOLEAN' then
            vTmpNode := vBoolean
          else if vBaseClassID = 'VARIANT' then
            vTmpNode := vVariant
          else if vBaseClassID = 'STRUCTURE' then
          begin
            if FieldByName('AUTONOMOUS').AsString = '0' then
              vTmpNode := vStructure
            else
              vTmpNode := vDict;
          end else
            vTmpNode := nil;
          if vTmpNode <> nil then
            AddChildType(vTmpNode, FieldByName('NAME').AsString, FieldByName('ID').AsString, vTmpNode.ImageIndex);
        end;
        Next;
      end;
      Close;
      // Удалим подгруппы если в них нет дочек
      if Assigned(vDate) and (not vDate.HasChildren) then
        DeleteNode(vDate);
      if Assigned(vOle) and (not vOle.HasChildren) then
        DeleteNode(vOle);
      if Assigned(vCollection) and (not vCollection.HasChildren) then
        DeleteNode(vCollection);
      if Assigned(vNumber) and (not vNumber.HasChildren) then
        DeleteNode(vNumber);
      if Assigned(vMemo) and (not vMemo.HasChildren) then
        DeleteNode(vMemo);
      if Assigned(vTable) and (not vTable.HasChildren) then
        DeleteNode(vTable);
      if Assigned(vString) and (not vString.HasChildren) then
        DeleteNode(vString);
      if Assigned(vReference) and (not vReference.HasChildren) then
        DeleteNode(vReference);
      if Assigned(vBoolean) and (not vBoolean.HasChildren) then
        DeleteNode(vBoolean);
      if Assigned(vVariant) and (not vVariant.HasChildren) then
        DeleteNode(vVariant);
      if Assigned(vStructure) and (not vStructure.HasChildren) then
        DeleteNode(vStructure);
      if Assigned(vDict) and (not vDict.HasChildren) then
        DeleteNode(vDict);
    end;
  finally
    tvClasses.Items.EndUpdate;
    if tvClasses.Items.Count > 0 then
      tvClasses.Selected := tvClasses.Items[0];
  end;
end;

procedure TfrmMain.aLoadFileExecute(Sender: TObject);
begin
  try
    if odMDB.Execute then
    begin
      CloseMDB;
      LoadMDB(odMDB.FileName);
    end;
  except
    on E:Exception do
      MessageDlg(e.Message, mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  aClose.Execute;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  CloseMDB;
  Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  vFile: string;
begin
  sgRename.Cells[0,0] := 'Тип';
  sgRename.Cells[1,0] := 'ТБП';
  sgRename.Cells[2,0] := 'Оригинальное наименование';
  sgRename.Cells[3,0] := 'Новое наименование';

  sgSource.Cells[0,0] := 'Наименование операции';
  sgSource.Cells[1,0] := 'Код операции';
  sgSource.Cells[2,0] := 'Тип измененного кода';

  CloseMDB;
  fsMain.Active := true;
  vFile := ParamStr(1);
  if FileExists(vFile) then
  begin
    try
      LoadMDB(vFile);
    except
       on E: Exception do
       begin
          MessageDlg(e.Message, mtWarning, [mbOk], 0);
          aLoadFile.Execute;
       end;
    end;
  end else
  begin
    aLoadFile.Execute;
  end;
  SetForegroundWindow(frmMain.Handle);
end;

procedure TfrmMain.tvClassesChange(Sender: TObject; Node: TTreeNode);
var
  i: integer;
begin
  fCurrentNode := tvClasses.Selected;
  if Assigned(Node.Data) then
    sbMain.Panels.Items[0].Text := TObjectClass(Node.Data).Code;

  tDelayChangeClass.Enabled := false;
  tDelayChangeClass.Enabled := true;

  if (SelectedClassNode.Code <> '') and (Copy(SelectedClassNode.Code,1,1) <> '!') and (not fHistoryBlock) then
  begin
    for i:= fHistoryClass.Count-1 downto fHistoryIndex+1 do
      fHistoryClass.Delete(i);
    fHistoryClass.Add(SelectedClassNode.Code);
    fHistoryIndex := fHistoryClass.Count-1;
  end;
end;

procedure TfrmMain.grdItemsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  vLeft, vImg: integer;
  function getImageIndex: integer;
  var
    flag: string;
  begin
    flag:= qItems.FieldByName('id_type').AsString;
    if flag = '0' then
      Result := 30 // Реквизит
    else if flag = '1' then
    begin
      if Pos('VW_CRIT',qItems.FieldByName('attr_id').AsString) = 1 then
        Result := 24  // Представление
      else
        Result := 71; // Отчетное представление
    end else if flag = '2' then
      Result := 50 // Процедуры
    else if flag = '3' then
      Result := 51 // Группа
    else if flag = '4' then
      Result := 53 // Пользователь
    else if flag = '5' then
      Result := 34 // Запись CLASSES
    else if flag = '6' then
      Result := 34 // STRUCTURE
    else if flag = '7' then
      Result := 39 // 'Макрос печати'
    else if flag = '8' then
      Result := 66 // 'Ограничение'
    else if flag = '9' then
      Result := 67 // 'Триггер'
    else if flag = '!' then
      Result := 61 // 'Состояние'
    else if flag = '>' then
      Result := 62 // 'Переход'
    else if flag = '*' then
      Result := 63 // 'Индекс'
    else if flag = '&' then
      Result := 24 // 'Общее представление'
    else if flag = 'R' then
      Result := 40 // 'Отчет'
    else if flag = 'P' then
      Result := 39 // 'Печать'
    else if flag = 'M' then
      Result := 37 // 'Простая'
    else if flag = 'Y' then
      Result := 42 // 'Деструктор'
    else if flag = 'D' then
      Result := 43 // 'Копирование'
    else if flag = 'C' then
      Result := 36 // 'Конструктор'
    else if flag = 'A' then
      Result := 49 // 'Функциональный реквизит'
    else if flag = 'T' then
      Result := 44 // 'Триггер'
    else if flag = 'Z' then
      Result := 27 // 'Фильтр' TODO(Не оригинальный)
    else if flag = 'O' then
      Result := 38 // 'Выбор'
    else if flag = 'G' then
      Result := 48 // 'Списочная'
    else if flag = 'L' then
      Result := 45 // 'Библиотечная' TODO(Не оригинальный)
    else if flag = 'S' then
      Result := 41 // 'Групповая'
    else
      Result := 0;
  end;
begin
  if DataCol = 0 then
  begin
    with grdItems.Canvas do
    begin
      FillRect(Rect);
      if not qItems.FieldByName('id_type').IsNull then
      begin
        vLeft := Rect.Left + 5;
        if aExport.Checked then
        begin
          vImg := 1;

          if (SelectedClassNode.isGroup) and
              (not Assigned(SelectedClassNode.TargetNode)) then
          begin
            if qItems.Locate('id_type','6', [loCaseInsensitive, loPartialKey]) then
              SelectedClassNode.TargetNode := FindNodeByCode(qItems.FieldByName('attr_id').AsString, false);
          end;

          if CurrentItemsIsSelect then
            vImg := 2;

          tvClasses.StateImages.Draw(grdItems.Canvas, vLeft, Rect.Top, vImg, dsTransparent, itImage);

          vLeft := vLeft + 21;
        end;
        imgMain.Draw(grdItems.Canvas, vLeft,
          Rect.Top, getImageIndex, dsTransparent, itImage);
        TextOut(vLeft + 21, Rect.Top, grdItems.Fields[0].AsString);
      end;
     end;
  end;
end;

procedure TfrmMain.aShowAttributeExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  // Фильтр
  SetFilerItems;
end;

procedure TfrmMain.SetFilerItems;
  procedure AppendWith(pSrc: string; pAndOr,pChr: string);
  begin
     if qItems.Filter = '' then
       qItems.Filter := qItems.Filter + Format('(filter_type %s ''%s'')',[pChr,pSrc])
     else
     begin
       qItems.Filter := qItems.Filter + Format(' %s ',[pAndOr]);
       qItems.Filter := qItems.Filter + Format('(filter_type %s ''%s'')',[pChr,pSrc]);
     end;
  end;
begin
  qItems.Filtered := false;
  qItems.Filter := '';
  if not aShowMethods.Checked then
  begin
    if aShowAttribute.Checked then
      AppendWith('0','or','=');
    if aShowCriteria.Checked then
      AppendWith('1','or','=');
    if aShowConstTrig.Checked then
    begin
      AppendWith('8','or','=');
      AppendWith('9','or','=');
    end;
    if aShowState.Checked then
      AppendWith('!','or','=');
    if aShowTrans.Checked then
      AppendWith('>','or','=');
    if aShowIndex.Checked then
      AppendWith('*','or','=');

    AppendWith('2','or','=');
    AppendWith('3','or','=');
    AppendWith('4','or','=');
    AppendWith('5','or','=');
    AppendWith('6','or','=');
    AppendWith('7','or','=');
    AppendWith('&','or','=');
  end else
  begin
    if not aShowAttribute.Checked then
      AppendWith('0','and','<>');
    if not aShowCriteria.Checked then
      AppendWith('1','and','<>');
    if not aShowConstTrig.Checked then
    begin
      AppendWith('8','and','<>');
      AppendWith('9','and','<>');
    end;
    if not aShowState.Checked then
      AppendWith('!','and','<>');
    if not aShowTrans.Checked then
      AppendWith('>','and','<>');
    if not aShowIndex.Checked then
      AppendWith('*','and','<>');
  end;

  if qItems.Filter <> '' then
    qItems.Filtered := true;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  qItems.Connection := acMain;
  qItems.Close;
  if Assigned(SelectedClassNode) and (SelectedClassNode.Code <> '') then
  begin
    qItems.Open;
  end;
end;

procedure TfrmMain.pnlItemsResize(Sender: TObject);
begin
  OnPanelResize(grdItems);
end;

procedure TfrmMain.grdItemsTitleClick(Column: TColumn);
var
  curRow: TBookmark;
begin
  if qItems.Active then
  begin
    curRow := qItems.GetBookmark;
    try
      if qItems.Sort = '[' + Column.FieldName + '] DESC' then
        qItems.Sort := '[' + Column.FieldName + ']'
      else
        qItems.Sort := '[' + Column.FieldName + '] DESC';
      qItems.GotoBookmark(curRow);
    finally
      qItems.FreeBookmark(curRow);
      curRow := nil;
    end;
  end;
  ColumnIdx := Column.Index;
end;

procedure TDBGrid.DrawCell (ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
begin
  inherited;
  if ((ARow = 0) and (Self.Name = 'grdItems') and (Assigned(frmMain.qItems))) then
  begin
    // Нарисуем заголовки
    if frmMain.qItems.Sort = '[' + frmMain.grdItems.Columns.Items[ACol].FieldName + ']' then
      frmMain.imgMain.Draw(Canvas, ARect.Right - 21,
        ARect.Top, 25, dsTransparent, itImage)
    else if frmMain.qItems.Sort = '[' + frmMain.grdItems.Columns.Items[ACol].FieldName + '] DESC' then
      frmMain.imgMain.Draw(Canvas, ARect.Right - 21,
        ARect.Top, 26, dsTransparent, itImage);
    // Нарисуем границы только в заголовке
    Canvas.Pen.Color := clBlack;
    Canvas.MoveTo(ARect.Left, ARect.Bottom-1);
    Canvas.LineTo(ARect.Right-1, ARect.Bottom-1);
    Canvas.LineTo(ARect.Right-1, ARect.Top);
  end;
end;

procedure TfrmMain.CloseMDB;
var
  vNode: TTreeNode;
  function ClearNode(pNode: TTreeNode): TTreeNode;
  begin
    if pNode.HasChildren then
      Result := ClearNode(pNode.getFirstChild)
    else
      Result := pNode.GetNext;
    DeleteNode(pNode);
    // После удаления все равно срабатывает таймер, нужно его выключить принудительно
    tDelayChangeClass.Enabled := false;
  end;
begin
  if Assigned(acMain) and (acMain.Connected) then
  begin
    acMain.Close;
    acMain.ConnectionString := '';
    qSearch.Close;
    qTextSearch.Close;
    qItems.Close;

    tvClasses.Items.BeginUpdate;
    try
      if tvClasses.Items.Count > 0 then
        vNode := tvClasses.Items[0]
      else
        vNode := nil;
      while vNode <> nil do
      begin
        ClearNode(vNode);
        if tvClasses.Items.Count > 0 then
          vNode := tvClasses.Items[0]
        else
          vNode := nil;
      end;
    finally
      tvClasses.Items.EndUpdate;
    end;

    SetLength(fCheckedTree,0);
    FreeAndNil(fHistoryClass);
    FreeAndNil(fHaveChildNodes);
    FreeAndNil(fRename);
    FreeAndNil(fSource);    
    fCurrentNode := nil;
    SetPanelSearch;
  end;
end;

procedure TfrmMain.aEditMethExecute(Sender: TObject);
var
  fEdit: TfrmEditMethod;
  fReadOnly: boolean;
  fEditIndex: TfrmEditIndex;
  fEditCrit: TfrmEditCriteria;
  fEditSimple: TfrmSimpleTextPLPlus;
begin
  if not qItems.Active then
    exit;
  if uClass.isMethodByType(qItems.FieldByName('id_type').AsString) then
  begin
    try
      if Sender is TAction then
      begin
        fReadOnly := TAction(Sender).Tag = 0;
      end else
        fReadOnly := true;

      fEdit := TfrmEditMethod.CreateMeth(acMain, Self, qItems.FieldByName('id').AsString,
                  qItems.FieldByName('name').AsString,
                  qItems.FieldByName('attr_id').AsString,
                  qItems.FieldByName('self_class_id').AsString,
                  qItems.FieldByName('result_class_id').AsString,
                  fReadOnly,
                  fSource);
      if qItems.FieldByName('id_type').AsString = 'A' then
      begin
        fEdit.tsExecute.Caption := 'Значение';
        fEdit.tsValidate.Caption := 'Установка';
        fEdit.tsPublic.Caption := 'SQL-значение';
      end;
      fEdit.Caption := fEdit.Caption + ' [' + SelectedClassNode.Code + '.' + qItems.FieldByName('attr_id').AsString + ']';
      if fReadOnly then
        fEdit.Show
      else
      begin
        try
          if fEdit.ShowModal = mrYes then
          begin
            // Сохраняем изменения исходников
            if fEdit.fHaveBody then
              fSource.UpdateObject(qItems.FieldByName('id').AsString, 'EXECUTE',
                        fEdit.seExecute.Text, qItems.FieldByName('attr_id').AsString,
                        TObjectClass(tvClasses.Selected.Data).Code,
                        qItems.FieldByName('name').AsString);
            if fEdit.fHaveValidate then
              fSource.UpdateObject(qItems.FieldByName('id').AsString, 'VALIDATE',
                        fEdit.seValidate.Text, qItems.FieldByName('attr_id').AsString,
                        TObjectClass(tvClasses.Selected.Data).Code,
                        qItems.FieldByName('name').AsString);
            if fEdit.fHaveGlobal then
              fSource.UpdateObject(qItems.FieldByName('id').AsString, 'PUBLIC',
                        fEdit.sePublic.Text, qItems.FieldByName('attr_id').AsString,
                        TObjectClass(tvClasses.Selected.Data).Code,
                        qItems.FieldByName('name').AsString);
            if fEdit.fHaveLocal then
              fSource.UpdateObject(qItems.FieldByName('id').AsString, 'PRIVATE',
                        fEdit.sePrivate.Text, qItems.FieldByName('attr_id').AsString,
                        TObjectClass(tvClasses.Selected.Data).Code,
                        qItems.FieldByName('name').AsString);
            if fEdit.fHaveVBA then
              fSource.UpdateObject(qItems.FieldByName('id').AsString, 'VBSCRIPT',
                        fEdit.seVBA.Text, qItems.FieldByName('attr_id').AsString,
                        TObjectClass(tvClasses.Selected.Data).Code,
                        qItems.FieldByName('name').AsString);
            fSource.SetInfoSG(sgSource);
            SetPanelSearch;
            pcSearch.ActivePageIndex := tsSourceMain.PageIndex;
          end;
        finally
          FreeAndNil(fEdit);
        end;
      end;
    except
      on E:Exception do
        MessageDlg(e.Message, mtWarning, [mbOk], 0);
    end;
  end else if (qItems.FieldByName('id_type').AsString = '6') then
    FindNodeByCode(qItems.FieldByName('attr_id').AsString, true)
  else if (qItems.FieldByName('id_type').AsString = '0') then
    FindNodeByCode(qItems.FieldByName('self_class_id').AsString, true)
  else if (qItems.FieldByName('id_type').AsString = '&') then
  begin
    try
      fEditSimple := TfrmSimpleTextPLPlus.Create(acMain, Self, SelectedClassNode.Code,
        qItems.FieldByName('id').AsString, uClass.GetTypeObjByCode(qItems.FieldByName('id_type').AsString));
      fEditSimple.Caption := fEditSimple.Caption + ' [' + qItems.FieldByName('name').AsString + '"' + qItems.FieldByName('attr_id').AsString + '"]';
      fEditSimple.Show;
    except
      on E:Exception do
        MessageDlg(e.Message, mtWarning, [mbOk], 0);
    end;
  end else if ((qItems.FieldByName('id_type').AsString = '8') or (qItems.FieldByName('id_type').AsString = '9')) then
  begin
    try
      fEditSimple := TfrmSimpleTextPLPlus.Create(acMain, Self, SelectedClassNode.Code,
        qItems.FieldByName('name').AsString, uClass.GetTypeObjByCode(qItems.FieldByName('id_type').AsString));
      fEditSimple.Caption := fEditSimple.Caption + ' [' + SelectedClassNode.Code + '.' + qItems.FieldByName('attr_id').AsString + ']';
      fEditSimple.Show;
    except
      on E:Exception do
        MessageDlg(e.Message, mtWarning, [mbOk], 0);
    end;
  end else if qItems.FieldByName('id_type').AsString = '*' then
  begin
    try
      fEditIndex := TfrmEditIndex.Create(Self, acMain, qItems.FieldByName('name').AsString);
      fEditIndex.Caption := fEditIndex.Caption + ' [' + SelectedClassNode.Code + '.' + qItems.FieldByName('attr_id').AsString + ']';
      fEditIndex.Show;
    except
      on e: Exception do
      begin
        MessageDlg(e.Message, mtWarning, [mbOk], 0);
      end;
    end;
  end else if qItems.FieldByName('id_type').AsString = '1' then
  begin
    try
      fEditCrit := TfrmEditCriteria.Create(acMain, Self, qItems.FieldByName('id').AsString);
      fEditCrit.Caption := fEditCrit.Caption + ' [' + SelectedClassNode.Code + '.' + qItems.FieldByName('attr_id').AsString + ']';
      fEditCrit.Show;
    except
      on e: Exception do
      begin
        MessageDlg(e.Message, mtWarning, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TfrmMain.aCopyShortExecute(Sender: TObject);
begin
  if grdItems.Focused and qItems.Active then
    Clipboard.AsText := qItems.FieldByName('attr_id').AsString
  else if tvClasses.Focused then
    Clipboard.AsText := sbMain.Panels.Items[0].Text;
end;

procedure TfrmMain.aSearchExecute(Sender: TObject);
var
  fForm: TfrmSearchObj;
begin
  fForm := TfrmSearchObj.Create(Self);
  try
    fForm.SearchTextHistory := fSearchHistory;
    fForm.SearchText := fSearchText;
    if fForm.ShowModal = mrOk then
    begin
      fSearchHistory := fForm.SearchTextHistory;
      fSearchText := fForm.SearchText;

      qSearch.Connection := frmMain.acMain;
      qSearch.Close;
      qTextSearch.Connection := frmMain.acMain;
      qTextSearch.Close;
      SetPanelSearch;

      qSearch.SQL.Text := fForm.getQuerySelect;
      qSearch.Parameters.ParamByName('txt').DataType := ftString;
      qSearch.Parameters.ParamByName('txt').Value := fForm.getFilterTxt;
      if fForm.getNeedClass then
      begin
        qSearch.Parameters.ParamByName('p_class').DataType := ftString;
        qSearch.Parameters.ParamByName('p_class').Value := sbMain.Panels.Items[0].Text;
      end;

      qSearch.Open;

      if fForm.getSearchInMeth then
      begin
        qTextSearch.SQL.Text := fForm.getQuerySelectText;
        qTextSearch.Parameters.ParamByName('txt').DataType := ftString;
        qTextSearch.Parameters.ParamByName('txt').Value := fForm.SearchText;
        if fForm.getNeedClass then
        begin
          qTextSearch.Parameters.ParamByName('p_class').DataType := ftString;
          qTextSearch.Parameters.ParamByName('p_class').Value := sbMain.Panels.Items[0].Text;
        end;
        qTextSearch.Open;
      end;

      CreateWait(0, 'поиск');
    end;
  finally
    FreeAndNil(fForm);
  end;
end;

procedure TfrmMain.pnlSearchResize(Sender: TObject);
begin
  if pnlSearch.Visible then
  begin
    if tsSearchMain.TabVisible then
      uDBGridExt.OnPanelResize(grdSearch, 3);
    if tsSearchText.TabVisible then
      uDBGridExt.OnPanelResize(grdTextSearch, 3);
  end;
end;

procedure TfrmMain.qSearchAfterAction(DataSet: TDataSet);
begin
  if ((TADOQuery(DataSet).Active) and (TADOQuery(DataSet).RecordCount = 0)) then
    TADOQuery(DataSet).Close
  else if TADOQuery(DataSet).Active then
  begin
    if TADOQuery(DataSet).Name = 'qSearch' then
      dsSearch.DataSet := TADOQuery(DataSet)
    else if TADOQuery(DataSet).Name = 'qTextSearch' then
      dsTextSearch.DataSet := TADOQuery(DataSet)
    else
      MessageDlg('Ошибка определения источника', mtError, [mbOk], 0);
  end;

  CancelWait(true);
      
  SetPanelSearch;
end;

procedure TfrmMain.SetPanelSearch;
begin
  if ((qSearch.Active) or (qTextSearch.Active) or (Assigned(fRename) and (fRename.CountInfo > 0)) or (Assigned(fSource) and (fSource.CountInfo > 0))) then
  begin
    tsSearchMain.TabVisible := ((qSearch.Active) and (qSearch.RecordCount > 0));
    tsSearchText.TabVisible := ((qTextSearch.Active) and (qTextSearch.RecordCount > 0));
    tsRename.TabVisible := fRename.CountInfo > 0;
    tsSourceMain.TabVisible := fSource.CountInfo > 0;
    if qSearch.Active then
      tsSearchMain.Caption := Format('Найдено (%d)',[qSearch.RecordCount]);
    if qTextSearch.Active then
      tsSearchText.Caption := Format('Найдено в текстах операций (%d)',[qTextSearch.RecordCount]);
    if not pnlSearch.Visible then
    begin
      pnlMain.Align := alNone;
      pnlSearch.Visible := true;
      splSearch.Visible := true;
      pnlMain.Height := splSearch.Top - pnlMain.Top;
      pnlMain.Align := alClient;
    end;
  end else
  begin
    pnlSearch.Visible := false;
    splSearch.Visible := false;
    if Self.Visible then
      grdItems.SetFocus;
  end;
end;

procedure TfrmMain.btnCloseSearchClick(Sender: TObject);
begin
  qSearch.Close;
  qTextSearch.Close;
  fRename.Clear;
  fSource.Clear;
  SetPanelSearch;
end;

procedure TfrmMain.grdSearchDblClick(Sender: TObject);
begin
  aGoto.Execute;
end;

function TfrmMain.FindNodeByCode(p_class: string; p_set_focus: boolean): TTreeNode;
var
  i: integer;
  histClass: TStrings;
  vNode: TTreeNode;
  procedure getClassHist(p_class: string);
  begin
    if p_class <> '' then
    begin
      with TADOQuery.Create(Self) do
      try
        Connection := acMain;
        SQL.Text := 'select parent_id from (select cl.parent_id, cl.id from classes cl union all select '''' as parent_id, id as id from printer_types) tmp where tmp.id = :code;';
        Parameters.ParamByName('code').DataType := ftString;
        Parameters.ParamByName('code').Value := p_class;
        Open;
        histClass.Add(p_class);
        if RecordCount > 0 then
        begin
          First;
          if (not FieldByName('parent_id').IsNull) and (FieldByName('parent_id').AsString <> '') then
            getClassHist(FieldByName('parent_id').AsString);
        end;
      finally
        Free;
      end;
    end;
  end;
  function findNode(p_root: TTreeNode; p_class: string): TTreeNode;
  var
    Noddy: TTreeNode;
    Searching: boolean;
    pStr: string;
  begin
    Result := nil;
    if p_root = nil then
      Noddy := tvClasses.Items[0]
    else
      Noddy := p_root.getFirstChild;

    Searching := true;
    while (Searching) and (Noddy <> nil) do
    begin
      pStr := TObjectClass(Noddy.Data).GetCodeFilter;
      if pStr = p_class then
        Result := Noddy
      else
        Noddy := Noddy.GetNext;
      if Result <> nil then
        Searching := False;
    end;
  end;
begin
  histClass := TStringList.Create;
  tvClasses.Items.BeginUpdate;
  vNode := nil;
  try
    getClassHist(p_class);
    for i := histClass.Count -1 downto 0 do
    begin
      vNode := findNode(vNode, histClass.Strings[i]);
      if (Assigned(vNode)) and (i > 0) then
        CalcChild(vNode);
    end;
  finally
    FreeAndNil(histClass);
    tvClasses.Items.EndUpdate;
    if (p_set_focus) and (Assigned(vNode)) then
    begin
      tvClasses.Selected := vNode;
      // остановим таймер и принутельно откроем запрос
      tDelayChangeClass.Enabled := false;
      aRefresh.Execute;
      tvClasses.SetFocus;
    end;
  end;
  Result := vNode;
end;

procedure TfrmMain.aGotoExecute(Sender: TObject);
var
  class_id, short_id: string;
  fInfo: TRename;
  fSrc: TSource;
begin
  if grdSearch.Focused then
  begin
    class_id := qSearch.FieldByName('class_id').AsString;
    short_id := qSearch.FieldByName('short_name').AsString;
  end else if grdTextSearch.Focused then
  begin
    class_id := qTextSearch.FieldByName('class_id').AsString;
    short_id := qTextSearch.FieldByName('short_name').AsString;
  end else if sgRename.Focused then
  begin
    fInfo := fRename.GetRenameObj(sgRename.Row-1);
    class_id := fInfo.fClassID;
    short_id := fInfo.fOriginalShort;
  end else if sgSource.Focused then
  begin
    fSrc := fSource.GetSourceObj(sgSource.Row-1);
    class_id := fSrc.fMethClass;
    short_id := fSrc.fMethCode;
  end;

  FindNodeByCode(class_id, true);
  
  if (short_id <> '') and (short_id <> class_id) and qItems.Active then
  begin
    qItems.Locate('attr_id', short_id, [loCaseInsensitive, loPartialKey]);
    grdItems.SetFocus;
  end;
end;

procedure TfrmMain.aGotoUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := grdSearch.Focused or grdTextSearch.Focused or (sgRename.Focused and (sgRename.Row > 0)) or (sgSource.Focused and (sgSource.Row > 0));
end;

procedure TfrmMain.DisableAll(Value: Boolean);
var
  i: Integer;
begin
  for i:=0 to frmMain.ControlCount - 1 do
    frmMain.Controls[i].Enabled := Value;
  for i:=0 to alMain.ActionCount - 1 do
    TAction(alMain.Actions[i]).Enabled := Value;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(fWait) then
  begin
    MessageDlg('Нельзя завершить приложение пока выполняется операция', mtError, [mbOk], 0);
    CanClose := false;
  end else
  begin
    CancelWait(true);
    CanClose := true;
  end;
end;

procedure TfrmMain.FMove(var msg:TMessage);
begin
  inherited;
  if Assigned(fWait) then
  begin
    fWait.Left := frmMain.Left + trunc((frmMain.Width - fWait.Width) / 2);
    fWait.Top := frmMain.Top + trunc((frmMain.Height - fWait.Height) / 2);
  end;
end;

procedure TfrmMain.fsMainRestorePlacement(Sender: TObject);
begin
  fSearchText := fsMain.StoredValue['TextSearch'];
  fSearchHistory := fsMain.StoredValue['HistorySearch'];
end;

procedure TfrmMain.fsMainSavePlacement(Sender: TObject);
begin
  fsMain.StoredValue['TextSearch'] := fSearchText;
  fsMain.StoredValue['HistorySearch'] := fSearchHistory;
end;

procedure TfrmMain.aExportExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  RefreshStateIndex;
end;

procedure TfrmMain.aSaveExpUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (aExport.Checked) or (Assigned(fRename) and (fRename.CountInfo > 0)) or (Assigned(fSource) and (fSource.CountInfo > 0));
end;

procedure TfrmMain.aCheckUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (aExport.Checked);
end;

procedure TfrmMain.aCheckExecute(Sender: TObject);
begin
  aCheck.Checked := not aCheck.Checked;
  aDelCheck.Checked := not aCheck.Checked;
  RefreshStateIndex;
end;

procedure TfrmMain.RefreshStateIndex;
begin
  if aExport.Checked then
  begin
    if aCheck.Checked then
      tvClasses.StateImages := ilStateCheck
    else
      tvClasses.StateImages := ilStateDel;
  end else
    tvClasses.StateImages := nil;
  tbItems.Visible := aExport.Checked;
  tbClasses.Visible := aExport.Checked;
  grdItems.Repaint;
  tvClasses.Repaint;
end;

procedure TfrmMain.SetStateNode(pNode: TTreeNode; pSelectAll: boolean; pValue: boolean);
var
  vLen, i, j: integer;
  vFind: boolean;
begin
  if (TObjectClass(pNode.Data).Code = '') then
    exit;
  vLen := Length(fCheckedTree);
  if pValue then
  begin
    TObjectClass(pNode.Data).Selected := true;
    if TObjectClass(pNode.Data).isGroup then
      TObjectClass(pNode.Data).AddSelect(TObjectClass(pNode.Data).Code, '5');

    SetLength(fCheckedTree, vLen + 1);
    fCheckedTree[vLen] := pNode;
    if pSelectAll then
      SelectedClassNode.SelectAll;
    // Утановим соответствующую иконку
    setStateIndex(pNode);
  end else
  begin
    TObjectClass(pNode.Data).Selected := false;
    TObjectClass(pNode.Data).DeSelectAll;
    pNode.StateIndex := 1;
    vFind := false;
    for i:=vLen-1 downto 0 do
    begin
      if (not vFind) and (fCheckedTree[i] = pNode) then
      begin
        vFind := true;
        for j:=i to vLen-2 do
          fCheckedTree[i] := fCheckedTree[i+1];
        break;
      end;
    end;
    if vFind then
      SetLength(fCheckedTree, vLen - 1);
  end;
end;

procedure TfrmMain.tvClassesClick(Sender: TObject);
var
  P:TPoint;
begin
  GetCursorPos(P);
  P := tvClasses.ScreenToClient(P);
  if (htOnStateIcon in tvClasses.GetHitTestInfoAt(P.X,P.Y)) then
  begin
    SetStateNode(fCurrentNode, true, fCurrentNode.StateIndex = 1);
    grdItems.Repaint;
  end;
end;

procedure TfrmMain.ChangeItemCheck;
var
  vFirst: boolean;
  vNode: TTreeNode;
begin
   if (SelectedClassNode.isGroup) and
      (qItems.FieldByName('id_type').AsString = '6') then
   begin
     vNode := SelectedClassNode.TargetNode;
   end else
   begin
     vNode := fCurrentNode;
   end;
   // В случае если устанавливаем крыж то добавляем информацию в выделенные, иначе удаляем
    if TObjectClass(vNode.Data).isSelect(qItems.FieldByName('id').AsString, qItems.FieldByName('id_type').AsString) then
    begin
      // Если удалилась последняя то сменим состояние
      if (TObjectClass(vNode.Data).DelSelect(qItems.FieldByName('id').AsString, qItems.FieldByName('id_type').AsString))
          or ((SelectedClassNode.isGroup) and
              (qItems.FieldByName('id_type').AsString = '6')) then
        SetStateNode(vNode, false, false)
      else
        // Иначе просто обновим состояние, т.к. это могла сняться единственная из всех
        setStateIndex(vNode);
    end else
    begin
      vFirst := TObjectClass(vNode.Data).AddSelect(qItems.FieldByName('id').AsString, qItems.FieldByName('id_type').AsString);
      // Если проставялем флаг на строке относящейся к другой структуре, вызовем изменение это структуры
      if ((SelectedClassNode.isGroup) and
          (qItems.FieldByName('id_type').AsString = '6')) then
        SetStateNode(vNode, false, vNode.StateIndex = 1)
      // Если добавилась первая сменим состояние и это не группа с target
      else if (vFirst) and (not SelectedClassNode.isGroup) and
        (Copy(TObjectClass(vNode.Data).Code,1,7) <> '!PRINT') then
        SetStateNode(vNode, false, true)
      else
        // Обновим состояние, т.к. могла добавиться последня
        setStateIndex(vNode);
    end;
end;

procedure TfrmMain.grdItemsCellClick(Column: TColumn);
var
  P:TPoint;
begin
  if (Column.Index = 0) and (aExport.Checked) then
  begin
    GetCursorPos(P);
    P := grdItems.ScreenToClient(P);
    if (P.X >= 5) and (P.X <= 21) then
    begin
      ChangeItemCheck;
      grdItems.Repaint;
      tvClasses.Repaint;
    end;
  end;
end;

procedure TfrmMain.setStateIndex(pNode: TTreeNode);
var
  vCntChk, vAllCnt: integer;
begin
  if pNode.StateIndex > 0 then
  begin
    if TObjectClass(pNode.Data).isSelectedAll then
      pNode.StateIndex := 2
    else
    begin
      vCntChk := TObjectClass(pNode.Data).CountChecked;
      vAllCnt := TObjectClass(pNode.Data).CountAll;

      if vCntChk > 0 then
      begin
        if (vCntChk = vAllCnt) then
          pNode.StateIndex := 2
        else
          pNode.StateIndex := 3;
      end else
        pNode.StateIndex := 1;
    end;
  end;
end;

procedure TfrmMain.CalcChild(pNode: TTreeNode);
var
  pStr, vId: string;
begin
  pStr := TObjectClass(pNode.Data).Code;
  if (pStr <> '') and (TObjectClass(pNode.getFirstChild.Data).Code = '!FOR_DELETE!') then
  begin
    with TADOQuery.Create(Self) do
    try
      tvClasses.Items.BeginUpdate;
      Connection := acMain;
      SQL.Text := 'select cl.id, cl.name, cl.autonomous, cl.base_class_id, cl.entity_id from classes cl where cl.parent_id = :code order by cl.name;';
      Parameters.ParamByName('code').DataType := ftString;
      Parameters.ParamByName('code').Value := pStr;
      Open;
      First;
      while not eof do
      begin
        if FieldByName('ID').IsNull then
          vId := ''
        else
          vId := FieldByName('ID').AsString;
        if ((FieldByName('ENTITY_ID').AsString = 'TYPE') and
            (FieldByName('BASE_CLASS_ID').AsString = 'STRUCTURE') and
            (FieldByName('AUTONOMOUS').AsString = '0')) then
          AddChildType(pNode, FieldByName('NAME').AsString, vId, 23)
        else if ((FieldByName('ENTITY_ID').AsString = 'TYPE') and
                 (FieldByName('BASE_CLASS_ID').AsString = 'STRUCTURE') and
                 (FieldByName('AUTONOMOUS').AsString = '1')) then
          AddChildType(pNode, FieldByName('NAME').AsString, vId, 14)
        else
          AddChildType(pNode, FieldByName('NAME').AsString, vId, pNode.ImageIndex);
        Next;
      end;
      // Удалим первый фэйковый
      DeleteNode(pNode.getFirstChild);
    finally
      Close;
      Free;
      tvClasses.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmMain.tvClassesExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  CalcChild(Node);
end;

procedure TfrmMain.InitHaveChild;
var
  fQuery: TADOQuery;
begin
  fHaveChildNodes := TStringList.Create;
  // Паралельно выполним основной запрос с получением всех объектов чтобы не обращаться к основной форме
  // И из потока будем выкидывать только список нод у которых нужно удалить дочернюю компоненту
  fQuery := TADOQuery.Create(Self);
  try
    fQuery.Connection := acMain;
    fQuery.SQL.Text := 'select distinct cl.parent_id as id from classes cl where cl.parent_id is not null;';
    fQuery.Open;
    fQuery.First;
    while not fQuery.eof do
    begin
      fHaveChildNodes.Add(fQuery.FieldByName('ID').AsString);
      fQuery.Next;
    end;
  finally
    FreeAndNil(fQuery);
  end;
end;

function TfrmMain.GetTablenameFromQuery(fCommand: string) : string;
var
  t, t2, t3: integer;
  addCnt: integer;
begin
  addCnt := 0;
  // Insert
  t := Pos('into ',fCommand);
  if t > 0 then
    addCnt := 5;
  // Update
  if t = 0 then
  begin
    t := Pos('update ',fCommand);
    if t > 0 then
      addCnt := 7;
  end;
  // Select
  if t = 0 then
  begin
    t := Pos('from ',fCommand);
    if t > 0 then
      addCnt := 5;
  end;

  if t > 0 then
  begin
    t := t + addCnt;

    t2 := Pos(' ', Copy(fCommand,t, Length(fCommand)))-1;
    t3 := Pos('(', Copy(fCommand,t, Length(fCommand)))-1;
    if (t3 < t2) and (t3 > 0) then
      t2 := t3;
    if t2 < 0 then
      t2 := Length(fCommand)-t+1;
    Result := Copy(fCommand, t, t2);
  end else
  begin
    Result := '';
  end;
end;

// Очистка объектов
procedure TfrmMain.QueryObjectInMDB(fCommand: TStrings; p_filter_id: TStrings; pNext: boolean = true);
var
  fADOCommand : TADOCommand;
  j, k: integer;
begin
  if p_filter_id.Count = 0 then
    exit;

  for j:=0 to fCommand.Count-1 do
  begin
    fADOCommand := TADOCommand.Create(nil);
    try
      fADOCommand.Connection := acSaveMDB;
      fADOCommand.Parameters.Clear;
      fADOCommand.CommandText := fCommand.Strings[j];
      fWait.setDescription(GetTablenameFromQuery(fCommand.Strings[j]));

      fADOCommand.ParamCheck := false;
      if fADOCommand.Parameters.Count > 0 then
      begin
        for k := 0 to p_filter_id.Count - 1 do
        begin
          fADOCommand.Parameters.ParamByName('filter').Value := p_filter_id.Strings[k];
          fADOCommand.Execute;
          if pNext then
            fWait.NextSecond;
        end;
      end else
      begin
        fADOCommand.Execute;
        if pNext then
          fWait.NextSecond;
      end;
    finally
      FreeAndNil(fADOCommand);
    end;
  end;
  fCommand.Clear;
end;

procedure TfrmMain.QueryRename(fCommand: TStrings; pRename: TRename);
var
  fADOCommand : TADOCommand;
  j, k: integer;
begin
  for j:=0 to fCommand.Count-1 do
  begin
    fADOCommand := TADOCommand.Create(nil);
    try
      fADOCommand.Connection := acSaveMDB;
      fADOCommand.Parameters.Clear;
      fADOCommand.CommandText := fCommand.Strings[j];
      fWait.setDescription(GetTablenameFromQuery(fCommand.Strings[j]));

      fADOCommand.ParamCheck := false;
      if fADOCommand.Parameters.Count > 0 then
      begin
        for k := 0 to fADOCommand.Parameters.Count - 1 do
        begin
          if AnsiUpperCase(fADOCommand.Parameters[k].Name) = AnsiUpperCase('id') then
            fADOCommand.Parameters.ParamByName('id').Value := pRename.id;
          if AnsiUpperCase(fADOCommand.Parameters[k].Name) = AnsiUpperCase('newFullValue') then
            fADOCommand.Parameters.ParamByName('newFullValue').Value := pRename.fNewFull;
          if AnsiUpperCase(fADOCommand.Parameters[k].Name) = AnsiUpperCase('newValue') then
            fADOCommand.Parameters.ParamByName('newValue').Value := pRename.fNewShort;
          if AnsiUpperCase(fADOCommand.Parameters[k].Name) = AnsiUpperCase('class') then
            fADOCommand.Parameters.ParamByName('class').Value := pRename.fClassID;
          if AnsiUpperCase(fADOCommand.Parameters[k].Name) = AnsiUpperCase('short') then
            fADOCommand.Parameters.ParamByName('short').Value := pRename.fOriginalShort;
        end;
        fADOCommand.Execute;
        fWait.NextSecond;
      end else
      begin
        fADOCommand.Execute;
        fWait.NextSecond;
      end;
    finally
      FreeAndNil(fADOCommand);
    end;
  end;
  fCommand.Clear;
end;

procedure TfrmMain.QuerySource(fCommand: TStrings; pSource: TSource);
var
  fADOCommand : TADOCommand;
  j, k: integer;
begin
  for j:=0 to fCommand.Count-1 do
  begin
    fADOCommand := TADOCommand.Create(nil);
    try
      fADOCommand.Connection := acSaveMDB;
      fADOCommand.Parameters.Clear;
      fADOCommand.CommandText := fCommand.Strings[j];
      fWait.setDescription(GetTablenameFromQuery(fCommand.Strings[j]));

      fADOCommand.ParamCheck := false;
      if fADOCommand.Parameters.Count > 0 then
      begin
        for k := 0 to fADOCommand.Parameters.Count - 1 do
        begin
          if AnsiUpperCase(fADOCommand.Parameters[k].Name) = AnsiUpperCase('newSource') then
            fADOCommand.Parameters.ParamByName('newSource').Value := pSource.fNewSource;
          if AnsiUpperCase(fADOCommand.Parameters[k].Name) = AnsiUpperCase('id') then
            fADOCommand.Parameters.ParamByName('id').Value := pSource.fMethId;
          if AnsiUpperCase(fADOCommand.Parameters[k].Name) = AnsiUpperCase('type') then
            fADOCommand.Parameters.ParamByName('type').Value := pSource.fTypeSource;
        end;
        fADOCommand.Execute;
        fWait.NextSecond;
      end else
      begin
        fADOCommand.Execute;
        fWait.NextSecond;
      end;
    finally
      FreeAndNil(fADOCommand);
    end;
  end;
  fCommand.Clear;
end;

procedure TfrmMain.CopyObjectFromMDB(fStruct: TStruct; fCommand: TStrings; p_filter_id: TStrings);
var
  fADOCommand : TADOCommand;
  fADOQuery: TADOQuery;
  j, k: integer;
  fTableName: string;
begin
  if p_filter_id.Count = 0 then
    exit;

  for j:=0 to fCommand.Count-1 do
  begin
    fTableName := GetTablenameFromQuery(fCommand.Strings[j]);
    if fTableName <> '' then
    begin
      fWait.setDescription(fTableName);
      fADOQuery := TADOQuery.Create(Self);
      fADOCommand := fStruct.CreateCommandCopy(fTableName);
      fADOCommand.Connection := acSaveMDB;
      try
        fADOQuery.Connection := acMain;
        fADOQuery.Parameters.Clear;
        fADOQuery.SQL.Text := fCommand.Strings[j];
        if fADOQuery.Parameters.Count > 0 then
        begin
          for k := 0 to p_filter_id.Count - 1 do
          begin
            fADOQuery.Close;
            fADOQuery.Parameters.ParamByName('filter').Value := p_filter_id.Strings[k];
            fADOQuery.Open;
            fADOQuery.First;
            while not fADOQuery.Eof do
            begin
              fStruct.PrepareAndExec(fTableName, fADOCommand, fADOQuery);
              fADOQuery.Next;
            end;
            fWait.NextSecond;
          end;
        end else
        begin
          fADOQuery.Close;
          fADOQuery.Open;
          fADOQuery.First;
          while not fADOQuery.Eof do
          begin
            fStruct.PrepareAndExec(fTableName, fADOCommand, fADOQuery);
            fADOQuery.Next;
          end;
          fWait.NextSecond;
        end;
      finally
        FreeAndNil(fADOQuery);
        FreeAndNil(fADOCommand);
      end;
    end;
  end;
  fCommand.Clear;
end;

// Актуализация таблицы GUIDE_GROUPS
procedure TfrmMain.QueryActualGuide;
var
  i, cnt :integer;
  qCnt, qCnt2: TADOQuery;
  fCmdAct, fSimpleCode: TStrings;
begin
  qCnt := TADOQuery.Create(Self);
  qCnt2 := TADOQuery.Create(Self);
  fCmdAct := TStringList.Create;
  fSimpleCode := TStringList.Create;
  try
    // Необходимое количество
    qCnt.Connection := acSaveMDB;
    qCnt.SQL.Text := 'select param_group, count(*) as cnt from classes group by param_group';
    qCnt.Open;
    // Текущее количество
    qCnt2.Connection := acSaveMDB;
    qCnt2.SQL.Text := 'select gg.id, count(*) as cnt from guide_groups gg group by gg.id';
    qCnt2.Open;
    with TADOQuery.Create(Self) do
    try
      Connection := acMain;
      SQL.Text := 'select gg.* from guide_groups gg order by gg.id';
      Open;
      First;
      i := 0;
      cnt := 0;

      while not eof do
      begin

        if (fSimpleCode.Count = 0) or (fSimpleCode.Strings[0] <> FieldByName('ID').AsString) then
        begin
          if fCmdAct.Count > 0 then
            QueryObjectInMDB(fCmdAct, fSimpleCode, false);

          fSimpleCode.Clear;
          fSimpleCode.Add(FieldByName('ID').AsString);

          if qCnt.Locate('param_group', fSimpleCode.Strings[0], [loCaseInsensitive, loPartialKey]) then
          begin
            cnt := qCnt.FieldByName('cnt').AsInteger;
          end else
            cnt := 0;

          if qCnt2.Locate('id', fSimpleCode.Strings[0], [loCaseInsensitive, loPartialKey]) then
          begin
            i := qCnt2.FieldByName('cnt').AsInteger;
            if i > cnt then
            begin
              fCmdAct.Add('delete gg.* from guide_groups gg where gg.id = :filter');
              i := 0;
            end;
          end else
            i := 0;
        end;
        // Пока не достигнем нужного количества
        if i < cnt then
        begin
          fCmdAct.Add('insert into guide_groups(ID,DESCRIPTION) VALUES(:filter,''' + FieldByName('DESCRIPTION').AsString + ''')');
          i := i + 1;
        end;
        Next;
      end;
      if fCmdAct.Count > 0 then
        QueryObjectInMDB(fCmdAct, fSimpleCode, false);
    finally
      Free;
    end;
  finally
    qCnt.Close;
    qCnt.Free;
    qCnt2.Close;
    qCnt2.Free;
    FreeAndNil(fCmdAct);
    FreeAndNil(fSimpleCode);
  end;
end;

// Копирование с отображением формы ожидания
function TfrmMain.CopyFileWithWait(PNewName: string): boolean;
begin
  CreateWait(0, 'копирование');
  try
    Result := copyfile(PAnsiChar(fFileOpen),PAnsiChar(PNewName),true);
  finally
    CancelWait(true);
  end;
end;
// Создание пустой БД
procedure TfrmMain.CreateSimpleDB(PNewName: string);
var
  DBEngine, Workspace: Variant;
const
  dbLangGeneral = ';LANGID=0x0409;CP=1252;COUNTRY=0';
  dbVersion30 = 36;
begin
  DBEngine := CreateOleObject('DAO.DBEngine.36');
  Workspace := DBEngine.Workspaces[0];
  try
    Workspace.CreateDatabase(PNewName, dbLangGeneral, dbVersion30);
  except
    on E: Exception do
      MessageDlg(e.Message, mtError, [mbOk], 0);
  end;
end;

procedure TfrmMain.aSaveExpExecute(Sender: TObject);
var
  fFileName: string;
  fEndClose: boolean;
  i, firstCount: integer;
  fCmd, fClassCmd: TStrings;
  simpleClass: TStrings;
  fStruct: TStruct;
  fInfo: TRename;
  fSrc: TSource;
  procedure CopyAndInsert(fStruct: TStruct; fCommand: TStrings; p_filter_id: TStrings);
  begin
    if ExportChecked then
      CopyObjectFromMDB(fStruct, fCommand, p_filter_id)
    else
      QueryObjectInMDB(fCommand, p_filter_id);
  end;
begin
  if odSaveMDB.Execute then
    fFileName := odSaveMDB.FileName
  else
    exit;
  // Если файл существует спросим перезаписывать его или нет
  if FileExists(fFileName) then
    if MessageDlg('Файл уже существует, перезаписать его?', mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
    begin
      if not DeleteFile(fFileName) then
      begin
        MessageDlg('Ошибка удаления файла: ' + IntToStr(GetLastError), mtError, [mbOk], 0);
        exit;
      end;
    end else
      exit;

  fEndClose := false;//MessageDlg('После завершения сохранения, завершить программу?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;

  if ExportChecked then
  begin
    // Создадим пустую БД
    CreateSimpleDB(fFileName);
  end else
  begin
    // Скопируем исходный файл с новым именем
    if not CopyFileWithWait(fFileName) then
      MessageDlg('Ошибка копирования исходного хранилища: ' + IntToStr(GetLastError), mtError, [mbOk], 0);
  end;
  // Откроем соединение к новому файлу
  acSaveMDB.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;Data Source=' + fFileName;
  acSaveMDB.Open;
  try
    if ExportChecked then
    begin
      fStruct := TStruct.Create(acMain);
      fStruct.CreateStrunctInMDB(acSaveMDB);
    end;
    fCmd := TStringList.Create;
    fClassCmd := TStringList.Create;
    simpleClass := TStringList.Create;
    // Форма отображения прогресса
    if ExportChecked then
    begin
      CreateWait(1, 'Копируется таблица');
      firstCount := Length(fCheckedTree)+2;
    end else
    begin
      CreateWait(1, 'Очищается таблица');
      // Создадим временные индексы на таблицах с которыми будем работать и на которых их нет вообще:
      acSaveMDB.Execute('CREATE INDEX SOURCES_LONG_TMP1 ON SOURCES_LONG (METHOD_ID, TYPE) WITH PRIMARY');
      acSaveMDB.Execute('CREATE INDEX METHOD_ORDER_TMP1 ON METHOD_ORDER (METH_ID)');
      acSaveMDB.Execute('CREATE INDEX METHODS_TMP1 ON METHODS (ID) WITH PRIMARY');
      acSaveMDB.Execute('CREATE INDEX CRITERIA_TRIES_TMP1 ON CRITERIA_TRIES (CRITERIA_ID)');
      firstCount := Length(fCheckedTree)+1;
    end;
    if fRename.CountInfo > 0 then
      firstCount := firstCount + 1;
    if fSource.CountInfo > 0 then
      firstCount := firstCount + 1;

    fWait.InitPgFirst(firstCount, 0);
    try
      fCmd.Clear;
      fClassCmd.Clear;
      simpleClass.Clear;
      if ExportChecked then
      begin
        // Системные таблицы
        fCmd.Add('select s.* from settings s');
        fCmd.Add('select s.* from UpdateTables s');
        simpleClass.Add('all');
        fWait.InitPgSecond(fCmd.Count);
        CopyObjectFromMDB(fStruct, fCmd, simpleClass);
        fWait.NextFirst;
      end;
      
      for i:=0 to Length(fCheckedTree)-1 do
      begin
        if fSignalEndWait then
          exit;
        fCmd.Clear;
        fClassCmd.Clear;
        simpleClass.Clear;

        fWait.InitPgSecond(TObjectClass(fCheckedTree[i].Data).GetCommandsCount(ExportChecked));

        if Copy(TObjectClass(fCheckedTree[i].Data).Code,1,1) <> '!' then
        begin
          if not TObjectClass(fCheckedTree[i].Data).isSelectedAll then
          begin
            // Представления
            TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toCriteria, ExportChecked);
            CopyAndInsert(fStruct, fCmd, TObjectClass(fCheckedTree[i].Data).SelectedCrit);
            // Операции
            TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toMethod, ExportChecked);
            CopyAndInsert(fStruct, fCmd, TObjectClass(fCheckedTree[i].Data).SelectedMethod);
            // Атрибуты
            TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toAttribute, ExportChecked);
            CopyAndInsert(fStruct, fCmd, TObjectClass(fCheckedTree[i].Data).SelectedAttr);
            // Состояния
            TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toState, ExportChecked);
            CopyAndInsert(fStruct, fCmd, TObjectClass(fCheckedTree[i].Data).SelectedState);
            // Переходы
            TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toTransition, ExportChecked);
            CopyAndInsert(fStruct, fCmd, TObjectClass(fCheckedTree[i].Data).SelectedTrans);
            // Индексы
            TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toIndex, ExportChecked);
            CopyAndInsert(fStruct, fCmd, TObjectClass(fCheckedTree[i].Data).SelectedInd);
            // Ограничения
            TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toConstraint, ExportChecked);
            CopyAndInsert(fStruct, fCmd, TObjectClass(fCheckedTree[i].Data).SelectedConst);
            // Триггеры
            TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toTrigger, ExportChecked);
            CopyAndInsert(fStruct, fCmd, TObjectClass(fCheckedTree[i].Data).SelectedTrig);
            // Информация по классам
            TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toClass, ExportChecked);
          end else
            TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toAny, ExportChecked);
        end else
        begin
          TObjectClass(fCheckedTree[i].Data).GetCommands(fCmd, fClassCmd, toAny, ExportChecked);
          CopyAndInsert(fStruct, fCmd, TObjectClass(fCheckedTree[i].Data).SelectedItems);
        end;
        // Выполним  запросы с фильтром по классу
        if fClassCmd.Count > 0 then
        begin
          simpleClass.Add(TObjectClass(fCheckedTree[i].Data).GetCodeFilter);
          CopyAndInsert(fStruct, fClassCmd, simpleClass);
        end;
        fWait.NextFirst;
      end;
      // Добавляем группы после очистки таблицы классов
      QueryActualGuide;
      fWait.NextFirst;

      // Переименование сделаем в 2 прохода: сначала все кроме классов
      fWait.InitPgSecond(fRename.CountStepRename);
      for i:=0 to fRename.CountInfo-1 do
      begin
        fCmd.Clear;
        fInfo := fRename.GetRenameObj(i);
        fRename.GetCommandRename(fInfo, [toAttribute, toCriteria, toMethod, toIndex, toState, toTransition, toConstraint, toTrigger, toMacroPrint], fCmd);
        QueryRename(fCmd, fInfo);
      end;
      // Классы
      for i:=0 to fRename.CountInfo-1 do
      begin
        fCmd.Clear;
        fInfo := fRename.GetRenameObj(i);
        fRename.GetCommandRename(fInfo, [toClass], fCmd);
        QueryRename(fCmd, fInfo);
      end;
      // Обновление кода
      fWait.InitPgSecond(fSource.CountStepUpdate);
      for i:=0 to fSource.CountInfo-1 do
      begin
        fCmd.Clear;
        fSrc := fSource.GetSourceObj(i);
        fSource.GetCommandSource(fSrc, fCmd);
        QuerySource(fCmd, fSrc);
      end;
    finally
      FreeAndNil(fCmd);
      FreeAndNil(fClassCmd);
      FreeAndNil(simpleClass);

      // Удалим временные индексы
      if not ExportChecked then
      begin
        acSaveMDB.Execute('DROP INDEX SOURCES_LONG_TMP1 on SOURCES_LONG');
        acSaveMDB.Execute('DROP INDEX METHOD_ORDER_TMP1 on METHOD_ORDER');
        acSaveMDB.Execute('DROP INDEX METHODS_TMP1 on METHODS');
        acSaveMDB.Execute('DROP INDEX CRITERIA_TRIES_TMP1 on CRITERIA_TRIES');
      end;
      acSaveMDB.Close;
      CancelWait(true);
      // Сожмем БД
      if not ExportChecked then
        CompactDatabase(fFileName);
      
      if fEndClose then
        Close;
    end;
  finally
    FreeAndNil(fStruct);
  end;
end;

procedure TfrmMain.CompactDatabase(DatabaseName: string);
const
  TempFile='temp';
  dbLangGeneral = ';LANGID=0x0409;CP=1252;COUNTRY=0';
  dbVersion30 = 36;
var
 FullTempFileName: string;
 Path: string;
 V: Variant;
 i: integer;
begin
 try
   if DatabaseName='' then
   begin
    MessageDlg('Не указано имя базы данных, выполнение процедуры приостановленно.', mtError, [mbOk], 0);
    exit;
   end;

   Path := ExtractFileDir(DatabaseName);
   FullTempFileName := Path+'\'+TempFile+'.mdb';
   i := 0;
   while FileExists(FullTempFileName) do
   begin
     FullTempFileName := Path+'\'+TempFile+IntToStr(i) + '.mdb';
     i := i + 1;
   end;

   V := CreateOleObject('DAO.DBEngine.36');
   try
     CreateWait(0, 'сжатие');
     V.CompactDatabase(DatabaseName, FullTempFileName,  dbLangGeneral, dbVersion30); // сжимаем
   finally
     V := 0;
     CancelWait(true);
   end; 

   DeleteFile(PChar(DatabaseName)); // удаляем не упакованную базу
   RenameFile(FullTempFileName, DatabaseName); //  переименовываем упакованную базу
 except
   // выдаем сообщение об исключительной ситуации 
   on E: Exception do
     MessageDlg('Ошибка при сжатии БД: ' + e.message, mtError, [mbOk], 0);
 end;
end;


procedure TfrmMain.aRenameExecute(Sender: TObject);
const
  class_unique = 'select id from classes where id <> ''%s'' and id = :short';
  attr_unique = 'select * from class_attributes where class_id = ''%s'' and attr_id <> ''%s'' and attr_id = :short';
  crit_unique = 'select * from CRITERIA where class_id = ''%s'' and SHORT_NAME <> ''%s'' and SHORT_NAME = :short';
  meth_unique = 'select * from METHODS where class_id = ''%s'' and SHORT_NAME <> ''%s'' and SHORT_NAME = :short';
  index_unique = 'select * from CLASS_INDEXES where NAME <> ''%s'' and NAME = :short';
  trigger_unique = 'select * from CLASS_TRIGGERS where NAME <> ''%s'' and NAME = :short';
  transition_unique = 'select * from TRANSITIONS where class_id = ''%s'' and SHORT_NAME <> ''%s'' and SHORT_NAME = :short';
  states_unique = 'select * from STATES where class_id = ''%s'' and ID <> ''%s'' and ID = :short';
  constr_unique = 'select * from CLASS_CONSTRAINTS where NAME <> ''%s'' and NAME = :short';
  prints_unique = 'select * from MACRO_VALUES where DRIVER_ID = ''%s'' and MACRO_NAME <> ''%s'' and MACRO_NAME = :short';
var
  fForm: TfrmRename;
  fInfo: TRename;
  qCheckSQL: TADOQuery;
  vId: string;
  vMaxLength: integer;
  vType: TTypeObj;
begin
  qCheckSQL := TADOQuery.Create(self);
  qCheckSQL.Connection := acMain;
  qCheckSQL.SQL.Text := '';
  try
    if tvClasses.Focused then
    begin
      vType := toClass;
      vId := TObjectClass(tvClasses.Selected.Data).GetCodeFilter;
    end else
    begin
      vType := GetTypeObjByCode(qItems.FieldByName('id_type').AsString);
      if vType = toAttribute then
        vId := TObjectClass(tvClasses.Selected.Data).Code + '#' + qItems.FieldByName('id').AsString
      else
        vId := qItems.FieldByName('id').AsString;
    end;
    if vType in [toClass, toMethod, toAttribute] then
      vMaxLength := 16
    else
      vMaxLength := 30;
      
    if vType = toClass then
      qCheckSQL.SQL.Text := Format(class_unique, [vId])
    else if vType = toCriteria then
      qCheckSQL.SQL.Text := Format(crit_unique, [TObjectClass(tvClasses.Selected.Data).GetCodeFilter, qItems.FieldByName('attr_id').AsString])
    else if vType = toMethod then
      qCheckSQL.SQL.Text := Format(meth_unique, [TObjectClass(tvClasses.Selected.Data).GetCodeFilter, qItems.FieldByName('attr_id').AsString])
    else if vType = toAttribute then
      qCheckSQL.SQL.Text := Format(attr_unique, [TObjectClass(tvClasses.Selected.Data).GetCodeFilter, qItems.FieldByName('attr_id').AsString])
    else if vType = toIndex then
      qCheckSQL.SQL.Text := Format(index_unique, [qItems.FieldByName('attr_id').AsString])
    else if vType = toState then
      qCheckSQL.SQL.Text := Format(states_unique, [TObjectClass(tvClasses.Selected.Data).GetCodeFilter, qItems.FieldByName('attr_id').AsString])
    else if vType = toTransition then
      qCheckSQL.SQL.Text := Format(transition_unique, [TObjectClass(tvClasses.Selected.Data).GetCodeFilter, qItems.FieldByName('attr_id').AsString])
    else if vType = toConstraint then
      qCheckSQL.SQL.Text := Format(constr_unique, [qItems.FieldByName('attr_id').AsString])
    else if vType = toTrigger then
      qCheckSQL.SQL.Text := Format(trigger_unique, [qItems.FieldByName('attr_id').AsString])
    else if vType = toMacroPrint then
      qCheckSQL.SQL.Text := Format(prints_unique, [TObjectClass(tvClasses.Selected.Data).GetCodeFilter, qItems.FieldByName('attr_id').AsString]);

    if fRename.GetRename(vId, fInfo) then
      fForm := TfrmRename.Create(Self, fInfo.fNewShort, fInfo.fNewFull, qCheckSQL, vMaxLength)
    else
    begin
      if tvClasses.Focused then
        fForm := TfrmRename.Create(Self, TObjectClass(tvClasses.Selected.Data).GetCodeFilter, tvClasses.Selected.Text, qCheckSQL, vMaxLength)
      else
        fForm := TfrmRename.Create(Self, qItems.FieldByName('attr_id').AsString, qItems.FieldByName('name').AsString, qCheckSQL, vMaxLength);
    end;
    try
      if Assigned(fForm) then
      begin
        if fForm.ShowModal = mrOk then
        begin
          if tvClasses.Focused then
          begin
            fRename.RenameObject(vId, fForm.edShort.Text, fForm.edName.Text, toClass,
                                 '', '', TObjectClass(tvClasses.Selected.Data).GetCodeFilter, tvClasses.Selected.Text);
          end else
          begin
            fRename.RenameObject(vId, fForm.edShort.Text, fForm.edName.Text, vType,
                                 TObjectClass(tvClasses.Selected.Data).GetCodeFilter, tvClasses.Selected.Text,
                                 qItems.FieldByName('attr_id').AsString, qItems.FieldByName('name').AsString);
          end;
          fRename.SetInfoSG(sgRename);
          SetPanelSearch;
          pcSearch.ActivePageIndex := tsRename.PageIndex;
        end;
      end;
    finally
      FreeAndNil(fForm);
    end;
  finally
    qCheckSQL.Close;
    FreeAndNil(qCheckSQL);
  end;
end;

procedure TfrmMain.qItemsBeforeOpen(DataSet: TDataSet);
begin
  qItems.Filtered := false;
  with qItems.Parameters do
  begin
    ParamByName('class_id').DataType := ftString;
    ParamByName('class_id').Value := SelectedClassNode.Code;
    ParamByName('struct').DataType := ftInteger;
    if (SelectedClassNode.isGroup) then
      ParamByName('struct').Value := 1
    else
      ParamByName('struct').Value := 0;
    ParamByName('class').DataType := ftInteger;
    if (not SelectedClassNode.isGroup) then
      ParamByName('class').Value := 1
    else
      ParamByName('class').Value := 0;
  end;
end;

procedure TfrmMain.qItemsAfterOpen(DataSet: TDataSet);
begin
  try
    qItems.DisableControls;
    SelectedClassNode.ClearAll;
    if (SelectedClassNode.Code <> '!PROCEDURES') and
        (SelectedClassNode.Code <> '!G') and
        (SelectedClassNode.Code <> '!U') and
        (SelectedClassNode.Code <> '!REPORT') then
      SelectedClassNode.AppendToAll(SelectedClassNode.Code, '5');

    if (qItems.RecordCount > 0) then
    begin
      qItems.First;
      while not qItems.Eof do
      begin
        if (qItems.FieldByName('id_type').AsString <> '6') and
            (qItems.FieldByName('id_type').AsString <> '5') then
          SelectedClassNode.AppendToAll(qItems.FieldByName('id').AsString, qItems.FieldByName('id_type').AsString);
        qItems.Next;
      end;
      qItems.First;
    end;
  finally
    qItems.EnableControls;
    SelectedClassNode.SetCalcAllItems;
    // Фильтр
    SetFilerItems;
  end;
  setStateIndex(fCurrentNode);
end;

procedure TfrmMain.tDelayChangeClassTimer(Sender: TObject);
begin
  tDelayChangeClass.Enabled := false;
  aRefresh.Execute;
end;

function TfrmMain.getSelectedClassNode: TObjectClass;
begin
  if Assigned(fCurrentNode) then
    Result := TObjectClass(fCurrentNode.Data)
  else
    Result := nil;
end;

procedure TfrmMain.aDebugExecute(Sender: TObject);
begin
  tTotalmemory.Enabled := not tTotalmemory.Enabled;
  if tTotalmemory.Enabled then
    sbMain.Panels.Add
  else
    sbMain.Panels.Delete(sbMain.Panels.Count-1);
end;

procedure TfrmMain.tTotalmemoryTimer(Sender: TObject);
var
  pmc: PPROCESS_MEMORY_COUNTERS;
  cb: Integer;
begin
  cb := SizeOf(_PROCESS_MEMORY_COUNTERS);
  GetMem(pmc, cb);
  pmc^.cb := cb;
  if GetProcessMemoryInfo(GetCurrentProcess(), pmc, cb) then
    sbMain.Panels[sbMain.Panels.Count-1].Text := Floattostr(pmc^.WorkingSetSize/1024/1024) + ' KB';
  FreeMem(pmc);
end;

procedure TfrmMain.DeleteNode(pNode: TTreeNode);
var
  vObj: TObjectClass;
begin
  vObj := TObjectClass(pNode.Data);
  FreeAndNil(vObj);
  pNode.Data := nil;
  pNode.Delete;
end;

procedure TfrmMain.aReopenExecute(Sender: TObject);
begin
  CloseMDB;
  LoadMDB(fFileOpen);
end;

procedure TfrmMain.aDebugCloseExecute(Sender: TObject);
begin
  CloseMDB;
end;

procedure TfrmMain.aSelectAllClassExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vCnt, i: integer;
  function ActionNode(pNode: TTreeNode): TTreeNode;
  begin
    if not fSignalEndWait then
    begin
      fWait.setDescription(TObjectClass(pNode.Data).Code);
      fWait.SetPosFirst(pNode.AbsoluteIndex);
      if pNode.HasChildren then
      begin
        // Посчитаем дочки
        CalcChild(pNode);
        // Могли добавиться элементы
        fWait.InitPgFirst(tvClasses.Items.Count, pNode.AbsoluteIndex);
        Result := ActionNode(pNode.getFirstChild)
      end else
        Result := pNode.GetNext;
      // Пост действия над нодой
      fCurrentNode := pNode;
      SetStateNode(pNode, true, Boolean(TAction(Sender).Tag));
    end else
      Result := nil;
  end;
begin
  CreateWait(2, 'Выделение');
  try
    tvClasses.Items.BeginUpdate;
    qItems.DisableControls;
    if Boolean(TAction(Sender).Tag) then
    begin
      fWait.InitPgFirst(tvClasses.Items.Count, 0);
      if tvClasses.Items.Count > 0 then
        vNode := tvClasses.Items[0]
      else
        vNode := nil;
      while vNode <> nil do
        vNode := ActionNode(vNode);
    end else
    begin
      fWait.InitPgFirst(Length(fCheckedTree), 0);
      vCnt := Length(fCheckedTree);
      i := 0;
      while vCnt > 0 do
      begin
        i := i + 1;
        fWait.setDescription(TObjectClass(fCheckedTree[vCnt-1].Data).Code);
        fWait.SetPosFirst(i);
        SetStateNode(TObjectClass(fCheckedTree[vCnt-1].Data).Node, true, Boolean(TAction(Sender).Tag));
        vCnt := Length(fCheckedTree);
      end;
    end;
  finally
    CancelWait(true);
    tvClasses.Items.EndUpdate;
    qItems.EnableControls;
    fCurrentNode := tvClasses.Selected;
    aRefresh.Execute;
  end;
end;

procedure TfrmMain.CreateWait(pMode: integer; pDescr: string);
begin
  fWait := TfrmWait.Create(Self, pMode, pDescr);
  fWait.Show;
  DisableAll(false);
  fSignalEndWait := false;
  Application.ProcessMessages;
end;

procedure TfrmMain.CancelWait(pFree: boolean);
begin
  if Assigned(fWait) and (pFree) then
  begin
     fWait.Close;
     DisableAll(true);
     fWait := nil;
     fSignalEndWait := false;
  end else
    fSignalEndWait := true;
end;

procedure TfrmMain.aSelectAllItemsUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (aExport.Checked) and (qItems.Active) and (qItems.RecordCount > 0);
end;

procedure TfrmMain.aSelectAllItemsExecute(Sender: TObject);
var
  curRow: TBookmark;
begin
  if (qItems.RecordCount > 0) then
  begin
    try
      qItems.DisableControls;
      curRow := qItems.GetBookmark;
      qItems.First;
      while not qItems.Eof do
      begin
        if ((not CurrentItemsIsSelect) and Boolean(TAction(Sender).Tag)) or
           ((CurrentItemsIsSelect) and (not Boolean(TAction(Sender).Tag))) then
        begin
          ChangeItemCheck;
        end;
        qItems.Next;
      end;
      qItems.GotoBookmark(curRow);
    finally
      qItems.EnableControls;
      qItems.FreeBookmark(curRow);
      curRow := nil;
      grdItems.Repaint;
      tvClasses.Repaint;
    end;
  end;
end;

function TfrmMain.CurrentItemsIsSelect: boolean;
begin
  Result := false;
  if (Assigned(SelectedClassNode)) and
      (Assigned(SelectedClassNode.TargetNode)) and
      (SelectedClassNode.isGroup) and
      (qItems.FieldByName('id_type').AsString = '6') and
      (TObjectClass(SelectedClassNode.TargetNode.Data).Selected) then
    Result := true
  else if (Assigned(SelectedClassNode)) and
          (SelectedClassNode.isSelect(qItems.FieldByName('id').AsString, qItems.FieldByName('id_type').AsString)) then
    Result := true;
end;

procedure TfrmMain.aSearchUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := acMain.Connected;
end;

procedure TfrmMain.aEditMethUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (qItems.Active) and (qItems.RecordCount > 0);
end;
  
procedure TfrmMain.aRenameUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled :=
          // Классы без групповых записей
          ((tvClasses.Focused and Assigned(tvClasses.Selected) and
            (TObjectClass(tvClasses.Selected.Data).Code <> '') and
            (Copy(TObjectClass(tvClasses.Selected.Data).Code,1,1) <> '!')) or
           // Методы, атрибуты и представления
           (grdItems.Focused and
            (qItems.Active) and
            (qItems.RecordCount > 0) and
            ((qItems.FieldByName('id_type').AsString = '0') or
             (qItems.FieldByName('id_type').AsString = '1') or
             isMethodByType(qItems.FieldByName('id_type').AsString) or
             (qItems.FieldByName('id_type').AsString = '5') or
             (qItems.FieldByName('id_type').AsString = '6') or
             (qItems.FieldByName('id_type').AsString = '7') or
             (qItems.FieldByName('id_type').AsString = '8') or
             (qItems.FieldByName('id_type').AsString = '9') or
             (qItems.FieldByName('id_type').AsString = '*') or
             (qItems.FieldByName('id_type').AsString = '>') or
             (qItems.FieldByName('id_type').AsString = '!'))));
end;

procedure TfrmMain.sgRenameMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  ARow, ACol: Integer;
begin
  sgRename.MouseToCell(X, Y, ACol, ARow);
  if (ACol >= 0) and (ARow > 0) then
  begin
    if sgRename.Hint <> sgRename.Cells[ACol, ARow] then
      Application.CancelHint;
    sgRename.Hint := sgRename.Cells[ACol, ARow];
  end else
    Application.CancelHint;
end;

procedure TfrmMain.tsRenameResize(Sender: TObject);
var
  vWidth: integer;
begin
  vWidth := trunc((sgRename.Width - sgRename.ColWidths[0]) / 3) - 5;
  sgRename.ColWidths[1] := vWidth;
  sgRename.ColWidths[2] := vWidth;
  sgRename.ColWidths[3] := sgRename.Width - sgRename.ColWidths[0] - vWidth*2 - 7;
end;

procedure TfrmMain.aNextExecute(Sender: TObject);
begin
  fHistoryIndex := fHistoryIndex + 1;
  fHistoryBlock := true;
  FindNodeByCode(fHistoryClass.Strings[fHistoryIndex],true);
  fHistoryBlock := false;
end;

procedure TfrmMain.aBackExecute(Sender: TObject);
begin
  fHistoryIndex := fHistoryIndex - 1;
  fHistoryBlock := true;
  FindNodeByCode(fHistoryClass.Strings[fHistoryIndex],true);
  fHistoryBlock := false;
end;

procedure TfrmMain.aNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (fHistoryIndex >= 0) and Assigned(fHistoryClass) and (fHistoryIndex < fHistoryClass.Count-1);
end;

procedure TfrmMain.aBackUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (fHistoryIndex > 0);
end;

procedure TfrmMain.aDelRenameUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := sgRename.RowCount > 1;
end;

procedure TfrmMain.aDelRenameExecute(Sender: TObject);
begin
  fRename.Delete(sgRename.Row-1);
  fRename.SetInfoSG(sgRename);
  SetPanelSearch;
end;

procedure TfrmMain.sgRenameDblClick(Sender: TObject);
begin
  aGoto.Execute;
end;

procedure TfrmMain.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
  Str: TStringList;
  expForm: TfrmError;
begin
  Str := TStringList.Create;
  try
    JclLastExceptStackListToStrings(Str, True, True, True, True);
    expForm := TfrmError.Create(self, E.Message, Str.Text);
    expForm.ShowModal;
  finally
    FreeAndNil(Str);
    FreeAndNil(expForm);
  end;
end;

// Метод переименования ресурсов
procedure HookResourceString(ResStringRec: pResStringRec; NewStr: pChar);
var
  OldProtect: DWORD;
begin
  VirtualProtect(ResStringRec, SizeOf(ResStringRec^), PAGE_EXECUTE_READWRITE, @OldProtect);
  ResStringRec^.Identifier := Integer(NewStr);
  VirtualProtect(ResStringRec, SizeOf(ResStringRec^), OldProtect, @OldProtect);
end;

procedure TfrmMain.aDelSourceExecute(Sender: TObject);
begin
  fSource.Delete(sgSource.Row-1);
  fSource.SetInfoSG(sgSource);
  SetPanelSearch;
end;

procedure TfrmMain.aDelSourceUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := sgSource.RowCount > 1;
end;

procedure TfrmMain.sgSourceDblClick(Sender: TObject);
begin
  aGoto.Execute;
end;

procedure TfrmMain.sgSourceMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  ARow, ACol: Integer;
begin
  sgSource.MouseToCell(X, Y, ACol, ARow);
  if (ACol >= 0) and (ARow > 0) then
  begin
    if sgSource.Hint <> sgSource.Cells[ACol, ARow] then
      Application.CancelHint;
    sgSource.Hint := sgSource.Cells[ACol, ARow];
  end else
    Application.CancelHint;
end;

procedure TfrmMain.tsSourceMainResize(Sender: TObject);
var
  vWidth: integer;
begin
  vWidth := trunc((sgSource.Width - sgSource.ColWidths[0]) / 2) - 3;
  sgSource.ColWidths[1] := vWidth;
  sgSource.ColWidths[2] := sgSource.Width - sgSource.ColWidths[0] - vWidth - 5;
end;

procedure TfrmMain.aSQLUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := acMain.Connected;
end;

procedure TfrmMain.aSQLExecute(Sender: TObject);
var
  fSQL: TfrmSQL;
begin
  fSQL := TfrmSQL.Create(Self);
  fSQL.Show;
end;

initialization
  JclStackTrackingOptions := JclStackTrackingOptions + [stRAWMode];
  JclStartExceptionTracking;
  HookResourceString(@SMsgDlgWarning, 'Предупреждение');
  HookResourceString(@SMsgDlgError, 'Ошибка');
  HookResourceString(@SMsgDlgInformation, 'Информация');
  HookResourceString(@SMsgDlgConfirm, 'Подтверждение');
  HookResourceString(@SMsgDlgYes, '&Да');
  HookResourceString(@SMsgDlgNo, '&Нет');
  HookResourceString(@SMsgDlgOK, 'OK');
  HookResourceString(@SMsgDlgCancel, 'Отмена');
  HookResourceString(@SMsgDlgHelp, '&Помощь');
  HookResourceString(@SMsgDlgHelpNone, 'Помощь недоступна');
  HookResourceString(@SMsgDlgHelpHelp, 'Помощь');
  HookResourceString(@SMsgDlgAbort, '&Прервать');
  HookResourceString(@SMsgDlgRetry, 'По&вторить');
  HookResourceString(@SMsgDlgIgnore, '&Игнорировать');
  HookResourceString(@SMsgDlgAll, '&Все');
  HookResourceString(@SMsgDlgNoToAll, 'H&ет для Всех');
  HookResourceString(@SMsgDlgYesToAll, 'Д&а для Всех');
finalization
  JclStopExceptionTracking;

end.

