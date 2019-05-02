-module(algo).
-compile(export_all).

%% -----------------------------------------------------------------------------
%% binh phuong x^n mod m
%% -----------------------------------------------------------------------------
binhphuong(_, N) when N == 0 -> 1;
binhphuong(X, N) when N == 1-> X;
binhphuong(X, N)  -> 
    io:format("X:~p N:~p~n", [X, N]),
    case N rem 2 == 0 of
        true ->
            P = binhphuong(X, trunc(N/2)),
            P*P;
        false ->
            P = binhphuong(X, trunc(N/2)),
            P*P*X
    end.

binhphuong_mod(_, N, _) when N == 0 -> 1;
binhphuong_mod(X, N, _) when N == 1 -> X;
binhphuong_mod(X, N, M) -> 
    io:format("X:~p N:~p M:~p~n", [X, N, M]),
    case N rem 2 == 0 of
        true ->
            P = binhphuong_mod(X, trunc(N/2), M),
            P*P rem M;
        false ->
            P = binhphuong_mod(X, trunc(N/2), M),
            P*P*X rem M
    end.
