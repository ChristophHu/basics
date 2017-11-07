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

{begin ShellSort}
Procedure ShellSort();
var
  n, step, start, i, j: Integer;

begin
  n := 7;
  step := n;
  repeat
    step := (step-1) DIV 3;
    left := 0;
    while (left < step) do
      begin
        i := left + 1;
        while (i<n) do
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
        left := left + 1;
      end;
  until (step>0)
end;
{end ShellSort}

begin
Data[0] := 'Test9';
  Data[1] := 'Test2';
  Data[2] := 'Test3';
  Data[3] := 'Test1';
  Data[4] := 'Test6';
  Data[5] := 'Test0';
  Data[6] := 'Test5';
  Data[7] := 'Test7';

  ShellSort;

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