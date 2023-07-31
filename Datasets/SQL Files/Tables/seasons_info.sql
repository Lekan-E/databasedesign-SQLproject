-- Insert season
SELECT* FROM seasons;
INSERT INTO seasons
(
	season,
    matches_played,
    minutes_played,
    club_shirt
)
VALUES(
	'2021-2022',
	34,
    3060,
    'LIV4'
);
-- ARS7 MUN10 TOT10 NEW9 MCI9 BRE17 MCI10 ARS11 MCI17 ARS8 MUN8 ARS34 MCI16 BRI25 WHU41 ARS6 MCI25 LIV4
UPDATE seasons
SET club_shirt = 'NEW9'
WHERE matches_played = 28 AND minutes_played = 1698;
