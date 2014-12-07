global DAT "~/database/NHIS/Data/raw/2011"
global OUT "~/database/NHIS/Data/dta/2011"
global LOG "~/database/NHIS/Log"

log using "$LOG/familyxx.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 MAY 31, 2012 10:02 AM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2011 NHIS Public Use Family ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE familyxx.dta AND familyxx.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd c:\nhis2011\

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

      teln_flg     27 -  27      curwrkn      28 -  28
      rnoservn     29 -  29      rhlngdy      30 -  32
      telceln      33 -  33      wrkceln      34 -  35
      cellout      36 -  36      phoneuse     37 -  37

      flngintv     38 -  38

      fm_size      39 -  40      fm_kids      41 -  42
      fm_eldr      43 -  44      fm_type      45 -  45
      fm_strcp     46 -  47      fm_strp      48 -  49
      fm_educ1     50 -  51

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

      fsrunout     86 -  86      fslast       87 -  87
      fsbalanc     88 -  88      fsskip       89 -  89
      fsskdays     90 -  91      fsless       92 -  92
      fshungry     93 -  93      fsweight     94 -  94
      fsnoteat     95 -  95      fsnedays     96 -  97
      fsraw        98 -  99      fsstatd     100 - 100
      fsstat      101 - 101

      fdmedyn     102 - 102      fdmedct     103 - 104
      fnmedyn     105 - 105      fnmedct     106 - 107
      fhosp2yn    108 - 108      fhosp2ct    109 - 110
      fhchmyn     111 - 111      fhchmct     112 - 113
      fhcphryn    114 - 114      fhcphrct    115 - 116
      fhcdvyn     117 - 117      fhcdvct     118 - 119
      f10dvyn     120 - 120      f10dvct     121 - 122

      fhicovyn    123 - 123      fhicovct    124 - 125
      fhiprvct    126 - 127      fhisinct    128 - 129
      fhicarct    130 - 131      fhicadct    132 - 133
      fhichpct    134 - 135      fhimilct    136 - 137
      fhiihsct    138 - 139      fhipubct    140 - 141
      fhiogvct    142 - 143      fprcooh     144 - 144
      fhiebcct    145 - 146      covconf     147 - 147
      fhicost     148 - 148      fmedbill    149 - 149
      fmedbpay    150 - 150      fmedbnop    151 - 151
      fsaf        152 - 152

      fhdstct     153 - 154      fdglwct1    155 - 156
      fdglwct2    157 - 158      fwrklwct    159 - 160

      fsalyn      161 - 161      fsalct      162 - 163
      fseincyn    164 - 164      fseincct    165 - 166
      fssrryn     167 - 167      fssrrct     168 - 169
      fpensyn     170 - 170      fpensct     171 - 172
      fopensyn    173 - 173      fopensct    174 - 175
      fssiyn      176 - 176      fssict      177 - 178
      ftanfyn     179 - 179      ftanfct     180 - 181
      fowbenyn    182 - 182      fowbenct    183 - 184
      fintr1yn    185 - 185      fintr1ct    186 - 187
      fdivdyn     188 - 188      fdivdct     189 - 190
      fchspyn     191 - 191      fchspct     192 - 193
      fincotyn    194 - 194      fincotct    195 - 196
      fincflg     197 - 197      incgrp2     198 - 199
      incgrp3     200 - 201      rat_cat2    202 - 203
      rat_cat3    204 - 205      houseown    206 - 206
      fgah        207 - 207      fssaplyn    208 - 208
      fssaplct    209 - 210      fsdaplyn    211 - 211
      fsdaplct    212 - 213      fsnap       214 - 214
      fsnapmyr    215 - 216      fwicyn      217 - 217
      fwicct      218 - 219

using "$DAT/familyxx.dat";

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: Household Number";
label variable fmx      "IDN.000_35.000: Family Number";
label variable wtfa_fam "IDN.000_70.000: Weight - Final Annual";

label variable fint_y_p "FRT.010_02.000: Year Interview Completed - Year";
label variable fint_m_p "FRT.010_02.000: Date of Interview - Month";

