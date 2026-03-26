% -*- mode: prolog -*-
:- encoding(utf8).

:- encoding(utf8).

digits_count(N, 1) :- N < 10, !.
digits_count(N, Count) :-
    N1 is N // 10,
    digits_count(N1, C1),
    Count is C1 + 1.

append_end(N, K, Result) :-
    Result is N * 10 + K.

append_start(N, K, Result) :-
    digits_count(N, Count),
    Pow is 10 ^ Count,
    Result is K * Pow + N.

go :-
    write('Введите натуральное число: '),
    read(N),
    write('Введите цифру (0-9): '),
    read(K),
    ( N > 0, K >= 0, K =< 9 ->
        append_end(N, K, EndResult),
        append_start(N, K, StartResult),
        write('Число с цифрой в конце: '), write(EndResult), nl,
        write('Число с цифрой в начале: '), write(StartResult), nl
    ; write('Ошибка: N должно быть > 0, K — цифра от 0 до 9.'), nl
    ).

:- go.
