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

{begin InsertionSort}
Procedure InsertionSort;
var
  n, index, j: Integer;
  tempStr: String;

Begin
  n := 7;
  For index:= 1 To n Do
  Begin
    tempStr:= Data[index];
    j:= index;
    While ((j > 0) = true) AND (AnsiCompareText(Data[j-1], tempStr) = -1) Do
    Begin
      Data[j]:= Data[j-1];
      j := j - 1;
    End;
    Data[j]:= tempStr;
  End;
End;
{end InsertionSort}

begin
Data[0] := 'Test9';
  Data[1] := 'Test2';
  Data[2] := 'Test3';
  Data[3] := 'Test1';
  Data[4] := 'Test6';
  Data[5] := 'Test0';
  Data[6] := 'Test5';
  Data[7] := 'Test7';

  InsertionSort;

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