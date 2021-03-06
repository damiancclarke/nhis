log using "$LOG/househld.log", replace
/*******************************************************************************
These processing files were provided in their original format by the CDC/NCHS or
by Jean Roth of NBER. Updates have been written by Damian Clarke and Yu-Kuan Ch-
en to:
    (1) Provide a full series of Stata input files for 1997-2013
    (2) Fix a number of processing errors in scripts
    (3) Completely automate the process through one do file

This entire process can be automated with the Python script provided at:
    https://github.com/damiancclarke/nhis, or
    https://sites.google.com/site/damiancclarke/computation

Links to original data which is downloaded by the Python script are here:
    http://www.cdc.gov/nchs/nhis.htm

The original processing scripts which were altered to provide these routines are
available at the above address, or in the case of Jean Roth's NBER files, at:
    http://www.nber.org/data/national-health-interview-survey-programs.html

Any further questions can be directed to damian.clarke@economics.ox.ac.uk
*******************************************************************************/

#delimit ;
clear;
set mem 200m;

* INPUT ALL VARIABLES;
infix
      rectype       1 -   2      srvy_yr       3 -   6
 str  hhx           7 -  12      intv_qrt     13 -  13
      assignwk     14 -  15 str  int_m_p      16 -  17
 str  int_y_p      18 -  21      livqrt       22 -  23
      non_intv     24 -  24      telenum      25 -  25
      inside       26 -  26      noserv       27 -  27
      howlngwk     28 -  29      nowaf_hh     30 -  30
      acpt_fam     31 -  32      rej_fam      33 -  34
      acpt_per     35 -  36      rej_per      37 -  38
      acptchld     39 -  40      lng_intv     41 -  41
      region       42 -  42      wtia_hh      43 -  48
      wtfa_hh      49 -  54      stratum      55 -  57
      psu          58 -  58
using "$DAT/2002/househld.dat";
replace wtia_hh = wtia_hh / 10;

* DEFINE VARIABLE LABELS;

label variable rectype  "Record Type";
label variable srvy_yr  "Processing Year";
label variable hhx      "Household Serial Number";
label variable intv_qrt "Interviewing Quarter";
label variable assignwk "Assignment Week";
label variable int_m_p  "Date of Interview - Month";
label variable int_y_p  "Date of Interview - Year";
label variable livqrt   "Type of Living Quarters";
label variable non_intv "Category of type A non-response";
label variable telenum  "Telephone number";
label variable inside   "Working phone inside home";
label variable noserv   "Without telephone service past 12 months";
label variable howlngwk "Number of weeks w/o telephone service";
label variable nowaf_hh "Armed Forces member in HH";
label variable acpt_fam "Number of families responding in HH";
label variable rej_fam  "Number of families not responding in HH";
label variable acpt_per "Number of persons responding in HH";
label variable rej_per  "Number of persons not responding in HH";
label variable acptchld "Number of children that responded in HH*";
label variable lng_intv "Language of interview";
label variable region   "Region";
label variable wtia_hh  "Weight - Interim Annual";
label variable wtfa_hh  "Weight - Final Annual";
label variable stratum  "Stratum for variance estimation";
label variable psu      "PSU for variance estimation";

* DEFINE VALUE LABELS FOR REPORTS;

label define hhp001x
   10               "10 Household"
;
label define hhp002x
   2002             "2002"
;
label define hhp004x
   1                "1 Quarter 1"
   2                "2 Quarter 2"
   3                "3 Quarter 3"
   4                "4 Quarter 4"
;
label define hhp005x
   01               "01 Week 1"
   02               "02 Week 2"
   03               "03 Week 3"
   04               "04 Week 4"
   05               "05 Week 5"
   06               "06 Week 6"
   07               "07 Week 7"
   08               "08 Week 8"
   09               "09 Week 9"
   10               "10 Week 10"
   11               "11 Week 11"
   12               "12 Week 12"
   13               "13 Week 13"
;
label define hhp008x
   01               "01 House, apartment, flat, condo"
   02               "02 HU in nontransient hotel, motel"
   03               "03 HU-permanent in transient hotel, motel"
   04               "04 HU in rooming house"
   05               "05 Mobile home/trailer w/no permanent rooms added"
   06               "06 Mobile home/trailer w/1+ permanent rooms added"
   07               "07 HU not specified above"
   08               "08 Quarters not HU in room or board house"
   09               "09 Unit not permanent-transient hotel, motel"
   10               "10 Unoccupied site for mobile home/trailer/tent"
   11               "11 Student quarters in college dormitory"
   12               "12 Group quarter unit not specified above"
   98               "98 Not ascertained"
;
label define hhp009x
   1                "1 Refused"
   2                "2 No one home - repeated calls"
   3                "3 Temporarily absent"
   4                "4 Language problem"
   5                "5 Other"
;
label define hhp010x
   1                "1 Gave a telephone number"
   2                "2 No telephone service"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define hhp011x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define hhp013x
   00               "00 One week or less"
   01               "01 More than one week, up to two weeks"
   02               "02 More than two weeks, up to three weeks"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define hhp014x
   1                "1 Armed Forces member in HH"
   2                "2 No Armed Forces member in HH*"
;
label define hhp020x
   1                "1 English"
   2                "2 Spanish"
   3                "3 English and Spanish"
   4                "4 Other"
   8                "8 Not ascertained"
;
label define hhp021x
   1                "1 Northeast"
   2                "2 Midwest"
   3                "3 South"
   4                "4 West"
;

* ASSOCIATE VARIABLES WITH LABEL DEFINITIONS;

label values rectype   hhp001x;   label values srvy_yr   hhp002x;
label values intv_qrt  hhp004x;   label values assignwk  hhp005x;
label values livqrt    hhp008x;   label values non_intv  hhp009x;
label values telenum   hhp010x;   label values inside    hhp011x;
label values noserv    hhp011x;   label values howlngwk  hhp013x;
label values nowaf_hh  hhp014x;   label values lng_intv  hhp020x;
label values region    hhp021x;

save "$OUT/2002/househld.dta", replace;

#delimit cr
log close
