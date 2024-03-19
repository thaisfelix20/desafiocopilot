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
        orders_table.order_id
        , orders_table.customer_id      
        , orders_table.order_status
        , orders_table.order_date
        , orders_table.required_date
        , orders_table.shipped_date
        , orders_table.store_id
        , orders_table.staff_id
        , order_items.item_id
        , order_items.product_id
        , order_items.quantity
        , order_items.list_price
        , order_items.discount
    from orders_table
    left join order_items
        on orders_table.order_id = order_items.order_id
)
SELECT *
from juncao
