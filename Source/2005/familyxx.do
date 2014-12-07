global DAT "~/database/NHIS/Data/raw/2005"
global OUT "~/database/NHIS/Data/dta/2005"
global LOG "~/database/NHIS/Log"

log using "$LOG/familyxx.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 JUNE 20, 2006
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2005 NHIS Public Use Family ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE familyxx.dta AND familyxx.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2005\

 THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
 LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
 USER SHOULD ENTER THE FOLLOWING STATA COMMAND: log close
 
 THIS IS STORED IN familyxx.do
*********************************************************************;
clear;
set mem 200m;

* INPUT ALL VARIABLES;

infix
      rectype       1 -   2      srvy_yr       3 -   6
  str hhx           7 -  12  str fmx          13 -  14
      wtfa_fam     15 -  20

      fint_y_p     21 -  24      fint_m_p     25 -  26

      teln_flg     27 -  27      inside       28 -  28
      noserv       29 -  29      howlngwk     30 -  31

      telcel       32 -  32      wrkcel       33 -  34
      vcelnum      35 -  35      curwrk       36 -  36
      telh_flg     37 -  37      teldirc      38 -  38
      rnoserv      39 -  39      rh1lngdy     40 -  42
      rh2lngdy     43 -  45

      flngintv     46 -  46

      fm_size      47 -  48      fm_kids      49 -  50
      fm_eldr      51 -  52      fm_type      53 -  53
      fm_strcp     54 -  55      fm_strp      56 -  57
      fm_educ1     58 -  59

      fchlmyn      60 -  60      fchlmct      61 -  62
      fspedyn      63 -  63      fspedct      64 -  65
      flaadlyn     66 -  66      flaadlct     67 -  68
      fliadlyn     69 -  69      fliadlct     70 -  71
      fwklimyn     72 -  72      fwklimct     73 -  74
      fwalkyn      75 -  75      fwalkct      76 -  77
      frememyn     78 -  78      frememct     79 -  80
      fanylyn      81 -  81      fanylct      82 -  83
      fhstatex     84 -  85      fhstatvg     86 -  87
      fhstatg      88 -  89      fhstatfr     90 -  91
      fhstatpr     92 -  93

      fdmedyn      94 -  94      fdmedct      95 -  96
      fnmedyn      97 -  97      fnmedct      98 -  99
      fhospyn     100 - 100      fhospct     101 - 102
      fhchmyn     103 - 103      fhchmct     104 - 105
      fhcphryn    106 - 106      fhcphrct    107 - 108
      fhcdvyn     109 - 109      fhcdvct     110 - 111
      f10dvyn     112 - 112      f10dvct     113 - 114

      fhdstct     115 - 116      fdglwct1    117 - 118
      fdglwct2    119 - 120      fwrklwct    121 - 122

      fsalyn      123 - 123      fsalct      124 - 125
      fseincyn    126 - 126      fseincct    127 - 128
      fssrryn     129 - 129      fssrrct     130 - 131
      fpensyn     132 - 132      fpensct     133 - 134
      fopensyn    135 - 135      fopensct    136 - 137
      fssiyn      138 - 138      fssict      139 - 140
      ftanfyn     141 - 141      ftanfct     142 - 143
      fowbenyn    144 - 144      fowbenct    145 - 146
      fintr1yn    147 - 147      fintr1ct    148 - 149
      fdivdyn     150 - 150      fdivdct     151 - 152
      fchspyn     153 - 153      fchspct     154 - 155
      fincotyn    156 - 156      fincotct    157 - 158
      incgrp      159 - 160      rat_cat     161 - 162
      houseown    163 - 163      fgah        164 - 164
      fssaplyn    165 - 165      fssaplct    166 - 167
      fsdaplyn    168 - 168      fsdaplct    169 - 170
      ffdstyn     171 - 171      ffdstct     172 - 173
      fwicyn      174 - 174      fwicct      175 - 176

using $DAT/familyxx.dat;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: HH identifier";
label variable fmx      "IDN.000_35.000: Family #";
label variable wtfa_fam "IDN.000_70.000: Weight - Final Annual";

label variable fint_y_p "FRT.010_02.000: Date of Interview - Year";
label variable fint_m_p "FRT.010_02.000: Date of Interview - Month";

label variable teln_flg "COV.330_01.000: Supplied telephone number";
label variable inside   "COV.340_00.000: Working phone inside home";
label variable noserv   "
COV.380_00.000: Without telephone service past 12 months";
label variable howlngwk "COV.390_00.000: Number of weeks w/o telephone service";

