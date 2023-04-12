import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'parquet' )

    ## Read in upstream tables
    ip_discharges = pl.from_arrow(dbt.ref("int__flu_ip").arrow()) 

    ## Transformations
    mart = (ip_discharges
      .select(['KEY','AYEAR','AMONTH', 'ili_diagnosis_var', 'HOSP_NPI','insurance'])    
      .groupby(['AYEAR','AMONTH', 'ili_diagnosis_var','HOSP_NPI','insurance'])
      .count()
      .rename({"count": "n_ip_discharges"})
      .to_pandas())

    return mart