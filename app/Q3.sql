/*
Print all information of the movies that have both 
	a) the highest number of ratings; and 
	b) the lowest average.
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

SELECT "inner"."MID", "inner"."Title", "inner"."Release_Year",
	"inner"."Num_Ratings", "Overall_Rating"("inner"."MID") as "Rating"
FROM (
  SELECT JJENG."Movie"."Serial_Number" as "MID", JJENG."Movie"."Title", JJENG."Movie"."Release_Year",
    "NumRatings"(JJENG."Movie"."Serial_Number") as "Num_Ratings", "Overall_Rating"(JJENG."Movie"."Serial_Number") as "Rating"
  FROM JJENG."Movie"
  WHERE "NumRatings"(JJENG."Movie"."Serial_Number") >= ALL (
    SELECT "NumRatings"(JJENG."Movie"."Serial_Number")
    FROM JJENG."Movie" ) ) "inner"
WHERE "inner"."Rating" <= ALL ( 
  SELECT "Overall_Rating"(JJENG."Movie"."Serial_Number")
  FROM JJENG."Movie"
  WHERE "NumRatings"(JJENG."Movie"."Serial_Number") >= ALL (
    SELECT "NumRatings"(JJENG."Movie"."Serial_Number")
    FROM JJENG."Movie" ) );

/*
MID   Title                             Year    NumRatings    Rating
----  -------------------------------   -----  ------------   --------
M4    The Devil's Advocate              1997    2             7.5
*/