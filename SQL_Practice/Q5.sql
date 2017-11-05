SELECT JJENG."Movie"."Title",  COUNT(*) as "CastSize"
FROM JJENG."Movie",  JJENG."Actor_Cast"
WHERE JJENG."Movie"."Serial_Number" = JJENG."Actor_Cast"."Movie_ID"
GROUP BY JJENG."Movie"."Serial_Number",  JJENG."Movie"."Title"
HAVING COUNT(*) >= ALL (
  SELECT COUNT(*)
  FROM JJENG."Actor_Cast"
  GROUP BY JJENG."Actor_Cast"."Movie_ID" );

/*
Find the film(s) with the largest cast. Return the movie title and the size of the cast. 
	By "cast size" we mean the number of distinct actors that played in that movie: 
		if an actor played multiple roles, or if the actor is simply listed more than once 
		in CASTS, we still count her/him only once.

Title               CastSize
------------------  --------
The Polar Express   8

*/