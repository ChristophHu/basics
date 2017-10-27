(* pascal

contents of pascal:
1. comments
2. variables
3. constants
4. types

 . programstructure
 . operator
*)

// https://www.tutorialspoint.com/pascal/pascal_program_structure.htm

// 1. comments
// single line comment
(* comment delimiters *)
{ replace the old comment delimiters }

// 2. variables
var PI : Integer := 3.141592;

// 3. constants
Const PI : Integer = 3.141592654;

// 4. self defined types
type tColor = (red, green, blue, yellow);
var color : tColor


// . pascal program structure
program name_of_program
uses name_of_libaries
var globalVariable

function MyFunction(params:integer;
var localVariable
begin
    {code}
end;

procedure MyProcedure(params;
begin
    {code}
end;

// . 'hello world'
program helloWorld
uses crt;

begin
    writeln('Hello World!')
    readkey;
end;

// . compile and execute
// MAC: $ fpc hellp.pas


// . operator
// compare '<', '>', '=', '<=', '>=', '<>'
if (1 < 2) then
begin
    {code}
end;

// logical connect AND, OR, NOT
if (1 < 2) AND (3 < 4) then
begin
    {code}
end;

