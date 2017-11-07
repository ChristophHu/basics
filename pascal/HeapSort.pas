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

{begin HeapSort}
procedure HeapSort;
var
  n: Integer;

procedure downheap(v: Integer);
var
  w: Integer;
begin
  w:=2*v+1;
  while (w<n) do
    begin
      if (w+1<n) then
        if AnsiCompareText(Data[w+1], data[w]) = 1 then
          w:=w+1;
      if AnsiCompareText(Data[v], data[w]) = -1 then
        change(v, w);
      v:=w;
      w:=2*v+1;
    end;
end;

procedure buildheap;
var
  v: Integer;
begin
  for v:=n div 2 - 1 downto 1 do
    downheap(v)
end;

begin
  n:=8;
  buildheap;
  while (n>1) do
    begin
      n:=n-1;
      change(0,n);
      downheap(0)
    end;
end;
{end HeapSort}

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