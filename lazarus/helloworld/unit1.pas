unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { Thelloworld }

  Thelloworld = class(TForm)
    btn_show: TButton;
    txt_helloworld: TEdit;
    procedure btn_showClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  helloworld: Thelloworld;

implementation

{$R *.lfm}

{ Thelloworld }

procedure Thelloworld.btn_showClick(Sender: TObject);
begin
  txt_helloworld.Text := 'Hello World!';
end;

end.

