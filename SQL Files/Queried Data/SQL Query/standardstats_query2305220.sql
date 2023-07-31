/*Standard Info Sheet */
use players;

SELECT st.club_shirt,se.season, se.matches_played, se.minutes_played, st.goals, st.assists,
(st.goals-st.penalty_goals) as nonpenalty_goals, (st.goals+st.assists) as goal_involvements,
de.yellow, de.red
FROM standard st
JOIN seasons se ON se.club_shirt = st.club_shirt AND se.season = st.season
JOIN defence de ON de.club_shirt = st.club_shirt AND de.season = se.season; 

DROP temporary TABLE IF EXISTS standard_season;

/*2022-23*/
SELECT st.club_shirt,se.season, se.matches_played, se.minutes_played, st.goals, st.assists,
(st.goals-st.penalty_goals) as nonpenalty_goals, (st.goals+st.assists) as goal_involvements,
de.yellow, de.red
FROM standard st
JOIN seasons se ON se.club_shirt = st.club_shirt AND se.season = st.season
JOIN defence de ON de.club_shirt = st.club_shirt AND de.season = se.season 
where se.season = '2022-2023';

/*2021-2022*/
SELECT st.club_shirt,se.season, se.matches_played, se.minutes_played, st.goals, st.assists,
(st.goals-st.penalty_goals) as nonpenalty_goals, (st.goals+st.assists) as goal_involvements,
de.yellow, de.red
FROM standard st
JOIN seasons se ON se.club_shirt = st.club_shirt AND se.season = st.season
JOIN defence de ON de.club_shirt = st.club_shirt AND de.season = se.season 
where se.season = '2021-2022';

/*Difference*/
SELECT ss1.club_shirt
FROM standard_season ss1
JOIN standard_season ss2
group by club_shirt;

SELECT st2.club_shirt, (st2.goals - st1.goals) as difference_goals,
(st2.assists - st1.assists) as difference_assists
FROM standard st1
JOIN standard st2 on st2.club_shirt = st1.club_shirt
group by club_shirt;

SELECT
  fi.last_name,
  se2.matches_played - se1.matches_played AS difference_matches_played,
  se2.minutes_played - se1.minutes_played AS difference_minutes_played,
  st2.goals - st1.goals AS difference_goals,
  st2.assists - st1.assists AS difference_assists,
  (st2.goals - st2.penalty_goals) - (st1.goals - st1.penalty_goals) AS difference_nonpenalty_goals,
  (st2.goals + st2.assists) - (st1.goals + st1.assists) AS difference_goal_involvements,
  de2.yellow - de1.yellow AS difference_yellow,
  de2.red - de1.red AS difference_red
FROM
  standard st1
JOIN
  standard st2 ON st1.club_shirt = st2.club_shirt
JOIN
  seasons se1 ON se1.club_shirt = st1.club_shirt AND se1.season = st1.season
JOIN
  seasons se2 ON se2.club_shirt = st2.club_shirt AND se2.season = st2.season
JOIN
  defence de1 ON de1.club_shirt = st1.club_shirt AND de1.season = se1.season
JOIN
  defence de2 ON de2.club_shirt = st2.club_shirt AND de2.season = se2.season
JOIN
  football_info fi ON fi.club_shirt = st1.CLUB_SHIRT
WHERE st1.season = '2021-2022' AND st2.season = '2022-2023'
GROUP BY fi.club_shirt;



