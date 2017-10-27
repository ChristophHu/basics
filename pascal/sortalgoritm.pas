(* a compilation of sort-algoritm *)

// selectionsort
Procedure SelectionSort;
var i, j, min : Integer;
Begin
  For i:= 1 to N-1 Do
  Begin
    min:= i;
    For j:= i+1 To N Do
      If (Data[j] < Data[min]) Then min:= j;

    SwapValues( i, min);
  End;
End;

// insertionsort
Procedure InsertionSort;
var i,j,v : Integer;
Begin
  For i:= 2 To N Do
  Begin
    v:= Data[i];
    j:= i;
    While (j > 1) and (Data[j-1] > v) Do
    Begin
      Data[j]:= Data[j-1];
      dec( j );
    End;
    Data[j]:= v;
  End; 
End;

// bubblesort
Procedure BubbleSort;
var i,j : Integer;
Begin
  For i:= N downto 1 Do
    For j:= 1 To i Do
      If (Data[j-1] > Data[j]) Then SwapValues( j-1, j );
End;

// shellsort
Procedure ShellSort;
var i, j, h, v : Integer;
Begin
  h:= 1;
  Repeat
    h:= (3 * h) +1;
  Until (h > N);

  Repeat
    h:= (h div 3);
    For i:= (h+1) To N Do
    Begin
      v:= Data[i];
      j:= i;

      While ((j > h) and (Data[j-h] > v)) Do
      Begin
        Data[j]:= Data[j-h];
        dec( j, h );
      End;
      Data[j]:= v;
    End;
  Until (h = 1);
End;

// quicksort
Procedure QuickSort( l,r : Integer );
var i : Integer;
Begin
  If (r > l) Then
  Begin
    i:= Partition( l, r);
    QuickSortRekursiv( l, i-1 );
    QuickSortRekursiv( i+1, r );
  End;
End;

Function Partition( l,r : Integer ) : Integer;
var v,t,i,j : Integer;
Begin
  v:= Data[r];
  i:= l-1;
  j:= r;
  Repeat
    Repeat inc( i ); Until (Data[i] >= v);
    Repeat dec( j ); Until (Data[j] <= v);
    t:= Data[i]; Data[i]:= Data[j]; Data[j]:= t;
  Until (j<=i);

  Data[j]:= Data[i]; Data[i]:= Data[r]; Data[r]:= t;
  Result:= i;
End;

Procedure QuickSortIterativ;
var i, l, r : Integer;    
Begin
  l:= 1; r:= N;
  Stack.Push( l ); Stack.Push( r );
  Repeat
    If (r > l) Then
    Begin
      i:= Partition( l, r );
      If (i-l) > (r-i) Then
      Begin
        Stack.Push( l );
        Stack.Push( i-1 );
        l:= i+1;
      End
      Else
      Begin
        Stack.Push( i+1 );
        Stack.Push( r );
        r:= i-1;
      End;
    End
    Else
    Begin
      r:= Stack.Pop;
      l:= Stack.Pop;
    End;
  Until StackisEmpty;
End;

// heapsort
Procedure HeapSort;
var i, k, m : Integer;
Begin
  m:= N;
  k:= m div 2;

  For i:= k downto 1 Do downHeap( i, m );

  While (m > 1) Do
  Begin
    SwapValues( 1, m );
    dec( m );
    downHeap( 1, m );
  End;
End;

Procedure downHeap( index, heapSize : Integer );
var j, k, m, v : Integer;
Begin
  k:= index;
  v:= Data[k];
  m:= heapSize;
  While (k <= (m div 2)) Do
  Begin
    j:= 2*k;
    If (j < n) Then
      If (Data[j] < Data[j+1]) Then inc( j );
    If (v > Data[j]) Then
    Begin
      Data[k]:= v;
      Exit;
    End;
    SwapValues( k, j );
    k:= j;
  End;
End;

// mergesort
Procedure MergeSort( l, r : Integer );
var i, j, k, m : Integer;
Begin
  If (l < r) Then
  Begin
    m:= (r+l) div 2;

    MergeSort( l, m );
    MergeSort( m+1, r );

    For i:= l To m Do HilfsArray[i]:= Data[i];
    i:= l;

    For j:= m+1 To r Do HilfsArray[r+m+1-j]:= Data[j];
    j:= r;

    For k:= l To r Do
    Begin
      If (HilfsArray[i] < HilfsArray[j]) Then
      Begin
        Data[k]:= HilfsArray[i];
        inc( i );
      End
      Else
      Begin
        Data[k]:= HilfsArray[j];
        dec( j );
      End;
    End;
  End;
End;
