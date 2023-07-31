SELECT * FROM players.expected_values;

ALTER TABLE expected_values
RENAME COLUMN xa TO xassists;

USE players;

SELECT ex.club_shirt, ex.season, st.goals, ex.xg,
ROUND((st.goals-ex.xg),2) as xg_difference, st.assists, ex.xassists,
ROUND((st.assists-ex.xassists),2) as xa_difference
FROM expected_values ex
JOIN standard st ON st.club_shirt = ex.club_shirt AND st.season = ex.season;

/*2022-2023*/
SELECT ex.club_shirt, ex.season, st.goals, ex.xg,
ROUND((st.goals-ex.xg),2) as xg_difference, st.assists, ex.xassists,
ROUND((st.assists-ex.xassists),2) as xa_difference
FROM expected_values ex
JOIN standard st ON st.club_shirt = ex.club_shirt AND st.season = ex.season
WHERE st.season = '2022-2023';

/*2022-2023*/
SELECT ex.club_shirt, ex.season, st.goals, ex.xg,
ROUND((st.goals-ex.xg),2) as xg_difference, st.assists, ex.xassists,
ROUND((st.assists-ex.xassists),2) as xa_difference
FROM expected_values ex
JOIN standard st ON st.club_shirt = ex.club_shirt AND st.season = ex.season
WHERE st.season = '2021-2022';