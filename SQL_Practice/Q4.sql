/*
A decade is any sequence of 10 consecutive years (e.g., 2000, 2001, ..., 2010 is a decade). 
	Find the decade with the largest number of films (output only the 1st yr of the decade).
*/

SELECT "inner"."Decade" as "Decade_Starting_In"
FROM (
  SELECT "inner2"."RYear" as "Decade", "inner2"."movies_per_decade"
  FROM ( 
    SELECT SUM("Years_and_Nums"."numMovies") as "movies_per_decade", "Years"."RYear"
    FROM (
      SELECT DISTINCT JJENG."Movie"."Release_Year" as "RYear"
      FROM JJENG."Movie" ) "Years", (
      SELECT JJENG."Movie"."Release_Year" as "RYear", COUNT(JJENG."Movie"."Serial_Number") as "numMovies"
      FROM JJENG."Movie"
      GROUP BY JJENG."Movie"."Release_Year" ) "Years_and_Nums"
    WHERE "Years_and_Nums"."RYear" >= "Years"."RYear" AND "Years_and_Nums"."RYear" <= ("Years"."RYear" + 10)
    GROUP BY "Years"."RYear" ) "inner2"
  ORDER BY "inner2"."movies_per_decade" DESC ) "inner"
WHERE ROWNUM <= 1

/*

Decade_Starting_In
------------------
2005
*/