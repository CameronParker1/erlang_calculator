%%%-------------------------------------------------------------------
%% @doc erlang_calculator public API
%% @end
%%%-------------------------------------------------------------------

-module(erlang_calculator_app).
-behaviour(application).
-export([start/2, stop/1, calculate/1]).

start(_StartType, _StartArgs) ->
    erlang_calculator_sup:start_link().

stop(_State) ->
    ok.

%% Calculate function

%% Add
calculate({add, A, B}) ->
    A + B;

%% Subtract
calculate({subtract, A, B}) ->
    A - B;

%% Multiply
calculate({multiply, A, B}) ->
    A * B;

%% Divide
calculate({divide, A, B}) when B /= 0 ->
    A / B;

%% Factorial
calculate({factorial, N}) when N >= 0, N =< 20 ->
    factorial(N);
calculate(_) ->
    {error, "Invalid operation or input"}.

%% Factorial function with error handling
factorial(N) when N >= 0, N =< 20 ->
    factorial(N, 1);
factorial(_) ->
    {error, "Input out of range, must be between 0 and 20"}.

%% Helper function for factorial calculation
factorial(0, Acc) ->
    Acc;
factorial(N, Acc) when N > 0 ->
    factorial(N - 1, N * Acc).