label variable telcel   "REC.131_00.000: Have a working cellular telephone?";
label variable wrkcel   "REC.132_00.000: Number of working cell phones";
label variable vcelnum  "REC.133_00.000: Is this your cell phone number";
label variable curwrk   "REC.134_00.000: Working phone inside home";
label variable telh_flg "REC.135_01.000: Telephone number";
label variable teldirc  "REC.136_00.000: Number mentioned/listed in directory";
label variable rnoserv  "
REC.141_00.000: Without telephone service past 12 months";
label variable rh1lngdy "
REC.142_00.000: Number of days without phone service (noncellular)";
label variable rh2lngdy "
REC.143_00.000: Number of days without phone service (noncellular) due to weathe
r/other natural disa";

label variable flngintv "BCK.045_00.000: Language of Interview";

label variable fm_size  "MFM.000_00.000: Size of family";
label variable fm_kids  "MFM.000_00.000: # family members under 18 years of age
";
label variable fm_eldr  "MFM.000_00.000: # family members aged 65 and older";
label variable fm_type  "MFM.000_00.000: Family type";
label variable fm_strcp "MFM.000_00.000: Family Structure";
label variable fm_strp  "MFM.000_00.000: Family Structure";
label variable fm_educ1 "
MFM.000_00.000: Education of adult with highest education in family";

label variable fchlmyn  "FHS.005_00.000: Any kids under age 5 in fam w/play lim?
";
label variable fchlmct  "FHS.005_00.000: # kids under age 5 in fam w/play lim";
label variable fspedyn  "FHS.050_00.000: Any children in fam rec Spec Ed/EIS?";
label variable fspedct  "FHS.050_00.000: # children in fam rec Spec Ed/EIS";
label variable flaadlyn "FHS.070_00.000: Does any fam member need help w/ADL?";
label variable flaadlct "FHS.070_00.000: # fam members needing help w/ADL";
label variable fliadlyn "
FHS.150_00.000: Any fam member need help w/chores, etc.?";
label variable fliadlct "FHS.150_00.000: # fam members need help w/chores, etc.
";
label variable fwklimyn "FHS.190_00.000: Anyone with work lim due to hlth prob?
";
label variable fwklimct "FHS.190_00.000: # fam members w/ work lim (hlth)";
label variable fwalkyn  "FHS.210_00.000: Any members have dif walking w/o equip?
";
label variable fwalkct  "FHS.210_00.000: # fam members having dif walk w/o equip
";
label variable frememyn "FHS.230_00.000: Any member limited by dif remembering?
";
label variable frememct "FHS.230_00.000: # fam members w/ dif remembering";
label variable fanylyn  "FHS.250_00.000: Is any fam member limited in ANY WAY?";
label variable fanylct  "FHS.250_00.000: Number of fam members w/ ANY limitation
";
label variable fhstatex "FHS.250_00.000: # fam members in excellent health";
label variable fhstatvg "FHS.250_00.000: # family members in very good health";
label variable fhstatg  "FHS.250_00.000: # family members in good health";
label variable fhstatfr "FHS.250_00.000: # family members in fair health";
label variable fhstatpr "FHS.250_00.000: # family members in poor health";

label variable fdmedyn  "
FAU.010_00.000: Any family member delay* medical care, 12m?";
label variable fdmedct  "
FAU.010_00.000: # of family members for whom medical care was delayed* 12m";
label variable fnmedyn  "
FAU.030_00.000: Any family member need and not get medical care* 12m?";
label variable fnmedct  "
FAU.030_00.000: # of family members who needed and did not get medical care* 12m
";
label variable fhospyn  "
FAU.050_00.000: Any family member in hospital overnight, 12m?";
label variable fhospct  "
FAU.050_00.000: # of family members in hospital overnight, 12m";
label variable fhchmyn  "
FAU.120_00.000: Any family member receive home care*, 2 wk?";
label variable fhchmct  "
FAU.120_00.000: # of family members who received home care*, 2 wk";
label variable fhcphryn "
FAU.150_00.000: Any family member get advice/test results over the phone, 2wk?";
label variable fhcphrct "
FAU.150_00.000: # of family members who got advice/test results over the phone, 
2 wk";
label variable fhcdvyn  "
FAU.180_00.000: Any family member have an office visit, etc. 2 wk";
label variable fhcdvct  "
FAU.180_00.000: # of family members who had an office visit, etc. 2 wk";
label variable f10dvyn  "
FAU.210_00.000: Any family member receive care 10+ times, 12m?";
label variable f10dvct  "
FAU.210_00.000: # of family members who received care 10+ times, 12m";

