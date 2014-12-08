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
      caseryr1     91 -  91      hayf1        92 -  92
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
      cmdlongr    175 - 175      csun1hr     176 - 177
      csuntan     178 - 179      cnburn      180 - 180
      csnlamp     181 - 181      csnnum      182 - 184

      rscl2_c2    185 - 185      rscl2_e2    186 - 186
      rscl3_e3    187 - 187      rscl5_p5    188 - 188
      rscl5_h5    189 - 189      rscl6       190 - 190

      diff6m      191 - 191      diffintf    192 - 192
      diffdeg     193 - 193      prescp6m    194 - 194
      pmedped     195 - 195      pmedpsy     196 - 196
      pmedoth     197 - 197      nsduh2      198 - 198
      nsduh3      199 - 199      nsduh4      200 - 200
      nsduh51     201 - 201      nsduh52     202 - 202
      nsduh53     203 - 203      nsduh54     204 - 204
      nsduh55     205 - 205      tretwre1    206 - 206
      tretwh11    207 - 207      tretwh12    208 - 208
      tretwh13    209 - 209      tretwh14    210 - 210
      tretwh15    211 - 211      tretwh16    212 - 212
      tretwh17    213 - 213      tretwh18    214 - 214
      tretwre2    215 - 215      tretwh21    216 - 216
      tretwh22    217 - 217      tretwh23    218 - 218
      tretwh24    219 - 219      tretwh25    220 - 220
      tretwh26    221 - 221      tretwh27    222 - 222
      tretwh28    223 - 223      tretwre3    224 - 224
      tretwh31    225 - 225      tretwh32    226 - 226
      tretwh33    227 - 227      tretwh34    228 - 228
      tretwh35    229 - 229      tretwh36    230 - 230
      tretwh37    231 - 231      tretwh38    232 - 232
      tretwre4    233 - 233      tretwh41    234 - 234
      tretwh42    235 - 235      tretwh43    236 - 236
      tretwh44    237 - 237      tretwh45    238 - 238
      tretwh46    239 - 239      tretwh47    240 - 240
      tretwh48    241 - 241      tretwre5    242 - 242
      tretwh51    243 - 243      tretwh52    244 - 244
      tretwh53    245 - 245      tretwh54    246 - 246
      tretwh55    247 - 247      tretwh56    248 - 248
      tretwh57    249 - 249      tretwh58    250 - 250
      tretwre6    251 - 251      tretwh61    252 - 252
      tretwh62    253 - 253      tretwh63    254 - 254
      tretwh64    255 - 255      tretwh65    256 - 256
      tretwh66    257 - 257      tretwh67    258 - 258
      tretwh68    259 - 259      overnt6m    260 - 260
      overwh1     261 - 261      overwh2     262 - 262
      overwh3     263 - 263      overwh4     264 - 264
      overwh5     265 - 265      overwh6     266 - 266
      overwh7     267 - 267      sh1         268 - 268
      sh2         269 - 269      casem6m     270 - 270
      casemwho    271 - 272      trpayphi    273 - 273
      trpaysch    274 - 274      trpayslf    275 - 275
      trpaymed    276 - 276      trpaychp    277 - 277
      trpaymil    278 - 278      trpayshp    279 - 279
      trpayihs    280 - 280      trpayoth    281 - 281
      tretfree    282 - 282      tretneed    283 - 283
      ntrtcost    284 - 284      ntrtloc     285 - 285
      ntrtnexp    286 - 286      ntrtfear    287 - 287
      ntrtlose    288 - 288      ntrtsay     289 - 289
      ntrtwait    290 - 290      ntrttran    291 - 291
      ntrtincv    292 - 292      ntrtfar     293 - 293
      ntrtchno    294 - 294      ntrtoth     295 - 295

      ch1n1_1     296 - 296      ch1n1_2     297 - 297
      ch1n1_3m    298 - 299      ch1n1_4y    300 - 303
      ch1n1_5     304 - 304      ch1n1_6m    305 - 306
      ch1n1_7y    307 - 310      ch1n1_8     311 - 311
      cshfluyr    312 - 312      cshflu_m    313 - 314
      cshflu_y    315 - 318      cspfluyr    319 - 319
      cspflu_m    320 - 321      cspflu_y    322 - 325
      cshflu12    326 - 326      cshflunm    327 - 327
      cshflum1    328 - 329      cshfluy1    330 - 333
      cshspfl1    334 - 334      cshflum2    335 - 336
      cshfluy2    337 - 340      cshspfl2    341 - 341

      chpvhrd     342 - 342      cshthpv     343 - 343
      cshhpvds    344 - 345      hpvage      346 - 347
      chpvrec     348 - 348      chpvnot     349 - 350
      chpvcost    351 - 351      chpvloc     352 - 352

