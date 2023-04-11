{% docs macro__recode_race_ethnicity %}

Macro for recoding HCUP `Race` value into human readable values `race_ethnicity`. The coding schema is provided in the table below and the details about the HCUP `Race` value can be found here: https://hcup-us.ahrq.gov/db/vars/siddistnote.jsp?var=race.

| RACE | race_ethnicity                         |
| ----- | ----------------------------------------- |
| 1     | White                                     |
| 2     | Black                                     |
| 3     | Hispanic                                  |
| 4     | Asian or Pacific Islander                 |
| 5     | Native American                           |
| 6     | Other                                     |
| .     | Missing                                   |
| .A    | Invalid                                   |
| .B    | Unavailable from source (coded in 1988-1997 data only) |


{% enddocs %}