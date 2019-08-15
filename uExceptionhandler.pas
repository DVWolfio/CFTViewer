unit uExceptionhandler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TfrmError = class(TForm)
    memError: TMemo;
    lError: TLabel;
    Button1: TButton;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; pMsg: string; pStackTrace: string);
  end;

var
  frmError: TfrmError;

implementation

{$R *.dfm}

constructor TfrmError.Create(AOwner: TComponent; pMsg: string; pStackTrace: string);
begin
  inherited Create(AOwner);
  lError.Caption := pMsg;
  memError.Text := pStackTrace;
end;

end.
