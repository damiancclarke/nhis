global LOG "~/database/NHIS/Log"
global DAT "~/database/NHIS/Data/raw/2013"
global OUT "~/database/NHIS/Data/dta/2013"

log using "$LOG/samchild.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
  JUNE 5, 2014  2:57 PM

  THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
  FILE FROM THE 2013 NHIS Public Use Sample Child ASCII FILE

  NOTES:

  EXECUTING THIS PROGRAM WILL REPLACE samchild.dta AND samchild.log
  IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

  THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
  DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
  WITHIN STATA IS THE FOLLOWING COMMAND: cd c:\nhis2013\

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

  str csrespno     50 -  51      csreltvp     52 -  52
  lateintc     53 -  53

  fdrn_flg     54 -  54

  totoz_p      55 -  57      bwtgrm_p     58 -  61
  chght_tc     62 -  63      cwght_tc     64 -  66
  bmi_sc       67 -  70      amr1r        71 -  71
  aodd1        72 -  72      add2         73 -  73
  amr2r        74 -  74      aodd2        75 -  75
  ccondl01     76 -  76      ccondl02     77 -  77
  ccondl03     78 -  78      ccondl04     79 -  79
  ccondl05     80 -  80      ccondl6r     81 -  81
  ccondl07     82 -  82      ccondl08     83 -  83
  ccondl09     84 -  84      ccondl10     85 -  85
  cpox         86 -  86      cpox12mo     87 -  87
  cashmev      88 -  88      casstill     89 -  89
  cashyr       90 -  90      caseryr1     91 -  91
  casmhsp1     92 -  92      cwzmswk1     93 -  95
  casmmed1     96 -  96      casmtyp      97 -  97
  casmcan1     98 -  98      casmdtp2     99 -  99
  caswmp1     100 - 100      casclass    101 - 101
  cas_rec     102 - 102      cas_res     103 - 103
  cas_mon     104 - 104      capenvln    105 - 105
  caroutin    106 - 108      casympt     109 - 109
  carescue    110 - 110      caactlim    111 - 111
  hayf1       112 - 112      rallg1      113 - 113
  dallg1      114 - 114      sallg1      115 - 115
  diarh1      116 - 116      anemia1     117 - 117
  earinf1     118 - 118      seize1      119 - 119
  hayf2       120 - 120      rallg2      121 - 121
  dallg2      122 - 122      sallg2      123 - 123
  diarh2      124 - 124      anemia2     125 - 125
  fhead       126 - 126      earinf2     127 - 127
  seize2      128 - 128      stutter     129 - 129
  chstatyr    130 - 130      schdayr1    131 - 133
  ccold2w     134 - 134      cintil2w    135 - 135
  chearst1    136 - 136      cvision     137 - 137
  cblind      138 - 138      ihspeq      139 - 139
  ihmob       140 - 140      ihmobyr     141 - 141
  probrx      142 - 142      learnd      143 - 143
  cmhagm15    144 - 144      mhiboy2     145 - 146
  cmhagf15    147 - 147      mhigrl2     148 - 149

  cusualpl    150 - 150      cplkind     151 - 151
  chcplrou    152 - 152      chcplknd    153 - 153
  chcchgyr    154 - 154      chcchghi    155 - 155
  cnouspl1    156 - 156      cnouspl2    157 - 157
  cnouspl3    158 - 158      cnouspl4    159 - 159
  cnouspl5    160 - 160      cnouspl6    161 - 161
  cnouspl7    162 - 162      cnouspl8    163 - 163
  cnouspl9    164 - 164      cprvtryr    165 - 165
  cprvtrfd    166 - 166      cdrnanp     167 - 167
  cdrnai      168 - 168      chcdlyr1    169 - 169
  chcdlyr2    170 - 170      chcdlyr3    171 - 171
  chcdlyr4    172 - 172      chcdlyr5    173 - 173
  chcafyr     174 - 174      chcafyrn    175 - 175
  chcafyrf    176 - 176      chcafyr1    177 - 177
  chcafyr2    178 - 178      chcafyr3    179 - 179
  chcafyr4    180 - 180      chcafyr5    181 - 181
  chcafyr6    182 - 182      cdnlongr    183 - 183
  chcsyr11    184 - 184      chcsyr12    185 - 185
  chcsyr13    186 - 186      chcsyr14    187 - 187
  chcsyr1     188 - 188      chcsyr2     189 - 189
  chcsyr3     190 - 190      chcsyr4     191 - 191
  chcsyr5     192 - 192      chcsyr6     193 - 193
  chcsyr7     194 - 194      chcsyr81    195 - 195
  chcsyr82    196 - 196      chcsyr10    197 - 197
  chcsyrem    198 - 198      chpxyr_c    199 - 199
  chernoy2    200 - 201      cervisnd    202 - 202
  cerhos      203 - 203      cerrea1r    204 - 204
  cerrea2r    205 - 205      cerrea3r    206 - 206
  cerrea4r    207 - 207      cerrea5r    208 - 208
  cerrea6r    209 - 209      cerrea7r    210 - 210
  cerrea8r    211 - 211      chchyr      212 - 212
  chchmoyr    213 - 214      chchnoy2    215 - 216
  chcnoyr2    217 - 218      csrgyr      219 - 219
  rsrgnoyr    220 - 221      cmdlongr    222 - 222
  

  rscl2_c2    223 - 223      rscl2_e2    224 - 224
  rscl3_e3    225 - 225      rscl5_p5    226 - 226
  rscl5_h5    227 - 227      rscl6       228 - 228

  diff6m      229 - 229      diffintf    230 - 230
  diffdeg     231 - 231      difflng     232 - 232
  prescp6m    233 - 233      preshelp    234 - 234
  pmedped     235 - 235      pmedpsy     236 - 236
  pmedneu     237 - 237      pmedothr    238 - 238
  nsduh21     239 - 239      nsduh3      240 - 240
  nsduh31     241 - 241      nsduh321    242 - 242
  nsduh322    243 - 243      nsduh323    244 - 244
  nsduh324    245 - 245      nsduh325    246 - 246
  nsduh4      247 - 247      nsduh51r    248 - 248
  nsduh52r    249 - 249      nsduh53r    250 - 250
  nsduh54r    251 - 251      nsduh55r    252 - 252
  trtwre1r    253 - 253      trtwh11r    254 - 254
  trtwh12r    255 - 255      trtwh13r    256 - 256
  trtwh14r    257 - 257      trtwh16r    258 - 258
  trtmhp11    259 - 259      trtmhp12    260 - 260
  trtmhp13    261 - 261      trtmhp14    262 - 262
  trtwre2r    263 - 263      trtwh21r    264 - 264
  trtwh22r    265 - 265      trtwh23r    266 - 266
  trtwh24r    267 - 267      trtwh25r    268 - 268
  trtwh26r    269 - 269      trtmhp21    270 - 270
  trtmhp22    271 - 271      trtmhp23    272 - 272
  trtmhp24    273 - 273      trtwre3r    274 - 274
  trtwh31r    275 - 275      trtwh32r    276 - 276
  trtwh33r    277 - 277      trtwh34r    278 - 278
  trtwh35r    279 - 279      trtwh36r    280 - 280
  trtmhp31    281 - 281      trtmhp32    282 - 282
  trtmhp33    283 - 283      trtmhp34    284 - 284
  trtwre4r    285 - 285      trtwh41r    286 - 286
  trtwh42r    287 - 287      trtwh43r    288 - 288
  trtwh44r    289 - 289      trtwh45r    290 - 290
  trtwh46r    291 - 291      trtmhp41    292 - 292
  trtmhp42    293 - 293      trtmhp43    294 - 294
  trtmhp44    295 - 295      trtwre5r    296 - 296
  trtwh51r    297 - 297      trtwh52r    298 - 298
  trtwh53r    299 - 299      trtwh54r    300 - 300
  trtwh55r    301 - 301      trtwh56r    302 - 302
  trtmhp51    303 - 303      trtmhp52    304 - 304
  trtmhp53    305 - 305      trtmhp54    306 - 306
  trtwre6r    307 - 307      trtwh61r    308 - 308
  trtwh62r    309 - 309      trtwh63r    310 - 310
  trtwh64r    311 - 311      trtwh65r    312 - 312
  trtwh66r    313 - 313      trtmhp61    314 - 314
  trtmhp62    315 - 315      trtmhp63    316 - 316
  trtmhp64    317 - 317      ovrnt6mr    318 - 318
  overwh1r    319 - 319      overwh2r    320 - 320
  overwh3r    321 - 321      overwh4r    322 - 322
  overwh5r    323 - 323      overwh6r    324 - 324
  overwh7r    325 - 325      sh1         326 - 326
  sh2         327 - 327      casem6m     328 - 328
  casemwho    329 - 330      trethelp    331 - 331
  trpyphir    332 - 332      trpyschr    333 - 333
  trpyslfr    334 - 334      trpymedr    335 - 335
  trpychpr    336 - 336      trpymilr    337 - 337
  trpyshpr    338 - 338      trpyihsr    339 - 339
  trpyothr    340 - 340      trtfreer    341 - 341
  trtneed1    342 - 342      ntrcostr    343 - 343
  ntrlocr     344 - 344      ntrnexpr    345 - 345
  ntrfearr    346 - 346      ntrloser    347 - 347
  ntrsayr     348 - 348      ntrwaitr    349 - 349
  ntrtranr    350 - 350      ntrincvr    351 - 351
  ntrfarr     352 - 352      ntrchnor    353 - 353
  ntrothr     354 - 354

  cshflu12    355 - 355      cshflunm    356 - 356
  cshflum1    357 - 358      cshfluy1    359 - 362
  cshspfl1    363 - 363      cshflum2    364 - 365
  cshfluy2    366 - 369      cshspfl2    370 - 370

  using "$DAT/samchild.dat";
