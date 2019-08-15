unit uShowAttrCrit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmShowAttrCrit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edName: TEdit;
    cbBaseClass: TComboBox;
    cbTypeColumn: TComboBox;
    Label4: TLabel;
    edRef: TEdit;
    Label5: TLabel;
    edTypeRef: TEdit;
    Label6: TLabel;
    edKvalif: TEdit;
    Label7: TLabel;
    edAlias: TEdit;
    Label8: TLabel;
    memDataSource: TMemo;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    cbRightAttr: TCheckBox;
    cbRightRow: TCheckBox;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    cbAlign: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    edWidth: TEdit;
    edPrec: TEdit;
    cbEditSize: TCheckBox;
    cbColor: TCheckBox;
    cbFilter: TCheckBox;
    Label13: TLabel;
    edHint: TEdit;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    cbSegway: TComboBox;
    edSegwayType: TEdit;
    edSegwayCrit: TEdit;
    memCondition: TMemo;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; pCritId: string; pPosition: integer);
  end;

implementation

{$R *.dfm}

uses uEditCriteria, ADODB, DB;

constructor TfrmShowAttrCrit.Create(AOwner: TComponent; pCritId: string; pPosition: integer);
begin
  inherited Create(AOwner);
  with TADOQuery.Create(AOwner) do
  try
    Connection := frmEditCriteria.qColumns.Connection;
    SQL.Text := 'select * from criteria_columns cc where cc.criteria_id = :crit_id and cc.[position] = :pos';
    Parameters.ParamByName('crit_id').DataType := ftString;
    Parameters.ParamByName('crit_id').Value := pCritId;
    Parameters.ParamByName('pos').DataType := ftInteger;
    Parameters.ParamByName('pos').Value := pPosition;
    Open;
    if RecordCount > 0 then
    begin
      edName.Text := FieldByName('NAME').AsString;
      cbBaseClass.ItemIndex := cbBaseClass.Items.IndexOf(frmEditCriteria.qColumns.FieldByName('base_class_id').AsString);
      try
        cbTypeColumn.ItemIndex := FieldByName('UNVISIBLE').AsInteger;
      except
        cbTypeColumn.ItemIndex := -1;
      end;
      edRef.Text := FieldByName('REFERENCE_ID').AsString;
      edTypeRef.Text := FieldByName('TARGET_CLASS_ID').AsString;
      edKvalif.Text := FieldByName('QUAL').AsString;
      edAlias.Text := FieldByName('ALIAS').AsString;
      memDataSource.Text := FieldByName('DATA_SOURCE').AsString;
      cbRightAttr.Checked := (FieldByName('ACCESS_CHECK').AsString = '1') or (FieldByName('ACCESS_CHECK').AsString = '3');
      cbRightRow.Checked := (FieldByName('ACCESS_CHECK').AsString = '2') or (FieldByName('ACCESS_CHECK').AsString = '3');
      try
        cbAlign.ItemIndex := FieldByName('ALIGN').AsInteger;
      except
        cbAlign.ItemIndex := -1;
      end;
      edWidth.Text := FieldByName('WIDTH').AsString;
      edPrec.Text := FieldByName('DATA_PRECISION').AsString;
      edHint.Text := FieldByName('TOOL_TIP').AsString;
      cbEditSize.Checked := FieldByName('SIZEABLE').AsString = '1';
      cbColor.Checked := FieldByName('FETCH_STYLE').AsString = '1';
      cbFilter.Checked := FieldByName('FILTER_REQUIRED').AsString = '1';
      if (FieldByName('REF_TYPE').AsString = '0') or (FieldByName('REF_TYPE').AsString = '1') then
        cbSegway.ItemIndex := 1
      else if FieldByName('REF_TYPE').AsString = '3' then
        cbSegway.ItemIndex := 2
      else if FieldByName('REF_TYPE').AsString = '4' then
        cbSegway.ItemIndex := 3
      else
        cbSegway.ItemIndex := 0;
      edSegwayType.Text := FieldByName('REF_CLASS_ID').AsString;
      edSegwayCrit.Text := FieldByName('REF_CRIT_SHORT_NAME').AsString;
      memCondition.Text := FieldByName('REF_CONDITION').AsString;
    end;
  finally
    Close;
    Free;
  end;
end;

procedure TfrmShowAttrCrit.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

end.
