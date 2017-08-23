salaries = LOAD 'data/salaries.csv' USING PigStorage(',') AS (gender:chararray,age:int,salary:double,zip:chararray);
genders = GROUP salaries BY gender;
-- Top two salaries by gender (nested FOREACH)
-- 
-- NESTED FOREACH can be used to access 'inner bags' such
-- as those generate by GROUP.
top_by_gender = FOREACH genders {
	sorted = ORDER salaries BY salary DESC;
	top2 = LIMIT sorted 2;
	GENERATE group, FLATTEN(top2);
};
DUMP top_by_gender;