replace wtia_sc = wtia_sc/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "File type identifier";
label variable srvy_yr  "Year of National Health Interview Survey";
label variable hhx      "Household Number";
label variable intv_qrt "Interview Quarter";
label variable intv_mon "Interview Month";
label variable fmx      "Family Number";
label variable fpx      "Person Number (Within family)";
label variable wtia_sc  "Weight - Interim Annual";
label variable wtfa_sc  "Weight - Final Annual";

label variable region   "Region";
label variable strat_p  "Pseudo-stratum for public use file variance estimation
  ";
label variable psu_p    "Pseudo-PSU for public use file variance estimation";

label variable sex      "Sex";
label variable hispan_i "Hispanic subgroup detail";
label variable racerpi2 "OMB groups w/multiple race";
label variable mracrpi2 "Race coded to single/multiple race group";
label variable mracbpi2 "Race coded to single/multiple race group";
label variable age_p    "Age";

label variable csrespno "Person # of available SC respondent";
label variable csreltvp "Person's relationship to child";
label variable lateintc "Late Sample Child interviews";

label variable fdrn_flg "Disability Questions flag";

label variable totoz_p  "Total birth weight in ounces for public use";
label variable bwtgrm_p "Birth weight in grams for public use";
label variable chght_tc "Total current height in inches (truncated)";
label variable cwght_tc "Current weight in pounds (truncated)";
label variable bmi_sc   "Body Mass Index (BMI)";
label variable amr1r    "
  Ever told SC had an intellectual disability also known as mental retardation";
label variable aodd1    "Ever told SC had other developmental delay";
label variable add2     "Ever told SC had ADHD/ADD";
label variable amr2r    "
  Ever told SC had an intellectual disability also known as mental retardation";
