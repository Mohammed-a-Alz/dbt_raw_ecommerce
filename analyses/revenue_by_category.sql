-- Which product categories generate the most revenue?

select
    p.product_category,
    count(distinct oi.order_id) as total_orders,
    count(oi.order_item_id) as items_sold,
    round(sum(oi.price), 2) as total_revenue,
    round(avg(oi.price), 2) as avg_item_price

from {{ ref('fct_order_items') }} oi
left join {{ ref('dim_products') }} p
    on oi.product_id = p.product_id

where p.product_category is not null

group by p.product_category
order by total_revenue desc
limit 20