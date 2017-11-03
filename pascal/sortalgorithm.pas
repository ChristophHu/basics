program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

Uses sysutils;

var
  Data: Array[0..4] of String;



Procedure Change(x, y: Integer);
var temp: String;
Begin
     temp := Data[x];
     Data[x] := Data[y];
     Data[y] := temp;
End;

{ Pseudocode
INSERTIONSORT(A)
for i ? 2 to Länge(A) do
  einzusortierender_wert ? A[i]
  j ? i
  while j > 1 and A[j-1] > einzusortierender_wert do
    A[j] ? A[j - 1]
    j ? j - 1
  A[j] ? einzusortierender_wert}
Procedure InsertionSort;
var
  i,j: Integer;
  v: String;
Begin
  For i:= 2 To 4 Do
  Begin
    v:= Data[i];
    j:= i;
    While AnsiCompareText(Data[j-1], v) = -1 Do  // (j > 1) = true and
    Begin
      Data[j]:= Data[j-1];
      j := j - 1;
    End;
    Data[j]:= v;
  End;
End;

Procedure SelectionSort;
program sort;

{$APPTYPE CONSOLE}

{$R *.res}

Uses sysutils;

var
  Data: Array[0..4] of String;



Procedure Change(x, y: Integer);
var temp: String;
Begin
     temp := Data[x];
     Data[x] := Data[y];
     Data[y] := temp;
End;

{ Pseudocode
INSERTIONSORT(A)
for i ? 2 to Länge(A) do
  einzusortierender_wert ? A[i]
  j ? i
  while j > 1 and A[j-1] > einzusortierender_wert do
    A[j] ? A[j - 1]
    j ? j - 1
  A[j] ? einzusortierender_wert}
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

{ Pseudocode:
funktion quicksort(links, rechts)
  falls links < rechts dann
    teiler:= teile(links, rechts)
    quicksort(links, teiler-1)
    quicksort(teiler+1, rechts)
  ende
ende
}
Procedure QuickSort( l,r : Integer );
var i : Integer;
Begin
    If AnsiCompareText(Data[l], Data[r]) = 1 Then
      Begin
        i:= (l + r) mod 2;
        QuickSort( l, i-1 );
        QuickSort( i+1, r );
      End;
End;

begin
     Data[0] := 'Test55';
     Data[1] := 'Test2';
     Data[2] := 'Test3';
     Data[3] := 'Test10';
     Data[4] := 'Test5';

     //InsertionSort;
     //SelectionSort;
     ShellSort(5);
     //Bubblesort;
     //QuickSort(0, 4);

     Writeln(Data[0]);
     Writeln(Data[1]);
     Writeln(Data[2]);
     Writeln(Data[3]);
     Writeln(Data[4]);
     Readln(Data[0]);
end.