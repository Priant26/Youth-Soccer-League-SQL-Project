-- Task 2 – Create database by Priant Singh
DROP DATABASE IF EXISTS soccer_league_ps;
CREATE DATABASE soccer_league_ps;
USE soccer_league_ps;
SHOW DATABASES;



-- Task 3 – Create tables by Priant Singh

SHOW TABLES;

CREATE TABLE CLUB_PS (
  CLUB_ID_PS               INT           NOT NULL,
  CLUB_NAME_PS             VARCHAR(50)   NOT NULL,
  CLUB_CONTACT_EMAIL_PS    VARCHAR(50),
  CLUB_CONTACT_PHONE_PS    CHAR(11),
  ABBREVIATION_PS          CHAR(5),
  PRIMARY KEY (CLUB_ID_PS)
);

CREATE TABLE SEASON_PS (
  SEASON_ID_PS             INT           NOT NULL,
  SEASON_NAME_PS           VARCHAR(10)   NOT NULL,
  YEAR_PS                  INT           NOT NULL,
  REG_START_DATE_PS        DATE,
  REG_END_DATE_PS          DATE,
  SEASON_START_DATE_PS     DATE,
  SEASON_END_DATE_PS       DATE,
  PRIMARY KEY (SEASON_ID_PS)
);

CREATE TABLE DIVISION_PS (
  DIVISION_ID_PS           INT           NOT NULL,
  SEASON_ID_PS             INT           NOT NULL,
  AGE_GROUP_PS             VARCHAR(4),
  PLAYER_SEX_PS            ENUM('M','F'),
  RANK_PS                  TINYINT,
  DIV_CONTACT_EMAIL_PS     VARCHAR(50),
  DIVISION_CONTACT_PHONE_PS CHAR(11),
  PRIMARY KEY (DIVISION_ID_PS),
  CONSTRAINT FK_DIVISION_PS_SEASON_PS
    FOREIGN KEY (SEASON_ID_PS)
    REFERENCES SEASON_PS(SEASON_ID_PS)
);

CREATE TABLE TEAM_PS (
  TEAM_ID_PS               INT           NOT NULL,
  CLUB_ID_PS               INT           NOT NULL,
  DIVISION_ID_PS           INT           NOT NULL,
  BIRTH_YEAR_PS            SMALLINT,
  PLAYER_SEX_PS            ENUM('M','F'),
  TEAM_NAME_PS             VARCHAR(20),
  TEAM_CONTACT_EMAIL_PS    VARCHAR(50),
  TEAM_CONTACT_PHONE_PS    CHAR(11),
  COACH_ID_PS              INT,
  PRIMARY KEY (TEAM_ID_PS),
  CONSTRAINT FK_TEAM_PS_CLUB_PS
    FOREIGN KEY (CLUB_ID_PS)
    REFERENCES CLUB_PS(CLUB_ID_PS),
  CONSTRAINT FK_TEAM_PS_DIVISION_PS
    FOREIGN KEY (DIVISION_ID_PS)
    REFERENCES DIVISION_PS(DIVISION_ID_PS)
);

CREATE TABLE REGISTRATION_PS (
  REGISTRATION_ID_PS       INT           NOT NULL,
  TEAM_ID_PS               INT           NOT NULL,
  DIVISION_ID_PS           INT           NOT NULL,
  REG_DATE_PS              DATE,
  PRIMARY KEY (REGISTRATION_ID_PS),
  CONSTRAINT FK_REG_PS_TEAM_PS
    FOREIGN KEY (TEAM_ID_PS)
    REFERENCES TEAM_PS(TEAM_ID_PS),
  CONSTRAINT FK_REG_PS_DIVISION_PS
    FOREIGN KEY (DIVISION_ID_PS)
    REFERENCES DIVISION_PS(DIVISION_ID_PS)
);

