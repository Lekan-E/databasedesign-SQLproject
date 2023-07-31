 -- Insert Values into the Tables
SELECT * FROM players.players_info; 
 -- Insert player_info
INSERT INTO players_info
(
	first_name,
    last_name,
    birth_date,
    nationality,
    strong_foot
)
VALUES(
	'Virgil',
    'van Dijk',
    '1991-07-08',
    'Netherlands',
    'Right'
);

UPDATE players_info
SET
	birth_date = '1997-10-31'
WHERE
	last_name = 'Rashford';

DELETE from players_info
WHERE last_name = ' ';


