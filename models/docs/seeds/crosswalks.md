{% docs docs__xwalk_zip_zcta %}

This is a crosswalk from zip codes to ZCTA. This crosswalk was obtains from Heather Rollins.

{% enddocs %}

{% docs docs__xwalk_zip_urban %}

This is a crosswalk operationalize from RUCA2010zipcode.xslx found from https://www.ers.usda.gov/data-products/rural-urban-commuting-area-codes/.

The rural-urban commuting area (RUCA) codes classify U.S. census tracts using measures of population density, urbanization, and daily commuting. A second dataset applies 2010 RUCA classifications to ZIP code areas by transferring RUCA values from the census tracts that comprise them. The most recent RUCA codes are based on data from the 2010 decennial census and the 2006–10 American Community Survey. The classification contains two levels. Whole numbers (1–10) delineate metropolitan, micropolitan, small town, and rural commuting areas based on the size and direction of the primary (largest) commuting flows. These 10 codes are further subdivided based on secondary commuting flows, providing flexibility in combining levels to meet varying definitional needs and preferences. Descriptions of the codes are found within the data files, and also in the Documentation.

State and county names included on the file provide initial help in locating census tracts of interest (all census tracts are nested within counties). To determine the census tract for a particular location within a county, please go to https://geomap.ffiec.gov/FFIECGeocMap/GeocodeMap1.aspx. 

Earlier versions of the RUCA codes (1990 and 2000) are also available. All three versions use the same primary classification scheme (1–10) but are not directly comparable because many census tracts are reconfigured during each decade. Also, changes to census methodologies significantly affected the RUCA classifications. Between 1990 and 2000, changes to methods for defining urban areas decreased rural population and territory. Between 2000 and 2010, the data source for daily commuting patterns switched from the decennial census (measuring one point in time during 2000) to the American Community Survey (providing a 5-year average during 2006–10). See data source information within the individual data files for details.

{% enddocs %}

{% docs docs__xwalk_zcta_place %}

This is ZCTA to PLACE relationship file provided by the US Census Bureau which is originally found here (https://www.census.gov/programs-surveys/geography/technical-documentation/records-layout/2010-zcta-record-layout.html) under the file name zcta_place_rel_10.txt. 

The documentation notes that each record in this file (zcta_place_rel_10.txt) shows the totals for the entire ZCTA and place entity for the ZPOP, ZHU, ZAREA, ZAREALAND, PLPOP, PLHU, PLAREA, and PLAREALAND columns.  As only the intersections between the two entities are shown in the relationship file, the sum of the part columns for all records representing a specific ZCTA or place may not add up to the totals for the ZCTA or place.

As Places are not wall-to-wall entities and do not cover the entire nation, this file may not contain all ZCTAs.


{% enddocs %}


{% docs var__ZIP %}

5 digit ZIP-code.

{% enddocs %}

{% docs var__ZCTA %}

5 digit ZCTA code.

{% enddocs %}

{% docs var__PLACE %}

7-digit Census place ID code

{% enddocs %}

{% docs var__urban %}

Boolean variable that describes the urbanicity of the ZIP code. If RUCA is < 4, then urban is TRUE. If RUCA is >= 4, then urban is FALSE.

{% enddocs %}

{% docs var__RUCA %}

Rural Urban Commuting Area score. This is a classification system that categorizes U.S. census tracts and ZIP codes based on their degree of rurality and urbanicity. RUCA scores range from 1.0 (most urban) to 10.9 (most rural) and are based on a combination of factors such as population density, commuting patterns, and geographic location. The RUCA score is often used in health research to study the relationship between geographic location and health outcomes. It can also be used in policy and planning decisions related to healthcare access and resource allocation in rural areas.

{% enddocs %}

