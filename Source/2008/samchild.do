log using "$LOG/samchild.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 JUNE 8, 2009 12:01 PM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2008 NHIS Public Use Sample Child ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE samchild.dta AND samchild.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2008\

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
      casmeryr     91 -  91      casmhsp      92 -  92
      casmmc       93 -  93      cwzmswk      94 -  96
      cwzpin       97 -  97      casminst     98 -  98
      casmpmed     99 -  99      casmcan     100 - 100
      casmed      101 - 101      casmdtp     102 - 102
      caswmp      103 - 103      casclass    104 - 104
      cas_rec     105 - 105      cas_res     106 - 106
      cas_mon     107 - 107      capenvln    108 - 108
      capenvdo    109 - 109      hayf1       110 - 110
      rallg1      111 - 111      dallg1      112 - 112
      sallg1      113 - 113      diarh1      114 - 114
      anemia1     115 - 115      earinf1     116 - 116
      seize1      117 - 117      hayf2       118 - 118
      rallg2      119 - 119      dallg2      120 - 120
      sallg2      121 - 121      diarh2      122 - 122
      anemia2     123 - 123      fhead       124 - 124
      earinf2     125 - 125      seize2      126 - 126
      stutter     127 - 127      chstatyr    128 - 128
      schdayr1    129 - 131      ccold2w     132 - 132
      cintil2w    133 - 133      chearst1    134 - 134
      cvision     135 - 135      cblind      136 - 136
      cvistst     137 - 137      cvislt      138 - 138
      cvisglas    139 - 139      cvisdist    140 - 140
      cvisread    141 - 141      cvisact     142 - 142
      cvisprot    143 - 143      ihspeq      144 - 144
      ihmob       145 - 145      ihmobyr     146 - 146
      probrx      147 - 147      learnd      148 - 148
      cmhagm15    149 - 149      mhiboy2     150 - 151
      cmhagf15    152 - 152      mhigrl2     153 - 154

      cusualpl    155 - 155      cplkind     156 - 156
      chcplrou    157 - 157      chcplknd    158 - 158
      chcchgyr    159 - 159      chcchghi    160 - 160
      chcdlyr1    161 - 161      chcdlyr2    162 - 162
      chcdlyr3    163 - 163      chcdlyr4    164 - 164
      chcdlyr5    165 - 165      chcafyr     166 - 166
      chcafyr1    167 - 167      chcafyr2    168 - 168
      chcafyr3    169 - 169      chcafyr4    170 - 170
      cdnlongr    171 - 171      chcsyr11    172 - 172
      chcsyr12    173 - 173      chcsyr13    174 - 174
      chcsyr14    175 - 175      chcsyr1     176 - 176
      chcsyr2     177 - 177      chcsyr3     178 - 178
      chcsyr4     179 - 179      chcsyr5     180 - 180
      chcsyr6     181 - 181      chcsyr7     182 - 182
      chcsyr81    183 - 183      chcsyr82    184 - 184
      chcsyr10    185 - 185      chcsyrem    186 - 186
      chpxyr_c    187 - 187      chernoy2    188 - 189
      chchyr      190 - 190      chchmoyr    191 - 192
      chchnoy2    193 - 194      chcnoyr2    195 - 196
      csrgyr      197 - 197      rsrgnoyr    198 - 199
      cmdlongr    200 - 200      csnlamp     201 - 201
      csnnum      202 - 204

      cocond      205 - 205      cobtws      206 - 206
      coemb       207 - 207      coreas_1    208 - 209
      coreas_2    210 - 211      coreas_3    212 - 213
      coreas_4    214 - 215      cprob_01    216 - 216
      cprob_02    217 - 217      cprob_03    218 - 218
      cprob_04    219 - 219      cprob_05    220 - 220
      cprob_06    221 - 221      cprob_07    222 - 222
      cprob_08    223 - 223      cprob_09    224 - 224
      cprob_10    225 - 225      cprob_11    226 - 226
      cprob_12    227 - 227      codent1     228 - 228
      codent2     229 - 229      cnoden_1    230 - 230
      cnoden_2    231 - 231      cnoden_3    232 - 232
      cnoden_4    233 - 233      cnoden_5    234 - 234
      cnoden_6    235 - 235      cnoden_7    236 - 236
      coint_1     237 - 237      coint_2     238 - 238
      coint_3     239 - 239      coint_4     240 - 240
      coint_5     241 - 241      coint_6     242 - 242

      rscl6       243 - 243

      cshfluyr    244 - 244      cshflu_m    245 - 246
      cshflu_y    247 - 250      cspfluyr    251 - 251
      cspflu_m    252 - 253      cspflu_y    254 - 257

      chpvhrd     258 - 258      cshthpv     259 - 259
      cshhpvds    260 - 261      chpvrec     262 - 262
      chpvnot     263 - 264      chpvcost    265 - 265
      chpvloc     266 - 266