label variable aodd2    "Ever told SC had other developmental delay";
label variable ccondl01 "Ever told SC had Down syndrome";
label variable ccondl02 "Ever told SC had cerebral palsy";
label variable ccondl03 "Ever told SC had muscular dystrophy";
label variable ccondl04 "Ever told SC had cystic fibrosis";
label variable ccondl05 "Ever told SC had sickle cell anemia";
label variable ccondl6r "Ever told SC had autism/autism spectrum disorder";
label variable ccondl07 "Ever told SC had diabetes";
label variable ccondl08 "Ever told SC had arthritis";
label variable ccondl09 "Ever told SC had congenital heart disease";
label variable ccondl10 "Ever told SC had other heart condition";
label variable cpox     "Ever had chickenpox";
label variable cpox12mo "Chickenpox, past 12 m";
label variable cashmev  "Ever been told SC had asthma";
label variable casstill "Still have asthma";
label variable cashyr   "Had an asthma episode/attack, past 12 m";
label variable caseryr1 "Had visit to ER due to asthma, past 12 m";
label variable casmhsp1 "
  Stayed overnight in a hospital because of asthma, past 12 m";
label variable cwzmswk1 "
  # DAYS of school/work missed because of asthma, past 12 m";
label variable casmmed1 "
  Used PRESCRIPTION inhaler THAT YOU BREATHE IN THROUGH YOUR MOUTH, that gives QUI
  CK relief from asthma symptoms, past 3 m";
label variable casmtyp  "Used inhaler/disk inhaler or nebulizer most often";
label variable casmcan1 "
  Used more than three canisters of this type of inhaler, past 3 m.";
label variable casmdtp2 "How often take preventive asthma medication";
label variable caswmp1  "
  Doctor/other health professional EVER give an asthma action plan";
label variable casclass "EVER took a course/class on how to manage asthma";
label variable cas_rec  "
  Doctor/other health professional EVER taught parent how to recognize early signs
  of an asthma episode";
label variable cas_res  "
  Doctor/other health professional EVER taught parent how to respond to episodes o
  f asthma";
label variable cas_mon  "
  Doctor/other health professional EVER taught parent how to monitor peak flow for
  daily therapy";
label variable capenvln "
  Doctor/other health professional EVER advised to change things in home to improv
  e asthma";
label variable caroutin "
  Number of times saw doctor/other health professional for routine asthma checkup
  ";
label variable casympt  "
  Doctor/other health professional ask how often child had asthma symptoms";
label variable carescue "
  Doctor/other health professional ask how often child used quick relief inhaler";
label variable caactlim "
  Doctor/other health professional ask how often asthma symptoms limited daily act
  ivities";
label variable hayf1    "Had hay fever, past 12 m";
label variable rallg1   "Had respiratory allergy, past 12 m";
label variable dallg1   "Had food/digestive allergy, past 12 m";
label variable sallg1   "Had eczema/skin allergy, past 12 m";
label variable diarh1   "Had frequent diarrhea/colitis, past 12 m";
label variable anemia1  "Had anemia, past 12 m";
label variable earinf1  "Had 3+ ear infections, past 12 m";
label variable seize1   "Had seizures, past 12 m";
label variable hayf2    "Had hay fever, past 12 m";
label variable rallg2   "Had respiratory allergy, past 12 m";
label variable dallg2   "Had food/digestive allergy, past 12 m";
label variable sallg2   "Had eczema/skin allergy, past 12 m";
label variable diarh2   "Had frequent diarrhea/colitis, past 12 m";
label variable anemia2  "Had anemia, past 12 m";
label variable fhead    "Had frequent headaches/migraines, past 12 m";
label variable earinf2  "Had 3+ ear infections, past 12 m";
label variable seize2   "Had seizures, past 12 m";
label variable stutter  "Stuttered/stammered, past 12 m";
label variable chstatyr "Health better, worse, or about the same";
label variable schdayr1 "Days missed due to illness/injury, past 12 m";
label variable ccold2w  "Had a head/chest cold, 2 week reference period";
label variable cintil2w "
  Had stomach illness with vomiting/diarrhea,   2 week reference period";
label variable chearst1 "Hearing without hearing aid";
label variable cvision  "Trouble seeing";
label variable cblind   "Blind/unable to see at all";
label variable ihspeq   "Need special equipment due to impairment/health problem
  ";
label variable ihmob    "Impairment/health problem limit crawl/walk/run/play";
label variable ihmobyr  "Impairment/health problem lasted/will last 12+ m";
label variable probrx   "Taken RX medication for 3+ m";
label variable learnd   "Ever told SC had a learning disability";
label variable cmhagm15 "Been unhappy/depressed, past 2 m";
label variable mhiboy2  "Mental health indicator (MHI) scale score";
label variable cmhagf15 "Been unhappy/depressed, past 2 m";
label variable mhigrl2  "Mental health indicator (MHI) scale score";
label variable cusualpl "Place USUALLY go when sick";
label variable cplkind  "Type of place to go when sick (most often)";
label variable chcplrou "USUALLY go there for routine/preventive care";
label variable chcplknd "Type of place USUALLY go for routine/preventive care";
label variable chcchgyr "Change health care place, past 12 m";
label variable chcchghi "Change related to health insurance";
label variable cnouspl1 "Doesn't need doctor/No problems";
label variable cnouspl2 "Doesn't like/trust/believe in doctors";
label variable cnouspl3 "Doesn't know where to go";
label variable cnouspl4 "Previous doctor not available/moved";
label variable cnouspl5 "Too expensive/no insurance/cost";
label variable cnouspl6 "Speak a different language";
label variable cnouspl7 "No care available/Care too far away, inconvenient";
label variable cnouspl8 "Put it off/Didn't get around to it";
label variable cnouspl9 "
  Other reason child not have usual source of medical care";
