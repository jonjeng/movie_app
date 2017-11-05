/*
Print the movie year, title and rating of the highest rated movie for each years in the 
	period 2005-present, inclusive, in ascending year order. In case of a tie, print all, 
	sorted in ascending alpha order on the title.
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

SELECT "inner"."Title",  "inner"."Release_Year",  "Overall_Rating"("inner"."Serial_Number") AS "Rating"
FROM (
  SELECT * FROM JJENG."Movie" WHERE JJENG."Movie"."Release_Year" >= 2005 ) "inner"
WHERE "Overall_Rating"("inner"."Serial_Number") >= ALL (
                                                          SELECT "Overall_Rating"(JJENG."Movie"."Serial_Number")
                                                          FROM JJENG."Movie"
                                                          WHERE JJENG."Movie"."Release_Year" = "inner"."Release_Year" )
GROUP BY "inner"."Release_Year", "inner"."Title",  "Overall_Rating"("inner"."Serial_Number")
ORDER BY "inner"."Release_Year" ASC, "inner"."Title" ASC

/*
Title               Year    Rating
------------------- ------- -------
The Da Vinci Code   2005    9
Angels and Daemons  2009    8
The Island          2010    7
The Polar Express   2010    7
Her                 2013    8
Now You See Me      2013    8
Barely Lethal       2014    8
Lucy                2015    9.5
*/