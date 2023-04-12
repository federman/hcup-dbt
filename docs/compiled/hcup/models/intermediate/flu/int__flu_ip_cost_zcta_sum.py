import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'parquet' )

    ## Read in upstream tables
    ip_discharges = pl.from_arrow(dbt.ref("int__flu_ip").arrow()) 
    ip_costs = pl.from_arrow(dbt.ref("int__sid_chgs").arrow()) 

    ## Operationalize discharge metadata for ip_costs table
    discharge_metadata =  (ip_discharges
      .select(['KEY','AYEAR','AMONTH','ZCTA', 'ili_diagnosis_var'])  
      .unique())

    ## Transformations
    mart = (ip_costs
                 .select(['KEY','CHARGE']) 
                 .join(discharge_metadata, on = 'KEY', how = 'left')
                 .filter(pl.col('ZCTA').is_not_null())
                 .groupby(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'ZCTA'])
                 .agg(pl.sum('CHARGE').alias('total_ip_charge'))
                 .to_pandas())

    return mart


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args,dbt_load_df_function):
    refs = {"int__flu_ip": "main.parquet.int__flu_ip", "int__sid_chgs": "main.parquet.int__sid_chgs"}
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
    identifier = 'int__flu_ip_cost_zcta_sum'
    def __repr__(self):
        return 'main.parquet.int__flu_ip_cost_zcta_sum'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args: ref(*args, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------


