with 
    source_employees as (
        select *
        from {{ source('erp', 'employees') }}

    ),

    renamed as (
        select 
            cast(ID as int) as employee_pk
            ,cast(REPORTSTO as int) as manager_fk
            ,FIRSTNAME || ' ' || LASTNAME as employee_name 
            ,cast(TITLE as varchar) as employee_title
            ,cast(BIRTHDATE as date) as employee_birth_date
            ,cast(HIREDATE as date) as employee_hire_date
            ,cast(CITY as varchar) as employee_city
            ,cast(REGION as varchar) as employee_region
            ,cast(COUNTRY as varchar) as employee_country
            --,cast(TITLEOFCOURTESY as varchar) as
            --,cast(HOMEPHONE as varchar) as
            --,cast(EXTENSION as varchar) as
           -- ,cast(PHOTO as varchar) as
            --,cast(NOTES as varchar) as
            --,cast(ADDRESS as varchar) as
            --,cast(POSTALCODE as varchar) as
            --cast(PHOTOPATH as varchar) as
        from source_employees
    )
    select *
    from renamed