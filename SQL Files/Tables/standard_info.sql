-- Standard info table gives an overview of a players standard statistic information
-- club_shirt: is a unique identifier with the club information and players number.
-- season: is the season we are interested in

SELECT* FROM standard;

-- Insert standard
INSERT INTO standard
(
	club_shirt,
    season,
    goals,
    assists,
    penalty_goals,
    goal_90,
    x_goals
)
VALUES(
	'LIV4',
	'2021-2022',
    3,
    1,
    0,
    0.09,
    2.0
);

-- Set values into table
UPDATE standard
SET penalty_goals = 7
WHERE club_shirt = 'MCI9' AND season = '2022-2023';