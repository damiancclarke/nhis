log using "$LOG/samchild.log", replace

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
 str  hhx           7 -  12 str  fmx          13 -  14
 str  fpx          15 -  16      wtia_sc      17 -  22
      wtfa_sc      23 -  28

 str  csrespno     29 -  30      csreltiv     31 -  32

      bwgtlb       33 -  34      bwgtoz       35 -  36
      bwgtmgr      37 -  40      amr1         41 -  41
      aodd1        42 -  42      add2         43 -  43
      amr2         44 -  44      aodd2        45 -  45
      condl1       46 -  46      condl2       47 -  47
      condl3       48 -  48      condl4       49 -  49
      condl5       50 -  50      condl6       51 -  51
      condl7       52 -  52      condl8       53 -  53
      condl9       54 -  54      condl10      55 -  55
      cpox         56 -  56      cpox12mo     57 -  57
      cashmev      58 -  58      casstill     59 -  59
      cashyr       60 -  60      casmeryr     61 -  61
      hayf1        62 -  62      rallg1       63 -  63
      dallg1       64 -  64      sallg1       65 -  65
      diarh1       66 -  66      anemia1      67 -  67
      earinf1      68 -  68      seize1       69 -  69
      hayf2        70 -  70      rallg2       71 -  71
      dallg2       72 -  72      sallg2       73 -  73
      diarh2       74 -  74      anemia2      75 -  75
      fhead        76 -  76      earinf2      77 -  77
      seize2       78 -  78      stutter      79 -  79
      chstatyr     80 -  80      schdayr1     81 -  83
      ccold2w      84 -  84      cintil2w     85 -  85
      chearst      86 -  86      cvision      87 -  87
      cblind       88 -  88      ihspeq       89 -  89
      ihmob        90 -  90      ihmobyr      91 -  91
      probrx       92 -  92      learnd       93 -  93
      cmhagm15     94 -  94      mhiboy2      95 -  96
      cmhagf15     97 -  97      mhigrl2      98 -  99

      cusualpl    100 - 100      cplkind     101 - 101
      chcplrou    102 - 102      chcplknd    103 - 103
      chcchgyr    104 - 104      chcchghi    105 - 105
      chcdlyr1    106 - 106      chcdlyr2    107 - 107
      chcdlyr3    108 - 108      chcdlyr4    109 - 109
      chcdlyr5    110 - 110      chcafyr     111 - 111
      chcafyr1    112 - 112      chcafyr2    113 - 113
      chcafyr3    114 - 114      chcafyr4    115 - 115
      cdnlongr    116 - 116      chcsyr11    117 - 117
      chcsyr12    118 - 118      chcsyr13    119 - 119
      chcsyr14    120 - 120      chcsyr1     121 - 121
      chcsyr2     122 - 122      chcsyr3     123 - 123
      chcsyr4     124 - 124      chcsyr5     125 - 125
      chcsyr6     126 - 126      chcsyr7     127 - 127
      chcsyr81    128 - 128      chcsyr82    129 - 129
      chcsyr10    130 - 130      chcsyrem    131 - 131
      chpxyr_c    132 - 132      chernoy2    133 - 134
      chchyr      135 - 135      chchmoyr    136 - 137
      chchnoy2    138 - 139      chcnoyr2    140 - 141
      csrgyr      142 - 142      rsrgnoyr    143 - 144
      cmdlongr    145 - 145

      rscl1_s1    146 - 146      rscl1_h1    147 - 147
      rscl1_e1    148 - 148      rscl1_s2    149 - 149
      rscl1_c1    150 - 150      rscl2_p1    151 - 151
      rscl2_c2    152 - 152      rscl2_e2    153 - 153
      rscl2_s3    154 - 154      rscl2_h2    155 - 155
      rscl3_p2    156 - 156      rscl3_c3    157 - 157
      rscl3_e3    158 - 158      rscl3_p3    159 - 159
      rscl3_h3    160 - 160      rscl4_e4    161 - 161
      rscl4_s4    162 - 162      rscl4_c4    163 - 163
      rscl4_p4    164 - 164      rscl4_s5    165 - 165
      rscl5_h4    166 - 166      rscl5_c5    167 - 167
      rscl5_p5    168 - 168      rscl5_e5    169 - 169
      rscl5_h5    170 - 170      rscl6       171 - 171
      cscl7       172 - 172      rscl8       173 - 173
      rscl9_hl    174 - 174      rscl9_fr    175 - 175
      rscl9_cl    176 - 176      rscl9_la    177 - 177
      rscl10      178 - 178