using "$DAT/2010/samchild.dat";
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
label variable csun1hr  "
CAU.347_00.010: Skin condition after 1 hr sun exposure without protection";
label variable csuntan  "
CAU.347_00.020: Skin condition after repeated sun exposure without protection";
label variable cnburn   "CAU.347_00.030: Had sunburn, past 12 months";
label variable csnlamp  "CAU.350_00.010: Used indoor tanning device";
label variable csnnum   "
CAU.350_00.020: # of times used tanning devices, past 12 months";

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
label variable prescp6m "
CMS.010_00.000: Medication prescribed for difficulties with emotions, concentrat
ion, behavior, or getting along with others, past 6 months";
label variable pmedped  "
CMS.012_01.000: Pediatrician or other family doctor first prescribed medication
";
label variable pmedpsy  "
CMS.012_02.000: Psychiatrist, psychologist or other mental health professional f
irst prescribed medication";
label variable pmedoth  "
CMS.012_03.000: Someone else first prescribed medication";
label variable nsduh2   "
CMS.014_00.000: Treatment or counseling from school personnel, past 6 months";
label variable nsduh3   "
CMS.015_00.000: Attend school for students with difficulties with emotions, conc
entration, behavior, past 6 months";
label variable nsduh4   "
CMS.016_00.000: Participate in school program for students with difficulties wit
h emotions, concentration, behavior, past 6 months";
label variable nsduh51  "
CMS.017_01.000: School teacher provided treatment or counseling in school progra
m";
label variable nsduh52  "
CMS.017_02.000: Special Ed teacher provided treatment or counseling in school pr
ogram";
label variable nsduh53  "
CMS.017_03.000: School counselor, psychologist, nurse or social worker provided 
treatment or counseling in school program";
label variable nsduh54  "
CMS.017_04.000: School speech, occupational or physical therapist provided treat
ment or counseling in school program";
label variable nsduh55  "
CMS.017_05.000: Other school official provided treatment or counseling in school
 program";
label variable tretwre1 "
CMS.020_01.000: Treatment or counseling provided at daycare, child care, or play
 group, past 6 months";
label variable tretwh11 "
CMS.020_02.010: School counselor, school nurse or school social worker provided 
treatment or counseling at daycare, child care, or play group";
label variable tretwh12 "
CMS.020_02.020: Speech, occupational or physical therapist provided treatment or
 counseling at daycare, child care, or play group";
