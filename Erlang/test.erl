-module(test).
-compile([export_all,debug_info]).
-export([pany/1]).


isList([])->true;
isList([_|_])->true;
isList(_)->false.

pany(X)->
    IsList=isList(X),
    Result=if IsList == true -> "Its a list";
              IsList == false -> dispatch(X)
            end,
    Result.

dispatch(T) when T>3 ->
    Val=if T > 4 -> 55 ;
           T >5 -> 66 
        end,
    if (Val+1)==67 -> "lalalal" end;
dispatch(_)->"no result".