label variable cprvtryr "Trouble finding a general doctor to see child";
label variable cprvtrfd "Able to find general doctor to see child";
label variable cdrnanp  "Doctor's office not accept child as new patient";
label variable cdrnai   "Doctor's office not accept child's health insurance";
label variable chcdlyr1 "Couldn't get through on phone, past 12 m";
label variable chcdlyr2 "Couldn't get appointment soon enough, past 12 m";
label variable chcdlyr3 "Wait too long in doctor's office, past 12 m";
label variable chcdlyr4 "Not open when you could go, past 12 m";
label variable chcdlyr5 "No transportation, past 12 m";
label variable chcafyr  "Can't afford prescription medicine, past 12 m";
label variable chcafyrn "Can't afford to see a specialist, past 12 m";
label variable chcafyrf "Can't afford follow-up care, past 12 m";
label variable chcafyr1 "Can't afford prescription medicine, past 12 m";
label variable chcafyr2 "Can't afford mental care/counseling, past 12 m";
label variable chcafyr3 "Can't afford dental care, past 12 m";
label variable chcafyr4 "Can't afford eyeglasses, past 12 m";
label variable chcafyr5 "Can't afford to see a specialist, past 12 m";
label variable chcafyr6 "Can't afford follow-up care, past 12 m";
label variable cdnlongr "Time since last saw dentist";
label variable chcsyr11 "Seen/talked to eye doctor, past 12 m";
label variable chcsyr12 "Seen/talked to foot doctor, past 12 m";
label variable chcsyr13 "Seen/talked to therapist (PT/OT/etc), past 12 m";
label variable chcsyr14 "Seen/talked to a NP/PA, past 12 m";
label variable chcsyr1  "Seen/talked to mental health professional, past 12 m";
label variable chcsyr2  "Seen/talked to eye doctor, past 12 m";
label variable chcsyr3  "Seen/talked to foot doctor, past 12 m";
label variable chcsyr4  "Seen/talked to chiropractor, past 12 m";
label variable chcsyr5  "Seen/talked to therapist (PT/OT/etc), past 12 m";
label variable chcsyr6  "Seen/talked to NP/PA/midwife, past 12 m";
label variable chcsyr7  "Seen/talked to obstetrician/gynecologist, past 12 m";
label variable chcsyr81 "Seen/talked to a medical specialist, past 12 m";
label variable chcsyr82 "Seen/talked to a general doctor, past 12 m";
label variable chcsyr10 "Doctor treats both children and adults";
label variable chcsyrem "Seen/talked to doctor for emotional/behavioral problem
  ";
label variable chpxyr_c "Had well-child checkup, past 12 m";
label variable chernoy2 "# times in ER/ED, past 12 m";
label variable cervisnd "Most recent ER visit at night or on weekend";
label variable cerhos   "Hospital admission was result of most recent ER visit";
label variable cerrea1r "Didn't have another place to go";
label variable cerrea2r "Doctor's office or clinic was not open";
label variable cerrea3r "Health provider advised ER visit";
label variable cerrea4r "Problem too serious for doctor's office or clinic";
label variable cerrea5r "Only a hospital could help";
label variable cerrea6r "ER is closest provider";
label variable cerrea7r "ER provides most of child's medical care";
label variable cerrea8r "Arrived by ambulance or other emergency vehicle";
label variable chchyr   "Received home care from health professional, past 12 m
  ";
label variable chchmoyr "# of months of home care, past 12 m";
label variable chchnoy2 "Total number of home visits";
label variable chcnoyr2 "Total number of office visits, past 12 m";
label variable csrgyr   "Had surgery/surgical procedure, past 12 m";
label variable rsrgnoyr "# of outpatient surgeries, past 12 m";
label variable cmdlongr "Time since last seen/talked to health professional";

label variable rscl2_c2 "Well behaved/does what requested, past 6 m";
label variable rscl2_e2 "Many worries/often seems worried, past 6 m";
label variable rscl3_e3 "Unhappy/depressed/tearful, past 6 m";
label variable rscl5_p5 "
  Gets along better w/adults than children/youth, past 6 m";
label variable rscl5_h5 "Good attention/completes chores, homework, past 6 m";
label variable rscl6    "
  Difficulties w/emotions/concentration/behavior/getting along";
label variable diff6m   "
  Difficulties with emotions, concentration, behavior, past 6 months";
label variable diffintf "
  Difficulties interfere with family, school, or daily activities, past 6 months";
label variable diffdeg  "
  How much difficulties interfere with family, school, or daily activities";
label variable difflng  "How long difficulties have been present";
label variable prescp6m "
  Medication prescribed for difficulties with emotions, concentration, behavior, o
  r getting along with others, past 6 months";
label variable preshelp "How much prescribed medicine helped";
label variable pmedped  "
  Pediatrician or other family doctor first prescribed medication";
label variable pmedpsy  "
  Psychiatrist, psychologist or other mental health professional first prescribed
  medication";
label variable pmedneu  "Neurologist first prescribed medication";
label variable pmedothr "Someone else first prescribed medication";
label variable nsduh21  "
  Treatment or counseling from school personnel, past 6 months";
label variable nsduh3   "
  Attend school for students with difficulties with emotions, concentration, behav
  ior, past 6 months";
label variable nsduh31  "
  Attend a special needs day or overnight school, past 6 months";
label variable nsduh321 "
  Special Education teacher provided treatment or counseling in a special needs da
  y school";
label variable nsduh322 "
  Other school teacher provided treatment or counseling in a special needs day sch
  ool";
label variable nsduh323 "
  School counselor, psychologist, nurse or social worker provided treatment or cou
  nseling in a special needs day school";
label variable nsduh324 "
  School speech, occupational or physical therapist provided treatment or counseli
  ng in a special needs day school";
label variable nsduh325 "
  Other school official provided treatment or counseling in a special needs day sc
  hool";
label variable nsduh4   "
  Participate in school program for students with difficulties with emotions, conc
  entration, behavior, past 6 months";
label variable nsduh51r "
  Special Ed teacher provided treatment or counseling in school program";
label variable nsduh52r "
  Other school teacher provided treatment or counseling in school program";
label variable nsduh53r "
  School counselor, psychologist, nurse or social worker provided treatment or cou
  nseling in school program";
label variable nsduh54r "
  School speech, occupational or physical therapist provided treatment or counseli
  ng in school program";
label variable nsduh55r "
  Other school official provided treatment or counseling in school program";
label variable trtwre1r "
  Treatment or counseling provided at daycare, child care, or play group, past 6 m
  onths";
