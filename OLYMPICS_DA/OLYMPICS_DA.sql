SELECT 
      [ID]
      ,[Name] AS 'Competitor Name' --Renamed column
      , CASE WHEN Sex = 'M' THEN 'MALE' ELSE 'FEMALE' END AS SEX  --better detailing
      ,[Age]
	  ,CASE WHEN [AGE] < 18 THEN 'Under 18'
	   WHEN [AGE] BETWEEN 18 AND 25 THEN '18-25'
	   WHEN [AGE] BETWEEN 25 AND 30 THEN '25-30'
	   WHEN [AGE] > 30 THEN 'Over 30'
	   END AS [Age Grouping]
      ,[Height]
      ,[Weight]
      ,[NOC] AS 'Nation Code' --Explained abbrevation
	  --charindex search specific character
	  --,CHARINDEX(' ',Games)-1 AS 'Example 1' --returns the position
	  --,CHARINDEX(' ', REVERSE(Games))-1 AS 'Example 2'
,LEFT(Games, CHARINDEX(' ', Games)-1) AS 'Year' --split column to isolate year
--,RIGHT(Games, CHARINDEX(' ', REVERSE(Games)) -1) AS 'Season' --Split column to isolate season based on space --data consist both summer and winter season
--,[Games]
       --,[City] not necessary for analysis
      ,[Sport]
      ,[Event]
     ,CASE
	 WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal  --replaced NA with not registered
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) = 'Summer' --where clause to isolate summer season --all the data is based on summmer season