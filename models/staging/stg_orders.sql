
{{
    config(
        materialized='incremental'
    )
}}

select * from
{{ ref('raw_orders') }}

{% if is_incremental() %}
where updated_at >= (select max(updated_at) from {{ this }})
{% endif %}
