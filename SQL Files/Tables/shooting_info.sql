SELECT * FROM players.shooting;

-- Insert shooting
INSERT INTO shooting
VALUES(
	'LIV4',
    '2021-2022',
    35,
    14,
    1.03,
    0.09
);

--DELETE and UPDATE use cases
DELETE FROM shooting
WHERE club_shirt = 'MCI10' AND season = '2022-2023';

UPDATE shooting
SET goals_shot = 0.10
WHERE club_shirt = 'LIV4' AND season = '2022-2023';

UPDATE shooting
SET attempted_takeon = 0.10 AND successful_takeon = 22
WHERE club_shirt = 'ARS7' AND season = '2022-2023';

UPDATE shooting
SET attempted_takeon = (
	SELECT attempted_takeon
    FROM takeon
    WHERE shooting.club_shirt = takeon.club_shirt AND shooting.season = takeon.season
);

UPDATE shooting
SET successful_takeon = (
	SELECT successful_takeons
    FROM takeon
    WHERE shooting.club_shirt = takeon.club_shirt AND shooting.season = takeon.season
);


