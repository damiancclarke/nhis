log using "$LOG/samchild.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 MAY 24, 2012  9:07 AM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2011 NHIS Public Use Sample Child ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE samchild.dta AND samchild.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd c:\nhis2011\

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
      intv_mon     14 -  15  str fmx          16 -  17
  str fpx          18 -  19      wtia_sc      20 -  26
      wtfa_sc      27 -  32

      region       33 -  33      strat_p      34 -  36
      psu_p        37 -  38

      sex          39 -  39      hispan_i     40 -  41
      racerpi2     42 -  43      mracrpi2     44 -  45
      mracbpi2     46 -  47      age_p        48 -  49

  str csrespno     50 -  51      csreltiv     52 -  53
      lateintc     54 -  54

      fdrn_flg     55 -  55

      totoz_p      56 -  58      bwtgrm_p     59 -  62
      chght_tc     63 -  64      cwght_tc     65 -  67
      bmi_sc       68 -  71      amr1r        72 -  72
      aodd1        73 -  73      add2         74 -  74
      amr2r        75 -  75      aodd2        76 -  76
      ccondl01     77 -  77      ccondl02     78 -  78
      ccondl03     79 -  79      ccondl04     80 -  80
      ccondl05     81 -  81      ccondl6r     82 -  82
      ccondl07     83 -  83      ccondl08     84 -  84
      ccondl09     85 -  85      ccondl10     86 -  86
      cpox         87 -  87      cpox12mo     88 -  88
      cashmev      89 -  89      casstill     90 -  90
      cashyr       91 -  91      caseryr1     92 -  92
      hayf1        93 -  93      rallg1       94 -  94
      dallg1       95 -  95      sallg1       96 -  96
      diarh1       97 -  97      anemia1      98 -  98
      earinf1      99 -  99      seize1      100 - 100
      hayf2       101 - 101      rallg2      102 - 102
      dallg2      103 - 103      sallg2      104 - 104
      diarh2      105 - 105      anemia2     106 - 106
      fhead       107 - 107      earinf2     108 - 108
      seize2      109 - 109      stutter     110 - 110
      chstatyr    111 - 111      schdayr1    112 - 114
      ccold2w     115 - 115      cintil2w    116 - 116
      chearst1    117 - 117      cvision     118 - 118
      cblind      119 - 119      ihspeq      120 - 120
      ihmob       121 - 121      ihmobyr     122 - 122
      probrx      123 - 123      learnd      124 - 124
      cmhagm15    125 - 125      mhiboy2     126 - 127
      cmhagf15    128 - 128      mhigrl2     129 - 130

      cusualpl    131 - 131      cplkind     132 - 132
      chcplrou    133 - 133      chcplknd    134 - 134
      chcchgyr    135 - 135      chcchghi    136 - 136
      cnouspl1    137 - 137      cnouspl2    138 - 138
      cnouspl3    139 - 139      cnouspl4    140 - 140
      cnouspl5    141 - 141      cnouspl6    142 - 142
      cnouspl7    143 - 143      cnouspl8    144 - 144
      cnouspl9    145 - 145      cprvtryr    146 - 146
      cprvtrfd    147 - 147      cdrnanp     148 - 148
      cdrnai      149 - 149      chcdlyr1    150 - 150
      chcdlyr2    151 - 151      chcdlyr3    152 - 152
      chcdlyr4    153 - 153      chcdlyr5    154 - 154
      chcafyr     155 - 155      chcafyrn    156 - 156
      chcafyrf    157 - 157      chcafyr1    158 - 158
      chcafyr2    159 - 159      chcafyr3    160 - 160
      chcafyr4    161 - 161      chcafyr5    162 - 162
      chcafyr6    163 - 163      cdnlongr    164 - 164
      chcsyr11    165 - 165      chcsyr12    166 - 166
      chcsyr13    167 - 167      chcsyr14    168 - 168
      chcsyr1     169 - 169      chcsyr2     170 - 170
      chcsyr3     171 - 171      chcsyr4     172 - 172
      chcsyr5     173 - 173      chcsyr6     174 - 174
      chcsyr7     175 - 175      chcsyr81    176 - 176
      chcsyr82    177 - 177      chcsyr10    178 - 178
      chcsyrem    179 - 179      chpxyr_c    180 - 180
      chernoy2    181 - 182      cervisnd    183 - 183
      cerhos      184 - 184      cerreas1    185 - 185
      cerreas2    186 - 186      cerreas3    187 - 187
      cerreas4    188 - 188      cerreas5    189 - 189
      cerreas6    190 - 190      cerreas7    191 - 191
      cerreas8    192 - 192      chchyr      193 - 193
      chchmoyr    194 - 195      chchnoy2    196 - 197
      chcnoyr2    198 - 199      csrgyr      200 - 200
      rsrgnoyr    201 - 202      cmdlongr    203 - 203

      rscl2_c2    204 - 204      rscl2_e2    205 - 205
      rscl3_e3    206 - 206      rscl5_p5    207 - 207
      rscl5_h5    208 - 208      rscl6       209 - 209

      diff6m      210 - 210      diffintf    211 - 211
      diffdeg     212 - 212      difflng     213 - 213
      prescp6m    214 - 214      preshelp    215 - 215
      pmedped     216 - 216      pmedpsy     217 - 217
      pmedneu     218 - 218      pmedothr    219 - 219
      nsduh21     220 - 220      nsduh3      221 - 221
      nsduh31     222 - 222      nsduh321    223 - 223
      nsduh322    224 - 224      nsduh323    225 - 225
      nsduh324    226 - 226      nsduh325    227 - 227
      nsduh4      228 - 228      nsduh51r    229 - 229
      nsduh52r    230 - 230      nsduh53r    231 - 231
      nsduh54r    232 - 232      nsduh55r    233 - 237
      trtwre1r    238 - 238      trtwh11r    239 - 239
      trtwh12r    240 - 240      trtwh13r    241 - 241
      trtwh14r    242 - 242      trtwh16r    243 - 243
      trtmhp11    244 - 244      trtmhp12    245 - 245
      trtmhp13    246 - 246      trtmhp14    247 - 247
      trtwre2r    248 - 248      trtwh21r    249 - 249
      trtwh22r    250 - 250      trtwh23r    251 - 251
      trtwh24r    252 - 252      trtwh25r    253 - 253
      trtwh26r    254 - 254      trtmhp21    255 - 255
      trtmhp22    256 - 256      trtmhp23    257 - 257
      trtmhp24    258 - 258      trtwre3r    259 - 259
      trtwh31r    260 - 260      trtwh32r    261 - 261
      trtwh33r    262 - 262      trtwh34r    263 - 263
      trtwh35r    264 - 264      trtwh36r    265 - 265
      trtmhp31    266 - 266      trtmhp32    267 - 267
      trtmhp33    268 - 268      trtmhp34    269 - 269
      trtwre4r    270 - 270      trtwh41r    271 - 271
      trtwh42r    272 - 272      trtwh43r    273 - 273
      trtwh44r    274 - 274      trtwh45r    275 - 275
      trtwh46r    276 - 276      trtmhp41    277 - 277
      trtmhp42    278 - 278      trtmhp43    279 - 279
      trtmhp44    280 - 280      trtwre5r    281 - 281
      trtwh51r    282 - 282      trtwh52r    283 - 283
      trtwh53r    284 - 284      trtwh54r    285 - 285
      trtwh55r    286 - 286      trtwh56r    287 - 287
      trtmhp51    288 - 288      trtmhp52    289 - 289
      trtmhp53    290 - 290      trtmhp54    291 - 291
      trtwre6r    292 - 292      trtwh61r    293 - 293
      trtwh62r    294 - 294      trtwh63r    295 - 295
      trtwh64r    296 - 296      trtwh65r    297 - 297
      trtwh66r    298 - 298      trtmhp61    299 - 299
      trtmhp62    300 - 300      trtmhp63    301 - 301
      trtmhp64    302 - 302      ovrnt6mr    303 - 303
      overwh1r    304 - 304      overwh2r    305 - 305
      overwh3r    306 - 306      overwh4r    307 - 307
      overwh5r    308 - 308      overwh6r    309 - 309
      overwh7r    310 - 310      sh1         311 - 311
      sh2         312 - 312      casem6m     313 - 313
      casemwho    314 - 315      trethelp    316 - 316
      trpyphir    317 - 317      trpyschr    318 - 318
      trpyslfr    319 - 319      trpymedr    320 - 320
      trpychpr    321 - 321      trpymilr    322 - 322
      trpyshpr    323 - 323      trpyihsr    324 - 324
      trpyothr    325 - 325      trtfreer    326 - 326
      trtneed1    327 - 327      ntrcostr    328 - 328
      ntrlocr     329 - 329      ntrnexpr    330 - 330
      ntrfearr    331 - 331      ntrloser    332 - 332
      ntrsayr     333 - 333      ntrwaitr    334 - 334
      ntrtranr    335 - 335      ntrincvr    336 - 336
      ntrfarr     337 - 337      ntrchnor    338 - 338
      ntrothr     339 - 339

      cshflu12    340 - 340      cshflunm    341 - 341
      cshflum1    342 - 343      cshfluy1    344 - 347
      cshspfl1    348 - 348      cshflum2    349 - 350
      cshfluy2    351 - 354      cshspfl2    355 - 355

