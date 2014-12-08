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
      chpyr        93 -  93      chypmed      94 -  94
      cchlyr       95 -  95      cflupnyr     96 -  96
      cconmed      97 -  97      csinyr       98 -  98
      cstrepyr     99 -  99      hayf1       100 - 100
      rallg1      101 - 101      dallg1      102 - 102
      sallg1      103 - 103      diarh1      104 - 104
      anemia1     105 - 105      earinf1     106 - 106
      seize1      107 - 107      hayf2       108 - 108
      rallg2      109 - 109      dallg2      110 - 110
      sallg2      111 - 111      diarh2      112 - 112
      anemia2     113 - 113      fhead       114 - 114
      earinf2     115 - 115      seize2      116 - 116
      stutter     117 - 117      cheadyr     118 - 118
      cabdomyr    119 - 119      cjntsymp    120 - 120
      cpaineck    121 - 121      cpainlb     122 - 122
      cmusclyr    123 - 123      cspnyr      124 - 124
      cdenyr      125 - 125      cpnothyr    126 - 126
      covrwtyr    127 - 127      cthothyr    128 - 128
      cfevryr     129 - 129      ccoldyr     130 - 130
      cnausyr     131 - 131      cfatigyr    132 - 132
      cfatyr      133 - 133      cinsyr      134 - 134
      chstatyr    135 - 135      schdayr1    136 - 138
      ccold2w     139 - 139      cintil2w    140 - 140
      chearst1    141 - 141      cvision     142 - 142
      cblind      143 - 143      ihspeq      144 - 144
      ihmob       145 - 145      ihmobyr     146 - 146
      probrx      147 - 147      learnd      148 - 148
      cmhagm15    149 - 149      mhiboy2     150 - 151
      cmhagf15    152 - 152      mhigrl2     153 - 154
      cdeprsyr    155 - 155      canxnwyr    156 - 156
      cstresyr    157 - 157      menstyr     158 - 158
      cgynyr      159 - 159

      cusualpl    160 - 160      cplkind     161 - 161
      chcplrou    162 - 162      chcplknd    163 - 163
      chcchgyr    164 - 164      chcchghi    165 - 165
      cnouspl1    166 - 166      cnouspl2    167 - 167
      cnouspl3    168 - 168      cnouspl4    169 - 169
      cnouspl5    170 - 170      cnouspl6    171 - 171
      cnouspl7    172 - 172      cnouspl8    173 - 173
      cnouspl9    174 - 174      cprvtryr    175 - 175
      cprvtrfd    176 - 176      cdrnanp     177 - 177
      cdrnai      178 - 178      chcdlyr1    179 - 179
      chcdlyr2    180 - 180      chcdlyr3    181 - 181
      chcdlyr4    182 - 182      chcdlyr5    183 - 183
      chcafyr     184 - 184      chcafyrn    185 - 185
      chcafyrf    186 - 186      chcafyr1    187 - 187
      chcafyr2    188 - 188      chcafyr3    189 - 189
      chcafyr4    190 - 190      chcafyr5    191 - 191
      chcafyr6    192 - 192      cdnlongr    193 - 193
      chcsyr11    194 - 194      chcsyr12    195 - 195
      chcsyr13    196 - 196      chcsyr14    197 - 197
      chcsyr1     198 - 198      chcsyr2     199 - 199
      chcsyr3     200 - 200      chcsyr4     201 - 201
      chcsyr5     202 - 202      chcsyr6     203 - 203
      chcsyr7     204 - 204      chcsyr81    205 - 205
      chcsyr82    206 - 206      chcsyr10    207 - 207
      chcsyrem    208 - 208      chpxyr_c    209 - 209
      chernoy2    210 - 211      cervisnd    212 - 212
      cerhos      213 - 213      cerreas1    214 - 214
      cerrea1r    215 - 215      cerreas2    216 - 216
      cerrea2r    217 - 217      cerreas3    218 - 218
      cerrea3r    219 - 219      cerreas4    220 - 220
      cerrea4r    221 - 221      cerreas5    222 - 222
      cerrea5r    223 - 223      cerreas6    224 - 224
      cerrea6r    225 - 225      cerreas7    226 - 226
      cerrea7r    227 - 227      cerreas8    228 - 228
      cerrea8r    229 - 229      chchyr      230 - 230
      chchmoyr    231 - 232      chchnoy2    233 - 234
      chcnoyr2    235 - 236      csrgyr      237 - 237
      rsrgnoyr    238 - 239      cmdlongr    240 - 240

      cvslwrd     241 - 242      cvslvyr     243 - 243
      cvslswyr    244 - 244      cvslspyr    245 - 245
      cvsllgyr    246 - 246      cvslever    247 - 247
      cvsldg      248 - 248      cvsldgt1    249 - 249
      cvsldgt2    250 - 250      cvsldgt3    251 - 251
      cvsldgt4    252 - 252      cvslvd01    253 - 253
      cvslvd02    254 - 254      cvslvd03    255 - 255
      cvslvd04    256 - 256      cvslvd05    257 - 257
      cvslvd06    258 - 258      cvslvd07    259 - 259
      cvslvd08    260 - 260      cvslvd09    261 - 261
      cvslvd10    262 - 262      cvslvd11    263 - 263
      cvslsw01    264 - 264      cvslsw02    265 - 265
      cvslsw03    266 - 266      cvslsw04    267 - 267
      cvslsw05    268 - 268      cvslsw06    269 - 269
      cvslsw07    270 - 270      cvslsw08    271 - 271
      cvslsw09    272 - 272      cvslsp01    273 - 273
      cvslsp02    274 - 274      cvslsp03    275 - 275
      cvslsp04    276 - 276      cvslsp05    277 - 277
      cvslsp06    278 - 278      cvslsp07    279 - 279
      cvslsp08    280 - 280      cvslsp09    281 - 281
      cvslsp10    282 - 282      cvsllg01    283 - 283
      cvsllg02    284 - 284      cvsllg03    285 - 285
      cvsllg04    286 - 286      cvsllg05    287 - 287
      cvsllg06    288 - 288      cvsllg07    289 - 289
      cvsllg08    290 - 290      cvsllg09    291 - 291
      cvslvag     292 - 293      cvslswag    294 - 295
      cvslspag    296 - 297      cvsllgag    298 - 299
      cvslvpb     300 - 300      cvslswpb    301 - 301
      cvslsppb    302 - 302      cvsllgpb    303 - 303
      cvslvsp     304 - 304      cvslvpe     305 - 305
      cvslswsp    306 - 306      cvslswpe    307 - 307
      cvslspsp    308 - 308      cvslsppe    309 - 309
      cvsllgsp    310 - 310      cvsllgpe    311 - 311
      cvsvp01     312 - 312      cvsvp02     313 - 313
      cvsvp03     314 - 314      cvsvp04     315 - 315
      cvsvp05     316 - 316      cvsvp06     317 - 317
      cvsvp07     318 - 318      cvsvp08     319 - 319
      cvsvp09     320 - 320      cvsvp10     321 - 321
      cvsswp01    322 - 322      cvsswp02    323 - 323
      cvsswp03    324 - 324      cvsswp04    325 - 325
      cvsswp05    326 - 326      cvsswp06    327 - 327
      cvsswp07    328 - 328      cvsswp08    329 - 329
      cvsswp09    330 - 330      cvsswp10    331 - 331
      cvsspp01    332 - 332      cvsspp02    333 - 333
      cvsspp03    334 - 334      cvsspp04    335 - 335
      cvsspp05    336 - 336      cvsspp06    337 - 337
      cvsspp07    338 - 338      cvsspp08    339 - 339
      cvsspp09    340 - 340      cvsspp10    341 - 341
      cvslgp01    342 - 342      cvslgp02    343 - 343
      cvslgp03    344 - 344      cvslgp04    345 - 345
      cvslgp05    346 - 346      cvslgp06    347 - 347
      cvslgp07    348 - 348      cvslgp08    349 - 349
      cvslgp09    350 - 350      cvslgp10    351 - 351

      cbalwlk     352 - 353      cballimb    354 - 354
      cbalvrtg    355 - 355      cbalsted    356 - 356
      cbalmotr    357 - 357      cbalfall    358 - 358
      cbalpass    359 - 359      cbaloth     360 - 360
      cbaldghp    361 - 361      cbaldg01    362 - 362
      cbaldg02    363 - 363      cbaldg03    364 - 364
      cbaldg04    365 - 365      cbaldg05    366 - 366
      cbaldg06    367 - 367      cbaldg07    368 - 368
      cbaldg08    369 - 369      cbaldg09    370 - 370
      cbaldg10    371 - 371      cbaldg11    372 - 372
      cbaldg12    373 - 373      cbalpart    374 - 374
      cbalprob    375 - 375      cbalhpyr    376 - 376
      cbaltret    377 - 377

      rscl2_c2    378 - 378      rscl2_e2    379 - 379
      rscl3_e3    380 - 380      rscl5_p5    381 - 381
      rscl5_h5    382 - 382      rscl6       383 - 383

      diff6m      384 - 384      diffintf    385 - 385
      diffdeg     386 - 386      difflng     387 - 387
      prescp6m    388 - 388      preshelp    389 - 389
      pmedped     390 - 390      pmedpsy     391 - 391
      pmedneu     392 - 392      pmedothr    393 - 393
      nsduh21     394 - 394      nsduh3      395 - 395
      nsduh31     396 - 396      nsduh321    397 - 397
      nsduh322    398 - 398      nsduh323    399 - 399
      nsduh324    400 - 400      nsduh325    401 - 401
      nsduh4      402 - 402      nsduh51r    403 - 403
      nsduh52r    404 - 404      nsduh53r    405 - 405
      nsduh54r    406 - 406      nsduh55r    407 - 411
      trtwre1r    412 - 412      trtwh11r    413 - 413
      trtwh12r    414 - 414      trtwh13r    415 - 415
      trtwh14r    416 - 416      trtwh16r    417 - 417
      trtmhp11    418 - 418      trtmhp12    419 - 419
      trtmhp13    420 - 420      trtmhp14    421 - 421
      trtwre2r    422 - 422      trtwh21r    423 - 423
      trtwh22r    424 - 424      trtwh23r    425 - 425
      trtwh24r    426 - 426      trtwh25r    427 - 427
      trtwh26r    428 - 428      trtmhp21    429 - 429
      trtmhp22    430 - 430      trtmhp23    431 - 431
      trtmhp24    432 - 432      trtwre3r    433 - 433
      trtwh31r    434 - 434      trtwh32r    435 - 435
      trtwh33r    436 - 436      trtwh34r    437 - 437
      trtwh35r    438 - 438      trtwh36r    439 - 439
      trtmhp31    440 - 440      trtmhp32    441 - 441
      trtmhp33    442 - 442      trtmhp34    443 - 443
      trtwre4r    444 - 444      trtwh41r    445 - 445
      trtwh42r    446 - 446      trtwh43r    447 - 447
      trtwh44r    448 - 448      trtwh45r    449 - 449
      trtwh46r    450 - 450      trtmhp41    451 - 451
      trtmhp42    452 - 452      trtmhp43    453 - 453
      trtmhp44    454 - 454      trtwre5r    455 - 455
      trtwh51r    456 - 456      trtwh52r    457 - 457
      trtwh53r    458 - 458      trtwh54r    459 - 459
      trtwh55r    460 - 460      trtwh56r    461 - 461
      trtmhp51    462 - 462      trtmhp52    463 - 463
      trtmhp53    464 - 464      trtmhp54    465 - 465
      trtwre6r    466 - 466      trtwh61r    467 - 467
      trtwh62r    468 - 468      trtwh63r    469 - 469
      trtwh64r    470 - 470      trtwh65r    471 - 471
      trtwh66r    472 - 472      trtmhp61    473 - 473
      trtmhp62    474 - 474      trtmhp63    475 - 475
      trtmhp64    476 - 476      ovrnt6mr    477 - 477
      overwh1r    478 - 478      overwh2r    479 - 479
      overwh3r    480 - 480      overwh4r    481 - 481
      overwh5r    482 - 482      overwh6r    483 - 483
      overwh7r    484 - 484      sh1         485 - 485
      sh2         486 - 486      casem6m     487 - 487
      casemwho    488 - 489      trethelp    490 - 490
      trpyphir    491 - 491      trpyschr    492 - 492
      trpyslfr    493 - 493      trpymedr    494 - 494
      trpychpr    495 - 495      trpymilr    496 - 496
      trpyshpr    497 - 497      trpyihsr    498 - 498
      trpyothr    499 - 499      trtfreer    500 - 500
      trtneed1    501 - 501      ntrcostr    502 - 502
      ntrlocr     503 - 503      ntrnexpr    504 - 504
      ntrfearr    505 - 505      ntrloser    506 - 506
      ntrsayr     507 - 507      ntrwaitr    508 - 508
      ntrtranr    509 - 509      ntrincvr    510 - 510
      ntrfarr     511 - 511      ntrchnor    512 - 512
      ntrothr     513 - 513

      cshflu12    514 - 514      cshflunm    515 - 515
      cshflum1    516 - 517      cshfluy1    518 - 521
      cshspfl1    522 - 522      cshflum2    523 - 524
      cshfluy2    525 - 528      cshspfl2    529 - 529

