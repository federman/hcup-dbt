import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'csv' )

    ## Read in upstream tables
    ip_discharges = pl.from_arrow(dbt.ref("int__flu_ip").arrow()) 

    ## Transformations
    mart = (ip_discharges
      .select(['KEY','AYEAR','AMONTH', 'HOSP_NPI','race_ethnicity', 'ili_diagnosis_var'])    
      .groupby(['AYEAR','AMONTH', 'ili_diagnosis_var','race_ethnicity','HOSP_NPI'])
      .count()
      .rename({"count": "n_ip_discharges"})
      .to_pandas())

    return mart