CREATE TABLE GAME_PS (
  GAME_ID_PS               INT           NOT NULL,
  DIVISION_ID_PS           INT           NOT NULL,
  GAME_DATE_PS             DATE          NOT NULL,
  GAME_TIME_PS             TIME          NOT NULL,
  GAME_ZIPCODE_PS          CHAR(5)       NOT NULL,
  PRIMARY KEY (GAME_ID_PS),
  CONSTRAINT FK_GAME_PS_DIVISION_PS
    FOREIGN KEY (DIVISION_ID_PS)
    REFERENCES DIVISION_PS(DIVISION_ID_PS)
);

CREATE TABLE PLAYER_PS (
  PLAYER_ID_PS    INT           NOT NULL,
  FIRST_NAME_PS   VARCHAR(30)   NOT NULL,
  LAST_NAME_PS    VARCHAR(30)   NOT NULL,
  TEAM_ID_PS      INT           NOT NULL,
  PRIMARY KEY (PLAYER_ID_PS),
  CONSTRAINT FK_PLAYER_PS_TEAM_PS
    FOREIGN KEY (TEAM_ID_PS)
    REFERENCES TEAM_PS(TEAM_ID_PS)
);

CREATE TABLE COACH_PS (
  COACH_ID_PS     INT           NOT NULL,
  FIRST_NAME_PS   VARCHAR(30)   NOT NULL,
  LAST_NAME_PS    VARCHAR(30)   NOT NULL,
  PRIMARY KEY (COACH_ID_PS)
);

SHOW TABLES;
DESCRIBE GAME_PS;
DESCRIBE PLAYER_PS;
DESCRIBE COACH_PS;



-- Task 4 – Add data by Priant Singh

-- 1) Clubs
INSERT INTO CLUB_PS
  (CLUB_ID_PS, CLUB_NAME_PS, CLUB_CONTACT_EMAIL_PS, CLUB_CONTACT_PHONE_PS, ABBREVIATION_PS)
VALUES
  (1, 'North Stars', 'north@club.com', '5710000001', 'NS'),
  (2, 'South Stars', 'south@club.com', '5710000002', 'SS');

-- 2) Season
INSERT INTO SEASON_PS
  (SEASON_ID_PS, SEASON_NAME_PS, YEAR_PS,
   REG_START_DATE_PS, REG_END_DATE_PS,
   SEASON_START_DATE_PS, SEASON_END_DATE_PS)
VALUES
  (1, 'Summer', 2025,
   '2025-04-01', '2025-05-15',
   '2025-06-01', '2025-08-01');

-- 3) Divisions
INSERT INTO DIVISION_PS
  (DIVISION_ID_PS, SEASON_ID_PS, AGE_GROUP_PS, PLAYER_SEX_PS, RANK_PS,
   DIV_CONTACT_EMAIL_PS, DIVISION_CONTACT_PHONE_PS)
VALUES
  (10, 1, 'U12', 'M', 1, 'u12m@league.com', '5711111111'),
  (20, 1, 'U14', 'F', 1, 'u14f@league.com', '5712222222');

-- 4) Teams
INSERT INTO TEAM_PS
  (TEAM_ID_PS, CLUB_ID_PS, DIVISION_ID_PS,
   BIRTH_YEAR_PS, PLAYER_SEX_PS, TEAM_NAME_PS,
   TEAM_CONTACT_EMAIL_PS, TEAM_CONTACT_PHONE_PS, COACH_ID_PS)
VALUES
  (101, 1, 10, 2013, 'M', 'Lions',   'lions@club.com',   '7031111111', 301),
  (102, 1, 10, 2013, 'M', 'Tigers',  'tigers@club.com',  '7032222222', 301),
  (103, 1, 10, 2013, 'M', 'Bears',   'bears@club.com',   '7033333333', 301),
  (201, 2, 20, 2011, 'F', 'Eagles',  'eagles@club.com',  '7034444444', 302),
  (202, 2, 20, 2011, 'F', 'Hawks',   'hawks@club.com',   '7035555555', 302),
  (203, 2, 20, 2011, 'F', 'Falcons', 'falcons@club.com', '7036666666', 302);

