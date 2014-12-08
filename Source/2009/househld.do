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
  str hhx           7 -  12      intv_qrt     13 -  13
      assignwk     14 -  15      wtia_hh      16 -  21
      wtfa_hh      22 -  27

      livqrt       28 -  29

      non_intv     30 -  30      acpt_fam     31 -  32
      rej_fam      33 -  34      acpt_per     35 -  36
      rej_per      37 -  38      acptchld     39 -  40

      region       41 -  41      strat_p      42 -  44
      psu_p        45 -  46

using "$DAT/2009/househld.dat";
replace wtia_hh = wtia_hh/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "IDN.000_02.000: Processing Year";
label variable hhx      "IDN.000_04.000: Household Serial Number";
label variable intv_qrt "IDN.000_25.000: Interview Quarter";
label variable assignwk "IDN.000_30.000: Assignment Week";
label variable wtia_hh  "IDN.000_65.000: Weight - Interim Annual";
label variable wtfa_hh  "IDN.000_70.000: Weight - Final Annual";

label variable livqrt   "COV.260_00.000: Type of Living Quarters";

label variable non_intv "MHH.000_00.000: Category of type A non-response";
label variable acpt_fam "MHH.000_00.000: Number of families in HH responding";
label variable rej_fam  "MHH.000_00.000: Number of families in HH not responding
";
label variable acpt_per "MHH.000_00.000: Number of persons in HH responding";
label variable rej_per  "MHH.000_00.000: Number of persons in HH not responding
";
label variable acptchld "MHH.000_00.000: Number of children in HH that responded
";

label variable region   "UCF.000_00.000: Region";
label variable strat_p  "
UCF.000_00.000: Pseudo-stratum for public use file variance estimation";
label variable psu_p    "
UCF.000_00.000: Pseudo-PSU for public use file variance estimation";

* DEFINE VALUE LABELS FOR REPORTS;

label define hhp001x
   10       "10 Household"
   20       "20 Person"
   25       "25 Income Imputation"
   30       "30 Sample Adult"
   40       "40 Sample Child"
   60       "60 Family"
   63       "63 Disability Questions Tests 2008/2009"
   65       "65 Paradata"
   70       "70 Injury/Poisoning Episode"
   75       "75 Injury/Poisoning Verbatim"
;
label define hhp004x
   1        "1 Quarter 1"
   2        "2 Quarter 2"
   3        "3 Quarter 3"
   4        "4 Quarter 4"
;
label define hhp005x
   01       "01 Week 1"
   02       "02 Week 2"
   03       "03 Week 3"
   04       "04 Week 4"
   05       "05 Week 5"
   06       "06 Week 6"
   07       "07 Week 7"
   08       "08 Week 8"
   09       "09 Week 9"
   10       "10 Week 10"
   11       "11 Week 11"
   12       "12 Week 12"
   13       "13 Week 13"
;
label define hhp008x
   01       "01 House, apartment, flat, condo"
   02       "02 HU in nontransient hotel, motel"
   03       "03 HU-permanent in transient hotel, motel"
   04       "04 HU in rooming house"
   05       "05 Mobile home/trailer w/no permanent rooms added"
   06       "06 Mobile home/trailer w/1+ permanent rooms added"
   07       "07 HU not specified above"
   08       "08 Quarters not HU in room or board house"
   09       "09 Unit not permanent-transient hotel, motel"
   10       "10 Unoccupied site for mobile home/trailer/tent"
   11       "11 Student quarters in college dormitory"
   12       "12 Group quarter unit not specified above"
   98       "98 Not ascertained"
;
label define hhp009x
   1        "1 Refused"
   2        "2 No one home - repeated calls"
   3        "3 Temporarily absent"
   4        "4 Language problem"
   5        "5 Other"
;
label define hhp015x
   1        "1 Northeast"
   2        "2 Midwest"
   3        "3 South"
   4        "4 West"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   hhp001x;   label values intv_qrt  hhp004x;
label values assignwk  hhp005x;
label values livqrt    hhp008x;
label values non_intv  hhp009x;
label values region    hhp015x;

save "$OUT/2009/househld", replace;

#delimit cr
log close
