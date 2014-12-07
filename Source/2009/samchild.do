global DAT "~/database/NHIS/Data/raw/2009"
global OUT "~/database/NHIS/Data/dta/2009"
global LOG "~/database/NHIS/Log"

log using "$LOG/samchild.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 APRIL 19, 2010 11:33 AM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2009 NHIS Public Use Sample Child ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE samchild.dta AND samchild.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd C:\nhis2009\

 THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
 LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
 USER SHOULD ENTER THE FOLLOWING STATA COMMAND: log close
 
 THIS IS STORED IN samchild.do
*********************************************************************;
clear;
set mem 200m;

* INPUT ALL VARIABLES;

infix
      rectype       1 -   2      srvy_yr       3 -   6
  str hhx           7 -  12      intv_qrt     13 -  13
      assignwk     14 -  15  str fmx          16 -  17
  str fpx          18 -  19      wtia_sc      20 -  26
      wtfa_sc      27 -  32

      region       33 -  33      strat_p      34 -  36
      psu_p        37 -  38

      sex          39 -  39      hispan_i     40 -  41
      racerpi2     42 -  43      mracrpi2     44 -  45
      mracbpi2     46 -  47      age_p        48 -  49

  str csrespno     50 -  51      csreltiv     52 -  53

      bwgtlb       54 -  55      bwgtoz       56 -  57
      bwgtmgr      58 -  61      chght_tc     62 -  63
      cwght_tc     64 -  66      bmi_sc       67 -  70
      amr1         71 -  71      aodd1        72 -  72
      add2         73 -  73      amr2         74 -  74
      aodd2        75 -  75      ccondl01     76 -  76
      ccondl02     77 -  77      ccondl03     78 -  78
      ccondl04     79 -  79      ccondl05     80 -  80
      ccondl06     81 -  81      ccondl07     82 -  82
      ccondl08     83 -  83      ccondl09     84 -  84
      ccondl10     85 -  85      cpox         86 -  86
      cpox12mo     87 -  87      cashmev      88 -  88
      casstill     89 -  89      cashyr       90 -  90
      casmeryr     91 -  91      hayf1        92 -  92
      rallg1       93 -  93      dallg1       94 -  94
      sallg1       95 -  95      diarh1       96 -  96
      anemia1      97 -  97      earinf1      98 -  98
      seize1       99 -  99      hayf2       100 - 100
      rallg2      101 - 101      dallg2      102 - 102
      sallg2      103 - 103      diarh2      104 - 104
      anemia2     105 - 105      fhead       106 - 106
      earinf2     107 - 107      seize2      108 - 108
      stutter     109 - 109      chstatyr    110 - 110
      schdayr1    111 - 113      ccold2w     114 - 114
      cintil2w    115 - 115      chearst1    116 - 116
      cvision     117 - 117      cblind      118 - 118
      ihspeq      119 - 119      ihmob       120 - 120
      ihmobyr     121 - 121      probrx      122 - 122
      learnd      123 - 123      cmhagm15    124 - 124
      mhiboy2     125 - 126      cmhagf15    127 - 127
      mhigrl2     128 - 129

      cusualpl    130 - 130      cplkind     131 - 131
      chcplrou    132 - 132      chcplknd    133 - 133
      chcchgyr    134 - 134      chcchghi    135 - 135
      chcdlyr1    136 - 136      chcdlyr2    137 - 137
      chcdlyr3    138 - 138      chcdlyr4    139 - 139
      chcdlyr5    140 - 140      chcafyr     141 - 141
      chcafyr1    142 - 142      chcafyr2    143 - 143
      chcafyr3    144 - 144      chcafyr4    145 - 145
      cdnlongr    146 - 146      chcsyr11    147 - 147
      chcsyr12    148 - 148      chcsyr13    149 - 149
      chcsyr14    150 - 150      chcsyr1     151 - 151
      chcsyr2     152 - 152      chcsyr3     153 - 153
      chcsyr4     154 - 154      chcsyr5     155 - 155
      chcsyr6     156 - 156      chcsyr7     157 - 157
      chcsyr81    158 - 158      chcsyr82    159 - 159
      chcsyr10    160 - 160      chcsyrem    161 - 161
      chpxyr_c    162 - 162      chernoy2    163 - 164
      chchyr      165 - 165      chchmoyr    166 - 167
      chchnoy2    168 - 169      chcnoyr2    170 - 171
      csrgyr      172 - 172      rsrgnoyr    173 - 174
      cmdlongr    175 - 175

      rscl6       176 - 176

      cshfluyr    177 - 177      cshflu_m    178 - 179
      cshflu_y    180 - 183      cspfluyr    184 - 184
      cspflu_m    185 - 186      cspflu_y    187 - 190

