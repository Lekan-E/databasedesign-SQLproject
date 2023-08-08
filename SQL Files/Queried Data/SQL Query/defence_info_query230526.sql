/* USE Players*/
USE Players;

SELECT club_shirt, season, tackles, CONCAT(ROUND((tackles_won/tackles)*100,1),'%') as tackles_won,
ball_recoveries, interception
FROM defence;

/*2022-2023*/

SELECT club_shirt, season, tackles, CONCAT(ROUND((tackles_won/tackles)*100,1),'%') as tackles_won,
ball_recoveries, interception
FROM defence
WHERE season = '2022-2023';

/*2021-2022*/

SELECT club_shirt, season, tackles, CONCAT(ROUND((tackles_won/tackles)*100,1),'%') as tackles_won,
ball_recoveries, interception
FROM defence
WHERE season = '2021-2022';

select * from defence;

/*Difference between seasons - defence*/
CREATE OR REPLACE VIEW defence_season_comparison AS
SELECT fi.last_name, (d2.tackles-d1.tackles) as difference_tackles, 
CONCAT(ROUND(((d2.tackles_won/d2.tackles)-(d1.tackles_won/d1.tackles))*100,1),'%') as difference_tackles_won,
(d2.ball_recoveries-d1.ball_recoveries) as difference_ball_recoveries, 
(d2.interception-d1.interception) as difference_interception
FROM defence d1
JOIN defence d2 ON d2.club_shirt = d1.club_shirt
JOIN football_info fi ON fi.club_shirt = d1.CLUB_SHIRT
WHERE d1.season = '2021-2022' AND d2.season = '2022-2023'
GROUP BY d1.club_shirt;

