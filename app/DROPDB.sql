ALTER TABLE "Movie" DROP CONSTRAINT "Movie_FK1";
ALTER TABLE "Movie" DROP CONSTRAINT "Movie_FK2";
ALTER TABLE "Production" DROP CONSTRAINT "Production_FK1";
ALTER TABLE "Production" DROP CONSTRAINT "Production_FK2";
ALTER TABLE "Actor_Cast" DROP CONSTRAINT "Actor_Cast_FK1";
ALTER TABLE "Actor_Cast" DROP CONSTRAINT "Actor_Cast_FK2";
ALTER TABLE "Awards" DROP CONSTRAINT "Awards_FK1";
ALTER TABLE "Awards" DROP CONSTRAINT "Awards_FK2";
ALTER TABLE "Awards" DROP CONSTRAINT "Awards_FK3";
ALTER TABLE "Awards" DROP CONSTRAINT "Awards_FK4";
ALTER TABLE "Scenes" DROP CONSTRAINT "Scenes_FK1";
ALTER TABLE "Review" DROP CONSTRAINT "Review_FK1";
ALTER TABLE "Review" DROP CONSTRAINT "Review_FK2";
ALTER TABLE "Review" DROP CONSTRAINT "Review_FK3";
ALTER TABLE "Review" DROP CONSTRAINT "Review_FK4";
ALTER TABLE "Director" DROP CONSTRAINT "Director_FK1";
ALTER TABLE "Director" DROP CONSTRAINT "Director_FK2";
ALTER TABLE "Actor" DROP CONSTRAINT "Actor_FK1";
ALTER TABLE "TV_Cast" DROP CONSTRAINT "TV_Cast_FK1";
ALTER TABLE "TV_Cast" DROP CONSTRAINT "TV_Cast_FK2";
ALTER TABLE "Ep_Cast" DROP CONSTRAINT "Ep_Cast_FK1";
ALTER TABLE "TV_Series" DROP CONSTRAINT "TV_Series_FK1";
ALTER TABLE "Episode" DROP CONSTRAINT "Episode_FK1";
ALTER TABLE "Episode" DROP CONSTRAINT "Episode_PK";
ALTER TABLE "RComment" DROP CONSTRAINT "Comment_FK1";
ALTER TABLE "Content" DROP CONSTRAINT "Content_FK1";
DROP TABLE "IMDB_User";
DROP TABLE "Movie";
DROP TABLE "Production";
DROP TABLE "Actor_Cast";
DROP TABLE "Awards";
DROP TABLE "Scenes";
DROP TABLE "Review";
DROP TABLE "Reviews";
DROP TABLE "Person";
DROP TABLE "Marriage";
DROP TABLE "Guardian_Child";
DROP TABLE "Birth_place";
DROP TABLE "Director";
DROP TABLE "Actor";
DROP TABLE "TV_Cast";
DROP TABLE "Ep_Cast";
DROP TABLE "Photo";
DROP TABLE "TV_Series";
DROP TABLE "Episode";
DROP TABLE "RComment";
DROP TABLE "Comments";
DROP TABLE "Vote";
DROP TABLE "Scene";	
DROP TABLE "Content";