using "$DAT/samchild.dat";
replace wtia_sc = wtia_sc/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: HH identifier";
label variable intv_qrt "IDN.000_25.000: Interview Quarter";
label variable assignwk "IDN.000_30.000: Assignment Week";
label variable fmx      "IDN.000_35.000: Family Serial Number";
label variable fpx      "IDN.000_40.000: Person Number (Within family)";
label variable wtia_sc  "IDN.000_65.000: Weight - Interim Annual";
label variable wtfa_sc  "IDN.000_70.000: Weight - Final Annual";

label variable region   "UCF.000_00.000: Region";
label variable strat_p  "
UCF.000_00.000: Pseudo-stratum for public use file variance estimation";
label variable psu_p    "
UCF.000_00.000: Pseudo-PSU for public use file variance estimation";

label variable sex      "HHC.110_00.000: Sex";
label variable hispan_i "HHC.180_00.000: Hispanic subgroup detail";
label variable racerpi2 "HHC.200_01.000: OMB groups w/multiple race";
label variable mracrpi2 "
HHC.200_01.000: Race coded to single/multiple race group";
label variable mracbpi2 "
HHC.200_01.000: Race coded to single/multiple race group";
label variable age_p    "HHC.420_00.000: Age";

label variable csrespno "CID.010_00.000: Person # of available SC respondent";
label variable csreltiv "CID.030_00.000: Person's relationship to child";

