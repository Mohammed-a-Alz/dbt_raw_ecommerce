with source as (
    select * from {{ source('raw_ecommerce', 'category_translation') }}
),
renamed as(
    select 

    prodcut_category_name,
    prodcut_category_name_english

    from source

)

select * from renamed