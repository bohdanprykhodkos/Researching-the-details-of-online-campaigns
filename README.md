# Advertising Performance Analysis (Google Ads & Facebook Ads)
_SQL-based analytical project_

## Project Overview
This project analyzes online advertising performance across Google Ads and Facebook Ads using SQL.  
The dataset contains daily metrics as well as additional campaign- and ad set–level context.  
The goal of the project is to explore marketing efficiency and extract meaningful insights by combining data from multiple sources.

## Dataset Structure

The analysis is based on four main tables:

### 1. `facebook_ads_basic_daily`
Daily performance metrics, including:
- spend  
- impressions  
- reach  
- clicks  
- conversions  
- value  

### 2. `google_ads_basic_daily`
Daily Google Ads metrics, including:
- spend  
- clicks  
- conversions  
- value  
- impressions  

### 3. `facebook_adset`
Ad set metadata:
- adset_name  
- campaign_id  
- targeting  
- status  

### 4. `facebook_campaign`
Campaign metadata:
- campaign_name  
- objective  
- status
  
## Analytical Objectives

The project includes several analytical tasks:

### 1. Daily Spend Aggregation
Calculate:
- average daily spend  
- minimum daily spend  
- maximum daily spend  
for each date on both platforms.

### 2. Top 5 Days by Combined ROMI
Determine the five dates with the highest total ROMI across Facebook and Google combined.

### 3. Highest Weekly Value Campaign
Identify the campaign with the highest total value within a single calendar week.

### 4. Month-over-Month Reach Growth
Find the campaign that achieved the largest absolute increase in reach compared to the previous month.

### 5. (Optional) Longest Active Ad Set Streak
Determine the ad set with the longest continuous (daily) activity across both platforms.
