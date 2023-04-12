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


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args,dbt_load_df_function):
    refs = {"int__flu_er": "main.parquet.int__flu_er", "xwalk_zcta_place": "main.parquet.xwalk_zcta_place"}
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
    identifier = 'mart__flu_er_city_rh'
    def __repr__(self):
        return 'main.parquet.mart__flu_er_city_rh'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args: ref(*args, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------


