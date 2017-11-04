program project1;

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
{const SIZE = 20000;
type TFeld = array[1..SIZE] of integer;}
//Heapsort(A) {
   BuildHeap(A)
   for i <- length(A) downto 2 {
      exchange A[1] <-> A[i]
      heapsize <- heapsize -1
      Heapify(A, 1)
}



//BuildHeap(A) {
   heapsize <- length(A)
   for i <- floor( length/2 ) downto 1
      Heapify(A, i)
}




//Heapify(A, i) {
   le <- left(i)
   ri <- right(i)
   if (le<=heapsize) and (A[le]>A[i])
      largest <- le
   else
      largest <- i
   if (ri<=heapsize) and (A[ri]>A[largest])
      largest <- ri
   if (largest != i) {
      exchange A[i] <-> A[largest]
      Heapify(A, largest)
   }
}
procedure heapsort;
    procedure genheap(Data: Array of String);             { Heap (mit linearem Aufwand) aufbauen }
    var
      i,j,max: Integer;
    begin
        for i := 4 div 2 downto 0 do begin   { zweite Hälfte des Feldes braucht nicht betrachtet werden }
            j:=i;
            while j <= 4 div 2 do begin
                max := j * 2 + 1;               { finde Maximum der (beiden) Söhne }
                if max > 4 then
                  max := max - 1
                else if AnsiCompareText(Data[max-1], data[max]) = -1 then
                  max := max - 1;
                if AnsiCompareText(Data[max], data[j]) = -1 then begin     { ggf. tauschen = Change}
                    change(max, j);
                end;
                j := max;
            end;
        end;
    end;

    function popmax(Data: Array of String;heapsize: Integer): String;
    var
      i,max: Integer;
    begin
        popmax := Data[1];
        Data[1] := Data[heapsize];
        i := 1;
        while i <= (heapsize div 2) do begin { letztes Element an Anfang setzen und versickern lassen }
            max := i * 2 + 1;               { finde Maximum der (beiden) Söhne }
            if max > heapsize then
              max := max - 1
            else if AnsiCompareText(Data[max - 1], data[max]) = -1 then
              max := max - 1;
            if AnsiCompareText(Data[i], data[max]) = -1 then begin     { ggf. tauschen = Change}
                change(max, i);
            end;
            i := max;
        end;
    end;

var i:integer;
begin
    genheap(Data);
    for i:=4 downto 0 do Data[i] := popmax(Data,i);
end;
{Ende Heap-Sort}

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
     Data[0] := 'Test5';
     Data[1] := 'Test2';
     Data[2] := 'Test3';
     Data[3] := 'Test1';
     Data[4] := 'Test6';

     //InsertionSort;
     //SelectionSort;
     //ShellSort(5);
     //Bubblesort;
     //???QuickSort(0, 4);
     heapsort;

     if AnsiCompareText(Data[1], data[0]) = -1 then // (a < b) = true
        Data[0]:='true';
     Writeln(Data[0]);
     Writeln(Data[1]);
     Writeln(Data[2]);
     Writeln(Data[3]);
     Writeln(Data[4]);
     Readln(Data[0]);
end.
