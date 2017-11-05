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

CREATE OR REPLACE FUNCTION "NumRatings" (MovID IN VARCHAR2)
  RETURN NUMBER
  IS NumR NUMBER(5) := 0;
  BEGIN   
    SELECT COUNT(JJENG."Review"."NumStars") INTO NumR
    FROM JJENG."Review", JJENG."Movie"
    WHERE (JJENG."Review"."Movie_Subject" = JJENG."Movie"."Serial_Number") AND (JJENG."Movie"."Serial_Number" = MovID);
    RETURN NumR;
  END;
/

/*
Print all information (mid, title, year, num ratings, rating) for the movie(s) 
	with the highest rating (include all that tie for first place). 
	Order by ascending mid.
*/


SELECT JJENG."Movie"."Serial_Number" AS "MID", JJENG."Movie"."Title",  JJENG."Movie"."Release_Year",  "NumRatings"(JJENG."Movie"."Serial_Number") AS "Num_Ratings", "Overall_Rating"(JJENG."Movie"."Serial_Number") AS "Rating"
FROM JJENG."Movie"
WHERE "Overall_Rating"(JJENG."Movie"."Serial_Number") >= ALL (
  SELECT "Overall_Rating"(JJENG."Movie"."Serial_Number")
  FROM JJENG."Movie"
  );

/*
MID   Title                             Year    NumRatings    Rating
----  -------------------------------   -----  ------------   --------
M3    My big fat greek wedding          2000    2             9.5
M11   Lucy                              2015    2             9.5
*/