using "$DAT/2012/samchild.dat";
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
label variable chpyr    "
CHS.105_00.010: Ever told SC had hypertension, past 12 m";
label variable chypmed  "
CHS.105_00.020: Took prescription medication for hypertension";
label variable cchlyr   "CHS.105_00.030: Told SC had high cholesterol, past 12 m
";
label variable cflupnyr "
CHS.106_00.010: Told SC had influenza or pneumonia, past 12 m";
label variable cconmed  "
CHS.106_00.020: Told SC had constipation requiring medication, past 12 m";
label variable csinyr   "CHS.106_00.030: Told SC had sinusitis, past 12 m";
label variable cstrepyr "
CHS.106_00.040: Told SC had strep throat or tonsillitis, past 12 m";
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
label variable cheadyr  "
CHS.120_00.010: Had recurring headache other than migraine, past 12 m";
label variable cabdomyr "CHS.120_00.020: Had abdominal pain, past 12 m";
label variable cjntsymp "
CHS.120_00.030: Had pain, aching, or stiffness, in/around joint, past 30 days";
label variable cpaineck "CHS.120_00.040: Had neck pain, past 12 m";
label variable cpainlb  "CHS.120_00.050: Had lower back pain, past 12 m";
label variable cmusclyr "
CHS.120_00.060: Had other muscle or bone pain, past 12 m";
label variable cspnyr   "
CHS.120_00.070: Had severe sprains or strains, past 12 m";
label variable cdenyr   "CHS.120_00.080: Had dental pain, past 12 m";
label variable cpnothyr "CHS.120_00.090: Had other chronic pain, past 12 m";
label variable covrwtyr "
CHS.120_00.100: Had problems with being overweight, past 12 m";
label variable cthothyr "
CHS.125_00.010: Had sore throat other than strep or tonsillitis, past 12 m";
label variable cfevryr  "CHS.125_00.020: Had fever more than one day, past 12 m
";
label variable ccoldyr  "CHS.125_00.030: Had head or chest cold, past 12 m";
label variable cnausyr  "CHS.125_00.040: Had nausea and/or vomiting, past 12 m";
label variable cfatigyr "
CHS.125_00.050: Had fatigue or lack of energy more than three days, past 12 m";
label variable cfatyr   "
CHS.125_00.060: Regularly had excessive sleepiness during the day, past 12 m";
label variable cinsyr   "
CHS.125_00.070: Regularly had insomnia or trouble sleeping, past 12 m";
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
label variable cdeprsyr "CHS.370_00.010: Told SC had depression, past 12 m";
label variable canxnwyr "
CHS.370_00.020: Frequently felt anxious, nervous, or worried, past 12 m";
label variable cstresyr "CHS.370_00.030: Frequently felt stressed, past 12 m";
label variable menstyr  "
CHS.375_00.010: Had menstrual problems or premenstrual syndrome (PMS), past 12 m
";
label variable cgynyr   "CHS.375_00.020: Had gynecologic problems, past 12 m";

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
label variable cerrea1r "CAU.283_01.010: Didn't have another place to go";
label variable cerreas2 "CAU.283_02.020: Doctor's office or clinic was not open
";
label variable cerrea2r "CAU.283_02.020: Doctor's office or clinic was not open
";
label variable cerreas3 "CAU.283_03.030: Health provider advised ER visit";
label variable cerrea3r "CAU.283_03.030: Health provider advised ER visit";
label variable cerreas4 "
CAU.283_04.040: Problem too serious for doctor's office or clinic";
label variable cerrea4r "
CAU.283_04.040: Problem too serious for doctor's office or clinic";
label variable cerreas5 "CAU.283_05.050: Only a hospital could help";
label variable cerrea5r "CAU.283_05.050: Only a hospital could help";
label variable cerreas6 "CAU.283_06.060: ER is closest provider";
label variable cerrea6r "CAU.283_06.060: ER is closest provider";
label variable cerreas7 "
CAU.283_07.070: ER provides most of child's medical care";
label variable cerrea7r "
CAU.283_07.070: ER provides most of child's medical care";
label variable cerreas8 "
CAU.283_08.080: Arrived by ambulance or other emergency vehicle";
label variable cerrea8r "
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

