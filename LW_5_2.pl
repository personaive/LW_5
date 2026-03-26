:- encoding(utf8).

% найти минимум и максимум неотрицательных элементов (включая 0)
min_max_pos([H|T], Min, Max) :-
    H >= 0,
    min_max_pos(T, H, H, Min, Max).

min_max_pos([H|T], CurMin, CurMax, Min, Max) :-
    ( H >= 0 ->
        NewMin is min(CurMin, H),
        NewMax is max(CurMax, H)
    ;
        NewMin = CurMin,
        NewMax = CurMax
    ),
    min_max_pos(T, NewMin, NewMax, Min, Max).

min_max_pos([], Min, Max, Min, Max).

% нижняя степень двойки
power_down(N, P) :-
    power_down(N, 0, P).

power_down(N, K, 0) :- N =:= 0, !.  % специальный случай для 0

power_down(N, K, K) :-
    Pow is 2^K,
    Pow =< N,
    Pow1 is 2^(K+1),
    Pow1 > N, !.

power_down(N, K, P) :-
    K1 is K + 1,
    power_down(N, K1, P).

% верхняя степень двойки
power_up(N, P) :-
    power_up(N, 0, P).

power_up(N, 0) :- N =:= 0, !.  % для 0

power_up(N, K, K) :-
    Pow is 2^K,
    Pow >= N, !.

power_up(N, K, P) :-
    K1 is K + 1,
    power_up(N, K1, P).

go :-
    write('Введите список (например [0, 2, 5]): '),
    read(List),
    ( min_max_pos(List, Min, Max) ->
        power_down(Min, A),
        power_up(Max, B),
        write('Элементы лежат между 2^'),
        write(A),
        write(' и 2^'),
        write(B), nl
    ;
        write('Нет подходящих элементов!'), nl
    ).

:- go.