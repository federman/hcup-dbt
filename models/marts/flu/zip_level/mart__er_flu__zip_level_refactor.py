import pyarrow as pa
import polars as pl

def model(dbt, session):
    dbt.config(materialized = "external", format = 'parquet' )
    df = dbt.ref("mart__er_flu__line_level")
    
    df_final = (pl.from_arrow(df.arrow())
      .groupby(['AGE','RACE','HISPANIC','ZIP','FEMALE','flu','flu_like','ili_diagnosis_var'])
      .count()
      .to_pandas())

    return df_final