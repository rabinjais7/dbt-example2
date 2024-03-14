

with raw_orders as (
    select *, dateadd(hour,-8,current_timestamp) updated_at
    from {{ source('globalmart', 'orders') }}
)

select * from 
raw_orders