label variable tretwh13 "
CMS.020_02.030: Psychiatrist, psychologist, social worker, psychiatric nurse pro
vided treatment or counseling at daycare, child care, or play group";
label variable tretwh14 "
CMS.020_02.040: Pediatrician or family doctor provided treatment or counseling a
t daycare, child care, or play group";
label variable tretwh15 "
CMS.020_02.050: Acupuncturist, massage therapist, chiropractor provided treatmen
t or counseling at daycare, child care, or play group";
label variable tretwh16 "
CMS.020_02.060: Religious or spiritual counselor provided treatment or counselin
g at daycare, child care, or play group";
label variable tretwh17 "
CMS.020_02.070: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling at daycare, child care, or play group";
label variable tretwh18 "
CMS.020_02.080: Other source provided treatment or counseling at daycare, child 
care, or play group";
label variable tretwre2 "
CMS.021_01.000: Treatment or counseling provided in an office, clinic or communi
ty center, past 6 months";
label variable tretwh21 "
CMS.021_02.010: School counselor, school nurse or school social worker provided 
treatment or counseling in an office, clinic or community center";
label variable tretwh22 "
CMS.021_02.020: Speech, occupational or physical therapist provided treatment or
 counseling in an office, clinic or community center";
label variable tretwh23 "
CMS.021_02.030: Psychiatrist, psychologist, social worker, psychiatric nurse pro
vided treatment or counseling in an office, clinic or community center";
label variable tretwh24 "
CMS.021_02.040: Pediatrician or family doctor provided treatment or counseling i
n an office, clinic or community center";
label variable tretwh25 "
CMS.021_02.050: Acupuncturist, massage therapist, chiropractor provided treatmen
t or counseling in an office, clinic or community center";
label variable tretwh26 "
CMS.021_02.060: Religious or spiritual counselor provided treatment or counselin
g in an office, clinic or community center";
label variable tretwh27 "
CMS.021_02.070: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling in an office, clinic or community center";
label variable tretwh28 "
CMS.021_02.080: Other source provided treatment or counseling in an office, clin
ic or community center";
label variable tretwre3 "
CMS.022_01.000: Treatment or counseling provided in home";
label variable tretwh31 "
CMS.022_02.010: School counselor, school nurse or school social worker provided 
treatment or counseling in home";
label variable tretwh32 "
CMS.022_02.020: Speech, occupational or physical therapist provided treatment or
 counseling in home";
label variable tretwh33 "
CMS.022_02.030: Psychiatrist, psychologist, social worker, psychiatric nurse pro
vided treatment or counseling in home";
label variable tretwh34 "
CMS.022_02.040: Pediatrician or family doctor provided treatment or counseling i
n home";
label variable tretwh35 "
CMS.022_02.050: Acupuncturist, massage therapist, chiropractor provided treatmen
t or counseling in home";
label variable tretwh36 "
CMS.022_02.060: Religious or spiritual counselor provided treatment or counselin
g in home";
label variable tretwh37 "
CMS.022_02.070: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling in home";
label variable tretwh38 "
CMS.022_02.080: Other source provided treatment or counseling in home";
label variable tretwre4 "
CMS.023_01.000: Treatment or counseling provided in hospital ER, crisis center, 
or shelter, past 6 months";
label variable tretwh41 "
CMS.023_02.010: School counselor, school nurse or school social worker provided 
treatment or counseling in hospital ER, crisis center, or emergency shelter";
label variable tretwh42 "
CMS.023_02.020: Speech, occupational or physical therapist provided treatment or
 counseling in hospital ER, crisis center, or emergency shelter";
label variable tretwh43 "
CMS.023_02.030: Psychiatrist, psychologist, social worker, psychiatric nurse pro
vided treatment or counseling in hospital ER, crisis center, or emergency shelte
r";
label variable tretwh44 "
CMS.023_02.040: Pediatrician or family doctor provided treatment or counseling i
n hospital ER, crisis center, or emergency shelter";
label variable tretwh45 "
CMS.023_02.050: Acupuncturist, massage therapist, chiropractor provided treatmen
t or counseling in hospital ER, crisis center, or emergency shelter";
label variable tretwh46 "
CMS.023_02.060: Religious or spiritual counselor provided treatment or counselin
g in hospital ER, crisis center, or emergency shelter";
label variable tretwh47 "
CMS.023_02.070: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling in hospital ER, crisis center, or emergency shelte
r";
label variable tretwh48 "
CMS.023_02.080: Other source provided treatment or counseling in hospital ER, cr
isis center, or emergency shelter";
label variable tretwre5 "
CMS.024_01.000: Treatment or counseling provided in hospital or community day pr
ogram, past 6 months";
label variable tretwh51 "
CMS.024_02.010: School counselor, school nurse or school social worker provided 
treatment or counseling in hospital or community day program";
label variable tretwh52 "
CMS.024_02.020: Speech, occupational or physical therapist provided treatment or
 counseling in hospital or community day program";
