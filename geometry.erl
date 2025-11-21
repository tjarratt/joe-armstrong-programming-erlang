-module(geometry).
-export([area/1, test/0]).

test() ->
  12 = area({rectangle, 3, 4}),
  169 = area({square, 13}),
  3.14159 = area({circle, 1}),
  6.0 = area({right_triangle, 3, 4}),

  tests_worked.

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> Radius * Radius * 3.14159;
area({right_triangle, Width, Height}) ->
  area({rectangle, Width, Height}) / 2.0.


