with 
customers as (
	select Sk_customerId, customerId 
    from {{ ref('dim_customers') }}
) 
, StaffStore as (
	select Sk_staffStore, staffId
    from {{ ref('dim_StaffStore') }}
)
, StockProducts as (
	select Sk_stockProducts, productId, storeId
    from {{ ref('dim_StockProducts') }}
)
, SalesOrderItems as (
	select * 
    from {{ ref('int_SalesOrderItems') }}
)
, juncao as (
    select 
        SalesOrderItems.orderId
        , SalesOrderItems.customerId  
        , SalesOrderItems.orderStatus
        , SalesOrderItems.orderDate
        , SalesOrderItems.requiredDate
        , SalesOrderItems.shippedDate
        , SalesOrderItems.storeId
        , SalesOrderItems.staffId
        , SalesOrderItems.itemId
        , SalesOrderItems.productId
        , (SalesOrderItems.quantity * SalesOrderItems.listPrice) as TotalBruto
        , ((SalesOrderItems.quantity * SalesOrderItems.listPrice) * (1 - SalesOrderItems.discont)) as TotalLiquido
        , SalesOrderItems.quantity
        , SalesOrderItems.listPrice
        , SalesOrderItems.discont        
        , customers.Sk_customerId
        , StaffStore.Sk_staffStore
        , StockProducts.Sk_stockProducts
    from SalesOrderItems
    left join customers
        on SalesOrderItems.customerId = customers.customerId
    left join StaffStore
        on SalesOrderItems.staffId = StaffStore.staffId
    left join StockProducts
        on SalesOrderItems.productId = StockProducts.productId 
        and SalesOrderItems.storeId = StockProducts.storeId
)
, GeneratingSK as (
    select
        MD5(CAST(CONCAT(orderId, itemId) as BYTES)) as Sk_SalesOrderItems
        , *
    from juncao
)
select * 
from GeneratingSK  