label variable fhdstct  "FSD.007_00.000: # of children le 17 in Head Start";
label variable fdglwct1 "FSD.050_00.000: # fam members working last week";
label variable fdglwct2 "
FSD.050_00.000: # fam members looking for work last week";
label variable fwrklwct "FSD.070_00.000: # fam members work full time last week
";

label variable fsalyn   "
FIN.040_00.000: Any family member received income from wages/salary";
label variable fsalct   "
FIN.040_00.000: # family members received income from wages/salary";
label variable fseincyn "
FIN.060_00.000: Any family member received income from self-employment";
label variable fseincct "
FIN.060_00.000: # family members received income from self-employment";
label variable fssrryn  "
FIN.080_00.000: Any family member received Social Security or Railroad Retiremen
t";
label variable fssrrct  "
FIN.080_00.000: # family members received Social Security or Railroad Retirement
";
label variable fpensyn  "
FIN.100_00.000: Any family members receive disability pensions*";
label variable fpensct  "
FIN.100_00.000: # family members receive disability pensions*";
label variable fopensyn "
FIN.104_00.000: Any family member received other survivor or retirement pensions
";
label variable fopensct "
FIN.104_00.000: # family members received other survivor or retirement pension";
label variable fssiyn   "
FIN.120_00.000: Any family member receive income from SSI";
label variable fssict   "
FIN.120_00.000: # of family members receive income from SSI";
label variable ftanfyn  "
FIN.160_00.000: Any family member receive income from Welfare/TANF";
label variable ftanfct  "
FIN.160_00.000: # of family members receive income from Welfare/TANF";
label variable fowbenyn "
FIN.166_00.000: Any family member receive income from other Welfare programs";
label variable fowbenct "
FIN.166_00.000: # of family members receive income from other Welfare programs";
label variable fintr1yn "
FIN.180_00.000: Anyone have money . . .that earned interest";
label variable fintr1ct "
FIN.180_00.000: # of family members w/ money earning interest";
label variable fdivdyn  "
FIN.200_00.000: Any family member receive dividends from stocks, etc.";
label variable fdivdct  "
FIN.200_00.000: # of  family members receive dividends from stocks, etc.";
label variable fchspyn  "FIN.220_00.000: Any fam member rec child support inc?";
label variable fchspct  "FIN.220_00.000: # fam members rec child support inc?";
label variable fincotyn "FIN.240_00.000: Any fam member rec inc from otr source?
";
label variable fincotct "FIN.240_00.000: # fam members rec inc from otr source?
";
label variable incgrp   "FIN.270_00.000: Total combined family income (grouped)
";
label variable rat_cat  "FIN.270_00.000: Ratio of fam inc to poverty threshold";
label variable houseown "FIN.280_00.000: Home tenure status";
label variable fgah     "FIN.282_00.000: Paying lower rent due to gov't program
";
label variable fssaplyn "FIN.310_00.000: Any fam member EVER applied for SSI?";
label variable fssaplct "FIN.310_00.000: # fam members EVER applied for SSI";
label variable fsdaplyn "FIN.340_00.000: Any fam member EVER applied for SSDI?";
label variable fsdaplct "FIN.340_00.000: # fam members EVER applied for SSDI";
label variable ffdstyn  "FIN.370_00.000: Any fam member auth to rec food stamps?
";
label variable ffdstct  "FIN.370_00.000: # fam members auth to rec food stamps";
label variable fwicyn   "FIN.385_00.000: Any fam member rec WIC benefits?";
label variable fwicct   "FIN.385_00.000: # fam members rec WIC benefits";

* DEFINE VALUE LABELS FOR REPORTS;

label define fap001x
   10               "Household"
   20               "Person"
   30               "Sample Adult"
   31               "Sample Adult Cancer"
   40               "Sample Child"
   60               "Family"
   70               "Injury/Poisoning Episode"
   75               "Injury/Poisoning Verbatim"
;
label define fap002x
   2005             "2005"
;
label define fap006x
   2005             "Year 2005"
   2006             "Year 2006"
   9998             "Not ascertained"
;
label define fap007x
   01               "January"
   02               "February"
   03               "March"
   04               "April"
   05               "May"
   06               "June"
   07               "July"
   08               "August"
   09               "September"
   10               "October"
   11               "November"
   12               "December"
   98               "Not ascertained"
