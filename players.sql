-- BY: Olamilekan Razak Elegbede
-- Yearly Report Database

DROP DATABASE IF EXISTS players;
CREATE DATABASE IF NOT EXISTS players;
USE players;

DROP TABLE IF EXISTS player_info,
					 club_info,
                     season_info,
                     standard_stats,
                     passing_stats,
                     shooting_stats,
                     defence_stats,
                     expected_stats;

CREATE TABLE player_info (
		first_name		VARCHAR(60)				NOT NULL,
        last_name		VARCHAR(60)				NOT NULL,
        date_of_birth	DATE					NOT NULL,
        nationality		VARCHAR(60)				NOT NULL,
        position		VARCHAR(60)				NOT NULL,
        strong_foot		ENUM('Left','Right')	NOT NULL,
        PRIMARY KEY (last_name)
);

CREATE TABLE club_info (
		club_name		VARCHAR(80)				NOT NULL,
        club_code 		VARCHAR(10)				NOT NULL,
        league			VARCHAR(80)				NOT NULL,
        PRIMARY KEY (club_code)
);

CREATE TABLE season_info (
		last_name		VARCHAR(60)				NOT NULL,
        club_code		VARCHAR(30)				NOT NULL,
        shirt_number	INT						NOT NULL,
        club_shirt		VARCHAR(30)				NOT NULL,
        season			VARCHAR(30)				NOT NULL,
		PRIMARY KEY (club_shirt, season)
);

CREATE TABLE standard_stats (
		club_shirt		VARCHAR(30)				NOT NULL,
        season			VARCHAR(30)				NOT NULL,
        minutes_played	INT,						
        matches_played	INT,
        goals			INT,
        assists			INT,
        penalty_goals 	INT,
        PRIMARY KEY (club_shirt, season)
);

CREATE TABLE passing_stats (
		club_shirt			VARCHAR(30)				NOT NULL,
        season				VARCHAR(30)				NOT NULL,
        passes				INT,						
        completed_passes	INT,
        key_passes			INT,
        touches				INT,
        touches_att_3rd		INT,
        PRIMARY KEY (club_shirt, season)
);

CREATE TABLE shooting_stats (
		club_shirt			VARCHAR(30)				NOT NULL,
        season				VARCHAR(30)				NOT NULL,
        shots_taken			INT,						
        shots_on_target		INT,
        shot_per_90			DOUBLE,
        goals_per_shot		DOUBLE,
        takeon				INT,
        successful_takeon 	INT,
        PRIMARY KEY (club_shirt, season)
);

CREATE TABLE defence_stats (
		club_shirt			VARCHAR(30)				NOT NULL,
        season				VARCHAR(30)				NOT NULL,
        yellow				INT,						
        red					INT,
        tackles				INT,
        tackles_won			INT,
        ball_recoveries		INT,
        interceptions		INT,
        PRIMARY KEY (club_shirt, season)
);

CREATE TABLE expected_stats (
		club_shirt		VARCHAR(30)				NOT NULL,
        season			VARCHAR(30)				NOT NULL,
        x_g				DOUBLE,						
        x_a				DOUBLE,
        PRIMARY KEY (club_shirt, season)
);

-- Insert New Table Data
INSERT INTO player_info(first_name,last_name,date_of_birth,nationality,position,strong_foot) VALUES
();

INSERT INTO season_info(last_name,club_code,shirt_number,club_shirt,season) VALUES
();

INSERT INTO club_info(club_name,club_code,league) VALUES
();

INSERT INTO standard_stats(club_shirt,season,minutes_played,matches_played,goals,assists,penalty_goals) VALUES
();

INSERT INTO passing_stats(club_shirt,season,passes,completed_passes,key_passes,touches,touches_attacking_3rd) VALUES
();

INSERT INTO shooting_stats(club_shirt,season,shots_taken,shots_on_target,shot_per_90,goals_per_shot,takeon,successful_takeon) VALUES
();

INSERT INTO defence_stats(club_shirt,season,yellow,red,tackles,tackles_won,ball_recoveries,interceptions) VALUES
();

INSERT INTO expected_stats(club_shirt,season,x_g,x_a) VALUES
();


-- Create Procedure
DROP PROCEDURE IF EXISTS standard_info;

DELIMITER $$
CREATE PROCEDURE p_standard_info(IN p_last_name VARCHAR(255), IN p_season VARCHAR(255))
BEGIN
	SELECT si.last_name, ss.goals, ss.assists, ss.matches_played
    FROM standard_stats ss
    JOIN season_info si ON si.club_shirt = ss.club_shirt AND si.season = ss.season
    WHERE si.last_name = p_last_name AND si.season = p_season;
END $$
DELIMITER ;

-- Insert player 'Last Name' and 'Season'
call players.p_standard_info('Kane', '2021-2022');

-- Temp Table to get players age

