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

-- ARS7 MUN10 TOT10 NEW9 MCI9 BRE17 MCI10 ARS11 MCI17 ARS8 MUN8 ARS34 MCI16 BRI25 WHU41 ARS6 MCI25 LIV4

UPDATE standard
SET penalty_goals = 7
WHERE club_shirt = 'MCI9' AND season = '2022-2023';