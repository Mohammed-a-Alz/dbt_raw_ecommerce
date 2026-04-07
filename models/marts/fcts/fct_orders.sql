with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select
        order_id,
        sum(payment_value) as order_payment_total,
        count(payment_sequential) as payment_count

    from {{ ref('stg_order_payments') }}
    group by order_id

),

reviews as (

    select
        order_id,
        min(review_score) as review_score,
        min(review_creation_at) as reviewed_at

    from {{ ref('stg_order_reviews') }}
    group by order_id

),

final as (

    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.purchased_at,
        date(o.purchased_at) as purchased_date,
        o.approved_at,
        o.delivered_to_carrier_at,
        o.delivered_to_customer_at,
        o.estimated_delivery_at,

        -- payment info (aggregated to order grain)
        p.order_payment_total,
        p.payment_count,

        -- review info (aggregated to order grain)
        r.review_score,
        r.reviewed_at,

        -- derived: delivery metrics
        timestamp_diff(o.delivered_to_customer_at, o.purchased_at, day) as delivery_days,
        timestamp_diff(o.estimated_delivery_at, o.delivered_to_customer_at, day) as delivery_vs_estimate_days

    from orders o
    left join payments p on o.order_id = p.order_id
    left join reviews r on o.order_id = r.order_id

)

select * from final