using "$DAT/2011/samchild.dat";
replace wtia_sc = wtia_sc/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: Household Number";
label variable intv_qrt "IDN.000_25.000: Interview Quarter";
label variable intv_mon "IDN.000_30.000: Interview Month";
label variable fmx      "IDN.000_35.000: Family Number";
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
label variable lateintc "CID.545_00.000: Late Sample Child interviews";

label variable fdrn_flg "FDB.001_00.000: Disability Questions Test flag";

label variable totoz_p  "CHS.010: Total birth weight in ounces for public use";
label variable bwtgrm_p "CHS.011: Birth weight in grams for public use";
label variable chght_tc "
CHS.020_02.000: Total current height in inches (truncated)";
label variable cwght_tc "CHS.022_02.000: Current weight in pounds (truncated)";
label variable bmi_sc   "CHS.024_05.000: Body Mass Index (BMI)";
label variable amr1r    "
CHS.031_02.000: Ever told SC had an intellectual disability also known as mental
 retardation";
label variable aodd1    "
CHS.031_03.000: Ever told SC had other developmental delay";
label variable add2     "CHS.032_01.000: Ever told SC had ADHD/ADD";
label variable amr2r    "
CHS.032_02.000: Ever told SC had an intellectual disability also known as mental
 retardation";
