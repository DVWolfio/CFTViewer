unit uClass;

interface

uses ComCtrls, SysUtils, Classes;

type
  TTypeObj = (toClass, toMethod, toCriteria, toAttribute, toIndex, toState, toTransition, toConstraint, toTrigger, toMacroPrint, toAny, toView);
  TTypeObjs = set of TTypeObj;
  TObjectClass = class
  private
      fCode: string;
      fNode: TTreeNode;
      fSelectedAttr: TStrings;
      fSelectedMethod: TStrings;
      fSelectedCrit: TStrings;

      fSelectedInd: TStrings;
      fSelectedConst: TStrings;
      fSelectedTrig: TStrings;
      fSelectedTrans: TStrings;
      fSelectedState: TStrings;
      
      fUnSelectedAttr: TStrings;
      fUnSelectedMethod: TStrings;
      fUnSelectedCrit: TStrings;
      
      fUnSelectedInd: TStrings;
      fUnSelectedConst: TStrings;
      fUnSelectedTrig: TStrings;
      fUnSelectedTrans: TStrings;
      fUnSelectedState: TStrings;

      fSelectedItems: TStrings;
      fUnSelectedItems: TStrings;
      fTargetNode: TTreeNode;
      fSelected: boolean;
      fClassSelect: boolean;
      fGroup: boolean;
      fCalcAllItems: boolean;
      fSelectedAll: boolean;
      function getStringSelectedByType(vType: string): TStrings;
      function getUnStringSelectedByType(vType: string): TStrings;
  public
      constructor Create(vCode: string; vGroup: boolean; vNode: TTreeNode);
      destructor Destroy; override;

      function isSelect(vCode: string; vType: string): boolean;
      function isClassSelect: boolean;

      // Возвращает true если добавляется первый объект
      function AddSelect(vCode: string; vType: string): boolean;
      // Возвращает true если удаляется последний объект
      function DelSelect(vCode: string; vType: string): boolean;

      property TargetNode: TTreeNode read fTargetNode write fTargetNode;

      property Code: string read fCode;
      property Selected: boolean read fSelected write fSelected;

      procedure SelectAll;
      procedure DeSelectAll;

      function CountChecked: integer;
      function CountAll: integer;

      procedure AppendToAll(vCode: string; vType: string);
      procedure ClearAll;

      property isGroup: boolean read fGroup;

      property SelectedAttr: TStrings read fSelectedAttr;
      property SelectedMethod: TStrings read fSelectedMethod;
      property SelectedCrit: TStrings read fSelectedCrit;
      property SelectedItems: TStrings read fSelectedItems;

      property SelectedState: TStrings read fSelectedState;
      property SelectedTrans: TStrings read fSelectedTrans;
      property SelectedTrig: TStrings read fSelectedTrig;
      property SelectedConst: TStrings read fSelectedConst;
      property SelectedInd: TStrings read fSelectedInd;
      
      property isCalcAllItems: boolean read fCalcAllItems;
      procedure SetCalcAllItems;
      property isSelectedAll: boolean read fSelectedAll;
      property Node: TTreeNode read fNode;
      // Получение комманд для переноса
      procedure GetCommands(var fCmd, fClassCmd: TStrings; pType: TTypeObj; pCopy: boolean);
      function GetCommandsCount(pCopy: boolean): integer;
      function GetCodeFilter: string;
  end;

function isMethodByType(vType: string): boolean;
function GetTypeName(pType: TTypeObj): string;
function GetTypeObjByCode(pType: string): TTypeObj;

implementation

function isMethodByType(vType: string): boolean;
begin
  if (vType = 'R') or (vType = 'P') or
     (vType = 'M') or (vType = 'Y') or
     (vType = 'D') or (vType = 'C') or
     (vType = 'A') or (vType = 'T') or
     (vType = 'Z') or (vType = 'O') or
     (vType = 'G') or (vType = 'L') or
     (vType = 'S') then
    Result := true
  else
    Result := false;
end;

function GetTypeName(pType: TTypeObj): string;
begin
  if pType = toClass then
    Result := 'ТБП'
  else if pType = toAttribute then
    Result := 'Реквизит'
  else if pType = toMethod then
    Result := 'Операция'
  else if pType = toCriteria then
    Result := 'Представление';
