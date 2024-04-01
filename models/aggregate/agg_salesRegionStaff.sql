with 
StaffStore as (
	select *
    from {{ ref('dim_StaffStore') }}
)
, SalesOrderItems as (
	select * 
    from {{ ref('fact_salesorderitems') }}
)
, juncao as (
    select 
        SalesOrderItems.Sk_SalesOrderItems
        , SalesOrderItems.orderId
        , SalesOrderItems.orderStatus
        , SalesOrderItems.itemId
        , SalesOrderItems.quantity
        , SalesOrderItems.listPrice
        , StaffStore.storeCity
        , StaffStore.storeState
        , StaffStore.StaffName
    from SalesOrderItems
    left join StaffStore
        on SalesOrderItems.staffId = StaffStore.staffId
)
, aggreg as (
    select
    orderId
    , storeState
    , StaffName
    , storeCity
    , sum(listPrice) as Valor_total_negociado
    , sum(quantity) as Quantidade_comprada 
    from juncao
    group by orderId, StaffName, storeState, storeCity
)
select * 
from aggreg  