label variable aodd2    "
CHS.032_03.000: Ever told SC had other developmental delay";
label variable ccondl01 "CHS.061_01.000: Ever told SC had Down syndrome";
label variable ccondl02 "CHS.061_02.000: Ever told SC had cerebral palsy";
label variable ccondl03 "CHS.061_03.000: Ever told SC had muscular dystrophy";
label variable ccondl04 "CHS.061_04.000: Ever told SC had cystic fibrosis";
label variable ccondl05 "CHS.061_05.000: Ever told SC had sickle cell anemia";
label variable ccondl6r "
CHS.061_06.000: Ever told SC had autism/autism spectrum disorder";
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
label variable caseryr1 "
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
label variable cplkind  "
CAU.030_00.000: Type of place to go when sick (most often)";
label variable chcplrou "
CAU.035_00.000: USUALLY go there for routine/preventive care";
label variable chcplknd "
CAU.037_00.000: Type of place USUALLY go for routine/preventive care";
label variable chcchgyr "CAU.040_00.000: Change health care place, past 12 m";
label variable chcchghi "CAU.050_00.000: Change related to health insurance";
label variable cnouspl1 "CAU.050_01.010: Doesn't need doctor/No problems";
label variable cnouspl2 "CAU.050_02.010: Doesn't like/trust/believe in doctors";
label variable cnouspl3 "CAU.050_03.010: Doesn't know where to go";
label variable cnouspl4 "CAU.050_04.010: Previous doctor not available/moved";
label variable cnouspl5 "CAU.050_05.010: Too expensive/no insurance/cost";
label variable cnouspl6 "CAU.050_06.010: Speak a different language";
label variable cnouspl7 "
CAU.050_07.010: No care available/Care too far away, inconvenient";
label variable cnouspl8 "CAU.050_08.010: Put it off/Didn't get around to it";
label variable cnouspl9 "
CAU.050_09.010: Other reason child not have usual source of medical care";
label variable cprvtryr "
CAU.052_00.010: Trouble finding a general doctor to see child";
label variable cprvtrfd "
CAU.053_00.010: Able to find general doctor to see child";
label variable cdrnanp  "
CAU.055_00.010: Doctor's office not accept child as new patient";
label variable cdrnai   "
CAU.056_00.010: Doctor's office not accept child's health insurance";
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
label variable chcafyrn "
CAU.133_00.010: Can't afford to see a specialist, past 12 m";
label variable chcafyrf "CAU.133_00.020: Can't afford follow-up care, past 12 m
";
label variable chcafyr1 "
CAU.135_01.000: Can't afford prescription medicine, past 12 m";
label variable chcafyr2 "
CAU.135_02.000: Can't afford mental care/counseling, past 12 m";
label variable chcafyr3 "CAU.135_03.000: Can't afford dental care, past 12 m";
label variable chcafyr4 "CAU.135_04.000: Can't afford eyeglasses, past 12 m";
label variable chcafyr5 "
CAU.135_05.010: Can't afford to see a specialist, past 12 m";
label variable chcafyr6 "CAU.135_06.010: Can't afford follow-up care, past 12 m
";
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
label variable cervisnd "
CAU.281_00.010: Most recent ER visit at night or on weekend";
label variable cerhos   "
CAU.282_00.010: Hospital admission was result of most recent ER visit";
label variable cerreas1 "CAU.283_01.010: Didn't have another place to go";
label variable cerreas2 "CAU.283_02.020: Doctor's office or clinic was not open
";
label variable cerreas3 "CAU.283_03.030: Health provider advised ER visit";
label variable cerreas4 "
CAU.283_04.040: Problem too serious for doctor's office or clinic";
label variable cerreas5 "CAU.283_05.050: Only a hospital could help";
label variable cerreas6 "CAU.283_06.060: ER is closest provider";
label variable cerreas7 "
CAU.283_07.070: ER provides most of child's medical care";
label variable cerreas8 "
CAU.283_08.080: Arrived by ambulance or other emergency vehicle";
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

label variable diff6m   "
CMS.001_00.000: Difficulties with emotions, concentration, behavior, past 6 mont
hs";
label variable diffintf "
CMS.005_00.000: Difficulties interfere with family, school, or daily activities,
 past 6 months";
label variable diffdeg  "
CMS.007_00.000: How much difficulties interfere with family, school, or daily ac
tivities";
label variable difflng  "CMS.008_00.000: How long difficulties have been present
";
label variable prescp6m "
CMS.010_00.000: Medication prescribed for difficulties with emotions, concentrat
ion, behavior, or getting along with others, past 6 months";
label variable preshelp "CMS.011_00.000: How much prescribed medicine helped";
label variable pmedped  "
CMS.012_01.000: Pediatrician or other family doctor first prescribed medication
";
label variable pmedpsy  "
CMS.012_02.000: Psychiatrist, psychologist or other mental health professional f
irst prescribed medication";
label variable pmedneu  "CMS.012_03.000: Neurologist first prescribed medication
";
label variable pmedothr "
CMS.012_04.000: Someone else first prescribed medication";
label variable nsduh21  "
CMS.014_00.000: Treatment or counseling from school personnel, past 6 months";
label variable nsduh3   "
CMS.015_00.000: Attend school for students with difficulties with emotions, conc
entration, behavior, past 6 months";
label variable nsduh31  "
CMS.015_00.010: Attend a special needs day or overnight school, past 6 months";
label variable nsduh321 "
CMS.015_01.020: Special Education teacher provided treatment or counseling in a 
special needs day school";
label variable nsduh322 "
CMS.015_02.020: Other school teacher provided treatment or counseling in a speci
al needs day school";
label variable nsduh323 "
CMS.015_03.020: School counselor, psychologist, nurse or social worker provided 
treatment or counseling in a special needs day school";
label variable nsduh324 "
CMS.015_04.020: School speech, occupational or physical therapist provided treat
ment or counseling in a special needs day school";
label variable nsduh325 "
CMS.015_05.020: Other school official provided treatment or counseling in a spec
ial needs day school";
label variable nsduh4   "
CMS.016_00.000: Participate in school program for students with difficulties wit
h emotions, concentration, behavior, past 6 months";
label variable nsduh51r "
CMS.017_01.000: Special Ed teacher provided treatment or counseling in school pr
ogram";
label variable nsduh52r "
CMS.017_02.000: Other school teacher provided treatment or counseling in school 
program";
label variable nsduh53r "
CMS.017_03.000: School counselor, psychologist, nurse or social worker provided 
treatment or counseling in school program";
label variable nsduh54r "
CMS.017_04.000: School speech, occupational or physical therapist provided treat
ment or counseling in school program";
label variable nsduh55r "
CMS.017_05.000: Other school official provided treatment or counseling in school
 program";