end;

function GetTypeObjByCode(pType: string): TTypeObj;
begin
  if pType = '0' then
    Result := toAttribute
  else if pType = '1' then
    Result := toCriteria
  else if isMethodByType(pType) then
    Result := toMethod
  else if pType = '5' then
    Result := toClass
  else if pType = '6' then
    Result := toClass
  else if pType = '7' then
    Result := toMacroPrint
  else if pType = '8' then
    Result := toConstraint
  else if pType = '9' then
    Result := toTrigger
  else if pType = '!' then
    Result := toState
  else if pType = '*' then
    Result := toIndex
  else if pType = '>' then
    Result := toTransition
  else if pType = '&' then
    Result := toView
  else
    Result := toAny;
end;

constructor TObjectClass.Create(vCode: string; vGroup: boolean; vNode: TTreeNode);
begin
  fCode := vCode;
  fSelected := false;
  fNode := vNode;

  fSelectedItems := TStringList.Create;
  fSelectedAttr := TStringList.Create;
  fSelectedMethod := TStringList.Create;
  fSelectedCrit := TStringList.Create;
  fSelectedInd := TStringList.Create;
  fSelectedConst := TStringList.Create;
  fSelectedTrig := TStringList.Create;
  fSelectedTrans := TStringList.Create;
  fSelectedState := TStringList.Create;

  fUnSelectedItems := TStringList.Create;
  fUnSelectedAttr := TStringList.Create;
  fUnSelectedMethod := TStringList.Create;
  fUnSelectedCrit := TStringList.Create;
  fUnSelectedInd := TStringList.Create;
  fUnSelectedConst := TStringList.Create;
  fUnSelectedTrig := TStringList.Create;
  fUnSelectedTrans := TStringList.Create;
  fUnSelectedState := TStringList.Create;

  fTargetNode := nil;
  fGroup := vGroup;
  fClassSelect := false;
  fCalcAllItems := false;
  fSelectedAll := false;
end;

procedure TObjectClass.SetCalcAllItems;
begin
   fCalcAllItems := true;
   if fSelectedAll then
   begin
     SelectAll;
     fSelectedAll := false;
   end;
end;

function TObjectClass.getStringSelectedByType(vType: string): TStrings;
begin
  if vType = '0' then
    Result := fSelectedAttr
  else if vType = '1' then
    Result := fSelectedCrit
  else if isMethodByType(vType) then
    Result := fSelectedMethod
  else if vType = '*' then
    Result := fSelectedInd
  else if vType = '>' then
    Result := fSelectedTrans
  else if vType = '!' then
    Result := fSelectedState
  else if vType = '8' then
    Result := fSelectedConst
  else if vType = '9' then
    Result := fSelectedTrig
  else
    Result := fSelectedItems;
end;

function TObjectClass.getUnStringSelectedByType(vType: string): TStrings;
begin
  if vType = '0' then
    Result := fUnSelectedAttr
  else if vType = '1' then
    Result := fUnSelectedCrit
  else if isMethodByType(vType) then
    Result := fUnSelectedMethod
  else if vType = '*' then
    Result := fUnSelectedInd
  else if vType = '>' then
    Result := fUnSelectedTrans
  else if vType = '!' then
    Result := fUnSelectedState
  else if vType = '8' then
    Result := fUnSelectedConst
  else if vType = '9' then
    Result := fUnSelectedTrig
  else
    Result := fUnSelectedItems;
end;

function TObjectClass.isSelect(vCode: string; vType: string): boolean;
begin
  if vType = '5' then
    Result := fClassSelect
  else
    Result := getStringSelectedByType(vType).IndexOf(vCode) >= 0;
end;

function TObjectClass.isClassSelect: boolean;
begin
  if fGroup then
    Result := Selected
  else
    Result := fClassSelect;
end;

function TObjectClass.AddSelect(vCode: string; vType: string): boolean;
var
  i: integer;
