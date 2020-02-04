

PROGRAM President(input, output);
CONST
    MAX_PRESIDENT = 100;
    MAX_NAME_LENGTH =16;
    NAME_SEPARATOR = ' ';
TYPE
    nameString = PACKED ARRAY[1..MAX_NAME_LENGTH] OF char;
    presidentRec = RECORD
                        start_year : integer;
                        end_year : integer;
                        first_name : nameString;
                        middle_name : nameString;
                        last_name : nameString;
                    END;
    
VAR
    presidentCount : integer;
    presidents : ARRAY [1..MAX_PRESIDENT] OF presidentRec;
    f_letter, s_letter: char;
    f_s_year: integer;
PROCEDURE readName(VAR name : nameString);
    VAR
        i : integer;
        ch: char;
    BEGIN
        i :=0;
        name := ' ';
        REPEAT
            IF NOT eoln THEN BEGIN
                read(ch);
                IF(ch <> NAME_SEPARATOR) 
                AND (i <MAX_NAME_LENGTH) THEN BEGIN
                    i := i+1;
                    name[i] :=ch;
                END;
            END;
        UNTIL eoln OR (ch = NAME_SEPARATOR);

    END;
PROCEDURE readMName(VAR name: nameString);
    VAR
        i:integer;
        period:char;
        ch: char;
    BEGIN
        i:=0;
        name := ' ';
        REPEAT
            IF NOT eoln THEN BEGIN
                read(ch);
                read(period);
                f_letter := ch;
                s_letter := period;
                if(ch<> NAME_SEPARATOR) AND (period = '.') THEN BEGIN
                    i:= i+1;
                    name[i] := ch;
                    i:=i+1;
                    name[i] := period;
                END;
            END;
        UNTIL eoln OR(period <>'.');
    END;
PROCEDURE readlName(VAR name: nameString);
    VAR
        i:integer;
        ch: char;
    BEGIN
        i:=2;
        name :=' ';
        name[1] := f_letter;
        name[2] := s_letter;
        REPEAT
            IF NOT eoln THEN BEGIN
                read(ch);
                IF(ch <> NAME_SEPARATOR) 
                AND (i <MAX_NAME_LENGTH) THEN BEGIN
                    i := i+1;
                    name[i] :=ch;
                END;
            END;
        UNTIL eoln OR (ch = NAME_SEPARATOR);
    END;
PROCEDURE readPresident;
    VAR
        i: integer;
        count: integer;
        j: integer;
        ch:char;
    BEGIN
        read(i);
        read(j);
        WHILE (i>0) AND (count < MAX_PRESIDENT) DO BEGIN
            count := count+1;
            read(ch);
            WITH presidents[count] DO BEGIN
                start_year:= i;
                end_year:= j;
                readName(first_name);
                readMName(middle_name);
                readlName(last_name);
            END;
            readln;
            read(i);
            read(j);
            f_s_year :=j;
        END;
        presidentCount := count;
    END;
PROCEDURE printPresidents;

    VAR
        i : integer;

    BEGIN
        FOR i := 1 TO presidentCount DO BEGIN
            writeln;

            WITH presidents[i] DO BEGIN
                writeln('Start year: ', start_year);
                writeln('End year  : ', end_year);
                writeln('First name: ', first_name);
                writeln('Middle name: ', middle_name);
                writeln('Last name :', last_name);
            END;
        END;
        writeln;
    END;
PROCEDURE searchPresident;
    VAR
        i:integer;
        year: integer;
        j:integer;
    BEGIN
        year := f_s_year;
        REPEAT
            j:=0;
            writeln('In the ',year);
            FOR i:=1 TO presidentCount DO BEGIN
                WITH presidents[i] DO BEGIN
                    IF(year >= start_year) AND(year<= end_year) THEN BEGIN
                        inc(j);
                        writeln('President ', last_name,' ',middle_name,first_name,' is in the office');
                    END
                END;
            END;
            IF (j=0) THEN BEGIN
                writeln('There is no president show in the record in ',year);
            END;
            writeln;
            read(year);
        UNTIL(year<0);
    END;
BEGIN
  readPresident;
  printPresidents;
  searchPresident;
END.
