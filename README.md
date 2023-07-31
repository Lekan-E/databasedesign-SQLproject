# playersreport-project
 SQL project involving database creation and management of a players database that has been populated by statistical data across various seasons.

 # Player Season Comparison Report

 This is a repository for a personal project to compare statistics of my favourite football(soccer) players according to different seasons. <br />
 The data used for this project were all extracted from [FBRef](https://fbref.com/en/). <br />
 A full report - is also included showing the approach to the project. <br />
 
 All analysis and report were preformed by **Olamilekan Razak Elegbede.**


 ##  Introduction

 Along the years, stats/data has become a big part factor in how football is played, fans watch the game, fans pick their best players and how players are being coached. <br />
 The inspiration for this project came after reading a book **The Expected Goals Philosophy by James Tippett** <br />
 My aim for this project to statistically compare how my favourite players performed in the 2022/2023 season as compared to the 2021/2022 season. I performed analysis based on playing positions (GK, DF, MID, ATT) from different players in the English Premier League. <br />
 Some data used for analysis were the following: <br/>
 * Expected Goals & Assists
 * Defensive Data i.e Tackles, Ball Recoveries, Interception
 * Attacking Data i.e Shots per 90, Takeon, Total Shots <br/>

 ## Methodology
 ### Analytical Tools
 The tools used for analysis includes:
 * MySQL - Database Management
         - Running Advanced Queries/Calculations
         - Comparison based on position and clubs
 * Microsoft Excel - For inserting data into the database

**NOTE**: Future Improvements includes Tableau for Visuzaliation.

### Project Flowchart

The main procedures to accomplish this project can be summarized in the flow chart below:

![Alt text](https://github.com/Lekan-E/playersreport-project/blob/main/Images/Flowchart.jpg)

## Final Results

Below is a sample SQL query [Figure 1] and corresponding output [Figure 2] of the comparison made.

![Alt text](https://github.com/Lekan-E/playersreport-project/blob/main/Images/sql_comparisoncode.jpg)

**Figure 1: Showing Multiple Joins and Calculations**

![Alt text](https://github.com/Lekan-E/playersreport-project/blob/main/Images/comparison_output.jpg)
**Figure 2: Output of the Joins**

## Improvements
Future improvements and additions for this project includes:
* Tableau to help visualize the output
* Add rankings based on different statistics using SQL - RANK & DENSE_RANK functions
* Use python for web scraping the data to improve data integrity
* Great a simple website for fans to choose and compare players based on statistical data