label variable trtwre1r "
CMS.020_01.000: Treatment or counseling provided at daycare, child care, or play
 group, past 6 months";
label variable trtwh11r "
CMS.020_02.010: Pediatrician or family doctor provided treatment or counseling a
t daycare, child care, or play group";
label variable trtwh12r "
CMS.020_02.020: Psychiatrist, psychologist, clinical social worker or psychiatri
c nurse provided treatment or counseling at daycare, child care, or play group";
label variable trtwh13r "
CMS.020_02.030: Speech, occupational or physical therapist provided treatment or
 counseling at daycare, child care, or play group";
label variable trtwh14r "
CMS.020_02.040: Religious or spiritual counselor or advisor provided treatment o
r counseling at daycare, child care, or play group";
label variable trtwh16r "
CMS.020_02.060: Other source provided treatment or counseling at daycare, child 
care, or play group";
label variable trtmhp11 "
CMS.020_03.010: Psychiatrist provided treatment or counseling at daycare, child 
care, or play group";
label variable trtmhp12 "
CMS.020_03.020: Psychologist provided treatment or counseling at daycare, child 
care, or play group";
label variable trtmhp13 "
CMS.020_03.030: Clinical social worker provided treatment or counseling at dayca
re, child care, or play group";
label variable trtmhp14 "
CMS.020_03.040: Psychiatric nurse provided treatment or counseling at daycare, c
hild care, or play group";
label variable trtwre2r "
CMS.021_01.000: Treatment or counseling provided in an office, clinic or communi
ty center, past 6 months";
label variable trtwh21r "
CMS.021_02.010: Pediatrician or family doctor provided treatment or counseling i
n an office, clinic or community center";
label variable trtwh22r "
CMS.021_02.020: Psychiatrist, psychologist, clinical social worker or psychiatri
c nurse provided treatment or counseling in an office, clinic or community cente
r";
label variable trtwh23r "
CMS.021_02.030: Speech, occupational or physical therapist provided treatment or
 counseling in an office, clinic or community center";
label variable trtwh24r "
CMS.021_02.040: Religious or spiritual counselor or advisor provided treatment o
r counseling in an office, clinic or community center";
label variable trtwh25r "
CMS.021_02.050: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling in an office, clinic or community center";
label variable trtwh26r "
CMS.021_02.060: Other source provided treatment or counseling in an office, clin
ic or community center";
label variable trtmhp21 "
CMS.021_03.010: Psychiatrist provided treatment or counseling at an office, clin
ic or community center";
label variable trtmhp22 "
CMS.021_03.020: Psychologist provided treatment or counseling at an office, clin
ic or community center";
label variable trtmhp23 "
CMS.021_03.030: Clinical social worker provided treatment or counseling at an of
fice, clinic or community center";
label variable trtmhp24 "
CMS.021_03.040: Psychiatric nurse provided treatment or counseling at an office,
 clinic or community center";
label variable trtwre3r "
CMS.022_01.000: Treatment or counseling provided in home by visiting teacher or 
counselor";
label variable trtwh31r "
CMS.022_02.010: Pediatrician or family doctor provided treatment or counseling i
n home";
label variable trtwh32r "
CMS.022_02.020: Psychiatrist, psychologist, clinical social worker or psychiatri
c nurse provided treatment or counseling in home";
label variable trtwh33r "
CMS.022_02.030: Speech, occupational or physical therapist provided treatment or
 counseling in home";
label variable trtwh34r "
CMS.022_02.040: Religious or spiritual counselor or advisor provided treatment o
r counseling in home";
label variable trtwh35r "
CMS.022_02.050: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling in home";
label variable trtwh36r "
CMS.022_02.060: Other source provided treatment or counseling in home";
label variable trtmhp31 "
CMS.022_03.010: Psychiatrist provided treatment or counseling at home";
label variable trtmhp32 "
CMS.022_03.020: Psychologist provided treatment or counseling at home";
label variable trtmhp33 "
CMS.022_03.030: Clinical social worker provided treatment or counseling at home
";
label variable trtmhp34 "
CMS.022_03.040: Psychiatric nurse provided treatment or counseling at home";
label variable trtwre4r "
CMS.023_01.000: Treatment or counseling provided in hospital ER, crisis center, 
or shelter, past 6 months";
label variable trtwh41r "
CMS.023_02.010: Pediatrician or family doctor provided treatment or counseling i
n hospital ER, crisis center, or emergency shelter";
label variable trtwh42r "
CMS.023_02.020: Psychiatrist, psychologist, clinical social worker or psychiatri
c nurse provided treatment or counseling in hospital ER, crisis center, or emerg
ency shelter";
label variable trtwh43r "
CMS.023_02.030: Speech, occupational or physical therapist provided treatment or
 counseling in hospital ER, crisis center, or shelter";
