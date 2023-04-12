import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'parquet' )

    ## Read in upstream tables
    df_encounter_count = pl.from_arrow(dbt.ref("int__flu_ip_cost_zcta_count").arrow()) 
    df_total_charges = pl.from_arrow(dbt.ref("int__flu_ip_cost_zcta_sum").arrow()) 
    xwalk_zcta_place = pl.from_arrow(dbt.ref("xwalk_zcta_place").arrow()) 

    ## Transformations
    mart = (df_total_charges
                 .join(df_encounter_count, 
                       on = ['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'ZCTA'], 
                       how = 'left')
                 .join(xwalk_zcta_place, on = 'ZCTA', how = 'left') 
                 .filter(pl.col('PLACE').is_not_null())
                 .groupby(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'PLACE'])
                 .agg(pl.sum('total_ip_charge').alias('total_ip_charge_place'),
                      pl.sum('n_ip_encounters').alias('n_ip_encounters_place'))
                 .to_pandas())

    return mart