label variable teln_flg "COV.330_01.000: Supplied telephone number";
label variable curwrkn  "COV.331_00.000: Working phone inside home";
label variable rnoservn "
COV.332_00.000: Without telephone service in the past 12 months";
label variable rhlngdy  "
COV.333_00.000: Number of days without telephone service";
label variable telceln  "COV.334_00.000: Working cell phone in family";
label variable wrkceln  "COV.335_00.000: Number of working cell phones";
label variable cellout  "COV.336_00.000: Working cell during land-line outage";
label variable phoneuse "COV.337_00.000: Received calls cell/landline/both";

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

label variable fchlmyn  "
FHS.005_00.000: Any children under age 5 in family with play limitations?";
label variable fchlmct  "
FHS.005_00.000: # children under age 5 in family with play limitations";
label variable fspedyn  "
FHS.050_00.000: Any children in family receive Special Education/EIS?";
label variable fspedct  "
FHS.050_00.000: # children in family receiving Special Education/EIS";
label variable flaadlyn "
FHS.070_00.000: Any family member need help with an ADL?";
label variable flaadlct "
FHS.070_00.000: # family members needing help with an ADL";
label variable fliadlyn "
FHS.150_00.000: Any family member need help with an IADL?";
label variable fliadlct "
FHS.150_00.000: # family members needing help with an IADL";
label variable fwklimyn "
FHS.190_00.000: Any family member have work limitations due to a health problem?
";
label variable fwklimct "
FHS.190_00.000: # family members with work limitations due to a health problem";
label variable fwalkyn  "
FHS.210_00.000: Any family member have difficulty walking without equipment?";
label variable fwalkct  "
FHS.210_00.000: # family members having difficulty walking without equipment";
label variable frememyn "
FHS.230_00.000: Any family member limited by difficulty remembering?";
label variable frememct "
FHS.230_00.000: # family members with difficulty remembering";
label variable fanylyn  "
FHS.250_00.000: Is any family member limited in ANY WAY?";
label variable fanylct  "FHS.250_00.000: # of family members with ANY limitation
";
label variable fhstatex "FHS.500_00.000: # family members in excellent health";
label variable fhstatvg "FHS.500_00.000: # family members in very good health";
label variable fhstatg  "FHS.500_00.000: # family members in good health";
label variable fhstatfr "FHS.500_00.000: # family members in fair health";
label variable fhstatpr "FHS.500_00.000: # family members in poor health";

label variable fsrunout "
FFS.010_00.000: Worried food would run out before got money to buy more";
label variable fslast   "
FFS.020_00.000: Food did not last before had money to get more";
label variable fsbalanc "FFS.030_00.000: Could not afford to eat balanced meals
";
label variable fsskip   "
FFS.040_00.000: Cut size or skipped meals because not enough money";
label variable fsskdays "
FFS.050_00.000: Number of days cut size or skipped meals";
label variable fsless   "
FFS.060_00.000: Eat less than felt should because not enough money";
label variable fshungry "
FFS.070_00.000: Hungry but did not eat because not enough money";
label variable fsweight "
FFS.080_00.000: Lose weight because not enough money for food";
label variable fsnoteat "
FFS.090_00.000: Not eat for a whole day because not enough money for food";
label variable fsnedays "FFS.100_00.000: Number of days did not eat";
label variable fsraw    "
FFS.000_00.000: Raw score on the 30-day food security scale";
label variable fsstatd  "
FFS.000_00.000: Detailed family-level food security status on the 30-day food se
curity scale";
label variable fsstat   "
FFS.000_00.000: Family-level food security status on the 30-day food security";

label variable fdmedyn  "
FAU.010_00.000: Any family member delay seeking medical care, 12m?";
label variable fdmedct  "
FAU.010_00.000: # of family members for whom medical care was delayed 12m";
label variable fnmedyn  "
FAU.030_00.000: Any family member need and not get medical care 12m?";
label variable fnmedct  "
FAU.030_00.000: # of family members who needed and did not get medical care 12m
";
label variable fhosp2yn "
FAU.050_00.000: Any family member in hospital overnight, 12m?";
label variable fhosp2ct "
FAU.050_00.000: # of family members in hospital overnight, 12m";
label variable fhchmyn  "
FAU.120_00.000: Any family member receive home care, 2 wk?";
label variable fhchmct  "
FAU.120_00.000: # of family members who received home care, 2 wk";
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

