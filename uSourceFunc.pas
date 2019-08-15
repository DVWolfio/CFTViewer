unit uSourceFunc;

interface

uses uClass, Grids, Classes, SysUtils;

type
  TSource = record
    fMethId:      string;
    fMethClass:   string;
    fMethCode:    string;
    fMethName:    string;
    fTypeSource:  string;
    fNewSource:   string;
  end;
  TSourceFunc = class
    private
      fObjSource: array of TSource;
      function Find(pMethId: string; pType: string): integer;
      procedure SetInfo(pInd: integer; pMethId, pType: string; pNewSource: string; pMethCode, pMethClass, pMethName: string);
    public
      procedure UpdateObject(pMethId, pType: string; pNewSource: string; pMethCode, pMethClass, pMethName: string);
      function GetSource(pMethId, pType: string; var pSource: TSource): boolean;
      function GetSourceObj(pId: integer): TSource;
      procedure SetInfoSG(sgSource: TStringGrid);
      function CountInfo: integer;
      procedure Clear;
      procedure Delete(pId:integer);
      procedure GetCommandSource(pRec: TSource; var fCmd: TStrings);
      function CountStepUpdate: integer;
  end;

implementation

function TSourceFunc.Find(pMethId: string; pType: string): integer;
var
  j: integer;
begin
  Result := -1;
  for j:=0 to Length(fObjSource)-1 do
    if ((fObjSource[j].fMethId = pMethId) and
        (fObjSource[j].fTypeSource = pType)) then
    begin
      Result := j;
      break;
    end;
end;

procedure TSourceFunc.SetInfo(pInd: integer; pMethId, pType: string; pNewSource: string; pMethCode, pMethClass, pMethName: string);
var
  vInd: integer;
begin
  if pInd = -1 then
  begin
    vInd := Length(fObjSource);
    SetLength(fObjSource, vInd+1);
  end else
    vInd := pInd;

  fObjSource[vInd].fMethId := pMethId;
  fObjSource[vInd].fTypeSource := pType;
  fObjSource[vInd].fNewSource := pNewSource;
  fObjSource[vInd].fMethCode := pMethCode;
  fObjSource[vInd].fMethClass := pMethClass;
  fObjSource[vInd].fMethName := pMethName;
end;

procedure TSourceFunc.UpdateObject(pMethId, pType: string; pNewSource: string; pMethCode, pMethClass, pMethName: string);
begin
  SetInfo(Find(pMethId, pType), pMethId, pType, pNewSource, pMethCode, pMethClass, pMethName);
end;

function TSourceFunc.GetSource(pMethId, pType: string; var pSource: TSource): boolean;
var
  vInd: integer;
begin
  vInd := Find(pMethId, pType);
  if vInd >= 0 then
  begin
    pSource := fObjSource[vInd];
    Result := true;
  end else
    Result := false;
end;

function TSourceFunc.GetSourceObj(pId: integer): TSource;
begin
  Result := fObjSource[pId];
end;

procedure TSourceFunc.SetInfoSG(sgSource: TStringGrid);
var
  i: integer;
  function GetTypeName(pType: string): string;
  begin
    if pType = 'EXECUTE' then
      Result := 'Тело'
    else if pType = 'VALIDATE' then
      Result := 'Проверка'
    else if pType = 'PUBLIC' then
      Result := 'Глобальные описания'
    else if pType = 'PRIVATE' then
      Result := 'Локальные описания'
    else if (pType = 'VBSSCRIPT') or (pType = 'VBSCRIPT') then
      Result := 'Клиент-скрипт'
    else
      Result := 'Не известный тип [' + pType + ']';
  end;
begin
  sgSource.RowCount := CountInfo + 1;
  if sgSource.RowCount > 1 then
    sgSource.FixedRows := 1;
  for i := 0 to CountInfo-1 do
  begin
    sgSource.Cells[0,i+1] := fObjSource[i].fMethName;
    sgSource.Cells[1,i+1] := '[' + fObjSource[i].fMethClass + ']::[' + fObjSource[i].fMethCode + ']';
    sgSource.Cells[2,i+1] := GetTypeName(fObjSource[i].fTypeSource);
  end;
end;

function TSourceFunc.CountInfo: integer;
begin
  Result := Length(fObjSource);
end;

procedure TSourceFunc.Clear;
begin
  SetLength(fObjSource, 0);
end;

procedure TSourceFunc.Delete(pId:integer);
var
  i: integer;
begin
  if pId >= 0 then
  for i:= pId to CountInfo-2 do
    fObjSource[i] := fObjSource[i+1];
  SetLength(fObjSource, CountInfo-1);
end;

procedure TSourceFunc.GetCommandSource(pRec: TSource; var fCmd: TStrings);
begin
  fCmd.Add('update SOURCES_LONG set [TEXT] = :newSource where METHOD_ID = :id and TYPE = :type');
end;

function TSourceFunc.CountStepUpdate: integer;
var
  i: integer;
  fCmd: TStrings;
begin
  fCmd := TStringList.Create;
  try
    for i:= 0 to CountInfo-1 do
      GetCommandSource(GetSourceObj(i),fCmd);
    Result := fCmd.Count;
  finally
    FreeAndNil(fCmd);
  end;
end;

end.
