%%%-------------------------------------------------------------------
%%% @author Doan Bui <doan@BXD>
%%% @copyright (C) 2016, Doan Bui
%%% @doc
%%%
%%% @end
%%% Created : 22 Aug 2016 by Doan Bui <doan@BXD>
%%%-------------------------------------------------------------------
-module(gen_doan).
-author('DoanTalent').
-behaviour(gen_server).

%% API
%% -export([start_link/0]).

%% gen_server callbacks

%% -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
%%          terminate/2, code_change/3]).

-compile(export_all).


%%%===================================================================
%%% DEFINE
%%%===================================================================

-define(SERVER, ?MODULE).

-record(state, {dt = []
               }).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start() ->
    gen_server:start_link({local, ?}, ?MODULE, [], []).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init([]) ->
    {ok, #state{}}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @spec handle_call(Request, From, State) ->
%%                                   {reply, Reply, State} |
%%                                   {reply, Reply, State, Timeout} |
%%                                   {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, Reply, State} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_call({search, X}, _From, State)->
    Location = search(X, State#state.dt),
    NewState = State,
    io:format("~p~n",[Location]),
    {reply,reply,NewState};
handle_call({insert,X}, _From, State) ->    
    {Reply,NewState} = handle_insert(X,State),
    io:format("~p~n",[NewState#state.dt]),
    {reply,Reply,NewState}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @spec handle_cast(Msg, State) -> {noreply, State} |
%%                                  {noreply, State, Timeout} |
%%                                  {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_cast({response,_Msg}, State) ->
    %% NewState = handle_response(Msg,State),
    NewState = State,
    {noreply, NewState}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info(_Info, State) ->  
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================


%% -----------------------------------------------------------------------------
%% @private
%% @doc
%% Main function to handle all SIP requests from UA
%% The function will:
%%  
%%
%% @end
%% -----------------------------------------------------------------------------
handle_insert(X, #state{ dt = [] } = State) ->
    {ok, State#state{dt = [[],X,[]]}};
handle_insert(X, #state{dt = Dt }=State) ->
    Newdt = insert(X,Dt),
    {ok,State#state{dt = Newdt}}.

%% -----------------------------------------------------------------------------
%% @private
%% @doc
%% Main function to handle all SIP responses from Server nodes
%%
%% @end
%% -----------------------------------------------------------------------------

handle_response(_,State)->
    State.

insert(X, [_L,V,R]) when X >= V ->
    NewR = insert(X,R),
    [_L,V,NewR];
insert(X, [L,V,_R]) when X < V ->
    NewL = insert(X,L),
    [NewL,V,_R];
insert(X, []) ->
    [[],X,[]].

search(X,Dt)->  
    search(X,Dt,1).
search(X,[_L,V,R],Index) when X > V ->
    search(X,R,Index+1);
search(X,[L,V,_R],Index) when X < V ->
    search(X,L,Index+1);
search(X,[_,V,_],Index) when X == V ->
    Index.
    
