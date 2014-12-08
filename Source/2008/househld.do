log using "$LOG/househld.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 JUNE 8, 2009 11:53 AM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2008 NHIS Public Use Household ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE househld.dta AND househld.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2008\

 THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
 LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
 USER SHOULD ENTER THE FOLLOWING STATA COMMAND: log close
 
 THIS IS STORED IN househld.do
*********************************************************************;
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

using "$DAT/2008/househld.dat";
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
label variable acpt_fam "MHH.000_00.000: Number of families responding in HH";
label variable rej_fam  "MHH.000_00.000: Number of families not responding in HH
";
label variable acpt_per "MHH.000_00.000: Number of persons responding in HH";
label variable rej_per  "MHH.000_00.000: Number of persons not responding in HH
";
label variable acptchld "MHH.000_00.000: Number of children that responded in HH
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
   30       "30 Sample Adult"
   31       "31 Sample Adult Cancer"
   40       "40 Sample Child"
   60       "60 Family"
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

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_hh];
save "$OUT/2008/househld", replace;

#delimit cr

* data file is stored in househld.dta
* log  file is stored in househld.log

log close
