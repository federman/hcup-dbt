{% docs var_hcup__VisitLink %}

The VisitLink data element is one of two data elements that are supplemental information created for HCUP States for which there are encrypted person identifiers. The visit linkage variable (VisitLink) can be used in tandem with the timing variable (DaysToEvent) to study multiple hospital visits for the same patient across hospitals and time while adhering to strict privacy regulations. Maps indicating the availability of the revisit variables provide detailed information regarding which States release this information in the Central Distributor SID, SASD, and/or SEDD by year. VisitLink is derived from encrypted person numbers provided by the HCUP Partner. Partners sometimes change their coding scheme between data years, which in turn causes a discontinuity in VisitLink.

Please note that the values of VisitLink are unique within a State and data year, but not across States. For example, a unique value of VisitLink will track a patient within a State, such as the 2010 California SID, SASD, and SEDD, but the same value of VisitLink may be also be used for a different patient in another State, such as 2010 New York SID, SASD, and SEDD.

The patient's date of birth and gender were used to qualify the encrypted patient numbers provided to HCUP. A new verified person number (visitLink) was assigned for each unique combination of the qualifying information (encrypted person number, date of birth, and gender). Consider the following example: Five records have the same encrypted person numbers, but two records have one date of birth and gender, and the remaining three records have a different, but consistent, date of birth and gender. The two records with identical identifying information have one value of visitLink, and the other three records have a different value of visitLink.

No verified person number is assigned if any of the three pieces of information was missing (i.e., visitLink is missing). Additionally, no verified person number is assigned if there were more than 40 hospital visits in a given calendar year with the same qualifying information. This second qualification excluded less than 0.5 percent of the person numbers and aimed to eliminate person numbers used for multiple people.

While the term "verified person number" is used to describe the HCUP data element visitLink, the values are not recognizable as specific patient information. VisitLink does not include the values of the encrypted person number, date of birth, or gender.

Beginning with the 2009 HCUP data, the revisit variables (VisitLink and DaysToEvent) are included in the Core file of the SID, SASD, and SEDD files, when possible. For 2003-2008 data, the revisit variables are in separate HCUP Supplemental Files for Revisit Analyses.

More information on the revisit variables VisitLink and DaysToEvent is available here: https://hcup-us.ahrq.gov/toolssoftware/revisit/revisit.jsp 

{% enddocs %}