/* USE Players*/
USE Players;

SELECT club_shirt, 
       season, 
       total_shots, 
       CONCAT(ROUND((shots_on_target/total_shots)*100,1),'%') as shot_on_target, 
       goals_shot, 
       shots_90, 
       attempted_takeon, 
       CONCAT(ROUND((successful_takeon/attempted_takeon)*100,1),'%') as successful_takeon
FROM shooting;

/*2022-2023*/

SELECT club_shirt, 
       season, 
       total_shots, 
       CONCAT(ROUND((shots_on_target/total_shots)*100,1),'%') as shot_on_target, 
       goals_shot, 
       shots_90, 
       attempted_takeon, 
       CONCAT(ROUND((successful_takeon/attempted_takeon)*100,1),'%') as successful_takeon
FROM shooting
WHERE season = '2022-2023';

/*2021-2022*/

SELECT club_shirt, 
       season, 
       total_shots, 
       CONCAT(ROUND((shots_on_target/total_shots)*100,1),'%') as shot_on_target, 
       goals_shot, 
       shots_90, 
       attempted_takeon, 
       CONCAT(ROUND((successful_takeon/attempted_takeon)*100,1),'%') as successful_takeon
FROM shooting
WHERE season = '2021-2022';


/*Difference Between Seasons*/
CREATE OR REPLACE VIEW attacking_season_comparison AS
SELECT 
        fi.last_name, 
        (s2.total_shots - s1.total_shots) as difference_shots,
        CONCAT(ROUND(((s2.shots_on_target/s2.total_shots)-(s1.shots_on_target/s1.total_shots))*100,1),'%') as difference_shot_on_target,
        ROUND((s2.goals_shot - s1.goals_shot),2) as difference_goal_shot,
        ROUND((s2.shots_90 - s1.shots_90),2) as difference_shots_90,
        (s2.attempted_takeon - s1.attempted_takeon) as difference_attempted_takeon,
        CONCAT(ROUND(((s2.successful_takeon/s2.attempted_takeon)-(s1.successful_takeon/s1.attempted_takeon))*100,1),'%') as difference_successful_takeon
FROM shooting s1
JOIN shooting s2 on s2.club_shirt = s1.club_shirt
JOIN football_info fi ON fi.club_shirt = s1.CLUB_SHIRT
WHERE s1.season = '2021-2022' AND s2.season = '2022-2023'
GROUP BY fi.club_shirt;