global DAT "~/database/NHIS/Data/raw/2007"
global OUT "~/database/NHIS/Data/dta/2007"
global LOG "~/database/NHIS/Log"

log using "$LOG/samchild.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 MAY 22, 2008  1:37 PM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2007 NHIS Public Use Sample Child ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE samchild.dta AND samchild.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2007\

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
      bwgtmgr      58 -  61      amr1         62 -  62
      aodd1        63 -  63      add2         64 -  64
      amr2         65 -  65      aodd2        66 -  66
      condl1       67 -  67      condl2       68 -  68
      condl3       69 -  69      condl4       70 -  70
      condl5       71 -  71      condl6       72 -  72
      condl7       73 -  73      condl8       74 -  74
      condl9       75 -  75      condl10      76 -  76
      cpox         77 -  77      cpox12mo     78 -  78
      cashmev      79 -  79      casstill     80 -  80
      cashyr       81 -  81      casmeryr     82 -  82
      lungyr       83 -  83      canceryr     84 -  84
      neuroyr      85 -  85      urinyr       86 -  86
      gumyr        87 -  87      fluyr        88 -  88
      sinusyr      89 -  89      strepyr      90 -  90
      hayf1        91 -  91      rallg1       92 -  92
      dallg1       93 -  93      sallg1       94 -  94
      diarh1       95 -  95      anemia1      96 -  96
      earinf1      97 -  97      seize1       98 -  98
      alothyr1     99 -  99      abdomyr1    100 - 100
      backyr1     101 - 101      pnothyr1    102 - 102
      fatigyr1    103 - 103      fevryr1     104 - 104
      coldyr1     105 - 105      thothyr1    106 - 106
      acidyr1     107 - 107      nausyr1     108 - 108
      conspyr1    109 - 109      ovrwtyr1    110 - 110
      acneyr1     111 - 111      wartsyr1    112 - 112
      skothyr1    113 - 113      hayf2       114 - 114
      rallg2      115 - 115      dallg2      116 - 116
      sallg2      117 - 117      diarh2      118 - 118
      anemia2     119 - 119      fhead       120 - 120
      earinf2     121 - 121      seize2      122 - 122
      stutter     123 - 123      alothyr2    124 - 124
      headyr2     125 - 125      abdomyr2    126 - 126
      backyr2     127 - 127      pnothyr2    128 - 128
      fatigyr2    129 - 129      fevryr2     130 - 130
      coldyr2     131 - 131      thothyr2    132 - 132
      acidyr2     133 - 133      nausyr2     134 - 134
      conspyr2    135 - 135      insomyr2    136 - 136
      ovrwtyr2    137 - 137      acneyr2     138 - 138
      wartsyr2    139 - 139      skothyr2    140 - 140
      chstatyr    141 - 141      schdayr1    142 - 144
      ccold2w     145 - 145      cintil2w    146 - 146
      chearst     147 - 147      cvision     148 - 148
      cblind      149 - 149      ihspeq      150 - 150
      ihmob       151 - 151      ihmobyr     152 - 152
      probrx      153 - 153      learnd      154 - 154
      cmhagm15    155 - 155      mhiboy2     156 - 157
      cmhagf15    158 - 158      mhigrl2     159 - 160
      deprsyr     161 - 161      phobyr      162 - 162
      c_anxyr     163 - 163      incontyr    164 - 164
      menstyr     165 - 165

      cusualpl    166 - 166      cplkind     167 - 167
      chcplrou    168 - 168      chcplknd    169 - 169
      chcchgyr    170 - 170      chcchghi    171 - 171
      chcdlyr1    172 - 172      chcdlyr2    173 - 173
      chcdlyr3    174 - 174      chcdlyr4    175 - 175
      chcdlyr5    176 - 176      chcafyr     177 - 177
      chcafyr1    178 - 178      chcafyr2    179 - 179
      chcafyr3    180 - 180      chcafyr4    181 - 181
      cdnlongr    182 - 182      chcsyr11    183 - 183
      chcsyr12    184 - 184      chcsyr13    185 - 185
      chcsyr14    186 - 186      chcsyr1     187 - 187
      chcsyr2     188 - 188      chcsyr3     189 - 189
      chcsyr4     190 - 190      chcsyr5     191 - 191
      chcsyr6     192 - 192      chcsyr7     193 - 193
      chcsyr81    194 - 194      chcsyr82    195 - 195
      chcsyr10    196 - 196      chcsyrem    197 - 197
      chpxyr_c    198 - 198      chernoy2    199 - 200
      chchyr      201 - 201      chchmoyr    202 - 203
      chchnoy2    204 - 205      chcnoyr2    206 - 207
      csrgyr      208 - 208      rsrgnoyr    209 - 210
      cmdlongr    211 - 211

      cshfluyr    212 - 212      cshflu_m    213 - 214
      cshflu_y    215 - 218      cspfluyr    219 - 219
      cspflu_m    220 - 221      cspflu_y    222 - 225

      rscl2_c2    226 - 226      rscl2_e2    227 - 227
      rscl3_e3    228 - 228      rscl5_p5    229 - 229
      rscl5_h5    230 - 230      rscl6       231 - 231

      seediff     232 - 232      mrvsee      233 - 233
      meddiff     234 - 234      mrvmed      235 - 235
      medwhy      236 - 236      tretdiff    237 - 237
      mrvtret     238 - 238      tretwhr1    239 - 239
      tretwhr2    240 - 240      tretwhr3    241 - 241
      tretwhr4    242 - 242      tretwhr5    243 - 243

