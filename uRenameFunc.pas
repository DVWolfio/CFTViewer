unit uRenameFunc;

interface

uses uClass, Grids, Classes, SysUtils;

type
  TRename = record
    id: string;
    type_obj: TTypeObj;
    fClassID: string;
    fClassName: string;

    fOriginalShort: string;
    fOriginalFull: string;
    fNewShort: string;
    fNewFull: string;
  end;
  TRenameFunc = class
    private
      fObjRename: array of TRename;
      function Find(pId: string): integer;
      procedure SetInfo(pInd: integer; pId: string; pShort, pFull: string; pType: TTypeObj; pClassID, pClassName, pOriginalShort, pOriginalFull: string);
    public
      procedure RenameObject(pId: string; pShort, pFull: string; pType: TTypeObj; pClassID, pClassName, pOriginalShort, pOriginalFull: string);
      function GetRename(pId: string; var pRename: TRename): boolean;
      function GetRenameObj(pId: integer): TRename;
      procedure SetInfoSG(sgRename: TStringGrid);
      function CountInfo: integer;
      procedure Clear;
      procedure Delete(pId:integer);
      procedure GetCommandRename(pRec: TRename; pTypes: TTypeObjs; var fCmd: TStrings);
      function CountStepRename: integer;
  end;

implementation

function TRenameFunc.Find(pId: string): integer;
var
  j: integer;
begin
  Result := -1;
  for j:=0 to Length(fObjRename)-1 do
    if fObjRename[j].id = pId then
    begin
      Result := j;
      break;
    end;
end;

function TRenameFunc.GetRename(pId: string; var pRename: TRename): boolean;
var
  vInd: integer;
begin
  vInd := Find(pId);
  if vInd >= 0 then
  begin
    pRename := fObjRename[vInd];
    Result := true;
  end else
    Result := false;
end;

procedure TRenameFunc.SetInfo(pInd: integer; pId: string; pShort, pFull: string; pType: TTypeObj; pClassID, pClassName, pOriginalShort, pOriginalFull: string);
var
  vInd: integer;
begin
  if (pShort = pOriginalShort) and (pFull = pOriginalFull) then
  begin
    if (pInd <> -1) then
      Delete(pInd);
    exit;
  end;

  if pInd = -1 then
  begin
    vInd := Length(fObjRename);
    SetLength(fObjRename, vInd+1);
  end else
    vInd := pInd;

  fObjRename[vInd].id := pId;
  fObjRename[vInd].fNewShort := pShort;
  fObjRename[vInd].fNewFull := pFull;
  fObjRename[vInd].type_obj := pType;
  fObjRename[vInd].fClassID := pClassID;
  fObjRename[vInd].fClassName := pClassName;
  fObjRename[vInd].fOriginalShort := pOriginalShort;
  fObjRename[vInd].fOriginalFull := pOriginalFull;
end;

procedure TRenameFunc.RenameObject(pId: string; pShort, pFull: string; pType: TTypeObj; pClassID, pClassName, pOriginalShort, pOriginalFull: string);
begin
  SetInfo(Find(pId), pId, pShort, pFull, pType, pClassID, pClassName, pOriginalShort, pOriginalFull);
end;

procedure TRenameFunc.SetInfoSG(sgRename: TStringGrid);
var
  i: integer;
  function GetName(pCode,pName: string): string;
  begin
    Result := '"' + pName + '"(' + pCode + ')';
  end;
begin
  sgRename.RowCount := CountInfo + 1;
  if sgRename.RowCount > 1 then
    sgRename.FixedRows := 1;
  for i := 0 to CountInfo-1 do
  begin
    sgRename.Cells[0,i+1] := GetTypeName(fObjRename[i].type_obj);
    if fObjRename[i].fClassID <> '' then
      sgRename.Cells[1,i+1] := GetName(fObjRename[i].fClassID, fObjRename[i].fClassName)
    else
      sgRename.Cells[1,i+1] := '';
    sgRename.Cells[2,i+1] := GetName(fObjRename[i].fOriginalShort, fObjRename[i].fOriginalFull);
    sgRename.Cells[3,i+1] := GetName(fObjRename[i].fNewShort, fObjRename[i].fNewFull);
  end;