label variable bwgtlb   "CHS.010_01.000: Birth weight in pounds";
label variable bwgtoz   "CHS.010_02.000: Birth weight in ounces";
label variable bwgtmgr  "CHS.011_00.000: Birth weight in grams";
label variable chght_tc "
CHS.020_02.000: Total current height in inches (truncated)";
label variable cwght_tc "CHS.022_02.000: Current weight in pounds (truncated)";
label variable bmi_sc   "CHS.024_05.000: Body Mass Index (BMI)";
label variable amr1     "CHS.031_02.000: Ever told SC had mental retardation";
label variable aodd1    "
CHS.031_03.000: Ever told SC had other developmental delay";
label variable add2     "CHS.032_01.000: Ever told SC had ADHD/ADD";
label variable amr2     "CHS.032_02.000: Ever told SC had mental retardation";
label variable aodd2    "
CHS.032_03.000: Ever told SC had other developmental delay";
label variable ccondl01 "CHS.061_01.000: Ever told SC had Down syndrome";
label variable ccondl02 "CHS.061_02.000: Ever told SC had cerebral palsy";
label variable ccondl03 "CHS.061_03.000: Ever told SC had muscular dystrophy";
label variable ccondl04 "CHS.061_04.000: Ever told SC had cystic fibrosis";
label variable ccondl05 "CHS.061_05.000: Ever told SC had sickle cell anemia";
label variable ccondl06 "CHS.061_06.000: Ever told SC had autism";
label variable ccondl07 "CHS.061_07.000: Ever told SC had diabetes";
label variable ccondl08 "CHS.061_08.000: Ever told SC had arthritis";
label variable ccondl09 "
CHS.061_09.000: Ever told SC had congenital heart disease";
label variable ccondl10 "CHS.061_10.000: Ever told SC had other heart condition
";
label variable cpox     "CHS.070_00.000: Ever had chickenpox";
label variable cpox12mo "CHS.072_00.000: Chickenpox, past 12 m";
label variable cashmev  "CHS.080_00.000: Ever been told SC had asthma";
label variable casstill "CHS.085_00.000: Still have asthma";
label variable cashyr   "CHS.090_00.000: Had an asthma episode/attack, past 12 m
";
label variable casmeryr "
CHS.100_00.000: Had visit to ER due to asthma, past 12 m";
label variable hayf1    "CHS.111_01.000: Had hay fever, past 12 m";
label variable rallg1   "CHS.111_02.000: Had respiratory allergy, past 12 m";
label variable dallg1   "CHS.111_03.000: Had food/digestive allergy, past 12 m";
label variable sallg1   "CHS.111_04.000: Had eczema/skin allergy, past 12 m";
label variable diarh1   "
CHS.111_05.000: Had frequent diarrhea/colitis, past 12 m";
label variable anemia1  "CHS.111_06.000: Had anemia, past 12 m";
label variable earinf1  "CHS.111_08.000: Had 3+ ear infections, past 12 m";
label variable seize1   "CHS.111_09.000: Had seizures, past 12 m";
label variable hayf2    "CHS.115_01.000: Had hay fever, past 12 m";
label variable rallg2   "CHS.115_02.000: Had respiratory allergy, past 12 m";
label variable dallg2   "CHS.115_03.000: Had food/digestive allergy, past 12 m";
label variable sallg2   "CHS.115_04.000: Had eczema/skin allergy, past 12 m";
label variable diarh2   "
CHS.115_05.000: Had frequent diarrhea/colitis, past 12 m";
label variable anemia2  "CHS.115_06.000: Had anemia, past 12 m";
label variable fhead    "
CHS.115_07.000: Had frequent headaches/migraines, past 12 m";
label variable earinf2  "CHS.115_08.000: Had 3+ ear infections, past 12 m";
label variable seize2   "CHS.115_09.000: Had seizures, past 12 m";
label variable stutter  "CHS.115_10.000: Stuttered/stammered, past 12 m";
label variable chstatyr "CHS.210_00.000: Health better, worse, or about the same
";
label variable schdayr1 "
CHS.220_00.000: Days missed due to illness/injury, past 12 m";
label variable ccold2w  "
CHS.230_00.000: Had a head/chest cold, 2 week reference period";
label variable cintil2w "
CHS.240_00.000: Had stomach illness with vomiting/diarrhea, 2 week reference per
iod";
label variable chearst1 "CHS.250_00.000: Hearing without hearing aid";
label variable cvision  "CHS.260_00.000: Trouble seeing";
label variable cblind   "CHS.270_00.000: Blind/unable to see at all";
label variable ihspeq   "
CHS.290_00.000: Need special equipment due to impairment/health problem";
label variable ihmob    "
CHS.300_00.000: Impairment/health problem limit crawl/walk/run/play";
label variable ihmobyr  "
CHS.310_00.000: Impairment/health problem lasted/will last 12+ m";
label variable probrx   "CHS.311_00.000: Taken RX medication for 3+ m";
label variable learnd   "CHS.312_00.000: Ever told SC had a learning disability
";
label variable cmhagm15 "CHS.321_04.000: Been unhappy/depressed, past 2 m";
label variable mhiboy2  "
CHS.321_04.000: Mental health indicator (MHI) scale score";
label variable cmhagf15 "CHS.361_04.000: Been unhappy/depressed, past 2 m";
label variable mhigrl2  "
CHS.361_04.000: Mental health indicator (MHI) scale score";