using $DAT/samchild.dat;
replace wtia_sc = wtia_sc/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: HH identifier";
label variable intv_qrt "IDN.000_25.000: Interview Quarter";
label variable assignwk "IDN.000_30.000: Assignment Week";
label variable fmx      "IDN.000_35.000: Family Serial Number";
label variable fpx      "IDN.000_40.000: Person Number (in family)";
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
label variable condl1   "CHS.060_01.000: Ever told SC had Down syndrome";
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
label variable lungyr   "
CHS.110_01.010: Had lung/breathing problem other than asthma, past 12 months";
label variable canceryr "CHS.110_02.020: Had cancer, past 12 months";
label variable neuroyr  "
CHS.110_03.030: Had neurological problems, past 12 months";
label variable urinyr   "
CHS.110_04.040: Had urinary problems/urinary tract infection, past 12 months";
label variable gumyr    "CHS.110_05.050: Had gum disease, past 12 months";
label variable fluyr    "
CHS.110_06.060: Had influenza or pneumonia, past 12 months";
label variable sinusyr  "CHS.110_07.070: Had sinusitus, past 12 months";
label variable strepyr  "
CHS.110_08.080: Had strep throat/tonsillitis, past 12 months";
label variable hayf1    "CHS.111_01.000: Had hay fever, past 12 m";
label variable rallg1   "CHS.111_02.000: Had respiratory allergy, past 12 m";
label variable dallg1   "CHS.111_03.000: Had food/digestive allergy, past 12 m";
label variable sallg1   "CHS.111_04.000: Had eczema/skin allergy, past 12 m";
label variable diarh1   "
CHS.111_05.000: Had frequent diarrhea/colitis, past 12 m";
label variable anemia1  "CHS.111_06.000: Had anemia, past 12 m";
label variable earinf1  "CHS.111_08.000: Had 3+ ear infections, past 12 m";
label variable seize1   "CHS.111_09.000: Had seizures, past 12 m";
label variable alothyr1 "CHS.112_01.010: Had other allergies, past 12 months";
label variable abdomyr1 "CHS.112_02.020: Had abdominal pain, past 12 months";
label variable backyr1  "CHS.112_03.030: Had back or neck pain, past 12 months";
label variable pnothyr1 "CHS.112_04.040: Had other chronic pain, past 12 months
";
label variable fatigyr1 "CHS.112_05.050: Had fatigue, past 12 months";
label variable fevryr1  "CHS.112_06.060: Had fever, past 12 months";
label variable coldyr1  "CHS.112_07.070: Had head/chest cold, past 12 months";
label variable thothyr1 "
CHS.112_08.080: Had sore throat, other than strep/tonsillitis, past 12 months";
label variable acidyr1  "CHS.112_09.090: Had acid reflux, past 12 months";
label variable nausyr1  "CHS.112_10.100: Had nausea/vomiting, past 12 months";
label variable conspyr1 "
CHS.112_11.110: Had recurring constipation, past 12 months";
label variable ovrwtyr1 "CHS.112_12.120: Had prob. w/overweight, past 12 months
";
label variable acneyr1  "CHS.112_13.130: Had severe acne, past 12 months";
label variable wartsyr1 "CHS.112_14.140: Had warts, past 12 months";
label variable skothyr1 "
CHS.112_15.150: Had skin problems other than eczema/acne/warts, past 12 months";
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
label variable alothyr2 "CHS.120_01.010: Had other allergies, past 12 months";
label variable headyr2  "
CHS.120_02.020: Had non-migraine headache, past 12 months";
label variable abdomyr2 "CHS.120_03.030: Had abdominal pain, past 12 months";
label variable backyr2  "CHS.120_04.040: Had back or neck pain, past 12 months";
label variable pnothyr2 "CHS.120_05.050: Had other chronic pain, past 12 months
";
label variable fatigyr2 "CHS.120_06.060: Had fatigue, past 12 months";
label variable fevryr2  "CHS.120_07.070: Had fever, past 12 months";
label variable coldyr2  "CHS.120_08.080: Had head/chest cold, past 12 months";
label variable thothyr2 "
CHS.120_09.090: Had sore throat other than strep/tonsillitis, past 12 months";
label variable acidyr2  "CHS.120_10.100: Had acid reflux, past 12 months";
label variable nausyr2  "CHS.120_11.110: Had nausea/vomiting, past 12 months";
label variable conspyr2 "
CHS.120_12.120: Had recurring constipation, past 12 months";
label variable insomyr2 "CHS.120_13.130: Had insomnia, past 12 months";
label variable ovrwtyr2 "CHS.120_14.140: Had prob. w/overweight, past 12 months
";
label variable acneyr2  "CHS.120_15.150: Had severe acne, past 12 months";
label variable wartsyr2 "CHS.120_16.160: Had warts, past 12 months";
label variable skothyr2 "
CHS.120_17.170: Had skin problems other than eczema/acne/warts, past 12 months";
label variable chstatyr "CHS.210_00.000: Health better, worse, or about the same
";
label variable schdayr1 "
CHS.220_00.000: Days missed due to illness/injury, past 12 m";
label variable ccold2w  "
CHS.230_00.000: Had a head/chest cold, 2 week reference period";
label variable cintil2w "
CHS.240_00.000: Had stomach illness with vomiting/diarrhea, 2 week reference per
iod";
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
CHS.321_04.000: Mental health indicator (MHI) scale score";
label variable cmhagf15 "CHS.361_04.000: Been unhappy/depressed, past 2 m";
label variable mhigrl2  "
CHS.361_04.000: Mental health indicator (MHI) scale score";
label variable deprsyr  "CHS.370_01.010: Had depression, past 12 months";
label variable phobyr   "CHS.370_02.020: Had phobia or fears, past 12 months";
label variable c_anxyr  "CHS.375_01.010: Had anxiety or stress, past 12 months";
label variable incontyr "
CHS.375_02.020: Had incontinence/bed wetting, past 12 months";
label variable menstyr  "
CHS.380_00.010: Had menstrual problems/PMS, past 12 months";

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

