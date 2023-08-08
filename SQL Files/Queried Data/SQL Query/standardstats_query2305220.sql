/*Standard Info Sheet */
/* 
This sheet provides us with the basic stats for each player according to the information we
need such as the season.

In every case the 'club_shirt' field is a unique identifier for each player and so
it has been used to JOIN various tables.
*/

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

/*Difference between the two seasons
Where we the difference in the stats is:
+ : the player performed BETTER
- : the player performed LESS
in that statistical field

Example:
A 'difference_goals = 13' means the player score 13 MORE goals than previous season. 
*/
CREATE OR REPLACE VIEW standard_season_comparison AS
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

-- Create a rank for goals involvements 
SELECT fi.last_name,
	   st.club_shirt,
	   se.season, 
       se.matches_played, 
       se.minutes_played,
       (st.goals+st.assists) as goal_involvments,
	   RANK() OVER w AS ga_ranking
FROM standard st
JOIN seasons se ON se.club_shirt = st.club_shirt AND se.season = st.season
JOIN football_info fi ON fi.club_shirt = st.CLUB_SHIRT
WHERE se.season = '2022-2023'
WINDOW w AS(order by (st.goals+st.assists) desc);