label variable tretwh53 "
CMS.024_02.030: Psychiatrist, psychologist, social worker, psychiatric nurse pro
vided treatment or counseling in hospital or community day program";
label variable tretwh54 "
CMS.024_02.040: Pediatrician or family doctor provided treatment or counseling i
n hospital or community day program";
label variable tretwh55 "
CMS.024_02.050: Acupuncturist, massage therapist, chiropractor provided treatmen
t or counseling in hospital or community day program";
label variable tretwh56 "
CMS.024_02.060: Religious or spiritual counselor provided treatment or counselin
g in hospital or community day program";
label variable tretwh57 "
CMS.024_02.070: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling in hospital or community day program";
label variable tretwh58 "
CMS.024_02.080: Other source provided treatment or counseling in hospital or com
munity day program";
label variable tretwre6 "
CMS.025_01.000: Treatment or counseling provided in any other place, past 6 mont
hs";
label variable tretwh61 "
CMS.025_02.010: School counselor, school nurse or school social worker provided 
treatment or counseling in any other place";
label variable tretwh62 "
CMS.025_02.020: Speech, occupational or physical therapist provided treatment or
 counseling in any other place";
label variable tretwh63 "
CMS.025_02.030: Psychiatrist, psychologist, social worker, psychiatric nurse pro
vided treatment or counseling in any other place";
label variable tretwh64 "
CMS.025_02.040: Pediatrician or family doctor provided treatment or counseling i
n any other place";
label variable tretwh65 "
CMS.025_02.050: Acupuncturist, massage therapist, chiropractor provided treatmen
t or counseling in any other place";
label variable tretwh66 "
CMS.025_02.060: Religious or spiritual counselor provided treatment or counselin
g in any other place";
label variable tretwh67 "
CMS.025_02.070: Probation or juvenile corrections officer or court counselor pro
vided treatment or counseling in any other place";
label variable tretwh68 "
CMS.025_02.080: Other source provided treatment or counseling in any other place
";
label variable overnt6m "
CMS.050_00.000: Overnight or longer stay in facility for difficulties with emoti
ons, concentration, or behavior, past 6 months";
label variable overwh1  "
CMS.060_01.000: Stayed overnight in a hospital for difficulties with emotions, c
oncentration, or behavior";
label variable overwh2  "
CMS.060_02.000: Stayed overnight in a residential treatment center for difficult
ies with emotions, concentration, or behavior";
label variable overwh3  "
CMS.060_03.000: Stayed overnight in a foster care or therapeutic foster care hom
e for difficulties with emotions, concentration, or behavior";
label variable overwh4  "
CMS.060_04.000: Stayed overnight in a juvenile detention center, prison or jail 
for difficulties with emotions, concentration, or behavior";
label variable overwh5  "
CMS.060_05.000: Stayed overnight in a group home for difficulties with emotions,
 concentration, or behavior";
