with 
staffs as (
    select *
    from {{ ref('stg_staffs') }}
)
, stores as (
    select *
    from {{ ref('stg_store') }}
)
, juncao as (
    select 
        staffs.staff_id as staffId
        , (staffs.first_name || ' ' || staffs.last_name) as  StaffName
        , staffs.email as staffEmail
        , staffs.phone as staffPhone
        , staffs.active as staffActive
        , staffs.store_id as storeId
        , staffs.manager_id as managerId
        , stores.store_name as storeName
        , stores.phone as storePhone
        , stores.email as storeEmail
        , stores.street as storeStreet
        , stores.city as storeCity
        , stores.state as storeState
        , stores.zip_code as storeZipCode
    from staffs
    left join stores
        on staffs.store_id = stores.store_id
)
select *
from juncao
