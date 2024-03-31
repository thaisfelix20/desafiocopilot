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
		products.product_id as productId
		, products.product_name as productName
		, products.model_year as productModelYear
		, products.list_price as productListPrice
		, categories.category_name as productCategoryName
		, brands.brand_name as productBrandName
		, stocks.store_id as storeId
		, stocks.quantity as stocksQuantity
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