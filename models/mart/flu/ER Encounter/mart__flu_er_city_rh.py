import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'parquet' )

    ## Read in upstream tables
    er_encounters = pl.from_arrow(dbt.ref("int__flu_er").arrow()) 
    xwalk_zcta_place = pl.from_arrow(dbt.ref("xwalk_zcta_place").arrow()) 

    ## Transformations
    mart = (er_encounters
                 .select(['KEY','AYEAR', 'AMONTH', 'ZCTA', 'ili_diagnosis_var', 'race_ethnicity']) 
                 .join(xwalk_zcta_place, on = 'ZCTA', how = 'left') 
                 .groupby(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'race_ethnicity', 'PLACE'])
                 .agg(pl.count().alias('n_er_encounters'))
                 .sort(by=['AYEAR', 'AMONTH', 'ili_diagnosis_var'])
                 .to_pandas())

    return mart