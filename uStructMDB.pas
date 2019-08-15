unit uStructMDB;

interface

uses ADOInt, SysUtils, Dialogs, ADODB, Classes, Variants, DB;

type
  TColumns = record
    name: string;
    type_col: string;
    type_ind: DataTypeEnum;
    isNull: boolean;
  end;
  TIndex = record
    name: string;
    columns: array of string;
  end;
  TStructMDB = record
    name: string;
    columns: array of TColumns;
    index: TIndex;
  end;
  TStruct = class
  private
    fTbl : array of TStructMDB;
    function FindTable(pName: string): integer;
    procedure AddInfoColumn(pTableName, pName, pType: string; pTypeCode: DataTypeEnum; pPos: integer; pIsNull: boolean);
    procedure AddInfoIndex(pTableName, pName, pColumn: string; pPos: integer);
    function GetTypeName(pCode: DataTypeEnum; pCharSize, pNumSize: integer): string;
  public
    constructor Create(pConnect: TADOConnection);
    procedure CreateStrunctInMDB(pConnect: TADOConnection);
    function CreateCommandCopy(pTableName: string): TADOCommand;
    procedure PrepareAndExec(pTableName: string; pCommand: TADOCommand; pSource: TADOQuery);
  end;

implementation

constructor TStruct.Create(pConnect: TADOConnection);
var
  fUsrTables: TStrings;
  qQuerySchema: TADODataSet;
begin
  inherited Create;
  // Получим список пользовтельских таблиц
  fUsrTables := TStringList.Create;
  qQuerySchema := TADODataSet.Create(nil);
  pConnect.GetTableNames(fUsrTables, false);
  try
    // Соберем всю необходимую информацию для динамического создания таблиц
    qQuerySchema.Connection := pConnect;
    try
      pConnect.OpenSchema(siColumns,EmptyParam,EmptyParam,qQuerySchema);
      qQuerySchema.First;
      while not qQuerySchema.eof do
      begin
        if fUsrTables.IndexOf(qQuerySchema.FieldByName('TABLE_NAME').AsString) >= 0 then
        begin
          AddInfoColumn(qQuerySchema.FieldByName('TABLE_NAME').AsString,
                        qQuerySchema.FieldByName('COLUMN_NAME').AsString,
                        GetTypeName(qQuerySchema.FieldByName('DATA_TYPE').AsInteger,
                                    qQuerySchema.FieldByName('CHARACTER_MAXIMUM_LENGTH').AsInteger,
                                    qQuerySchema.FieldByName('NUMERIC_PRECISION').AsInteger),
                        qQuerySchema.FieldByName('DATA_TYPE').AsInteger,
                        qQuerySchema.FieldByName('ORDINAL_POSITION').AsInteger-1,
                        qQuerySchema.FieldByName('IS_NULLABLE').AsBoolean);
        end;
        qQuerySchema.Next;
      end;
    finally
      qQuerySchema.Close;
    end;

    try
      pConnect.OpenSchema(siIndexes,EmptyParam,EmptyParam,qQuerySchema);
      qQuerySchema.First;
      while not qQuerySchema.eof do
      begin
        if fUsrTables.IndexOf(qQuerySchema.FieldByName('TABLE_NAME').AsString) >= 0 then
        begin
          AddInfoIndex(qQuerySchema.FieldByName('TABLE_NAME').AsString,
                       qQuerySchema.FieldByName('INDEX_NAME').AsString,
                       qQuerySchema.FieldByName('COLUMN_NAME').AsString,
                       qQuerySchema.FieldByName('ORDINAL_POSITION').AsInteger-1);
        end;
        qQuerySchema.Next;
      end;
    finally
      qQuerySchema.Close;
    end;
  finally
    qQuerySchema.Free;
    FreeAndNil(fUsrTables);
  end;
end;

function TStruct.FindTable(pName: string): integer;
var
  j: integer;
begin
  Result := -1;
  for j:=0 to Length(fTbl)-1 do
    if AnsiUpperCase(fTbl[j].name) = AnsiUpperCase(pName) then
    begin
      Result := j;
      break;
    end;
  if Result = -1 then
  begin
    SetLength(fTbl,Length(fTbl)+1);
    fTbl[Length(fTbl)-1].name := pName;
    Result := Length(fTbl)-1;
  end;
end;

procedure TStruct.AddInfoColumn(pTableName, pName, pType: string; pTypeCode: DataTypeEnum; pPos: integer; pIsNull: boolean);
var
  vInd: integer;
begin
  vInd := FindTable(pTableName);
  if pPos >= Length(fTbl[vInd].columns) then
    SetLength(fTbl[vInd].columns, pPos+1);

  fTbl[vInd].columns[pPos].name := pName;
  fTbl[vInd].columns[pPos].type_col := pType;
  fTbl[vInd].columns[pPos].type_ind := pTypeCode;
  fTbl[vInd].columns[pPos].isNull := pIsNull;
end;

procedure TStruct.AddInfoIndex(pTableName, pName, pColumn: string; pPos: integer);
var
  vInd: integer;
begin
  vInd := FindTable(pTableName);
  fTbl[vInd].index.name := pName;
  if pPos >= Length(fTbl[vInd].index.columns) then
    SetLength(fTbl[vInd].index.columns, pPos+1);

  fTbl[vInd].index.columns[pPos] := pColumn;
end;