label variable fhicovyn "
FHI.070_00.000: Any family member have health insurance coverage?";
label variable fhicovct "
FHI.070_00.000: Number of family members with health insurance coverage";
label variable fhiprvct "
FHI.070_00.000: Number of family members with private health insurance coverage
";
label variable fhisinct "
FHI.070_00.000: Number of family members with single service plans";
label variable fhicarct "FHI.070_00.000: Number of family members with Medicare
";
label variable fhicadct "FHI.070_00.000: Number of family members with Medicaid
";
label variable fhichpct "FHI.070_00.000: Number of family members with SCHIP";
label variable fhimilct "
FHI.070_00.000: Number of family members with Military health insurance coverage
";
label variable fhiihsct "
FHI.070_00.000: Number of family members with Indian Health Service coverage";
label variable fhipubct "
FHI.070_00.000: Number of family members with other state-sponsored health plan
";
label variable fhiogvct "
FHI.070_00.000: Number of family members with other government health plan";
label variable fprcooh  "
FHI.204_01.010: Any persons covered living outside of the household";
label variable fhiebcct "
FHI.210_01.000: Number of family members with employer based coverage";
label variable covconf  "
FHI.249_03.000: Confidence in obtaining affordable coverage";
label variable fhicost  "
FHI.320_00.000: Cost of family medical/dental care in the past 12 months";
label variable fmedbill "
FHI.325_00.010: Problems paying or unable to pay any medical bills";
label variable fmedbpay "FHI.327_00.010: Medical bills being paid off over time
";
label variable fmedbnop "FHI.327_00.020: Unable to pay medical bills";
label variable fsaf     "FHI.330_00.000: Family has a Flexible Spending Account
";

label variable fhdstct  "
FSD.007_00.000: # of children in family currently or ever in Head Start";
label variable fdglwct1 "FSD.050_00.000: # family members working last week";
label variable fdglwct2 "
FSD.050_00.000: # family members looking for work last week";
label variable fwrklwct "
FSD.070_00.000: # family members working full time last week";

label variable fsalyn   "
FIN.040_00.000: Any family member receive income from wages or salary?";
label variable fsalct   "
FIN.040_00.000: # family members receiving income from wages or salary";
label variable fseincyn "
FIN.060_00.000: Any family member receive income from self-employment?";
label variable fseincct "
FIN.060_00.000: # family members receiving income from self-employment";
label variable fssrryn  "
FIN.080_00.000: Any family member receive Social Security or Railroad Retirement
 income?";
label variable fssrrct  "
FIN.080_00.000: # family members receiving Social Security or Railroad Retiremen
t income";
label variable fpensyn  "
FIN.100_00.000: Any family members receive disability pensions (See file layout)
";
label variable fpensct  "
FIN.100_00.000: # family members receiving disability pensions (See file layout)
";
label variable fopensyn "
FIN.104_00.000: Any family member receive other survivor or retirement pensions?
";
label variable fopensct "
FIN.104_00.000: # family members receiving other survivor or retirement pension
";
label variable fssiyn   "
FIN.120_00.000: Any family member receive income from SSI?";
label variable fssict   "
FIN.120_00.000: # of family members receiving income from SSI";
label variable ftanfyn  "
FIN.160_00.000: Any family member receive income from a state or county welfare 
program?";
label variable ftanfct  "
FIN.160_00.000: # of family members receiving income from a state or county welf
are program";
label variable fowbenyn "
FIN.166_00.000: Any family member receive other kind of welfare assistance?";
label variable fowbenct "
FIN.166_00.000: # of family members receiving other kind of welfare assistance";
label variable fintr1yn "
FIN.180_00.000: Any family member receive income from interest bearing accounts,
 funds, etc.?";
