import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'csv' )

    ## Read in upstream tables
    df_int__flu_ip = pl.from_arrow(dbt.ref("int__flu_ip").arrow()) 
    df_int__sid_chgs = pl.from_arrow(dbt.ref("int__sid_chgs").arrow()) 
    xwalk_zip_zcta = pl.from_arrow(dbt.ref("xwalk_zip_zcta").arrow()) 
    xwalk_zcta_place = pl.from_arrow(dbt.ref("xwalk_zcta_place").arrow()) 

    
    ## Operationalize KEY to ili_indicator crosswalk
    key_metadata =  (df_int__flu_ip
      .select(['KEY','AYEAR','AMONTH', 'ZIP', 'ili_diagnosis_var'])  
      .unique())

    ## Transformations
    df_final = (df_int__sid_chgs
                 .select(['KEY','CHARGE']) 
                 ##.drop_nulls(subset=['CHARGE'])    
                 .join(key_metadata, on = 'KEY', how = 'left')
                 ##.drop_nulls(subset=['ZIP']) 
                 .join(xwalk_zip_zcta, on = 'ZIP', how = 'left') 
                 .join(xwalk_zcta_place, on = 'ZCTA', how = 'left') 
                 ##.groupby('PLACE')
                 ##.agg({'CHARGE': 'mean'})
                 .to_pandas())

    return df_final