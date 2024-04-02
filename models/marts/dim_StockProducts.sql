
with 
StockProducts as (
	select * 
    from {{ ref('int_StockProducts') }}
)
, GeneratingSK as (
    select
        CAST((CONCAT(productId,'-', storeId)) AS string) as Sk_stockProducts
        , *
    from StockProducts
)
select * 
from GeneratingSK    