/*
Print the names of all actors who have starred in all movies in which Al pacino has
	starred in (it’s ok to report the name of Al pacino in the result; also, it is ok if 
	these actors have starred in more movies than Al pacino has played in).

*/

SELECT DISTINCT JJENG."Actor"."FirstName", JJENG."Actor"."LastName"
FROM JJENG."Actor"
WHERE JJENG."Actor"."PID" IN (
  SELECT JJENG."Actor_Cast"."Actor_ID"
  FROM JJENG."Actor_Cast"
  WHERE JJENG."Actor_Cast"."Movie_ID" IN (
    SELECT JJENG."Actor_Cast"."Movie_ID"
    FROM JJENG."Actor_Cast"
    WHERE JJENG."Actor_Cast"."Actor_ID" = (
      SELECT JJENG."Actor"."PID"
      FROM JJENG."Actor"
      WHERE (JJENG."Actor"."FirstName" LIKE 'Al') AND (JJENG."Actor"."LastName" LIKE 'Pacino') ) ) );


/*
FirstName     LastName
------------  -------------
Angelina      Jolie
Morgan        Freeman
Brad          Pitt
Scarlett      Johanson
Al            Pacino
Julia         Roberts
*/