;
label define fap008x
   1                "Gave telephone number"
   2                "No telephone"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define fap009x
   1                "Yes"
   2                "No"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define fap011x
   00               "One week or less"
   01               "More than one week, up to two weeks"
   02               "More than two weeks, up to three weeks"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define fap013x
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define fap016x
   1                "Gave telephone number"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define fap019x
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define fap020x
   000              "None"
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define fap021x
   1                "English"
   2                "Spanish"
   3                "English and Spanish"
   4                "Other"
   8                "Not ascertained"
;
label define fap025x
   1                "One adult, no child(ren) under 18"
   2                "Multiple adults, no child(ren) under 18"
   3                "One adult, 1+ child(ren) under 18"
   4                "Multiple adults, 1+ child(ren) under 18"
   9                "Unknown"
;
label define fap026x
   11               "Living alone"
   12               "Living with roommate(s)"
   21               "Married couple"
   22               "Unmarried couple"
   23               "All other adult-only families"
   31               "Mother and biological or non-biological child(ren) only"
   32               "Father and biological or non-biological child(ren) only"
   33               "All other single-adult and child(ren) families"
   41               "
Married or unmarried parents with biological/adoptive child(ren) only"
   42               "
Parent (biological or adoptive), step parent, and child(ren) only"
   43               "
Parent (biological or adoptive), cohabiting partner, and child(ren) only"
   44               "
At least 1 (biological or adoptive) parent and 1+ child(ren), and other related 
adults"
   45               "
Other related and/or unrelated adults, 1+ child(ren), no biological or adoptive 
parent(s)"
   99               "Unknown"
;
label define fap027x
   11               "Living alone"
   12               "Living with roommate(s)"
   21               "Married couple"
   22               "Unmarried couple"
   23               "All other adult-only families"
   31               "Mother and biological or non-biological child(ren) only"
   32               "Father and biological or non-biological child(ren) only"
   33               "All other single-adult and child(ren) families"
   41               "Married parents with biological/adoptive child(ren) only"
   42               "Cohabiting parent(s) with child(ren) only"
   43               "
Parent (biological or adoptive), step parent, and child(ren) only"
   44               "
At least 1 (biological or adoptive) parent and 1+ child(ren), and other related 
adults"
   45               "
Other related and/or unrelated adults, 1+ child(ren), no biological or adoptive 
parent(s)"
   99               "Unknown"
;
label define fap028x
   01               "Less/equal to 8th grade"
   02               "9-12th grade, no high school diploma"
   03               "GED recipient"
   04               "High school graduate"
   05               "Some college, no degree"
   06               "AA degree, technical or vocational"
   07               "AA degree, academic program"
   08               "Bachelor's degree (BA, BS, AB, BBA)"
   09               "Master's, professional, or doctoral degree"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define fap092x
   01               "0-$4999"
   02               "$5000-$9999"
   03               "$10000-$14999"
   04               "$15000-$19999"
   05               "$20000-$24999"
   06               "$25000-$34999"
   07               "$35000-$44999"
   08               "$45000-$54999"
   09               "$55000-$64999"
   10               "$65000-$74999"
   11               "$75000 and over"
   12               "$20000 or more (no detail)"
   13               "Less than $20000 (no detail)"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define fap093x
   01               "Under .50"
   02               ".50 to .74"
   03               ".75 to .99"
   04               "1.00 to 1.24"
   05               "1.25 to 1.49"
   06               "1.50 to 1.74"
   07               "1.75 to 1.99"
   08               "2.00 to 2.49"
   09               "2.50 to 2.99"
   10               "3.00 to 3.49"
   11               "3.50 to 3.99"
   12               "4.00 to 4.49"
   13               "4.50 to 4.99"
   14               "5.00 and over"
   96               "Undefinable"
   99               "Unknown"
;
label define fap094x
   1                "Owned or being bought"
   2                "Rented"
   3                "Other arrangement"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   fap001x;   label values srvy_yr   fap002x;

label values fint_y_p  fap006x;   label values fint_m_p  fap007x;

label values teln_flg  fap008x;   label values inside    fap009x;
label values noserv    fap009x;   label values howlngwk  fap011x;

label values telcel    fap009x;   label values wrkcel    fap013x;
label values vcelnum   fap009x;   label values curwrk    fap009x;
label values telh_flg  fap016x;   label values teldirc   fap009x;
label values rnoserv   fap009x;   label values rh1lngdy  fap019x;
label values rh2lngdy  fap020x;

label values flngintv  fap021x;

label values fm_type   fap025x;   label values fm_strcp  fap026x;
label values fm_strp   fap027x;   label values fm_educ1  fap028x;

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
label values incgrp    fap092x;   label values rat_cat   fap093x;
label values houseown  fap094x;   label values fgah      fap009x;
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
