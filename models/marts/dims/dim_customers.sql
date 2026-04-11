with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

customer_orders as (

    select
        c.customer_unique_id,
        c.customer_city,
        c.customer_state,
        c.customer_zip_code_prefix,
        min(o.purchased_at) as first_order_at,
        max(o.purchased_at) as last_order_at,
        count(distinct o.order_id) as total_orders

    from customers c
    left join orders o
        on c.customer_id = o.customer_id

    group by
        c.customer_unique_id,
        c.customer_city,
        c.customer_state,
        c.customer_zip_code_prefix

),

deduplicated as (

    select *,
        row_number() over (
            partition by customer_unique_id
            order by total_orders desc
        ) as rn

    from customer_orders

)

select
    customer_unique_id as customer_id,
    customer_city,
    customer_state,
    customer_zip_code_prefix,
    first_order_at,
    last_order_at,
    total_orders,
    case
        when total_orders > 1 then true
        else false
    end as is_repeat_customer

from deduplicated
where rn = 1