using "$DAT/2008/samchild.dat";
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

label variable bwgtlb   "CHS.010_01.000: Birth weight in pounds";
label variable bwgtoz   "CHS.010_02.000: Birth weight in ounces";
label variable bwgtmgr  "CHS.011_00.000: Birth weight in grams";
label variable chght_tc "
CHS.020_02.000: Total current height in inches (truncated)";
label variable cwght_tc "CHS.022_02.000: Current weight in pounds (truncated)";
label variable bmi_sc   "CHS Recode: Body Mass Index (BMI)";
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
label variable casmhsp  "
CHS.100_00.010: Stayed overnight in a hospital because of asthma, past 12 m";
label variable casmmc   "
CHS.100_00.020: Health professional talk with you about long term management of 
asthma";
label variable cwzmswk  "
CHS.100_00.030: # DAYS of school/work missed because of asthma, past 12 m";
label variable cwzpin   "CHS.100_00.040: EVER used a PRESCRIPTION inhaler";
label variable casminst "
CHS.100_00.050: Has health professional shown SC how to use inhaler";
label variable casmpmed "
CHS.100_00.060: Used PRESCRIPTION inhaler THAT YOU BREATHE IN THROUGH YOUR MOUTH
, that gives QUICK relief from asthma symptoms, past 3 m";
label variable casmcan  "
CHS.100_00.070: Used more than three canisters of this type of inhaler, past 3 m
.";
label variable casmed   "
CHS.100_00.080: EVER taken the preventive kind of ASTHMA medicine everyday to pr
otect lungs and keep from having attacks";
label variable casmdtp  "
CHS.100_00.090: NOW taking this medication daily or almost daily";
label variable caswmp   "CHS.100_00.100: Doctor EVER give an asthma action plan
";
label variable casclass "
CHS.100_00.110: EVER took a course/class on how to manage asthma";
label variable cas_rec  "
CHS.100_00.116: Doctor EVER taught parent how to recognize early signs of an ast
hma episode";
label variable cas_res  "
CHS.100_00.117: Doctor EVER taught parent how to respond to episodes of asthma";
label variable cas_mon  "
CHS.100_00.118: Doctor EVER taught parent how to monitor peak flow for daily the
rapy";
label variable capenvln "
CHS.100_00.130: Doctor EVER advised to change things in home to improve asthma";
label variable capenvdo "CHS.100_00.140: Amount of doctor's advice followed";
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
label variable cvistst  "CHS.270_00.010: EVER had vision tested by a doctor";
label variable cvislt   "CHS.270_00.020: When was vision last tested";
label variable cvisglas "CHS.270_00.025: Wear eyeglasses or contact lenses";
label variable cvisdist "
CHS.270_00.030: Eyeglasses/contact lenses to read street signs/see in the distan
ce";
label variable cvisread "
CHS.270_00.035: Eyeglasses or contact lenses to read books, write, to see well u
p close?";
label variable cvisact  "
CHS.270_00.040: Participate in sports/other activities that can cause eye injury
";
label variable cvisprot "CHS.270_00.050: Use of eye protection";
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
label variable csnlamp  "
CAU.350_00.010: Used indoor tanning device EVEN ONE TIME, past 12 m";
label variable csnnum   "
CAU.350_00.020: # times used indoor tanning device, past 12 m";

