{% docs sedd_chgs_2016_2018_description %}

# Charges file details 

The Charges file contains detailed charge information. There are three kinds of Charges files:

1. Line item detail in which a submitted charge pertains to a specified revenue center and there may be multiple charges reported for the same revenue center. This type of Charges file includes multiple records per discharge abstract. Each record includes the following information for one service:
  a. Revenue center (REVCODE))
  b. Charge (CHARGE) 
  c. Unit of service (UNITS)
  d. Current Procedural Terminology (CPT®) and Healthcare Common Procedure Coding System (HCPCS) codes (CPTHCPCS)
  e. Day of service (SERVDAY) for some files
For example, if a patient had five laboratory tests, there are five records in the Charges file with information on the charge for each laboratory test. Information from this type of Charges file may be combined with the Core file by the unique record identifier (KEY), but there is not a one-to-one correspondence of records.

2. Summarized detail in which charge information is summed within the revenue center. This type of Charges file includes one record per discharge abstract. Each record contains three corresponding arrays with the following information:
  a. Revenue center (REVCDn)
  b. Total charge for the revenue center (CHGn)
  c. Total units of service for the revenue center (UNITn)

For example, if a patient had five laboratory tests, REVCD1 would include the revenue code for laboratory, CHG1 would include the total charge for the five tests, and UNIT1 would be five. To combine data elements between this type of Charges file and the Core file, merge the files by the unique record identifier (KEY). There will be a one-to-one correspondence of records.

3. Collapsed detail in which charge information is summed across revenue centers. This type of Charges file includes one record per discharge abstract. Each record contains an array of collapsed charges (CHGn) that are predefined by the data organization that provided the data.

Consider the example of a patient that had five laboratory tests from different revenue centers in the range of 300 to 319. CHG1, which was predefined as Laboratory Charges for revenue centers 300-319, would include the total charge for the five tests, but there is no detail on which specific revenue centers were used. To combine data elements between this type of Charges file and the Core file, merge the files by the unique record identifier (KEY). There will be a one-to-one correspondence of records.

Refer to the Description of Data Elements online at the HCUP User Support website (www.hcup-us.ahrq.gov) for more information on the charge information from the different States.

{% enddocs %}