end;

function TRenameFunc.CountInfo: integer;
begin
  Result := Length(fObjRename);
end;

procedure TRenameFunc.Clear;
begin
  SetLength(fObjRename, 0);
end;

procedure TRenameFunc.Delete(pId:integer);
var
  i: integer;
begin
  if pId >= 0 then
  for i:= pId to CountInfo-2 do
    fObjRename[i] := fObjRename[i+1];
  SetLength(fObjRename, CountInfo-1);
end;

function TRenameFunc.GetRenameObj(pId: integer): TRename;
begin
  Result := fObjRename[pId];
end;

procedure TRenameFunc.GetCommandRename(pRec: TRename; pTypes: TTypeObjs; var fCmd: TStrings);
begin
  if (pRec.type_obj in pTypes) or (toAny in pTypes) then
  begin
    if (pRec.type_obj = toClass) or (toAny in pTypes) then
    begin
      // Длинное наименование
      if pRec.fOriginalFull <> pRec.fNewFull then
        fCmd.Add('update CLASSES set NAME = :newFullValue where ID = :id');
      // Короткое наименование
      if pRec.fOriginalShort <> pRec.fNewShort then
      begin
        fCmd.Add('update CHECK_METHOD_RIGHTS set METHOD_CLASS_ID = :newValue where METHOD_CLASS_ID = :id');
        fCmd.Add('update CHECK_METHOD_RIGHTS set CHECK_METHOD_CLASS_ID = :newValue where CHECK_METHOD_CLASS_ID = :id');
        fCmd.Add('update CLASS_ATTRIBUTES set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update CLASS_ATTRIBUTES set SELF_CLASS_ID = :newValue where SELF_CLASS_ID = :id');
        fCmd.Add('update CLASS_CONSTRAINTS set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update CLASS_INDEXES set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update CLASS_RIGHTS set OBJ_ID = :newValue where OBJ_ID = :id');
        fCmd.Add('update CLASS_RULES set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update CLASS_TAB_COLUMNS set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update CLASS_TAB_COLUMNS set SELF_CLASS_ID = :newValue where SELF_CLASS_ID = :id');
        fCmd.Add('update CLASS_TAB_COLUMNS set TABLE_NAME = ''Z#'' + :newValue where TABLE_NAME = ''Z#'' + :id');
        fCmd.Add('update CLASS_TABLES set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update CLASS_TABLES set TABLE_NAME = ''Z#'' + :newValue where TABLE_NAME = ''Z#'' + :id');
        fCmd.Add('update CLASS_TRIGGERS set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update CLASSES set ID = :newValue where ID = :id');
        fCmd.Add('update CLASSES set TARGET_CLASS_ID = :newValue where TARGET_CLASS_ID = :id');
        fCmd.Add('update CLASSES set INIT_METHOD_CLASS_ID = :newValue where INIT_METHOD_CLASS_ID = :id');
        fCmd.Add('update CLASSES set CRITERIA_CLASS_ID = :newValue where CRITERIA_CLASS_ID = :id');
        fCmd.Add('update CONTROLS set CRIT_SELF_CLASS = :newValue where CRIT_SELF_CLASS = :id');
        fCmd.Add('update CONTROLS set CRIT_CLASS_ID = :newValue where CRIT_CLASS_ID = :id');
        fCmd.Add('update CONTROLS set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update CRITERIA set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update CRITERIA_COLUMNS set TARGET_CLASS_ID = :newValue where TARGET_CLASS_ID = :id');
        fCmd.Add('update CRITERIA_COLUMNS set REF_CLASS_ID = :newValue where REF_CLASS_ID = :id');
        fCmd.Add('update CRITERIA_COMPLEX set JOIN_CLASS_ID = :newValue where JOIN_CLASS_ID = :id');
        fCmd.Add('update CRITERIA_METHODS set method_class_id = :newValue where method_class_id = :id');
        fCmd.Add('update CRITERIA_RIGHTS set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update CRITERIA_RIGHTS set CRITERIA_CLASS = :newValue where CRITERIA_CLASS = :id');
        fCmd.Add('update CRITERIA_TRIES set [SHORT] = :newValue where [SHORT] = :id');
        fCmd.Add('update DICT_CHANGES set OBJ_ID = :newValue where OBJ_ID = :id and obj_type = ''CLASSES''' +
                ' and CHANGE_TYPE in (''CLASSES'', ''CLASS_TAB_COLUMNS'', ''CLASS_ATTRIBUTES'', ''STATES'', ''TRANSITIONS'')');
        fCmd.Add('update DICT_CHANGES set CHANGE_TYPE = :newValue where CHANGE_TYPE = :id ' +
                ' and obj_type in (''TRIGGERS'', ''CONSTRAINTS'', ''INDEXES'', ''TRANSITIONS'', ''STATES'', ''METHODS'', ''CRITERIA'', ''CLASS_ATTRIBUTES'')');
        fCmd.Add('update METHOD_PARAMETERS set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update METHOD_PARAMETERS set CRIT_CLASS_ID = :newValue where CRIT_CLASS_ID = :id');
        fCmd.Add('update METHOD_RIGHTS set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update METHOD_RIGHTS set METHOD_CLASS = :newValue where METHOD_CLASS = :id');
        fCmd.Add('update METHOD_VARIABLES set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update METHOD_VARIABLES set CRIT_CLASS_ID = :newValue where CRIT_CLASS_ID = :id');
        fCmd.Add('update METHODS set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update METHODS set RESULT_CLASS_ID = :newValue where RESULT_CLASS_ID = :id');
        fCmd.Add('update METHODS set FORM_CLASS = :newValue where FORM_CLASS = :id');
        fCmd.Add('update OBJECT_RIGHTS_EX set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update OBJECT_RIGHTS_EX set RIGHT_CLASS_ID = :newValue where RIGHT_CLASS_ID = :id');
        fCmd.Add('update OBJECT_RIGHTS_LIST set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update OBJECT_RULES set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update STATES set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update TOPICS set OWNER = :newValue where OWNER = :id and CLASS = ''CLASS''');
        fCmd.Add('update TRANSITION_RIGHTS set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update TRANSITIONS set CLASS_ID = :newValue where CLASS_ID = :id');
        fCmd.Add('update VW_METHOD_GROUP_MEMBERS_ADMIN set CLASS_SHORT_NAME = :newValue where CLASS_SHORT_NAME = :id');
        fCmd.Add('update VW_METHOD_GROUPS_ADMIN set CLASS_ID = :newValue where CLASS_ID = :id');
      end;
    end else if (pRec.type_obj = toAttribute) or (toAny in pTypes) then
    begin
      if pRec.fOriginalFull <> pRec.fNewFull then
        fCmd.Add('update CLASS_ATTRIBUTES set NAME = :newFullValue where ATTR_ID = :short and CLASS_ID = :class');
      if pRec.fOriginalShort <> pRec.fNewShort then
      begin
        fCmd.Add('update CLASS_ATTRIBUTES set ATTR_ID = :newValue where ATTR_ID = :short and CLASS_ID = :class');
        fCmd.Add('update CRITERIA_COLUMNS set QUAL = :newValue where QUAL = :short and CRITERIA_ID in (select ID from CRITERIA where CLASS_ID = :class)');
        fCmd.Add('update DICT_CHANGES set OBJ_ID = :newValue where OBJ_ID = :short and CHANGE_TYPE = :class and obj_type = ''CLASS_ATTRIBUTES''');
        fCmd.Add('update OBJECT_RULES set ATTR_ID = :newValue where ATTR_ID = :short and CLASS_ID = :class');
      end;
    end else if (pRec.type_obj = toMethod) or (toAny in pTypes) then
    begin
      if pRec.fOriginalFull <> pRec.fNewFull then
        fCmd.Add('update METHODS set NAME = :newFullValue where ID = :id');
      if pRec.fOriginalShort <> pRec.fNewShort then
      begin
        fCmd.Add('update METHODS set SHORT_NAME = :newValue where ID = :id');
        fCmd.Add('update METHODS set FORM_SNAME = :newValue where FORM_SNAME = :short and FORM_CLASS = :class');
        fCmd.Add('update CRITERIA_METHODS set method_short_name = :newValue where method_short_name = :short and method_class_id = :class');
        fCmd.Add('update CHECK_METHOD_RIGHTS set METHOD_SHORT_NAME = :newValue where METHOD_SHORT_NAME = :short and method_class_id = :class');
        fCmd.Add('update CHECK_METHOD_RIGHTS set CHECK_METHOD_SHORT_NAME = :newValue where CHECK_METHOD_SHORT_NAME = :short and check_method_class_id = :class');
        fCmd.Add('update CLASSES set INIT_METHOD_SHORT_NAME = :newValue where INIT_METHOD_SHORT_NAME = :short and INIT_METHOD_CLASS_ID = :class');
        fCmd.Add('update DICT_CHANGES set OBJ_ID = :newValue where OBJ_ID = :short and CHANGE_TYPE = :class and obj_type = ''METHODS''');
        fCmd.Add('update METHOD_RIGHTS set SHORT_NAME = :newValue where SHORT_NAME = :short and METHOD_CLASS = ''METHODS''');
        fCmd.Add('update VW_METHOD_GROUP_MEMBERS_ADMIN set METHOD_SHORT_NAME = :newValue where METHOD_SHORT_NAME = :short and CLASS_SHORT_NAME = ''METHODS''');
      end;
    end else if (pRec.type_obj = toCriteria) or (toAny in pTypes) then
    begin
      if pRec.fOriginalFull <> pRec.fNewFull then
        fCmd.Add('update CRITERIA set NAME = :newFullValue where ID = :id');
      if pRec.fOriginalShort <> pRec.fNewShort then
      begin
        fCmd.Add('update CRITERIA set SHORT_NAME = :newValue where ID = :id');
        fCmd.Add('update METHOD_PARAMETERS set CRIT_SHORT_NAME = :newValue where CRIT_SHORT_NAME = :short and CRIT_CLASS_ID = :class');
        fCmd.Add('update CLASSES set CRITERIA_SHORT_NAME = :newValue where CRITERIA_SHORT_NAME = :short and CRITERIA_CLASS_ID = :class');
        fCmd.Add('update CONTROLS set CRIT_SHORT_NAME = :newValue where CRIT_SHORT_NAME = :short and CRIT_SELF_CLASS = :class');
        fCmd.Add('update CRITERIA_COMPLEX set JOIN_SHORT_NAME = :newValue where JOIN_SHORT_NAME = :short and JOIN_CLASS_ID = :class');
        fCmd.Add('update DICT_CHANGES set OBJ_ID = :newValue where OBJ_ID = :short and CHANGE_TYPE = :class and obj_type = ''CRITERIA''');
        fCmd.Add('update METHOD_VARIABLES set CRIT_SHORT_NAME = :newValue where CRIT_SHORT_NAME = :short and CRIT_CLASS_ID = :class');
        fCmd.Add('update REPORT_OBJECTS set NAME = :newValue where NAME = :short and TYPE = ''V''');
        fCmd.Add('update CRITERIA_RIGHTS set SHORT_NAME = :newValue where SHORT_NAME = :short and CRITERIA_CLASS = :class');
        fCmd.Add('update CRITERIA_COLUMNS set REF_CRIT_SHORT_NAME = :newValue where REF_CRIT_SHORT_NAME = :short and REF_CRIT_CLASS_ID = :class');
      end;
    end else if (pRec.type_obj = toIndex) or (toAny in pTypes) then
    begin
      if pRec.fOriginalShort <> pRec.fNewShort then
      begin
        fCmd.Add('update CLASS_INDEXES set NAME = :newValue where NAME = :short and CLASS_ID = :class');
        fCmd.Add('update CLASS_IND_COLUMNS set INDEX_NAME = :newValue where INDEX_NAME = :short');
        fCmd.Add('update DICT_CHANGES set obj_id = :newValue where obj_id = :short and obj_type = ''INDEXES'' and CHANGE_TYPE = :class');
      end;
    end else if (pRec.type_obj = toState) or (toAny in pTypes) then
    begin
      if pRec.fOriginalShort <> pRec.fNewShort then
      begin
        if pRec.fOriginalFull <> pRec.fNewFull then
          fCmd.Add('update STATES set NAME = :newFullValue where ID = :short and class_id = :class');
        if pRec.fOriginalShort <> pRec.fNewShort then
        begin
          fCmd.Add('update STATES set ID = :newValue where ID = :short and class_id = :class');
          fCmd.Add('update DICT_CHANGES set obj_id = :newValue where obj_id = :short and obj_type = ''STATES'' and CHANGE_TYPE = :class');
        end;
      end;
    end else if (pRec.type_obj = toTransition) or (toAny in pTypes) then
    begin
      if pRec.fOriginalFull <> pRec.fNewFull then
        fCmd.Add('update TRANSITIONS set NAME = :newFullValue where ID = :id');
      if pRec.fOriginalShort <> pRec.fNewShort then
      begin
        fCmd.Add('update TRANSITIONS set SHORT_NAME = :newValue where ID = :id');
        fCmd.Add('update TRANSITION_RIGHTS set SHORT_NAME = :newValue where OBJ_ID = :id');
      end;
    end else if (pRec.type_obj = toConstraint) or (toAny in pTypes) then
    begin
      if pRec.fOriginalShort <> pRec.fNewShort then
      begin
        fCmd.Add('update CLASS_CONSTRAINTS set NAME = :newValue where NAME = :short and CLASS_ID = :class');
        fCmd.Add('update DICT_CHANGES set obj_id = :newValue where obj_id = :short and obj_type = ''CONSTRAINTS'' and CHANGE_TYPE = :class');
      end;
    end else if (pRec.type_obj = toTrigger) or (toAny in pTypes) then
    begin
      if pRec.fOriginalShort <> pRec.fNewShort then
      begin
        fCmd.Add('update CLASS_TRIGGERS set NAME = :newValue where NAME = :short and CLASS_ID = :class');
        fCmd.Add('update DICT_CHANGES set obj_id = :newValue where obj_id = :short and obj_type = ''TRIGGERS'' and CHANGE_TYPE = :class');
      end;
    end else if (pRec.type_obj = toMacroPrint) or (toAny in pTypes) then
    begin
      if pRec.fOriginalFull <> pRec.fNewFull then
        fCmd.Add('update MACRO_VALUES set DESCRIPTION = :newFullValue where MACRO_ID = :id and DRIVER_ID = :class');
      if pRec.fOriginalShort <> pRec.fNewShort then
        fCmd.Add('update MACRO_VALUES set MACRO_NAME = :newValue where MACRO_ID = :id and DRIVER_ID = :class');
    end;
  end;
end;

function TRenameFunc.CountStepRename: integer;
var
  i: integer;
  fCmd: TStrings;
begin
  fCmd := TStringList.Create;
  try
    for i:= 0 to CountInfo-1 do
      GetCommandRename(GetRenameObj(i),[toAny],fCmd);
    Result := fCmd.Count;
  finally
    FreeAndNil(fCmd);
  end;
end;

end.

