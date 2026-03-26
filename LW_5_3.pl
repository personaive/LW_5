:- encoding(utf8).
% -*- mode: prolog -*-

% найти минимум
min_elem([X], X).
min_elem([H|T], Min) :-
    min_elem(T, MinT),
    ( H < MinT -> Min = H ; Min = MinT ).

% удалить первый найденный элемент
remove_elem(X, [X|T], T) :- !.
remove_elem(X, [H|T], [H|R]) :-
    remove_elem(X, T, R).

% сортировка выбором
selection_sort([], []).
selection_sort(List, [Min|SortedTail]) :-
    min_elem(List, Min),
    remove_elem(Min, List, Rest),
    selection_sort(Rest, SortedTail).

go :-
    write('Введите список: '),
    read(List),
    selection_sort(List, Sorted),
    write('Отсортированный список: '),
    write(Sorted), nl.

:- go.
