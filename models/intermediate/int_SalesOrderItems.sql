with 
orders_table as (
    select *
    from {{ ref('stg_orders') }}
)
, order_items as (
    select *
    from {{ ref('stg_order_items') }}
)
, juncao as (
    select 
        orders_table.order_id as orderId
        , orders_table.customer_id as customerId  
        , orders_table.order_status as orderStatus
        , orders_table.order_date as orderDate
        , orders_table.required_date as requiredDate
        , orders_table.shipped_date as shippedDate
        , orders_table.store_id as storeId
        , orders_table.staff_id as staffId
        , order_items.item_id as itemId
        , order_items.product_id as productId
        , order_items.quantity as quantity
        , order_items.list_price as listPrice
        , order_items.discount as discont
    from orders_table
    left join order_items
        on orders_table.order_id = order_items.order_id
)
select *
from juncao
