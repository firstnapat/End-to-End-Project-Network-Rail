with

movements as (

    select * from {{ ref('stg_networkrail__movements') }}

)

, operating_companies as (

    select * from {{ ref('stg_networkrail__operating_companies') }}

)

, joined as (

    select
        event_type
        , gbtt_timestamp_utc
        , original_loc_stanox
        , planned_timestamp_utc
        , timetable_variation
        , original_loc_timestamp_utx
        , current_train_guid
        , delay_monitoring_point
        , next_report_run_time
        , reporting_stanox
        , actual_timestamp_utc
        , correction_ind
        , event_source
        , train_guid
        , variation_status
        , toc_guid
        , oc.company_name as company_name
     

    from movements as m
    left join operating_companies as oc
        on m.toc_guid = oc.toc_id

)

select * from joined