label variable overwh6  "
CMS.060_06.000: Stayed overnight in a homeless shelter for difficulties with emo
tions, concentration, or behavior";
label variable overwh7  "
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
label variable trpayphi "
CMS.120_01.000: Private health insurance paid for treatment or counseling";
label variable trpaysch "
CMS.120_02.000: School system paid for treatment or counseling";
label variable trpayslf "CMS.120_03.000: Family paid for treatment or counseling
";
label variable trpaymed "
CMS.120_04.000: Medicaid paid for treatment or counseling";
label variable trpaychp "
CMS.120_05.000: State SCHIP/CHIP paid for treatment or counseling";
label variable trpaymil "
CMS.120_06.000: Military health care paid for treatment or counseling";
label variable trpayshp "
CMS.120_07.000: Medicare or other government plan paid for treatment or counseli
ng";
label variable trpayihs "
CMS.120_09.000: Indian Health Service paid for treatment or counseling";
label variable trpayoth "
CMS.120_10.000: Some other source paid for treatment or counseling";
label variable tretfree "
CMS.120_12.000: All treatment or counseling was received free";
label variable tretneed "
CMS.150_00.000: Needed treatment or counseling for difficulties with emotions, c
oncentration, or behavior, past 6 months, but did not get it";
label variable ntrtcost "
CMS.150_01.000: Didn't get treatment or counseling because it was too expensive
";
label variable ntrtloc  "
CMS.150_02.000: Didn't get treatment or counseling because didn't know where to 
go";
label variable ntrtnexp "
CMS.150_03.000: Didn't get treatment or counseling because had negative experien
ce previously";
label variable ntrtfear "
CMS.150_04.000: Didn't get treatment or counseling because afraid or dislike cou
nselors";
label variable ntrtlose "
CMS.150_05.000: Didn't get treatment or counseling because afraid child would be
 removed from home or lose custody";
label variable ntrtsay  "
CMS.150_06.000: Didn't get treatment or counseling because afraid of family/frie
nds opinion";
label variable ntrtwait "
CMS.150_07.000: Didn't get treatment or counseling because it was a long wait ti
me for appointment";
label variable ntrttran "
CMS.150_08.000: Didn't get treatment or counseling because had no way to get the
re";
label variable ntrtincv "
CMS.150_09.000: Didn't get treatment or counseling because services were too inc
onvenient to use";
label variable ntrtfar  "
CMS.150_10.000: Didn't get treatment or counseling because services were too far
 away";
label variable ntrtchno "
CMS.150_11.000: Didn't get treatment or counseling because child did not want to
 go.";
label variable ntrtoth  "
CMS.150_12.000: Didn't get treatment or counseling for some other reason";

label variable ch1n1_1  "
CFI.005_00.010: H1N1 flu vaccination, since October 2009";
label variable ch1n1_2  "
CFI.005_00.020: Number of H1N1 flu vaccinations, since October 2009";
label variable ch1n1_3m "CFI.005_00.030: Month of first H1N1 flu vaccination";
label variable ch1n1_4y "CFI.005_00.040: Year of first H1N1 flu vaccination";
label variable ch1n1_5  "
CFI.005_00.050: Administration method for first dose of H1N1 flu vaccine";
label variable ch1n1_6m "CFI.005_00.060: Month of second H1N1 flu vaccination";
label variable ch1n1_7y "CFI.005_00.070: Year of second H1N1 flu vaccination";
label variable ch1n1_8  "
CFI.005_00.080: Administration method for second dose of H1N1 flu vaccine";
label variable cshfluyr "CFI.010_00.000: Seasonal flu shot, past 12 m";
label variable cshflu_m "CFI.015_01.000: Month of most recent seasonal flu shot
";
label variable cshflu_y "CFI.015_02.000: Year of most recent seasonal flu shot";
label variable cspfluyr "CFI.020_00.000: Seasonal flu nasal spray, past 12 m";
label variable cspflu_m "
CFI.025_01.000: Month of most recent seasonal flu nasal spray";
label variable cspflu_y "
CFI.025_02.000: Year of most recent seasonal flu nasal spray";
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

