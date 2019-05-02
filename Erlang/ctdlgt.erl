%%%-------------------------------------------------------------------
%%% @author doan <heosua@ubuntu>
%%% @copyright (C) 2016, doan
%%% @doc
%%%
%%% @end
%%% Created :  7 Oct 2016 by doan <heosua@ubuntu>
%%%-------------------------------------------------------------------
-module(ctdlgt).
-compile(export_all).

%% -----------------------------------------------------------------------------
%% fibonacci
%% -----------------------------------------------------------------------------
fibo(0)->
    0;
fibo(1) ->
    1;
fibo(Int)->
    fibo(Int-1) + fibo(Int-2).

%% -----------------------------------------------------------------------------
%% Greatest common divisor
%% -----------------------------------------------------------------------------    
uscln(M , N)  ->
    case N of
        0 ->
            M;
        _ ->
            uscln(N, M rem N)
    end.

%% -----------------------------------------------------------------------------
%% Tower of Hanoi
%% -----------------------------------------------------------------------------
chuyen(N, A, C)->
    io:format("chuyen dia thu ~p tu coc ~p sang coc ~p~n", [N, A, C]).

towerhanoi(N, A, C, B)->
    case N of
        1 ->
            chuyen(N, A, C);
        _ ->
            towerhanoi(N-1, A, B, C),
            chuyen(N, A, C),
            towerhanoi(N-1 , B, C, A)
        end.

%% -----------------------------------------------------------------------------
%% Knight's tour
%% -----------------------------------------------------------------------------
pop(Data)->
    case Data of 
        [] ->
            [];
        [Head|Tail] ->
            {Head, Tail}
    end.

push_stack(A, Stack)->
    [A|Stack].

ele(X, Y, Board)->
    lists:nth(X, lists:nth(Y, Board)).

cha(X, Y, Board)->
    Line = lists:nth(Y, Board),
    Newline = lists:sublist(Line, X-1) ++ [0] ++ lists:nthtail(X, Line),
    lists:sublist(Board, Y-1) ++ [Newline] ++ lists:nthtail(Y, Board).  
  
cha(Value, X, Y, Board)->
    Line = lists:nth(Y, Board),
    Newline = lists:sublist(Line, X-1) ++ [Value] ++ lists:nthtail(X, Line),
    lists:sublist(Board, Y-1) ++ [Newline] ++ lists:nthtail(Y, Board).

init_board(N)->
    lists:duplicate(N, lists:duplicate(N, 0)).

-define(D, [{2, -1}, {1, -2}, {-1, -2}, {-2, -1}, {-2, 1}, {-1, 2}, {1, 2}, {2, 1}]).
check_next_step(_,_,_,_,[],Result)->
    Result;
check_next_step(N, X, Y, Board, Stack, Result)->
    Max = length(Board)*length(Board) + 1 ,
    NewStack = possible_next_step(N, X, Y, Board, Stack, ?D),
    case N of
        Max ->
            NewResult = Result++[Board],
            io:format("~p~n", [Board]),
            {{N3, X3, Y3, Board3}, Stack3} = pop(NewStack),
            check_next_step(N3, X3, Y3, Board3, Stack3, NewResult);
        _ ->
            case is_possible(NewStack, Stack) of
                true ->
                    {{N1, X1, Y1, Board1}, Stack1} = pop(NewStack),
                    check_next_step(N1, X1, Y1, Board1, Stack1, Result);
                _ ->
                    {{N2, X2, Y2, Board2}, Stack2} = pop(Stack),
                    check_next_step(N2, X2, Y2, Board2, Stack2, Result)
            end            
    end.

is_possible(L1, L2)->
    case string:len(L1) > string:len(L2) of
        true ->
            true;
        _ ->
            false
    end.

possible_next_step(_, _, _, _, Stack, [])->
    Stack;
possible_next_step(N, X, Y, Board, Stack, [Head|Tail]) when 
    (X + element(1, Head) >= 1) and (X + element(1, Head) =< 8) and
    (Y + element(2, Head) >= 1) and (Y + element(2, Head) =< 8) ->
    U = X + element(1, Head),
    V = Y + element(2, Head),
    case ele(U, V, Board) of
        0 ->
            NewBoard = cha(N, U, V, Board),
            NewStack = push_stack({N+1, U, V, NewBoard}, Stack),
            possible_next_step(N, X, Y, Board, NewStack, Tail);
        _ ->
            possible_next_step(N, X, Y, Board, Stack, Tail)
    end;

possible_next_step(N, X, Y, Board, Stack, [_|Tail])->
    possible_next_step(N, X, Y, Board, Stack, Tail).

horse(Int)->
    io:format("Size board: ~p~nResult: ~n",[Int]),
    Board = cha(1, 1, 1, init_board(Int)),
    Result = check_next_step(2, 1, 1, Board, push_stack({2, 1, 1, Board}, []), []),
    io:format("~p~n", [Result]).
    %% print_chess_board(Result).

print_line([])->
    io:format("~n");
print_line([Head|Tail]) when Head > 9-> 
    io:format("~p  ",[Head]),
    print_line(Tail);
print_line([Head|Tail]) ->
    io:format("~p   ",[Head]),
    print_line(Tail).
    
print_chess_board([])->
    ok;
print_chess_board([Head|Tail])->
    print_line(Head),
    print_chess_board(Tail).

%% -----------------------------------------------------------------------------
%% Sudoku
%% -----------------------------------------------------------------------------
sudoku(Matrix)->
    %% format matrix
    KeyMatrix = lists:zip([{X,Y} || X<-lists:seq(1,9), Y<-lists:seq(1,9)], lists:flatten(Matrix)),
    solve_r([KeyMatrix]). 
 
solve_r([Matrix | Acc]) ->
    %% calculate the 0 element with the least 0's
    case lists:keysort(2,[{Point,get_bs(Matrix,E)}|| {Point,0} = E<- Matrix]) of
        [] ->
            %% got the solution!
            print(Matrix);
        [{Pivot,_} = E| _] ->
            %% calculate intersection of candidates
            Candidates = lists:seq(1,9) -- get_array(Matrix, E),
            %% create Matrix for each one and call recursive ...
            MatrixCandidates = [ [ {Pivot, Candidate} | lists:keydelete(Pivot, 1, Matrix)] ||
                                   Candidate <- Candidates ],
            solve_r(MatrixCandidates++Acc) 
     end. 
 
get_array(Matrix, {{X,Y}, _}) ->
     get_row(Matrix, {X,Y}) ++ get_column(Matrix, {X,Y}) ++ get_submatrix(Matrix, {X,Y}).
 
get_bs(Matrix, Element) ->
    length( [ 0 || 0 <- get_array(Matrix,Element)]).      
 
get_row( Matrix, {Row,_C} ) ->
    [X || {{R,_},X} <- Matrix, R==Row]. 
 
get_column( Matrix, {_,Column})->
    [X || {{_,C},X} <- Matrix, C == Column]. 
 
get_submatrix(Matrix, {X,Y})->
    NX = ( (X-1) div 3)*3 + 1,
    NY = ( (Y-1) div 3)*3 + 1,
    [E || {{R,C},E} <- Matrix, (R - NX < 3), (C - NY <3), (R - NX >= 0), (C - NY >= 0) ].
 
print(Matrix) ->
    io:format("~n",[]),
    print2( lists:keysort(1,Matrix),1).
print2([{_,A}|R],N) when N == 9->
    io:format(" ~p ~n",[A]),
    print2(R,1);
print2([{_,A}|R],N)->
    io:format(" ~p ",[A]),
    print2(R,N+1);
print2([],_) ->ok.