function TStruct.GetTypeName(pCode: DataTypeEnum; pCharSize, pNumSize: integer):string;
begin
  Result := '';
  if (pCode = adWChar) and (pCharSize > 0) then
    Result := 'VARCHAR(' + IntToStr(pCharSize) + ')'
  else if (pCode = adWChar) and (pCharSize = 0) then
    Result := 'MEMO'
  else if pCode = adDouble then
    Result := 'DOUBLE'
  else if pCode = adDate then
    Result := 'DATETIME'
  else if pCode = adBoolean then
    Result := 'YESNO'
  else if pCode = adInteger then
    Result := 'LONG'
  else if pCode = adBinary then
    Result := 'LONGBINARY'
  else
    ShowMessage(IntToStr(pCode)+';'+IntToStr(pCharSize));
end;

procedure TStruct.CreateStrunctInMDB(pConnect: TADOConnection);
var
  i, k: integer;
  vTmp: string;
begin
  // Создадим таблицы
  for i:=0 to Length(fTbl)-1 do
  begin
    vTmp := 'CREATE TABLE ' + fTbl[i].name + '(';
    for k := 0 to Length(fTbl[i].columns)-1 do
    begin
      vTmp := vTmp + '[' + fTbl[i].columns[k].name + '] ' + fTbl[i].columns[k].type_col;
      if not fTbl[i].columns[k].isNull then
        vTmp := vTmp + ' not null';
      if k < Length(fTbl[i].columns)-1 then
        vTmp := vTmp + ','
      else
        vTmp := vTmp + ')';
    end;
    pConnect.Execute(vTmp);
    // Создадим индекс для таблицы если он есть
    if fTbl[i].index.name <> '' then
    begin
      vTmp := 'CREATE INDEX ' + fTbl[i].index.name + ' on ' + fTbl[i].name + ' (';
      for k := 0 to Length(fTbl[i].index.columns)-1 do
      begin
        vTmp := vTmp + '[' + fTbl[i].index.columns[k] + ']';
        if k < Length(fTbl[i].index.columns)-1 then
          vTmp := vTmp + ','
        else
          vTmp := vTmp + ')';
      end;
      pConnect.Execute(vTmp);
    end;
  end;
end;

function TStruct.CreateCommandCopy(pTableName: string): TADOCommand;
var
  fCmd: TADOCommand;
  vTmp: string;
  vInd, i: integer;
begin
  fCmd := TADOCommand.Create(nil);
  vInd := FindTable(pTableName);
  vTmp := 'insert into ' + pTableName + '(';
  for i := 0 to Length(fTbl[vInd].columns)-1 do
  begin
    vTmp := vTmp + '[' + fTbl[vInd].columns[i].name + ']';
    if i < Length(fTbl[vInd].columns)-1 then
      vTmp := vTmp + ','
    else
      vTmp := vTmp + ')';
  end;
  vTmp := vTmp + ' values(';
  for i := 0 to Length(fTbl[vInd].columns)-1 do
  begin
    vTmp := vTmp + ':' + fTbl[vInd].columns[i].name;
    if i < Length(fTbl[vInd].columns)-1 then
      vTmp := vTmp + ','
    else
      vTmp := vTmp + ')';
  end;
  fCmd.CommandText := vTmp;
  fCmd.ParamCheck := false;  
  Result := fCmd;
end;

procedure TStruct.PrepareAndExec(pTableName: string; pCommand: TADOCommand; pSource: TADOQuery);
var
  vInd, i: integer;
begin
  vInd := FindTable(pTableName);
  for i := 0 to Length(fTbl[vInd].columns)-1 do
  begin
    if pCommand.Parameters.FindParam(fTbl[vInd].columns[i].name) = nil then
      pCommand.Parameters.AddParameter.Name := fTbl[vInd].columns[i].name;
    if fTbl[vInd].columns[i].type_ind = adWChar then
    begin
      pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).DataType := ftString;
      pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).Value :=
        pSource.FieldByName(fTbl[vInd].columns[i].name).AsString;
    end else if fTbl[vInd].columns[i].type_ind = adDouble then
    begin
      pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).DataType := ftFloat;
      pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).Value :=
        pSource.FieldByName(fTbl[vInd].columns[i].name).AsFloat;
    end else if fTbl[vInd].columns[i].type_ind = adInteger then
    begin
      pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).DataType := ftInteger;
      pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).Value :=
        pSource.FieldByName(fTbl[vInd].columns[i].name).AsInteger;
    end else if fTbl[vInd].columns[i].type_ind = adDate then
    begin
      pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).DataType := ftDateTime;
      pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).Value :=
        pSource.FieldByName(fTbl[vInd].columns[i].name).AsDateTime;
    end else if fTbl[vInd].columns[i].type_ind = adBoolean then
    begin
      pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).DataType := ftBoolean;
      pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).Value :=
        pSource.FieldByName(fTbl[vInd].columns[i].name).AsBoolean;
    end else if fTbl[vInd].columns[i].type_ind = adBinary then
    begin
      if not pSource.FieldByName(fTbl[vInd].columns[i].name).IsNull then
      begin
        pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).DataType := ftBlob;
        pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).Value :=
          pSource.FieldByName(fTbl[vInd].columns[i].name).Value
      end else
      begin
        pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).DataType := ftVariant;
        pCommand.Parameters.ParamByName(fTbl[vInd].columns[i].name).Value := '';
      end;
    end;
  end;
  pCommand.Execute;
end;

end.
