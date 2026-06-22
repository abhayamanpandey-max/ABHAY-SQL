SELECT * FROM yt_pipeline_gold.vw_global_youtube_master;


SELECT title, channel_title, view_count 
FROM cleansed_statistics
WHERE view_count IS NOT NULL
ORDER BY view_count DESC
LIMIT 10;


WITH deduplicated_videos AS (
    SELECT 
        video_id,
        title,
        channel_title,
        category_id,
        view_count,
        like_count,
        ROW_NUMBER() OVER (
            PARTITION BY video_id 
            ORDER BY view_count DESC
        ) as row_num
    FROM cleansed_statistics
    WHERE view_count IS NOT NULL
)
SELECT 
    v.title AS video_title,
    v.channel_title,
    c.category_name,
    v.view_count AS final_views,
    v.like_count AS final_likes
FROM deduplicated_videos v
INNER JOIN category_reference c 
    ON CAST(v.category_id AS VARCHAR) = CAST(c.category_id AS VARCHAR)
WHERE v.row_num = 1
ORDER BY v.view_count DESC
LIMIT 10;


DROP VIEW IF EXISTS vw_global_youtube_master;



WITH deduplicated_videos AS (
    SELECT 
        video_id,
        title,
        channel_title,
        category_id,
        view_count,
        like_count,
        ROW_NUMBER() OVER (
            PARTITION BY video_id 
            ORDER BY view_count DESC
        ) as row_num
    FROM cleansed_statistics
    WHERE view_count IS NOT NULL
)
SELECT 
    v.title AS video_title,
    v.channel_title,
    c.category_name,
    v.view_count AS final_views,
    v.like_count AS final_likes
FROM deduplicated_videos v
INNER JOIN cleansed_category_reference c 
    ON CAST(v.category_id AS INT) = c.category_id
WHERE v.row_num = 1
ORDER BY v.view_count DESC
LIMIT 10



CREATE EXTERNAL TABLE yt_pipeline_gold.youtube_category_reference (
    category_id int,
    category_name string
)
STORED AS PARQUET
LOCATION 's3://abhayytdatabuket/youtube/cleansed_category_reference/';


CREATE EXTERNAL TABLE yt_pipeline_gold.global_youtube_analytics (
    video_id string,
    title string,
    channel_title string,
    category_id string,
    published_at string,
    view_count bigint,
    like_count bigint,
    comment_count bigint
)
STORED AS PARQUET
LOCATION 's3://abhayytdatabuket/youtube/cleansed_statistics/';


SELECT video_id, title, view_count 
FROM yt_pipeline_gold.global_youtube_analytics 
LIMIT 10;


CREATE OR REPLACE VIEW yt_pipeline_gold.vw_global_youtube_master AS
SELECT 
    v.video_id,
    v.title,
    v.channel_title,
    v.published_at,
    v.view_count,
    v.like_count,
    v.comment_count,
    v.category_id,
    COALESCE(c.category_name, 'Unknown / Other') AS category_name
FROM 
    yt_pipeline_gold.global_youtube_analytics v
LEFT JOIN 
    yt_pipeline_gold.youtube_category_reference c
    ON v.category_id = CAST(c.category_id AS VARCHAR);




SELECT 
    category_name,
    COUNT(DISTINCT video_id) AS total_videos,
    SUM(view_count) AS total_views,
    -- Calculates how many likes a category gets per 100 views
    ROUND((CAST(SUM(like_count) AS DOUBLE) / SUM(view_count)) * 100, 2) AS likes_per_100_views,
    -- Calculates how many comments a category gets per 100 views
    ROUND((CAST(SUM(comment_count) AS DOUBLE) / SUM(view_count)) * 100, 2) AS comments_per_100_views
FROM 
    yt_pipeline_gold.vw_global_youtube_master
WHERE 
    view_count > 0
GROUP BY 
    category_name
ORDER BY 
    likes_per_100_views DESC;


SELECT 
    category_name,
    COUNT(DISTINCT video_id) AS total_videos,
    SUM(view_count) AS total_views,
    -- Calculates how many likes a category gets per 100 views
    ROUND((CAST(SUM(like_count) AS DOUBLE) / SUM(view_count)) * 100, 2) AS likes_per_100_views,
    -- Calculates how many comments a category gets per 100 views
    ROUND((CAST(SUM(comment_count) AS DOUBLE) / SUM(view_count)) * 100, 2) AS comments_per_100_views
FROM 
    yt_pipeline_gold.vw_global_youtube_master
WHERE 
    view_count > 0
GROUP BY 
    category_name
ORDER BY 
    likes_per_100_views DESC
    
            


