{% docs base__sedd_description %}

Subset of original source file to include fields of interest which contain information pertaining to: 

- demographics  
- diagnosis 
- encounter/discharge date
- insurance
- hospital information
- billing 
- payment

{% enddocs %}



{% docs base__sedd_db_description %}
Which HCUP database is this table sourced from. POssible values include:
 - SEDD
 - SID
{% enddocs %}

{% docs base__sedd_file_description %}
Which file is this table sourced from. Possible values include:
 - CORE
 - CHGS
 - SEVERITY
 - AHA
 - DX_GRP
{% enddocs %}
