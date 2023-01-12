This information aws scraped on 01/10/2023 from:

- https://www.hcup-us.ahrq.gov/db/state/siddbdocumentation.jsp
- https://www.hcup-us.ahrq.gov/db/state/siddist/SID_Introduction.jsp 

{% docs sid_description %}

# Abstract: HCUP State Inpatient Databases (SID) 
The State Inpatient Databases (SID) are part of the Healthcare Cost and Utilization Project (HCUP), sponsored by the Agency for Healthcare Research and Quality (AHRQ).

The HCUP State Inpatient Databases (SID) are a powerful set of hospital databases from data organizations in participating States.

- The SID contain the universe of the inpatient discharge abstracts from participating States that are translated into a uniform format to facilitate multistate comparisons and analyses.
- Together, the SID encompass almost 97 percent of all U.S. hospital discharges. Some States include discharges from specialty hospitals, such as acute psychiatric hospitals.
- The SID contain a core set of clinical and nonclinical information on all visits, regardless of the expected payer, including but not limited to Medicare, Medicaid, private insurance, self-pay, or those billed as 'no charge'.
- In addition to the core set of uniform data elements common to all SID, some include other elements such as the patient's race.

Researchers and policymakers use SID to investigate questions unique to one State; to compare data from two or more States; to conduct market-area variation analyses; and to identify State-specific trends in inpatient care utilization, access, charges, and outcomes.

The individual State databases are in the same HCUP uniform format and represent 100 percent of records processed by AHRQ. However, the participating data organizations control the release of specific data elements. AHRQ is currently assisting the data organizations in the release of the 1990-2021 SID.

The SID can be linked to hospital-level data from the American Hospital Association's Annual Survey of Hospitals and county-level data from the Bureau of Health Professions' Area Resource File, except in those States that do not allow the release of hospital identifiers.

Thirty-six of the data organizations participating in the HCUP have agreed to release their SID files through the HCUP Central Distributor under the auspices of the AHRQ. Uses are limited to research and aggregate statisitical reporting.

Useful links include: 