begin
  Result := CountChecked = 0;
  if (vType = '5') or (vType = '6') then
  begin
    fClassSelect := true;
  end else
  begin
    i := getUnStringSelectedByType(vType).IndexOf(vCode);
    if i >= 0 then
      getUnStringSelectedByType(vType).Delete(i);
    getStringSelectedByType(vType).Add(vCode);
  end;
end;

function TObjectClass.DelSelect(vCode: string; vType: string): boolean;
begin
  if (vType = '5') or (vType = '6') then
    fClassSelect := false
  else
  begin
    getStringSelectedByType(vType).Delete(getStringSelectedByType(vType).IndexOf(vCode));
    getUnStringSelectedByType(vType).Add(vCode);
  end;
  Result := CountChecked = 0;
end;

procedure TObjectClass.SelectAll;
begin
  if not fCalcAllItems then
    fSelectedAll := true
  else
  begin
    fSelectedItems.AddStrings(fUnSelectedItems);
    fUnSelectedItems.Clear;
    fSelectedAttr.AddStrings(fUnSelectedAttr);
    fUnSelectedAttr.Clear;
    fSelectedCrit.AddStrings(fUnSelectedCrit);
    fUnSelectedCrit.Clear;
    fSelectedMethod.AddStrings(fUnSelectedMethod);
    fUnSelectedMethod.Clear;

    fSelectedInd.AddStrings(fUnSelectedInd);
    fUnSelectedInd.Clear;
    fSelectedConst.AddStrings(fUnSelectedConst);
    fUnSelectedConst.Clear;
    fSelectedTrig.AddStrings(fUnSelectedTrig);
    fUnSelectedTrig.Clear;
    fSelectedTrans.AddStrings(fUnSelectedTrans);
    fUnSelectedTrans.Clear;
    fSelectedState.AddStrings(fUnSelectedState);
    fUnSelectedState.Clear;
  end;

  if not isGroup then
    fClassSelect := true;
end;

procedure TObjectClass.DeSelectAll;
begin
  if not fCalcAllItems then
    fSelectedAll := false
  else
  begin
    fUnSelectedItems.AddStrings(fSelectedItems);
    fSelectedItems.Clear;
    fUnSelectedAttr.AddStrings(fSelectedAttr);
    fSelectedAttr.Clear;
    fUnSelectedCrit.AddStrings(fSelectedCrit);
    fSelectedCrit.Clear;
    fUnSelectedMethod.AddStrings(fSelectedMethod);
    fSelectedMethod.Clear;

    fUnSelectedInd.AddStrings(fSelectedInd);
    fSelectedInd.Clear;
    fUnSelectedConst.AddStrings(fSelectedConst);
    fSelectedConst.Clear;
    fUnSelectedTrig.AddStrings(fSelectedTrig);
    fSelectedTrig.Clear;
    fUnSelectedTrans.AddStrings(fSelectedTrans);
    fSelectedTrans.Clear;
    fUnSelectedState.AddStrings(fSelectedState);
    fSelectedState.Clear;
  end;

  fClassSelect := false;
end;

function TObjectClass.CountChecked: integer;
begin
  Result := fSelectedItems.Count + fSelectedAttr.Count + fSelectedMethod.Count +
            fSelectedCrit.Count + fSelectedInd.Count + fSelectedConst.Count +
            fSelectedTrig.Count + fSelectedTrans.Count + fSelectedState.Count;
  if isClassSelect then
    Result := Result + 1;
end;

function TObjectClass.CountAll: integer;
begin
  Result := fUnSelectedItems.Count + fSelectedItems.Count +
            fUnSelectedAttr.Count + fSelectedAttr.Count +
            fUnSelectedCrit.Count + fSelectedCrit.Count +
            fUnSelectedMethod.Count + fSelectedMethod.Count +
            fUnSelectedInd.Count + fSelectedInd.Count +
            fUnSelectedConst.Count + fSelectedConst.Count +
            fUnSelectedTrig.Count + fSelectedTrig.Count +
            fUnSelectedTrans.Count + fSelectedTrans.Count +
            fUnSelectedState.Count + fSelectedState.Count + 1;
end;


