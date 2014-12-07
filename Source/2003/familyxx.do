log using "$LOG/familyxx.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 NOVEMBER 10, 2004  5:20 PM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2003 NHIS PUBLIC USE FAMILYXX.DAT ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE FAMILYXX.DTA AND FAMILYXX.LOG
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2003\

 THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
 LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
 USER SHOULD ENTER THE FOLLOWING STATA COMMAND: log close
 
 THIS IS STORED IN FAMILYXX.DO
*********************************************************************;
clear;
set mem 200m;

* INPUT ALL VARIABLES;
infix
      rectype       1 -   2      srvy_yr       3 -   6
 str  hhx           7 -  12 str  fmx          13 -  14
      intv_qrt     15 -  15      assignwk     16 -  17
      livqrt       18 -  19      telenum      20 -  20
      inside       21 -  21      telcel       22 -  22
      wrkcel       23 -  24      vcelnum      25 -  25
      curwrk       26 -  26      telhome      27 -  27
      teldirc      28 -  28      rnoserv      29 -  29
      acpt_fam     30 -  31      rej_fam      32 -  33
      fm_size      34 -  35      lng_intv     36 -  36
      region       37 -  37      wtfa_fam     38 -  43
      stratum      44 -  46      psu          47 -  47
      fchlmyn      48 -  48      fchlmct      49 -  50
      fspedyn      51 -  51      fspedct      52 -  53
      flaadlyn     54 -  54      flaadlct     55 -  56
      fliadlyn     57 -  57      fliadlct     58 -  59
      fwklimyn     60 -  60      fwklimct     61 -  62
      fwalkyn      63 -  63      fwalkct      64 -  65
      frememyn     66 -  66      frememct     67 -  68
      fanylyn      69 -  69      fanylct      70 -  71
      fhstatex     72 -  73      fhstatvg     74 -  75
      fhstatg      76 -  77      fhstatfr     78 -  79
      fhstatpr     80 -  81      fdmedyn      82 -  82
      fdmedct      83 -  84      fnmedyn      85 -  85
      fnmedct      86 -  87      fhospyn      88 -  88
      fhospct      89 -  90      fhchmyn      91 -  91
      fhchmct      92 -  93      fhcphryn     94 -  94
      fhcphrct     95 -  96      fhcdvyn      97 -  97
      fhcdvct      98 -  99      f10dvyn     100 - 100
      f10dvct     101 - 102      fhicovyn    103 - 103
      fhicovct    104 - 105      fhiprvct    106 - 107
      fhisinct    108 - 109      fhicarct    110 - 111
      fhicadct    112 - 113      fhichpct    114 - 115
      fhimilct    116 - 117      fhiihsct    118 - 119
      fhipubct    120 - 121      fhiogvct    122 - 123
      fhicost     124 - 124      fhdstct     125 - 126
      fdglwct1    127 - 128      fdglwct2    129 - 130
      fwrklwct    131 - 132      fsalyn      133 - 133
      fsalct      134 - 135      fseincyn    136 - 136
      fseincct    137 - 138      fssrryn     139 - 139
      fssrrct     140 - 141      fpensyn     142 - 142
      fpensct     143 - 144      fopensyn    145 - 145
      fopensct    146 - 147      fssiyn      148 - 148
      fssict      149 - 150      ftanfyn     151 - 151
      ftanfct     152 - 153      fowbenyn    154 - 154
      fowbenct    155 - 156      fintr1yn    157 - 157
      fintr1ct    158 - 159      fdivdyn     160 - 160
      fdivdct     161 - 162      fchspyn     163 - 163
      fchspct     164 - 165      fincotyn    166 - 166
      fincotct    167 - 168      fincgrp     169 - 170
      frat_cat    171 - 172      fhouse      173 - 173
      fssaplyn    174 - 174      fssaplct    175 - 176
      fsdaplyn    177 - 177      fsdaplct    178 - 179
      ffdstyn     180 - 180      ffdstct     181 - 182
      fwicyn      183 - 183      fwicct      184 - 185
      fwicyn2     186 - 186      fm_kids     187 - 188
      fm_eldr     189 - 190      fmtype      191 - 191
      fmstrct2    192 - 193      fmstr2      194 - 195
      fm_educ     196 - 197      fm_resp     198 - 199
