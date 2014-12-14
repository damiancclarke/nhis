/* NHISprep.do v0.00             damiancclarke             yyyy-mm-dd:2014-10-23
----|----1----|----2----|----3----|----4----|----5----|----6----|----7----|----8

Script to run importing scripts of raw NHIS files to convert .dat to .dta.  This
requires downloading raw .dat files from the web:
   http://www.cdc.gov/nchs/nhis/nhis_2012_data_release.htm
along with import scripts found on the same page.

contact:mailto:damian.clarke@economics.ox.ac.uk

*/
vers 11
clear all
set more off
cap log close


********************************************************************************
*** (1) globals (passed between files)
********************************************************************************
global DAT "~/database/NHIS/Data/raw"
global OUT "~/database/NHIS/Data/dta"
global LOG "~/database/NHIS/Log"
global COD "~/database/NHIS/Source"

cap mkdir "$OUT"
cap mkdir "$LOG"

********************************************************************************
*** (2) Process all files
********************************************************************************
foreach year of numlist 1997(1)2013 {
  cap mkdir "$OUT/`year'"
  foreach script in familyxx househld personsx samadult samchild {
		dis "Year `year', script `script'"
		do "$COD/`year'/`script'.do"
	}
}

dis "Exiting without errors"
