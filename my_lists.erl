-module(my_lists).
-export([sum/1]).

sum([H | T]) -> H + sum(T);
sum([]) -> 0.
