## HCUP DBT

This is the datawarehousing repository for the HCUP project. Other useful links include:

- [Extraction Loading repository that loads HCUP files as parquet](https://github.com/Drexel-UHC/hcup-extraction-loading)
- [Grammer of data manipulation (R/Python) cheatsheet](https://github.com/ran-codes/python-rstudio)


### profiles.yml

```yml


hcup:
  outputs:
    dev:
      type: duckdb
      path: hcup-dev.duckdb
      schema: csv
      extensions:
        - httpfs
        - parquet
      external_root: 'C:\Users\rl627\Desktop\Git\hcup-dbt\external\dev\'
    stage:
      type: duckdb
      path: hcup-dev.duckdb
      schema: csv
      extensions:
        - httpfs
        - parquet
      external_root: '\\files.drexel.edu\encrypted\SOPH\UHC\SchnakeMahl_HCUP\dbt\v0\stage\'
    prod:
      type: duckdb
      path: hcup-prod.duckdb
      schema: parquet
      extensions:
        - httpfs
        - parquet
      external_root: '\\files.drexel.edu\encrypted\SOPH\UHC\SchnakeMahl_HCUP\dbt\v0\models\'
  target: prod

```