label variable cshfluyr "CFI.010_00.000: Flu shot past 12 m";
label variable cshflu_m "CFI.015_01.000: Month of most recent flu shot";
label variable cshflu_y "CFI.015_02.000: Year of most recent flu shot";
label variable cspfluyr "CFI.020_00.000: Flu nasal spray past 12 m";
label variable cspflu_m "CFI.025_01.000: Month of most recent flu nasal vaccine
";
label variable cspflu_y "CFI.025_02.000: Year of most recent flu nasal vaccine";

label variable rscl2_c2 "
CMB.020_01.000: Well behaved/does what requested, past 6 m";
label variable rscl2_e2 "
CMB.020_02.000: Many worries/often seems worried, past 6 m";
label variable rscl3_e3 "CMB.020_03.000: Unhappy/depressed/tearful, past 6 m";
label variable rscl5_p5 "
CMB.020_04.000: Gets along better w/adults than children/youth, past 6 m";
label variable rscl5_h5 "
CMB.020_05.000: Good attention/completes chores, homework, past 6 m";
label variable rscl6    "
CMB.030_00.000: Difficulties w/emotions/concentration/behavior/getting along";

label variable seediff  "CMS.010_00.000: See/Talk to provider about difficulties
";
label variable mrvsee   "
CMS.020_00.000: Most recent conversation/visit about difficulties";
label variable meddiff  "
CMS.030_00.000: Medication ever prescribed for difficulties";
label variable mrvmed   "CMS.040_00.000: Most recent medication prescribed";
label variable medwhy   "
CMS.050_00.000: Medication prescribed for concentration/hyperactivity/impulsivit
y";
label variable tretdiff "
CMS.060_00.000: Received treatment or help for difficulties";
label variable mrvtret  "CMS.070_00.000: Most recent treatment/help received";
label variable tretwhr1 "
CMS.080_01.000: Treatment/help at pediatric/general medical care practice";
label variable tretwhr2 "
CMS.080_02.000: Treatment/help at mental health private practice";
label variable tretwhr3 "
CMS.080_03.000: Treatment/help at mental health clinic/center";
label variable tretwhr4 "CMS.080_04.000: Treatment/help at child's school";
label variable tretwhr5 "CMS.080_05.000: Treatment/help at other place";

