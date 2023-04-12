import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'csv' )

    ## Read in upstream tables
    df_int__flu_ip = pl.from_arrow(dbt.ref("int__flu_ip").arrow()) 
    df_int__sid_chgs = pl.from_arrow(dbt.ref("int__sid_chgs").arrow()) 
    xwalk_zcta_place = pl.from_arrow(dbt.ref("xwalk_zcta_place").arrow()) 

    
    ## Operationalize KEY to ili_indicator crosswalk
    key_metadata =  (df_int__flu_ip
      .select(['KEY','AYEAR','AMONTH', 'ZIP','ZCTA', 'ili_diagnosis_var'])  
      .unique())

    ## Transformations
    df_final = (df_int__sid_chgs
                 .select(['KEY','CHARGE']) 
                 .join(key_metadata, on = 'KEY', how = 'left')
                 .join(xwalk_zcta_place, on = 'ZCTA', how = 'left') 
                 .filter(pl.col('PLACE').is_not_null())
                 .groupby(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'PLACE'])
                 .agg(pl.mean('CHARGE').alias('mean_chrg_per_encounter'))
                 .sort(by=['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'mean_chrg_per_encounter'])
                 .to_pandas())

    return df_final