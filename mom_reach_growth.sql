--mom_reach_growth
with facebook_all as 
(
select ad_date, campaign_name, reach
from facebook_ads_basic_daily fabd 
left join facebook_campaign fc
on fabd.campaign_id = fc.campaign_id 
),
fb_gl as 
(
select ad_date, campaign_name, reach
from google_ads_basic_daily
union all 
select ad_date, campaign_name, reach
from facebook_all
),
monthly as 
(
select  
campaign_name,
sum(reach) as total_reach,
date_trunc('month', ad_date)::date as month
from fb_gl
group by month, campaign_name
),
dif as 
(
select
campaign_name,
month,
total_reach as curr_reach,
LAG(total_reach) over 
   (partition by campaign_name 
    order by month) AS prev_reach
from monthly
)
select
campaign_name,
month as current_month,
prev_reach,
curr_reach,
ABS(curr_reach - prev_reach) as abs_diff
from dif
where prev_reach is not null
order by abs_diff DESC
limit 1