label variable trtwh44r "
CMS.023_02.040: Religious or spiritual counselor or advisor provided treatment o
r counseling in hospital ER, crisis center, or emergency shelter";
label variable trtwh45r "
CMS.023_02.050: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling in hospital ER, crisis center, or emergency shelte
r";
label variable trtwh46r "
CMS.023_02.060: Other source provided treatment or counseling in hospital ER, cr
isis center, or emergency shelter";
label variable trtmhp41 "
CMS.023_03.010: Psychiatrist provided treatment or counseling at hospital/ER/cri
sis center/shelter";
label variable trtmhp42 "
CMS.023_03.020: Psychologist provided treatment or counseling at hospital/ER/cri
sis center/shelter";
label variable trtmhp43 "
CMS.023_03.030: Clinical social worker provided treatment or counseling at hospi
tal/ER/crisis center/shelter";
label variable trtmhp44 "
CMS.023_03.040: Psychiatric nurse provided treatment or counseling at hospital/E
R/crisis center/shelter";
label variable trtwre5r "
CMS.024_01.000: Treatment or counseling provided in hospital or community day pr
ogram, past 6 months";
label variable trtwh51r "
CMS.024_02.010: Pediatrician or family doctor provided treatment or counseling i
n hospital or community day program";
label variable trtwh52r "
CMS.024_02.020: Psychiatrist, psychologist, clinical social worker or psychiatri
c nurse provided treatment or counseling in hospital or community day program";
label variable trtwh53r "
CMS.024_02.030: Speech, occupational or physical therapist provided treatment or
 counseling in hospital or community day program";
label variable trtwh54r "
CMS.024_02.040: Religious or spiritual counselor or advisor provided treatment o
r counseling in hospital or community day program";
label variable trtwh55r "
CMS.024_02.050: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling in hospital or community day program";
label variable trtwh56r "
CMS.024_02.060: Other source provided treatment or counseling in hospital or com
munity day program";
label variable trtmhp51 "
CMS.024_03.010: Psychiatrist provided treatment or counseling at day treatment p
rogram in a hospital or community";
label variable trtmhp52 "
CMS.024_03.020: Psychologist provided treatment or counseling at day treatment p
rogram in a hospital or community";
label variable trtmhp53 "
CMS.024_03.030: Clinical social worker provided treatment or counseling at day t
reatment program in a hospital or community";
label variable trtmhp54 "
CMS.024_03.040: Psychiatric nurse provided treatment or counseling at day treatm
ent program in a hospital or community";
label variable trtwre6r "
CMS.025_01.000: Treatment or counseling provided in any other place, past 6 mont
hs";
label variable trtwh61r "
CMS.025_02.010: Pediatrician or family doctor provided treatment or counseling i
n any other place";
label variable trtwh62r "
CMS.025_02.020: Psychiatrist, psychologist, clinical social worker or psychiatri
c nurse provided treatment or counseling in any other place";
label variable trtwh63r "
CMS.025_02.030: Speech, occupational or physical therapist provided treatment or
 counseling in any other place";
label variable trtwh64r "
CMS.025_02.040: Religious or spiritual counselor or advisor provided treatment o
r counseling in any other place";
label variable trtwh65r "
CMS.025_02.050: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling in any other place";
label variable trtwh66r "
CMS.025_02.060: Other source provided treatment or counseling in any other place
";
label variable trtmhp61 "
CMS.025_03.010: Psychiatrist provided treatment or counseling at another place";
label variable trtmhp62 "
CMS.025_03.020: Psychologist provided treatment or counseling at another place";
label variable trtmhp63 "
CMS.025_03.030: Clinical social worker provided treatment or counseling at anoth
er place";
label variable trtmhp64 "
CMS.025_03.040: Psychiatric nurse provided treatment or counseling at another pl
ace";
label variable ovrnt6mr "
CMS.050_00.000: Overnight or longer stay in facility for difficulties with emoti
ons, concentration, or behavior, past 6 months";
label variable overwh1r "
CMS.060_01.000: Stayed overnight in a hospital for difficulties with emotions, c
oncentration, or behavior";
label variable overwh2r "
CMS.060_02.000: Stayed overnight in a residential treatment center for difficult
ies with emotions, concentration, or behavior";
label variable overwh3r "
CMS.060_03.000: Stayed overnight in a foster care or therapeutic foster care hom
e for difficulties with emotions, concentration, or behavior";
label variable overwh4r "
CMS.060_04.000: Stayed overnight in any type of  juvenile detention center, some
times called 'juvie', prison or jail for difficulties with emotions, concentrati
on, or behavior";
label variable overwh5r "
CMS.060_05.000: Stayed overnight in a group home for difficulties with emotions,
 concentration, or behavior";
