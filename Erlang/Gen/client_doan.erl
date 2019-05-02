-module(client_doan).
-author('Doantalent').
-compile(export_all).

start()->
    gen_server:call(gen_doan,{request,add,4,5}).