label variable cvslwrd  "CCD.010_00.000: Age first words spoken";
label variable cvslvyr  "
CCD.015_00.000: Voice problem lasting 1+ weeks, past 12 months";
label variable cvslswyr "
CCD.020_00.000: Swallowing problem lasting 1+ weeks, past 12 months";
label variable cvslspyr "
CCD.025_00.000: Speech problem lasting 1+ weeks, past 12 months";
label variable cvsllgyr "
CCD.030_00.000: Language learning problem lasting 1+ weeks, past 12 months";
label variable cvslever "
CCD.035_00.000: Ever had voice, swallowing, speech, or language problem lasting 
1+ weeks";
label variable cvsldg   "
CCD.040_00.000: Ever given diagnosis for voice, swallowing, speech, or language 
problem";
label variable cvsldgt1 "CCD.045_01.000: Given diagnosis for voice problem";
label variable cvsldgt2 "CCD.045_02.000: Given diagnosis for swallowing problem
";
label variable cvsldgt3 "CCD.045_03.000: Given diagnosis for speech problem";
label variable cvsldgt4 "CCD.045_04.000: Given diagnosis for language problem";
label variable cvslvd01 "CCD.050_01.000: Laryngitis causes voice problem";
label variable cvslvd02 "CCD.050_02.000: Head/neck injury causes voice problem";
label variable cvslvd03 "
CCD.050_03.000: Allergies or airborne irritants cause voice problems";
label variable cvslvd04 "
CCD.050_04.000: Tissue damage in throat causes voice problems";
label variable cvslvd05 "CCD.050_05.000: Laryngeal growths cause voice problems
";
label variable cvslvd06 "
CCD.050_06.000: Cancer in head, neck or throat causes voice problems";
label variable cvslvd07 "
CCD.050_07.000: Neurological problem causes voice problems";
label variable cvslvd08 "
CCD.050_08.000: Congenital malformation/birth defect causes voice problems";
label variable cvslvd09 "
CCD.050_09.000: Gastroesophageal reflux causes voice problems";
label variable cvslvd10 "
CCD.050_10.000: Prescription medication causes voice problems";
label variable cvslvd11 "CCD.050_11.000: Something else causes voice problems";
label variable cvslsw01 "
CCD.055_01.000: Neurological problem causes swallowing problem";
label variable cvslsw02 "
CCD.055_02.000: Head/neck injury causes swallowing problem";
label variable cvslsw03 "
CCD.055_03.000: Tissue damage in throat causes swallowing problems";
label variable cvslsw04 "
CCD.055_04.000: Congenital malformation/birth defect causes swallowing problems
";
label variable cvslsw05 "
CCD.055_05.000: Genetic syndrome causes swallowing problems";
label variable cvslsw06 "
CCD.055_06.000: Cancer in head, neck or throat causes swallowing problems";
label variable cvslsw07 "CCD.055_07.000: Asthma causes swallowing problems";
label variable cvslsw08 "
CCD.055_08.000: Prescription medication causes swallowing problems";
label variable cvslsw09 "
CCD.055_09.000: Something else causes swallowing problems";
label variable cvslsp01 "
CCD.060_01.000: Hearing loss or deafness causes speech problem";
label variable cvslsp02 "
CCD.060_02.000: Developmental speech sound disorder causes speech problem";
label variable cvslsp03 "CCD.060_03.000: Stuttering causes speech problems";
label variable cvslsp04 "
CCD.060_04.000: Congenital malformation/birth defect causes speech problems";
label variable cvslsp05 "CCD.060_05.000: Genetic syndrome causes speech problems
";
label variable cvslsp06 "
CCD.060_06.000: Neurological disease causes speech problems";
label variable cvslsp07 "CCD.060_07.000: Head/neck injury causes speech problems
";
label variable cvslsp08 "
CCD.060_08.000: Cancer in head, neck or throat causes speech problems";
label variable cvslsp09 "
CCD.060_09.000: Prescription medication causes speech problems";
label variable cvslsp10 "CCD.060_10.000: Something else causes speech problems";
label variable cvsllg01 "
CCD.065_01.000: Hearing loss or deafness causes language problem";
label variable cvsllg02 "
CCD.065_02.000: Genetic syndrome causes language problems";
label variable cvsllg03 "
CCD.065_03.000: Intellectual disability causes language problems";
label variable cvsllg04 "
CCD.065_04.000: Autism spectrum disorder causes language problems";
label variable cvsllg05 "
CCD.065_05.000: Developmental language-learning disorder causes language problem
s";
label variable cvsllg06 "
CCD.065_06.000: Head injury, traumatic brain injury causes language problems";
label variable cvsllg07 "
CCD.065_07.000: Other neurological problem causes language problems";
label variable cvsllg08 "
CCD.065_08.000: Prescription medication causes language problems";
label variable cvsllg09 "CCD.065_09.000: Something else causes language problems
";
label variable cvslvag  "CCD.070_00.000: Age first had any voice problems";
label variable cvslswag "CCD.075_00.000: Age first had swallowing problems";
label variable cvslspag "CCD.080_00.000: Age first had speech problems";
label variable cvsllgag "CCD.085_00.000: Age first had language problems";
label variable cvslvpb  "
CCD.090_00.000: How much of a voice problem, past 12 months";
label variable cvslswpb "
CCD.095_00.000: How much of a swallowing problem, past 12 months";
label variable cvslsppb "
CCD.100_00.000: How much of a speech problem, past 12 months";
label variable cvsllgpb "
CCD.110_00.000: How much of a language problem, past 12 months";
label variable cvslvsp  "CCD.115_00.000: Received voice services, past 12 months
";
label variable cvslvpe  "CCD.120_00.000: Received voice services, ever";
label variable cvslswsp "
CCD.125_00.000: Received swallowing services, past 12 months";
label variable cvslswpe "CCD.130_00.000: Received swallowing services, ever";
label variable cvslspsp "
CCD.135_00.000: Received speech services, past 12 months";
label variable cvslsppe "CCD.140_00.000: Received speech services, ever";
label variable cvsllgsp "
CCD.145_00.000: Received language services, past 12 months";
label variable cvsllgpe "CCD.150_00.000: Received language services, ever";
label variable cvsvp01  "
CCD.155_01.000: Speech-language pathologist provided voice services";
label variable cvsvp02  "
CCD.155_02.000: Early intervention specialist provided voice services";
label variable cvsvp03  "
CCD.155_03.000: Occupational/physical therapist provided voice services";
label variable cvsvp04  "
CCD.155_04.000: Ear, nose, throat doctor provided voice services";
label variable cvsvp05  "
CCD.155_05.000: Audiologist or hearing aid specialist provided voice services";
label variable cvsvp06  "
CCD.155_06.000: Pediatrician or family practice doctor provided voice services";
label variable cvsvp07  "
CCD.155_07.000: Neurologist or other specialist provided voice services";
label variable cvsvp08  "
CCD.155_08.000: Nutritionist or dietician provided voice services";
label variable cvsvp09  "
CCD.155_09.000: Psychiatrist or psychologist provided voice services";
label variable cvsvp10  "CCD.155_10.000: Someone else provided voice services";
label variable cvsswp01 "
CCD.160_01.000: Speech-language pathologist provided swallowing services";
label variable cvsswp02 "
CCD.160_02.000: Early intervention specialist provided swallowing services";
label variable cvsswp03 "
CCD.160_03.000: Occupational/physical therapist provided swallowing services";
label variable cvsswp04 "
CCD.160_04.000: Ear, nose, throat doctor provided swallowing services";
label variable cvsswp05 "
CCD.160_05.000: Audiologist or hearing aid specialist provided swallowing servic
es";
label variable cvsswp06 "
CCD.160_06.000: Pediatrician or family practice doctor provided swallowing servi
ces";
label variable cvsswp07 "
CCD.160_07.000: Neurologist or other specialist provided swallowing services";
label variable cvsswp08 "
CCD.160_08.000: Nutritionist or dietician provided swallowing services";
label variable cvsswp09 "
CCD.160_09.000: Psychiatrist or psychologist provided swallowing services";
label variable cvsswp10 "
CCD.160_10.000: Someone else provided swallowing services";
label variable cvsspp01 "
CCD.165_01.000: Speech-language pathologist provided speech services";
label variable cvsspp02 "
CCD.165_02.000: Early intervention specialist provided speech services";
label variable cvsspp03 "
CCD.165_03.000: Occupational/physical therapist provided speech services";
label variable cvsspp04 "
CCD.165_04.000: Ear, nose, throat doctor provided speech services";
label variable cvsspp05 "
CCD.165_05.000: Audiologist or hearing aid specialist provided speech services";
label variable cvsspp06 "
CCD.165_06.000: Pediatrician or family practice doctor provided speech services
";
label variable cvsspp07 "
CCD.165_07.000: Neurologist or other specialist provided speech services";
label variable cvsspp08 "
CCD.165_08.000: Nutritionist or dietician provided speech services";
label variable cvsspp09 "
CCD.165_09.000: Psychiatrist or psychologist provided speech services";
label variable cvsspp10 "CCD.165_10.000: Someone else provided speech services";
label variable cvslgp01 "
CCD.170_01.000: Speech-language pathologist provided language services";
label variable cvslgp02 "
CCD.170_02.000: Early intervention specialist provided language services";
label variable cvslgp03 "
CCD.170_03.000: Occupational/physical therapist provided language services";
label variable cvslgp04 "
CCD.170_04.000: Ear, nose, throat doctor provided language services";
label variable cvslgp05 "
CCD.170_05.000: Audiologist or hearing aid specialist provided language services
";
label variable cvslgp06 "
CCD.170_06.000: Pediatrician or family practice doctor provided language service
s";
label variable cvslgp07 "
CCD.170_07.000: Neurologist or other specialist provided language services";
label variable cvslgp08 "
CCD.170_08.000: Nutritionist or dietician provided language services";
label variable cvslgp09 "
CCD.170_09.000: Psychiatrist or psychologist provided language services";
label variable cvslgp10 "CCD.170_10.000: Someone else provided language services
";

