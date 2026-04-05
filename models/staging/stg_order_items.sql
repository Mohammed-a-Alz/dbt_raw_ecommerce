with source as (

    select * from {{ source('raw_ecommerce', 'order_items') }}

),

renamed as (

    select
        -- ids
        order_id,
        order_item_id,
        product_id,
        seller_id,

        -- timestamps
        shipping_limit_date as shipping_limit_at,

        -- measures
        price,
        freight_value

    from source

)

select * from renamed