label variable chpvhrd  "CHP.010_00.000: Ever heard vaccine for cervical cancer
";
label variable cshthpv  "CHP.020_00.000: Ever had HPV shot?";
label variable cshhpvds "CHP.030_00.000: Number of HPV shots received";
label variable hpvage   "CHP.035_00.000: Age at first HPV shot";
label variable chpvrec  "CHP.040_00.000: Get HPV shot if recommended";
label variable chpvnot  "
CHP.050_00.000: Main reason why SC would not receive HPV vaccine";
label variable chpvcost "CHP.060_00.000: Get HPV vaccine if cost was $360-$500.
";
label variable chpvloc  "
CHP.070_00.000: Would SC get HPV vaccine if it were free/at a lower cost";

* DEFINE VALUE LABELS FOR REPORTS;

label define scp001x
   10       "10 Household"
   20       "20 Person"
   25       "25 Income Imputation"
   30       "30 Sample Adult"
   31       "31 Sample Adult Cancer"
   38       "38 Quality of Life"
   40       "40 Sample Child"
   60       "60 Family"
   63       "63 Disability Questions Tests 2010"
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
   01       "01 Get a severe sunburn with blisters"
   02       "02 Have a moderate sunburn with peeling"
   03       "03 Burn mildly with some or no darkening/tanning"
   04       "04 Turn darker without sunburn"
   05       "05 Nothing would happen to skin"
   06       "06 Do not go out in the sun"
   07       "07 Other"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp124x
   01       "01 Very dark or deeply tanned"
   02       "02 Dark/moderately tanned"
   03       "03 A little dark/mildly tanned"
   04       "04 Freckled but still light skinned"
   05       "
05 Burned repeatedly with little or no darkening or tanning--still light skinned
"
   06       "06 Don't go out in the sun"
   07       "07 Other"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp127x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp128x
   0        "0 Not true"
   1        "1 Somewhat true"
   2        "2 Certainly true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp133x
   0        "0 No"
   1        "1 Yes, minor difficulties"
   2        "2 Yes, definite difficulties"
   3        "3 Yes, severe difficulties"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp136x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 None"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp144x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp214x
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
label define scp225x
   1        "1 Not true"
   2        "2 Somewhat true"
   3        "3 Certainly true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp239x
   1        "1 vaccination or dose"
   2        "2 2 or more vaccination doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp240x
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
label define scp242x
   1        "1 Flu shot"
   2        "2 Flu nasal spray (spray, mist or drop in nose)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp261x
   1        "1 Yes"
   2        "2 No"
   3        "3 Doctor refused when asked"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp262x
   96       "96 All shots"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp265x
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
label values caseryr1  scp027x;   label values hayf1     scp027x;
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
label values cmdlongr  scp098x;   label values csun1hr   scp123x;
label values csuntan   scp124x;   label values cnburn    scp027x;
label values csnlamp   scp027x;   label values csnnum    scp127x;

label values rscl2_c2  scp128x;   label values rscl2_e2  scp128x;
label values rscl3_e3  scp128x;   label values rscl5_p5  scp128x;
label values rscl5_h5  scp128x;   label values rscl6     scp133x;