procedure TObjectClass.ClearAll;
begin
  fUnSelectedItems.Clear;
  fUnSelectedAttr.Clear;
  fUnSelectedMethod.Clear;
  fUnSelectedCrit.Clear;
  fUnSelectedInd.Clear;
  fUnSelectedConst.Clear;
  fUnSelectedTrig.Clear;
  fUnSelectedTrans.Clear;
  fUnSelectedState.Clear;
end;

procedure TObjectClass.AppendToAll(vCode: string; vType: string);
begin
  if (vType <> '5') then
  begin
    if getStringSelectedByType(vType).IndexOf(vCode) < 0 then
      getUnStringSelectedByType(vType).Add(vCode);
  end;
end;

destructor TObjectClass.Destroy;
begin
  FreeAndNil(fSelectedAttr);
  FreeAndNil(fSelectedMethod);
  FreeAndNil(fSelectedCrit);
  FreeAndNil(fSelectedItems);
  FreeAndNil(fSelectedInd);
  FreeAndNil(fSelectedConst);
  FreeAndNil(fSelectedTrig);
  FreeAndNil(fSelectedTrans);
  FreeAndNil(fSelectedState);

  FreeAndNil(fUnSelectedAttr);
  FreeAndNil(fUnSelectedMethod);
  FreeAndNil(fUnSelectedCrit);
  FreeAndNil(fUnSelectedItems);
  FreeAndNil(fUnSelectedInd);
  FreeAndNil(fUnSelectedConst);
  FreeAndNil(fUnSelectedTrig);
  FreeAndNil(fUnSelectedTrans);
  FreeAndNil(fUnSelectedState);
  
  fTargetNode := nil;
  fNode := nil;

  inherited Destroy;
end;

function TObjectClass.GetCodeFilter: string;
begin
  if Copy(Code,1,7) = '!PRINT_' then
    Result := Copy(Code,8, Length(Code))
  else
    Result := Code;
end;

procedure TObjectClass.GetCommands(var fCmd, fClassCmd: TStrings; pType: TTypeObj; pCopy: boolean);
var
  vCmdPrev: string;