using "$DAT/2004/samchild.dat";
replace wtia_sc = wtia_sc/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: HH identifier";
label variable fmx      "IDN.000_35.000: Family Serial Number";
label variable fpx      "IDN.000_40.000: Person Number (in family)";
label variable wtia_sc  "IDN.000_65.000: Weight - Interim Annual";
label variable wtfa_sc  "IDN.000_70.000: Weight - Final Annual";

label variable csrespno "CID.010_00.000: Person # of available SC respondent";
label variable csreltiv "CID.030_00.000: Person's relationship to child";

label variable bwgtlb   "CHS.010_01.000: Birth weight  (lb)";
label variable bwgtoz   "CHS.010_02.000: Birth weight (oz)";
label variable bwgtmgr  "CHS.011_00.000: Birth weight (grams)";
label variable amr1     "CHS.031_02.000: Ever told SC had mental retardation";
label variable aodd1    "
CHS.031_03.000: Ever told SC had other developmental delay";
label variable add2     "CHS.032_01.000: Ever told SC had ADHD/ADD";
label variable amr2     "CHS.032_02.000: Ever told SC had mental retardation";
label variable aodd2    "
CHS.032_03.000: Ever told SC had other developmental delay";
label variable condl1   "CHS.060_01.000: Ever told SC had Down's syndrome";
label variable condl2   "CHS.060_02.000: Ever told SC had cerebral palsy";
label variable condl3   "CHS.060_03.000: Ever told SC had muscular dystrophy";
label variable condl4   "CHS.060_04.000: Ever told SC had cystic fibrosis";
label variable condl5   "CHS.060_05.000: Ever told SC had sickle cell anemia";
label variable condl6   "CHS.060_06.000: Ever told SC had autism";
label variable condl7   "CHS.060_07.000: Ever told SC had diabetes";
label variable condl8   "CHS.060_08.000: Ever told SC had arthritis";
label variable condl9   "
CHS.060_09.000: Ever told SC had congenital heart disease";
label variable condl10  "CHS.060_10.000: Ever told SC had other heart condition
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
label variable ccold2w  "CHS.230_00.000: Had a head/chest cold those 2 weeks";
label variable cintil2w "
CHS.240_00.000: Had stomach illness with vomiting/diarrhea, 2 weeks";
label variable chearst  "CHS.250_00.000: Hearing without hearing aid";
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
CHS.321_04.000.R01: Mental health indicator (MHI) scale score";
label variable cmhagf15 "CHS.361_04.000: Been unhappy/depressed, past 2 m";
label variable mhigrl2  "
CHS.361_04.000.R01: Mental health indicator (MHI) scale score";

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

label variable rscl1_s1 "CMH.010_01.000: Considerate of others feelings";
label variable rscl1_h1 "CMH.010_02.000: Restless/overactive";
label variable rscl1_e1 "
CMH.010_03.000: Often complains of headache, stomach aches or sickness";
label variable rscl1_s2 "CMH.010_04.000: Shares with other children/youth";
label variable rscl1_c1 "CMH.010_05.000: Often loses temper";
label variable rscl2_p1 "CMH.020_01.000: Solitary/prefers to play/be alone";
label variable rscl2_c2 "CMH.020_02.000: Well behaved/does what requested";
label variable rscl2_e2 "CMH.020_03.000: Many worries/often seems worried";
label variable rscl2_s3 "CMH.020_04.000: Helpful if someone hurt/ill";
label variable rscl2_h2 "CMH.020_05.000: Constantly fidgeting/squirming";
label variable rscl3_p2 "CMH.030_01.000: At least one good friend";
label variable rscl3_c3 "
CMH.030_02.000: Fights with other children/or bullies them (youth)";
label variable rscl3_e3 "CMH.030_03.000: Unhappy/depressed/tearful";
label variable rscl3_p3 "CMH.030_04.000: Liked by other children/youth";
label variable rscl3_h3 "CMH.030_05.000: Distracted/wandering concentration";
label variable rscl4_e4 "CMH.040_01.000: Nervous/clingy/loses confidence";
label variable rscl4_s4 "CMH.040_02.000: Kind to younger children";
label variable rscl4_c4 "CMH.040_03.000: Often lies OR cheats";
label variable rscl4_p4 "
CMH.040_04.000: Picked on or bullied by other children/youth";
label variable rscl4_s5 "CMH.040_05.000: Offers to help others";
label variable rscl5_h4 "CMH.050_01.000: Thinks things out before acting";
label variable rscl5_c5 "CMH.050_02.000: Steals from home/school";
label variable rscl5_p5 "
CMH.050_03.000: Gets along better w/adults than children/youth";
label variable rscl5_e5 "CMH.050_04.000: Has many fears/easily scared";
label variable rscl5_h5 "
CMH.050_05.000: Good attention/completes chores, homework";
label variable rscl6    "
CMH.060_00.000: Difficulties w/emotions/concentration/behavior/getting along";
label variable cscl7    "CMH.070_00.000: Length difficulties have been present";
label variable rscl8    "CMH.080_00.000: Difficulties upset/distress child";
label variable rscl9_hl "CMH.090_01.000: Difficulties interfere with home life";
label variable rscl9_fr "CMH.090_02.000: Difficulties interfere with friendships
";
label variable rscl9_cl "
CMH.090_03.000: Difficulties interfere with classroom learning";
label variable rscl9_la "
CMH.090_04.000: Difficulties interfere with leisure activities";
label variable rscl10   "
CMH.100_00.000: Difficulties put burden on respondent/family";

