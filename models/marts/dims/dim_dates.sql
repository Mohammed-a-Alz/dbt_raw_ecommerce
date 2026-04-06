with date_spine as (

    select
        date_add(
            cast('2016-01-01' as date),
            interval seq day
        ) as date_day

    from unnest(generate_array(0, 1500)) as seq

),

final as (

    select
        date_day,
        extract(year from date_day)        as year,
        extract(month from date_day)       as month,
        extract(day from date_day)         as day_of_month,
        extract(dayofweek from date_day)   as day_of_week,
        format_date('%A', date_day)        as day_name,
        format_date('%B', date_day)        as month_name,
        extract(quarter from date_day)     as quarter,
        case
            when extract(dayofweek from date_day) in (1, 7) then true
            else false
        end as is_weekend

    from date_spine
    where date_day <= current_date()

)

select * from final