begin
  if pCopy then
    vCmdPrev := 'select '
  else
    vCmdPrev := 'delete ';
    
  if Code = '!REPORT' then
  begin
    if not isSelectedAll then
    begin
      fCmd.Add(vCmdPrev + 'vt.* from VIEWS_TEXT vt where vt.name = :filter');
      fCmd.Add(vCmdPrev + 'vt.* from REPORT_VIEWS vt where vt.name = :filter');
    end else
    begin
      fClassCmd.Add(vCmdPrev + 'vt.* from VIEWS_TEXT vt');
      fClassCmd.Add(vCmdPrev + 'vt.* from REPORT_VIEWS vt');
    end;
  end else if (Code = '!G') or (Code = '!U') then
  begin
    // Удаляем группы/пользователи и их права
    if not isSelectedAll then
    begin
      // Права
      fCmd.Add(vCmdPrev + 'us.* from CLASS_RIGHTS us where us.subj_id = :filter');
      fCmd.Add(vCmdPrev + 'us.* from CHECK_METHOD_RIGHTS us where us.subj_id = :filter');
      fCmd.Add(vCmdPrev + 'us.* from CRITERIA_RIGHTS us where us.subj_id = :filter');
      fCmd.Add(vCmdPrev + 'us.* from METHOD_RIGHTS us where us.subj_id = :filter');
      fCmd.Add(vCmdPrev + 'us.* from OBJECT_RULES us where us.subj_id = :filter');
      fCmd.Add(vCmdPrev + 'us.* from OBJECT_RIGHTS_EX us where us.subj_id = :filter');
      fCmd.Add(vCmdPrev + 'us.* from OBJECT_RIGHTS_LIST us where us.subj_id = :filter');
      fCmd.Add(vCmdPrev + 'us.* from PROCEDURE_RIGHTS us where us.subj_id = :filter');
      fCmd.Add(vCmdPrev + 'us.* from TRANSITION_RIGHTS us where us.subj_id = :filter');
      fCmd.Add(vCmdPrev + 'us.* from SUBJ_EQUAL us where us.subj_id = :filter');
      fCmd.Add(vCmdPrev + 'us.* from CLASS_RULES us where us.subj_id = :filter');
      // Группы/пользователи
      fCmd.Add(vCmdPrev + 'us.* from users us where us.username = :filter');
    end else
    begin
      fClassCmd.Add(vCmdPrev + 'us.* from CLASS_RIGHTS us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      fClassCmd.Add(vCmdPrev + 'us.* from CHECK_METHOD_RIGHTS us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      fClassCmd.Add(vCmdPrev + 'us.* from CRITERIA_RIGHTS us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      fClassCmd.Add(vCmdPrev + 'us.* from METHOD_RIGHTS us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      fClassCmd.Add(vCmdPrev + 'us.* from OBJECT_RULES us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      fClassCmd.Add(vCmdPrev + 'us.* from OBJECT_RIGHTS_EX us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      fClassCmd.Add(vCmdPrev + 'us.* from OBJECT_RIGHTS_LIST us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      fClassCmd.Add(vCmdPrev + 'us.* from PROCEDURE_RIGHTS us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      fClassCmd.Add(vCmdPrev + 'us.* from TRANSITION_RIGHTS us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      fClassCmd.Add(vCmdPrev + 'us.* from SUBJ_EQUAL us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      fClassCmd.Add(vCmdPrev + 'us.* from CLASS_RULES us where us.subj_id in (select username from users where type = ''' + Copy(Code,2,1) + ''')');
      // Группы
      fClassCmd.Add(vCmdPrev + 'us.* from users us where us.type = ''' + Copy(Code,2,1) + '''');
    end;
  end else if Code = '!PROCEDURES' then
  begin
    // Удаляем процедуры
    if not isSelectedAll then
    begin
      fCmd.Add(vCmdPrev + 'pp.* from report_procedures pp where pp.name in (select name from procedures where id = :filter)');
      fCmd.Add(vCmdPrev + 'pr.* from procedures pr where pr.id = :filter');
    end else
    begin
      fClassCmd.Add(vCmdPrev + 'pp.* from report_procedures pp where pp.name in (select name from procedures)');
      fClassCmd.Add(vCmdPrev + 'pr.* from procedures pr');
    end;
  end else if Copy(Code,1,7) = '!PRINT_' then
  begin
    // Удаляем макросы печати
    if not isSelectedAll then
      fCmd.Add(vCmdPrev + 'mv.* from macro_values mv where mv.driver_id = ''' +
        GetCodeFilter + ''' and mv.macro_id = :filter')
    else
      fClassCmd.Add(vCmdPrev + 'mv.* from macro_values mv where mv.driver_id = :filter');
    // Основной тип
    if ((isSelectedAll or (CountChecked = CountAll) and (not pCopy)) or
         ((isSelectedAll or (CountChecked > 0)) and pCopy)) then
      fClassCmd.Add(vCmdPrev + 'pt.* from printer_types pt where pt.id = :filter');
  end else
  begin
    if not isSelectedAll then
    begin
      // Реквизиты
      if pType in [toAttribute, toAny] then
      begin
        fCmd.Add(vCmdPrev + 'cl.* from class_attributes cl where cl.class_id = ''' + Code
                 + ''' and cl.attr_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from class_tab_columns cl where cl.class_id = ''' + Code
                 + ''' and cl.qual = :filter');
        fCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''CLASS_ATTRIBUTES''' +
                ' and dc.CHANGE_TYPE = ''' + Code + ''' and dc.obj_id = :filter');
      end;
      // Представления
      if pType in [toCriteria, toAny] then
      begin
        fCmd.Add(vCmdPrev + 'cl.* from criteria_tries cl where cl.criteria_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from criteria_prints cl where cl.criteria_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from criteria_print_columns cl where cl.criteria_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from criteria_complex_columns cl where cl.criteria_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from criteria_complex cl where cl.criteria_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from criteria_columns cl where cl.criteria_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from criteria cl where cl.class_id = ''' + Code
                 + ''' and cl.id = :filter');
        fCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''CRITERIA''' +
                ' and dc.CHANGE_TYPE in (''CRITERIA'', ''CRITERIA_COLUMNS'', ''CRITERIA_METHODS'', ''CRITERIA_PRINTS'') and dc.obj_id = :filter');
        fCmd.Add(vCmdPrev + 'dc.* from lraw dc where dc.id in (select id from topics where class = ''CRITERION''' +
                ' and owner = :filter)');
        fCmd.Add(vCmdPrev + 'dc.* from topics dc where dc.class = ''CRITERION''' +
                ' and dc.owner = :filter');
      end;
      // Операции
      if pType in [toMethod, toAny] then
      begin
        fCmd.Add(vCmdPrev + 'cl.* from method_order cl where cl.meth_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from method_parameters cl where cl.method_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from method_variables cl where cl.method_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from controls cl where cl.meth_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from criteria_methods cl where cl.method_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from lraw cl where cl.id in (select rtf_id from methods where id = :filter)');
        fCmd.Add(vCmdPrev + 'dc.* from lraw dc where dc.id in (select id from topics where class = ''METHOD''' +
                ' and owner = :filter)');
        fCmd.Add(vCmdPrev + 'cl.* from methods cl where cl.class_id = ''' + Code
                 + ''' and cl.id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from sources_long cl where cl.method_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from report_param_relations cl where cl.method_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from report_objects cl where cl.method_id = :filter');
        fCmd.Add(vCmdPrev + 'cl.* from report_formula cl where cl.method_id = :filter');
        fCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''METHODS''' +
                ' and dc.CHANGE_TYPE in (''CONTROLS'', ''METHOD_PARAMETERS'', ''METHODS'', ''SOURCES'', ''METHOD_VARIABLES'') and dc.obj_id = :filter');
        fCmd.Add(vCmdPrev + 'dc.* from topics dc where dc.class = ''METHOD''' +
                ' and dc.owner = :filter');
      end;
      // Состояния
      if pType in [toState, toAny] then
      begin
        fCmd.Add(vCmdPrev + 's.* from states s where s.class_id = ''' + Code
                 + ''' and s.id = :filter');
        fCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''STATES''' +
                ' and dc.CHANGE_TYPE = ''' + Code + ''' and dc.obj_id = :filter');
      end;
      // Переходы
      if pType in [toTransition, toAny] then
      begin
        fCmd.Add(vCmdPrev + 't.* from transitions t where t.class_id = ''' + Code
                 + ''' and t.id = :filter');
        fCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''TRANSITIONS''' +
                ' and dc.CHANGE_TYPE = ''' + Code + ''' and dc.obj_id = :filter');
      end;
      // Индексы
      if pType in [toIndex, toAny] then
      begin
        fCmd.Add(vCmdPrev + 'ci.* from class_indexes ci where ci.class_id = ''' + Code
                 + ''' and ci.name = :filter');
        fCmd.Add(vCmdPrev + 'ci.* from class_ind_columns ci where ci.index_name = :filter');
        fCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''INDEXES''' +
                ' and dc.CHANGE_TYPE = ''' + Code + ''' and dc.obj_id = :filter');
      end;
      // Ограничения
      if pType in [toConstraint, toAny] then
      begin
        fCmd.Add(vCmdPrev + 'ci.* from class_constraints ci where ci.class_id = ''' + Code
                 + ''' and ci.name = :filter');
        fCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''CONSTRAINTS''' +
                ' and dc.CHANGE_TYPE = ''' + Code + ''' and dc.obj_id = :filter');
      end;
      // Триггеры
      if pType in [toTrigger, toAny] then
      begin
        fCmd.Add(vCmdPrev + 'ci.* from class_triggers ci where ci.class_id = ''' + Code
                 + ''' and ci.name = :filter');
        fCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''TRIGGERS''' +
                ' and dc.CHANGE_TYPE = ''' + Code + ''' and dc.obj_id = :filter');
      end;
    end else
    begin
      // Реквизиты
      if pType in [toAttribute, toAny] then
      begin
        fClassCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''CLASS_ATTRIBUTES''' +
                ' and dc.CHANGE_TYPE = ''' + Code +
                ''' and dc.obj_id in (select attr_id from class_attributes where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from class_tab_columns cl where cl.class_id = :filter');
        fClassCmd.Add(vCmdPrev + 'cl.* from class_attributes cl where cl.class_id = :filter');
      end;
      // Представления
      if pType in [toCriteria, toAny] then
      begin
        fClassCmd.Add(vCmdPrev + 'cl.* from criteria_tries cl where cl.criteria_id in (select id from criteria where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from criteria_prints cl where cl.criteria_id in (select id from criteria where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from criteria_print_columns cl where cl.criteria_id in (select id from criteria where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from criteria_complex_columns cl where cl.criteria_id in (select id from criteria where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from criteria_complex cl where cl.criteria_id in (select id from criteria where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from criteria_columns cl where cl.criteria_id in (select id from criteria where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''CRITERIA''' +
                ' and dc.CHANGE_TYPE in (''CRITERIA'', ''CRITERIA_COLUMNS'', ''CRITERIA_METHODS'', ''CRITERIA_PRINTS'')' +
                ' and dc.obj_id in (select id from criteria where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'dc.* from lraw dc where dc.id in (select id from topics where class = ''CRITERION''' +
                ' and owner in (select id from criteria where class_id = :filter))');
        fClassCmd.Add(vCmdPrev + 'dc.* from topics dc where dc.class = ''CRITERION''' +
                ' and dc.owner in (select id from criteria where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from criteria cl where cl.class_id = :filter');
      end;
      // Операции
      if pType in [toMethod, toAny] then
      begin
        fClassCmd.Add(vCmdPrev + 'cl.* from method_order cl where cl.meth_id in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from method_parameters cl where cl.method_id in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from method_variables cl where cl.method_id in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from controls cl where cl.meth_id in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from criteria_methods cl where cl.method_id in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from lraw cl where cl.id in (select rtf_id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'dc.* from lraw dc where dc.id in (select id from topics where class = ''METHOD''' +
                ' and owner in (select id from methods where class_id = :filter))');
        fClassCmd.Add(vCmdPrev + 'cl.* from sources_long cl where cl.method_id in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from report_param_relations cl where cl.method_id in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from report_objects cl where cl.method_id in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from report_formula cl where cl.method_id in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''METHODS''' +
                ' and dc.CHANGE_TYPE in (''CONTROLS'', ''METHOD_PARAMETERS'', ''METHODS'', ''SOURCES'', ''METHOD_VARIABLES'') ' +
                'and dc.obj_id in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'dc.* from topics dc where dc.class = ''METHOD''' +
                ' and dc.owner in (select id from methods where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'cl.* from methods cl where cl.class_id = :filter');
      end;
      // Состояния
      if pType in [toState, toAny] then
      begin
        fClassCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''STATES''' +
                ' and dc.CHANGE_TYPE = ''' + Code +
                ''' and dc.obj_id in (select id from states where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 's.* from states s where s.class_id = :filter');
      end;
      // Переходы
      if pType in [toTransition, toAny] then
      begin
        fClassCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''TRANSITIONS''' +
                ' and dc.CHANGE_TYPE = ''' + Code +
                ''' and dc.obj_id in (select id from transitions where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 't.* from transitions t where t.class_id = :filter');
      end;
      // Индексы
      if pType in [toIndex, toAny] then
      begin
        fClassCmd.Add(vCmdPrev + 'ci.* from class_ind_columns ci where ci.index_name in (select name from class_indexes where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''INDEXES''' +
                ' and dc.CHANGE_TYPE = ''' + Code +
                ''' and dc.obj_id in (select name from class_indexes where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'ci.* from class_indexes ci where ci.class_id = :filter');
      end;
      // Ограничения
      if pType in [toConstraint, toAny] then
      begin
        fClassCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''CONSTRAINTS''' +
                ' and dc.CHANGE_TYPE = ''' + Code +
                ''' and dc.obj_id in (select name from class_constraints where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'ci.* from class_constraints ci where ci.class_id = :filter');
      end;
      // Триггеры
      if pType in [toTrigger, toAny] then
      begin
        fClassCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''TRIGGERS''' +
                ' and dc.CHANGE_TYPE = ''' + Code +
                ''' and dc.obj_id in (select name from class_triggers where class_id = :filter)');
        fClassCmd.Add(vCmdPrev + 'ci.* from class_triggers ci where ci.class_id = :filter');
      end;
    end;
    // Фильтр для ТБП
    if (pType in [toClass,toAny]) and
        ((isSelectedAll or (CountChecked = CountAll) and (not pCopy)) or
         ((isSelectedAll or (CountChecked > 0)) and pCopy)) then
    begin
      fClassCmd.Add(vCmdPrev + 'cl.* from class_tables cl where cl.class_id = :filter');
      fClassCmd.Add(vCmdPrev + 'dc.* from dict_changes dc where dc.obj_type = ''CLASSES''' +
                ' and dc.CHANGE_TYPE in (''CLASSES'', ''CLASS_TAB_COLUMNS'', ''CLASS_ATTRIBUTES'', ''STATES'', ''TRANSITIONS'') and dc.obj_id = :filter');
      fClassCmd.Add(vCmdPrev + 'cl.* from lraw cl where cl.id in (select id from topics where class = ''CLASS''' +
                    ' and owner = :filter)');
      fClassCmd.Add(vCmdPrev + 'cl.* from lraw cl where cl.id in (select validator_id from classes where id = :filter)');
      fClassCmd.Add(vCmdPrev + 'dc.* from topics dc where dc.class = ''CLASS''' +
                    ' and dc.owner = :filter');
      fClassCmd.Add(vCmdPrev + 'dc.* from vw_method_group_members_admin dc ' +
               'where dc.group_id in (select id from vw_method_groups_admin where class_id = :filter)');
      fClassCmd.Add(vCmdPrev + 'dc.* from vw_method_groups_admin dc '+
               'where dc.class_id = :filter');
      fClassCmd.Add(vCmdPrev + 'cl.* from classes cl where cl.id = :filter');
    end;
  end;
end;

// Только для ТБП и только если не включен режим выделено все
function TObjectClass.GetCommandsCount(pCopy: boolean): integer;
var
  fCmd, fCmdClass: TStrings;
begin
  Result := 0;
  fCmd := TStringList.Create;
  fCmdClass := TStringList.Create;
  try
    if Copy(Code,1,1) <> '!' then
    begin
      if not isSelectedAll then
      begin
        // Представления
        GetCommands(fCmd, fCmdClass, toCriteria, pCopy);
        Result := Result + fCmd.Count*SelectedCrit.Count;
        fCmd.Clear;
        // Операции
        GetCommands(fCmd, fCmdClass, toMethod, pCopy);
        Result := Result + fCmd.Count*SelectedMethod.Count;
        fCmd.Clear;
        // Атрибуты
        GetCommands(fCmd, fCmdClass, toAttribute, pCopy);
        Result := Result + fCmd.Count*SelectedAttr.Count;
        fCmd.Clear;
        // Состояния
        GetCommands(fCmd, fCmdClass, toState, pCopy);
        Result := Result + fCmd.Count*SelectedState.Count;
        fCmd.Clear;
        // Переходы
        GetCommands(fCmd, fCmdClass, toTransition, pCopy);
        Result := Result + fCmd.Count*SelectedTrans.Count;
        fCmd.Clear;
        // Индексы
        GetCommands(fCmd, fCmdClass, toIndex, pCopy);
        Result := Result + fCmd.Count*SelectedInd.Count;
        fCmd.Clear;
        // Ограничения
        GetCommands(fCmd, fCmdClass, toConstraint, pCopy);
        Result := Result + fCmd.Count*SelectedConst.Count;
        fCmd.Clear;
        // Триггеры
        GetCommands(fCmd, fCmdClass, toTrigger, pCopy);
        Result := Result + fCmd.Count*SelectedTrig.Count;
        fCmd.Clear;
        // Классы
        GetCommands(fCmd, fCmdClass, toClass, pCopy);
        fCmd.Clear;
      end else
        GetCommands(fCmd, fCmdClass, toAny, pCopy);
    end else
    begin
      GetCommands(fCmd, fCmdClass, toAny, pCopy);
      Result := Result + fCmd.Count*SelectedItems.Count;
    end;
    Result := Result + fCmdClass.Count;
  finally
    FreeAndNil(fCmd);
    FreeAndNil(fCmdClass);
  end;
end;

end.
