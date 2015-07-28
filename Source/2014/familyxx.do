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
      telceln      29 -  29      wrkceln      30 -  31
      phoneuse     32 -  32

      flngintv     33 -  33

      fm_size      34 -  35      fm_kids      36 -  37
      fm_eldr      38 -  39      fm_type      40 -  40
      fm_strcp     41 -  42      fm_strp      43 -  44
      fm_educ1     45 -  46

      fchlmyn      47 -  47      fchlmct      48 -  49
      fspedyn      50 -  50      fspedct      51 -  52
      flaadlyn     53 -  53      flaadlct     54 -  55
      fliadlyn     56 -  56      fliadlct     57 -  58
      fwklimyn     59 -  59      fwklimct     60 -  61
      fwalkyn      62 -  62      fwalkct      63 -  64
      frememyn     65 -  65      frememct     66 -  67
      fanylyn      68 -  68      fanylct      69 -  70
      fhstatex     71 -  72      fhstatvg     73 -  74
      fhstatg      75 -  76      fhstatfr     77 -  78
      fhstatpr     79 -  80

      fsrunout     81 -  81      fslast       82 -  82
      fsbalanc     83 -  83      fsskip       84 -  84
      fsskdays     85 -  86      fsless       87 -  87
      fshungry     88 -  88      fsweight     89 -  89
      fsnoteat     90 -  90      fsnedays     91 -  92

      fdmedyn      93 -  93      fdmedct      94 -  95
      fnmedyn      96 -  96      fnmedct      97 -  98
      fhosp2yn     99 -  99      fhosp2ct    100 - 101
      fhchmyn     102 - 102      fhchmct     103 - 104
      fhcphryn    105 - 105      fhcphrct    106 - 107
      fhcdvyn     108 - 108      fhcdvct     109 - 110
      f10dvyn     111 - 111      f10dvct     112 - 113

      fhicovyn    114 - 114      fhicovct    115 - 116
      fhiprvct    117 - 118      fhiexct     119 - 120
      fhisinct    121 - 122      fhicarct    123 - 124
      fhicadct    125 - 126      fhichpct    127 - 128
      fhimilct    129 - 130      fhiihsct    131 - 132
      fhipubct    133 - 134      fhiogvct    135 - 136
      fprcooh     137 - 137      fhiebcct    138 - 139
      covconf     140 - 140      fhicost     141 - 141
      fmedbill    142 - 142      fmedbpay    143 - 143
      fmedbnop    144 - 144      fsaf        145 - 145

      fhdstct     146 - 147      fdglwct1    148 - 149
      fdglwct2    150 - 151      fwrklwct    152 - 153

      fsalyn      154 - 154      fsalct      155 - 156
      fseincyn    157 - 157      fseincct    158 - 159
      fssrryn     160 - 160      fssrrct     161 - 162
      fpensyn     163 - 163      fpensct     164 - 165
      fopensyn    166 - 166      fopensct    167 - 168
      fssiyn      169 - 169      fssict      170 - 171
      ftanfyn     172 - 172      ftanfct     173 - 174
      fowbenyn    175 - 175      fowbenct    176 - 177
      fintr1yn    178 - 178      fintr1ct    179 - 180
      fdivdyn     181 - 181      fdivdct     182 - 183
      fchspyn     184 - 184      fchspct     185 - 186
      fincotyn    187 - 187      fincotct    188 - 189
      incgrp4     190 - 191      incgrp5     192 - 193
      rat_cat4    194 - 195      rat_cat5    196 - 197
      houseown    198 - 198      fgah        199 - 199
      fssaplyn    200 - 200      fssaplct    201 - 202
      fsdaplyn    203 - 203      fsdaplct    204 - 205
      fsnap       206 - 206      fsnapmyr    207 - 208
      fwicyn      209 - 209      fwicct      210 - 211

