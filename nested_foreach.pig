--
-- Nested FOREACH example.
--
temp = LOAD 'data/NYSE_dividends_A.csv' USING PigStorage(',') AS 
	(exchange:chararray,stock_symbol:chararray,date:chararray,dividends:float);
-- Remove header
nyse = FILTER temp BY exchange == 'NYSE'; 
-- group by stock symbol
grpd = GROUP nyse BY stock_symbol;
-- Nested FOREACH
top3 = FOREACH grpd {
    sorted = ORDER nyse BY dividends DESC;
    top = LIMIT sorted 3;
    GENERATE group, FLATTEN(top);
};
DUMP top3;