- [SEDD database home page provide database documentation for the SID, from a high-level Overview to all the detailed specifications, restrictions, and resources necessary for researchers working and publishing with the SID.](https://www.hcup-us.ahrq.gov/db/state/sedddbdocumentation.jsp)
- [Intro to SEDD database](https://www.hcup-us.ahrq.gov/db/state/sedddist/SEDD_Introduction.jsp)


# Introduction to SID

## Overview
The Healthcare Cost and Utilization Project (HCUP) State Inpatient Databases (SID) consist of individual data files from data organizations in 49 participating data organizations. In general, the SID contain the universe of that State's hospital inpatient discharge records. They are composed of annual, State-specific files that share a common structure and common data elements. Most data elements are coded in a uniform format across all States. In addition to the core set of uniform data elements, the SID include State-specific data elements or data elements available only for a limited number of States. The uniform format of the SID helps facilitate cross-State comparisons. In addition, the SID are well suited for research that requires complete enumeration of hospitals and discharges within market areas or States.

Thirty-six of the 49 data organizations that participate in the HCUP have agreed to release their State-specific files through the HCUP Central Distributor under the auspices of AHRQ. The individual state databases are in the same HCUP uniform format and represent 100 percent of records processed by AHRQ. However, the participating data organizations control the release of specific data elements.

SID data sets are currently available for multiple States and years. Each release of the SID includes:

- Data in American Standard Code for Information Interchange (ASCII) format on a compact disc with read-only memory (CD-ROM).
- Patient-level hospital discharge abstract data for 100 percent of discharges from hospitals in participating States.
- American Hospital Association (AHA) Linkage File to link the SID to data from the AHA Annual Survey of Hospitals. This is only available for those States that allow the release of hospital identifiers.

The SID are calendar year files for all data years except 2015. Because of the transition to ICD-10-CM/PCS1 on October 1, 2015, the 2015 SID are split into two parts. Nine months of the 2015 data with ICD-9-CM2 codes (discharges from January 1, 2015 - September 30, 2015) are in one set of files labeled Q1Q3. Three months of 2015 data with ICD-10-CM/PCS codes (discharges from October 1, 2015 - December 31, 2015) are in a separate set of files labeled Q4. More information about the changes to the HCUP databases for ICD-10-CM/PCS and use of data across the two coding system may be found on the HCUP User Support website under ICD-10-CM/PCS Resources (www.hcup-us.ahrq.gov/datainnovations/icd10_resources.jsp).

SID documentation and tools—including file specifications, programming source code for loading ASCII data into SAS (SAS Institute Inc.; Cary, NC), SPSS (IBM Corp.; Somers, NY), and Stata (StataCorp; College Station, TX), and value labels—are available online at the HCUP User Support website (www.hcup-us.ahrq.gov).

Starting with the 2006 SID, the AHA Linkage files are available via the HCUP User Support website www.hcup-us.ahrq.gov. The AHA Linkage files may not be available when the discharge-level database is released.

## How the HCUP SID Differ from State Data Files

How the HCUP SID Differ from State Data Files

The SID available through the HCUP Central Distributor differ from the data files available from the data organizations in the following ways:

- Data elements available on the files
- Coding of data elements

Because the data organizations dictate the data elements that may be released through the HCUP Central Distributor, the data elements on the SID are a subset of the data collected by the corresponding data organizations. HCUP uniform coding is used on most data elements on the SID. A few State-specific data elements retain the original values provided by the respective data organizations.

## What Types of Hospitals Are Included in the SID?

The types of hospitals included in the SID depend on the information provided by the data organizations and how the files were handled during HCUP processing. Most State government data organizations provide information on all acute care hospitals in the respective State. Private data organizations are often restricted to member hospitals and may not provide information on all hospitals in their State.

Beginning with the 1994 SID, all hospitals reported by the data organizations were retained in the SID files. Discharges from facilities such as psychiatric facilities, alcohol and drug dependency facilities, and State, Federal, and Veterans Affairs hospitals will be in the SID, if reported by the data source. Prior to 1994, only discharges from community hospitals were retained in the SID.

Community hospitals, as defined by the AHA, include "all nonfederal, short term, general and other specialty hospitals, excluding hospital units of institutions." Included among community hospitals are academic medical centers and specialty hospitals such as obstetrics, gynecology, otolaryngology, short term rehabilitation, orthopedic, and pediatric hospitals. Noncommunity hospitals include Federal hospitals (e.g., Veterans Affairs, Department of Defense, and Indian Health Service hospitals), long-term hospitals, psychiatric hospitals, alcohol/chemical dependency treatment facilities, and hospital units within institutions such as prisons.

Some community hospitals may not be included in the SID because their data were not provided by the data source. To identify community hospitals, the SID must be linked to the AHA Annual Survey of Hospitals by the AHA hospital identifier.

Tables showing the number of hospitals in the SID can be found online at the HCUP User Support website: (www.hcup-us.ahrq.gov). The tables present the hospitals by the number of hospitals of:

- Community hospitals
- Hospitals not classified as community
- Community hospitals not in the SID

Information contained in the AHA Annual Survey of Hospitals was used to determine if a hospital was a community hospital. Some hospitals could not be categorized as community or noncommunity hospitals because they could not be matched with AHA information. This occurs when a hospital was closed in a previous year or when the hospital does not report to the AHA.

**What is the File Structure of the SEDD in the 2019-2021 Files?**

Based on the availability of data elements across States, data elements included in the SEDD are structured as follows:

- Core file
- Charges file
- AHA Linkage file
- Diagnosis and Procedure Groups file

**What is the File Structure of the SEDD in the 2016-2018 Files?**

Based on the availability of data elements across States, data elements included in the 2016 SEDD are structured as follows:

- Core file
- Charges file
- AHA Linkage file

Unavailable with the 2016-2018 SEDD is the Diagnosis and Procedure Groups file that had been included with the SEDD in prior data years. The data elements included in that file were derived from AHRQ software tools. If you are interested in applying the AHRQ software tools to the ICD-10-CM/PCS data in the 2016-2018 SEDD, beta versions of the AHRQ software tools are available on the HCUP User Support website at www.hcup-us.ahrq.gov/tools_software.jsp. Also available is a tutorial on how to apply the AHRQ software tools to the HCUP databases at www.hcup-us.ahrq.gov/tech_assist/tutorials.jsp.

{% enddocs %}