* DEFINE VALUE LABELS FOR REPORTS;

label define scp001x
   10       "10 Household"
   20       "20 Person"
   30       "30 Sample Adult"
   31       "31 Sample Adult Cancer"
   34       "34 Adult Alternative Medicine"
   40       "40 Sample Child"
   44       "44 Child Alternative Medicine"
   60       "60 Family"
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
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp029x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp039x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   9        "9 Don't know"
;
label define scp103x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp104x
   000      "000 None"
   996      "996 Did not go to school"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp107x
   1        "1 Good"
   2        "2 A little trouble"
   3        "3 A lot of trouble"
   4        "4 Deaf"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp115x
   0        "0 Not true"
   1        "1 Sometimes true"
   2        "2 Often true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp116x
   99       "99 Unknown"
;
label define scp124x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp125x
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
label define scp127x
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
label define scp140x
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
label define scp157x
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
label define scp159x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp160x
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
label define scp163x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp166x
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
label define scp171x
   0        "0 Not true"
   1        "1 Somewhat true"
   2        "2 Certainly true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp176x
   0        "0 No"
   1        "1 Yes, minor difficulties"
   2        "2 Yes, definite difficulties"
   3        "3 Yes, severe difficulties"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp178x
   1        "1 In the past 6 months"
   2        "2 7 to 12 months ago"
   3        "3 More than 12 months ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
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
label values bwgtmgr   scp023x;   label values amr1      scp024x;
label values aodd1     scp024x;   label values add2      scp024x;
label values amr2      scp024x;   label values aodd2     scp024x;
label values condl1    scp029x;   label values condl2    scp029x;
label values condl3    scp029x;   label values condl4    scp029x;
label values condl5    scp029x;   label values condl6    scp029x;
label values condl7    scp029x;   label values condl8    scp029x;
label values condl9    scp029x;   label values condl10   scp029x;
label values cpox      scp039x;   label values cpox12mo  scp024x;
label values cashmev   scp024x;   label values casstill  scp024x;
label values cashyr    scp024x;   label values casmeryr  scp024x;
label values lungyr    scp024x;   label values canceryr  scp024x;
label values neuroyr   scp024x;   label values urinyr    scp024x;
label values gumyr     scp024x;   label values fluyr     scp024x;
label values sinusyr   scp024x;   label values strepyr   scp024x;
label values hayf1     scp024x;   label values rallg1    scp024x;
label values dallg1    scp024x;   label values sallg1    scp024x;
label values diarh1    scp024x;   label values anemia1   scp024x;
label values earinf1   scp024x;   label values seize1    scp024x;
label values alothyr1  scp024x;   label values abdomyr1  scp024x;
label values backyr1   scp024x;   label values pnothyr1  scp024x;
label values fatigyr1  scp024x;   label values fevryr1   scp024x;
label values coldyr1   scp024x;   label values thothyr1  scp024x;
label values acidyr1   scp024x;   label values nausyr1   scp024x;
label values conspyr1  scp024x;   label values ovrwtyr1  scp024x;
label values acneyr1   scp024x;   label values wartsyr1  scp024x;
label values skothyr1  scp024x;   label values hayf2     scp024x;
label values rallg2    scp024x;   label values dallg2    scp024x;
label values sallg2    scp024x;   label values diarh2    scp024x;
label values anemia2   scp024x;   label values fhead     scp024x;
label values earinf2   scp024x;   label values seize2    scp024x;
label values stutter   scp024x;   label values alothyr2  scp024x;
label values headyr2   scp024x;   label values abdomyr2  scp024x;
label values backyr2   scp024x;   label values pnothyr2  scp024x;
label values fatigyr2  scp024x;   label values fevryr2   scp024x;
label values coldyr2   scp024x;   label values thothyr2  scp024x;
label values acidyr2   scp024x;   label values nausyr2   scp024x;
label values conspyr2  scp024x;   label values insomyr2  scp024x;
label values ovrwtyr2  scp024x;   label values acneyr2   scp024x;
label values wartsyr2  scp024x;   label values skothyr2  scp024x;
label values chstatyr  scp103x;   label values schdayr1  scp104x;
label values ccold2w   scp024x;   label values cintil2w  scp024x;
label values chearst   scp107x;   label values cvision   scp024x;
label values cblind    scp024x;   label values ihspeq    scp024x;
label values ihmob     scp024x;   label values ihmobyr   scp024x;
label values probrx    scp024x;   label values learnd    scp024x;
label values cmhagm15  scp115x;   label values mhiboy2   scp116x;
label values cmhagf15  scp115x;   label values mhigrl2   scp116x;
label values deprsyr   scp024x;   label values phobyr    scp024x;
label values c_anxyr   scp024x;   label values incontyr  scp024x;
label values menstyr   scp024x;

