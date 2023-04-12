import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'parquet' )

    ## Read in upstream tables
    ip_discharges = pl.from_arrow(dbt.ref("int__flu_ip").arrow()) 
    ip_costs = pl.from_arrow(dbt.ref("int__sid_chgs").arrow()) 
    xwalk_zcta_place = pl.from_arrow(dbt.ref("xwalk_zcta_place").arrow()) 

    ## Operationalize discharge metadata for ip_costs table
    discharge_metadata =  (ip_discharges
      .select(['KEY','AYEAR','AMONTH', 'ZIP','ZCTA', 'ili_diagnosis_var'])  
      .unique())

    ## Transformations
    mart = (ip_costs
                 .select(['KEY','CHARGE']) 
                 .join(discharge_metadata, on = 'KEY', how = 'left')
                 .join(xwalk_zcta_place, on = 'ZCTA', how = 'left') 
                 .filter(pl.col('PLACE').is_not_null())
                 .groupby(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'PLACE'])
                 .agg(pl.mean('CHARGE').alias('mean_chrg_per_encounter'))
                 .sort(by=['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'mean_chrg_per_encounter'])
                 .to_pandas())

    return mart