--weekly_value_campaign
with facebook_all as 
(
select ad_date, campaign_name, value
from facebook_ads_basic_daily fabd 
left join facebook_campaign fc
on fabd.campaign_id = fc.campaign_id 
),
fb_gl as 
(
select ad_date, campaign_name, value
from google_ads_basic_daily
union all 
select ad_date, campaign_name, value
from facebook_all
)
select campaign_name, date_trunc('week', ad_date):: date as week,
sum (value) as total_value
from fb_gl 
where value > 0
group by week, campaign_name
order by total_value desc
limit 1
