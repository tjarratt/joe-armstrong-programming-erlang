-module(lib_misc).
-export([for/3, qsort/1, pythag/1, permutations/1, odds_and_evens1/1, odds_and_evens2/1]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].

qsort([]) -> [];
qsort([Pivot | Tail]) ->
  qsort([X || X <- Tail, X < Pivot])
  ++ [Pivot] ++
  qsort([X || X <- Tail, X >= Pivot]).

pythag(N) ->
  [ {A, B, C} ||
    A <- lists:seq(1, N),
    B <- lists:seq(1, N),
    C <- lists:seq(1, N),
    A + B + C =< N,
    A*A + B*B =:= C*C
  ].

permutations([]) -> [[]];
permutations(List) -> [ [H | T] || H <- List, T <- permutations(List -- [H])].

% traversing the list twice might be fine with small input
odds_and_evens1(List) ->
  Odds  = [ X || X <- List, (X rem 2) =:= 1],
  Evens = [ X || X <- List, (X rem 2) =:= 0],
  {Odds, Evens}.

% ... or you can use an accumulator
odds_and_evens2(List) ->
  odds_and_evens_acc(List, [], []).

% ...technically TWO accumulators in this case
odds_and_evens_acc([H|Tail], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(Tail, [H | Odds], Evens);
    0 -> odds_and_evens_acc(Tail, Odds, [H | Evens])
  end;

odds_and_evens_acc([], Odds, Evens) ->
  {Odds, Evens}.