label variable cusualpl "CAU.020_00.000: Place USUALLY go when sick";
label variable cplkind  "CAU.030_00.000: Place to go when sick (most often)";
label variable chcplrou "
CAU.035_00.000: USUALLY go there for routine/preventive care";
label variable chcplknd "
CAU.037_00.000: Place USUALLY go for routine/preventive care";
label variable chcchgyr "CAU.040_00.000: Change health care place, past 12 m";
label variable chcchghi "CAU.050_00.000: Change related to health insurance";
label variable chcdlyr1 "
CAU.080_01.000: Couldn't get through on phone, past 12 m";
label variable chcdlyr2 "
CAU.080_02.000: Couldn't get appointment soon enough, past 12 m";
label variable chcdlyr3 "
CAU.080_03.000: Wait too long in doctor's office, past 12 m";
label variable chcdlyr4 "CAU.080_04.000: Not open when you could go, past 12 m";
label variable chcdlyr5 "CAU.080_05.000: No transportation, past 12 m";
label variable chcafyr  "
CAU.130_00.000: Can't afford prescription medicine, past 12 m";
label variable chcafyr1 "
CAU.135_01.000: Can't afford prescription medicine, past 12 m";
label variable chcafyr2 "
CAU.135_02.000: Can't afford mental care/counseling, past 12 m";
label variable chcafyr3 "CAU.135_03.000: Can't afford dental care, past 12 m";
label variable chcafyr4 "CAU.135_04.000: Can't afford eyeglasses, past 12 m";
label variable cdnlongr "CAU.160_00.000: Time since last saw dentist";
label variable chcsyr11 "CAU.170_01.000: Seen/talked to eye doctor, past 12 m";
label variable chcsyr12 "CAU.170_02.000: Seen/talked to foot doctor, past 12 m";
label variable chcsyr13 "
CAU.170_03.000: Seen/talked to therapist (PT/OT/etc), past 12 m";
label variable chcsyr14 "CAU.170_04.000: Seen/talked to a NP/PA, past 12 m";
label variable chcsyr1  "
CAU.175_01.000: Seen/talked to mental health professional, past 12 m";
label variable chcsyr2  "CAU.175_02.000: Seen/talked to eye doctor, past 12 m";
label variable chcsyr3  "CAU.175_03.000: Seen/talked to foot doctor, past 12 m";
label variable chcsyr4  "CAU.175_04.000: Seen/talked to chiropractor, past 12 m
";
label variable chcsyr5  "
CAU.175_05.000: Seen/talked to therapist (PT/OT/etc), past 12 m";
label variable chcsyr6  "CAU.175_06.000: Seen/talked to NP/PA/midwife, past 12 m
";
label variable chcsyr7  "
CAU.230_00.000: Seen/talked to obstetrician/gynecologist, past 12 m";
label variable chcsyr81 "
CAU.240_01.000: Seen/talked to a medical specialist, past 12 m";
label variable chcsyr82 "
CAU.240_02.000: Seen/talked to a general doctor, past 12 m";
label variable chcsyr10 "CAU.260_00.000: Doctor treats both children and adults
";
label variable chcsyrem "
CAU.265_00.000: Seen/talked to doctor for emotional/behavioral problem";
label variable chpxyr_c "CAU.270_00.000: Had well-child checkup, past 12 m";
label variable chernoy2 "CAU.280_00.000: # times in ER/ED, past 12 m";
label variable chchyr   "
CAU.290_00.000: Received home care from health professional, past 12 m";
label variable chchmoyr "CAU.300_00.000: # of months of home care, past 12 m";
label variable chchnoy2 "CAU.310_00.000: Total number of home visits";
label variable chcnoyr2 "
CAU.320_00.000: Total number of office visits, past 12 m";
label variable csrgyr   "
CAU.330_00.000: Had surgery/surgical procedure, past 12 m";
label variable rsrgnoyr "CAU.340_00.000: # of outpatient surgeries, past 12 m";
label variable cmdlongr "
CAU.345_00.000: Time since last seen/talked to health professional";

label variable rscl6    "
CMB.030_00.000: Difficulties w/emotions/concentration/behavior/getting along";

label variable cshfluyr "CFI.010_00.000: Flu shot past 12 m";
label variable cshflu_m "CFI.015_01.000: Month of most recent flu shot";
label variable cshflu_y "CFI.015_02.000: Year of most recent flu shot";
label variable cspfluyr "CFI.020_00.000: Flu nasal spray past 12 m";
label variable cspflu_m "CFI.025_01.000: Month of most recent flu nasal vaccine
";
label variable cspflu_y "CFI.025_02.000: Year of most recent flu nasal vaccine";

* DEFINE VALUE LABELS FOR REPORTS;

label define scp001x
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
label define scp004x
   1        "1 Quarter 1"
   2        "2 Quarter 2"
   3        "3 Quarter 3"
   4        "4 Quarter 4"
;
label define scp005x
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
label define scp010x
   1        "1 Northeast"
   2        "2 Midwest"
   3        "3 South"
   4        "4 West"
;
label define scp013x
   1        "1 Male"
   2        "2 Female"
