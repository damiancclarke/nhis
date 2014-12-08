log using "$LOG/familyxx.log", replace

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

      carbon       86 -  86

      fdmedyn      87 -  87      fdmedct      88 -  89
      fnmedyn      90 -  90      fnmedct      91 -  92
      fhosp2yn     93 -  93      fhosp2ct     94 -  95
      fhchmyn      96 -  96      fhchmct      97 -  98
      fhcphryn     99 -  99      fhcphrct    100 - 101
      fhcdvyn     102 - 102      fhcdvct     103 - 104
      f10dvyn     105 - 105      f10dvct     106 - 107

      fhdstct     108 - 109      fdglwct1    110 - 111
      fdglwct2    112 - 113      fwrklwct    114 - 115

      fsalyn      116 - 116      fsalct      117 - 118
      fseincyn    119 - 119      fseincct    120 - 121
      fssrryn     122 - 122      fssrrct     123 - 124
      fpensyn     125 - 125      fpensct     126 - 127
      fopensyn    128 - 128      fopensct    129 - 130
      fssiyn      131 - 131      fssict      132 - 133
      ftanfyn     134 - 134      ftanfct     135 - 136
      fowbenyn    137 - 137      fowbenct    138 - 139
      fintr1yn    140 - 140      fintr1ct    141 - 142
      fdivdyn     143 - 143      fdivdct     144 - 145
      fchspyn     146 - 146      fchspct     147 - 148
      fincotyn    149 - 149      fincotct    150 - 151
      incgrp2     152 - 153      incgrp3     154 - 155
      rat_cat2    156 - 157      rat_cat3    158 - 159
      houseown    160 - 160      fgah        161 - 161
      fssaplyn    162 - 162      fssaplct    163 - 164
      fsdaplyn    165 - 165      fsdaplct    166 - 167
      ffdstyn     168 - 168      ffdstct     169 - 170
      fwicyn      171 - 171      fwicct      172 - 173

using "$DAT/2009/familyxx.dat";

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: HH identifier";
label variable fmx      "IDN.000_35.000: Family #";
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
FHS.050_00.000: # children in family receive Special Education/EIS";
label variable flaadlyn "FHS.070_00.000: Does any family member need help w/ADL?
";
label variable flaadlct "FHS.070_00.000: # family members needing help w/ADL";
label variable fliadlyn "
FHS.150_00.000: Any family member need help w/chores, etc.?";
label variable fliadlct "
FHS.150_00.000: # family members need help w/chores, etc.";
label variable fwklimyn "
FHS.190_00.000: Anyone with work limitations due to health problem?";
label variable fwklimct "
FHS.190_00.000: # family members w/ work limitations due to health problem?";
label variable fwalkyn  "
FHS.210_00.000: Any members have difficulty walking w/o equipment?";
label variable fwalkct  "
FHS.210_00.000: # family members having difficulty walking w/o equipment";
label variable frememyn "
FHS.230_00.000: Any member limited by difficulty remembering?";
label variable frememct "
FHS.230_00.000: # family members w/ difficulty remembering";
label variable fanylyn  "
FHS.250_00.000: Is any family member limited in ANY WAY?";
label variable fanylct  "
FHS.250_00.000: Number of family members w/ ANY limitation";
label variable fhstatex "FHS.500_00.000: # family members in excellent health";
label variable fhstatvg "FHS.500_00.000: # family members in very good health";
label variable fhstatg  "FHS.500_00.000: # family members in good health";
label variable fhstatfr "FHS.500_00.000: # family members in fair health";
label variable fhstatpr "FHS.500_00.000: # family members in poor health";

label variable carbon   "FIJ.181_00.010: Carbon monoxide detector in home";

label variable fdmedyn  "
FAU.010_00.000: Any family member delay medical care, 12m?";
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

label variable fhdstct  "
FSD.007_00.000: # of children in family currently or ever in Head Start";
label variable fdglwct1 "FSD.050_00.000: # family members working last week";
label variable fdglwct2 "
FSD.050_00.000: # family members looking for work last week";
label variable fwrklwct "
FSD.070_00.000: # family members working full time last week";

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
FIN.100_00.000: Any family members receive disability pensions (See file layout)
";
label variable fpensct  "
FIN.100_00.000: # family members receive disability pensions (See file layout)";
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
label variable fchspct  "
FIN.220_00.000: # of family members rec child support inc?";
label variable fincotyn "FIN.240_00.000: Any fam member rec inc from otr source?
";
label variable fincotct "
FIN.240_00.000: # of family members rec inc from otr source?";
label variable incgrp2  "FIN.250_00.000: Total combined family income (grouped)
";
label variable incgrp3  "FIN.250_00.000: Total combined family income (grouped)
";
label variable rat_cat2 "
FIN.250_00.000: Ratio of family income to the poverty threshold";
label variable rat_cat3 "
FIN.250_00.000: Ratio of family income to the poverty threshold";
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
label define fap088x
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
label define fap089x
   01       "01 $0 - $34,999"
   02       "02 $35,000 - $74,999"
   03       "03 $75,000 - $99,999"
   04       "04 $100,000 and over"
   96       "96 Undefined"
   99       "99 Unknown"
;
label define fap090x
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
label define fap091x
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
label define fap092x
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

label values carbon    fap009x;

label values fdmedyn   fap009x;   label values fnmedyn   fap009x;
label values fhosp2yn  fap009x;   label values fhchmyn   fap009x;
label values fhcphryn  fap009x;   label values fhcdvyn   fap009x;
label values f10dvyn   fap009x;



label values fsalyn    fap009x;   label values fseincyn  fap009x;
label values fssrryn   fap009x;   label values fpensyn   fap009x;
label values fopensyn  fap009x;   label values fssiyn    fap009x;
label values ftanfyn   fap009x;   label values fowbenyn  fap009x;
label values fintr1yn  fap009x;   label values fdivdyn   fap009x;
label values fchspyn   fap009x;   label values fincotyn  fap009x;
label values incgrp2   fap088x;   label values incgrp3   fap089x;
label values rat_cat2  fap090x;   label values rat_cat3  fap091x;
label values houseown  fap092x;   label values fgah      fap009x;
label values fssaplyn  fap009x;   label values fsdaplyn  fap009x;
label values ffdstyn   fap009x;   label values fwicyn    fap009x;

save "$OUT/2009/familyxx", replace;
#delimit cr
log close
