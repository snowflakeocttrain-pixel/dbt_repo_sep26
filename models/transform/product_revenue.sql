select product_name,-1*sum(price*quantity) as revenue 
from {{source('RAW_DATA','products')}} p inner join {{source('RAW_DATA','orders')}} o
on(p.product_id=o.product_id)
group by product_name