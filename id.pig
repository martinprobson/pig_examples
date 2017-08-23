/* id.pig */

A = load 'data/passwd' using PigStorage(':'); -- load the passwd file
B = foreach A generate $0 as id; 	 -- extract the userids
store B into 'id.out';			 -- write the results to a file named id.out
