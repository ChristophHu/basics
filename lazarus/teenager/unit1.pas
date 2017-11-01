unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl_currentage: TLabel;
    ScrollBar1: TScrollBar;
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  lbl_currentage.Caption:= IntToStr(ScrollBar1.Position);
end;

procedure TForm1.Button1Click(Sender: TObject);

var
  age : Integer;

begin
  age := ScrollBar1.Position;
     if (age > 13) AND (age < 21) then
        ShowMessage('You are a teenager')
     else
        ShowMessage('You are no teenager.')
end;

end.

