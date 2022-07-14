--Date Table Created in dbt
WITH date_spine AS (

  {{ dbt_utils.date_spine(
      start_date="to_date('01/01/2015', 'mm/dd/yyyy')",
      datepart="day",
      end_date="date_add('year', 40, current_date)"
     )
  }}

),
create_date as (

    SELECT
      cast(date_day as date) as date_day
      ,
      extract(year from date_day) as "year",
      extract(quarter from date_day) as "quarter",
      extract(month from date_day) as "month",
      extract(week from date_day) as "week",
      extract(year from date_day) ||'-Q'|| extract(quarter from date_day) as year_quarter,
      "year" ||'-W'|| "week" as year_week,
      DATE_PART(dayofweek, date_day) + 1 AS day_of_week
      ,
      FIRST_VALUE(date_day) OVER (PARTITION BY "year" ORDER BY date_day asc rows between unbounded preceding and unbounded following)    AS first_day_of_fiscal_year,
      DATEDIFF('week', first_day_of_fiscal_year, date_day) +1     AS week_of_fiscal_year
    FROM date_spine
   -- order by date_day asc
)

SELECT
date_day,
"year",
"quarter",
"month",
"week",
year_quarter,
year_week,
day_of_week,
week_of_fiscal_year
FROM create_date
