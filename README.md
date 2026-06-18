# Spotify Data Analysis Using SQL

## Project Overview

This project focuses on analyzing Spotify music data using SQL (PostgreSQL). The dataset contains information about artists, tracks, albums, audio features, engagement metrics, streaming statistics, and platform usage.

The objective of this project is to perform Exploratory Data Analysis (EDA) and answer business-oriented questions using SQL concepts such as:

* Data Cleaning
* Aggregations
* Filtering
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* Conditional Aggregation

---

## Dataset Information

The dataset contains the following key attributes:

| Column           | Description                          |
| ---------------- | ------------------------------------ |
| artist           | Artist name                          |
| track            | Track name                           |
| album            | Album name                           |
| album_type       | Album category (Album, Single, etc.) |
| danceability     | Danceability score                   |
| energy           | Energy score                         |
| loudness         | Loudness level                       |
| speechiness      | Speechiness score                    |
| acousticness     | Acousticness score                   |
| instrumentalness | Instrumentalness score               |
| liveness         | Liveness score                       |
| valence          | Musical positivity score             |
| tempo            | Tempo of the track                   |
| duration_min     | Duration in minutes                  |
| channel          | Streaming channel                    |
| views            | Number of views                      |
| likes            | Number of likes                      |
| comments         | Number of comments                   |
| licensed         | Licensed track indicator             |
| official_video   | Official video indicator             |
| stream           | Total stream count                   |
| most_played_on   | Platform where track is most played  |

---

## Data Cleaning

### Removed Invalid Records

Tracks having zero duration were identified and removed:

```sql
DELETE FROM spotify
WHERE duration_min = 0;
```

---

# Exploratory Data Analysis (EDA)

### Questions Explored

1. Total number of records in the dataset.
2. Number of unique artists.
3. Number of unique tracks.
4. Number of unique albums.
5. Available album types.
6. Average track duration.
7. Maximum track duration.
8. Minimum track duration.
9. Unique channels.
10. Platforms available in the `most_played_on` column.

---

# Business Questions & SQL Approaches

## 1. What are the most popular tracks by stream count?

### Approach

Sort tracks by stream count in descending order to identify the most streamed songs.

### SQL Concepts Used

* ORDER BY
* Sorting

---

## 2. Which artists have the highest average popularity?

### Approach

Create an engagement metric using:

```text
Views + Likes + Comments + Streams
```

Then calculate the average engagement for each artist.

### SQL Concepts Used

* GROUP BY
* Aggregate Functions

---

## 3. Retrieve tracks with more than 1 Billion streams.

### Approach

Filter tracks where stream count exceeds one billion.

### SQL Concepts Used

* WHERE Clause
* Filtering

---

## 4. List all albums with their respective artists.

### Approach

Display unique album-artist combinations.

### SQL Concepts Used

* DISTINCT

---

## 5. Calculate total comments for licensed tracks.

### Approach

Sum all comments where licensed is TRUE.

### SQL Concepts Used

* SUM()
* Filtering

---

## 6. Find all tracks belonging to the album type "Single".

### Approach

Filter records based on album type.

### SQL Concepts Used

* WHERE Clause

---

## 7. Count total tracks by each artist.

### Approach

Group records by artist and count tracks.

### SQL Concepts Used

* GROUP BY
* COUNT()

---

## 8. Calculate average danceability of tracks in each album.

### Approach

Compute average danceability grouped by album.

### SQL Concepts Used

* AVG()
* GROUP BY

---

## 9. Find the Top 5 tracks with highest energy.

### Approach

Rank tracks based on energy values and return the top five.

### SQL Concepts Used

* Aggregate Functions
* ORDER BY
* LIMIT

---

## 10. List tracks with views and likes where official_video = TRUE.

### Approach

Aggregate views and likes for tracks having official videos.

### SQL Concepts Used

* SUM()
* GROUP BY
* Filtering

---

## 11. Calculate total views for each album.

### Approach

Sum views of all tracks belonging to the same album.

### SQL Concepts Used

* GROUP BY
* SUM()

---

## 12. Find Top 3 most-viewed tracks for each artist.

### Approach

Use a window function to rank tracks within each artist based on views.

### SQL Concepts Used

* Window Functions
* DENSE_RANK()
* PARTITION BY

---

## 13. Find tracks with liveness score above average.

### Approach

Calculate overall average liveness and compare each track against it.

### SQL Concepts Used

* Subqueries
* AVG()

---

## 14. Calculate the difference between highest and lowest energy tracks within each album.

### Approach

Use a Common Table Expression (CTE) to find maximum and minimum energy values for each album, then compute the difference.

### SQL Concepts Used

* CTE (WITH Clause)
* MAX()
* MIN()

---

## 15. Find tracks with Energy-to-Liveness ratio greater than 1.2.

### Approach

Calculate:

```text
Energy / Liveness
```

and filter tracks where the ratio exceeds 1.2.

### SQL Concepts Used

* Derived Columns
* Subqueries

---

## 16. Find tracks streamed more on Spotify than YouTube.

### Approach

Use conditional aggregation to separately calculate Spotify and YouTube streams for each track and compare them.

### SQL Concepts Used

* CASE WHEN
* COALESCE()
* Conditional Aggregation
* GROUP BY

---

# SQL Skills Demonstrated

* Data Cleaning
* Data Exploration
* Aggregate Functions
* Filtering
* Sorting
* Grouping
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* Conditional Aggregation
* Business Problem Solving

---

# Project Outcomes

This project demonstrates how SQL can be used to:

* Analyze music streaming data.
* Measure track and artist popularity.
* Compare platform performance.
* Discover listening trends.
* Extract meaningful business insights from large datasets.

---

## Technologies Used

* PostgreSQL
* SQL
* MS Excel
* GitHub

---

### Author

**Rahul Ghoshal**

M.Sc. Data Science

Aspiring Data Analyst | SQL | Power BI | Excel | Python

