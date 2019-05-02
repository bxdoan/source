-module(foo).
-compile(export_all).

start()->
	io:format("A   B   C   Turns~n"),
	d(4, 2, 2, 0).
d(_A, _A, _A, B) ->
	io:format("~p   ~p   ~p   ~p~n",[_A, _A, _A, B]);
d(A, B, C, D)->
	io:format("~p   ~p   ~p   ~p~n", [A, B, C, D]),
	Na = check(A, B),
	Nb = check(B, C),
	Nc = check(C, A),
	d(Na, Nb, Nc, D + 1).

even(X) when X >= 0 -> (X band 1) == 0.
check(A, B)->
	N = trunc((A + B)/2),
	case even(N) of
		true -> N;
		false -> N + 1
	end.


main() ->
    io:fwrite("Hello\n"),
    students(4, 2, 2, 1). %Define how many candy each students get

givecandy(Student1, Student1, Student1, _Turn) -> 1;
givecandy(Student1, Student2, Student3, Turn) ->
    io:format("Turn123"),
    Student1Total = (Student1 div 2) + (Student3 div 2),
    Student2Total = (Student2 div 2) + (Student1 div 2),
    Student3Total = (Student3 div 2) + (Student2 div 2),
    TurnCount = Turn + 1,
    teachergivecandy(Student1Total, Student2Total, Student3Total, TurnCount).

students(X, Y, Z, Turn) ->
    Student1 = X,
    Student2 = Y,
    Student3 = Z,
    TurnCount = Turn,
    io:format("Turn: ~p~n" , [TurnCount]),
    io:format("Student 1 Total: ~p~n" , [Student1]),
    io:format("Student 2 Total: ~p~n" , [Student2]),
    io:format("Student 3 Total: ~p~n" , [Student3]),
    givecandy(Student1, Student2, Student3, TurnCount).

teachergivecandy(Student1Total, Student2Total, Student3Total, TurnCount) ->
    io:format("hello1"),
    if 
    	Student1Total rem 2 == 1 -> 
            Student1FinalTotal = Student1Total + 1; %Student1FinalTotal = Student1Total + 1,
        true ->
            Student1FinalTotal = Student1Total
    end,
    if 
        Student2Total rem 2 == 1 -> 
            Student2FinalTotal = Student2Total + 1; %Student1FinalTotal = Student1Total + 1,
        true ->
            Student2FinalTotal = Student2Total
    end,
    if 
        Student3Total rem 2 == 1 -> 
            Student3FinalTotal = Student3Total + 1; %Student1FinalTotal = Student1Total + 1,
        true ->
            Student3FinalTotal = Student3Total
    end,
    io:format("Student 1 Total: ~p~n" , [Student1FinalTotal]),
    io:format("Student 2 Total: ~p~n" , [Student2FinalTotal]),
    io:format("Student 3 Total: ~p~n" , [Student3FinalTotal]),
    io:format("Turn: ~p~n" , [TurnCount]),
    givecandy(Student1FinalTotal, Student2FinalTotal, Student3FinalTotal, TurnCount).