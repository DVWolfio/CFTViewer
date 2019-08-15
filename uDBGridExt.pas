unit uDBGridExt;

interface

uses DBGrids, Classes, Windows;

type
  TDBGrid = class(DBGrids.TDBGrid)
  private
    FColResize:TNotifyEvent;
  protected
    procedure ColWidthsChanged; override;
    Property OnColResize:TNotifyEvent read FColResize Write FColResize;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
  end;

  procedure OnPanelResize(DBGrid: DBGrids.TDBGrid; SizeColumn: integer = 0);

implementation

procedure TDBGrid.ColWidthsChanged;
var
  TotWidth, AllWidth : integer;
  i: integer;
  lastInd: integer;
begin
  inherited;
  TotWidth := 0;
  lastInd := 0;
  AllWidth := Self.ClientWidth;
  if dgColLines in Self.Options then
    AllWidth := AllWidth - Self.Columns.Count - 1;
  for i := 0 to Self.Columns.Count - 1 do
  begin
    if Self.Columns[i].Visible then
    begin
      TotWidth := TotWidth + Self.Columns[i].Width;
      lastInd := i;
    end;
  end;
  Self.Columns[lastInd].Width :=
    Self.Columns[lastInd].Width + AllWidth - TotWidth;
end;

function TDBGrid.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := true;
  if DataSource.DataSet.Active then
    DataSource.DataSet.Next;
end;

function TDBGrid.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := true;
  if DataSource.DataSet.Active then
    DataSource.DataSet.Prior;
end;

procedure OnPanelResize(DBGrid: DBGrids.TDBGrid; SizeColumn: integer = 0);
var
  curWidth, allWidth: Integer;
  i, j: integer;
begin
  allWidth := DBGrid.ClientWidth;
  if dgColLines in DBGrid.Options then
    allWidth := allWidth - DBGrid.Columns.Count - 1;
  for i := 0 to DBGrid.Columns.Count - 1 do
  begin
    if DBGrid.Columns.Items[i].Visible then
    begin
      curWidth := allWidth;
      for j := 0 to DBGrid.Columns.Count - 1 do
        if ((DBGrid.Columns.Items[j].Visible) and (j<>i)) then
        begin
          if Assigned(DBGrid.Columns.Items[j].Field) and (DBGrid.Columns.Items[j].Width < DBGrid.Columns.Items[j].Field.Tag) and (j>i) then
            curWidth := curWidth - DBGrid.Columns.Items[j].Field.Tag
          else
            curWidth := curWidth - DBGrid.Columns.Items[j].Width;
        end;
      if (Assigned(DBGrid.Columns.Items[i].Field) and (curWidth < DBGrid.Columns.Items[i].Field.Tag)) or (i<SizeColumn) then
        DBGrid.Columns.Items[i].Width := DBGrid.Columns.Items[i].Field.Tag
      else
      begin
        DBGrid.Columns.Items[i].Width := curWidth;
        exit;
      end;
    end;
  end;
end;

end.
