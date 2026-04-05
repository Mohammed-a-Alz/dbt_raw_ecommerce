with source as (

    select * from {{ source('raw_ecommerce', 'products') }}

),

renamed as (

    select
        product_id,
        product_category_name,

        -- fix typos from source (lenght -> length)
        product_name_lenght        as product_name_length,
        product_description_lenght as product_description_length,

        -- product attributes
        product_photos_qty,
        product_weight_g,
        product_length_cm,
        product_height_cm,
        product_width_cm

    from source

)

select * from renamed