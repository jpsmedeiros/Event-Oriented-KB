% Entities
% entity(real_name).

entity("Barack Hussein Obama II").
entity("California").
entity("Toyota Motor Corporation").

% Names
% name(synonymous_name, real_name).

name("Barack", "Barack Hussein Obama II").
name("Obama", "Barack Hussein Obama II").
name("Barack Obama", "Barack Hussein Obama II").

name("Cali", "California").

name("Toyota", "Toyota Motor Corporation").
name("Toyota Motor", "Toyota Motor Corporation").

% Tags
% tag(real_name, property_tipe, list_of_properties[])

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
% "..." represents that not all the properties have been listed, but could be
tag("Toyota Motor Corporation", "cars", ["Corolla", "Prius", "Hilux", "..."])