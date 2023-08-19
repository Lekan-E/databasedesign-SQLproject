# playersreport-project
The Players Data Collection and Analysis project is a database design and manipulation project focusing on the collection of players' statistical data. Through the utilization of Microsoft Excel and MySQL, data extraction is carried out by running simple-to-advanced queries to compare data across different seasons and ranking players based on their performance.


 # Player Season Comparison Report

 This is a repository for a personal project to compare statistics of my favorite football(soccer) players according to different seasons. <br />
 The data used for this project were all extracted from [FBRef](https://fbref.com/en/). <br />
 A full report - is also included showing the approach to the project. <br />
 
 All analyses and reports were performed by **Olamilekan Razak Elegbede.**


 ##  Introduction

 Over the years, stats/data has become a big part factor in how football is played, fans watch the game, fans pick their best players and how players are being coached. <br />
 The inspiration for this project came after reading a book **The Expected Goals Philosophy by James Tippett** <br />
 My aim for this project is to statistically compare how my favorite players performed in the 2022/2023 season as compared to the 2021/2022 season. I performed an analysis based on playing positions (GK, DF, MID, ATT) from different players in the English Premier League. <br />
 Some data used for analysis were the following: <br/>
 * Expected Goals & Assists
 * Defensive Data i.e Tackles, Ball Recoveries, Interception
 * Attacking Data i.e Shots-per 90, Takeon, Total Shots <br/>

 ## Methodology
 ### Analytical Tools
 The tools used for analysis include:
 * MySQL - Database Management
         - Running Advanced Queries/Calculations
         - Comparison based on position and clubs
 * Microsoft Excel - For inserting data into the database

**NOTE**: Future Improvements include Tableau for Visualisation.

### Project Flowchart

The main procedures to accomplish this project can be summarized in the flow chart below:

![Alt text](https://github.com/Lekan-E/playersreport-project/blob/main/Images/Flowchart.jpg)

## Final Results

Below is a sample SQL query [Figure 1] and the corresponding output [Figure 2] of the comparison made.

![Alt text](https://github.com/Lekan-E/playersreport-project/blob/main/Images/sql_comparisoncode.jpg)

**Figure 1: Showing Multiple Joins and Calculations**

![Alt text](https://github.com/Lekan-E/playersreport-project/blob/main/Images/comparison_output.jpg)
**Figure 2: Output of the Joins**

**xG Chart**
Below is a chart show Goals and Expected Goal Difference
![Alt text](https://github.com/Lekan-E/databasedesign-SQLproject/blob/main/Images/xG%20Chart.jpg)

## Improvements
Future improvements and additions for this project include:
* Tableau radar plots to help visualize the data
* Add rankings based on different statistics using SQL - RANK & DENSE_RANK functions
* Use Python for web scraping of data to improve data integrity
* Create a simple website for fans to choose and compare players based on statistical data

