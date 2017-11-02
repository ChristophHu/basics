program Bubblesort;

Uses sysutils;

var
  Data: Array[0..2] of String;

Procedure Change(x, y: Integer);
var temp: String;
Begin
     temp := Data[x];
     Data[x] := Data[y];
     Data[y] := temp;
End;

Procedure BubbleSort;
var i,j : Integer;
Begin
     For i:= 2 downto 0 Do
         For j:= 1 To i Do
             If AnsiCompareText(Data[j-1], Data[j]) = -1 Then Change(j-1, j);
End;

begin
     Data[0] := 'Test1';
     Data[1] := 'Test2';
     Data[2] := 'Test3';

     Bubblesort;
     Writeln(Data[0]);
     Writeln(Data[1]);
     Writeln(Data[2]);
     Readln();
end.
