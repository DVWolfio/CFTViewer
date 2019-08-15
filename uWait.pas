unit uWait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmWait = class(TForm)
    lMessage: TLabel;
    pgFirst: TProgressBar;
    pgSecond: TProgressBar;
    lDescripton: TLabel;
    btnStop: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    { Private declarations }
    fTable: string;
    fDescr: string;
    fCanCloseApp: boolean;
  public
    { Public declarations }
    constructor Create(Source: TComponent; pMode: integer; pDescr: string);
    procedure InitPgFirst(pMax: integer; pPos: integer);
    procedure SetPosFirst(pPos: integer);
    procedure NextFirst;
    procedure InitPgSecond(pMax: integer);
    procedure NextSecond;
    procedure setDescription(pTableName: string);
    property CanCloseApp: boolean read fCanCloseApp write fCanCloseApp;
  end;

implementation

{$R *.dfm}

uses uMain;

constructor TfrmWait.Create(Source: TComponent; pMode: integer; pDescr: string);
begin
  inherited Create(Source);
  fDescr := pDescr;

  fCanCloseApp := pMode <> 0;
  lMessage.Visible := pMode = 0;
  pgFirst.Visible := pMode <> 0;
  pgSecond.Visible := pMode = 1;
  lDescripton.Visible := pMode <> 0;
  if not pgSecond.Visible then
    lDescripton.Top := pgFirst.Top + pgFirst.Height + 4;
  btnStop.Visible := fCanCloseApp;
  if (pMode = 0) and (fDescr <> '') then
    lMessage.Caption := 'Пожалуйста подождите, производится ' + fDescr;
end;

procedure TfrmWait.InitPgFirst(pMax: integer; pPos: integer);
begin
  pgFirst.Max := pMax;
  pgFirst.Position := pPos;
  Application.ProcessMessages;
end;

procedure TfrmWait.InitPgSecond(pMax: integer);
begin
  pgSecond.Max := pMax;
  pgSecond.Position := 0;
  Application.ProcessMessages;
end;

procedure TfrmWait.NextFirst;
begin
  pgFirst.Position := pgFirst.Position + 1;
  lDescripton.Caption := Format('%d из %d %s: %s', [pgFirst.Position,pgFirst.Max, fDescr, fTable]);
  Application.ProcessMessages;
end;

procedure TfrmWait.NextSecond;
begin
  pgSecond.Position := pgSecond.Position + 1;
  Application.ProcessMessages;
end;

procedure TfrmWait.setDescription(pTableName: string);
begin
  fTable := pTableName;
  if pgFirst.Max > 0 then
    lDescripton.Caption := Format('%d из %d %s: %s', [pgFirst.Position,pgFirst.Max,fDescr,fTable]);
end;

procedure TfrmWait.SetPosFirst(pPos: integer);
begin
  pgFirst.Position := pPos;
  Application.ProcessMessages;
end;

procedure TfrmWait.FormShow(Sender: TObject);
begin
  if (lDescripton.Visible) then
    ClientHeight := lDescripton.Top + lDescripton.Height + 5
  else if lMessage.Visible then
    ClientHeight := lMessage.Top + lMessage.Height + 5;

  if (not btnStop.Visible) and (pgFirst.Visible) then
    ClientWidth := pgFirst.Left + pgFirst.Width + 5
  else if (not btnStop.Visible) and (lMessage.Visible) then
    ClientWidth := lMessage.Left + lMessage.Width + 5
  else
    ClientWidth := btnStop.Left + btnStop.Width + 5;
end;

procedure TfrmWait.btnStopClick(Sender: TObject);
begin
  frmMain.CancelWait(false);
end;

end.
