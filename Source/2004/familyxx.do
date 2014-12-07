global DAT "~/database/NHIS/Data/raw/2004"
global OUT "~/database/NHIS/Data/dta/2004"
global LOG "~/database/NHIS/Log"

log using "$LOG/familyxx.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 JULY 21, 2005  9:52 AM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2004 NHIS Public Use Family ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE FAMILYXX.DTA AND FAMILYXX.LOG
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2004\

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
      wtfa_fam     15 -  20

      fint_y_p     21 -  24      fint_m_p     25 -  26

      teln_flg     27 -  27      inside       28 -  28
      noserv       29 -  29      howlngwk     30 -  31

      telcel       32 -  32      wrkcel       33 -  34
      vcelnum      35 -  35      curwrk       36 -  36
      telh_flg     37 -  37      teldirc      38 -  38
      rnoserv      39 -  39

      flngintv     40 -  40

      fm_size      41 -  42      fm_kids      43 -  44
      fm_eldr      45 -  46      fm_type      47 -  47
      fm_strp      48 -  49      fm_educ1     50 -  51

      fchlmyn      52 -  52      fchlmct      53 -  54
      fspedyn      55 -  55      fspedct      56 -  57
      flaadlyn     58 -  58      flaadlct     59 -  60
      fliadlyn     61 -  61      fliadlct     62 -  63
      fwklimyn     64 -  64      fwklimct     65 -  66
      fwalkyn      67 -  67      fwalkct      68 -  69
      frememyn     70 -  70      frememct     71 -  72
      fanylyn      73 -  73      fanylct      74 -  75
      fhstatex     76 -  77      fhstatvg     78 -  79
      fhstatg      80 -  81      fhstatfr     82 -  83
      fhstatpr     84 -  85

      fdmedyn      86 -  86      fdmedct      87 -  88
      fnmedyn      89 -  89      fnmedct      90 -  91
      fhospyn      92 -  92      fhospct      93 -  94
      fhchmyn      95 -  95      fhchmct      96 -  97
      fhcphryn     98 -  98      fhcphrct     99 - 100
      fhcdvyn     101 - 101      fhcdvct     102 - 103
      f10dvyn     104 - 104      f10dvct     105 - 106

      fhdstct     107 - 108      fdglwct1    109 - 110
      fdglwct2    111 - 112      fwrklwct    113 - 114

      fsalyn      115 - 115      fsalct      116 - 117
      fseincyn    118 - 118      fseincct    119 - 120
      fssrryn     121 - 121      fssrrct     122 - 123
      fpensyn     124 - 124      fpensct     125 - 126
      fopensyn    127 - 127      fopensct    128 - 129
      fssiyn      130 - 130      fssict      131 - 132
      ftanfyn     133 - 133      ftanfct     134 - 135
      fowbenyn    136 - 136      fowbenct    137 - 138
      fintr1yn    139 - 139      fintr1ct    140 - 141
      fdivdyn     142 - 142      fdivdct     143 - 144
      fchspyn     145 - 145      fchspct     146 - 147
      fincotyn    148 - 148      fincotct    149 - 150
      incgrp      151 - 152      rat_cat     153 - 154
      houseown    155 - 155      fgah        156 - 156
      fssaplyn    157 - 157      fssaplct    158 - 159
      fsdaplyn    160 - 160      fsdaplct    161 - 162
      ffdstyn     163 - 163      ffdstct     164 - 165
      fwicyn      166 - 166      fwicct      167 - 168

using $DAT/familyxx.dat;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: HH identifier";
label variable fmx      "IDN.000_35.000: Family #";
label variable wtfa_fam "IDN.000_70.000: Weight - Final Annual";

label variable fint_y_p "FRT.010_02.000.R01: Date of Interview - Year";
label variable fint_m_p "FRT.010_02.000.R02: Date of Interview - Month";

label variable teln_flg "COV.330_01.000.R01: Supplied telephone number";
label variable inside   "COV.340_00.000: Working phone inside home";
label variable noserv   "
COV.380_00.000: Without telephone service past 12 months";
label variable howlngwk "
COV.390_00.000.R01: Number of weeks w/o telephone service";

label variable telcel   "REC.131_00.000: Have a working cellular telephone?";
label variable wrkcel   "REC.132_00.000: Number of working cell phones";
label variable vcelnum  "REC.133_00.000: Is this your cell phone number";
label variable curwrk   "REC.134_00.000: Working phone inside home";
label variable telh_flg "REC.135_01.000: Telephone number";
label variable teldirc  "REC.136_00.000: Number mentioned/listed in directory";
label variable rnoserv  "
REC.141_00.000: Without telephone service past 12 months";

