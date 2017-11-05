/*
Find out who are the “no flop” actors: we will define a “no flop” actor as one who has 
	played only in movies which have a rating greater than or equal to 8. 
	Split this problem into the following steps.
  a. Create a view called high ratings which contains the distinct names of all 
			actors who have played in movies with a rating greater than or equal to 8. 
			Similarly, create a view called low ratings which contains the distinct names 
			of all actors who have played in movies with a rating less than 8. 
			Print 
				a) the number of rows in the view high ratings and 
				b) the number of rows in the view low ratings
*/

CREATE OR REPLACE FUNCTION "Overall_Rating" (MovID IN VARCHAR2)
  RETURN FLOAT
  IS Rated FLOAT;
  BEGIN   
    SELECT AVG(JJENG."Review"."NumStars") 
    INTO Rated
    FROM JJENG."Review", JJENG."Movie"
    WHERE (JJENG."Review"."Movie_Subject" = JJENG."Movie"."Serial_Number") AND (JJENG."Movie"."Serial_Number" = MovID);
    RETURN Rated;
  END;
/

CREATE VIEW "High_Ratings" AS
SELECT DISTINCT JJENG."Actor"."FirstName", JJENG."Actor"."LastName", JJENG."Actor"."PID"
FROM JJENG."Movie", JJENG."Actor_Cast", JJENG."Actor"
WHERE ("Overall_Rating"(JJENG."Movie"."Serial_Number") >= 8) AND (JJENG."Actor_Cast"."Movie_ID" = JJENG."Movie"."Serial_Number") 
  AND (JJENG."Actor_Cast"."Actor_ID" = JJENG."Actor"."PID");

CREATE VIEW "Low_Ratings" AS
SELECT DISTINCT JJENG."Actor"."FirstName", JJENG."Actor"."LastName", JJENG."Actor"."PID"
FROM JJENG."Movie", JJENG."Actor_Cast", JJENG."Actor"
WHERE ("Overall_Rating"(JJENG."Movie"."Serial_Number") < 8) AND (JJENG."Actor_Cast"."Movie_ID" = JJENG."Movie"."Serial_Number") 
  AND (JJENG."Actor_Cast"."Actor_ID" = JJENG."Actor"."PID");

SELECT COUNT(*) AS "Num_Rows_in_High_Ratings"
FROM "High_Ratings";

SELECT COUNT(*) "Num_Rows_in_Low_Ratings"
FROM "Low_Ratings";

/*
b. Use the above views to print the number of “no flop” actors in the database.
*/

CREATE VIEW "No_Flop_Actors" AS
SELECT "High_Ratings"."FirstName", "High_Ratings"."LastName", "High_Ratings"."PID"
FROM "High_Ratings"
WHERE "High_Ratings"."PID" NOT IN (SELECT "Low_Ratings"."PID" FROM "Low_Ratings");

SELECT COUNT(*) as "Num_No_Flop_Actors"
FROM "No_Flop_Actors";

/*
c. Finally, use the above view to print the names of these “no flop” actors, 
			along with the number M of movies they have played in, sorted by descending M 
			and then by ascending name, and print only the top 10.
*/




SELECT DISTINCT "NoFlopActors"."FirstName", "NoFlopActors"."LastName", "inner2"."M" as "M"
FROM JJENG."Actor_Cast", 
  (
  SELECT *
  FROM "No_Flop_Actors" ) "NoFlopActors", 
  (
  SELECT "innerT"."Actor_ID", COUNT("innerT"."Actor_ID") AS "M"
  FROM (
    SELECT DISTINCT JJENG."Actor_Cast"."Movie_ID", JJENG."Actor_Cast"."Actor_ID"
    FROM  JJENG."Actor_Cast" ) "innerT"
  GROUP BY "innerT"."Actor_ID" ) "inner2"
WHERE (JJENG."Actor_Cast"."Actor_ID" = "NoFlopActors"."PID") AND ("NoFlopActors"."PID" = "inner2"."Actor_ID") AND ROWNUM <= 10
ORDER BY "M" DESC, "NoFlopActors"."FirstName" ASC, "NoFlopActors"."LastName" ASC;


/*

Name                              M
--------------------------------  -----------
Angelina Jolie                    3
Scarlett Johanson                 3
Alex Parish                       1
Jennifer Lawrence                 1

*/