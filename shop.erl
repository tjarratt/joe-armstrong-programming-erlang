-module(shop).
-export([cost/1, total/1, total2/1, total3/1]).
-import(lists, [map/2, sum/1]).

cost(oranges)   -> 5;
cost(newspaper) -> 8;
cost(apples)    -> 2;
cost(pears)     -> 9;
cost(milk)      -> 7.

% simple way of calculating a total with recursion
total([{What, Amount} | Tail]) -> cost(What) * Amount + total(Tail);
total([]) -> 0.

% calculating total with higher-ordered functions
total2(L) -> sum(map(fun({What, N}) -> cost(What) * N  end, L)).

% once again, with list comprehensions
total3(L) -> sum([cost(What) * Amount || {What, Amount} <- L]).
