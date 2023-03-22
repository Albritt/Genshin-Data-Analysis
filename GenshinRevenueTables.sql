SELECT * FROM dbo.GenshinRevenueTable;

SELECT * FROM dbo.GenshinCharacterInfoTable;

-- Find which banner has generated the most revenue. Select all records and order by revenue. Since we don't have character data on version 3 and higher characters lets stick to everything before that for these queries.
SELECT DISTINCT
	GRT.version,
	GRT.version_name,
	GRT."5_star_characters",
	GRT.rerun,
	GRT.revenue,
	GRT.banner_days,
	GRT.avg_revenue
FROM dbo.GenshinRevenueTable as GRT
LEFT JOIN dbo.GenshinCharacterInfoTable as GCIT on GRT."5_star_characters" = GCIT.character_name
WHERE GRT.version < 3
AND GCIT.playable = 'Y'
ORDER BY revenue DESC



--Some banners were longer than others. The 1st Ayaka rerun in particular was double the length of an average banner due to COVID delays. Lets order by avg revenue instead
SELECT DISTINCT
	GRT.version,
	GRT.version_name,
	GRT."5_star_characters",
	GRT.rerun,
	GRT.banner_days,
	GRT.avg_revenue
FROM dbo.GenshinRevenueTable as GRT
LEFT JOIN dbo.GenshinCharacterInfoTable as GCIT on GRT."5_star_characters" = GCIT.character_name
WHERE GRT.version < 3
AND GCIT.playable = 'Y'
ORDER BY avg_revenue DESC

--Which characters have had the most successful re-runs in terms of avg revenue?
SELECT DISTINCT
	GRT.version,
	GRT.version_name,
	GRT."5_star_characters",
	GRT.rerun,
	GRT.banner_days,
	GRT.avg_revenue
FROM dbo.GenshinRevenueTable as GRT
LEFT JOIN dbo.GenshinCharacterInfoTable as GCIT on GRT."5_star_characters" = GCIT.character_name
WHERE GRT.rerun >= 1 
AND GRT.version < 3
AND GCIT.playable = 'Y'
ORDER BY avg_revenue DESC

--Unfortunately the characters are sold two per banner and there is no way to determine which character was spent on. We can get a better idea of the most popular character by summing their avg revenue
--and dividing by total number of reruns
SELECT
	"5_star_characters",
	SUM(avg_revenue)/
	(CASE 
		WHEN MAX(rerun) = 0 THEN 1
		ELSE MAX(rerun) + 1 
		END) as total_revenue
	FROM dbo.GenshinRevenueTable as GRT
	LEFT JOIN dbo.GenshinCharacterInfoTable as GCIT on GRT."5_star_characters" = GCIT.character_name
	WHERE GRT.version < 3
	AND GCIT.playable = 'Y'
	GROUP BY GRT."5_star_characters"
	ORDER BY 	
	SUM(avg_revenue)/
	(CASE 
		WHEN MAX(rerun) = 0 THEN 1
		ELSE MAX(rerun) + 1 
		END) DESC;


SELECT 
	"5_star_characters",
	MAX(rerun) as total_reruns
	FROM dbo.GenshinRevenueTable
	GROUP BY "5_star_characters";

--Lets start using more of the data from our stats table to find more insights about the data


--Which model type sells the most (by average)?
SELECT
	GCIT.model,
	SUM(GRT.avg_revenue)/
	(CASE 
		WHEN MAX(GRT.rerun) = 0 THEN 1
		ELSE MAX(GRT.rerun) + 1 
		END) as total_revenue
	FROM dbo.GenshinRevenueTable as GRT
	LEFT JOIN dbo.GenshinCharacterInfoTable as GCIT on GRT."5_star_characters" = GCIT.character_name
	WHERE GCIT.playable = 'Y'
	GROUP BY GCIT.model
	ORDER BY total_revenue DESC


--How is spending trending over the years 
SELECT
	YEAR(start_date) as banner_year,
	SUM(revenue) as revenue_this_year,
	LAG(SUM(revenue)) OVER (ORDER BY(YEAR(start_date))) AS revenue_last_year
	FROM dbo.GenshinRevenueTable
	GROUP BY YEAR(start_date)

--Was version 1 (Mondstadt/Liyue) or version 2 (Inazuma) more successful?