using "$DAT/2002/familyxx.dat";

* DEFINE VARIABLE LABELS;

label variable rectype  "Record Type";
label variable srvy_yr  "Survey Year";
label variable hhx      "Household Serial Number";
label variable fmx      "Family Serial Number";
label variable intv_qrt "Interview Quarter";
label variable assignwk "Assignment Week";
label variable livqrt   "Type of Living Quarters";
label variable telenum  "Supplied telephone number";
label variable inside   "Working phone inside home";
label variable telcel   "Have a working cellular telephone?";
label variable wrkcel   "Number of working cell phones";
label variable vcelnum  "Is this your cell phone number";
label variable curwrk   "Working phone inside home";
label variable telhome  "Telephone number";
label variable teldirc  "Number mentioned/listed in directory";
label variable rnoserv  "Without telephone service past 12 months";
label variable acpt_fam "Number of families responding in HH";
label variable rej_fam  "Number of families not responding in HH";
label variable fm_size  "Size of family";
label variable lng_intv "Language of interview";
label variable region   "Region";
label variable wtfa_fam "Weight - Final Annual";
label variable stratum  "Stratum for variance estimation";
label variable psu      "PSU for variance estimation";
label variable fchlmyn  "Any kids under age 5 in fam w/play lim?";
label variable fchlmct  "# kids under age 5 in fam w/play lim";
label variable fspedyn  "Any children in fam rec Spec Ed/EIS?";
label variable fspedct  "# children in fam rec Spec Ed/EIS";
label variable flaadlyn "Does any fam member need help w/ADL?";
label variable flaadlct "# fam members needing help w/ADL";
label variable fliadlyn "Any fam member need help w/chores, etc.?";
label variable fliadlct "# fam members need help w/chores, etc.";
label variable fwklimyn "Anyone with work lim due to hlth prob?";
label variable fwklimct "# fam members w/ work lim (hlth)";
label variable fwalkyn  "Any members have dif walking w/o equip?";
label variable fwalkct  "# fam members having dif walk w/o equip";
label variable frememyn "Any member limited by dif remembering?";
label variable frememct "# fam members w/ dif remembering";
label variable fanylyn  "Is any fam member limited in ANY WAY?";
label variable fanylct  "Number of fam members w/ ANY limitation";
label variable fhstatex "# fam members in excellent health";
label variable fhstatvg "# fam members in very good health";
label variable fhstatg  "# fam members in good health";
label variable fhstatfr "# fam members in fair health";
label variable fhstatpr "# fam members in poor health";
label variable fdmedyn  "Any fam member delay* med care, 12m?";
label variable fdmedct  "# fam mem for whom med care delayed* 12m";
label variable fnmedyn  "Any fam mem need+not get med care* 12m?";
label variable fnmedct  "# fam members need+not get med care* 12m";
label variable fhospyn  "Any fam member in hosp overnight, 12m?";
label variable fhospct  "# fam members in hosp overnight, 12m";
label variable fhchmyn  "Any fam member rec home care*, 2 wk?";
label variable fhchmct  "# fam members rec home care*, 2 wk";
label variable fhcphryn "Any fam mem get adv/test results, 2wk?";
label variable fhcphrct "# fam mem got adv/test results, 2 wk";
label variable fhcdvyn  "Any fam mem have office visit, etc. 2 wk";
label variable fhcdvct  "# fam mem have office visit, etc. 2 wk";
label variable f10dvyn  "Any fam member rec care 10+ times, 12m?";
label variable f10dvct  "# fam members rec care 10+ times, 12m";
label variable fhicovyn "Any fam member have hlth ins coverage?";
label variable fhicovct "# fam members with hlth ins coverage";
label variable fhiprvct "# fam members w/ PRIVATE hlth ins";
label variable fhisinct "# fam members w/ SINGLE service plans";
label variable fhicarct "# fam members w/ MEDICARE";
label variable fhicadct "# fam members w/ MEDICAID";
label variable fhichpct "# fam members w/ CHIP";
label variable fhimilct "# fam members w/ MILITARY hlth ins";
label variable fhiihsct "# fam members w/ IHS";
label variable fhipubct "# fam members w/ oth state-spon hlth pln";
label variable fhiogvct "# fam members w/ other govt hlth pln";
label variable fhicost  "Cost of fam med/dental care, past 12 m";
label variable fhdstct  "# of children le 17 in Head Start";
label variable fdglwct1 "# fam members working last week";
label variable fdglwct2 "# fam members looking for work last week";
label variable fwrklwct "# fam members work full time last week";
label variable fsalyn   "Any fam member rec inc from wages/sal?";
label variable fsalct   "# fam members rec inc from wage/sal";
label variable fseincyn "Any fam member rec inc from self-emp?";
label variable fseincct "# fam members rec inc from self-emp";
label variable fssrryn  "Any fam member rec Soc Sec or RR ret?";
label variable fssrrct  "# fam members rec Soc Sec or RR ret";
label variable fpensyn  "Any fam member rec disab pensions*?";
label variable fpensct  "# of fam members rec disab pensions*";
label variable fopensyn "Any fam member rec otr surv or ret pens?";
label variable fopensct "# fam members rec otr surv or ret pens";
label variable fssiyn   "Any fam member rec inc from SSI?";
label variable fssict   "# fam members rec inc from SSI";
label variable ftanfyn  "Any fam member rec inc from Wel/TANF?";
label variable ftanfct  "# of fam members rec inc from Wel/TANF";
label variable fowbenyn "Any fam mem rec inc fr othr Welfare pgm?";
label variable fowbenct "# of fam mem rec inc fr otr Welfare pgms";
label variable fintr1yn "Anyone have money...that earned interest";
label variable fintr1ct "# fam members w/ money earn interest";
label variable fdivdyn  "Any fam member rec div from stocks, etc.";
label variable fdivdct  "# fam members rec div from stocks, etc.";
label variable fchspyn  "Any fam member rec child support inc?";
label variable fchspct  "# fam members rec child support inc";
label variable fincotyn "Any fam member rec inc from otr source?";
label variable fincotct "# fam members rec inc from otr source";
label variable fincgrp  "Total combined family income (grouped)";
label variable frat_cat "Ratio of fam inc to poverty threshold";
label variable fhouse   "Family's home tenure status";
label variable fssaplyn "Any fam member EVER applied for SSI?";
label variable fssaplct "# fam members EVER applied for SSI";
label variable fsdaplyn "Any fam member EVER applied for SSDI?";
label variable fsdaplct "# fam members EVER applied for SSDI";
label variable ffdstyn  "Any fam member auth to rec food stamps?";
label variable ffdstct  "# fam members auth to rec food stamps";
label variable fwicyn   "Any fam member rec WIC benefits?";
label variable fwicct   "# fam members rec WIC benefits";
label variable fwicyn2  "Any fam member rec WIC benefits?";
label variable fm_kids  "# fam members under 18 years of age";
label variable fm_eldr  "# fam members aged 65 and older";
label variable fmtype   "Family Type";
label variable fmstrct2 "Family Structure";
label variable fmstr2   "Family Structure (on the person-level)";
label variable fm_educ  "Educ of adult with highest educ in fam";
label variable fm_resp  "Person number of family respondent";