label variable cbalwlk  "CBL.010_00.000: Age at first steps without support";
label variable cballimb "
CBL.015_00.000: Had problems standing, walking, using arms or legs";
label variable cbalvrtg "
CBL.020_00.000: Bothered by episodes of vertigo, past 12 months";
label variable cbalsted "
CBL.025_00.000: Bothered by episodes of poor balance, past 12 months";
label variable cbalmotr "
CBL.027_00.000: Bothered by episodes of poor coordination, past 12 months";
label variable cbalfall "
CBL.030_00.000: Bothered by episodes of frequent falls, past 12 months";
label variable cbalpass "
CBL.035_00.000: Bothered by episodes of light-headedness, fainting, feeling abou
t to pass out, past 12 months";
label variable cbaloth  "
CBL.040_00.000: Bothered by episodes of other balance or dizziness problem, past
 12 months";
label variable cbaldghp "
CBL.045_00.000: Ever given diagnosis for dizziness or balance problem";
label variable cbaldg01 "
CBL.050_01.000: Ear infection causes balance or dizziness problem";
label variable cbaldg02 "
CBL.050_02.000: Vision problems/blurred vision causes balance or dizziness probl
em";
label variable cbaldg03 "
CBL.050_03.000: Positional dizziness or vertigo (BPPV) causes balance or dizzine
ss problem";
label variable cbaldg04 "
CBL.050_04.000: Severe headaches or migraine cause balance or dizziness problem
";
label variable cbaldg05 "
CBL.050_05.000: Head or neck injury or concussion causes balance or dizziness pr
oblem";
label variable cbaldg06 "
CBL.050_06.000: Neurologic disorders cause balance or dizziness problem";
label variable cbaldg07 "
CBL.050_07.000: Developmental motor coordination disorder causes balance or dizz
iness problem";
label variable cbaldg08 "
CBL.050_08.000: Ear malformation causes balance or dizziness problem";
label variable cbaldg09 "
CBL.050_09.000: Other genetic problem causes balance or dizziness problem";
label variable cbaldg10 "
CBL.050_10.000: Metabolic problem causes balance or dizziness problem";
label variable cbaldg11 "
CBL.050_11.000: Prescription medication causes balance or dizziness problem";
label variable cbaldg12 "
CBL.050_12.000: Something else causes balance or dizziness problem";
label variable cbalpart "
CBL.055_00.000: Dizziness or balance problem interferes with home, school, recre
ational activities";
label variable cbalprob "
CBL.060_00.000: How problematic was dizziness or balance problem, past 12 months
";
label variable cbalhpyr "
CBL.065_00.000: Saw health care professional for dizziness or balance problem, p
ast 12 months";
label variable cbaltret "
CBL.070_00.000: Used treatment methods recommended by health care professional f
or dizziness or balance problem, past 12 months";

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
   34       "34 Adult Alternative Medicine"
   38       "38 Functioning and Disability"
   39       "39 Adult Disability Questions Test"
   40       "40 Sample Child"
   44       "44 Child Alternative Medicine"
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
label define scp091x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp092x
   000      "000 None"
   996      "996 Did not go to school"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp095x
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
label define scp103x
   0        "0 Not true"
   1        "1 Sometimes true"
   2        "2 Often true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp104x
   99       "99 Unknown"
