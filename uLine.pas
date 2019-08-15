unit uLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmLine = class(TForm)
    lStr: TLabel;
    edLine: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure edLineKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    fMax: integer;
  public
    { Public declarations }
    fResult: Integer;
    procedure setRange(p_max: integer);
  end;

var
  frmLine: TfrmLine;

implementation

{$R *.dfm}

procedure TfrmLine.setRange(p_max: integer);
begin
  fMax := p_max;
  lStr.Caption := Format('Строка (1 - %d)', [p_max]);
end;

procedure TfrmLine.btnOkClick(Sender: TObject);
var
  err: boolean;
begin
  err := false;
  try
    fResult := StrToInt(edLine.Text);
  except
    on E: Exception do
      err := true;
  end;
  if ((err) or ((fResult < 1) or (fResult > fMax))) then
  begin
    MessageDlg('Неправильный ввод', mtWarning, [mbOk], 0);
    ModalResult := mrNone;
  end;
end;

procedure TfrmLine.edLineKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

end.