;
label define scp014x
   00       "00 Multiple Hispanic"
   01       "01 Puerto Rico"
   02       "02 Mexican"
   03       "03 Mexican-American"
   04       "04 Cuban/Cuban American"
   05       "05 Dominican (Republic)"
   06       "06 Central or South American"
   07       "07 Other Latin American, type not specified"
   08       "08 Other Spanish"
   09       "09 Hispanic/Latino/Spanish, non-specific type"
   10       "10 Hispanic/Latino/Spanish, type refused"
   11       "11 Hispanic/Latino/Spanish, type not ascertained"
   12       "12 Not Hispanic/Spanish origin"
;
label define scp015x
   01       "01 White only"
   02       "02 Black/African American only"
   03       "03 AIAN only"
   04       "04 Asian only"
   05       "05 Race group not releasable (See file layout)"
   06       "06 Multiple race"
;
label define scp016x
   01       "01 White"
   02       "02 Black/African American"
   03       "03 Indian (American), Alaska Native"
   09       "09 Asian Indian"
   10       "10 Chinese"
   11       "11 Filipino"
   15       "15 Other Asian (See file layout)"
   16       "16 Primary race not releasable (See file layout)"
   17       "17 Multiple race, no primary race selected"
;
label define scp017x
   01       "01 White"
   02       "02 Black/African American"
   03       "03 Indian (American) (includes Eskimo, Aleut)"
   06       "06 Chinese"
   07       "07 Filipino"
   12       "12 Asian Indian"
   16       "16 Other race (See file layout)"
   17       "17 Multiple race, no primary race selected"
;
label define scp018x
   00       "00 Under 1 year"
   85       "85 85+ years"
;
label define scp020x
   01       "01 Parent (Biological, adoptive, or step)"
   02       "02 Grandparent"
   03       "03 Aunt/Uncle"
   04       "04 Brother/Sister"
   05       "05 Other relative"
   06       "06 Legal guardian"
   07       "07 Foster parent"
   08       "08 Other non-relative"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp021x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp022x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp023x
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define scp024x
   96       "96 Not available"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Unknown"
;
label define scp025x
   996      "996 Not available"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Unknown"
;
label define scp026x
   9995     "9995 99.95+"
   9999     "9999 Unknown"
;
label define scp027x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp032x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp042x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   9        "9 Don't know"
;
label define scp066x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp067x
   000      "000 None"
   996      "996 Did not go to school"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp070x
   1        "1 Excellent"
   2        "2 Good"
   3        "3 A little trouble hearing"
   4        "4 Moderate trouble"
   5        "5 A lot of trouble"
   6        "6 Deaf"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp078x
   0        "0 Not true"
   1        "1 Sometimes true"
   2        "2 Often true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp079x
   99       "99 Unknown"
;
label define scp082x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp083x
   1        "1 Clinic or health center"
   2        "2 Doctor's office or HMO"
   3        "3 Hospital emergency room"
   4        "4 Hospital outpatient department"
   5        "5 Some other place"
   6        "6 Doesn't go to one place most often"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp085x
   0        "0 Doesn't get preventive care anywhere"
   1        "1 Clinic or health center"
   2        "2 Doctor's office or HMO"
   3        "3 Hospital emergency room"
   4        "4 Hospital outpatient department"
   5        "5 Some other place"
   6        "6 Doesn't go to one place most often"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp098x
   0        "0 Never"
   1        "1 6 months or less"
   2        "2 More than 6 months, but not more than 1 year ago"
   3        "3 More than 1 year, but not more than 2 years ago"
   4        "4 More than 2 years, but not more than 5 years ago"
   5        "5 More than 5 years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp115x
   00       "00 None"
   01       "01 1"
   02       "02 2-3"
   03       "03 4-5"
   04       "04 6-7"
   05       "05 8-9"
   06       "06 10-12"
   07       "07 13-15"
   08       "08 16 or more"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp117x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp118x
   01       "01 1"
   02       "02 2-3"
   03       "03 4-5"
   04       "04 6-7"
   05       "05 8-9"
   06       "06 10-12"
   07       "07 13-15"
   08       "08 16 or more"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp121x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp123x
   0        "0 No"
   1        "1 Yes, minor difficulties"
   2        "2 Yes, definite difficulties"
   3        "3 Yes, severe difficulties"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp125x
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
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   scp001x;   label values intv_qrt  scp004x;
label values assignwk  scp005x;

label values region    scp010x;