* DEFINE VALUE LABELS FOR REPORTS;

label define scp001x
   10               "10 Household"
   20               "20 Person"
   30               "30 Sample Adult"
   40               "40 Sample Child"
   60               "60 Family"
   70               "70 Injury/Poisoning Episode"
   75               "75 Injury/Poisoning Verbatim"
;
label define scp002x
   2004             "2004"
;
label define scp009x
   01               "01 Parent (Biological, adoptive, or step)"
   02               "02 Grandparent"
   03               "03 Aunt/Uncle"
   04               "04 Brother/Sister"
   05               "05 Other relative"
   06               "06 Legal guardian"
   07               "07 Foster parent"
   08               "08 Other non-relative"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp010x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp011x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp012x
   9997             "9997 Refused"
   9998             "9998 Not ascertained"
   9999             "9999 Don't know"
;
label define scp013x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp018x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp028x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   9                "9 Don't know"
;
label define scp052x
   1                "1 Better"
   2                "2 Worse"
   3                "3 About the same"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp053x
   000              "000 None"
   996              "996 Did not go to school"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define scp056x
   1                "1 Good"
   2                "2 A little trouble"
   3                "3 A lot of trouble"
   4                "4 Deaf"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp064x
   0                "0 Not true"
   1                "1 Sometimes true"
   2                "2 Often true"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp065x
   99               "99 Unknown"
;
label define scp068x
   1                "1 Yes"
   2                "2 There is NO place"
   3                "3 There is MORE THAN ONE place"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp069x
   1                "1 Clinic or health center"
   2                "2 Doctor's office or HMO"
   3                "3 Hospital emergency room"
   4                "4 Hospital outpatient department"
   5                "5 Some other place"
   6                "6 Doesn't go to one place most often"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp071x
   0                "0 Doesn't get preventive care anywhere"
   1                "1 Clinic or health center"
   2                "2 Doctor's office of HMO"
   3                "3 Hospital emergency room"
   4                "4 Hospital outpatient department"
   5                "5 Some other place"
   6                "6 Doesn't go to one place most often"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp084x
   0                "0 Never"
   1                "1 6 months or less"
   2                "2 More than 6 months, but not more than 1 year ago"
   3                "3 More than 1 year, but not more than 2 years ago"
   4                "4 More than 2 years, but not more than 5 years ago"
   5                "5 More than 5 years ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp101x
   00               "00 None"
   01               "01 1"
   02               "02 2-3"
   03               "03 4-5"
   04               "04 6-7"
   05               "05 8-9"
   06               "06 10-12"
   07               "07 13-15"
   08               "08 16 or more"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp103x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp104x
   01               "01 1"
   02               "02 2-3"
   03               "03 4-5"
   04               "04 6-7"
   05               "05 8-9"
   06               "06 10-12"
   07               "07 13-15"
   08               "08 16 or more"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp107x
   95               "95 95+ times"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp109x
   0                "0 Not true"
   1                "1 Somewhat true"
   2                "2 Certainly true"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp134x
   0                "0 No"
   1                "1 Yes, minor difficulties"
   2                "2 Yes, definite difficulties"
   3                "3 Yes, severe difficulties"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp135x
   1                "1 Less than a month"
   2                "2 1-5 months"
   3                "3 6-12 months"
   4                "4 Over 12 months"
   7                "7 Refused"
   8                "8 Not  Ascertained"
   9                "9 Don't know"
;
label define scp136x
   0                "0 Not at all"
   1                "1 A little"
   2                "2 A medium amount"
   3                "3 A great deal"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   scp001x;   label values srvy_yr   scp002x;

label values csreltiv  scp009x;