label variable flngintv "BCK.045_00.000: Language of Interview";

label variable fm_size  "MFM.000_00.000.R02: Size of family";
label variable fm_kids  "
MFM.000_00.000.R03: # family members under 18 years of age";
label variable fm_eldr  "MFM.000_00.000.R04: # family members aged 65 and older
";
label variable fm_type  "MFM.000_00.000.R05: Family type";
label variable fm_strp  "MFM.000_00.000.R08: Family Structure";
label variable fm_educ1 "
MFM.000_00.000.R10: Education of adult with highest education in family";

label variable fchlmyn  "
FHS.005_00.000.R01: Any kids under age 5 in fam w/play lim?";
label variable fchlmct  "
FHS.005_00.000.R02: # kids under age 5 in fam w/play lim";
label variable fspedyn  "
FHS.050_00.000.R01: Any children in fam rec Spec Ed/EIS?";
label variable fspedct  "FHS.050_00.000.R02: # children in fam rec Spec Ed/EIS";
label variable flaadlyn "
FHS.070_00.000.R01: Does any fam member need help w/ADL?";
label variable flaadlct "FHS.070_00.000.R02: # fam members needing help w/ADL";
label variable fliadlyn "
FHS.150_00.000.R01: Any fam member need help w/chores, etc.?";
label variable fliadlct "
FHS.150_00.000.R02: # fam members need help w/chores, etc.";
label variable fwklimyn "
FHS.190_00.000.R01: Anyone with work lim due to hlth prob?";
label variable fwklimct "FHS.190_00.000.R02: # fam members w/ work lim (hlth)";
label variable fwalkyn  "
FHS.210_00.000.R01: Any members have dif walking w/o equip?";
label variable fwalkct  "
FHS.210_00.000.R02: # fam members having dif walk w/o equip";
label variable frememyn "
FHS.230_00.000.R01: Any member limited by dif remembering?";
label variable frememct "FHS.230_00.000.R02: # fam members w/ dif remembering";
label variable fanylyn  "
FHS.250_00.000.R01: Is any fam member limited in ANY WAY?";
label variable fanylct  "
FHS.250_00.000.R02: Number of fam members w/ ANY limitation";
label variable fhstatex "FHS.250_00.000.R03: # fam members in excellent health";
label variable fhstatvg "
FHS.250_00.000.R04: # family members in very good health";
label variable fhstatg  "FHS.250_00.000.R05: # family members in good health";
label variable fhstatfr "FHS.250_00.000.R06: # family members in fair health";
label variable fhstatpr "FHS.250_00.000.R07: # family members in poor health";

label variable fdmedyn  "
FAU.010_00.000.R01: Any family member delay* medical care, 12m?";
label variable fdmedct  "
FAU.010_00.000.R02: # of family members for whom medical care was delayed* 12m";
label variable fnmedyn  "
FAU.030_00.000.R01: Any family member need and not get medical care* 12m?";
label variable fnmedct  "
FAU.030_00.000.R02: # of family members who needed and did not get medical care*
 12m";
label variable fhospyn  "
FAU.050_00.000.R01: Any family member in hospital overnight, 12m?";
label variable fhospct  "
FAU.050_00.000.R02: # of family members in hospital overnight, 12m";
label variable fhchmyn  "
FAU.120_00.000.R01: Any family member receive home care*, 2 wk?";
label variable fhchmct  "
FAU.120_00.000.R02: # of family members who received home care*, 2 wk";
label variable fhcphryn "
FAU.150_00.000.R01: Any family member get advice/test results over the phone, 2w
k?";
label variable fhcphrct "
FAU.150_00.000.R02: # of family members who got advice/test results over the pho
ne, 2 wk";
label variable fhcdvyn  "
FAU.180_00.000.R01: Any family member have an office visit, etc. 2 wk";
label variable fhcdvct  "
FAU.180_00.000.R02: # of family members who had an office visit, etc. 2 wk";
label variable f10dvyn  "
FAU.210_00.000.R01: Any family member receive care 10+ times, 12m?";
label variable f10dvct  "
FAU.210_00.000.R02: # of family members who received care 10+ times, 12m";

