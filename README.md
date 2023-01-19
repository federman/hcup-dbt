Welcome to your new dbt project!

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
