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

UPDATE seasons
SET club_shirt = 'NEW9'
WHERE matches_played = 28 AND minutes_played = 1698;
