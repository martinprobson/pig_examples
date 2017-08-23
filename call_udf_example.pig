/* Register piggybank.jar */
REGISTER /usr/local/pig/lib/piggybank.jar;
DEFINE Reverse org.apache.pig.piggybank.evaluation.string.Reverse;
a = LOAD 'data/emps.csv' USING PigStorage(',') AS (emp_no:chararray,emp_name:chararray,dept_id:chararray);
b = FILTER a BY emp_no != 'Empl_No';
c = FOREACH b GENERATE emp_name, Reverse(emp_name);
DUMP c;
