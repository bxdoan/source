%% this is a comment
-module(foo).     %% we define a module called foo
-export([bar/0]). %% and export the function bar that has 0
                  %% arguments
bar() ->          %% we define the function bar
 io:format("Hello World!~n").
