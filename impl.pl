% Entities
% entity(real_name).

entity("Barack Hussein Obama II").
entity("California").
entity("Toyota Motor Corporation").
entity("Michelle Obama").
entity("Malia Obama").
entity("United States of America").

% Names
% name(synonymous_name, real_name).

name("Barack", "Barack Hussein Obama II").
name("Obama", "Barack Hussein Obama II").
name("Barack Obama", "Barack Hussein Obama II").

name("Cali", "California").

name("Toyota", "Toyota Motor Corporation").
name("Toyota Motor", "Toyota Motor Corporation").

% Tags
% tag(real_name, property_tipe, list_of_properties[]).

tag("Barack Hussein Obama II", "what is", ["person"]).
tag("Barack Hussein Obama II", "gender", ["man"]).
tag("Barack Hussein Obama II", "skin color", ["black"]).
tag("Barack Hussein Obama II", "professions", ["Lawyer", "Author", "Political", "Professor of Law"]).
tag("Barack Hussein Obama II", "birth", [1961]).

tag("California", "what is", ["state"]).
tag("California", "area codes", [209, 213, 310, 323, 408, 415, 424, 442, 
    510, 530, 559, 562, 619, 626, 650, 657, 661, 707, 714, 747, 760, 805,
    818, 831, 858, 909, 916, 925, 949, 951]).
tag("California", "Admission to Union", [1850]).

tag("Toyota Motor Corporation", "what is", ["multinational automotive manufacturer"]).
tag("Toyota Motor Corporation", "where from", ["Japan"]).
% "..." represents that not all the properties for that tipe have been listed, but could be
tag("Toyota Motor Corporation", "cars", ["Corolla", "Prius", "Hilux", "..."]).
tag("Toyota Motor Corporation", "foundation", [1937]).

% relationship
% relationship(relation, entity_1, entity_2).

relationship("husband", "Barack Hussein Obama II", "Michelle Obama", TIME) :-
    (
        year(CURRENT_YEAR),
        between(1992, CURRENT_YEAR, TIME)
    ).

relationship("father", "Barack Hussein Obama II", "Malia Obama", TIME) :-
    bigger_equal(TIME, 1998).

relationship("president", "Barack Hussein Obama II", "United States of America", TIME) :-
    between(2009, 2017, TIME).

event("end of world war II", 1945).

event("world war II", TIME) :-
    between(1939, 1945, TIME).



% Get the current year
year(Year) :-
        get_time(Stamp),
        stamp_date_time(Stamp, DateTime, local),
        date_time_value(year, DateTime, Year).

bigger_equal(X, Y):- number(X), number(Y), X >= Y.
equal(X, Y):- X = Y.