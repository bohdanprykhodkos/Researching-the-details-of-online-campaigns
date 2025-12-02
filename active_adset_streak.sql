--active_adset_streak
WITH unified AS 
(
  -- Об’єднуємо Facebook і Google в один набір
  SELECT
    fa.adset_name,
    f.ad_date::date AS ad_date
  FROM facebook_ads_basic_daily f
  JOIN facebook_adset fa USING (adset_id)
  WHERE f.spend > 0

  UNION ALL

  SELECT
    g.adset_name,
    g.ad_date::date AS ad_date
  FROM google_ads_basic_daily g
  WHERE g.spend > 0
),
days AS (
  SELECT DISTINCT adset_name, ad_date
  FROM unified
),
seq AS (
  SELECT
    adset_name,
    ad_date,
    ad_date - (ROW_NUMBER() OVER (PARTITION BY adset_name ORDER BY ad_date))::int AS grp_key
  FROM days
),
runs AS (
  SELECT
    adset_name,
    MIN(ad_date) AS start_date,
    MAX(ad_date) AS end_date,
    COUNT(*)     AS duration_days
  FROM seq
  GROUP BY adset_name, grp_key
),
ranked AS (
  SELECT *,
         ROW_NUMBER() OVER (ORDER BY duration_days DESC, start_date ASC) AS rn
  FROM runs
)
SELECT
  adset_name,
  start_date,
  end_date,
  duration_days
FROM ranked
WHERE rn = 1;
