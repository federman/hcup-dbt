{% docs var__insurance %}

`insurance` is an human readable variable operationalized from the original `PAY1` field which captures encounter payment information. The coding schema is provided in the table below and the details about the HCUP `PAY1` value can be found here:[ https://hcup-us.ahrq.gov/db/vars/siddistnote.jsp?var=pay1](https://hcup-us.ahrq.gov/db/vars/siddistnote.jsp?var=pay1).

| PAY1 | insurance                         |
| ----- | ----------------------------------------- |
| 1     | Medicare                                     |
| 2     | Medicaid                                     |
| 3     | Private insurance                                  |
| 4     | Self-pay                 |
| 5     | No charge                           |
| 6     | Other                                     |
| .     | Missing                                   |
| .A    | Invalid                                   |
| .B    | Unavailable from source (coded in 1988-1997 data only) |


{% enddocs %}