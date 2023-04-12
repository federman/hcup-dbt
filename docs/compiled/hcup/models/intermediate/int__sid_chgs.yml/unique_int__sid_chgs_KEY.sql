
    
    

select
    KEY as unique_field,
    count(*) as n_records

from "main"."parquet"."int__sid_chgs"
where KEY is not null
group by KEY
having count(*) > 1


