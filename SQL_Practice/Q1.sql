/* Print names of the cast of the movie “The Davinci Code” in ascending alpha order. */

SELECT JJENG."Actor"."FirstName", JJENG."Actor"."LastName"
FROM JJENG."Actor", JJENG."Movie", JJENG."Actor_Cast"
WHERE (JJENG."Movie"."Title" = 'The Da Vinci Code') AND (JJENG."Movie"."Serial_Number" = JJENG."Actor_Cast"."Movie_ID") AND (JJENG."Actor_Cast"."Actor_ID" = JJENG."Actor"."PID")
ORDER BY JJENG."Actor"."FirstName" ASC;

/*
FirstName     LastName
-----------   ----------
Jessica       Alba
Scarlett      Johanson
Tom           Hanks
*/