{{
    config(
        materialized = 'table',
        transient    = true,
        alias        = 'WORK_PRODUCT_TRANSFORM',
        schema       = 'SILVER',
        pre_hook     = macros_copy_csv('WORK_PRODUCT_COPY')
    )
}}

WITH transform AS (

    SELECT
        -- Product data
        PRODUCT_ID,
        PRODUCT_NAME,
        CATEGORY,
        SELLING_PRICE,
        MODEL_NUMBER,
        ABOUT_PRODUCT,
        PRODUCT_SPECIFICATION,
        TECHNICAL_DETAILS,
        SHIPPING_WEIGHT,
        PRODUCT_DIMENSIONS,

        -- Process / metadata columns
        'EST'               AS TIME_ZONE,
        'PRODUCT'           AS SOURCE_SYS_NAME,
        'STANDARD'          AS INSTNC_ST_NM,
        CURRENT_SESSION()   AS PROCESS_ID,
        'TRANSFORM_LOAD'    AS PROCESS_NAME,

        -- Audit columns
        INSERT_DTS,
        UPDATE_DTS,
        SOURCE_FILE_NAME,
        SOURCE_FILE_ROW_NUMBER

    FROM {{ source('source', 'WORK_PRODUCT_COPY') }}

)

SELECT *
FROM transform