label variable cocond   "
COH.010_00.000: Description of condition of mouth and teeth";
label variable cobtws   "
COH.020_00.000: Condition of mouth and teeth compared to others same age";
label variable coemb    "
COH.030_00.000: Self-conscious or embarrassed because of teeth or mouth, past 6 
m.";
label variable coreas_1 "
COH.040_01.000: Hours school missed for emergency dental care, past 6 m.";
label variable coreas_2 "
COH.040_02.000: Hours school missed for planned routine dental or orthodontic ca
re, past 6 m.";
label variable coreas_3 "
COH.040_03.000: Hours school missed for tooth whitening or other cosmetic proced
ures, past 6 m.";
label variable coreas_4 "
COH.040_04.000: Hours school missed for taking someone else to a dental appointm
ent, past 6 m.";
label variable cprob_01 "
COH.050_01.000: Problem with toothache or sensitive teeth, past 6 m.";
label variable cprob_02 "
COH.050_02.000: Problem with pain in jaw joint, past 6 m.";
label variable cprob_03 "COH.050_03.000: Problem with sores in mouth, past 6 m.
";
label variable cprob_04 "COH.050_04.000: Problem with bleeding gums, past 6 m.";
label variable cprob_05 "COH.050_05.000: Problem with crooked teeth, past 6 m.";
label variable cprob_06 "
COH.050_06.000: Problem with broken or missing teeth, past 6 m.";
label variable cprob_07 "
COH.050_07.000: Problem with stained or discolored teeth, past 6 m.";
label variable cprob_08 "
COH.050_08.000: Problem with loose teeth not due to an injury, past 6 m.";
label variable cprob_09 "
COH.050_09.000: Problem with decayed teeth or cavities, past 6 m.";
label variable cprob_10 "
COH.050_10.000: Problem with broken or missing fillings, past 6 m.";
label variable cprob_11 "COH.050_11.000: Problem with bad breath, past 6 m.";
label variable cprob_12 "COH.050_12.000: Problem with dry mouth, past 6 m.";
label variable codent1  "
COH.060_00.000: Saw either dentist or medical doctor for dental problems, past 6
 m.";
label variable codent2  "
COH.070_00.000: Which one seen, a dentist or a medical doctor, past 6 m.";
label variable cnoden_1 "
COH.080_01.000: Not important to see dentist for problem, past 6 m.";
label variable cnoden_2 "COH.080_02.000: Dental problem went away, past 6 m.";
label variable cnoden_3 "
COH.080_03.000: Couldn’t afford/no insurance for dental problem, past 6 m.";
label variable cnoden_4 "COH.080_04.000: No transportation to dentist, past 6 m.
";
label variable cnoden_5 "
COH.080_05.000: Afraid to see a dentist for problem, past 6 m.";
label variable cnoden_6 "
COH.080_06.000: Waiting for dental appointment, past 6 m.";
label variable cnoden_7 "
COH.080_07.000: Didn't think dentist could fix problem, past 6 m.";
label variable coint_1  "
COH.090_01.000: Dental problem interfered with school or school activities";
label variable coint_2  "COH.090_02.000: Dental problem interfered with work";
label variable coint_3  "COH.090_03.000: Dental problem interfered with eating";
label variable coint_4  "COH.090_04.000: Dental problem interfered with sleeping
";
label variable coint_5  "
COH.090_05.000: Dental problem interfered with social activities";
label variable coint_6  "
COH.090_06.000: Dental problem interfered with usual activities at home";

label variable rscl6    "
CMB.030_00.000: Difficulties w/emotions/concentration/behavior/getting along";

label variable cshfluyr "CFI.010_00.000: Flu shot past 12 m";
label variable cshflu_m "CFI.015_01.000: Month of most recent flu shot";
label variable cshflu_y "CFI.015_02.000: Year of most recent flu shot";
label variable cspfluyr "CFI.020_00.000: Flu nasal spray past 12 m";
label variable cspflu_m "CFI.025_01.000: Month of most recent flu nasal vaccine
";
label variable cspflu_y "CFI.025_02.000: Year of most recent flu nasal vaccine";

label variable chpvhrd  "
CHP.010_00.000: Ever heard of vaccine for cervical cancer";
label variable cshthpv  "CHP.020_00.000: Ever had HPV vaccine or shot";
label variable cshhpvds "CHP.030_00.000: Number of HPV shots received";
label variable chpvrec  "CHP.040_00.000: Get HPV shot if recommended";
label variable chpvnot  "
CHP.050_00.000: Main reason why SC would not receive HPV vaccine";
label variable chpvcost "CHP.060_00.000: Get HPV vaccine if cost was $360-$500";
label variable chpvloc  "
CHP.070_00.000: Would SC get HPV vaccine if it were free/at a lower cost";

* DEFINE VALUE LABELS FOR REPORTS;

