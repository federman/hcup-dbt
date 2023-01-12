This information was scraped on 01/10/2023 from:

- https://www.hcup-us.ahrq.gov/db/state/sedddbdocumentation.jsp
- https://www.hcup-us.ahrq.gov/db/state/sedddist/SEDD_Introduction.jsp 

{% docs sedd_description %}

## Abstract: HCUP State Emergency Department Databases (SEDD)
The State Emergency Department Databases (SEDD) are part of the Healthcare Cost and Utilization Project (HCUP), sponsored by the Agency for Healthcare Research and Quality (AHRQ).

The HCUP State Emergency Department Databases (SEDD) are a powerful set of databases that capture discharge information on all emergency department visits that do not result in an admission. Information on patients initially seen in the emergency room and then admitted to the hospital is included in the HCUP State Inpatient Databases (SID). To enumerate all emergency department visits, SEDD discharges should be combined with SID discharges that originate in the emergency department.

- The SEDD contain the emergency department encounter abstracts from hospital-affiliated emergency departments in participating States, translated into a uniform format to facilitate multistate comparisons and analyses.
- The SEDD contain a core set of clinical and nonclinical information on all visits, regardless of the expected payer, including but not limited to Medicare, Medicaid, private insurance, self-pay, or those billed as 'no charge'.
- In addition to the core set of uniform data elements common to all SEDD, some State data include other elements such as the patient's race.

Researchers and policymakers use the SEDD to investigate access to healthcare in a changing healthcare marketplace; identify State-specific trends in emergency department utilization, access, charges, and outcomes; and conduct market-area research and small-area variation analyses.

The individual State databases are in the same HCUP uniform format and represent 100 percent of records processed by AHRQ. However, the participating data organizations control the release of specific data elements. AHRQ is currently assisting the data organizations in the release of the 1999-2021 SEDD.

The SEDD can be linked to hospital-level data from the American Hospital Association (AHA) Annual Survey of Hospitals and county-level data from the Bureau of Health Professions' Area Resource File (ARF), except in States that do not allow the release of hospital identifiers.

Thirty of the data organizations participating in HCUP have agreed to release their SEDD files through the HCUP Central Distributor under the auspices of AHRQ. Uses are limited to research, analysis, and aggregate statistical reporting.

Useful links include: 

