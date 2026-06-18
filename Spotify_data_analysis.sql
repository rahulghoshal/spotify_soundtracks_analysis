-- Spotify Data Analysis
-- Create table

CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

-- ------------------------------
-- Exploratory Data Analysis
-- ------------------------------

-- Checking the number of rows.
select Count(*) from spotify;

-- Displaying the first 10 rows from the dataset.
select * from spotify;

-- Showing the number of artists in the dataset.
select count(distinct artist) from spotify;

-- Showing the artist names in the dataset.
select distinct artist from spotify
order by artist;

-- Number of tracks in the dataset.
select count(distinct track) from spotify;

-- Number of unique albums in the dataset.
select count(distinct album) from spotify;

-- Showning the album types in the dataset.
select distinct album_type from spotify;

-- Average duration of the tracks.
select round(cast(avg(duration_min) as numeric),2) from spotify;

-- Maximum duration of the tracks.
select max(duration_min) from spotify;

-- Minimum duration of the tracks.
select min(duration_min) from spotify;

-- Showing all the rows where duration_min is 0.
select * from spotify
where duration_min = 0;

-- Deleting the rows where duration_min is 0.
delete from spotify 
where duration_min = 0;

-- Unique channels in the dataset.
select distinct channel from spotify;

-- Chhecking the unique items in most_played_on column.
select distinct most_played_on from spotify;

-- ------------------------------------------
-- Extracting informations from the dataset.
-- ------------------------------------------

-- 1. What are the most popular tracks by stream count?
select distinct track, stream from spotify
order by stream DESC;

-- 2. Which artists have the highest average popularity?
select artist, avg(views + likes + comments + stream) as engagement from spotify
group by artist
order by engagement desc;

-- 3.Retrive the names of all tracks that have more than 1 billion streams.
select track, stream from spotify
where stream > 1000000000
order by stream desc;

-- 4.List all the albums along with their respective  artist.
select distinct album, artist from spotify
order by album;

-- 5.Get the total number of comments for tracks where licensed = True.
select sum(comments) as total_comments from spotify
where licensed = 'true';

-- 6.Find all tracks that belong to the album type single.
select track from spotify
where album_type = 'single';

-- 7.Count the total number of tracks by each artist.
select artist,count(track) as total_tracks from spotify
group by artist
order by total_tracks desc;

-- 8.Calculate the average danceability of tracks in each album.
select album, round(cast(avg(danceability) as numeric),4) as avg_danceability from spotify
group by album
order by avg_danceability;

-- 9.Find the top 5 tracks with the highest energy values.
select track, max(energy) from spotify
group by track
order by max(energy) desc
limit 5;

-- 10.List all tracks along with their views and likes where official_video = TRUE.
select distinct track, sum(views), sum(likes) from spotify
where official_video = 'true'
group by track
order by sum(views) desc;


-- 11.For each album, calculate the total views of all associated tracks.
select album, sum(views) from spotify
group by album
order by sum(views) desc;

-- 12.Find the top 3 most-viewed tracks for each artist using window functions.
select * 
from (select artist, track, views, dense_rank() over(partition by artist order by views desc) as d_rnk from spotify
) t1
where t1.d_rnk<4;

-- 13.Write a query to find tracks where the liveness score is above the average.
select distinct track, liveness from spotify
where liveness > (select avg(liveness) from spotify)
order by track;


-- 14.Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
with cte as
(select album,max(energy) as highest_energy,min(energy) as lowest_energy from spotify
group by 1)
select album, highest_energy - lowest_energy as energy_difference from cte
order by energy_difference desc;

-- 15.Find tracks where the energy-to-liveness ratio is greater than 1.2.
select * from
(select track, energy/liveness as energy_to_liveness from spotify) t1
where t1.energy_to_liveness > 1.2;

-- 16.Retrieve the track names that have been streamed on Spotify more than YouTube.
select * from
(select track, 
Coalesce(sum(case when most_played_on = 'Youtube' then stream end),0) as youtube_streamed,
Coalesce(sum(case when most_played_on = 'Spotify' then stream end),0) as spotify_streamed
from spotify
group by track) t1
where
spotify_streamed > youtube_streamed
and youtube_streamed <> 0;


----------------------------------------------
-- END OF PROJECT
----------------------------------------------

