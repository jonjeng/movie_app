/*
Find out who is the actor with the highest “longevity.” Print the name of the actor/actress
	who has been playing in movies for the longest period of time (i.e. the time interval 
		between their first movie and their last movie is the greatest.

*/

SELECT "Longevity"."FirstName", "Longevity"."LastName"
FROM (
    SELECT JJENG."Actor"."FirstName", JJENG."Actor"."LastName", (MAX(JJENG."Movie"."Release_Year") - MIN(JJENG."Movie"."Release_Year")) as "Years"
    FROM JJENG."Movie", JJENG."Actor_Cast", JJENG."Actor"
    WHERE (JJENG."Movie"."Serial_Number" = JJENG."Actor_Cast"."Movie_ID") AND (JJENG."Actor_Cast"."Actor_ID" = JJENG."Actor"."PID")
    GROUP BY JJENG."Actor"."FirstName", JJENG."Actor"."LastName" ) "Longevity"
WHERE "Longevity"."Years" >= ALL (
  SELECT "Longevity"."Years"
  FROM "Longevity" );
  
  
/*
FirstName   LastName
---------   ---------
Morgan      Freeman
Brad        Pitt
*/