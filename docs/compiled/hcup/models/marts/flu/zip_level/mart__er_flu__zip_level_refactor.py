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


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args,dbt_load_df_function):
    refs = {"mart__er_flu__line_level": "main.parquet.mart__er_flu__line_level"}
    key = ".".join(args)
    return dbt_load_df_function(refs[key])


def source(*args, dbt_load_df_function):
    sources = {}
    key = ".".join(args)
    return dbt_load_df_function(sources[key])


config_dict = {}


class config:
    def __init__(self, *args, **kwargs):
        pass

    @staticmethod
    def get(key, default=None):
        return config_dict.get(key, default)

class this:
    """dbt.this() or dbt.this.identifier"""
    database = 'main'
    schema = 'parquet'
    identifier = 'mart__er_flu__zip_level_refactor'
    def __repr__(self):
        return 'main.parquet.mart__er_flu__zip_level_refactor'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args: ref(*args, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------


