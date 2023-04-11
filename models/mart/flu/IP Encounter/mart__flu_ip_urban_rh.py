import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'parquet' )

    ## Read in intermediate table
    df_intermediate = pl.from_arrow(dbt.ref("int__flu_ip").arrow()) 
     
    ## Read in ZIP to Urban Crosswalk
    xwalk_zip_urban = pl.from_arrow(dbt.ref("xwalk_zip_urban").arrow())

    ## Mart Items Logic
    df_final = (df_intermediate
      .select(['KEY', 'ZIP','race_ethnicity', 'ili_diagnosis_var']) 
      .join(xwalk_zip_urban, on = 'ZIP', how = 'left')     
      .groupby(['ili_diagnosis_var','race_ethnicity','urban'])
      .count()
      .rename({"count": "n_ip_discharges"})
      .to_pandas())

    return df_final