label define scp001x
   10       "10 Household"
   20       "20 Person"
   30       "30 Sample Adult"
   31       "31 Sample Adult Cancer"
   40       "40 Sample Child"
   60       "60 Family"
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
label define scp049x
   1        "1 Yes"
   2        "2 No"
   3        "3 Still in the hospital"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp050x
   995      "995 Child was home schooled"
   996      "996 child did not go to day care, preschool, school, or work"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp062x
   1        "1 Yes"
   2        "2 No"
   3        "3 Was told no changes needed"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp063x
   0        "0 None"
   1        "1 A little"
   2        "2 Some"
   3        "3 Most"
   4        "4 All"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp082x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp083x
   000      "000 None"
   996      "996 Did not go to school"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp086x
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
label define scp090x
   1        "1 In the last 12 months"
   2        "2 In the last 13-24 months"
   3        "3 Over 24 months"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp095x
   1        "1 Always"
   2        "2 Most of the time"
   3        "3 Some of the time"
   4        "4 None of the time"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp101x
   0        "0 Not true"
   1        "1 Sometimes true"
   2        "2 Often true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp102x
   99       "99 Unknown"
;
label define scp105x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp106x
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
label define scp108x
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
label define scp121x
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
label define scp138x
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
label define scp140x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp141x
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
label define scp144x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp147x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp148x
   1        "1 Very good"
   2        "2 Good"
   3        "3 Fair"
   4        "4 Poor"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp149x
   1        "1 Better"
   2        "2 Same"
   3        "3 Not as good"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp150x
   1        "1 Often"
   2        "2 Sometimes"
   3        "3 Rarely"
   4        "4 Never"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp151x
   01       "01 None to less than 1 hour"
   02       "02 1 hour, less than 3 hours"
   03       "03 3 hours, less than 5 hours"
   04       "04 5 hours, less than 7 hours"
   05       "05 7 or more hours"
   06       "06 Doesn't go to school"
   07       "07 Did not have this type of dental care"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp153x
   01       "01 None or less than 1 hour"
   02       "02 1 hour, less than 3 hours"
   03       "03 3 hours, less than 5 hours"
   04       "04 5 hours, less than 7 hours"
   05       "05 7 or more hours"
   06       "06 Doesn't go to school"
   07       "07 did not have this type of dental care"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp168x
   1        "1 Dentist"
   2        "2 Medical doctor"
   3        "3 Both"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp176x
   1        "1 Yes"
   2        "2 No"
   3        "3 Doesn't go to school"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp177x
   1        "1 Yes"
   2        "2 No"
   3        "3 Doesn't work"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp182x
   0        "0 No"
   1        "1 Yes, minor difficulties"
   2        "2 Yes, definite difficulties"
   3        "3 Yes, severe difficulties"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp184x
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
label define scp190x
   1        "1 Yes"
   2        "2 No"
   3        "3 Doctor refused when asked"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp191x
   96       "96 All shots"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp193x
   01       "01 Does not need vaccine"
   02       "02 Not sexually active"
   03       "03 Too expensive"
   04       "04 Too young for vaccine"
   05       "05 Doctor didn't recommend it"
   06       "06 Worried about safety of vaccine"
   07       "07 Don't know where to get vaccine"
   08       "08 My spouse/family member is against it"
   09       "09 Don't know enough about vaccine"
   10       "10 Already has HPV"
   11       "11 Other"
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
label values casmeryr  scp027x;   label values casmhsp   scp027x;
label values casmmc    scp049x;   label values cwzmswk   scp050x;
label values cwzpin    scp027x;   label values casminst  scp027x;
label values casmpmed  scp027x;   label values casmcan   scp027x;
label values casmed    scp027x;   label values casmdtp   scp027x;
label values caswmp    scp027x;   label values casclass  scp027x;
label values cas_rec   scp027x;   label values cas_res   scp027x;
label values cas_mon   scp027x;   label values capenvln  scp062x;
label values capenvdo  scp063x;   label values hayf1     scp027x;
label values rallg1    scp027x;   label values dallg1    scp027x;
label values sallg1    scp027x;   label values diarh1    scp027x;
label values anemia1   scp027x;   label values earinf1   scp027x;
label values seize1    scp027x;   label values hayf2     scp027x;
label values rallg2    scp027x;   label values dallg2    scp027x;
label values sallg2    scp027x;   label values diarh2    scp027x;
label values anemia2   scp027x;   label values fhead     scp027x;
label values earinf2   scp027x;   label values seize2    scp027x;
label values stutter   scp027x;   label values chstatyr  scp082x;
label values schdayr1  scp083x;   label values ccold2w   scp027x;
label values cintil2w  scp027x;   label values chearst1  scp086x;
label values cvision   scp027x;   label values cblind    scp027x;
label values cvistst   scp027x;   label values cvislt    scp090x;
label values cvisglas  scp027x;   label values cvisdist  scp027x;
label values cvisread  scp027x;   label values cvisact   scp027x;
label values cvisprot  scp095x;   label values ihspeq    scp027x;
label values ihmob     scp027x;   label values ihmobyr   scp027x;
label values probrx    scp027x;   label values learnd    scp027x;
label values cmhagm15  scp101x;   label values mhiboy2   scp102x;
label values cmhagf15  scp101x;   label values mhigrl2   scp102x;