label values bwgtlb    scp010x;   label values bwgtoz    scp011x;
label values bwgtmgr   scp012x;   label values amr1      scp013x;
label values aodd1     scp013x;   label values add2      scp013x;
label values amr2      scp013x;   label values aodd2     scp013x;
label values condl1    scp018x;   label values condl2    scp018x;
label values condl3    scp018x;   label values condl4    scp018x;
label values condl5    scp018x;   label values condl6    scp018x;
label values condl7    scp018x;   label values condl8    scp018x;
label values condl9    scp018x;   label values condl10   scp018x;
label values cpox      scp028x;   label values cpox12mo  scp013x;
label values cashmev   scp013x;   label values casstill  scp013x;
label values cashyr    scp013x;   label values casmeryr  scp013x;
label values hayf1     scp013x;   label values rallg1    scp013x;
label values dallg1    scp013x;   label values sallg1    scp013x;
label values diarh1    scp013x;   label values anemia1   scp013x;
label values earinf1   scp013x;   label values seize1    scp013x;
label values hayf2     scp013x;   label values rallg2    scp013x;
label values dallg2    scp013x;   label values sallg2    scp013x;
label values diarh2    scp013x;   label values anemia2   scp013x;
label values fhead     scp013x;   label values earinf2   scp013x;
label values seize2    scp013x;   label values stutter   scp013x;
label values chstatyr  scp052x;   label values schdayr1  scp053x;
label values ccold2w   scp013x;   label values cintil2w  scp013x;
label values chearst   scp056x;   label values cvision   scp013x;
label values cblind    scp013x;   label values ihspeq    scp013x;
label values ihmob     scp013x;   label values ihmobyr   scp013x;
label values probrx    scp013x;   label values learnd    scp013x;
label values cmhagm15  scp064x;   label values mhiboy2   scp065x;
label values cmhagf15  scp064x;   label values mhigrl2   scp065x;

label values cusualpl  scp068x;   label values cplkind   scp069x;
label values chcplrou  scp013x;   label values chcplknd  scp071x;
label values chcchgyr  scp013x;   label values chcchghi  scp013x;
label values chcdlyr1  scp013x;   label values chcdlyr2  scp013x;
label values chcdlyr3  scp013x;   label values chcdlyr4  scp013x;
label values chcdlyr5  scp013x;   label values chcafyr   scp013x;
label values chcafyr1  scp013x;   label values chcafyr2  scp013x;
label values chcafyr3  scp013x;   label values chcafyr4  scp013x;
label values cdnlongr  scp084x;   label values chcsyr11  scp013x;
label values chcsyr12  scp013x;   label values chcsyr13  scp013x;
label values chcsyr14  scp013x;   label values chcsyr1   scp013x;
label values chcsyr2   scp013x;   label values chcsyr3   scp013x;
label values chcsyr4   scp013x;   label values chcsyr5   scp013x;
label values chcsyr6   scp013x;   label values chcsyr7   scp013x;
label values chcsyr81  scp013x;   label values chcsyr82  scp013x;
label values chcsyr10  scp013x;   label values chcsyrem  scp013x;
label values chpxyr_c  scp013x;   label values chernoy2  scp101x;
label values chchyr    scp013x;   label values chchmoyr  scp103x;
label values chchnoy2  scp104x;   label values chcnoyr2  scp101x;
label values csrgyr    scp013x;   label values rsrgnoyr  scp107x;
label values cmdlongr  scp084x;

label values rscl1_s1  scp109x;   label values rscl1_h1  scp109x;
label values rscl1_e1  scp109x;   label values rscl1_s2  scp109x;
label values rscl1_c1  scp109x;   label values rscl2_p1  scp109x;
label values rscl2_c2  scp109x;   label values rscl2_e2  scp109x;
label values rscl2_s3  scp109x;   label values rscl2_h2  scp109x;
label values rscl3_p2  scp109x;   label values rscl3_c3  scp109x;
label values rscl3_e3  scp109x;   label values rscl3_p3  scp109x;
label values rscl3_h3  scp109x;   label values rscl4_e4  scp109x;
label values rscl4_s4  scp109x;   label values rscl4_c4  scp109x;
label values rscl4_p4  scp109x;   label values rscl4_s5  scp109x;
label values rscl5_h4  scp109x;   label values rscl5_c5  scp109x;
label values rscl5_p5  scp109x;   label values rscl5_e5  scp109x;
label values rscl5_h5  scp109x;   label values rscl6     scp134x;
label values cscl7     scp135x;   label values rscl8     scp136x;
label values rscl9_hl  scp136x;   label values rscl9_fr  scp136x;
label values rscl9_cl  scp136x;   label values rscl9_la  scp136x;
label values rscl10    scp136x;

save "$OUT/2004/samchild", replace;

#delimit cr
log close
