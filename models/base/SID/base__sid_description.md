{% docs base__sid_description %}

Subset of original SID source file to include fields of interest which contain information pertaining to: 

- demographics  
- diagnosis 
- encounter/discharge date
- insurance
- hospital information
- billing 
- payment

{% enddocs %}


{% docs base__sid_db_description %}
Which HCUP database is this table sourced from. POssible values include:
 - SEDD
 - SID
{% enddocs %}

{% docs base__sid_file_description %}
Which file is this table sourced from. Possible values include:
 - CORE
 - CHGS
 - SEVERITY
 - AHA
 - DX_GRP
{% enddocs %}
