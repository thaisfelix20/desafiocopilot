
with 
StockProducts as (
	select * 
    from {{ ref('int_StockProducts') }}
)
, GeneratingSK as (
    select
        MD5(CAST(CONCAT(productId, storeId) AS BYTES)) as Sk_stockProducts
        , *
    from StockProducts
)
select * 
from GeneratingSK    