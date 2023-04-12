import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'csv' )

    ## Read in upstream tables
    er_encounters = pl.from_arrow(dbt.ref("int__flu_er").arrow()) 
    xwalk_zcta_place = pl.from_arrow(dbt.ref("xwalk_zcta_place").arrow()) 

    ## Transformations
    mart = (er_encounters
                 .select(['KEY','AYEAR', 'AMONTH','ZCTA','ili_diagnosis_var']) 
                 .join(xwalk_zcta_place, on = 'ZCTA', how = 'left') 
                 .groupby(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'PLACE'])
                 .count()
                 .sort(by=['AYEAR', 'AMONTH', 'ili_diagnosis_var'])
                 .to_pandas())

    return mart