* DEFINE VALUE LABELS FOR REPORTS;

label define fap001x
   60               "60 Family"
;
label define fap002x
   2003             "2003"
;
label define fap005x
   1                "1 Quarter 1"
   2                "2 Quarter 2"
   3                "3 Quarter 3"
   4                "4 Quarter 4"
;
label define fap006x
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
label define fap007x
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
label define fap008x
   1                "1 Yes (gave phone number)"
   2                "2 No (no phone service)"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define fap009x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define fap010x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define fap011x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define fap014x
   1                "1 Gave a telephone number"
   2                "2 No telephone service"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define fap020x
   1                "1 English"
   2                "2 Spanish"
   3                "3 English and Spanish"
   4                "4 Other"
   8                "8 Not ascertained"
;
label define fap021x
   1                "1 Northeast"
   2                "2 Midwest"
   3                "3 South"
   4                "4 West"
;
label define fap071x
   0                "0 Zero"
   1                "1 Less than $500"
   2                "2 $500-$1,999"
   3                "3 $2,000-$2,999"
   4                "4 $3,000-$4,999"
   5                "5 $5,000 or more"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define fap100x
   01               "01 0-$4999"
   02               "02 $5000-$9999"
   03               "03 $10000-$14999"
   04               "04 $15000-$19999"
   05               "05 $20000-$24999"
   06               "06 $25000-$34999"
   07               "07 $35000-$44999"
   08               "08 $45000-$54999"
   09               "09 $55000-$64999"
   10               "10 $65000-$74999"
   11               "11 $75000 and over"
   12               "12 $20000 or more (no detail)"
   13               "13 Less than $20000 (no detail)"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define fap101x
   01               "01 Under .50"
   02               "02 .50 to .74"
   03               "03 .75 to .99"
   04               "04 1.00 to 1.24"
   05               "05 1.25 to 1.49"
   06               "06 1.50 to 1.74"
   07               "07 1.75 to 1.99"
   08               "08 2.00 to 2.49"
   09               "09 2.50 to 2.99"
   10               "10 3.00 to 3.49"
   11               "11 3.50 to 3.99"
   12               "12 4.00 to 4.49"
   13               "13 4.50 to 4.99"
   14               "14 5.00 and over"
   96               "96 Undefinable"
   99               "99 Unknown"
