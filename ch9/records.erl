-module(records).
-include("records.hrl").
-export([first_robot/0]).
-export([car_factory/1]).
-export([adult_section/1]).
-export([admin_panel/1]).
-export([repairman/1]).
-export([included/0]).

-record(robot, {name,
                type=industrial,
                hobbies,
                details=[]}).

first_robot() ->
  #robot { name = "Mechatron",
           type=handmade,
           details=["Moved by a small man inside"]}.

car_factory(CorpName) ->
  #robot{name=CorpName, hobbies="build cars"}.

-record(user, {id, name, group, age}).
%% Use pattern matching to filter.
admin_panel(#user{name=Name, group=admin}) ->
  Name ++ " is allowed!";
admin_panel(#user{name=Name}) ->
  Name ++ " is not allowed".
%% Can extend user without problem.
adult_section(U = #user{}) when U#user.age >= 18 ->
%% Show stuff that can't be written in such a text.
  allowed;
adult_section(_) ->
%% Redirect to Sesame Street site.
  forbidden.

repairman(Rob) ->
  Details = Rob#robot.details,
  NewRob = Rob#robot{details=["Repaired by repairman" | Details]},
  {repaired, NewRob}.

included() -> #included{some_field="Some value"}.
