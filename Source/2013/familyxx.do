log using "$LOG/familyxx.log", text replace

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

  fsrunout     86 -  86      fslast       87 -  87
  fsbalanc     88 -  88      fsskip       89 -  89
  fsskdays     90 -  91      fsless       92 -  92
  fsless1      93 -  93      fsless2      94 -  94
  fshungry     95 -  95      fshungr1     96 -  96
  fshungr2     97 -  97      fsweight     98 -  98
  fsweigh1     99 -  99      fsweigh2    100 - 100
  fsnoteat    101 - 101      fsnedays    102 - 103
  ffs_flg     104 - 104

  fdmedyn     105 - 105      fdmedct     106 - 107
  fnmedyn     108 - 108      fnmedct     109 - 110
  fhosp2yn    111 - 111      fhosp2ct    112 - 113
  fhchmyn     114 - 114      fhchmct     115 - 116
  fhcphryn    117 - 117      fhcphrct    118 - 119
  fhcdvyn     120 - 120      fhcdvct     121 - 122
  f10dvyn     123 - 123      f10dvct     124 - 125

  fhicovyn    126 - 126      fhicovct    127 - 128
  fhiprvct    129 - 130      fhisinct    131 - 132
  fhicarct    133 - 134      fhicadct    135 - 136
  fhichpct    137 - 138      fhimilct    139 - 140
  fhiihsct    141 - 142      fhipubct    143 - 144
  fhiogvct    145 - 146      fprcooh     147 - 147
  fhiebcct    148 - 149      covconf     150 - 150
  fhicost     151 - 151      fmedbill    152 - 152
  fmedbpay    153 - 153      fmedbnop    154 - 154
  fsaf        155 - 155

  fhdstct     156 - 157      fdglwct1    158 - 159
  fdglwct2    160 - 161      fwrklwct    162 - 163

  fsalyn      164 - 164      fsalct      165 - 166
  fseincyn    167 - 167      fseincct    168 - 169
  fssrryn     170 - 170      fssrrct     171 - 172
  fpensyn     173 - 173      fpensct     174 - 175
  fopensyn    176 - 176      fopensct    177 - 178
  fssiyn      179 - 179      fssict      180 - 181
  ftanfyn     182 - 182      ftanfct     183 - 184
  fowbenyn    185 - 185      fowbenct    186 - 187
  fintr1yn    188 - 188      fintr1ct    189 - 190
  fdivdyn     191 - 191      fdivdct     192 - 193
  fchspyn     194 - 194      fchspct     195 - 196
  fincotyn    197 - 197      fincotct    198 - 199
  incgrp2     200 - 201      incgrp3     202 - 203
  rat_cat2    204 - 205      rat_cat3    206 - 207
  houseown    208 - 208      fgah        209 - 209
  fssaplyn    210 - 210      fssaplct    211 - 212
  fsdaplyn    213 - 213      fsdaplct    214 - 215
  fsnap       216 - 216      fsnapmyr    217 - 218
  fwicyn      219 - 219      fwicct      220 - 221

  using "$DAT/2013/FAMILYXX.dat";

* DEFINE VARIABLE LABELS;

label variable rectype  "File type identifier";
label variable srvy_yr  "Year of National Health Interview Survey";
label variable hhx      "Household Number";
label variable fmx      "Family Number";
label variable wtfa_fam "Weight - Final Annual";

label variable fint_y_p "Year Interview Completed - Year";
label variable fint_m_p "Date of Interview - Month";

label variable teln_flg "Supplied telephone number";
label variable curwrkn  "Working phone inside home";
label variable rnoservn "Without telephone service in the past 12 months";
label variable rhlngdy  "Number of days without telephone service";
label variable telceln  "Working cell phone in family";
label variable wrkceln  "Number of working cell phones";
label variable cellout  "Working cell during land-line outage";
label variable phoneuse "Received calls cell/landline/both";