label variable fintr1ct "
FIN.180_00.000: # of family members receiving income from interest bearing accou
nts, funds, etc.";
label variable fdivdyn  "
FIN.200_00.000: Any family member receive dividends from stocks, etc.?";
label variable fdivdct  "
FIN.200_00.000: # of family members receiving dividends from stocks, etc.";
label variable fchspyn  "
FIN.220_00.000: Any family member receive child support income?";
label variable fchspct  "
FIN.220_00.000: # of family members for whom child support was received";
label variable fincotyn "
FIN.240_00.000: Any family member receive income from any other source?";
label variable fincotct "
FIN.240_00.000: # of family members receiving income from any other source";
label variable fincflg  "
FIN.250_00.000: Flag indicating difference in how family income data were collec
ted";
label variable incgrp2  "FIN.250_00.000: Total combined family income (grouped)
";
label variable incgrp3  "FIN.250_00.000: Total combined family income (grouped)
";
label variable rat_cat2 "
FIN.250_00.000: Ratio of family income to the poverty threshold";
label variable rat_cat3 "
FIN.250_00.000: Ratio of family income to the poverty threshold";
label variable houseown "FIN.280_00.000: Home tenure status";
label variable fgah     "
FIN.282_00.000: Paying lower rent due to government program";
label variable fssaplyn "FIN.310_00.000: Any family member ever apply for SSI?";
label variable fssaplct "FIN.310_00.000: # family members ever applying for SSI
";
label variable fsdaplyn "FIN.340_00.000: Any family member ever apply for SSDI?
";
label variable fsdaplct "FIN.340_00.000: # family members ever applying for SSDI
";
label variable fsnap    "
FIN.360_00.000: Any family member receive food stamp/SNAP benefits last calendar
 year?";
label variable fsnapmyr "
FIN.380_00.000: Number of months family received food stamps/SNAP benefits, last
 calendar year";
label variable fwicyn   "
FIN.385_00.000: Any family member receiving WIC benefits?";
label variable fwicct   "FIN.385_00.000: # family members receiving WIC benefits
";

* DEFINE VALUE LABELS FOR REPORTS;

label define fap001x
   10       "10 Household"
   20       "20 Person"
   25       "25 Income Imputation"
   30       "30 Sample Adult"
   31       "31 Sample Adult Cancer"
   38       "38 Functioning and Disability"
   39       "39 Adult Disability Questions Test"
   40       "40 Sample Child"
   49       "49 Child Disability Questions Test"
   60       "60 Family"
   63       "63 Family Disability Questions Test"
   65       "65 Paradata"
   70       "70 Injury/Poisoning Episode"
   75       "75 Injury/Poisoning Verbatim"
;
label define fap006x
   9998     "9998 Not ascertained"
;
label define fap007x
   01       "01 January"
   02       "02 February"
   03       "03 March"
   04       "04 April"
   05       "05 May"
   06       "06 June"
   07       "07 July"
   08       "08 August"
   09       "09 September"
   10       "10 October"
   11       "11 November"
   12       "12 December"
   98       "98 Not ascertained"
;
label define fap008x
   1        "1 Gave telephone number"
   2        "2 No telephone"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define fap009x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define fap011x
   000      "000 Less than 1 week"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define fap013x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define fap015x
   1        "1 All or almost all calls received on cell phones"
   2        "2 Some received on cell phones and some on regular phones"
   3        "3 Very few or none on cell phones"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define fap016x
   1        "1 English"
   2        "2 Spanish"
   3        "3 English and Spanish"
   4        "4 Other"
   8        "8 Not ascertained"
;
label define fap020x
   1        "1 One adult, no child(ren) under 18"
   2        "2 Multiple adults, no child(ren) under 18"
   3        "3 One adult, 1+ child(ren) under 18"
   4        "4 Multiple adults, 1+ child(ren) under 18"
   9        "9 Unknown"
;
label define fap021x
   11       "11 Living alone"
   12       "12 Living with roommate(s)"
   21       "21 Married couple"
   22       "22 Unmarried couple"
   23       "23 All other adult-only families"
   31       "31 Mother and biological or non-biological child(ren) only"
   32       "32 Father and biological or non-biological child(ren) only"
   33       "33 All other single-adult and child(ren) families"
   41       "