;
label define scp112x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp113x
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
label define scp115x
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
label define scp118x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp128x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp145x
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
label define scp162x
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
label define scp171x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t' know"
;
label define scp182x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp183x
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
label define scp186x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp188x
   01       "01 6 to 8 months"
   02       "02 9 to 11 months"
   03       "03 12 to 14 months"
   04       "04 15 to 17 months"
   05       "05 18 to 23 months"
   06       "06 24 months (2 years) or later"
   07       "07 Cannot talk"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp242x
   1        "1 No problem"
   2        "2 A small problem"
   3        "3 A moderate problem"
   4        "4 A big problem"
   5        "5 A very big problem"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp294x
   01       "01 6 to 8 months"
   02       "02 9 to 11 months"
   03       "03 12 to 14 months"
   04       "04 15 to 17 months"
   05       "05 18 to 23 months"
   06       "06 24 months (2 years) or later"
   07       "07 Cannot walk"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp319x
   0        "0 Not true"
   1        "1 Somewhat true"
   2        "2 Certainly true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp324x
   0        "0 No"
   1        "1 Yes, minor difficulties"
   2        "2 Yes, definite difficulties"
   3        "3 Yes, severe difficulties"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp327x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp328x
   1        "1 Less than a month"
   2        "2 1-5 months"
   3        "3 6 to 12 months"
   4        "4 Over a year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp330x
   1        "1 Not at all"
   2        "2 A little"
   3        "3 Some"
   4        "4 A lot"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp337x
   1        "1 Day School"
   2        "2 Overnight School"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp367x
   1        "1 Mentioned"
   2        "2 Not ascertained"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp396x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t' know"
