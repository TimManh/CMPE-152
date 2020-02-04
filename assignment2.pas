program Merge2array;
type
    arr = array[1..20] of integer;
    long_arr = array[1..40] of integer;
var
    farray : arr;
    sarray : arr;
    marray : long_arr;
    i: integer;
    j: integer;
    len_arr1:integer;
    len_arr2:integer;
    
{==========Print function==============}
procedure Print(x:array of integer; len: integer);
var
    k: integer;
begin
    for k:=0 to len-1 do
        begin
            write(x[k]);
            write(' ');
        end;
    writeln();    
end;

{=============Merging two array function====================}
function Merge(array1:arr;len1:integer;array2:arr;len2:integer):long_arr;
var
    array3: long_arr;
    l:integer;
begin
    l:=1;
    i:=1;
    j:=1;
    while i<=len1 do
        begin
            if (j<=len2) and (array1[i]>array2[j]) then
                begin
                    array3[l] := array2[j];
                    inc(j);
                end
            else
                begin
                    array3[l] := array1[i];
                    inc(i);
                end;
            inc(l);
        end;
    while j<=len2 do
        begin
            array3[l] := array2[j];
            inc(j);
            inc(l);
        end;
    Exit(array3);    
end;

{===================Main=====================}
begin
    writeln('Length of your first array');
    readln(len_arr1);
    writeln('Enter your first array value:');
    for i:= 1 to len_arr1 do
        begin
            readln(farray[i]);
        end;
    writeln('These are your first value:');
    Print(farray,len_arr1);   
    writeln('Length of your second array');
    readln(len_arr2);
    writeln('Enter your second array value:');
    for j:= 1 to len_arr2 do
        begin
            read(sarray[j]);
        end;
    writeln('These are your second value:');
    Print(sarray,len_arr2);   
    marray := Merge(farray,len_arr1,sarray,len_arr2);
    writeln('Merge two array into one');
    Print(marray,len_arr2+len_arr1)
    
end.