;
label define fap102x
   1                "1 Owned or being bought"
   2                "2 Rented"
   3                "3 Other arrangement"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define fap111x
   1                "1 Yes - at least 1 recipient age-eligible"
   2                "2 Yes - no recipients age-eligible"
   3                "3 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define fap114x
   1                "1 One adult, no child(ren) under 18"
   2                "2 Multiple adults, no child(ren) under 18"
   3                "3 One adult, 1+ child(ren) under 18"
   4                "4 Multiple adults, 1+ child(ren) under 18"
   9                "9 Unknown"
;
label define fap117x
   01               "01 Less/equal to 8th grade"
   02               "02 9-12th grade, no high school diploma"
   03               "03 High school graduate"
   04               "04 GED recipient"
   05               "05 Some college, no degree"
   06               "06 AA degree, technical or vocational"
   07               "07 AA degree, academic program"
   08               "08 Bachelor's degree (BA, BS, AB, BBA)"
   09               "09 Master's, professional, or doctoral degree"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define fap118x
   98               "98 Not ascertained"
;

* ASSOCIATE VARIABLES WITH LABEL DEFINITIONS;

label values rectype   fap001x;   label values srvy_yr   fap002x;
label values intv_qrt  fap005x;   label values assignwk  fap006x;
label values livqrt    fap007x;   label values telenum   fap008x;
label values inside    fap009x;   label values telcel    fap010x;
label values wrkcel    fap011x;   label values vcelnum   fap009x;
label values curwrk    fap009x;   label values telhome   fap014x;
label values teldirc   fap009x;   label values rnoserv   fap010x;
label values lng_intv  fap020x;   label values region    fap021x;
label values fchlmyn   fap009x;   label values fspedyn   fap009x;
label values flaadlyn  fap010x;   label values fliadlyn  fap009x;
label values fwklimyn  fap009x;   label values fwalkyn   fap010x;
label values frememyn  fap010x;   label values fanylyn   fap010x;
label values fdmedyn   fap010x;   label values fnmedyn   fap010x;
label values fhospyn   fap010x;   label values fhchmyn   fap010x;
label values fhcphryn  fap010x;   label values fhcdvyn   fap010x;
label values f10dvyn   fap010x;   label values fhicovyn  fap010x;
label values fhicost   fap071x;   label values fsalyn    fap009x;
label values fseincyn  fap009x;   label values fssrryn   fap010x;
label values fpensyn   fap010x;   label values fopensyn  fap010x;
label values fssiyn    fap010x;   label values ftanfyn   fap010x;
label values fowbenyn  fap010x;   label values fintr1yn  fap010x;
label values fdivdyn   fap010x;   label values fchspyn   fap010x;
label values fincotyn  fap010x;   label values fincgrp   fap100x;
label values frat_cat  fap101x;   label values fhouse    fap102x;
label values fssaplyn  fap010x;   label values fsdaplyn  fap010x;
label values ffdstyn   fap010x;   label values fwicyn    fap009x;
label values fwicyn2   fap111x;   label values fmtype    fap114x;
label values fm_educ   fap117x;   label values fm_resp   fap118x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight=wtfa_fam];
save "$OUT/2002/familyxx.dta", replace;

#delimit cr

* data file is stored in familyxx.dta
* log  file is stored in familyxx.log

log close