label variable fhdstct  "FSD.007_00.000.R01: # of children le 17 in Head Start";
label variable fdglwct1 "FSD.050_00.000.R01: # fam members working last week";
label variable fdglwct2 "
FSD.050_00.000.R02: # fam members looking for work last week";
label variable fwrklwct "
FSD.070_00.000.R01: # fam members work full time last week";

label variable fsalyn   "
FIN.040_00.000.R01: Any family member received income from wages/salary";
label variable fsalct   "
FIN.040_00.000.R02: # family members received income from wages/salary";
label variable fseincyn "
FIN.060_00.000.R01: Any family member received income from self-employment";
label variable fseincct "
FIN.060_00.000.R02: # family members received income from self-employment";
label variable fssrryn  "
FIN.080_00.000.R01: Any family member received Social Security or Railroad Retir
ement";
label variable fssrrct  "
FIN.080_00.000.R02: # family members received Social Security or Railroad Retire
ment";
label variable fpensyn  "
FIN.100_00.000.R01: Any family members receive disability pensions*";
label variable fpensct  "
FIN.100_00.000.R02: # family members receive disability pensions*";
label variable fopensyn "
FIN.104_00.000.R01: Any family member received other survivor or retirement pens
ions";
label variable fopensct "
FIN.104_00.000.R02: # family members received other survivor or retirement pensi
on";
label variable fssiyn   "
FIN.120_00.000.R01: Any family member receive income from SSI";
label variable fssict   "
FIN.120_00.000.R02: # of family members receive income from SSI";
label variable ftanfyn  "
FIN.160_00.000.R01: Any family member receive income from Welfare/TANF";
label variable ftanfct  "
FIN.160_00.000.R02: # of family members receive income from Welfare/TANF";
label variable fowbenyn "
FIN.166_00.000.R01: Any family member receive income from other Welfare programs
";
label variable fowbenct "
FIN.166_00.000.R02: # of family members receive income from other Welfare progra
ms";
label variable fintr1yn "
FIN.180_00.000.R01: Anyone have money . . .that earned interest";
label variable fintr1ct "
FIN.180_00.000.R02: # of family members w/ money earning interest";
label variable fdivdyn  "
FIN.200_00.000.R01: Any family member receive dividends from stocks, etc.";
label variable fdivdct  "
FIN.200_00.000.R02: # of  family members receive dividends from stocks, etc.";
label variable fchspyn  "
FIN.220_00.000.R01: Any fam member rec child support inc?";
label variable fchspct  "
FIN.220_00.000.R02: Any fam member rec child support inc?";
label variable fincotyn "
FIN.240_00.000.R01: Any fam member rec inc from otr source?";
label variable fincotct "
FIN.240_00.000.R02: Any fam member rec inc from otr source?";
label variable incgrp   "
FIN.270_00.000.R01: Total combined family income (grouped)";
label variable rat_cat  "
FIN.270_00.000.R02: Ratio of fam inc to poverty threshold";
label variable houseown "FIN.280_00.000: Home tenure status";
label variable fgah     "FIN.282_00.000: Paying lower rent due to gov't program
";
label variable fssaplyn "
FIN.310_00.000.R01: Any fam member EVER applied for SSI?";
label variable fssaplct "FIN.310_00.000.R02: # fam members EVER applied for SSI
";
label variable fsdaplyn "
FIN.340_00.000.R01: Any fam member EVER applied for SSDI?";
label variable fsdaplct "FIN.340_00.000.R02: # fam members EVER applied for SSDI
";
label variable ffdstyn  "
FIN.370_00.000.R01: Any fam member auth to rec food stamps?";
label variable ffdstct  "
FIN.370_00.000.R02: # fam members auth to rec food stamps";
label variable fwicyn   "FIN.385_00.000.R01: Any fam member rec WIC benefits?";
label variable fwicct   "FIN.385_00.000.R02: # fam members rec WIC benefits";

* DEFINE VALUE LABELS FOR REPORTS;

label define fap001x
   10               "10 Household"
   20               "20 Person"
   30               "30 Sample Adult"
   40               "40 Sample Child"
   60               "60 Family"
   70               "70 Injury/Poisoning Episode"
   75               "75 Injury/Poisoning Verbatim"
;
label define fap002x
   2004             "2004"
;
label define fap006x
   2004             "2004 Year 2004"
   2005             "2005 Year 2005"
   9998             "9998 Not ascertained"