label variable trtwh11r "
  Pediatrician or family doctor provided treatment or counseling at daycare, child
  care, or play group";
label variable trtwh12r "
  Psychiatrist, psychologist, clinical social worker or psychiatric nurse provided
  treatment or counseling at daycare, child care, or play group";
label variable trtwh13r "
  Speech, occupational or physical therapist provided treatment or counseling at d
  aycare, child care, or play group";
label variable trtwh14r "
  Religious or spiritual counselor or advisor provided treatment or counseling at
  daycare, child care, or play group";
label variable trtwh16r "
  Other source provided treatment or counseling at daycare, child care, or play gr
  oup";
label variable trtmhp11 "
  Psychiatrist provided treatment or counseling at daycare, child care, or play gr
  oup";
label variable trtmhp12 "
  Psychologist provided treatment or counseling at daycare, child care, or play gr
  oup";
label variable trtmhp13 "
  Clinical social worker provided treatment or counseling at daycare, child care,
  or play group";
label variable trtmhp14 "
  Psychiatric nurse provided treatment or counseling at daycare, child care, or pl
  ay group";
label variable trtwre2r "
  Treatment or counseling provided in an office, clinic or community center, past
  6 months";
label variable trtwh21r "
  Pediatrician or family doctor provided treatment or counseling in an office, cli
  nic or community center";
label variable trtwh22r "
  Psychiatrist, psychologist, clinical social worker or psychiatric nurse provided
  treatment or counseling in an office, clinic or community center";
label variable trtwh23r "
  Speech, occupational or physical therapist provided treatment or counseling in a
  n office, clinic or community center";
label variable trtwh24r "
  Religious or spiritual counselor or advisor provided treatment or counseling in
  an office, clinic or community center";
label variable trtwh25r "
  Probation or juvenile corrections officer or court counselor provided treatment
  or counseling in an office, clinic or community center";
label variable trtwh26r "
  Other source provided treatment or counseling in an office, clinic or community
  center";
label variable trtmhp21 "
  Psychiatrist provided treatment or counseling at an office, clinic or community
  center";
label variable trtmhp22 "
  Psychologist provided treatment or counseling at an office, clinic or community
  center";
label variable trtmhp23 "
  Clinical social worker provided treatment or counseling at an office, clinic or
  community center";
label variable trtmhp24 "
  Psychiatric nurse provided treatment or counseling at an office, clinic or commu
  nity center";
label variable trtwre3r "
  Treatment or counseling provided in home by visiting teacher or counselor";
label variable trtwh31r "
  Pediatrician or family doctor provided treatment or counseling in home";
label variable trtwh32r "
  Psychiatrist, psychologist, clinical social worker or psychiatric nurse provided
  treatment or counseling in home";
label variable trtwh33r "
  Speech, occupational or physical therapist provided treatment or counseling in h
  ome";
label variable trtwh34r "
  Religious or spiritual counselor or advisor provided treatment or counseling in
  home";
label variable trtwh35r "
  Probation or juvenile corrections officer or court counselor provided treatment
  or counseling in home";
label variable trtwh36r "Other source provided treatment or counseling in home";
label variable trtmhp31 "Psychiatrist provided treatment or counseling at home";
label variable trtmhp32 "Psychologist provided treatment or counseling at home";
label variable trtmhp33 "
  Clinical social worker provided treatment or counseling at home";
label variable trtmhp34 "
  Psychiatric nurse provided treatment or counseling at home";
label variable trtwre4r "
  Treatment or counseling provided in hospital ER, crisis center, or shelter, past
  6 months";
label variable trtwh41r "
  Pediatrician or family doctor provided treatment or counseling in hospital ER, c
  risis center, or emergency shelter";
label variable trtwh42r "
  Psychiatrist, psychologist, clinical social worker or psychiatric nurse provided
  treatment or counseling in hospital ER, crisis center, or emergency shelter";
label variable trtwh43r "
  Speech, occupational or physical therapist provided treatment or counseling in h
  ospital ER, crisis center, or shelter";
label variable trtwh44r "
  Religious or spiritual counselor or advisor provided treatment or counseling in
  hospital ER, crisis center, or emergency shelter";
label variable trtwh45r "
  Probation or juvenile corrections officer or court counselor provided treatment
  or counseling in hospital ER, crisis center, or emergency shelter";
label variable trtwh46r "
  Other source provided treatment or counseling in hospital ER, crisis center, or
  emergency shelter";
label variable trtmhp41 "
  Psychiatrist provided treatment or counseling at hospital/ER/crisis center/shelt
  er";
label variable trtmhp42 "
  Psychologist provided treatment or counseling at hospital/ER/crisis center/shelt
  er";
label variable trtmhp43 "
  Clinical social worker provided treatment or counseling at hospital/ER/crisis ce
  nter/shelter";
label variable trtmhp44 "
  Psychiatric nurse provided treatment or counseling at hospital/ER/crisis center/
  shelter";
label variable trtwre5r "
  Treatment or counseling provided in hospital or community day program, past 6 mo
  nths";
label variable trtwh51r "
  Pediatrician or family doctor provided treatment or counseling in hospital or co
  mmunity day program";
label variable trtwh52r "
  Psychiatrist, psychologist, clinical social worker or psychiatric nurse provided
  treatment or counseling in hospital or community day program";
label variable trtwh53r "
  Speech, occupational or physical therapist provided treatment or counseling in h
  ospital or community day program";
label variable trtwh54r "
  Religious or spiritual counselor or advisor provided treatment or counseling in
  hospital or community day program";
label variable trtwh55r "
  Probation or juvenile corrections officer or court counselor provided treatment
  or counseling in hospital or community day program";
label variable trtwh56r "
  Other source provided treatment or counseling in hospital or community day progr
  am";
label variable trtmhp51 "
  Psychiatrist provided treatment or counseling at day treatment program in a hosp
  ital or community";
label variable trtmhp52 "
  Psychologist provided treatment or counseling at day treatment program in a hosp
  ital or community";
label variable trtmhp53 "
  Clinical social worker provided treatment or counseling at day treatment program
  in a hospital or community";
