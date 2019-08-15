unit uFormShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TLine = record
    A: TPoint;
    B: TPoint;
    parent: TWinControl;
  end;
  TFormShow = class(TForm)
    pcMain: TPageControl;
    procedure pcMainChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fLines : array of TControl;
  public
    { Public declarations }
    procedure AddLine(X1,Y1,X2,Y2: integer; p_parent: TWinControl);
    procedure paintLines;
  end;

var
  FormShow: TFormShow;

implementation

uses Types, ExtCtrls;

{$R *.dfm}

procedure TFormShow.AddLine(X1,Y1,X2,Y2: integer; p_parent: TWinControl);
var
  i: integer;
begin
  i := Length(fLines);
  SetLength(fLines, i+1);
  fLines[i] := TPaintBox.Create(Self);
  fLines[i].Parent := p_parent;
  fLines[i].Left := X1;
  fLines[i].Top := Y1;
  fLines[i].Width := X2 - X1+1;
  fLines[i].Height := Y2 - Y1+1;
end;

procedure TFormShow.paintLines;
var
  i: integer;
begin
  for i:=0 to Length(fLines)-1 do
  begin
    if fLines[i] is TPaintBox then
    begin
      (fLines[i] as TPaintBox).Canvas.Pen.Width := 1;
      (fLines[i] as TPaintBox).Canvas.Pen.Color := clBlack;
      (fLines[i] as TPaintBox).Canvas.MoveTo(0,0);
      (fLines[i] as TPaintBox).Canvas.LineTo((fLines[i] as TPaintBox).Width-1,(fLines[i] as TPaintBox).Height-1);
    end;
  end;
end;

procedure TFormShow.pcMainChange(Sender: TObject);
begin
  paintLines;
end;

procedure TFormShow.FormShow(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

end.
