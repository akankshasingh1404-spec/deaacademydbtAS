
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
<<<<<<< HEAD
    select null as id
=======
    select 2 as id
>>>>>>> 7a1a3521f2e201aa130310e8fe3b54a4915fee1a

)

select *
from source_data
<<<<<<< HEAD
=======
-- where id is not null
>>>>>>> 7a1a3521f2e201aa130310e8fe3b54a4915fee1a

/*
    Uncomment the line below to remove records with null `id` values
*/

<<<<<<< HEAD
-- where id is not null
=======
>>>>>>> 7a1a3521f2e201aa130310e8fe3b54a4915fee1a