label variable trtmhp54 "
  Psychiatric nurse provided treatment or counseling at day treatment program in a
  hospital or community";
label variable trtwre6r "
  Treatment or counseling provided in any other place, past 6 months";
label variable trtwh61r "
  Pediatrician or family doctor provided treatment or counseling in any other plac
  e";
label variable trtwh62r "
  Psychiatrist, psychologist, clinical social worker or psychiatric nurse provided
  treatment or counseling in any other place";
label variable trtwh63r "
  Speech, occupational or physical therapist provided treatment or counseling in a
  ny other place";
label variable trtwh64r "
  Religious or spiritual counselor or advisor provided treatment or counseling in
  any other place";
label variable trtwh65r "
  Probation or juvenile corrections officer or court counselor provided treatment
  or counseling in any other place";
label variable trtwh66r "
  Other source provided treatment or counseling in any other place";
label variable trtmhp61 "
  Psychiatrist provided treatment or counseling at another place";
label variable trtmhp62 "
  Psychologist provided treatment or counseling at another place";
label variable trtmhp63 "
  Clinical social worker provided treatment or counseling at another place";
label variable trtmhp64 "
  Psychiatric nurse provided treatment or counseling at another place";
label variable ovrnt6mr "
  Overnight or longer stay in facility for difficulties with emotions, concentrati
  on, or behavior, past 6 months";
label variable overwh1r "
  Stayed overnight in a hospital for difficulties with emotions, concentration, or
  behavior";
label variable overwh2r "
  Stayed overnight in a residential treatment center for difficulties with emotion
  s, concentration, or behavior";
label variable overwh3r "
  Stayed overnight in a foster care or therapeutic foster care home for difficulti
  es with emotions, concentration, or behavior";
label variable overwh4r "
  Stayed overnight in any type of  juvenile detention center, sometimes called 'ju
  vie', prison or jail for difficulties with emotions, concentration, or behavior
  ";
label variable overwh5r "
  Stayed overnight in a group home for difficulties with emotions, concentration,
  or behavior";
label variable overwh6r "
  Stayed overnight in a homeless shelter for difficulties with emotions, concentra
  tion, or behavior";
label variable overwh7r "
  Stayed overnight in another place for difficulties with emotions, concentration,
  or behavior";
label variable sh1      "
  Participate in self-help group for children/youth with difficulties with emotion
  s, concentration, or behavior, past 6 months";
label variable sh2      "
  Use internet to seek treatment or counseling for difficulties with emotions, con
  centration, or behavior, past 6 months";
label variable casem6m  "
  Case management help from individual or agency, past 6 months";
label variable casemwho "Case management main provider";
label variable trethelp "
  Amount that treatment or counseling helped child, past 6 months";
label variable trpyphir "
  Private health insurance paid for treatment or counseling";
label variable trpyschr "School system paid for treatment or counseling";
label variable trpyslfr "Family paid for treatment or counseling";
label variable trpymedr "Medicaid paid for treatment or counseling";
label variable trpychpr "State SCHIP/CHIP paid for treatment or counseling";
label variable trpymilr "Military health care paid for treatment or counseling";
label variable trpyshpr "
  Medicare or other government plan paid for treatment or counseling";
label variable trpyihsr "Indian Health Service paid for treatment or counseling
  ";
label variable trpyothr "Some other source paid for treatment or counseling";
label variable trtfreer "All treatment or counseling was received free";
label variable trtneed1 "
  Needed treatment or counseling for difficulties with emotions, concentration, or
  behavior, past 6 months, but did not get it";
label variable ntrcostr "
  Didn't get treatment or counseling because it was too expensive";
label variable ntrlocr  "
  Didn't get treatment or counseling because didn't know where to go";
label variable ntrnexpr "
  Didn't get treatment or counseling because had negative experience previously";
label variable ntrfearr "
  Didn't get treatment or counseling because afraid or dislike counselors";
label variable ntrloser "
  Didn't get treatment or counseling because afraid child would be removed from ho
  me or lose custody";
label variable ntrsayr  "
  Didn't get treatment or counseling because afraid of family/friends opinion";
label variable ntrwaitr "
  Didn't get treatment or counseling because it was a long wait time for appointme
  nt";
label variable ntrtranr "
  Didn't get treatment or counseling because had no way to get there";
label variable ntrincvr "
  Didn't get treatment or counseling because services were too inconvenient to use
  ";
label variable ntrfarr  "
  Didn't get treatment or counseling because services were too far away";
label variable ntrchnor "
  Didn't get treatment or counseling because child did not want to go.";
label variable ntrothr  "
  Didn't get treatment or counseling for some other reason";

label variable cshflu12 "Flu vaccination, past 12 m";
label variable cshflunm "Number of flu vaccines, past 12 m";
label variable cshflum1 "Month of most recent flu vaccine";
label variable cshfluy1 "Year of most recent flu vaccine";
label variable cshspfl1 "Administration method most recent flu vaccine";
label variable cshflum2 "Month of next most recent flu vaccine";
label variable cshfluy2 "Year of next most recent flu vaccine";
label variable cshspfl2 "Administration method next most recent flu vaccine";

* DEFINE VALUE LABELS FOR REPORTS;

label define scp001x
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
  1        "1 Parent (Biological, adoptive, or step)"
  2        "2 Grandparent"
  3        "3 Aunt/Uncle"
  4        "4 Brother/Sister"
  5        "5 Other relative or other non-relative"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp021x
  1        "1 Started Sample Child Core 2+ weeks after the initial interview"
  2        "
  2 Started Sample Child Core less than 2 weeks after the initial interview"
  ;
label define scp022x
  1        "1 Families selected to receive AFD (sample adults) section"
  2        "
  2 Families selected to receive FDB (all persons 1 year and older) section"
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
label define scp050x
  000      "000 None"
  995      "995 Child is home schooled"
  996      "996 Child does not go to school"
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don't know"
  ;
