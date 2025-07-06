with
    source as (select * from {{ source("erp", "suppliers") }}),
    renamed as (
        select
            cast(id as int) as suppliers_pk,
            cast(companyname as varchar) as suppliers_name,
            -- , cast(CONTACTNAME as varchar) as suppliers_
            -- , cast(CONTACTTITLE as varchar) as suppliers_
            -- , cast(ADDRESS as varchar) as suppliers_
            cast(city as varchar) as suppliers_city,
            cast(region as varchar) as suppliers_region,
            -- , cast(POSTALCODE as varchar) as suppliers_
            cast(country as varchar) as suppliers_country
        -- , cast(PHONE as varchar) as suppliers_
        -- , cast(FAX as varchar) as suppliers_
        -- , cast(HOMEPAGE as varchar) as suppliers_
        from source
    )
select *
from renamed
