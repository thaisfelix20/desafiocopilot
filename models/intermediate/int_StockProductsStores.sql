with 
categories as (
	select *
    from {{ ref('stg_categories') }}

)
, brands as (
	select *
    from {{ ref('stg_brands') }}
)
, stocks as (
	select *
    from {{ ref('stg_stocks') }}

)
, products as (
	select *
    from {{ ref('stg_products') }}
	--321 produtos
)
, juncao as (
	select 
		products.product_id
		, products.product_name
		, products.model_year
		, products.list_price
		, categories.category_name
		, brands.brand_name
		, stocks.store_id
		, stocks.quantity as quantity_stocks
	from products
	left join categories
		on products.category_id = categories.category_id
	left join brands
		on products.brand_id = brands.brand_id
	right join stocks
		on products.product_id = stocks.product_id
)
SELECT *
from juncao