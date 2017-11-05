/*
Find actors that played five or more distinct roles in the same movie during the year 2010. 
	Write a query that returns the actors' names, the movie name, and the number of 
		distinct roles that they played in that movie (which will be ≥ 5).'


  SELECT * FROM JJENG."Actor_Cast" WHERE JJENG."Actor_Cast"."Movie_ID" = ANY (
    SELECT JJENG."Movie"."Serial_Number" from JJENG."Movie" WHERE JJENG."Movie"."Release_Year" = 2010 )
*/

SELECT JJENG."Actor"."FirstName", JJENG."Actor"."LastName", JJENG."Movie"."Title", "inner2"."NumRoles"
FROM JJENG."Movie", JJENG."Actor", (
  SELECT "inner"."Actor_ID", "inner"."Movie_ID", COUNT("inner"."Actor_ID") AS "numRoles"
  FROM (
    SELECT * FROM JJENG."Actor_Cast" WHERE JJENG."Actor_Cast"."Movie_ID" = ANY (
      SELECT JJENG."Movie"."Serial_Number" from JJENG."Movie" WHERE JJENG."Movie"."Release_Year" = 2010 ) ) "inner"
  GROUP BY "inner"."Actor_ID", "inner"."Movie_ID"
  HAVING COUNT("inner"."Actor_ID") >= 5 ) "inner2"
WHERE (JJENG."Actor"."PID" = "inner2"."Actor_ID") AND (JJENG."Movie"."Serial_Number" = "inner2"."Movie_ID");


/*
FirstName   LastName    Title                NumRoles
----------  ---------   ------------------   ---------
Tom         Hanks       The Polar Express    6
*/