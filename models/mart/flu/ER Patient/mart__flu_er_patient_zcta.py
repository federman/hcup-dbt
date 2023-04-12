import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'csv' )

    ## Read in upstream tables
    er_encounters = pl.from_arrow(dbt.ref("int__flu_er").arrow()) 

    ## Transformations
    mart = (er_encounters
                .select(['AYEAR', 'AMONTH','ZCTA','ili_diagnosis_var','VisitLink']) 
                .drop_nulls(subset=["VisitLink"])
                .unique()
                .groupby(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'ZCTA'])
                .agg(pl.count().alias('n_unique_er_patients'))
                .sort(by=['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'n_unique_er_patients'])
                .to_pandas())
    return mart