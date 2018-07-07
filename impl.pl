% Entities
% entity(real_name).

entity("Barack Hussein Obama II").
entity("Hollywood").
entity("California").
entity("United States of America").
entity("Toyota Motor Corporation").
entity("Michelle Obama").

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

tag("California", "what is", ["state"]).
tag("California", "area codes", [209, 213, 310, 323, 408, 415, 424, 442, 
    510, 530, 559, 562, 619, 626, 650, 657, 661, 707, 714, 747, 760, 805,
    818, 831, 858, 909, 916, 925, 949, 951]).

tag("Toyota Motor Corporation", "what is", ["multinational automotive manufacturer"]).
tag("Toyota Motor Corporation", "where from", ["Japan"]).
% "..." represents that not all the properties for that tipe have been listed, but could be
tag("Toyota Motor Corporation", "cars", ["Corolla", "Prius", "Hilux", "..."]).

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

event("Barack Obama was born", 1961).

event("Toyota was founded", 1937).

event("California was admitted to the union", 1850).
% Who

who("Barack Hussein Obama II", "Barack Obama was born").

who("Toyota Motor Corporation", "Toyota was founded").

who("California", "California was admitted to the union").


% Get the current year
year(Year) :-
        get_time(Stamp),
        stamp_date_time(Stamp, DateTime, local),
        date_time_value(year, DateTime, Year).

bigger_equal(X, Y):- number(X), number(Y), X >= Y.
equal(X, Y):- X = Y.

% Places
% place(real_name, belongs_to)
place("California", "United States of America").
place("Hollywood", "California").

% Where
% where(where, what)
where("California", "Tornado").
where("Hollywood", "Golden Globe").

% Event in specific location
% event_where(event_name, place)
event_where(X, Y) :-
    (   
    	where(Y, X),
    	!
    );
    (   
    	place(Z, Y),
    	where(Z, X),
    	!
    );
    (   
       	place(Z, Y),
    	event_where(X, Z)
    ).

% Tratando datas
date(X, Y) :-
    split_string(X, "/","", Y).

year([_ | [_ | [X |_ ]]], Y) :-
     atom_number(X, Y).

year(X, Y) :-
    date(X, Z),
    year(Z, Y),
    !.

month([_ | [X | _]], Y) :-
	atom_number(X, Y).

month(X, Y) :-
    date(X, Z),
    month(Z, Y),
    !.

day([X |_], Y) :- 
    atom_number(X, Y).

day(X, Y) :-
    date(X, Z),
    day(Z, Y),
    !.

after(X, Y) :-
    (   
    	year(X, A),
   		year(Y, B),
        A > B
    ),
    !;
    (   
    	month(X, A),
   		month(Y, B),
        A > B
    ),
    !;
    (   
    	day(X, A),
   		day(Y, B),
        A > B
    ),
    !.

before(X, Y) :-
    (   
    	year(X, A),
   		year(Y, B),
        A < B
    ),
    !;
    (   
    	month(X, A),
   		month(Y, B),
        A < B
    ),
    !;
    (   
    	day(X, A),
   		day(Y, B),
        A < B
    ),
    !.

same_time(X, Y) :-
    not(before(X, Y)),
    not(after(X, Y)).


comp_dates(X, A, B) :-
    (
        year(A, Ya),
       	year(B, Yb),
    	Ya > Yb,
        compare(X, Ya, Yb),
        !
    );
    (
    	month(A, Ma),
       	month(B, Mb),
    	Ma > Mb,
        compare(X, Ma, Mb),
        !
    );
    (
    	day(A, Da),
       	day(B, Db),
    	Da > Db,
    	compare(X, Da, Db),
        !
    ). 
                 
		 
inside(X, A) :-
    findall(Y, place(Y, X), A).