label variable flngintv "Language of Interview";

label variable fm_size  "Size of family";
label variable fm_kids  "# family members under 18 years of age";
label variable fm_eldr  "# family members aged 65 and older";
label variable fm_type  "Family type";
label variable fm_strcp "Family Structure";
label variable fm_strp  "Family Structure";
label variable fm_educ1 "Education of adult with highest education in family";

label variable fchlmyn  "
  Any children under age 5 in family with play limitations?";
label variable fchlmct  "# children under age 5 in family with play limitations
  ";
label variable fspedyn  "Any children in family receive Special Education/EIS?";
label variable fspedct  "# children in family receiving Special Education/EIS";
label variable flaadlyn "Any family member need help with an ADL?";
label variable flaadlct "# family members needing help with an ADL";
label variable fliadlyn "Any family member need help with an IADL?";
label variable fliadlct "# family members needing help with an IADL";
label variable fwklimyn "
  Any family member have work limitations due to a health problem?";
label variable fwklimct "
  # family members with work limitations due to a health problem";
label variable fwalkyn  "
  Any family member have difficulty walking without equipment?";
label variable fwalkct  "
  # family members having difficulty walking without equipment";
label variable frememyn "Any family member limited by difficulty remembering?";
label variable frememct "# family members with difficulty remembering";
label variable fanylyn  "Is any family member limited in ANY WAY?";
label variable fanylct  "# of family members with ANY limitation";
label variable fhstatex "# family members in excellent health";
label variable fhstatvg "# family members in very good health";
label variable fhstatg  "# family members in good health";
label variable fhstatfr "# family members in fair health";
label variable fhstatpr "# family members in poor health";

label variable fsrunout "Worried food would run out before got money to buy more
  ";
label variable fslast   "Food did not last before had money to get more";
label variable fsbalanc "Could not afford to eat balanced meals";
label variable fsskip   "Cut size or skipped meals because not enough money";
label variable fsskdays "Number of days cut size or skipped meals";
label variable fsless   "
  Eat less than felt should because not enough money (interview quarters 1 and 2 o
  f 2013)";
label variable fsless1  "
  Eat less than felt should because not enough money (Version 1 during interview q
  uarters 3 and 4 of 2013)";
label variable fsless2  "
  Eat less than felt should because not enough money (Version 2 during interview q
  uarters 3 and 4 of 2013)";
label variable fshungry "
  Hungry but did not eat because not enough money (interview quarters 1 and 2 of 2
  013)";
label variable fshungr1 "
  Hungry but did not eat because not enough money (Version 1 during interview quar
  ters 3 and 4 of 2013)";
label variable fshungr2 "
  Hungry but did not eat because not enough money (Version 2 during interview quar
  ters 3 and 4 of 2013)";
label variable fsweight "
  Lose weight because not enough money for food (interview quarters 1 and 2 of 201
  3)";
label variable fsweigh1 "
  Lose weight because not enough money for food (Version 1 during interview quarte
  rs 3 and 4 of 2013)";
label variable fsweigh2 "
  Lose weight because not enough money for food (Version 2 during interview quarte
  rs 3 and 4 of 2013)";
label variable fsnoteat "
  Not eat for a whole day because not enough money for food";
label variable fsnedays "Number of days did not eat";
label variable ffs_flg  "Family food security split-ballot questions flag";

label variable fdmedyn  "Any family member delay seeking medical care, 12m?";
label variable fdmedct  "
  # of family members for whom medical care was delayed, 12m";
label variable fnmedyn  "Any family member need and not get medical care, 12m?";
label variable fnmedct  "
  # of family members who needed and did not get medical care, 12m";
label variable fhosp2yn "Any family member in hospital overnight, 12m?";
label variable fhosp2ct "# of family members in hospital overnight, 12m";
label variable fhchmyn  "Any family member receive home care, 2wk?";
label variable fhchmct  "# of family members who received home care, 2wk";
label variable fhcphryn "
  Any family member get advice/test results over the phone, 2wk?";