label variable overwh6r "
CMS.060_06.000: Stayed overnight in a homeless shelter for difficulties with emo
tions, concentration, or behavior";
label variable overwh7r "
CMS.060_07.000: Stayed overnight in another place for difficulties with emotions
, concentration, or behavior";
label variable sh1      "
CMS.070_00.000: Participate in self-help group for children/youth with difficult
ies with emotions, concentration, or behavior, past 6 months";
label variable sh2      "
CMS.080_00.000: Use internet to seek treatment or counseling for difficulties wi
th emotions, concentration, or behavior, past 6 months";
label variable casem6m  "
CMS.100_00.000: Case management help from individual or agency, past 6 months";
label variable casemwho "CMS.110_00.000: Case management main provider";
label variable trethelp "
CMS.115_00.000: Amount that treatment or counseling helped child, past 6 months
";
label variable trpyphir "
CMS.120_01.000: Private health insurance paid for treatment or counseling";
label variable trpyschr "
CMS.120_02.000: School system paid for treatment or counseling";
label variable trpyslfr "CMS.120_03.000: Family paid for treatment or counseling
";
label variable trpymedr "
CMS.120_04.000: Medicaid paid for treatment or counseling";
label variable trpychpr "
CMS.120_05.000: State SCHIP/CHIP paid for treatment or counseling";
label variable trpymilr "
CMS.120_06.000: Military health care paid for treatment or counseling";
label variable trpyshpr "
CMS.120_07.000: Medicare or other government plan paid for treatment or counseli
ng";
label variable trpyihsr "
CMS.120_09.000: Indian Health Service paid for treatment or counseling";
label variable trpyothr "
CMS.120_10.000: Some other source paid for treatment or counseling";
label variable trtfreer "
CMS.120_12.000: All treatment or counseling was received free";
label variable trtneed1 "
CMS.150_00.000: Needed treatment or counseling for difficulties with emotions, c
oncentration, or behavior, past 6 months, but did not get it";
label variable ntrcostr "
CMS.150_01.000: Didn't get treatment or counseling because it was too expensive
";
label variable ntrlocr  "
CMS.150_02.000: Didn't get treatment or counseling because didn't know where to 
go";
label variable ntrnexpr "
CMS.150_03.000: Didn't get treatment or counseling because had negative experien
ce previously";
label variable ntrfearr "
CMS.150_04.000: Didn't get treatment or counseling because afraid or dislike cou
nselors";
label variable ntrloser "
CMS.150_05.000: Didn't get treatment or counseling because afraid child would be
 removed from home or lose custody";
label variable ntrsayr  "
CMS.150_06.000: Didn't get treatment or counseling because afraid of family/frie
nds opinion";
label variable ntrwaitr "
CMS.150_07.000: Didn't get treatment or counseling because it was a long wait ti
me for appointment";
label variable ntrtranr "
CMS.150_08.000: Didn't get treatment or counseling because had no way to get the
re";
label variable ntrincvr "
CMS.150_09.000: Didn't get treatment or counseling because services were too inc
onvenient to use";
label variable ntrfarr  "
CMS.150_10.000: Didn't get treatment or counseling because services were too far
 away";
label variable ntrchnor "
CMS.150_11.000: Didn't get treatment or counseling because child did not want to
 go.";
label variable ntrothr  "
CMS.150_12.000: Didn't get treatment or counseling for some other reason";

label variable cshflu12 "CFI.005_00.010: Flu vaccination, past 12 m";
label variable cshflunm "CFI.005_00.020: Number of flu vaccines, past 12 m";
label variable cshflum1 "CFI.005_00.030: Month of most recent flu vaccine";
label variable cshfluy1 "CFI.005_00.040: Year of most recent flu vaccine";
label variable cshspfl1 "
CFI.005_00.050: Administration method most recent flu vaccine";
label variable cshflum2 "CFI.005_00.060: Month of next most recent flu vaccine";
label variable cshfluy2 "CFI.005_00.070: Year of next most recent flu vaccine";
label variable cshspfl2 "
CFI.005_00.080: Administration method next most recent flu vaccine";

* DEFINE VALUE LABELS FOR REPORTS;

label define scp001x
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
label define scp004x
   1        "1 Quarter 1"
   2        "2 Quarter 2"
   3        "3 Quarter 3"
   4        "4 Quarter 4"
;
label define scp005x
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
   1        "1 Started Sample Child Core 2+ weeks after the initial interview"
   2        "
2 Started Sample Child Core less than 2 weeks after the initial interview"
;
label define scp022x
   1        "
1 Families selected to receive ADB (sample adults) and CDB (sample children 1-17
 years) sections"
   2        "
2 Families selected to receive FDB (all persons 1 year and older) and AFD (sampl
e adults) sections"
;
label define scp023x
   018      "018 18 ounces or less"
   193      "193 193+ ounces"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp024x
   0500     "0500 500 grams or less"
   5485     "5485 5485+ grams"
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define scp025x
   96       "96 Not available"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Unknown"
;
label define scp026x
   996      "996 Not available"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Unknown"
;
label define scp027x
   9995     "9995 99.95+"
   9999     "9999 Unknown"
;
label define scp028x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp033x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp043x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   9        "9 Don't know"
;
label define scp067x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp068x
   000      "000 None"
   996      "996 Did not go to school"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp071x
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
label define scp079x
   0        "0 Not true"
   1        "1 Sometimes true"
   2        "2 Often true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp080x
   99       "99 Unknown"
;
label define scp083x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp084x
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
label define scp086x
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
label define scp089x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp099x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp116x
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
label define scp133x
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
label define scp139x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t' know"
;
label define scp145x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp146x
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
label define scp149x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp151x
   0        "0 Not true"
   1        "1 Somewhat true"
   2        "2 Certainly true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp156x
   0        "0 No"
   1        "1 Yes, minor difficulties"
   2        "2 Yes, definite difficulties"
   3        "3 Yes, severe difficulties"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp159x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp160x
   1        "1 Less than a month"
   2        "2 1-5 months"
   3        "3 6 to 12 months"
   4        "4 Over a year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp162x
   1        "1 Not at all"
   2        "2 A little"
   3        "3 Some"
   4        "4 A lot"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp169x
   1        "1 Day School"
   2        "2 Overnight School"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp199x
   1        "1 Mentioned"
   2        "2 Not ascertained"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp228x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t' know"