;
label define scp419x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not mentioned"
   9        "9 Don’t know"
;
label define scp425x
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
label define scp426x
   1        "1 Not at all"
   2        "2 A little"
   3        "3 Some"
   4        "4 A lot"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define scp451x
   1        "1 1 vaccination or dose"
   2        "2 2 or more vaccination doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp452x
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
label define scp453x
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define scp454x
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
label values chpyr     scp028x;   label values chypmed   scp028x;
label values cchlyr    scp028x;   label values cflupnyr  scp028x;
label values cconmed   scp028x;   label values csinyr    scp028x;
label values cstrepyr  scp028x;   label values hayf1     scp028x;
label values rallg1    scp028x;   label values dallg1    scp028x;
label values sallg1    scp028x;   label values diarh1    scp028x;
label values anemia1   scp028x;   label values earinf1   scp028x;
label values seize1    scp028x;   label values hayf2     scp028x;
label values rallg2    scp028x;   label values dallg2    scp028x;
label values sallg2    scp028x;   label values diarh2    scp028x;
label values anemia2   scp028x;   label values fhead     scp028x;
label values earinf2   scp028x;   label values seize2    scp028x;
label values stutter   scp028x;   label values cheadyr   scp028x;
label values cabdomyr  scp028x;   label values cjntsymp  scp028x;
label values cpaineck  scp028x;   label values cpainlb   scp028x;
label values cmusclyr  scp028x;   label values cspnyr    scp028x;
label values cdenyr    scp028x;   label values cpnothyr  scp028x;
label values covrwtyr  scp028x;   label values cthothyr  scp028x;
label values cfevryr   scp028x;   label values ccoldyr   scp028x;
label values cnausyr   scp028x;   label values cfatigyr  scp028x;
label values cfatyr    scp028x;   label values cinsyr    scp028x;
label values chstatyr  scp091x;   label values schdayr1  scp092x;
label values ccold2w   scp028x;   label values cintil2w  scp028x;
label values chearst1  scp095x;   label values cvision   scp028x;
label values cblind    scp028x;   label values ihspeq    scp028x;
label values ihmob     scp028x;   label values ihmobyr   scp028x;
label values probrx    scp028x;   label values learnd    scp028x;
label values cmhagm15  scp103x;   label values mhiboy2   scp104x;
label values cmhagf15  scp103x;   label values mhigrl2   scp104x;
label values cdeprsyr  scp028x;   label values canxnwyr  scp028x;
label values cstresyr  scp028x;   label values menstyr   scp028x;
label values cgynyr    scp028x;

