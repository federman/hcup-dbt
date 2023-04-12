import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'parquet' )

    ## Read in upstream tables
    df_int__flu_ip = pl.from_arrow(dbt.ref("int__flu_ip").arrow()) 
  
    ## Transformations
    df_final = (df_int__flu_ip
      .select(['KEY', 'AYEAR','AMONTH', 'ili_diagnosis_var', 'ZIP','race_ethnicity', 'urban']) 
      .groupby(['AYEAR','AMONTH','ili_diagnosis_var','race_ethnicity','urban'])
      .count()
      .rename({"count": "n_ip_discharges"})
      .to_pandas())

    return df_final