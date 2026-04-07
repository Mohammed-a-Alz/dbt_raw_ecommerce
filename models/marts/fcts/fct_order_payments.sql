with payments as (

    select * from {{ ref('stg_order_payments') }}

),

orders as (

    select
        order_id,
        customer_id,
        purchased_at

    from {{ ref('stg_orders') }}

),

final as (

    select
        p.order_id,
        p.payment_sequential,
        o.customer_id,
        o.purchased_at,
        date(o.purchased_at) as purchased_date,

        p.payment_type,
        p.payment_installments,
        p.payment_value

    from payments p
    left join orders o
        on p.order_id = o.order_id

)

select * from final