label values diff6m    scp027x;   label values diffintf  scp027x;
label values diffdeg   scp136x;   label values prescp6m  scp027x;
label values pmedped   scp027x;   label values pmedpsy   scp027x;
label values pmedoth   scp027x;   label values nsduh2    scp027x;
label values nsduh3    scp027x;   label values nsduh4    scp027x;
label values nsduh51   scp144x;   label values nsduh52   scp144x;
label values nsduh53   scp144x;   label values nsduh54   scp144x;
label values nsduh55   scp144x;   label values tretwre1  scp027x;
label values tretwh11  scp144x;   label values tretwh12  scp144x;
label values tretwh13  scp144x;   label values tretwh14  scp144x;
label values tretwh15  scp144x;   label values tretwh16  scp144x;
label values tretwh17  scp144x;   label values tretwh18  scp144x;
label values tretwre2  scp027x;   label values tretwh21  scp144x;
label values tretwh22  scp144x;   label values tretwh23  scp144x;
label values tretwh24  scp144x;   label values tretwh25  scp144x;
label values tretwh26  scp144x;   label values tretwh27  scp144x;
label values tretwh28  scp144x;   label values tretwre3  scp027x;
label values tretwh31  scp144x;   label values tretwh32  scp144x;
label values tretwh33  scp144x;   label values tretwh34  scp144x;
label values tretwh35  scp144x;   label values tretwh36  scp144x;
label values tretwh37  scp144x;   label values tretwh38  scp144x;
label values tretwre4  scp027x;   label values tretwh41  scp144x;
label values tretwh42  scp144x;   label values tretwh43  scp144x;
label values tretwh44  scp144x;   label values tretwh45  scp144x;
label values tretwh46  scp144x;   label values tretwh47  scp144x;
label values tretwh48  scp144x;   label values tretwre5  scp027x;
label values tretwh51  scp144x;   label values tretwh52  scp144x;
label values tretwh53  scp144x;   label values tretwh54  scp144x;
label values tretwh55  scp144x;   label values tretwh56  scp144x;
label values tretwh57  scp144x;   label values tretwh58  scp144x;
label values tretwre6  scp027x;   label values tretwh61  scp144x;
label values tretwh62  scp144x;   label values tretwh63  scp144x;
label values tretwh64  scp144x;   label values tretwh65  scp144x;
label values tretwh66  scp144x;   label values tretwh67  scp144x;
label values tretwh68  scp144x;   label values overnt6m  scp027x;
label values overwh1   scp144x;   label values overwh2   scp144x;
label values overwh3   scp144x;   label values overwh4   scp144x;
label values overwh5   scp144x;   label values overwh6   scp144x;
label values overwh7   scp144x;   label values sh1       scp027x;
label values sh2       scp027x;   label values casem6m   scp027x;
label values casemwho  scp214x;   label values trpayphi  scp027x;
label values trpaysch  scp027x;   label values trpayslf  scp027x;
label values trpaymed  scp027x;   label values trpaychp  scp027x;
label values trpaymil  scp027x;   label values trpayshp  scp027x;
label values trpayihs  scp027x;   label values trpayoth  scp027x;
label values tretfree  scp027x;   label values tretneed  scp225x;
label values ntrtcost  scp027x;   label values ntrtloc   scp027x;
label values ntrtnexp  scp027x;   label values ntrtfear  scp027x;
label values ntrtlose  scp027x;   label values ntrtsay   scp027x;
label values ntrtwait  scp027x;   label values ntrttran  scp027x;
label values ntrtincv  scp027x;   label values ntrtfar   scp027x;
label values ntrtchno  scp027x;   label values ntrtoth   scp027x;

label values ch1n1_1   scp027x;   label values ch1n1_2   scp239x;
label values ch1n1_3m  scp240x;   label values ch1n1_4y  scp023x;
label values ch1n1_5   scp242x;   label values ch1n1_6m  scp240x;
label values ch1n1_7y  scp023x;   label values ch1n1_8   scp242x;
label values cshfluyr  scp027x;   label values cshflu_m  scp240x;
label values cshflu_y  scp023x;   label values cspfluyr  scp027x;
label values cspflu_m  scp240x;   label values cspflu_y  scp023x;
label values cshflu12  scp027x;   label values cshflunm  scp239x;
label values cshflum1  scp240x;   label values cshfluy1  scp023x;
label values cshspfl1  scp242x;   label values cshflum2  scp240x;
label values cshfluy2  scp023x;   label values cshspfl2  scp242x;

label values chpvhrd   scp027x;   label values cshthpv   scp261x;
label values cshhpvds  scp262x;   label values hpvage    scp117x;
label values chpvrec   scp027x;   label values chpvnot   scp265x;
label values chpvcost  scp027x;   label values chpvloc   scp027x;

save "$OUT/2010/samchild", replace;
#delimit cr
log close
