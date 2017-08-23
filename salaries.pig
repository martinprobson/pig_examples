salaries = LOAD 'data/salaries.csv' USING PigStorage(',') AS (gender:chararray,age:int,salary:double,zip:chararray);
subset = FOREACH salaries GENERATE gender, age;
DUMP subset;
