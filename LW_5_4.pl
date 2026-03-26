:- encoding(utf8).
% -*- mode: prolog -*-

go :-
    Animals = [dog, cat, hamster],
    permutation([PetAnimal, LenaAnimal, TanyaAnimal], Animals),
    PetAnimal \= cat,
    TanyaAnimal = cat,
    PetAnimal \= hamster,
    format('Петя гулял с ~w~n', [PetAnimal]),
    format('Лена гуляла с ~w~n', [LenaAnimal]),
    format('Таня гуляла с ~w~n', [TanyaAnimal]).

% Вызов go 
:- go.