-- 5) Coaches
INSERT INTO COACH_PS
  (COACH_ID_PS, FIRST_NAME_PS, LAST_NAME_PS)
VALUES
  (301, 'Alice', 'Smith'),
  (302, 'Bob',   'Jones');

-- 6) Players
INSERT INTO PLAYER_PS
  (PLAYER_ID_PS, FIRST_NAME_PS, LAST_NAME_PS, TEAM_ID_PS)
VALUES
  (401, 'Carlos',  'Diaz',   101),
  (402, 'Dana',    'Wu',     101),
  (403, 'Ethan',   'Lee',    101),
  (404, 'Fiona',   'Ng',     102),
  (405, 'Gabe',    'O’Neil', 102),
  (406, 'Hana',    'Patel',  103),
  (407, 'Ivan',    'Qin',    201),
  (408, 'Jade',    'Reyes',  201),
  (409, 'Kira',    'Shah',   202),
  (410, 'Liam',    'Torres', 202),
  (411, 'Maya',    'Upton',  203);

-- 7) Games
INSERT INTO GAME_PS
  (GAME_ID_PS, DIVISION_ID_PS, GAME_DATE_PS, GAME_TIME_PS, GAME_ZIPCODE_PS)
VALUES
  (90000001, 10, '2025-06-01', '09:00:00', '22030'),
  (90000002, 10, '2025-06-02', '11:00:00', '22030'),
  (90000003, 10, '2025-06-03', '13:00:00', '22030'),
  (90000004, 20, '2025-06-01', '10:00:00', '22015'),
  (90000005, 20, '2025-06-02', '12:00:00', '22015');

-- Verify data
SELECT * FROM CLUB_PS;
SELECT * FROM SEASON_PS;
SELECT * FROM DIVISION_PS;
SELECT * FROM TEAM_PS;
SELECT * FROM COACH_PS;
SELECT * FROM PLAYER_PS;
SELECT * FROM GAME_PS ORDER BY GAME_ID_PS;



-- Task 5 – Query the data by Priant Singh

-- 5.1 Games per ZIP code
SELECT
  GAME_ZIPCODE_PS,
  COUNT(*) AS games_count
FROM GAME_PS
GROUP BY GAME_ZIPCODE_PS
ORDER BY GAME_ZIPCODE_PS;

-- 5.2 Players per club
SELECT
  c.CLUB_NAME_PS,
  COUNT(p.PLAYER_ID_PS) AS total_players
FROM CLUB_PS c
JOIN TEAM_PS   t ON t.CLUB_ID_PS   = c.CLUB_ID_PS
JOIN PLAYER_PS p ON p.TEAM_ID_PS    = t.TEAM_ID_PS
GROUP BY c.CLUB_NAME_PS
ORDER BY c.CLUB_NAME_PS;

-- 5.3 Players per division (current season)
SELECT
  d.AGE_GROUP_PS AS division,
  COUNT(p.PLAYER_ID_PS) AS total_players
FROM DIVISION_PS d
JOIN TEAM_PS   t ON t.DIVISION_ID_PS = d.DIVISION_ID_PS
JOIN PLAYER_PS p ON p.TEAM_ID_PS     = t.TEAM_ID_PS
WHERE d.SEASON_ID_PS = 1   -- Summer 2025
GROUP BY d.AGE_GROUP_PS;

-- 5.4 Teams per coach
SELECT
  CONCAT(co.FIRST_NAME_PS, ' ', co.LAST_NAME_PS) AS coach_name,
  COUNT(t.TEAM_ID_PS) AS teams_count
FROM COACH_PS co
JOIN TEAM_PS  t  ON t.COACH_ID_PS = co.COACH_ID_PS
GROUP BY coach_name
ORDER BY coach_name;