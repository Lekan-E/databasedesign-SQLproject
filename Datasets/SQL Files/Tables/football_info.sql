-- Insert football_info
set sql_safe_updates = 0;

SELECT*
FROM football_info;

INSERT INTO football_info
(
	club_code,
    shirt_number,
    position,
    last_name
)
VALUES(
	'LIV',
    4,
    'Defender',
    'van Dijk'
);

UPDATE football_info
SET club_shirt = 'LIV4'
WHERE last_name = 'van Dijk';