label values cusualpl  scp112x;   label values cplkind   scp113x;
label values chcplrou  scp028x;   label values chcplknd  scp115x;
label values chcchgyr  scp028x;   label values chcchghi  scp028x;
label values cnouspl1  scp118x;   label values cnouspl2  scp118x;
label values cnouspl3  scp118x;   label values cnouspl4  scp118x;
label values cnouspl5  scp118x;   label values cnouspl6  scp118x;
label values cnouspl7  scp118x;   label values cnouspl8  scp118x;
label values cnouspl9  scp118x;   label values cprvtryr  scp028x;
label values cprvtrfd  scp128x;   label values cdrnanp   scp028x;
label values cdrnai    scp028x;   label values chcdlyr1  scp028x;
label values chcdlyr2  scp028x;   label values chcdlyr3  scp028x;
label values chcdlyr4  scp028x;   label values chcdlyr5  scp028x;
label values chcafyr   scp028x;   label values chcafyrn  scp028x;
label values chcafyrf  scp028x;   label values chcafyr1  scp028x;
label values chcafyr2  scp028x;   label values chcafyr3  scp028x;
label values chcafyr4  scp028x;   label values chcafyr5  scp028x;
label values chcafyr6  scp028x;   label values cdnlongr  scp145x;
label values chcsyr11  scp028x;   label values chcsyr12  scp028x;
label values chcsyr13  scp028x;   label values chcsyr14  scp028x;
label values chcsyr1   scp028x;   label values chcsyr2   scp028x;
label values chcsyr3   scp028x;   label values chcsyr4   scp028x;
label values chcsyr5   scp028x;   label values chcsyr6   scp028x;
label values chcsyr7   scp028x;   label values chcsyr81  scp028x;
label values chcsyr82  scp028x;   label values chcsyr10  scp028x;
label values chcsyrem  scp028x;   label values chpxyr_c  scp028x;
label values chernoy2  scp162x;   label values cervisnd  scp028x;
label values cerhos    scp028x;   label values cerreas1  scp128x;
label values cerrea1r  scp128x;   label values cerreas2  scp128x;
label values cerrea2r  scp128x;   label values cerreas3  scp028x;
label values cerrea3r  scp028x;   label values cerreas4  scp171x;
label values cerrea4r  scp171x;   label values cerreas5  scp028x;
label values cerrea5r  scp028x;   label values cerreas6  scp128x;
label values cerrea6r  scp128x;   label values cerreas7  scp128x;
label values cerrea7r  scp128x;   label values cerreas8  scp128x;
label values cerrea8r  scp128x;   label values chchyr    scp028x;
label values chchmoyr  scp182x;   label values chchnoy2  scp183x;
label values chcnoyr2  scp162x;   label values csrgyr    scp028x;
label values rsrgnoyr  scp186x;   label values cmdlongr  scp145x;

label values cvslwrd   scp188x;   label values cvslvyr   scp128x;
label values cvslswyr  scp128x;   label values cvslspyr  scp128x;
label values cvsllgyr  scp128x;   label values cvslever  scp128x;
label values cvsldg    scp128x;   label values cvsldgt1  scp033x;
label values cvsldgt2  scp033x;   label values cvsldgt3  scp033x;
label values cvsldgt4  scp033x;   label values cvslvd01  scp033x;
label values cvslvd02  scp033x;   label values cvslvd03  scp033x;
label values cvslvd04  scp033x;   label values cvslvd05  scp033x;
label values cvslvd06  scp033x;   label values cvslvd07  scp033x;
label values cvslvd08  scp033x;   label values cvslvd09  scp033x;
label values cvslvd10  scp033x;   label values cvslvd11  scp033x;
label values cvslsw01  scp033x;   label values cvslsw02  scp033x;
label values cvslsw03  scp033x;   label values cvslsw04  scp033x;
label values cvslsw05  scp033x;   label values cvslsw06  scp033x;
label values cvslsw07  scp033x;   label values cvslsw08  scp033x;
label values cvslsw09  scp033x;   label values cvslsp01  scp033x;
label values cvslsp02  scp033x;   label values cvslsp03  scp033x;
label values cvslsp04  scp033x;   label values cvslsp05  scp033x;
label values cvslsp06  scp033x;   label values cvslsp07  scp033x;
label values cvslsp08  scp033x;   label values cvslsp09  scp033x;
label values cvslsp10  scp033x;   label values cvsllg01  scp033x;
label values cvsllg02  scp033x;   label values cvsllg03  scp033x;
label values cvsllg04  scp033x;   label values cvsllg05  scp033x;
label values cvsllg06  scp033x;   label values cvsllg07  scp033x;
label values cvsllg08  scp033x;   label values cvsllg09  scp033x;
label values cvslvag   scp182x;   label values cvslswag  scp182x;
label values cvslspag  scp182x;   label values cvsllgag  scp182x;
label values cvslvpb   scp242x;   label values cvslswpb  scp242x;
label values cvslsppb  scp242x;   label values cvsllgpb  scp242x;
label values cvslvsp   scp028x;   label values cvslvpe   scp028x;
label values cvslswsp  scp028x;   label values cvslswpe  scp028x;
label values cvslspsp  scp028x;   label values cvslsppe  scp028x;
label values cvsllgsp  scp028x;   label values cvsllgpe  scp028x;
label values cvsvp01   scp033x;   label values cvsvp02   scp033x;
label values cvsvp03   scp033x;   label values cvsvp04   scp033x;
label values cvsvp05   scp033x;   label values cvsvp06   scp033x;
label values cvsvp07   scp033x;   label values cvsvp08   scp033x;
label values cvsvp09   scp033x;   label values cvsvp10   scp033x;
label values cvsswp01  scp033x;   label values cvsswp02  scp033x;
label values cvsswp03  scp033x;   label values cvsswp04  scp033x;
label values cvsswp05  scp033x;   label values cvsswp06  scp033x;
label values cvsswp07  scp033x;   label values cvsswp08  scp033x;
label values cvsswp09  scp033x;   label values cvsswp10  scp033x;
label values cvsspp01  scp033x;   label values cvsspp02  scp033x;
label values cvsspp03  scp033x;   label values cvsspp04  scp033x;
label values cvsspp05  scp033x;   label values cvsspp06  scp033x;
label values cvsspp07  scp033x;   label values cvsspp08  scp033x;
label values cvsspp09  scp033x;   label values cvsspp10  scp033x;
label values cvslgp01  scp033x;   label values cvslgp02  scp033x;
label values cvslgp03  scp033x;   label values cvslgp04  scp033x;
label values cvslgp05  scp033x;   label values cvslgp06  scp033x;
label values cvslgp07  scp033x;   label values cvslgp08  scp033x;
label values cvslgp09  scp033x;   label values cvslgp10  scp033x;

