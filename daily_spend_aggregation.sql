--daily_spend_aggregation
with facebook as
(select 'facebook' as source, ad_date,
avg(spend) as avg_spend,
min(spend) as min_spend,
max(spend) as max_spend
from facebook_ads_basic_daily
group by ad_date),
google as
(
select 'google' as source, ad_date, 
avg(spend),
min(spend),
max(spend)
from google_ads_basic_daily
group by ad_date 
)
select *
from facebook 
union all
select *
from google

