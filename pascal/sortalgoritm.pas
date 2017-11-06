program project1;

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

Procedure InsertionSort;
var
  i,j: Integer;
  v: String;

Begin
  For i:= 1 To 4 Do
  Begin
    v:= Data[i];
    j:= i;
    While ((j > 0) = true) AND (AnsiCompareText(Data[j-1], v) = -1) Do
    Begin
      Data[j]:= Data[j-1];
      j := j - 1;
    End;
    Data[j]:= v;
  End;
End;

Procedure SelectionSort;
var i, j, min : Integer;

Begin
  For i:= 0 to 4 Do
  Begin
    min:= i;
    For j:= i+1 To 4 Do
      If AnsiCompareText(Data[j], Data[min]) = -1 Then min:= j;
    Change(i, min);
  End;
End;

Procedure ShellSort(size : Integer);
var
  step, start, i, j: Integer;

begin
  step := size;
  repeat
    step := (step-1) DIV 3;
    start := 0;
    while (start < step) do
      begin
        i := start + 1;
        while (i<size) do
          begin
            j := i-1;
            while (j >= 0) do
              begin
                if AnsiCompareText(Data[j], data[j+step]) = -1 then
                  change(j, j+step);
                j := j - step;
              end;
            i := i + step;
          end;
        start := start + 1;
      end;
  until (step>0)
end;

{Begin Heap-Sort}
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
{Ende Heap-Sort}

{Begin Quick-Sort}
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
{Ende Quick-Sort}

{Begin ShackerSort}
procedure ShackerSort;
var
  left, right: Integer;
begin
  
end;
{Ende ShackerSort}

begin
     Data[0] := 'Test9';
     Data[1] := 'Test2';
     Data[2] := 'Test3';
     Data[3] := 'Test1';
     Data[4] := 'Test6';
     Data[5] := 'Test0';
     Data[6] := 'Test5';
     Data[7] := 'Test7';

     //InsertionSort;
     //SelectionSort;
     //ShellSort(5);
     //Bubblesort;
     //HeapSort;
     //QuickSort;
     ShackerSort;

     {if AnsiCompareText(Data[1], data[0]) = -1 then // (a < b) = true
        Data[0]:='true';}
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

