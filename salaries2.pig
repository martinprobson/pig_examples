salaries = LOAD 'data/salaries.csv' USING PigStorage(',') AS (gender:chararray,age:int,salary:double,zip:chararray);
genders = GROUP salaries BY gender;
DUMP genders;
DESCRIBE genders;
