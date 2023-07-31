-- Create A Database (Player)
CREATE DATABASE IF NOT EXISTS players;

-- Use the Database
USE players;

-- Create tables in the database
-- Table: player_info
CREATE TABLE players_info
(
	first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL PRIMARY KEY,
    birth_date DATE,
    nationality VARCHAR(14),
    strong_foot ENUM('Left','Right')
);

-- Table: club
CREATE TABLE club
(
	club_code VARCHAR(3) NOT NULL PRIMARY KEY,
    club_name VARCHAR(20),
    league VARCHAR(40)
);

-- Table: football_info
CREATE TABLE football_info
(
	club_code VARCHAR(3) NOT NULL,
    shirt_number INT NOT NULL,
    position VARCHAR(14)
);

ALTER TABLE football_info
ADD club_shirt VARCHAR(30) NOT NULL;

-- Table: season
CREATE TABLE seasons
(
	season VARCHAR(14) NOT NULL PRIMARY KEY,
    matches_played INT NOT NULL,
    minutes_played INT NOT NULL
);

-- Drop season primary key
ALTER TABLE seasons
DROP PRIMARY KEY;
-- Insert a new column to the table
ALTER TABLE seasons
ADD club_shirt VARCHAR(30) NOT NULL;

-- Table: standard
CREATE TABLE standard
(
	club_shirt VARCHAR(30) NOT NULL,
    season VARCHAR(14) NOT NULL,
    goals INT,
    assists INT,
    penalty_goals INT,
    goal_90 DECIMAL(4,2),
    x_goals DECIMAL(3,1)
);


-- Table: shooting
CREATE TABLE shooting
(
	club_shirt VARCHAR(30) NOT NULL,
	season VARCHAR(14) NOT NULL,
    total_shots INT,
    shots_on_target INT,
    shots_90 DECIMAL(4,2),
    goals_shot DECIMAL(4,2)
);
ALTER TABLE shooting
ADD attempted_takeon INT NOT NULL,
ADD successful_takeon INT NOT NULL;

-- Table: passing
CREATE TABLE passing
(
	club_shirt VARCHAR(30) NOT NULL,
	season VARCHAR(14) NOT NULL,
    total_passes INT,
    completed_passes INT,
    key_passes INT,
    passes_90 DECIMAL(4,2),
    dribbles INT,
    dribbles_90 DECIMAL(4,2)
);

-- Table: defence
CREATE TABLE defence
(
	club_shirt VARCHAR(30) NOT NULL,
	season VARCHAR(14) NOT NULL,
    yellow INT,
    red INT,
    ball_recoveries INT,
    tackles INT,
    tackles_won INT,
    interception INT
);

DROP TABLE IF EXISTS passing;