label values cusualpl  scp105x;   label values cplkind   scp106x;
label values chcplrou  scp027x;   label values chcplknd  scp108x;
label values chcchgyr  scp027x;   label values chcchghi  scp027x;
label values chcdlyr1  scp027x;   label values chcdlyr2  scp027x;
label values chcdlyr3  scp027x;   label values chcdlyr4  scp027x;
label values chcdlyr5  scp027x;   label values chcafyr   scp027x;
label values chcafyr1  scp027x;   label values chcafyr2  scp027x;
label values chcafyr3  scp027x;   label values chcafyr4  scp027x;
label values cdnlongr  scp121x;   label values chcsyr11  scp027x;
label values chcsyr12  scp027x;   label values chcsyr13  scp027x;
label values chcsyr14  scp027x;   label values chcsyr1   scp027x;
label values chcsyr2   scp027x;   label values chcsyr3   scp027x;
label values chcsyr4   scp027x;   label values chcsyr5   scp027x;
label values chcsyr6   scp027x;   label values chcsyr7   scp027x;
label values chcsyr81  scp027x;   label values chcsyr82  scp027x;
label values chcsyr10  scp027x;   label values chcsyrem  scp027x;
label values chpxyr_c  scp027x;   label values chernoy2  scp138x;
label values chchyr    scp027x;   label values chchmoyr  scp140x;
label values chchnoy2  scp141x;   label values chcnoyr2  scp138x;
label values csrgyr    scp027x;   label values rsrgnoyr  scp144x;
label values cmdlongr  scp121x;   label values csnlamp   scp027x;
label values csnnum    scp147x;

label values cocond    scp148x;   label values cobtws    scp149x;
label values coemb     scp150x;   label values coreas_1  scp151x;
label values coreas_2  scp151x;   label values coreas_3  scp153x;
label values coreas_4  scp153x;   label values cprob_01  scp027x;
label values cprob_02  scp027x;   label values cprob_03  scp027x;
label values cprob_04  scp027x;   label values cprob_05  scp027x;
label values cprob_06  scp027x;   label values cprob_07  scp027x;
label values cprob_08  scp027x;   label values cprob_09  scp027x;
label values cprob_10  scp027x;   label values cprob_11  scp027x;
label values cprob_12  scp027x;   label values codent1   scp027x;
label values codent2   scp168x;   label values cnoden_1  scp027x;
label values cnoden_2  scp027x;   label values cnoden_3  scp027x;
label values cnoden_4  scp027x;   label values cnoden_5  scp027x;
label values cnoden_6  scp027x;   label values cnoden_7  scp027x;
label values coint_1   scp176x;   label values coint_2   scp177x;
label values coint_3   scp027x;   label values coint_4   scp027x;
label values coint_5   scp027x;   label values coint_6   scp027x;

label values rscl6     scp182x;

label values cshfluyr  scp027x;   label values cshflu_m  scp184x;
label values cshflu_y  scp023x;   label values cspfluyr  scp027x;
label values cspflu_m  scp184x;   label values cspflu_y  scp023x;

label values chpvhrd   scp027x;   label values cshthpv   scp190x;
label values cshhpvds  scp191x;   label values chpvrec   scp027x;
label values chpvnot   scp193x;   label values chpvcost  scp027x;
label values chpvloc   scp027x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sc];
save "$OUT/2008/samchild", replace;

#delimit cr

* data file is stored in samchild.dta
* log  file is stored in samchild.log

log close