using "$DAT/2014/familyxx.dat";

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
label variable telceln  "Working cell phone in family";
label variable wrkceln  "Number of working cell phones";
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
label variable fsless   "Eat less than felt should because not enough money";
label variable fshungry "Hungry but did not eat because not enough money";
label variable fsweight "Lose weight because not enough money for food";
label variable fsnoteat "
Not eat for a whole day because not enough money for food";
label variable fsnedays "Number of days did not eat";

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
label variable fhiexct  "Number of family members with exchange-based coverage";
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
label variable incgrp4  "Total combined family income (grouped)";
label variable incgrp5  "Total combined family income (grouped)";
label variable rat_cat4 "Ratio of family income to the poverty threshold";
label variable rat_cat5 "Ratio of family income to the poverty threshold";
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
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define fap012x
   1        "1 All or almost all calls received on cell phones"
   2        "2 Some received on cell phones and some on regular phones"
   3        "3 Very few or none on cell phones"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define fap013x
   1        "1 English"
   2        "2 Spanish"
   3        "3 English and Spanish"
   4        "4 Other"
   8        "8 Not ascertained"
;
label define fap017x
   1        "1 One adult, no child(ren) under 18"
   2        "2 Multiple adults, no child(ren) under 18"
   3        "3 One adult, 1+ child(ren) under 18"
   4        "4 Multiple adults, 1+ child(ren) under 18"
   9        "9 Unknown"
;
label define fap018x
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
label define fap019x
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
label define fap020x
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
label define fap042x
   1        "1 Often true"
   2        "2 Sometimes true"
   3        "3 Never true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define fap080x
   1        "1 Very confident"
   2        "2 Somewhat confident"
   3        "3 Not too confident"
   4        "4 Not confident at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define fap081x
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
label define fap114x
   01       "01 $0 - $34,999"
   02       "02 $35,000 - $49,999"
   03       "03 $50,000 - $74,999"
   04       "04 $75,000 - $99,999"
   05       "05 $100,000 and over"
   06       "06 $0 - $49,999 (no further detail)"
   07       "07 $50,000 - $99,999 (no further detail)"
   96       "96 Undefined"
   99       "99 Unknown"
;
label define fap115x
   01       "01 $0 - $34,999"
   02       "02 $35,000 - $74,999"
   03       "03 $75,000 - $99,999"
   04       "04 $100,000 and over"
   96       "96 Undefined"
   99       "99 Unknown"
;
label define fap116x
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
label define fap117x
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
label define fap118x
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
label values telceln   fap009x;   label values wrkceln   fap011x;
label values phoneuse  fap012x;

label values flngintv  fap013x;

label values fm_type   fap017x;   label values fm_strcp  fap018x;
label values fm_strp   fap019x;   label values fm_educ1  fap020x;

label values fchlmyn   fap009x;   label values fspedyn   fap009x;
label values flaadlyn  fap009x;   label values fliadlyn  fap009x;
label values fwklimyn  fap009x;   label values fwalkyn   fap009x;
label values frememyn  fap009x;   label values fanylyn   fap009x;

label values fsrunout  fap042x;   label values fslast    fap042x;
label values fsbalanc  fap042x;   label values fsskip    fap009x;
label values fsskdays  fap011x;   label values fsless    fap009x;
label values fshungry  fap009x;   label values fsweight  fap009x;
label values fsnoteat  fap009x;   label values fsnedays  fap011x;

label values fdmedyn   fap009x;   label values fnmedyn   fap009x;
label values fhosp2yn  fap009x;   label values fhchmyn   fap009x;
label values fhcphryn  fap009x;   label values fhcdvyn   fap009x;
label values f10dvyn   fap009x;

label values fhicovyn  fap009x;   label values fprcooh   fap009x;
label values covconf   fap080x;   label values fhicost   fap081x;
label values fmedbill  fap009x;   label values fmedbpay  fap009x;
label values fmedbnop  fap009x;   label values fsaf      fap009x;



label values fsalyn    fap009x;   label values fseincyn  fap009x;
label values fssrryn   fap009x;   label values fpensyn   fap009x;
label values fopensyn  fap009x;   label values fssiyn    fap009x;
label values ftanfyn   fap009x;   label values fowbenyn  fap009x;
label values fintr1yn  fap009x;   label values fdivdyn   fap009x;
label values fchspyn   fap009x;   label values fincotyn  fap009x;
label values incgrp4   fap114x;   label values incgrp5   fap115x;
label values rat_cat4  fap116x;   label values rat_cat5  fap117x;
label values houseown  fap118x;   label values fgah      fap009x;
label values fssaplyn  fap009x;   label values fsdaplyn  fap009x;
label values fsnap     fap009x;   label values fsnapmyr  fap011x;
label values fwicyn    fap009x;


save "$OUT/2014/familyxx", replace;

#delimit cr
log close

