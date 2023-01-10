{% docs sedd_aha_2019_2021_description %}
The AHA Linkage file contains AHA linkage data elements that allow the SEDD to be used in conjunction with the AHA Annual Survey of Hospitals' data files. These files contain information about hospital characteristics and are available for purchase through the AHA. Because the data organizations in participating States determine whether the AHA linkage data elements may be released through the HCUP Central Distributor with the SEDD, not all SEDD include AHA linkage data elements.

Starting with the 2006 SEDD, the AHA Linkage files are available via the HCUP User Support website (www.hcup-us.ahrq.gov). The AHA Linkage files may not be available when the discharge-level database is released.

The AHA Linkage file is a hospital-level file with one observation per hospital or facility. To combine discharge-level files with the hospital-level file (AHA Linkage file), merge the files by the hospital identifier provided by the data source (DSHOSPID), but be careful of the different levels of aggregation. For example, the Core file may contain 5,000 discharges for DSHOSPID "A," but the Hospital file contains only one record for DSHOSPID "A."
{% enddocs %}
