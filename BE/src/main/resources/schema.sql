DROP TABLE IF EXISTS USERS;

CREATE TABLE USERS (ID LONG GENERATED BY DEFAULT AS IDENTITY , USER_ID VARCHAR(20), PASSWORD VARCHAR(20), NAME VARCHAR(20),
BIRTH_DAY VARCHAR(20), GENDER VARCHAR(20), EMAIL VARCHAR(20), MOBILE VARCHAR(20));