label define scp054x
  1        "1 Every day or almost every day"
  2        "2 Less often"
  3        "3 Never"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp060x
  1        "1 Yes"
  2        "2 No"
  3        "3 Was told no changes needed"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp061x
  000      "000 None"
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don’t know"
  ;
label define scp062x
  1        "1 Yes"
  2        "2 No"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define scp083x
  1        "1 Better"
  2        "2 Worse"
  3        "3 About the same"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp084x
  000      "000 None"
  996      "996 Did not go to school"
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don't know"
  ;
label define scp087x
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
label define scp095x
  0        "0 Not true"
  1        "1 Sometimes true"
  2        "2 Often true"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp096x
  99       "99 Unknown"
  ;
label define scp099x
  1        "1 Yes"
  2        "2 There is NO place"
  3        "3 There is MORE THAN ONE place"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp100x
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
label define scp102x
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
label define scp105x
  1        "1 Mentioned"
  2        "2 Not mentioned"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define scp132x
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
label define scp149x
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
label define scp155x
  1        "1 Yes"
  2        "2 No"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t' know"
  ;
label define scp161x
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define scp162x
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
label define scp165x
  95       "95 95+ times"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define scp167x
  0        "0 Not true"
  1        "1 Somewhat true"
  2        "2 Certainly true"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp172x
  0        "0 No"
  1        "1 Yes, minor difficulties"
  2        "2 Yes, definite difficulties"
  3        "3 Yes, severe difficulties"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp175x
  1        "1 A lot"
  2        "2 Some"
  3        "3 A little"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp176x
  1        "1 Less than a month"
  2        "2 1-5 months"
  3        "3 6 to 12 months"
  4        "4 Over a year"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define scp178x
  1        "1 Not at all"
  2        "2 A little"
  3        "3 Some"
  4        "4 A lot"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp185x
  1        "1 Day School"
  2        "2 Overnight School"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp215x
  1        "1 Mentioned"
  2        "2 Not ascertained"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define scp244x
  1        "1 Mentioned"
  2        "2 Not mentioned"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t' know"
  ;
label define scp267x
  1        "1 Mentioned"
  2        "2 Not mentioned"
  7        "7 Refused"
  8        "8 Not mentioned"
  9        "9 Don’t know"
  ;
label define scp273x
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
label define scp274x
  1        "1 Not at all"
  2        "2 A little"
  3        "3 Some"
  4        "4 A lot"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define scp299x
  1        "1 1 vaccination or dose"
  2        "2 2 or more vaccination doses"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define scp300x
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
label define scp301x
  9997     "9997 Refused"
  9998     "9998 Not ascertained"
  9999     "9999 Don't know"
  ;
label define scp302x
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

label values csreltvp  scp020x;   label values lateintc  scp021x;

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
label values casmhsp1  scp028x;   label values cwzmswk1  scp050x;
label values casmmed1  scp028x;   label values casmtyp   scp028x;
label values casmcan1  scp028x;   label values casmdtp2  scp054x;
label values caswmp1   scp028x;   label values casclass  scp028x;
label values cas_rec   scp028x;   label values cas_res   scp028x;
label values cas_mon   scp028x;   label values capenvln  scp060x;
label values caroutin  scp061x;   label values casympt   scp062x;
label values carescue  scp062x;   label values caactlim  scp062x;
label values hayf1     scp028x;   label values rallg1    scp028x;
label values dallg1    scp028x;   label values sallg1    scp028x;
label values diarh1    scp028x;   label values anemia1   scp028x;
label values earinf1   scp028x;   label values seize1    scp028x;
label values hayf2     scp028x;   label values rallg2    scp028x;
label values dallg2    scp028x;   label values sallg2    scp028x;
label values diarh2    scp028x;   label values anemia2   scp028x;
label values fhead     scp028x;   label values earinf2   scp028x;
label values seize2    scp028x;   label values stutter   scp028x;
label values chstatyr  scp083x;   label values schdayr1  scp084x;
label values ccold2w   scp028x;   label values cintil2w  scp028x;
label values chearst1  scp087x;   label values cvision   scp028x;
label values cblind    scp028x;   label values ihspeq    scp028x;
label values ihmob     scp028x;   label values ihmobyr   scp028x;
label values probrx    scp028x;   label values learnd    scp028x;
label values cmhagm15  scp095x;   label values mhiboy2   scp096x;
label values cmhagf15  scp095x;   label values mhigrl2   scp096x;

label values cusualpl  scp099x;   label values cplkind   scp100x;
label values chcplrou  scp028x;   label values chcplknd  scp102x;
label values chcchgyr  scp028x;   label values chcchghi  scp028x;
label values cnouspl1  scp105x;   label values cnouspl2  scp105x;
label values cnouspl3  scp105x;   label values cnouspl4  scp105x;
label values cnouspl5  scp105x;   label values cnouspl6  scp105x;
label values cnouspl7  scp105x;   label values cnouspl8  scp105x;
label values cnouspl9  scp105x;   label values cprvtryr  scp028x;
label values cprvtrfd  scp062x;   label values cdrnanp   scp028x;
label values cdrnai    scp028x;   label values chcdlyr1  scp028x;
label values chcdlyr2  scp028x;   label values chcdlyr3  scp028x;
label values chcdlyr4  scp028x;   label values chcdlyr5  scp028x;
label values chcafyr   scp028x;   label values chcafyrn  scp028x;
label values chcafyrf  scp028x;   label values chcafyr1  scp028x;
label values chcafyr2  scp028x;   label values chcafyr3  scp028x;
label values chcafyr4  scp028x;   label values chcafyr5  scp028x;
label values chcafyr6  scp028x;   label values cdnlongr  scp132x;
label values chcsyr11  scp028x;   label values chcsyr12  scp028x;
label values chcsyr13  scp028x;   label values chcsyr14  scp028x;
label values chcsyr1   scp028x;   label values chcsyr2   scp028x;
label values chcsyr3   scp028x;   label values chcsyr4   scp028x;
label values chcsyr5   scp028x;   label values chcsyr6   scp028x;
label values chcsyr7   scp028x;   label values chcsyr81  scp028x;
label values chcsyr82  scp028x;   label values chcsyr10  scp028x;
label values chcsyrem  scp028x;   label values chpxyr_c  scp028x;
label values chernoy2  scp149x;   label values cervisnd  scp028x;
label values cerhos    scp028x;   label values cerrea1r  scp062x;
label values cerrea2r  scp062x;   label values cerrea3r  scp028x;
label values cerrea4r  scp155x;   label values cerrea5r  scp028x;
label values cerrea6r  scp062x;   label values cerrea7r  scp062x;
label values cerrea8r  scp062x;   label values chchyr    scp028x;
label values chchmoyr  scp161x;   label values chchnoy2  scp162x;
label values chcnoyr2  scp149x;   label values csrgyr    scp028x;
label values rsrgnoyr  scp165x;   label values cmdlongr  scp132x;

