salaries = LOAD 'data/salaries.csv' USING PigStorage(',') AS (gender:chararray,age:int,salary:double,zip:chararray);
group_salaries = GROUP salaries ALL;
salary_count = FOREACH group_salaries GENERATE COUNT(salaries);
DUMP salary_count;