;
label define scp251x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not mentioned"
   9        "9 Don’t know"
;
label define scp257x
   01       "01 Child welfare/social services/family and child services agency"
   02       "02 School or educational system"
   03       "03 Mental health agency"
   04       "04 Private mental health professional"
   05       "05 Juvenile justice agency or court system"
   06       "06 Private insurance service"
   07       "07 Family or friend"
   08       "08 Pediatrician or other family doctor"
   09       "09 Family or youth advocacy groups"
   10       "10 Other"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp258x
   1        "1 Not at all"
   2        "2 A little"
   3        "3 Some"
   4        "4 A lot"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp283x
   1        "1 vaccination or dose"
   2        "2 2 or more vaccination doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp284x
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
label define scp285x
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define scp286x
   1        "1 Flu shot"
   2        "2 Flu nasal spray (spray, mist or drop in nose)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   scp001x;   label values intv_qrt  scp004x;
label values intv_mon  scp005x;

label values region    scp010x;

label values sex       scp013x;   label values hispan_i  scp014x;
label values racerpi2  scp015x;   label values mracrpi2  scp016x;
label values mracbpi2  scp017x;   label values age_p     scp018x;

label values csreltiv  scp020x;   label values lateintc  scp021x;

label values fdrn_flg  scp022x;

label values totoz_p   scp023x;   label values bwtgrm_p  scp024x;
label values chght_tc  scp025x;   label values cwght_tc  scp026x;
label values bmi_sc    scp027x;   label values amr1r     scp028x;
label values aodd1     scp028x;   label values add2      scp028x;
label values amr2r     scp028x;   label values aodd2     scp028x;
label values ccondl01  scp033x;   label values ccondl02  scp033x;
label values ccondl03  scp033x;   label values ccondl04  scp033x;
label values ccondl05  scp033x;   label values ccondl6r  scp033x;
label values ccondl07  scp033x;   label values ccondl08  scp033x;
label values ccondl09  scp033x;   label values ccondl10  scp033x;
label values cpox      scp043x;   label values cpox12mo  scp028x;
label values cashmev   scp028x;   label values casstill  scp028x;
label values cashyr    scp028x;   label values caseryr1  scp028x;
label values hayf1     scp028x;   label values rallg1    scp028x;
label values dallg1    scp028x;   label values sallg1    scp028x;
label values diarh1    scp028x;   label values anemia1   scp028x;
label values earinf1   scp028x;   label values seize1    scp028x;
label values hayf2     scp028x;   label values rallg2    scp028x;
label values dallg2    scp028x;   label values sallg2    scp028x;
label values diarh2    scp028x;   label values anemia2   scp028x;
label values fhead     scp028x;   label values earinf2   scp028x;
label values seize2    scp028x;   label values stutter   scp028x;
label values chstatyr  scp067x;   label values schdayr1  scp068x;
label values ccold2w   scp028x;   label values cintil2w  scp028x;
label values chearst1  scp071x;   label values cvision   scp028x;
label values cblind    scp028x;   label values ihspeq    scp028x;
label values ihmob     scp028x;   label values ihmobyr   scp028x;
label values probrx    scp028x;   label values learnd    scp028x;
label values cmhagm15  scp079x;   label values mhiboy2   scp080x;
label values cmhagf15  scp079x;   label values mhigrl2   scp080x;

label values cusualpl  scp083x;   label values cplkind   scp084x;
label values chcplrou  scp028x;   label values chcplknd  scp086x;
label values chcchgyr  scp028x;   label values chcchghi  scp028x;
label values cnouspl1  scp089x;   label values cnouspl2  scp089x;
label values cnouspl3  scp089x;   label values cnouspl4  scp089x;
label values cnouspl5  scp089x;   label values cnouspl6  scp089x;
label values cnouspl7  scp089x;   label values cnouspl8  scp089x;
label values cnouspl9  scp089x;   label values cprvtryr  scp028x;
label values cprvtrfd  scp099x;   label values cdrnanp   scp028x;
label values cdrnai    scp028x;   label values chcdlyr1  scp028x;
label values chcdlyr2  scp028x;   label values chcdlyr3  scp028x;
label values chcdlyr4  scp028x;   label values chcdlyr5  scp028x;
label values chcafyr   scp028x;   label values chcafyrn  scp028x;
label values chcafyrf  scp028x;   label values chcafyr1  scp028x;
label values chcafyr2  scp028x;   label values chcafyr3  scp028x;
label values chcafyr4  scp028x;   label values chcafyr5  scp028x;
label values chcafyr6  scp028x;   label values cdnlongr  scp116x;
label values chcsyr11  scp028x;   label values chcsyr12  scp028x;
label values chcsyr13  scp028x;   label values chcsyr14  scp028x;
label values chcsyr1   scp028x;   label values chcsyr2   scp028x;
label values chcsyr3   scp028x;   label values chcsyr4   scp028x;
label values chcsyr5   scp028x;   label values chcsyr6   scp028x;
label values chcsyr7   scp028x;   label values chcsyr81  scp028x;
label values chcsyr82  scp028x;   label values chcsyr10  scp028x;
label values chcsyrem  scp028x;   label values chpxyr_c  scp028x;
label values chernoy2  scp133x;   label values cervisnd  scp028x;
label values cerhos    scp028x;   label values cerreas1  scp099x;
label values cerreas2  scp099x;   label values cerreas3  scp028x;
label values cerreas4  scp139x;   label values cerreas5  scp028x;
label values cerreas6  scp099x;   label values cerreas7  scp099x;
label values cerreas8  scp099x;   label values chchyr    scp028x;
label values chchmoyr  scp145x;   label values chchnoy2  scp146x;
label values chcnoyr2  scp133x;   label values csrgyr    scp028x;
label values rsrgnoyr  scp149x;   label values cmdlongr  scp116x;

