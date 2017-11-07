procedure ShakerSort;
var
  left, right, n, index: Integer;
  done: Boolean;

begin
  n := 7;
  left := 0;
  right := n -1;

  repeat
    done := false;
    left := left + 1;
    for index := left to right do
      begin
        if (CompareText(Data[index + 1], Data[index]) = -1) then
          begin
            change(index + 1, index);
            done := true;
	  end;
      end;
    if (done = true) then break;
    done := false;
    right := right - 1;
    for index := right to (left - 1) do
      begin
        if (CompartText(Data[index + 1], Data[index]) = -1) then
          begin
	    change(index + 1, index);
            done := true;
          end;
      end;
  until ();
end;