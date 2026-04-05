with source as (

    select * from {{ source('raw_ecommerce', 'order_reviews') }}

),

renamed as (

    select
        -- ids
        review_id,
        order_id,

        -- review content
        review_score,
        review_comment_title,
        review_comment_message,

        -- timestamps
        review_creation_date    as review_creation_at,
        review_answer_timestamp as review_answer_at

    from source

)

select * from renamed