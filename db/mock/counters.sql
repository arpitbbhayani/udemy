-- insert 0 to 9
insert into digits values (0), (1), (2), (3), (4), (5), (6), (7), (8), (9);

-- amplify counters to have values from 0 to 999
INSERT into counters
SELECT CONCAT(d1.id, d2.id, d3.id) as n from digits as d1, digits as d2, digits as d3;
