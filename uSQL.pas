unit uSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, Grids, DBGrids, DBTables, ADODB, Menus,
  ActnList;

type
  TfrmSQL = class(TForm)
    dbResult: TDBGrid;
    Panel1: TPanel;
    mSQL: TMemo;
    dsSQL: TDataSource;
    adSQL: TADOQuery;
    mmSQL: TMainMenu;
    N1: TMenuItem;
    ActionList1: TActionList;
    aSave: TAction;
    N2: TMenuItem;
    aExec: TAction;
    N3: TMenuItem;
    procedure aSaveExecute(Sender: TObject);
    procedure aExecExecute(Sender: TObject);
    procedure aSaveUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSQL: TfrmSQL;

implementation

{$R *.dfm}

uses uMain, ComObj;

procedure TfrmSQL.aSaveExecute(Sender: TObject);
var
  i,j,index: Integer;
  ExcelApp,sheet: Variant;
begin
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Visible := true;
  ExcelApp.WorkBooks.Add(-4167);
  ExcelApp.WorkBooks[1].WorkSheets[1].name := 'SQL';
  sheet:=ExcelApp.WorkBooks[1].WorkSheets['SQL'];
  index:=1;
  adSQL.DisableControls;
  frmMain.CreateWait(1, 'Ёкспорт данных');
  fWait.InitPgFirst(dbResult.DataSource.DataSet.RecordCount, 0);
  fWait.InitPgSecond(1);
  try
    dbResult.DataSource.DataSet.First;
    for i:=1 to dbResult.DataSource.DataSet.RecordCount do
    begin
      if frmMain.fSignalEndWait then
          exit;
      for j:=1 to dbResult.FieldCount do
        sheet.cells[index,j]:=dbResult.fields[j-1].asstring;
      inc(index);
      dbResult.DataSource.DataSet.Next;
      fWait.NextFirst;
    end;
  finally
    adSQL.EnableControls;
    frmMain.CancelWait(true);
  end;
end;


procedure TfrmSQL.aExecExecute(Sender: TObject);
begin
  adSQL.Close;
  adSQL.SQL := mSQL.Lines;
  adSQL.Open;
end;

procedure TfrmSQL.aSaveUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := adSQL.Active;
end;

end.
