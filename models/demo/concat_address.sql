{{
    config
    (
        materialized = 'table'
    )
}}
select {{ concat_macro('123street','virginia') }} as address 