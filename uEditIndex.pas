unit uEditIndex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, DB;

type
  TfrmEditIndex = class(TForm)
    cbUnique: TCheckBox;
    GroupBox1: TGroupBox;
    lbColumns: TListBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; pConnect: TADOConnection; pName: string);
  end;

implementation

{$R *.dfm}

constructor TfrmEditIndex.Create(AOwner: TComponent; pConnect: TADOConnection; pName: string);
begin
  inherited Create(AOwner);

  with TADOQuery.Create(Self) do
  try
    Connection := pConnect;
    SQL.Text := 'select ci.* from class_indexes ci where ci.name = :name;';
    Parameters.ParamByName('name').DataType := ftString;
    Parameters.ParamByName('name').Value := pName;
    Open;
    if RecordCount > 0 then
      cbUnique.Checked := FieldByName('UNIQUENESS').AsString = 'UNIQUE';
  finally
    Close;
    Free;
  end;
  with TADOQuery.Create(Self) do
  try
    Connection := pConnect;
    SQL.Text := 'select ci.* from class_ind_columns ci where ci.index_name = :name order by ci.[position];';
    Parameters.ParamByName('name').DataType := ftString;
    Parameters.ParamByName('name').Value := pName;
    Open;
    First;
    lbColumns.Clear;
    while not eof do
    begin
      lbColumns.Items.Add(FieldByName('QUAL').AsString);
      Next;
    end;
  finally
    Close;
    Free;
  end;
end;

procedure TfrmEditIndex.FormShow(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

end.
