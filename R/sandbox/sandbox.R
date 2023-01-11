
# 0. Setup ----------------------------------------------------------------
{
  library(dplyr)
  library(dbplyr)
  library(DBI)
  library(nycflights13)
  library(palmerpenguins)
}


# 1. Connect to DB --------------------------------------------------------
{
  con = DBI::dbConnect(duckdb::duckdb(), dbdir=":memory:")
  flights <- copy_to(con, nycflights13::flights)
  airports <- copy_to(con, nycflights13::airports)
  mtcars  <- copy_to(con, mtcars)
  df <- copy_to(con, palmerpenguins::penguins)
}


# 2. Write Query ----------------------------------------------------------
{
  
  ## R
  penguins %>% 
    count(island) %>% 
    mutate(
      island_dream = 
        case_when(
          island == 'Dream' ~ "1",
          TRUE ~ "0"
        )
    )
  
  df %>%
    count(island) %>% 
    mutate(
      island_dream = 
        case_when(
          island == 'Dream' ~ "1",
          TRUE ~ "0"
        ),
      
    ) %>% 
    show_query()
  
}
