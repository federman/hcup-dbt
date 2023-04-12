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


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args,dbt_load_df_function):
    refs = {"int__flu_ip_cost_zcta_count": "main.parquet.int__flu_ip_cost_zcta_count", "int__flu_ip_cost_zcta_sum": "main.parquet.int__flu_ip_cost_zcta_sum", "xwalk_zcta_place": "main.parquet.xwalk_zcta_place"}
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
    identifier = 'int__flu_ip_cost_zcta_merged'
    def __repr__(self):
        return 'main.parquet.int__flu_ip_cost_zcta_merged'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args: ref(*args, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------


