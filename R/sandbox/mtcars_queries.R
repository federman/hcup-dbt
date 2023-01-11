
# 0. Setup ----------------------------------------------------------------
{
  library(dplyr)
  library(dbplyr)
  library(DBI)
  library(nycflights13)
}


# 1. Connect to DB --------------------------------------------------------
{
  con = DBI::dbConnect(duckdb::duckdb(), dbdir=":memory:")
  flights <- copy_to(con, nycflights13::flights)
  airports <- copy_to(con, nycflights13::airports)
  mtcars  <- copy_to(con, mtcars)
}


# 2. Write Query ----------------------------------------------------------
{
  
  flights %>%
    select(contains("delay")) %>%
    show_query()
  
}
