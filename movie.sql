CREATE TABLE ACTOR(
    ACT_ID INT,
    ACT_NAME VARCHAR(10),
    ACT_GENDER VARCHAR(10),
    PRIMARY KEY(ACT_ID)
    );

CREATE TABLE DIRECTOR(
    DIR_ID INT,
    DIR_NAME VARCHAR(10),
    DIR_PHONE INT,
    PRIMARY KEY(DIR_ID)
    );

CREATE TABLE MOVIES(
    MOV_ID INT,
    MOV_TITLE VARCHAR(10),
    MOV_YEAR VARCHAR(10),
    MOV_LANG VARCHAR(10),
    DIR_ID INT,PRIMARY KEY(MOV_ID),
    FOREIGN KEY(DIR_ID) REFERENCES DIRECTOR(DIR_ID)
    );

CREATE TABLE MOVIE_CAST(
    ACT_ID INT,MOV_ID INT,
    ROLE_PLAYED VARCHAR(10),
    FOREIGN KEY(ACT_ID) REFERENCES ACTOR(ACT_ID),
    FOREIGN KEY(MOV_ID) REFERENCES MOVIES(MOV_ID)
    );

CREATE TABLE RATING(
    MOV_ID INT,REV_STARS FLOAT,
    FOREIGN KEY(MOV_ID) REFERENCES MOVIES(MOV_ID)
    );

INSERT INTO ACTOR VALUES(2,'Reeves','MALE');
INSERT INTO ACTOR VALUES(1,'Ice T','MALE');
INSERT INTO ACTOR VALUES(5,'Rai','FEMALE');
INSERT INTO ACTOR VALUES(3,'Khan','MALE');
INSERT INTO ACTOR VALUES(4,'Pitt','MALE');
SELECT * FROM ACTOR;

INSERT INTO DIRECTOR VALUES(30,'Clint',247382);
INSERT INTO DIRECTOR VALUES(20,'Steven',241829);
INSERT INTO DIRECTOR VALUES(10,'Speed',241342);
INSERT INTO DIRECTOR VALUES(50,'Kevin',241456);
INSERT INTO DIRECTOR VALUES(40,'Downey',241666);
SELECT * FROM DIRECTOR;

INSERT INTO MOVIES VALUES(44,'GUILTY',2020,'HINDI',10);
INSERT INTO MOVIES VALUES(33,'1917',1999,'ENGLISH',10);
INSERT INTO MOVIES VALUES(11,'NOTEBOOK',2018,'HINDI',20); 
INSERT INTO MOVIES VALUES(22,'AVENGERS',2007,'ENGLISH',20);
INSERT INTO MOVIES VALUES(55,'WAR',2018,'HINDI',50);
SELECT * FROM MOVIES;

INSERT INTO MOVIE_CAST VALUES(5,55,'VILLAIN');
INSERT INTO MOVIE_CAST VALUES(1,55,'MAIN LEAD');
INSERT INTO MOVIE_CAST VALUES(5,22,'SISTER');
INSERT INTO MOVIE_CAST VALUES(4,22,'MAIN LEAD');
INSERT INTO MOVIE_CAST VALUES(4,55,'BROTHER');
INSERT INTO MOVIE_CAST VALUES(2,44,'VILLAIN');
SELECT * FROM MOVIE_CAST;

INSERT INTO RATING VALUES(11,4);
INSERT INTO RATING VALUES(55,3.5);
INSERT INTO RATING VALUES(22,2.5);
INSERT INTO RATING VALUES(11,3.5);
INSERT INTO RATING VALUES(11,4);
SELECT * FROM RATING;

SELECT D.DIR_NAME,M.MOV_TITLE FROM DIRECTOR D,MOVIES M WHERE D.DIR_ID=M.DIR_ID AND D.DIR_NAME='Speed';

SELECT M.MOV_TITLE FROM MOVIES M,MOVIE_CAST MC WHERE M.MOV_ID=MC.MOV_ID AND MC.ACT_ID IN(SELECT ACT_ID FROM MOVIE_CAST GROUP BY ACT_ID HAVING COUNT(*)>1) GROUP BY M.MOV_TITLE HAVING COUNT(*)>1;

SELECT ACT_NAME FROM (MOVIES NATURAL JOIN MOVIE_CAST) NATURAL JOIN ACTOR WHERE MOV_YEAR>2015 OR MOV_YEAR<2000;

SELECT M.MOV_TITLE,MAX(R.REV_STARS) AS MAX_RATING FROM MOVIES M,RATING R WHERE M.MOV_ID=R.MOV_ID GROUP BY R.MOV_ID ORDER BY M.MOV_TITLE;

UPDATE RATING SET REV_STARS=5 WHERE MOV_ID IN (SELECT M.MOV_ID FROM MOVIES M,DIRECTOR D WHERE M.DIR_ID=D.DIR_ID AND D.DIR_NAME='Steven');
SELECT * FROM RATING;