label values cusualpl  scp124x;   label values cplkind   scp125x;
label values chcplrou  scp024x;   label values chcplknd  scp127x;
label values chcchgyr  scp024x;   label values chcchghi  scp024x;
label values chcdlyr1  scp024x;   label values chcdlyr2  scp024x;
label values chcdlyr3  scp024x;   label values chcdlyr4  scp024x;
label values chcdlyr5  scp024x;   label values chcafyr   scp024x;
label values chcafyr1  scp024x;   label values chcafyr2  scp024x;
label values chcafyr3  scp024x;   label values chcafyr4  scp024x;
label values cdnlongr  scp140x;   label values chcsyr11  scp024x;
label values chcsyr12  scp024x;   label values chcsyr13  scp024x;
label values chcsyr14  scp024x;   label values chcsyr1   scp024x;
label values chcsyr2   scp024x;   label values chcsyr3   scp024x;
label values chcsyr4   scp024x;   label values chcsyr5   scp024x;
label values chcsyr6   scp024x;   label values chcsyr7   scp024x;
label values chcsyr81  scp024x;   label values chcsyr82  scp024x;
label values chcsyr10  scp024x;   label values chcsyrem  scp024x;
label values chpxyr_c  scp024x;   label values chernoy2  scp157x;
label values chchyr    scp024x;   label values chchmoyr  scp159x;
label values chchnoy2  scp160x;   label values chcnoyr2  scp157x;
label values csrgyr    scp024x;   label values rsrgnoyr  scp163x;
label values cmdlongr  scp140x;

label values cshfluyr  scp024x;   label values cshflu_m  scp166x;
label values cshflu_y  scp023x;   label values cspfluyr  scp024x;
label values cspflu_m  scp166x;   label values cspflu_y  scp023x;

label values rscl2_c2  scp171x;   label values rscl2_e2  scp171x;
label values rscl3_e3  scp171x;   label values rscl5_p5  scp171x;
label values rscl5_h5  scp171x;   label values rscl6     scp176x;

label values seediff   scp024x;   label values mrvsee    scp178x;
label values meddiff   scp024x;   label values mrvmed    scp178x;
label values medwhy    scp024x;   label values tretdiff  scp024x;
label values mrvtret   scp178x;   label values tretwhr1  scp029x;
label values tretwhr2  scp029x;   label values tretwhr3  scp029x;
label values tretwhr4  scp029x;   label values tretwhr5  scp029x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sc];
save $OUT/samchild, replace;

#delimit cr

* data file is stored in samchild.dta
* log  file is stored in samchild.log

log close
