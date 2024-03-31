
with 
StockProducts as (
	select * 
    from {{ ref('int_StockProducts') }}
)
, GeneratingSK as (
    select
        md5(cast(productId as string),cast(storeId as string)) as Sk_stockProducts
        , *
    from StockProducts
)
select * 
from GeneratingSK    