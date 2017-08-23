salaries = LOAD 'data/salaries.csv' USING PigStorage(',') AS (gender:chararray,age:int,salary:double,zip:chararray);
genders = GROUP salaries ALL;
DUMP genders;
DESCRIBE genders;
