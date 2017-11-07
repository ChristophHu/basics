programm SortAlgorithm;

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

{begin QuickSort}
Procedure QuickSort;
var
  n: Integer;

function partition(left, right: Integer) : Integer;
var
  i, j, temp: Integer;
  pivot: String;
begin
  i:=left;
  j:=right;
  pivot := Data[(left + right) Div 2];
  while (i <= j) do
    begin
      while (AnsiCompareText(Data[i], pivot) = -1) do
        i := i + 1;
      while (AnsiCompareText(pivot, Data[j]) = -1) do
        j := j - 1;
      if (i <= j) then
        begin
          change(i, j);
          i := i + 1;
          j := j - 1;
        end;
    end;
    partition := i;
end;

procedure devide(left, right: Integer);
var
  index: Integer;
begin
  index := partition(left, right);
  if (left < index - 1) then
    devide(left, index - 1);
  if (index < right) then
    devide(index, right);
end;

begin
  n:=7;
  devide(0, n);
end;
{end QuickSort}

begin
Data[0] := 'Test9';
  Data[1] := 'Test2';
  Data[2] := 'Test3';
  Data[3] := 'Test1';
  Data[4] := 'Test6';
  Data[5] := 'Test0';
  Data[6] := 'Test5';
  Data[7] := 'Test7';

  QuickSort;

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