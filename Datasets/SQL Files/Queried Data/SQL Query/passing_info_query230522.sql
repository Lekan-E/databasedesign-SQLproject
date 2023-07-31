/* USE Players*/
USE Players;

SELECT club_shirt, season, attempted_pass AS total_passes, CONCAT(ROUND((completed_passes/attempted_pass)*100,1),'%') as completed_pass,
key_passes, touches, CONCAT(ROUND((attacking_3rd/touches)*100,1),'%') as touches_attack_3rd,
goal_creating_actions AS GCA, shot_creating_action AS SCA
FROM passing;

/*2022-2023*/
/*CREATE TEMPORARY TABLE passing_info_22_23*/
SELECT club_shirt, season, attempted_pass AS total_passes, CONCAT(ROUND((completed_passes/attempted_pass)*100,1),'%') as completed_pass,
key_passes, touches, CONCAT(ROUND((attacking_3rd/touches)*100,1),'%') as touches_attack_3rd,
goal_creating_actions AS GCA, shot_creating_action AS SCA
FROM passing
WHERE season = '2022-2023';

/*2021-2022*/
/*CREATE TEMPORARY TABLE passing_info_21_22*/
SELECT club_shirt, season, attempted_pass AS total_passes, CONCAT(ROUND((completed_passes/attempted_pass)*100,1),'%') as completed_pass,
key_passes, touches, CONCAT(ROUND((attacking_3rd/touches)*100,1),'%') as touches_attack_3rd,
goal_creating_actions AS GCA, shot_creating_action AS SCA
FROM passing
WHERE season = '2021-2022';

/*Difference in seasons - passing */
SELECT p1.club_shirt,
(p2.attempted_pass - p1.attempted_pass) as difference_total_passes,
CONCAT(ROUND(((p2.completed_passes/p2.attempted_pass) - (p1.completed_passes/p1.attempted_pass))*100,1),'%') AS difference_completed_passes, 
(p2.key_passes - p1.key_passes) as difference_key_passes,
(p2.touches - p1.touches) as difference_touches,
CONCAT(ROUND(((p2.attacking_3rd/p2.touches) - (p1.attacking_3rd/p1.touches))*100,1),'%') AS difference_touches_attacking3rd,
(p2.goal_creating_actions - p1.goal_creating_actions) as difference_gca,
(p2.shot_creating_action - p1.shot_creating_action) as difference_sca
FROM passing p1
JOIN passing p2 ON p2.club_shirt = p1.club_shirt
WHERE p1.season = '2021-2022' AND p2.season = '2022-2023'
GROUP BY club_shirt
HAVING club_shirt = 'MUN10';

select * from passing;