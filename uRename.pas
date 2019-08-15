unit uRename;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB;

type
  TfrmRename = class(TForm)
    edShort: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edName: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure edShortKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    fShort: string;
    fName: string;
    fCheck: TADOQuery;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; pShort, pName: string; pCheckSQL: TADOQuery; pMaxLength: integer);
  end;

var
  frmRename: TfrmRename;

implementation

{$R *.dfm}

constructor TfrmRename.Create(AOwner: TComponent; pShort, pName: string; pCheckSQL: TADOQuery; pMaxLength: integer);
begin
  inherited Create(AOwner);
  fShort := pShort;
  fName := pName;
  edShort.Text := fShort;
  edName.Text := fName;
  fCheck := pCheckSQL;
  edShort.MaxLength := pMaxLength;
end;

procedure TfrmRename.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    close;
end;

procedure TfrmRename.Button1Click(Sender: TObject);
begin
  // Проверяем были ли изменения
  if (edShort.Text = fShort) and (edName.Text = fName) then
  begin
    ModalResult := mrCancel;
    Exit;
  end;
  // Оба поля обязательны для заполнения
  if edShort.Text = '' then
  begin
    MessageDlg('Короткое имя обязательно для заполнения', mtWarning, [mbOk], 0);
    edShort.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;
  if edName.Text = '' then
  begin
    MessageDlg('Длинное наименование обязательно для заполнения', mtWarning, [mbOk], 0);
    edName.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;
  // Проверяем на уникальность
  if (fCheck.SQL.Text <> '') then
  begin
    fCheck.Close;
    fCheck.Parameters.ParamByName('short').Value := edShort.Text;
    fCheck.Open;
    if fCheck.RecordCount > 0 then
    begin
      MessageDlg('Короткое имя не уникально', mtWarning, [mbOk], 0);
      edShort.SetFocus;
      ModalResult := mrNone;
      Exit;
    end;
  end;
end;

procedure TfrmRename.edShortKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['A'..'Z','a'..'z','#','_', '0'..'9', #8, #3, #22, #24, #26])) then
    Key := #0;
end;

end.