label variable fhcphrct "
  # of family members who got advice/test results over the phone, 2wk";
label variable fhcdvyn  "Any family member have an office visit, etc., 2wk";
label variable fhcdvct  "# of family members who had an office visit, etc., 2wk
  ";
label variable f10dvyn  "Any family member receive care 10+ times, 12m?";
label variable f10dvct  "# of family members who received care 10+ times, 12m";

label variable fhicovyn "Any family member have health insurance coverage?";
label variable fhicovct "Number of family members with health insurance coverage
  ";
label variable fhiprvct "
  Number of family members with private health insurance coverage";
label variable fhisinct "Number of family members with single service plans";
label variable fhicarct "Number of family members with Medicare";
label variable fhicadct "Number of family members with Medicaid";
label variable fhichpct "Number of family members with SCHIP";
label variable fhimilct "
  Number of family members with Military health insurance coverage";
label variable fhiihsct "
  Number of family members with Indian Health Service coverage";
label variable fhipubct "
  Number of family members with other state-sponsored health plan";
label variable fhiogvct "
  Number of family members with other government health plan";
label variable fprcooh  "Any persons covered living outside of the household";
label variable fhiebcct "Number of family members with employer based coverage";
label variable covconf  "Confidence in obtaining affordable coverage";
label variable fhicost  "
  Cost of family medical/dental care in the past 12 months";
label variable fmedbill "Problems paying or unable to pay any medical bills";
label variable fmedbpay "Medical bills being paid off over time";
label variable fmedbnop "Unable to pay medical bills";
label variable fsaf     "Family has a Flexible Spending Account";

label variable fhdstct  "# of children in family currently or ever in Head Start
  ";
label variable fdglwct1 "# family members working last week";
label variable fdglwct2 "# family members looking for work last week";
label variable fwrklwct "# family members working full time last week";

label variable fsalyn   "Any family member receive income from wages or salary?
  ";
label variable fsalct   "# family members receiving income from wages or salary
  ";
label variable fseincyn "Any family member receive income from self-employment?
  ";
label variable fseincct "# family members receiving income from self-employment
  ";
label variable fssrryn  "
  Any family member receive Social Security or Railroad Retirement income?";
label variable fssrrct  "
  # family members receiving Social Security or Railroad Retirement income";
label variable fpensyn  "
  Any family members receive disability pensions (See file layout)";
label variable fpensct  "
  # family members receiving disability pensions (See file layout)";
label variable fopensyn "
  Any family member receive other survivor or retirement pensions?";
label variable fopensct "
  # family members receiving other survivor or retirement pension";
label variable fssiyn   "Any family member receive income from SSI?";
label variable fssict   "# of family members receiving income from SSI";
label variable ftanfyn  "
  Any family member receive income from a state or county welfare program?";
label variable ftanfct  "
  # of family members receiving income from a state or county welfare program";
label variable fowbenyn "
  Any family member receive other kind of welfare assistance?";
label variable fowbenct "
  # of family members receiving other kind of welfare assistance";
label variable fintr1yn "
  Any family member receive income from interest bearing accounts, funds, etc.?";
label variable fintr1ct "
  # of family members receiving income from interest bearing accounts, funds, etc.
  ";
label variable fdivdyn  "Any family member receive dividends from stocks, etc.?
  ";
label variable fdivdct  "
  # of family members receiving dividends from stocks, etc.";
label variable fchspyn  "Any family member receive child support income?";
label variable fchspct  "# of family members for whom child support was received
  ";
label variable fincotyn "Any family member receive income from any other source?
  ";
label variable fincotct "
  # of family members receiving income from any other source";