;
label define fap007x
   01               "01 January"
   02               "02 February"
   03               "03 March"
   04               "04 April"
   05               "05 May"
   06               "06 June"
   07               "07 July"
   08               "08 August"
   09               "09 September"
   10               "10 October"
   11               "11 November"
   12               "12 December"
   98               "98 Not ascertained"
;
label define fap008x
   1                "1 Gave telephone number"
   2                "2 No telephone"
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
label define fap011x
   00               "00 One week or less"
   01               "01 More than one week, up to two weeks"
   02               "02 More than two weeks, up to three weeks"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define fap013x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define fap016x
   1                "1 Gave telephone number"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define fap019x
   1                "1 English"
   2                "2 Spanish"
   3                "3 English and Spanish"
   4                "4 Other"
   8                "8 Not ascertained"
;
label define fap023x
   1                "1 One adult, no child(ren) under 18"
   2                "2 Multiple adults, no child(ren) under 18"
   3                "3 One adult, 1+ child(ren) under 18"
   4                "4 Multiple adults, 1+ child(ren) under 18"
   9                "9 Unknown"
;
label define fap024x
   11               "11 Living alone"
   12               "12 Living with roommate(s)"
   21               "21 Married couple"
   22               "22 Unmarried couple"
   23               "23 All other adult-only families"
   31               "31 Mother and biological or non-biological child(ren) only"
   32               "32 Father and biological or non-biological child(ren) only"
   33               "33 All other single-adult and child(ren) families"
   41               "41 Married parents with biological/adoptive child(ren) only
"
   42               "42 Cohabiting parent(s) with child(ren) only"
   43               "
43 Parent (biological or adoptive), step parent, and child(ren) only"
   44               "
44 At least 1 (biological or adoptive) parent and 1+ child(ren), and o"
   45               "
45 Other related and/or unrelated adults, 1+ child(ren), no biological"
   99               "99 Unknown"
;
label define fap025x
   01               "01 Less/equal to 8th grade"
   02               "02 9-12th grade, no high school diploma"
   03               "03 GED recipient"
   04               "04 High school graduate"
   05               "05 Some college, no degree"
   06               "06 AA degree, technical or vocational"
   07               "07 AA degree, academic program"
   08               "08 Bachelor's degree (BA, BS, AB, BBA)"
   09               "09 Master's, professional, or doctoral degree"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define fap089x
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
label define fap090x
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
label define fap091x
   1                "1 Owned or being bought"
   2                "2 Rented"
   3                "3 Other arrangement"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   fap001x;   label values srvy_yr   fap002x;

label values fint_y_p  fap006x;   label values fint_m_p  fap007x;

label values teln_flg  fap008x;   label values inside    fap009x;
label values noserv    fap009x;   label values howlngwk  fap011x;

label values telcel    fap009x;   label values wrkcel    fap013x;
label values vcelnum   fap009x;   label values curwrk    fap009x;
label values telh_flg  fap016x;   label values teldirc   fap009x;
label values rnoserv   fap009x;

label values flngintv  fap019x;

label values fm_type   fap023x;   label values fm_strp   fap024x;
label values fm_educ1  fap025x;

label values fchlmyn   fap009x;   label values fspedyn   fap009x;
label values flaadlyn  fap009x;   label values fliadlyn  fap009x;
label values fwklimyn  fap009x;   label values fwalkyn   fap009x;
label values frememyn  fap009x;   label values fanylyn   fap009x;

label values fdmedyn   fap009x;   label values fnmedyn   fap009x;
label values fhospyn   fap009x;   label values fhchmyn   fap009x;
label values fhcphryn  fap009x;   label values fhcdvyn   fap009x;
label values f10dvyn   fap009x;



label values fsalyn    fap009x;   label values fseincyn  fap009x;
label values fssrryn   fap009x;   label values fpensyn   fap009x;
label values fopensyn  fap009x;   label values fssiyn    fap009x;
label values ftanfyn   fap009x;   label values fowbenyn  fap009x;
label values fintr1yn  fap009x;   label values fdivdyn   fap009x;
label values fchspyn   fap009x;   label values fincotyn  fap009x;
label values incgrp    fap089x;   label values rat_cat   fap090x;
label values houseown  fap091x;   label values fgah      fap009x;
label values fssaplyn  fap009x;   label values fsdaplyn  fap009x;
label values ffdstyn   fap009x;   label values fwicyn    fap009x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_fam];
save $OUT/familyxx, replace;

#delimit cr

* data file is stored in familyxx.dta
* log  file is stored in familyxx.log

log close