41 Married or unmarried parents with biological/adoptive child(ren) only"
   42       "
42 Parent (biological or adoptive), step parent, and child(ren) only"
   43       "
43 Parent (biological or adoptive), cohabiting partner, and child(ren) only"
   44       "
44 At least 1 (biological or adoptive) parent and 1+ child(ren), and other relat
ed adults"
   45       "
45 Other related and/or unrelated adults, 1+ child(ren), no biological or adopti
ve parent(s)"
   99       "99 Unknown"
;
label define fap022x
   11       "11 Living alone"
   12       "12 Living with roommate(s)"
   21       "21 Married couple"
   22       "22 Unmarried couple"
   23       "23 All other adult-only families"
   31       "31 Mother and biological or non-biological child(ren) only"
   32       "32 Father and biological or non-biological child(ren) only"
   33       "33 All other single-adult and child(ren) families"
   41       "41 Married parents with biological/adoptive child(ren) only"
   42       "42 Cohabiting parent(s) with child(ren) only"
   43       "
43 Parent (biological or adoptive), step parent, and child(ren) only"
   44       "
44 At least 1 (biological or adoptive) parent and 1+ child(ren), and other relat
ed adults"
   45       "
45 Other related and/or unrelated adults, 1+ child(ren), no biological or adopti
ve parent(s)"
   99       "99 Unknown"
;
label define fap023x
   01       "01 Less than/equal to 8th grade"
   02       "02 9-12th grade, no high school diploma"
   03       "03 GED recipient"
   04       "04 High school graduate"
   05       "05 Some college, no degree"
   06       "06 AA degree, technical or vocational"
   07       "07 AA degree, academic program"
   08       "08 Bachelor's degree (BA, BS, AB, BBA)"
   09       "09 Master's, professional, or doctoral degree"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define fap045x
   1        "1 Often true"
   2        "2 Sometimes true"
   3        "3 Never true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define fap055x
   99       "99 Unknown"
;
label define fap056x
   1        "1 High food security (raw score 0)"
   2        "2 Marginal food security (raw score 1-2)"
   3        "3 Low food security (raw score 3-5)"
   4        "4 Very low food security (raw score 6-10)"
   9        "9 Unknown"
;
label define fap057x
   1        "1 Food secure (high or marginal food security, raw score 0-2)"
   2        "2 Low food security (raw score 3-5)"
   3        "3 Very low food security (raw score 6-10)"
   9        "9 Unknown"
;
label define fap085x
   1        "1 Very confident"
   2        "2 Somewhat confident"
   3        "3 Not too confident"
   4        "4 Not confident at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define fap086x
   0        "0 Zero"
   1        "1 Less than $500"
   2        "2 $500-$1,999"
   3        "3 $2,000-$2,999"
   4        "4 $3,000-$4,999"
   5        "5 $5,000 or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define fap119x
   1        "1 Earnings data collected differently"
;
label define fap120x
   01       "01 $0 - $34,999"
   02       "02 $35,000 - $49,999"
   03       "03 $50,000 - $74,999"
   04       "04 $75,000 - $99,999"
   05       "05 $100,000 and over"
   06       "06 $0 - $49,999 (no further detail)"
   07       "07 $50,000 and over (no further detail)"
   08       "08 $50,000 - $99,999 (no further detail)"
   99       "99 Unknown"
;
label define fap121x
   01       "01 $0 - $34,999"
   02       "02 $35,000 - $74,999"
   03       "03 $75,000 - $99,999"
   04       "04 $100,000 and over"
   96       "96 Undefined"
   99       "99 Unknown"
;
label define fap122x
   01       "01 Under 0.50"
   02       "02 0.50 - 0.74"
   03       "03 0.75 - 0.99"
   04       "04 1.00 - 1.24"
   05       "05 1.25 - 1.49"
   06       "06 1.50 - 1.74"
   07       "07 1.75 - 1.99"
   08       "08 2.00 - 2.49"
   09       "09 2.50 - 2.99"
   10       "10 3.00 - 3.49"
   11       "11 3.50 - 3.99"
   12       "12 4.00 - 4.49"
   13       "13 4.50 - 4.99"
   14       "14 5.00 and over"
   15       "15 Less than 1.00 (no further detail)"
   16       "16 1.00 - 1.99 (no further detail)"
   17       "17 2.00 and over (no further detail)"
   96       "96 Undefinable"
   99       "99 Unknown"
