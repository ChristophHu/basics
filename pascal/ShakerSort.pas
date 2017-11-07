program SortAlgorithm;

{$APPTYPE CONSOLE}
{$R *.res}

Uses sysutils;
var
  Data: Array[0..7] of String;

Procedure Change(x, y: Integer);
var temp: String;

Begin
     temp := Data[x];
     Data[x] := Data[y];
     Data[y] := temp;
End;

{begin ShakerSort}
procedure ShakerSort;
var
  left, right, n, index: Integer;
  done: Boolean;

begin
  n := 7;
  left := -1;
  right := n -1;

  repeat
    done := false;
    left := left + 1;
    for index := left to right do
      begin
        if (AnsiCompareText(Data[index + 1], Data[index]) = -1) then
          begin
            change(index + 1, index);
            done := true;
	        end;
      end;
    right := right - 1;
    for index := right downto left do
      begin
        if (AnsiCompareText(Data[index + 1], Data[index]) = -1) then
          begin
	          change(index + 1, index);
            done := true;
          end;
      end;
  until (done = false);
end;
{end ShakerSort}

begin
Data[0] := 'Test9';
  Data[1] := 'Test2';
  Data[2] := 'Test3';
  Data[3] := 'Test1';
  Data[4] := 'Test6';
  Data[5] := 'Test0';
  Data[6] := 'Test5';
  Data[7] := 'Test7';

  ShakerSort;

  Writeln(Data[0]);
  Writeln(Data[1]);
  Writeln(Data[2]);
  Writeln(Data[3]);
  Writeln(Data[4]);
  Writeln(Data[5]);
  Writeln(Data[6]);
  Writeln(Data[7]);

  Readln(Data[0]);
end.