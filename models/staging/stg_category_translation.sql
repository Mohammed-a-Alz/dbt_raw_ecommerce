with source as (

    select * from {{ source('raw_ecommerce', 'category_translation') }}

),

renamed as (

    select
        product_category_name,
        product_category_name_english

    from source

)

select * from renamed