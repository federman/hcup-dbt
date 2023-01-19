import pyarrow as pa
import polars as pl

def model(dbt, session):
    dbt.config(materialized = "external", format = 'parquet' )
    intermediate = pl.from_arrow(dbt.ref("mart__er_flu__line_level").arrow()) 
    
    final = (intermediate
      .groupby(['AGE','RACE','HISPANIC','ZIP','FEMALE','flu','flu_like','ili_diagnosis_var'])
      .count()
      .to_pandas())

    return final