;
label define fap123x
   01       "01 Under 0.50"
   02       "02 0.50 - 0.74"
   03       "03 0.75 - 0.99"
   04       "04 1.00 - 1.24"
   05       "05 1.25 - 1.49"
   06       "06 1.50 - 1.74"
   07       "07 1.75 - 1.99"
   08       "08 2.00 - 2.49"
   09       "09 2.50 - 2.99"
   10       "10 3.00 - 3.49"
   11       "11 3.50 - 3.99"
   12       "12 4.00 - 4.49"
   13       "13 4.50 - 4.99"
   14       "14 5.00 and over"
   15       "15 Less than 1.00 (no further detail)"
   16       "16 1.00 - 1.99 (no further detail)"
   17       "17 2.00 - 3.99 (no further detail)"
   18       "18 4.00 and over (no further detail)"
   96       "96 Undefinable"
   99       "99 Unknown"
;
label define fap124x
   1        "1 Owned or being bought"
   2        "2 Rented"
   3        "3 Other arrangement"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   fap001x;

label values fint_y_p  fap006x;   label values fint_m_p  fap007x;

label values teln_flg  fap008x;   label values curwrkn   fap009x;
label values rnoservn  fap009x;   label values rhlngdy   fap011x;
label values telceln   fap009x;   label values wrkceln   fap013x;
label values cellout   fap009x;   label values phoneuse  fap015x;

label values flngintv  fap016x;

label values fm_type   fap020x;   label values fm_strcp  fap021x;
label values fm_strp   fap022x;   label values fm_educ1  fap023x;

label values fchlmyn   fap009x;   label values fspedyn   fap009x;
label values flaadlyn  fap009x;   label values fliadlyn  fap009x;
label values fwklimyn  fap009x;   label values fwalkyn   fap009x;
label values frememyn  fap009x;   label values fanylyn   fap009x;

label values fsrunout  fap045x;   label values fslast    fap045x;
label values fsbalanc  fap045x;   label values fsskip    fap009x;
label values fsskdays  fap013x;   label values fsless    fap009x;
label values fshungry  fap009x;   label values fsweight  fap009x;
label values fsnoteat  fap009x;   label values fsnedays  fap013x;
label values fsraw     fap055x;   label values fsstatd   fap056x;
label values fsstat    fap057x;

label values fdmedyn   fap009x;   label values fnmedyn   fap009x;
label values fhosp2yn  fap009x;   label values fhchmyn   fap009x;
label values fhcphryn  fap009x;   label values fhcdvyn   fap009x;
label values f10dvyn   fap009x;

label values fhicovyn  fap009x;   label values fprcooh   fap009x;
label values covconf   fap085x;   label values fhicost   fap086x;
label values fmedbill  fap009x;   label values fmedbpay  fap009x;
label values fmedbnop  fap009x;   label values fsaf      fap009x;



label values fsalyn    fap009x;   label values fseincyn  fap009x;
label values fssrryn   fap009x;   label values fpensyn   fap009x;
label values fopensyn  fap009x;   label values fssiyn    fap009x;
label values ftanfyn   fap009x;   label values fowbenyn  fap009x;
label values fintr1yn  fap009x;   label values fdivdyn   fap009x;
label values fchspyn   fap009x;   label values fincotyn  fap009x;
label values fincflg   fap119x;   label values incgrp2   fap120x;
label values incgrp3   fap121x;   label values rat_cat2  fap122x;
label values rat_cat3  fap123x;   label values houseown  fap124x;
label values fgah      fap009x;   label values fssaplyn  fap009x;
label values fsdaplyn  fap009x;   label values fsnap     fap009x;
label values fsnapmyr  fap013x;   label values fwicyn    fap009x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_fam];
save "$OUT/familyxx", replace;

#delimit cr

* data file is stored in familyxx.dta
* log  file is stored in familyxx.log

log close