label values rscl2_c2  scp151x;   label values rscl2_e2  scp151x;
label values rscl3_e3  scp151x;   label values rscl5_p5  scp151x;
label values rscl5_h5  scp151x;   label values rscl6     scp156x;

label values diff6m    scp028x;   label values diffintf  scp028x;
label values diffdeg   scp159x;   label values difflng   scp160x;
label values prescp6m  scp028x;   label values preshelp  scp162x;
label values pmedped   scp028x;   label values pmedpsy   scp028x;
label values pmedneu   scp028x;   label values pmedothr  scp028x;
label values nsduh21   scp028x;   label values nsduh3    scp028x;
label values nsduh31   scp169x;   label values nsduh321  scp033x;
label values nsduh322  scp089x;   label values nsduh323  scp033x;
label values nsduh324  scp089x;   label values nsduh325  scp033x;
label values nsduh4    scp028x;   label values nsduh51r  scp033x;
label values nsduh52r  scp033x;   label values nsduh53r  scp033x;
label values nsduh54r  scp089x;   label values nsduh55r  scp089x;
label values trtwre1r  scp099x;   label values trtwh11r  scp089x;
label values trtwh12r  scp089x;   label values trtwh13r  scp033x;
label values trtwh14r  scp089x;   label values trtwh16r  scp089x;
label values trtmhp11  scp089x;   label values trtmhp12  scp033x;
label values trtmhp13  scp089x;   label values trtmhp14  scp033x;
label values trtwre2r  scp028x;   label values trtwh21r  scp089x;
label values trtwh22r  scp089x;   label values trtwh23r  scp089x;
label values trtwh24r  scp089x;   label values trtwh25r  scp089x;
label values trtwh26r  scp089x;   label values trtmhp21  scp089x;
label values trtmhp22  scp199x;   label values trtmhp23  scp089x;
label values trtmhp24  scp089x;   label values trtwre3r  scp028x;
label values trtwh31r  scp033x;   label values trtwh32r  scp089x;
label values trtwh33r  scp089x;   label values trtwh34r  scp089x;
label values trtwh35r  scp089x;   label values trtwh36r  scp089x;
label values trtmhp31  scp089x;   label values trtmhp32  scp089x;
label values trtmhp33  scp089x;   label values trtmhp34  scp089x;
label values trtwre4r  scp099x;   label values trtwh41r  scp089x;
label values trtwh42r  scp089x;   label values trtwh43r  scp033x;
label values trtwh44r  scp089x;   label values trtwh45r  scp089x;
label values trtwh46r  scp089x;   label values trtmhp41  scp089x;
label values trtmhp42  scp033x;   label values trtmhp43  scp089x;
label values trtmhp44  scp089x;   label values trtwre5r  scp099x;
label values trtwh51r  scp089x;   label values trtwh52r  scp089x;
label values trtwh53r  scp089x;   label values trtwh54r  scp228x;
label values trtwh55r  scp089x;   label values trtwh56r  scp089x;
label values trtmhp51  scp089x;   label values trtmhp52  scp033x;
label values trtmhp53  scp089x;   label values trtmhp54  scp089x;
label values trtwre6r  scp099x;   label values trtwh61r  scp089x;
label values trtwh62r  scp033x;   label values trtwh63r  scp089x;
label values trtwh64r  scp089x;   label values trtwh65r  scp089x;
label values trtwh66r  scp089x;   label values trtmhp61  scp089x;
label values trtmhp62  scp089x;   label values trtmhp63  scp033x;
label values trtmhp64  scp089x;   label values ovrnt6mr  scp099x;
label values overwh1r  scp089x;   label values overwh2r  scp089x;
label values overwh3r  scp089x;   label values overwh4r  scp033x;
label values overwh5r  scp251x;   label values overwh6r  scp089x;
label values overwh7r  scp089x;   label values sh1       scp028x;
label values sh2       scp028x;   label values casem6m   scp028x;
label values casemwho  scp257x;   label values trethelp  scp258x;
label values trpyphir  scp099x;   label values trpyschr  scp099x;
label values trpyslfr  scp099x;   label values trpymedr  scp028x;
label values trpychpr  scp099x;   label values trpymilr  scp099x;
label values trpyshpr  scp099x;   label values trpyihsr  scp028x;
label values trpyothr  scp099x;   label values trtfreer  scp099x;
label values trtneed1  scp099x;   label values ntrcostr  scp099x;
label values ntrlocr   scp099x;   label values ntrnexpr  scp099x;
label values ntrfearr  scp099x;   label values ntrloser  scp099x;
label values ntrsayr   scp099x;   label values ntrwaitr  scp028x;
label values ntrtranr  scp099x;   label values ntrincvr  scp099x;
label values ntrfarr   scp099x;   label values ntrchnor  scp099x;
label values ntrothr   scp099x;

label values cshflu12  scp028x;   label values cshflunm  scp283x;
label values cshflum1  scp284x;   label values cshfluy1  scp285x;
label values cshspfl1  scp286x;   label values cshflum2  scp284x;
label values cshfluy2  scp285x;   label values cshspfl2  scp286x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sc];
save "$OUT/2011/samchild", replace;

#delimit cr

* data file is stored in samchild.dta
* log  file is stored in samchild.log

log close
