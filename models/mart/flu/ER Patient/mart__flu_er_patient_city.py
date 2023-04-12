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
                .select(['AYEAR', 'AMONTH','ZCTA','ili_diagnosis_var','VisitLink']) 
                .join(xwalk_zcta_place, on = 'ZCTA', how = 'left') 
                .select(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'PLACE', 'VisitLink']) 
                .drop_nulls(subset=["VisitLink"])
                .unique()
                .groupby(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'PLACE'])
                .agg(pl.count().alias('n_unique_er_patients'))
                .sort(by=['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'n_unique_er_patients'])
                .to_pandas())
    return mart