label values cbalwlk   scp294x;   label values cballimb  scp128x;
label values cbalvrtg  scp128x;   label values cbalsted  scp128x;
label values cbalmotr  scp128x;   label values cbalfall  scp128x;
label values cbalpass  scp128x;   label values cbaloth   scp128x;
label values cbaldghp  scp128x;   label values cbaldg01  scp033x;
label values cbaldg02  scp033x;   label values cbaldg03  scp033x;
label values cbaldg04  scp033x;   label values cbaldg05  scp033x;
label values cbaldg06  scp033x;   label values cbaldg07  scp033x;
label values cbaldg08  scp033x;   label values cbaldg09  scp033x;
label values cbaldg10  scp033x;   label values cbaldg11  scp033x;
label values cbaldg12  scp033x;   label values cbalpart  scp128x;
label values cbalprob  scp242x;   label values cbalhpyr  scp128x;
label values cbaltret  scp128x;

label values rscl2_c2  scp319x;   label values rscl2_e2  scp319x;
label values rscl3_e3  scp319x;   label values rscl5_p5  scp319x;
label values rscl5_h5  scp319x;   label values rscl6     scp324x;

label values diff6m    scp028x;   label values diffintf  scp028x;
label values diffdeg   scp327x;   label values difflng   scp328x;
label values prescp6m  scp028x;   label values preshelp  scp330x;
label values pmedped   scp028x;   label values pmedpsy   scp028x;
label values pmedneu   scp028x;   label values pmedothr  scp028x;
label values nsduh21   scp028x;   label values nsduh3    scp028x;
label values nsduh31   scp337x;   label values nsduh321  scp033x;
label values nsduh322  scp118x;   label values nsduh323  scp033x;
label values nsduh324  scp118x;   label values nsduh325  scp033x;
label values nsduh4    scp028x;   label values nsduh51r  scp033x;
label values nsduh52r  scp033x;   label values nsduh53r  scp033x;
label values nsduh54r  scp118x;   label values nsduh55r  scp118x;
label values trtwre1r  scp128x;   label values trtwh11r  scp118x;
label values trtwh12r  scp118x;   label values trtwh13r  scp033x;
label values trtwh14r  scp118x;   label values trtwh16r  scp118x;
label values trtmhp11  scp118x;   label values trtmhp12  scp033x;
label values trtmhp13  scp118x;   label values trtmhp14  scp033x;
label values trtwre2r  scp028x;   label values trtwh21r  scp118x;
label values trtwh22r  scp118x;   label values trtwh23r  scp118x;
label values trtwh24r  scp118x;   label values trtwh25r  scp118x;
label values trtwh26r  scp118x;   label values trtmhp21  scp118x;
label values trtmhp22  scp367x;   label values trtmhp23  scp118x;
label values trtmhp24  scp118x;   label values trtwre3r  scp028x;
label values trtwh31r  scp033x;   label values trtwh32r  scp118x;
label values trtwh33r  scp118x;   label values trtwh34r  scp118x;
label values trtwh35r  scp118x;   label values trtwh36r  scp118x;
label values trtmhp31  scp118x;   label values trtmhp32  scp118x;
label values trtmhp33  scp118x;   label values trtmhp34  scp118x;
label values trtwre4r  scp128x;   label values trtwh41r  scp118x;
label values trtwh42r  scp118x;   label values trtwh43r  scp033x;
label values trtwh44r  scp118x;   label values trtwh45r  scp118x;
label values trtwh46r  scp118x;   label values trtmhp41  scp118x;
label values trtmhp42  scp033x;   label values trtmhp43  scp118x;
label values trtmhp44  scp118x;   label values trtwre5r  scp128x;
label values trtwh51r  scp118x;   label values trtwh52r  scp118x;
label values trtwh53r  scp118x;   label values trtwh54r  scp396x;
label values trtwh55r  scp118x;   label values trtwh56r  scp118x;
label values trtmhp51  scp118x;   label values trtmhp52  scp033x;
label values trtmhp53  scp118x;   label values trtmhp54  scp118x;
label values trtwre6r  scp128x;   label values trtwh61r  scp118x;
label values trtwh62r  scp033x;   label values trtwh63r  scp118x;
label values trtwh64r  scp118x;   label values trtwh65r  scp118x;
label values trtwh66r  scp118x;   label values trtmhp61  scp118x;
label values trtmhp62  scp118x;   label values trtmhp63  scp033x;
label values trtmhp64  scp118x;   label values ovrnt6mr  scp128x;
label values overwh1r  scp118x;   label values overwh2r  scp118x;
label values overwh3r  scp118x;   label values overwh4r  scp033x;
label values overwh5r  scp419x;   label values overwh6r  scp118x;
label values overwh7r  scp118x;   label values sh1       scp028x;
label values sh2       scp028x;   label values casem6m   scp028x;
label values casemwho  scp425x;   label values trethelp  scp426x;
label values trpyphir  scp128x;   label values trpyschr  scp128x;
label values trpyslfr  scp128x;   label values trpymedr  scp028x;
label values trpychpr  scp128x;   label values trpymilr  scp128x;
label values trpyshpr  scp128x;   label values trpyihsr  scp028x;
label values trpyothr  scp128x;   label values trtfreer  scp128x;
label values trtneed1  scp128x;   label values ntrcostr  scp128x;
label values ntrlocr   scp128x;   label values ntrnexpr  scp128x;
label values ntrfearr  scp128x;   label values ntrloser  scp128x;
label values ntrsayr   scp128x;   label values ntrwaitr  scp028x;
label values ntrtranr  scp128x;   label values ntrincvr  scp128x;
label values ntrfarr   scp128x;   label values ntrchnor  scp128x;
label values ntrothr   scp128x;

label values cshflu12  scp028x;   label values cshflunm  scp451x;
label values cshflum1  scp452x;   label values cshfluy1  scp453x;
label values cshspfl1  scp454x;   label values cshflum2  scp452x;
label values cshfluy2  scp453x;   label values cshspfl2  scp454x;

save "$OUT/2012/samchild", replace;
#delimit cr
log close
