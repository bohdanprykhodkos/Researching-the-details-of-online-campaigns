--top_romi_days
select source,
ad_date,
round((sum (value) :: numeric / sum (spend)), 2) as ROMI
from 
(select 'facebook' as source, ad_date, spend, value
from facebook_ads_basic_daily fabd 
union all
select 'google' as source, ad_date, spend, value
from google_ads_basic_daily) as fb_gl
where spend > 0
group by ad_date, source
order by ROMI DESC
limit 5


