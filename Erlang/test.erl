-module(test).
-compile([export_all,debug_info]).

alternate(L) -> do_alternate(L, 0, length(L)).
do_alternate(_, L, L) -> [];
do_alternate([H|T], N, L) ->
    case (N band 1) == 0 of
      true -> do_alternate(T, N+1, L);
      false -> [H] ++ do_alternate(T, N+1, L)
    end.

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


-record(man,{name,
             age,
             children=[]}).
-record(child,{
    name,
    age,
    sex
}).

makeFam()->
    #man{name="Adrian",
         age=33,
         children=[#child{name="Daniel",age=33,sex="Male"},
                   #child{name="Chris" ,sex="Male"},
                   #child{name="Anne",age=33,sex="Female"}]
        }.


fatherAndSons(Man#man{children=Ch})->{Man,[Elem|| Elem<-Ch,isMale(Elem) == true]}.

isMale(#child{sex = Y})->
    case Y of
        "Male"->true;
         _ ->false
    end.