label variable incgrp2  "Total combined family income (grouped)";
label variable incgrp3  "Total combined family income (grouped)";
label variable rat_cat2 "Ratio of family income to the poverty threshold";
label variable rat_cat3 "Ratio of family income to the poverty threshold";
label variable houseown "Home tenure status";
label variable fgah     "Paying lower rent due to government program";
label variable fssaplyn "Any family member ever apply for SSI?";
label variable fssaplct "# family members ever applying for SSI";
label variable fsdaplyn "Any family member ever apply for SSDI?";
label variable fsdaplct "# family members ever applying for SSDI";
label variable fsnap    "
  Any family member receive food stamp/SNAP benefits last calendar year?";
label variable fsnapmyr "
  Number of months family received food stamps/SNAP benefits, last calendar year";
label variable fwicyn   "Any family member receiving WIC benefits?";
label variable fwicct   "# family members receiving WIC benefits";

* DEFINE VALUE LABELS FOR REPORTS;

label define fap001x
  10       "10 Household"
  20       "20 Person"
  25       "25 Income Imputation"
  30       "30 Sample Adult"
  38       "38 Functioning and Disability"
  40       "40 Sample Child"
  60       "60 Family"
  63       "63 Family Disability Questions"
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
  41       "41 Married or unmarried parents with biological/adoptive child(ren) only"
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
label define fap061x
  1        "1 Original wording (FSLESS1, FSHUNGRY1, FSWEIGHT1)"
  2        "2 New wording (FSLESS2, FSHUNGRY2, FSWEIGHT2)"
  ;
label define fap089x
  1        "1 Very confident"
  2        "2 Somewhat confident"
  3        "3 Not too confident"
  4        "4 Not confident at all"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define fap090x
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
label define fap123x
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
label define fap124x
  01       "01 $0 - $34,999"
  02       "02 $35,000 - $74,999"
  03       "03 $75,000 - $99,999"
  04       "04 $100,000 and over"
  96       "96 Undefined"
  99       "99 Unknown"
  ;
label define fap125x
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
label define fap126x
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
label define fap127x
  1        "1 Owned or being bought"
  2        "2 Rented"
  3        "3 Other arrangement"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   fap001x;

label values fint_y_p  fap006x;
label values fint_m_p  fap007x;

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
label values fsless1   fap009x;   label values fsless2   fap009x;
label values fshungry  fap009x;   label values fshungr1  fap009x;
label values fshungr2  fap009x;   label values fsweight  fap009x;
label values fsweigh1  fap009x;   label values fsweigh2  fap009x;
label values fsnoteat  fap009x;   label values fsnedays  fap013x;
label values ffs_flg   fap061x;

label values fdmedyn   fap009x;   label values fnmedyn   fap009x;
label values fhosp2yn  fap009x;   label values fhchmyn   fap009x;
label values fhcphryn  fap009x;   label values fhcdvyn   fap009x;
label values f10dvyn   fap009x;

label values fhicovyn  fap009x;   label values fprcooh   fap009x;
label values covconf   fap089x;   label values fhicost   fap090x;
label values fmedbill  fap009x;   label values fmedbpay  fap009x;
label values fmedbnop  fap009x;   label values fsaf      fap009x;



label values fsalyn    fap009x;   label values fseincyn  fap009x;
label values fssrryn   fap009x;   label values fpensyn   fap009x;
label values fopensyn  fap009x;   label values fssiyn    fap009x;
label values ftanfyn   fap009x;   label values fowbenyn  fap009x;
label values fintr1yn  fap009x;   label values fdivdyn   fap009x;
label values fchspyn   fap009x;   label values fincotyn  fap009x;
label values incgrp2   fap123x;   label values incgrp3   fap124x;
label values rat_cat2  fap125x;   label values rat_cat3  fap126x;
label values houseown  fap127x;   label values fgah      fap009x;
label values fssaplyn  fap009x;   label values fsdaplyn  fap009x;
label values fsnap     fap009x;   label values fsnapmyr  fap013x;
label values fwicyn    fap009x;

save "$OUT/2013/familyxx", replace;
#delimit cr
log close
