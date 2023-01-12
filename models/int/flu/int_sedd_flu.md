{% docs int_sedd_flu_description %}

True or false indicator for flu related dx codes. True if  either the primary or secondary ICD-10-CM Reason for visit diagnosis or  ICD-10-CM Diagnosis is a flu related dx code. See the `dx_flag_flu` macro for details

{% enddocs %}

{% docs int_sedd_flu_like_description %}

True or false indicator for flu-like related dx codes. True if  either the primary or secondary ICD-10-CM Reason for visit diagnosis or  ICD-10-CM Diagnosis is a flu-like related dx code. See the `dx_flag_flu_like` macro for details

{% enddocs %}


{% docs int_sedd_ili_diagnosis_var_description %}

Categorical indicator for influenza-like illness (ILI) diagnosis operationalized from the `flu` or `flu_like` intermediate indicators. There are three possible values:

- "BOTH" if a patient has both flu and flu-like diagnoses
- "ILI" if a patient has only flu diagnoses
- "ILI LIKE" if a patient has only flu-like diagnoses
- "OTHER" if a patient has neither flu nor flu-like diagnoses

{% enddocs %}
