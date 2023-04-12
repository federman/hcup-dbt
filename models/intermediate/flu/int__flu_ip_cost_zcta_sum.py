import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'parquet' )

    ## Read in upstream tables
    ip_discharges = pl.from_arrow(dbt.ref("int__flu_ip").arrow()) 
    ip_costs = pl.from_arrow(dbt.ref("int__sid_chgs").arrow()) 

    ## Operationalize discharge metadata for ip_costs table
    discharge_metadata =  (ip_discharges
      .select(['KEY','AYEAR','AMONTH','ZCTA', 'ili_diagnosis_var'])  
      .unique())

    ## Transformations
    mart = (ip_costs
                 .select(['KEY','CHARGE']) 
                 .join(discharge_metadata, on = 'KEY', how = 'left')
                 .filter(pl.col('ZCTA').is_not_null())
                 .groupby(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'ZCTA'])
                 .agg(pl.sum('CHARGE').alias('total_ip_charge'))
                 .to_pandas())

    return mart