﻿Program Task5;

(*
  Дан массив размером M на N. Написать процедуру сравнения 1й строки
  со всеми остальными. Вывести количество совпадений.

  P.S. Текстовый файл
*)

(*
  Файл:

  5 5
  1 1 1 1 1
  2 2 2 2 2
  1 1 1 1 1
  2 2 2 2 2
  1 1 1 1 1
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TMatrix = Array Of Array Of Integer;

Function AmountOfSimilar(Var Matrix: TMatrix): Integer;
Var
    Count: Integer;
    IsSimilar: Boolean;
Begin
    Count := 0;
    For Var I := Low(Matrix) + 1 To High(Matrix) Do
    Begin
        IsSimilar := True;
        For Var J := Low(Matrix[I]) To High(Matrix[I]) Do
            IsSimilar := IsSimilar And (Matrix[I][J] = Matrix[0][J]);
        Count := Count + Ord(IsSimilar);
    End;
    Result := Count;
End;

Var
    Matrix: TMatrix;
    F: TextFile;
    M, N: Integer;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, M, N);
    SetLength(Matrix, M, N);
    Readln(F);
    For Var I := Low(Matrix) To High(Matrix) Do
    Begin
        For Var J := Low(Matrix[I]) To High(Matrix[I]) Do
            Read(F, Matrix[I][J]);
        Readln(F);
    End;
    Close(F);
    Write(AmountOfSimilar(Matrix));
    Readln;

End.