label values rscl2_c2  scp167x;   label values rscl2_e2  scp167x;
label values rscl3_e3  scp167x;   label values rscl5_p5  scp167x;
label values rscl5_h5  scp167x;   label values rscl6     scp172x;

label values diff6m    scp028x;   label values diffintf  scp028x;
label values diffdeg   scp175x;   label values difflng   scp176x;
label values prescp6m  scp028x;   label values preshelp  scp178x;
label values pmedped   scp028x;   label values pmedpsy   scp028x;
label values pmedneu   scp028x;   label values pmedothr  scp028x;
label values nsduh21   scp028x;   label values nsduh3    scp028x;
label values nsduh31   scp185x;   label values nsduh321  scp033x;
label values nsduh322  scp105x;   label values nsduh323  scp033x;
label values nsduh324  scp105x;   label values nsduh325  scp033x;
label values nsduh4    scp028x;   label values nsduh51r  scp033x;
label values nsduh52r  scp033x;   label values nsduh53r  scp033x;
label values nsduh54r  scp105x;   label values nsduh55r  scp105x;
label values trtwre1r  scp062x;   label values trtwh11r  scp105x;
label values trtwh12r  scp105x;   label values trtwh13r  scp033x;
label values trtwh14r  scp105x;   label values trtwh16r  scp105x;
label values trtmhp11  scp105x;   label values trtmhp12  scp033x;
label values trtmhp13  scp105x;   label values trtmhp14  scp033x;
label values trtwre2r  scp028x;   label values trtwh21r  scp105x;
label values trtwh22r  scp105x;   label values trtwh23r  scp105x;
label values trtwh24r  scp105x;   label values trtwh25r  scp105x;
label values trtwh26r  scp105x;   label values trtmhp21  scp105x;
label values trtmhp22  scp215x;   label values trtmhp23  scp105x;
label values trtmhp24  scp105x;   label values trtwre3r  scp028x;
label values trtwh31r  scp033x;   label values trtwh32r  scp105x;
label values trtwh33r  scp105x;   label values trtwh34r  scp105x;
label values trtwh35r  scp105x;   label values trtwh36r  scp105x;
label values trtmhp31  scp105x;   label values trtmhp32  scp105x;
label values trtmhp33  scp105x;   label values trtmhp34  scp105x;
label values trtwre4r  scp062x;   label values trtwh41r  scp105x;
label values trtwh42r  scp105x;   label values trtwh43r  scp033x;
label values trtwh44r  scp105x;   label values trtwh45r  scp105x;
label values trtwh46r  scp105x;   label values trtmhp41  scp105x;
label values trtmhp42  scp033x;   label values trtmhp43  scp105x;
label values trtmhp44  scp105x;   label values trtwre5r  scp062x;
label values trtwh51r  scp105x;   label values trtwh52r  scp105x;
label values trtwh53r  scp105x;   label values trtwh54r  scp244x;
label values trtwh55r  scp105x;   label values trtwh56r  scp105x;
label values trtmhp51  scp105x;   label values trtmhp52  scp033x;
label values trtmhp53  scp105x;   label values trtmhp54  scp105x;
label values trtwre6r  scp062x;   label values trtwh61r  scp105x;
label values trtwh62r  scp033x;   label values trtwh63r  scp105x;
label values trtwh64r  scp105x;   label values trtwh65r  scp105x;
label values trtwh66r  scp105x;   label values trtmhp61  scp105x;
label values trtmhp62  scp105x;   label values trtmhp63  scp033x;
label values trtmhp64  scp105x;   label values ovrnt6mr  scp062x;
label values overwh1r  scp105x;   label values overwh2r  scp105x;
label values overwh3r  scp105x;   label values overwh4r  scp033x;
label values overwh5r  scp267x;   label values overwh6r  scp105x;
label values overwh7r  scp105x;   label values sh1       scp028x;
label values sh2       scp028x;   label values casem6m   scp028x;
label values casemwho  scp273x;   label values trethelp  scp274x;
label values trpyphir  scp062x;   label values trpyschr  scp062x;
label values trpyslfr  scp062x;   label values trpymedr  scp028x;
label values trpychpr  scp062x;   label values trpymilr  scp062x;
label values trpyshpr  scp062x;   label values trpyihsr  scp028x;
label values trpyothr  scp062x;   label values trtfreer  scp062x;
label values trtneed1  scp062x;   label values ntrcostr  scp062x;
label values ntrlocr   scp062x;   label values ntrnexpr  scp062x;
label values ntrfearr  scp062x;   label values ntrloser  scp062x;
label values ntrsayr   scp062x;   label values ntrwaitr  scp028x;
label values ntrtranr  scp062x;   label values ntrincvr  scp062x;
label values ntrfarr   scp062x;   label values ntrchnor  scp062x;
label values ntrothr   scp062x;

label values cshflu12  scp028x;   label values cshflunm  scp299x;
label values cshflum1  scp300x;   label values cshfluy1  scp301x;
label values cshspfl1  scp302x;   label values cshflum2  scp300x;
label values cshfluy2  scp301x;   label values cshspfl2  scp302x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sc];
save "$OUT/samchild", replace;

#delimit cr
log close