- [SEDD database home page](https://www.hcup-us.ahrq.gov/db/state/sedddbdocumentation.jsp)
- [Intro to SEDD database](https://www.hcup-us.ahrq.gov/db/state/sedddist/SEDD_Introduction.jsp)

## Introduction to SEDD

#### Overview

The Healthcare Cost and Utilization Project (HCUP) State Emergency Department Databases (SEDD) consist of individual data files from 42 participating data organizations. The SEDD contain information on emergency department (ED) visits to hospital-affiliated emergency departments that do not result in admissions. Information on patients initially seen in the emergency room and then admitted to the hospital is included in the HCUP State Inpatient Databases (SID). Composition and completeness of data files may vary from State to State. The SEDD are annual, State-specific files that share a common structure and common data elements. Most data elements are coded in a uniform format across all States. In addition to the core set of uniform data elements, the SEDD include State-specific data elements or data elements available only for a limited number of States. The uniform format of the SEDD helps facilitate cross-State comparisons. In addition, the SEDD, in combination with the SID, are well suited for research that requires complete enumeration of hospitals and emergency room encounters within market areas or States.

Thirty of the 42 participating data organizations have agreed to release their SEDD files through the HCUP Central Distributor under the auspices of AHRQ. The individual State databases are in the same HCUP uniform format. In general, they represent 100 percent of records processed by AHRQ. However, the participating data organizations control the release of specific data elements. AHRQ is currently assisting the data organizations in the release of the 1999-2021 SEDD.

SEDD data sets are currently available for multiple States and years. Each release of the SEDD includes:

- Data in American Standard Code for Information Interchange (ASCII) format on a compact disc with read-only memory CD-ROM.
- Patient-level discharge abstract data in participating States for 100 percent of discharges from hospital-affiliated emergency departments that do not result in admissions.
- American Hospital Association (AHA) Linkage File to link the SEDD to data from the AHA Annual Survey of Hospitals. This is only available for States that allow the release of hospital identifiers.

The SEDD are calendar year files for all data years except 2015. Because of the transition to ICD-10-CM/PCS1 on October 1, 2015, the 2015 SEDD are split into two parts. Nine months of the 2015 data with ICD-9-CM2 codes (discharges from Jan 1, 2015 - September 30, 2015) are in one set of files labeled Q1Q3. Three months of 2015 data with ICD-10-CM/PCS codes (discharges from October 1, 2015 - December 31, 2015) are in a separate set of files labeled Q4. More information about the changes to the HCUP databases for ICD-10-CM/PCS and use of data across the two coding system may be found on the HCUP User Support website under ICD-10-CM/PCS Resources (www.hcup-us.ahrq.gov/datainnovations/icd10_resources.jsp).

SEDD documentation and tools—including file specifications, programming source code for loading ASCII data into SAS (SAS Institute Inc.; Cary, NC), SPSS (IBM Corp.; Somers, NY), and Stata (StataCorp; College Station, TX), and value labelsâ€”are available online at the HCUP User Support website www.hcup-us.ahrq.gov.

Starting with the 2006 SEDD, the AHA Linkage files are available via the HCUP User Support website www.hcup-us.ahrq.gov. The AHA Linkage files may not be available when the discharge-level database is released.

#### How the HCUP SEDD Differ from State Data Files

The SEDD available through the HCUP Central Distributor differ from the data files available from the data organizations in the following ways:

- Data elements available on the files
- Coding of data elements

Because the data organizations dictate the data elements that may be released through the HCUP Central Distributor, the data elements on the SEDD are a subset of the data collected by the corresponding data organizations. HCUP uniform coding is used on most data elements on the SEDD. A few State-specific data elements retain the original values provided by the respective data organizations.

#### What is the File Structure of the SEDD in the 2019-2021 Files?

Based on the availability of data elements across States, data elements included in the SEDD are structured as follows:

- Core file
- Charges file
- AHA Linkage file
- Diagnosis and Procedure Groups file

#### What Types of Facilities Are Included in the SEDD?

The types of hospitals are included in the SEDD depend on the information provided by the data organizations. Most State government data organizations provide information on all acute care hospitals in the respective State. Private data organizations are often restricted to member hospitals and may not provide information on all hospitals in their State. All hospitals reported by the data organizations are retained in the SEDD files.

Tables showing the number of hospitals in the SEDD can be found online at the HCUP User Support website (www.hcup-us.ahrq.gov). The tables present the hospitals by the number of:

- Community hospitals
- Hospitals not classified as community
- Community hospitals not in the SEDD

The only reason a hospital is not included in the SEDD is if the data organization did not supply the necessary data.

Information contained in the AHA Annual Survey of Hospitals was used to determine if a hospital was a community hospital. Community hospitals, as defined by AHA, include "all nonfederal, short term, general and other specialty hospitals, excluding hospital units of institutions." Included among community hospitals are academic medical centers and specialty hospitals such as obstetrics, gynecology, otolaryngology, short term rehabilitation, orthopedic, and pediatric hospitals. Noncommunity hospitals include Federal hospitals (e.g., Veterans Affairs, Department of Defense, and Indian Health Service hospitals), long-term hospitals, psychiatric hospitals, alcohol/chemical dependency treatment facilities, and hospital units within institutions such as prisons.

Some hospitals could not be categorized as community or noncommunity hospitals because they could not be matched with AHA information. This occurs when a hospital was closed in a previous year or when the hospital does not report to the AHA.

#### What is the File Structure of the SEDD in the 2019-2021 Files?

Based on the availability of data elements across States, data elements included in the SEDD are structured as follows:

- Core file
- Charges file
- AHA Linkage file
- Diagnosis and Procedure Groups file

#### What is the File Structure of the SEDD in the 2016-2018 Files?

Based on the availability of data elements across States, data elements included in the 2016 SEDD are structured as follows:

- Core file
- Charges file
- AHA Linkage file

Unavailable with the 2016-2018 SEDD is the Diagnosis and Procedure Groups file that had been included with the SEDD in prior data years. The data elements included in that file were derived from AHRQ software tools. If you are interested in applying the AHRQ software tools to the ICD-10-CM/PCS data in the 2016-2018 SEDD, beta versions of the AHRQ software tools are available on the HCUP User Support website at www.hcup-us.ahrq.gov/tools_software.jsp. Also available is a tutorial on how to apply the AHRQ software tools to the HCUP databases at www.hcup-us.ahrq.gov/tech_assist/tutorials.jsp.

{% enddocs %}