label values sex       scp013x;   label values hispan_i  scp014x;
label values racerpi2  scp015x;   label values mracrpi2  scp016x;
label values mracbpi2  scp017x;   label values age_p     scp018x;

label values csreltiv  scp020x;

label values bwgtlb    scp021x;   label values bwgtoz    scp022x;
label values bwgtmgr   scp023x;   label values chght_tc  scp024x;
label values cwght_tc  scp025x;   label values bmi_sc    scp026x;
label values amr1      scp027x;   label values aodd1     scp027x;
label values add2      scp027x;   label values amr2      scp027x;
label values aodd2     scp027x;   label values ccondl01  scp032x;
label values ccondl02  scp032x;   label values ccondl03  scp032x;
label values ccondl04  scp032x;   label values ccondl05  scp032x;
label values ccondl06  scp032x;   label values ccondl07  scp032x;
label values ccondl08  scp032x;   label values ccondl09  scp032x;
label values ccondl10  scp032x;   label values cpox      scp042x;
label values cpox12mo  scp027x;   label values cashmev   scp027x;
label values casstill  scp027x;   label values cashyr    scp027x;
label values casmeryr  scp027x;   label values hayf1     scp027x;
label values rallg1    scp027x;   label values dallg1    scp027x;
label values sallg1    scp027x;   label values diarh1    scp027x;
label values anemia1   scp027x;   label values earinf1   scp027x;
label values seize1    scp027x;   label values hayf2     scp027x;
label values rallg2    scp027x;   label values dallg2    scp027x;
label values sallg2    scp027x;   label values diarh2    scp027x;
label values anemia2   scp027x;   label values fhead     scp027x;
label values earinf2   scp027x;   label values seize2    scp027x;
label values stutter   scp027x;   label values chstatyr  scp066x;
label values schdayr1  scp067x;   label values ccold2w   scp027x;
label values cintil2w  scp027x;   label values chearst1  scp070x;
label values cvision   scp027x;   label values cblind    scp027x;
label values ihspeq    scp027x;   label values ihmob     scp027x;
label values ihmobyr   scp027x;   label values probrx    scp027x;
label values learnd    scp027x;   label values cmhagm15  scp078x;
label values mhiboy2   scp079x;   label values cmhagf15  scp078x;
label values mhigrl2   scp079x;

label values cusualpl  scp082x;   label values cplkind   scp083x;
label values chcplrou  scp027x;   label values chcplknd  scp085x;
label values chcchgyr  scp027x;   label values chcchghi  scp027x;
label values chcdlyr1  scp027x;   label values chcdlyr2  scp027x;
label values chcdlyr3  scp027x;   label values chcdlyr4  scp027x;
label values chcdlyr5  scp027x;   label values chcafyr   scp027x;
label values chcafyr1  scp027x;   label values chcafyr2  scp027x;
label values chcafyr3  scp027x;   label values chcafyr4  scp027x;
label values cdnlongr  scp098x;   label values chcsyr11  scp027x;
label values chcsyr12  scp027x;   label values chcsyr13  scp027x;
label values chcsyr14  scp027x;   label values chcsyr1   scp027x;
label values chcsyr2   scp027x;   label values chcsyr3   scp027x;
label values chcsyr4   scp027x;   label values chcsyr5   scp027x;
label values chcsyr6   scp027x;   label values chcsyr7   scp027x;
label values chcsyr81  scp027x;   label values chcsyr82  scp027x;
label values chcsyr10  scp027x;   label values chcsyrem  scp027x;
label values chpxyr_c  scp027x;   label values chernoy2  scp115x;
label values chchyr    scp027x;   label values chchmoyr  scp117x;
label values chchnoy2  scp118x;   label values chcnoyr2  scp115x;
label values csrgyr    scp027x;   label values rsrgnoyr  scp121x;
label values cmdlongr  scp098x;

label values rscl6     scp123x;

label values cshfluyr  scp027x;   label values cshflu_m  scp125x;
label values cshflu_y  scp023x;   label values cspfluyr  scp027x;
label values cspflu_m  scp125x;   label values cspflu_y  scp023x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sc];
save "$OUT/samchild", replace;

#delimit cr

* data file is stored in samchild.dta
* log  file is stored in samchild.log

log close
