--compile macro sql file first, make sure there is no error
--then to run your model, compile sql, 
--run the preview to get the output

select *
from {{ref('opps_info')}}

{{limit_data_in_dev('close_date')}}
