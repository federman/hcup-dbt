import pyarrow as pa
import polars as pl

def model(dbt, session):
    ## Define the model config
    dbt.config(materialized = "external", format = 'csv' )

    ## Read in upstream tables
    ip_discharges = pl.from_arrow(dbt.ref("int__flu_ip").arrow()) 
    ip_costs = pl.from_arrow(dbt.ref("int__sid_chgs").arrow()) 
    xwalk_zcta_place = pl.from_arrow(dbt.ref("xwalk_zcta_place").arrow()) 

    ## Operationalize discharge metadata for ip_costs table
    discharge_metadata =  (ip_discharges
      .select(['KEY','AYEAR','AMONTH', 'ZIP','ZCTA', 'ili_diagnosis_var'])  
      .unique())

    ## Transformations
    mart = (ip_costs
                 .select(['KEY','CHARGE']) 
                 .join(discharge_metadata, on = 'KEY', how = 'left')
                 .join(xwalk_zcta_place, on = 'ZCTA', how = 'left') 
                 .filter(pl.col('PLACE').is_not_null())
                 .groupby(['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'PLACE'])
                 .agg(pl.mean('CHARGE').alias('mean_chrg_per_encounter'))
                 .sort(by=['AYEAR', 'AMONTH', 'ili_diagnosis_var', 'mean_chrg_per_encounter'])
                 .to_pandas())

    return mart


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args,dbt_load_df_function):
    refs = {"int__flu_ip": "main.parquet.int__flu_ip", "int__sid_chgs": "main.parquet.int__sid_chgs", "xwalk_zcta_place": "main.parquet.xwalk_zcta_place"}
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
    identifier = 'mart__flu_ip_cost_city'
    def __repr__(self):
        return 'main.parquet.mart__flu_ip_cost_city'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args: ref(*args, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------


