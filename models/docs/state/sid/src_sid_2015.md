{% docs sid_2015_description %}

**What is the File Structure of the SID in the 2015 Files?**

The file structure of the 2015 SID is similar to previous years (and future years) in terms of how data elements are split across multiple data files, but differs from others years because the records within the 2015 files have been separated into two sets of files based on the discharge date because of the transition from reporting medical diagnoses and inpatient procedures using ICD-9-CM to the ICD-10-CM/PCS code sets.3

The 2015 SID are split into two separate sets of files based on the discharge date and different coding schemes:

- If the record was discharged between January 1, 2015, and September 30, 2015, it is retained in the quarter 1 to quarter 3 (Q1-Q3) files and includes ICD-9-CM data
- If the record was discharged between October 1, 2015 and December 31, 2015, it is retained in the quarter 4 (Q4) files and includes ICD-10-CM/PCS data.

Almost all of the diagnosis and procedure-related data elements that are based on ICD-10-CM/PCS data have been renamed with the prefix of I10 to distinguish them from the ICD-9-CM-based data element. Exceptions include data elements that are based on third-party proprietary software such as the Diagnosis Related Groups (DRGs) and the All Patient Refined DRG (APR-DRG).

Based on the availability of data elements across States, data elements included in the 2015 SID are structured as follows:

- Core files, one for Q1-Q3 and one for Q4
- Charges files, one for Q1-Q3 and one for Q4
- AHA Linkage file (one file because this is a hospital-level file, instead of a discharge-level file)
- Diagnosis and Procedure Groups files, one for Q1-Q3 and one for Q4
- Disease Severity Measures files, one for Q1-Q3 and one for Q4.


{% enddocs %}
