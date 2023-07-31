/*Player Info Sheet */
use players;

SELECT first_name, fi.last_name, TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) as age, 
nationality, position, c.club_name, c.league
FROM players_info pi
JOIN football_info fi ON fi.last_name = pi.last_name
JOIN club c ON c.club_code = fi.club_code
order by c.club_name asc;

