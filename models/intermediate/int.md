

{% docs int__sedd_core_description %}

This intermediate table compiles all in emergency room encounter records from SEDD CORE files across years and states into a single table. Then conducts some additional merges to assign some spatial metadata to each record. The result is a **single table which contains all ER encounters and associated encounter-level metadata.**.

{% enddocs %}

{% docs int__sid_core_description %}

This intermediate table compiles all in patient discharge records from SID CORE files across years and states into a single table. Then conducts some additional merges to assign some spatial metadata to each record. The result is a **single table which contains all encounters and associated encounter-level metadata.**.

{% enddocs %}

{% docs int__sid_chgs_description %}

This intermediate table compiles all  SID CHGS files across years and states into a **a single table which captures encounter level billing/costs.**

{% enddocs %}

{% docs docs__int__flu_ip %}

Builds off of `int__sid_core` to generate a **single table which contains all encounters and associated encounter-level metadata plus flu, flu-like diagnosis flags.**.

{% enddocs %}