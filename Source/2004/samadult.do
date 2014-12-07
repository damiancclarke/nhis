log using "$LOG/samadult.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 JULY 21, 2005  8:54 AM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2004 NHIS Public Use Sample Adult ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE SAMADULT.DTA AND SAMADULT.LOG
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2004\

 THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
 LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
 USER SHOULD ENTER THE FOLLOWING STATA COMMAND: log close
 
 THIS IS STORED IN SAMADULT.DO
*********************************************************************;
clear;
set mem 200m;

* INPUT ALL VARIABLES;

infix
      rectype       1 -   2      srvy_yr       3 -   6
 str  hhx           7 -  12 str  fmx          13 -  14
 str  fpx          15 -  16      wtia_sa      17 -  22
      wtfa_sa      23 -  28

      proxysa      29 -  29      prox1        30 -  30
      prox2        31 -  31

      doinglwa     32 -  32      whynowka     33 -  34
      everwrk      35 -  35      indstr1a     36 -  37
      indstr2a     38 -  39      indstrn1     40 -  41
      indstrn2     42 -  43      occup1a      44 -  45
      occup2a      46 -  47      occupn1      48 -  49
      occupn2      50 -  51      wrkcata      52 -  52
      businc1a     53 -  53      locall1a     54 -  55
      yrswrkpa     56 -  57      wrklongh     58 -  58
      hourpda      59 -  59      pdsicka      60 -  60
      onejob       61 -  61

      hypev        62 -  62      hypdifv      63 -  63
      chdev        64 -  64      angev        65 -  65
      miev         66 -  66      hrtev        67 -  67
      strev        68 -  68      ephev        69 -  69
      aasmev       70 -  70      aasstill     71 -  71
      aasmyr       72 -  72      aasmeryr     73 -  73
      ulcev        74 -  74      ulcyr        75 -  75
      canev        76 -  76      cnkind1      77 -  77
      cnkind2      78 -  78      cnkind3      79 -  79
      cnkind4      80 -  80      cnkind5      81 -  81
      cnkind6      82 -  82      cnkind7      83 -  83
      cnkind8      84 -  84      cnkind9      85 -  85
      cnkind10     86 -  86      cnkind11     87 -  87
      cnkind12     88 -  88      cnkind13     89 -  89
      cnkind14     90 -  90      cnkind15     91 -  91
      cnkind16     92 -  92      cnkind17     93 -  93
      cnkind18     94 -  94      cnkind19     95 -  95
      cnkind20     96 -  96      cnkind21     97 -  97
      cnkind22     98 -  98      cnkind23     99 -  99
      cnkind24    100 - 100      cnkind25    101 - 101
      cnkind26    102 - 102      cnkind27    103 - 103
      cnkind28    104 - 104      cnkind29    105 - 105
      cnkind30    106 - 106      cnkind31    107 - 107
      canage1     108 - 109      canage2     110 - 111
      canage3     112 - 113      canage4     114 - 115
      canage5     116 - 117      canage6     118 - 119
      canage7     120 - 121      canage8     122 - 123
      canage9     124 - 125      canage10    126 - 127
      canage11    128 - 129      canage12    130 - 131
      canage13    132 - 133      canage14    134 - 135
      canage15    136 - 137      canage16    138 - 139
      canage17    140 - 141      canage18    142 - 143
      canage19    144 - 145      canage20    146 - 147
      canage21    148 - 149      canage22    150 - 151
      canage23    152 - 153      canage24    154 - 155
      canage25    156 - 157      canage26    158 - 159
      canage27    160 - 161      canage28    162 - 163
      canage29    164 - 165      canage30    166 - 167
      dibev       168 - 168      dibage      169 - 170
      difage2     171 - 172      insln       173 - 173
      dibpill     174 - 174      ahayfyr     175 - 175
      sinyr       176 - 176      cbrchyr     177 - 177
      kidwkyr     178 - 178      livyr       179 - 179
      jntsymp     180 - 180      jmthp1      181 - 181
      jmthp2      182 - 182      jmthp3      183 - 183
      jmthp4      184 - 184      jmthp5      185 - 185
      jmthp6      186 - 186      jmthp7      187 - 187
      jmthp8      188 - 188      jmthp9      189 - 189
      jmthp10     190 - 190      jmthp11     191 - 191
      jmthp12     192 - 192      jmthp13     193 - 193
      jmthp14     194 - 194      jmthp15     195 - 195
      jmthp16     196 - 196      jmthp17     197 - 197
      jntchr      198 - 198      jnthp       199 - 199
      arth1       200 - 200      arthlmt     201 - 201
      paineck     202 - 202      painlb      203 - 203
      painleg     204 - 204      painface    205 - 205
      amigr       206 - 206      acold2w     207 - 207
      aintil2w    208 - 208      pregnow     209 - 209
      hearaid     210 - 210      ahearst     211 - 211
      avision     212 - 212      ablind      213 - 213
      lupprt      214 - 214      sad         215 - 215
      nervous     216 - 216      restless    217 - 217
      hopeless    218 - 218      effort      219 - 219
      worthls     220 - 220      mhamtmo     221 - 221

      wrklyr3     222 - 222      wkdayr      223 - 225
      beddayr     226 - 228      ahstatyr    229 - 229
      speceq      230 - 230      flwalk      231 - 231
      flclimb     232 - 232      flstand     233 - 233
      flsit       234 - 234      flstoop     235 - 235
      flreach     236 - 236      flgrasp     237 - 237
      flcarry     238 - 238      flpush      239 - 239
      flshop      240 - 240      flsocl      241 - 241
      flrelax     242 - 242      fla1ar      243 - 243
      aflhca1     244 - 244      aflhca2     245 - 245
      aflhca3     246 - 246      aflhca4     247 - 247
      aflhca5     248 - 248      aflhca6     249 - 249
      aflhca7     250 - 250      aflhca8     251 - 251
      aflhca9     252 - 252      aflhca10    253 - 253
      aflhca11    254 - 254      aflhca12    255 - 255
      aflhca13    256 - 256      aflhca14    257 - 257
      aflhca15    258 - 258      aflhca16    259 - 259
      aflhca17    260 - 260      aflhca18    261 - 261
      aflhc19_    262 - 262      aflhc20_    263 - 263
      aflhc21_    264 - 264      aflhc22_    265 - 265
      aflhc23_    266 - 266      aflhc24_    267 - 267
      aflhc25_    268 - 268      aflhc26_    269 - 269
      aflhc27_    270 - 270      aflhc28_    271 - 271
      aflhc29_    272 - 272      aflhc30_    273 - 273
      aflhc31_    274 - 274      aflhc32_    275 - 275
      aflhc33_    276 - 276      aflhc34_    277 - 277
      aflhca90    278 - 278      aflhca91    279 - 279
      altime1     280 - 281      alunit1     282 - 282
      aldura1     283 - 284      aldurb1     285 - 285
      alchrc1     286 - 286      altime2     287 - 288
      alunit2     289 - 289      aldura2     290 - 291
      aldurb2     292 - 292      alchrc2     293 - 293
      altime3     294 - 295      alunit3     296 - 296
      aldura3     297 - 298      aldurb3     299 - 299
      alchrc3     300 - 300      altime4     301 - 302
      alunit4     303 - 303      aldura4     304 - 305
      aldurb4     306 - 306      alchrc4     307 - 307
      altime5     308 - 309      alunit5     310 - 310
      aldura5     311 - 312      aldurb5     313 - 313
      alchrc5     314 - 314      altime6     315 - 316
      alunit6     317 - 317      aldura6     318 - 319
      aldurb6     320 - 320      alchrc6     321 - 321
      altime7     322 - 323      alunit7     324 - 324
      aldura7     325 - 326      aldurb7     327 - 327
      alchrc7     328 - 328      altime8     329 - 330
      alunit8     331 - 331      aldura8     332 - 333
      aldurb8     334 - 334      alchrc8     335 - 335
      altime9     336 - 337      alunit9     338 - 338
      aldura9     339 - 340      aldurb9     341 - 341
      alchrc9     342 - 342      altime10    343 - 344
      alunit10    345 - 345      aldura10    346 - 347
      aldurb10    348 - 348      alchrc10    349 - 349
      altime11    350 - 351      alunit11    352 - 352
      aldura11    353 - 354      aldurb11    355 - 355
      alchrc11    356 - 356      altime12    357 - 358
      alunit12    359 - 359      aldura12    360 - 361
      aldurb12    362 - 362      alchrc12    363 - 363
      altime13    364 - 365      alunit13    366 - 366
      aldura13    367 - 368      aldurb13    369 - 369
      alchrc13    370 - 370      altime14    371 - 372
      alunit14    373 - 373      aldura14    374 - 375
      aldurb14    376 - 376      alchrc14    377 - 377
      altime15    378 - 379      alunit15    380 - 380
      aldura15    381 - 382      aldurb15    383 - 383
      alchrc15    384 - 384      altime16    385 - 386
      alunit16    387 - 387      aldura16    388 - 389
      aldurb16    390 - 390      alchrc16    391 - 391
      altime17    392 - 393      alunit17    394 - 394
      aldura17    395 - 396      aldurb17    397 - 397
      alchrc17    398 - 398      altime18    399 - 400
      alunit18    401 - 401      aldura18    402 - 403
      aldurb18    404 - 404      alchrc18    405 - 405
      altime19    406 - 407      alunit19    408 - 408
      aldura19    409 - 410      aldurb19    411 - 411
      alchrc19    412 - 412      altime20    413 - 414
      alunit20    415 - 415      aldura20    416 - 417
      aldurb20    418 - 418      alchrc20    419 - 419
      altime21    420 - 421      alunit21    422 - 422
      aldura21    423 - 424      aldurb21    425 - 425
      alchrc21    426 - 426      altime22    427 - 428
      alunit22    429 - 429      aldura22    430 - 431
      aldurb22    432 - 432      alchrc22    433 - 433
      altime23    434 - 435      alunit23    436 - 436
      aldura23    437 - 438      aldurb23    439 - 439
      alchrc23    440 - 440      altime24    441 - 442
      alunit24    443 - 443      aldura24    444 - 445
      aldurb24    446 - 446      alchrc24    447 - 447
      altime25    448 - 449      alunit25    450 - 450
      aldura25    451 - 452      aldurb25    453 - 453
      alchrc25    454 - 454      altime26    455 - 456
      alunit26    457 - 457      aldura26    458 - 459
      aldurb26    460 - 460      alchrc26    461 - 461
      altime27    462 - 463      alunit27    464 - 464
      aldura27    465 - 466      aldurb27    467 - 467
      alchrc27    468 - 468      altime28    469 - 470
      alunit28    471 - 471      aldura28    472 - 473
      aldurb28    474 - 474      alchrc28    475 - 475
      altime29    476 - 477      alunit29    478 - 478
      aldura29    479 - 480      aldurb29    481 - 481
      alchrc29    482 - 482      altime30    483 - 484
      alunit30    485 - 485      aldura30    486 - 487
      aldurb30    488 - 488      alchrc30    489 - 489
      altime31    490 - 491      alunit31    492 - 492
      aldura31    493 - 494      aldurb31    495 - 495
      alchrc31    496 - 496      altime32    497 - 498
      alunit32    499 - 499      aldura32    500 - 501
      aldurb32    502 - 502      alchrc32    503 - 503
      altime33    504 - 505      alunit33    506 - 506
      aldura33    507 - 508      aldurb33    509 - 509
      alchrc33    510 - 510      altime34    511 - 512
      alunit34    513 - 513      aldura34    514 - 515
      aldurb34    516 - 516      alchrc34    517 - 517
      altime90    518 - 519      alunit90    520 - 520
      aldura90    521 - 522      aldurb90    523 - 523
      alchrc90    524 - 524      altime91    525 - 526
      alunit91    527 - 527      aldura91    528 - 529
      aldurb91    530 - 530      alchrc91    531 - 531
      alcndrt     532 - 532      alchronr    533 - 533

      smkev       534 - 534      smkreg      535 - 536
      smknow      537 - 537      smkstat2    538 - 538
      smkqtno     539 - 540      smkqttp     541 - 541
      smkqty      542 - 543      cigsda1     544 - 545
      cigdamo     546 - 547      cigsda2     548 - 549
      cigsday     550 - 551      cigqtyr     552 - 552
      vigno       553 - 555      vigtp       556 - 556
      vigfreqw    557 - 558      viglngno    559 - 561
      viglngtp    562 - 562      vigmin      563 - 565
      modno       566 - 568      modtp       569 - 569
      modfreqw    570 - 571      modlngno    572 - 574
      modlngtp    575 - 575      modmin      576 - 578
      strngno     579 - 581      strngtp     582 - 582
      strfreqw    583 - 584      alc1yr      585 - 585
      alclife     586 - 586      alc12mno    587 - 589
      alc12mtp    590 - 590      alc12mwk    591 - 592
      alc12myr    593 - 595      alcamt      596 - 597
      alcstat     598 - 599      alc5upno    600 - 602
      alc5uptp    603 - 603      alc5upyr    604 - 606
      aheight     607 - 608      aweightp    609 - 611
      bmi         612 - 615      sleep       616 - 617

      ausualpl    618 - 618      aplkind     619 - 619
      ahcplrou    620 - 620      ahcplknd    621 - 621
      ahcchgyr    622 - 622      ahcchghi    623 - 623
      ahcdlyr1    624 - 624      ahcdlyr2    625 - 625
      ahcdlyr3    626 - 626      ahcdlyr4    627 - 627
      ahcdlyr5    628 - 628      ahcafyr1    629 - 629
      ahcafyr2    630 - 630      ahcafyr3    631 - 631
      ahcafyr4    632 - 632      adnlong2    633 - 633
      ahcsyr1     634 - 634      ahcsyr2     635 - 635
      ahcsyr3     636 - 636      ahcsyr4     637 - 637
      ahcsyr5     638 - 638      ahcsyr6     639 - 639
      ahcsyr7     640 - 640      ahcsyr8     641 - 641
      ahcsyr9     642 - 642      ahcsyr10    643 - 643
      ahernoy2    644 - 645      ahchyr      646 - 646
      ahchmoyr    647 - 648      ahchnoy2    649 - 650
      ahcnoyr2    651 - 652      asrgyr      653 - 653
      asrgnoyr    654 - 655      amdlongr    656 - 656
      shtfluyr    657 - 657      sprfluyr    658 - 658
      shtpnuyr    659 - 659      apox        660 - 660
      apox12mo    661 - 661      ahep        662 - 662
      ahepliv     663 - 663      shthepb     664 - 664
      shepdos     665 - 665

      bldgv       666 - 666      bldg12m     667 - 667
      hivtst      668 - 668      whytst_r    669 - 670
      tst12m_m    671 - 672      tst12m_y    673 - 676
      timetst     677 - 677      reatst_c    678 - 679
      reaswhor    680 - 680      lastst_c    681 - 682
      clntyp_c    683 - 684      whoadm      685 - 685
      givnam      686 - 686      extst12m    687 - 687
      chnsadsp    688 - 688      stmtru      689 - 689
      std         690 - 690      stddoc      691 - 691
      stdwher     692 - 692      tbhrd       693 - 693
      tbknow      694 - 694      tb          695 - 695
      tbsprd1     696 - 696      tbsprd2     697 - 697
      tbsprd3     698 - 698      tbsprd4     699 - 699
      tbsprd5     700 - 700      tbsprd6     701 - 701
      tbcured     702 - 702      tbchanc     703 - 703
      tbshame     704 - 704      homeless    705 - 705

using "$DAT/2004/samadult.dat";
replace wtia_sa = wtia_sa/10;
replace bmi = bmi/100;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: HH identifier";
label variable fmx      "IDN.000_35.000: Family Serial Number";
label variable fpx      "IDN.000_40.000: Person Number (in family)";
label variable wtia_sa  "IDN.000_65.000: Weight - Interim Annual";
label variable wtfa_sa  "IDN.000_70.000: Weight - Final Annual";

label variable proxysa  "AID.005_00.000: Sample adult status";
label variable prox1    "
AID.010_00.000: Knowledgeable proxy for Sample Adult available";
label variable prox2    "AID.015_00.000: Relationship of SA proxy to SA";

label variable doinglwa "ASD.062_00.000: Corrected employment status last week";
label variable whynowka "ASD.065_00.000:  Main reason for not working last week
";
label variable everwrk  "ASD.066_00.000: Ever worked";
label variable indstr1a "
ASD.080_00.000.R02: Detailed industry classification (1987 SIC)";
label variable indstr2a "
ASD.080_00.000.R03: Simple industry classification (1987 SIC)";
label variable indstrn1 "
ASD.080_00.000.R05: Detailed industry classification (1997 NAICS)";
label variable indstrn2 "
ASD.080_00.000.R06: Simple industry classification (1997 NAICS)";
label variable occup1a  "
ASD.090_00.000.R02: Detailed occupation classification (1987 SOC)";
label variable occup2a  "
ASD.090_00.000.R03: Simple occupation classification (1987 SOC)";
label variable occupn1  "
ASD.090_00.000.R05: Detailed occupation classification (2000 SOC)";
label variable occupn2  "
ASD.090_00.000.R06: Simple occupation classification (2000 SOC)";
label variable wrkcata  "ASD.110_00.000: Class of worker";
label variable businc1a "ASD.112_00.000: Current job an incorporated business";
label variable locall1a "ASD.120_00.000: Number of employees at work";
label variable yrswrkpa "ASD.140_02.000.R02: Years on the job";
label variable wrklongh "
ASD.146_00.000: Current/most recent job also longest held job";
label variable hourpda  "
ASD.150_00.000: Paid by the hour at current/most recent job";
label variable pdsicka  "
ASD.160_00.000: Paid sick leave at current/most recent job";
label variable onejob   "ASD.170_00.000: Have more than one job";

label variable hypev    "ACN.010_00.000: Ever been told you have hypertension";
label variable hypdifv  "ACN.020_00.000: Ever had hypertension on 2+ visits";
label variable chdev    "
ACN.031_01.000: Ever been told you had coronary heart disease";
label variable angev    "ACN.031_02.000: Ever been told you had angina pectoris
";
label variable miev     "ACN.031_03.000: Ever been told you had a heart attack";
label variable hrtev    "
ACN.031_04.000: Ever been told you had a heart condition/disease";
label variable strev    "ACN.031_05.000: Ever been told you had a stroke";
label variable ephev    "ACN.031_06.000: Ever been told you had emphysema";
label variable aasmev   "ACN.080_00.000: Ever been told you had asthma";
label variable aasstill "ACN.085_00.000: Still have asthma";
label variable aasmyr   "ACN.090_00.000: Had an asthma episode/attack past 12 m
";
label variable aasmeryr "ACN.100_00.000: Had visit to ER due to asthma past 12 m
";
label variable ulcev    "ACN.110_00.000: Ever been told you have an ulcer";
label variable ulcyr    "ACN.120_00.000: Had ulcer in past 12 m";
label variable canev    "ACN.130_00.000: Ever told by a doctor you had cancer";
label variable cnkind1  "ACN.140_01.000: What kind of cancer ... Bladder";
label variable cnkind2  "ACN.140_02.000: What kind of cancer ... Blood";
label variable cnkind3  "ACN.140_03.000: What kind of cancer ... Bone";
label variable cnkind4  "ACN.140_04.000: What kind of cancer ... Brain";
label variable cnkind5  "ACN.140_05.000: What kind of cancer ... Breast";
label variable cnkind6  "ACN.140_06.000: What kind of cancer ... Cervix";
label variable cnkind7  "ACN.140_07.000: What kind of cancer ... Colon";
label variable cnkind8  "ACN.140_08.000: What kind of cancer ... Esophagus";
label variable cnkind9  "ACN.140_09.000: What kind of cancer ... Gallbladder";
label variable cnkind10 "ACN.140_10.000: What kind of cancer ... Kidney";
label variable cnkind11 "ACN.140_11.000: What kind of cancer ... larynx-windpipe
";
label variable cnkind12 "ACN.140_12.000: What kind of cancer ... Leukemia";
label variable cnkind13 "ACN.140_13.000: What kind of cancer ... Liver";
label variable cnkind14 "ACN.140_14.000: What kind of cancer ... Lung";
label variable cnkind15 "ACN.140_15.000: What kind of cancer ... Lymphoma";
label variable cnkind16 "ACN.140_16.000: What kind of cancer ... Melanoma";
label variable cnkind17 "
ACN.140_17.000: What kind of cancer ... mouth/tongue/lip";
label variable cnkind18 "ACN.140_18.000: What kind of cancer ... Ovary";
label variable cnkind19 "ACN.140_19.000: What kind of cancer ... Pancreas";
label variable cnkind20 "ACN.140_20.000: What kind of cancer ... Prostate";
label variable cnkind21 "ACN.140_21.000: What kind of cancer ... Rectum";
label variable cnkind22 "
ACN.140_22.000: What kind of cancer ... skin (non-melanoma)";
label variable cnkind23 "
ACN.140_23.000: What kind of cancer ... skin (DK what kind)";
label variable cnkind24 "
ACN.140_24.000: What kind of cancer ... soft tissue (muscle or fat)";
label variable cnkind25 "ACN.140_25.000: What kind of cancer ... Stomach";
label variable cnkind26 "ACN.140_26.000: What kind of cancer ... Testis";
label variable cnkind27 "
ACN.140_27.000: What kind of cancer ... throat - pharynx";
label variable cnkind28 "ACN.140_28.000: What kind of cancer ... Thyroid";
label variable cnkind29 "ACN.140_29.000: What kind of cancer ... Uterus";
label variable cnkind30 "ACN.140_30.000: What kind of cancer ... Other";
label variable cnkind31 "
ACN.140_31.000: What kind of cancer ... more than 3 kinds";
label variable canage1  "ACN.150_01.000: Age first diagnosed w/bladder cancer";
label variable canage2  "ACN.150_02.000: Age first diagnosed w/blood cancer";
label variable canage3  "ACN.150_03.000: Age first diagnosed w/bone cancer";
label variable canage4  "ACN.150_04.000: Age first diagnosed w/brain cancer";
label variable canage5  "ACN.150_05.000: Age first diagnosed w/breast cancer";
label variable canage6  "ACN.150_06.000: Age first diagnosed w/cervical cancer";
label variable canage7  "ACN.150_07.000: Age first diagnosed w/colon cancer";
label variable canage8  "ACN.150_08.000: Age first diagnosed w/esophageal cancer
";
label variable canage9  "
ACN.150_09.000: Age first diagnosed w/gallbladder cancer";
label variable canage10 "ACN.150_10.000: Age first diagnosed w/kidney cancer";
label variable canage11 "
ACN.150_11.000: Age first diagnosed w/larynx-windpipe cancer";
label variable canage12 "ACN.150_12.000: Age first diagnosed w/leukemia";
label variable canage13 "ACN.150_13.000: Age first diagnosed w/liver cancer";
label variable canage14 "ACN.150_14.000: Age first diagnosed w/lung cancer";
label variable canage15 "ACN.150_15.000: Age first diagnosed w/lymphoma";
label variable canage16 "ACN.150_16.000: Age first diagnosed w/melanoma";
label variable canage17 "
ACN.150_17.000: Age first diagnosed w/mouth/tongue/lip cancer";
label variable canage18 "ACN.150_18.000: Age first diagnosed w/ovarian cancer";
label variable canage19 "ACN.150_19.000: Age first diagnosed w/pancreatic cancer
";
label variable canage20 "ACN.150_20.000: Age first diagnosed w/prostate cancer";
label variable canage21 "ACN.150_21.000: Age first diagnosed w/rectal cancer";
label variable canage22 "
ACN.150_22.000: Age first diagnosed w/skin (non-melanoma) cancer";
label variable canage23 "
ACN.150_23.000: Age first diagnosed w/skin (DK kind) cancer";
label variable canage24 "
ACN.150_24.000: Age first diagnosed w/soft tissue cancer";
label variable canage25 "ACN.150_25.000: Age first diagnosed w/stomach cancer";
label variable canage26 "ACN.150_26.000: Age first diagnosed w/testicular cancer
";
label variable canage27 "
ACN.150_27.000: Age first diagnosed w/throat/pharynx cancer";
label variable canage28 "ACN.150_28.000: Age first diagnosed w/thyroid cancer";
label variable canage29 "ACN.150_29.000: Age first diagnosed w/uterine cancer";
label variable canage30 "ACN.150_30.000: Age first diagnosed w/other cancer";
label variable dibev    "ACN.160_00.000: Ever been told that you have diabetes";
label variable dibage   "ACN.170_00.000.R01: Age first diagnosed w/diabetes";
label variable difage2  "
ACN.170_00.000.R02: Years since first diagnosed w/diabetes";
label variable insln    "ACN.180_00.000: NOW taking insulin";
label variable dibpill  "ACN.190_00.000: NOW taking diabetic pills";
label variable ahayfyr  "ACN.201_01.000: Told that you had hay fever, past 12 m
";
label variable sinyr    "ACN.201_02.000: Told that you had sinusitis, past 12 m
";
label variable cbrchyr  "ACN.201_03.000: Told you had chronic bronchitis, 12 m";
label variable kidwkyr  "ACN.201_04.000: Told you had weak/failing kidneys, 12 m
";
label variable livyr    "ACN.201_05.000: Told you had liver condition, past 12 m
";
label variable jntsymp  "
ACN.250_00.000: Symptoms of joint pain/aching/stiffness past 30 d";
label variable jmthp1   "ACN.260_01.000: Which joint affected...shoulder-right";
label variable jmthp2   "ACN.260_02.000: Which joint affected...shoulder-left";
label variable jmthp3   "ACN.260_03.000: Which joint affected...elbow-right";
label variable jmthp4   "ACN.260_04.000: Which joint affected...elbow-left";
label variable jmthp5   "ACN.260_05.000: Which joint affected...hip-right";
label variable jmthp6   "ACN.260_06.000: Which joint affected...hip-left";
label variable jmthp7   "ACN.260_07.000: Which joint affected...wrist-right";
label variable jmthp8   "ACN.260_08.000: Which joint affected...wrist-left";
label variable jmthp9   "ACN.260_09.000: Which joint affected...knee-right";
label variable jmthp10  "ACN.260_10.000: Which joint affected...knee-left";
label variable jmthp11  "ACN.260_11.000: Which joint affected...ankle-right";
label variable jmthp12  "ACN.260_12.000: Which joint affected...ankle-left";
label variable jmthp13  "ACN.260_13.000: Which joint affected...toes-right";
label variable jmthp14  "ACN.260_14.000: Which joint affected...toes-left";
label variable jmthp15  "
ACN.260_15.000: Which joint affected...fingers/thumb-right";
label variable jmthp16  "
ACN.260_16.000: Which joint affected...fingers/thumb-left";
label variable jmthp17  "
ACN.260_17.000: Which joint affected...other joint not listed";
label variable jntchr   "ACN.270_00.000: Symptoms begin more than 3 m ago";
label variable jnthp    "
ACN.280_00.000: Ever seen doctor or hlth prof for joint symptoms";
label variable arth1    "ACN.290_00.000: Ever been told you had arthritis";
label variable arthlmt  "
ACN.295_00.000: Limited due to arthritis or joint symptoms";
label variable paineck  "ACN.300_00.000: Had neck pain, past 3 m";
label variable painlb   "ACN.310_00.000: Had low back pain, past 3 m";
label variable painleg  "ACN.320_00.000: Pain spread down leg/below knees";
label variable painface "ACN.331_01.000: Had pain in jaw/front of ear, past 3 m
";
label variable amigr    "ACN.331_02.000: Had severe headache/migraine, past 3 m
";
label variable acold2w  "ACN.350_00.000: Had a head/chest cold past 2 w";
label variable aintil2w "ACN.360_00.000: Had stomach prob w/vomit/diarrhea, 2 w
";
label variable pregnow  "ACN.370_00.000: Currently pregnant";
label variable hearaid  "ACN.410_00.000: Have ever worn a hearing aid";
label variable ahearst  "ACN.420_00.000: Description of hearing w/o hearing aid
";
label variable avision  "ACN.430_00.000: Trouble seeing even w/glasses/lenses";
label variable ablind   "ACN.440_00.000: Blind or unable to see at all";
label variable lupprt   "ACN.451_00.000: Lost all upper & lower natural teeth";
label variable sad      "
ACN.471_01.000: So sad nothing cheers you up, past 30 days";
label variable nervous  "ACN.471_02.000: How often felt nervous, past 30 days";
label variable restless "
ACN.471_03.000: How often restless/fidgety, past 30 days";
label variable hopeless "ACN.471_04.000: How often felt hopeless, past 30 days";
label variable effort   "
ACN.471_05.000: How often felt everything was an effort, past 30 days";
label variable worthls  "ACN.471_06.000: How often felt worthless, past 30 days
";
label variable mhamtmo  "
ACN.530_00.000: Feelings interfered w/life, past 30 days";

label variable wrklyr3  "AHS.030_00.000: Work status: last week, past 12 m";
label variable wkdayr   "AHS.040_00.000: Number of work loss days, past 12 m";
label variable beddayr  "AHS.050_00.000: Number of bed days, past 12 m";
label variable ahstatyr "
AHS.060_00.000: Health better/worse/same, compared w/ 12 m ago";
label variable speceq   "
AHS.070_00.000: Have health problem that requires special equipment";
label variable flwalk   "
AHS.091_01.000: How difficult to walk 1/4 mile w/o special equipment";
label variable flclimb  "
AHS.091_02.000: How difficult to climb 10 steps w/o special equipment";
label variable flstand  "
AHS.091_03.000: How difficult to stand 2 hours w/o special equipment";
label variable flsit    "
AHS.091_04.000: How difficult to sit 2 hours w/o special equipment";
label variable flstoop  "
AHS.091_05.000: How difficult to stoop, bend or kneel w/o special equipment";
label variable flreach  "
AHS.091_06.000: How difficult to reach over head w/o special equipment";
label variable flgrasp  "
AHS.141_01.000: How difficult to grasp small objects w/o special equipment";
label variable flcarry  "
AHS.141_02.000: How difficult lift/carry 10 lbs w/o special equipment";
label variable flpush   "
AHS.141_03.000: How difficult to push large objects w/o special equipment";
label variable flshop   "
AHS.171_01.000: How difficult to go out to events w/o special equipment";
label variable flsocl   "
AHS.171_02.000: How difficult to participate in social activities w/o sp eq";
label variable flrelax  "
AHS.171_03.000: How difficult to relax at home w/o special equipment";
label variable fla1ar   "
AHS.171_03.000.R01: Any functional limitation, all conds";
label variable aflhca1  "
AHS.200_01.000: Vision problem causes difficulty with activity";
label variable aflhca2  "
AHS.200_02.000: Hearing problem causes difficulty with activity";
label variable aflhca3  "
AHS.200_03.000: Arthritis/rheumatism causes difficulty with activity";
label variable aflhca4  "
AHS.200_04.000: Back/neck prob causes difficulty with activity";
label variable aflhca5  "
AHS.200_05.000: Fract/bone/joint inj causes difficulty with activity";
label variable aflhca6  "
AHS.200_06.000: Other injury causes difficulty with activity";
label variable aflhca7  "
AHS.200_07.000: Heart prob causes difficulty with activity";
label variable aflhca8  "AHS.200_08.000: Stroke causes difficulty with activity
";
label variable aflhca9  "
AHS.200_09.000: Hypertension causes difficulty with activity";
label variable aflhca10 "
AHS.200_10.000: Diabetes causes difficulty with activity";
label variable aflhca11 "
AHS.200_11.000: Lung/breath prob causes difficulty with activity";
label variable aflhca12 "AHS.200_12.000: Cancer causes difficulty with activity
";
label variable aflhca13 "
AHS.200_13.000: Birth defect causes difficulty with activity";
label variable aflhca14 "
AHS.200_14.000: Mental retardation causes difficulty with activity";
label variable aflhca15 "
AHS.200_15.000: Otr dev prob causes difficulty with activity";
label variable aflhca16 "
AHS.200_16.000: Senility/dementia/alzheimers causes difficulty with activity";
label variable aflhca17 "
AHS.200_17.000: Dep/anx/emot prob causes difficulty with activity";
label variable aflhca18 "
AHS.200_18.000: Weight prob causes difficulty with activity";
label variable aflhc19_ "
AHS.200_19.000.R01: Missing or amputated limb/finger/digit";
label variable aflhc20_ "
AHS.200_20.000.R02: Musculoskeletal/connective tissue prob";
label variable aflhc21_ "AHS.200_21.000.R03: Circulation problem";
label variable aflhc22_ "
AHS.200_22.000.R04: Endocrine/nutritional/metabolic prob";
label variable aflhc23_ "
AHS.200_23.000.R05: Nervous system/sensory organ condition";
label variable aflhc24_ "AHS.200_24.000.R06: Digestive system problem";
label variable aflhc25_ "AHS.200_25.000.R07: Genitourinary system problem";
label variable aflhc26_ "AHS.200_26.000.R08: Skin/subcutaneous system problem";
label variable aflhc27_ "
AHS.200_27.000.R09: Blood or blood-forming organ problem";
label variable aflhc28_ "AHS.200_28.000.R10: Benign tumor/cyst";
label variable aflhc29_ "
AHS.200_29.000.R11: Alcohol/drug/substance abuse problem";
label variable aflhc30_ "
AHS.200_30.000.R12: Otr mental prob/ADD/Bipolar/Schizophrenic";
label variable aflhc31_ "
AHS.200_31.000.R13: Surgical after-effects/medical treatment";
label variable aflhc33_ "AHS.200_33.000.R15: Fatigue/tiredness/weakness";
label variable aflhc34_ "AHS.200_34.000.R16: Pregnancy related problem";
label variable aflhca90 "
AHS.200_90.000.R17: Other impair/prob(1) causes difficulty with activity";
label variable aflhca91 "
AHS.200_91.000.R18: Other impair/prob(2) causes difficulty with activity";
label variable altime1  "
AHS.300_01.000: Duration of vision prob: Number of units";
label variable alunit1  "AHS.300_02.000: Duration of vision prob: Time unit";
label variable aldura1  "AHS.300_02.000.R01: Duration of vision prob (in years)
";
label variable aldurb1  "AHS.300_02.000.R02: Duration of vision prob recode 2";
label variable alchrc1  "AHS.300_02.000.R03: Vision problem condition status";
label variable altime2  "
AHS.301_01.000: Duration of hearing prob: Number of units";
label variable alunit2  "AHS.301_02.000: Duration of hearing prob: Time unit";
label variable aldura2  "AHS.301_02.000.R01: Duration of hearing prob (in years)
";
label variable aldurb2  "AHS.301_02.000.R02: Duration of hearing prob recode 2";
label variable alchrc2  "AHS.301_02.000.R03: Hearing problem condition status";
label variable altime3  "
AHS.302_01.000: Duration of arthritis/rheumatism: Number of units";
label variable alunit3  "
AHS.302_02.000: Duration of arthritis/rheumatism: Time unit";
label variable aldura3  "
AHS.302_02.000.R01: Duration of arthritis or rheumatism prob (in years)";
label variable aldurb3  "
AHS.302_02.000.R02: Duration of arthritis or rheumatism prob recode 2";
label variable alchrc3  "
AHS.302_02.000.R03: Arthritis or rheumatism problem condition status";
label variable altime4  "
AHS.303_01.000: Duration of back or neck problem: Number of units";
label variable alunit4  "
AHS.303_02.000: Duration of back or neck problem: Time unit";
label variable aldura4  "
AHS.303_02.000.R01: Duration of back or neck prob (in years)";
label variable aldurb4  "
AHS.303_02.000.R02: Duration of back or neck prob recode 2";
label variable alchrc4  "AHS.303_02.000.R03: Back or neck condition status";
label variable altime5  "
AHS.304_01.000: Duration of fracture, bone/joint injury: Number of units";
label variable alunit5  "
AHS.304_02.000: Duration of fracture, bone/joint injury: Time unit";
label variable aldura5  "
AHS.304_02.000.R01: Duration of fracture, bone/joint injury prob (in years)";
label variable aldurb5  "
AHS.304_02.000.R02: Duration of fracture, bone/joint injury prob recode 2";
label variable alchrc5  "
AHS.304_02.000.R03: Fracture, bone/joint injury condition status";
label variable altime6  "
AHS.305_01.000: Duration of other injury: Number of units";
label variable alunit6  "AHS.305_02.000: Duration of other injury: Time unit";
label variable aldura6  "
AHS.305_02.000.R01: Duration of other injury problem (in years)";
label variable aldurb6  "
AHS.305_02.000.R02: Duration of other injury problem recode 2";
label variable alchrc6  "AHS.305_02.000.R03: Other injury condition status";
label variable altime7  "
AHS.306_01.000: Duration of heart problem: Number of units";
label variable alunit7  "AHS.306_02.000: Duration of heart problem: Time unit";
label variable aldura7  "
AHS.306_02.000.R01: Duration of heart problem (in years)";
label variable aldurb7  "AHS.306_02.000.R02: Duration of heart problem recode 2
";
label variable alchrc7  "AHS.306_02.000.R03: Heart problem condition status";
label variable altime8  "
AHS.307_01.000: Duration of stroke problem: Number of units";
label variable alunit8  "AHS.307_02.000: Duration of stroke problem: Time unit";
label variable aldura8  "
AHS.307_02.000.R01: Duration of stroke problem (in years)";
label variable aldurb8  "AHS.307_02.000.R02: Duration of stroke problem recode 2
";
label variable alchrc8  "AHS.307_02.000.R03: Stroke problem condition status";
label variable altime9  "
AHS.308_01.000: Duration of hypertension/hgh blood pressure problem: Number of u
nits";
label variable alunit9  "
AHS.308_02.000: Duration of hypertension/hgh blood pressure problem: Time unit";
label variable aldura9  "
AHS.308_02.000.R01: Duration of hypertension/hgh blood pressure problem (in year
s)";
label variable aldurb9  "
AHS.308_02.000.R02: Duration of hypertension/hgh  problem  recode 2";
label variable alchrc9  "
AHS.308_02.000.R03: Hypertension/hgh blood pressure problem condition status";
label variable altime10 "AHS.309_01.000: Duration of diabetes: Number of units";
label variable alunit10 "AHS.309_02.000: Duration of diabetes: Time unit";
label variable aldura10 "AHS.309_02.000.R01: Duration of diabetes (in years)";
label variable aldurb10 "AHS.309_02.000.R02: Duration of diabetes prob recode 2
";
label variable alchrc10 "AHS.309_02.000.R03: Diabetes problem condition status";
label variable altime11 "
AHS.310_01.000: Duration of lung/breathing problem: Number of units";
label variable alunit11 "
AHS.310_02.000: Duration of lung/breathing problem: Time unit";
label variable aldura11 "
AHS.310_02.000.R01: Duration of lung/breathing problem (in years)";
label variable aldurb11 "
AHS.310_02.000.R02: Duration of lung/breathing problem recode 2";
label variable alchrc11 "
AHS.310_02.000.R03: Lung/breathing problem condition status";
label variable altime12 "AHS.311_01.000: Duration of cancer: Number of units";
label variable alunit12 "AHS.311_02.000: Duration of cancer: Time unit";
label variable aldura12 "
AHS.311_02.000.R01: Duration of cancer problem (in years)";
label variable aldurb12 "AHS.311_02.000.R02: Duration of cancer problem recode 2
";
label variable alchrc12 "AHS.311_02.000.R03: Cancer problem condition status";
label variable altime13 "
AHS.312_01.000: Duration of birth defect: Number of units";
label variable alunit13 "AHS.312_02.000: Duration of birth defect: Time unit";
label variable aldura13 "
AHS.312_02.000.R01: Duration of birth defect problem (in years)";
label variable aldurb13 "
AHS.312_02.000.R02: Duration of birth defect problem prob recode 2";
label variable alchrc13 "
AHS.312_02.000.R03: Birth defect problem condition status";
label variable altime14 "
AHS.313_01.000: Duration of mental retardation: Number of units";
label variable alunit14 "
AHS.313_02.000: Duration of mental retardation: Time unit";
label variable aldura14 "
AHS.313_02.000.R01: Duration of mental retardation problem (in years)";
label variable aldurb14 "
AHS.313_02.000.R02: Duration of mental retardation problem prob recode 2";
label variable alchrc14 "
AHS.313_02.000.R03: Mental retardation problem condition status";
label variable altime15 "
AHS.314_01.000: Duration of other developmental problem: Number of units";
label variable alunit15 "
AHS.314_02.000: Duration of other developmental problem: Time unit";
label variable aldura15 "
AHS.314_02.000.R01: Duration of other developmental problem (in years)";
label variable aldurb15 "
AHS.314_02.000.R02: Duration of other developmental problem  recode 2";
label variable alchrc15 "
AHS.314_02.000.R03: Other developmental problem condition status";
label variable altime16 "AHS.315_01.000: Duration of senility: Number of units";
label variable alunit16 "AHS.315_02.000: Duration of senility: Time unit";
label variable aldura16 "
AHS.315_02.000.R01: Duration of senility problem (in years)";
label variable aldurb16 "
AHS.315_02.000.R02: Duration of senility problem recode 2";
label variable alchrc16 "AHS.315_02.000.R03: Senility problem condition status";
label variable altime17 "
AHS.316_01.000: Duration of depression/anxiety/emotnl prob: Number of units";
label variable alunit17 "
AHS.316_02.000: Duration of depression/anxiety/emotional problem: Time unit";
label variable aldura17 "
AHS.316_02.000.R01: Duration of depression/anxiety/emotional problem (in years)
";
label variable aldurb17 "
AHS.316_02.000.R02: Duration of depression/anxiety/emotional problem recode 2";
label variable alchrc17 "
AHS.316_02.000.R03: Depression/anxiety/emotional problem condition status";
label variable altime18 "
AHS.317_01.000: Duration of weight problem: Number of units";
label variable alunit18 "AHS.317_02.000: Duration of weight problem: Time unit";
label variable aldura18 "
AHS.317_02.000.R01: Duration of weight problem (in years)";
label variable aldurb18 "AHS.317_02.000.R02: Duration of weight problem recode 2
";
label variable alchrc18 "AHS.317_02.000.R03: Weight problem condition status";
label variable altime19 "
AHS.318_01.000: Duration of missing limbs: Number of units";
label variable alunit19 "AHS.318_02.000: Duration of missing limbs: Time unit";
label variable aldura19 "
AHS.318_02.000.R01: Duration of missing limbs problem (in years)";
label variable aldurb19 "
AHS.318_02.000.R02: Duration of missing limbs problem recode 2";
label variable alchrc19 "
AHS.318_02.000.R03: Missing limbs problem condition status";
label variable altime20 "
AHS.319_01.000: Duration of musculoskeletal problem: Number of units";
label variable alunit20 "
AHS.319_02.000: Duration of musculoskeletal problem: Time unit";
label variable aldura20 "
AHS.319_02.000.R01: Duration of musculoskeletal problem (in years)";
label variable aldurb20 "
AHS.319_02.000.R02: Duration of musculoskeletal problem recode 2";
label variable alchrc20 "
AHS.319_02.000.R03: Musculoskeletal problem condition status";
label variable altime21 "
AHS.320_01.000: Duration of circulatory problem: Number of units";
label variable alunit21 "
AHS.320_02.000: Duration of circulatory problem: Time unit";
label variable aldura21 "
AHS.320_02.000.R01: Duration of circulatory problem (in years)";
label variable aldurb21 "
AHS.320_02.000.R02: Duration of circulatory problem recode 2";
label variable alchrc21 "
AHS.320_02.000.R03: Circulatory problem condition status";
label variable altime22 "
AHS.321_01.000: Duration of endocrine problem: Number of units";
label variable alunit22 "
AHS.321_02.000: Duration of endocrine problem: Time unit";
label variable aldura22 "
AHS.321_02.000.R01: Duration of endocrine problem (in years)";
label variable aldurb22 "
AHS.321_02.000.R02: Duration of endocrine problem recode 2";
label variable alchrc22 "AHS.321_02.000.R03: Endocrine problem condition status
";
label variable altime23 "
AHS.322_01.000: Duration of nervous system condition: Number of units";
label variable alunit23 "
AHS.322_02.000: Duration of nervous system condition: Time unit";
label variable aldura23 "
AHS.322_02.000.R01: Duration of nervous system condition (in years)";
label variable aldurb23 "
AHS.322_02.000.R02: Duration of nervous system condition recode 2";
label variable alchrc23 "AHS.322_02.000.R03: Nervous system condition status";
label variable altime24 "
AHS.323_01.000: Duration of digestive problems: Number of units";
label variable alunit24 "
AHS.323_02.000: Duration of digestive problems: Number of units";
label variable aldura24 "
AHS.323_02.000.R01: Duration of digestive problem (in years)";
label variable aldurb24 "
AHS.323_02.000.R02: Duration of digestive problem recode 2";
label variable alchrc24 "AHS.323_02.000.R03: Digestive problem condition status
";
label variable altime25 "
AHS.324_01.000: Duration of genitourinary problem: Number of units";
label variable alunit25 "
AHS.324_02.000: Duration of genitourinary problem: Time unit";
label variable aldura25 "
AHS.324_02.000.R01: Duration of genitourinary problem (in years)";
label variable aldurb25 "
AHS.324_02.000.R02: Duration of genitourinary problem recode 2";
label variable alchrc25 "
AHS.324_02.000.R03: Genitourinary problem condition status";
label variable altime26 "
AHS.325_01.000: Duration of skin problems: Number of units";
label variable alunit26 "AHS.325_02.000: Duration of skin problems: Time unit";
label variable aldura26 "AHS.325_02.000.R01: Duration of skin problem (in years)
";
label variable aldurb26 "AHS.325_02.000.R02: Duration of skin problem recode 2";
label variable alchrc26 "AHS.325_02.000.R03: Skin problems condition status";
label variable altime27 "
AHS.326_01.000: Duration of blood problem: Number of units";
label variable alunit27 "AHS.326_02.000: Duration of blood problem: Time unit";
label variable aldura27 "
AHS.326_02.000.R01: Duration of blood problem (in years)";
label variable aldurb27 "AHS.326_02.000.R02: Duration of blood problem recode 2
";
label variable alchrc27 "AHS.326_02.000.R03: Blood problem condition status";
label variable altime28 "
AHS.327_01.000: Duration of benign tumor: Number of units";
label variable alunit28 "AHS.327_02.000: Duration of benign tumor: Time unit";
label variable aldura28 "AHS.327_02.000.R01: Duration of benign tumor (in years)
";
label variable aldurb28 "AHS.327_02.000.R02: Duration of benign tumor recode 2";
label variable alchrc28 "AHS.327_02.000.R03: Benign tumor condition status";
label variable altime29 "
AHS.328_01.000: Duration of alcohol or drug problem: Number of units";
label variable alunit29 "
AHS.328_02.000: Duration of alcohol or drug problem: Time unit";
label variable aldura29 "
AHS.328_02.000.R01: Duration of alcohol or drug problem (in years)";
label variable aldurb29 "
AHS.328_02.000.R02: Duration of alcohol or drug problem recode 2";
label variable alchrc29 "
AHS.328_02.000.R03: Alcohol or drug problem condition status";
label variable altime30 "
AHS.329_01.000: Duration of other mental problem: Number of units";
label variable alunit30 "
AHS.329_02.000: Duration of other mental problem: Time unit";
label variable aldura30 "
AHS.329_02.000.R01: Duration of other mental problem (in years)";
label variable aldurb30 "
AHS.329_02.000.R02: Duration of other mental problem recode 2";
label variable alchrc30 "
AHS.329_02.000.R03: Other mental problem condition status";
label variable altime31 "
AHS.330_01.000: Duration of surgical after-effects: Number of units";
label variable alunit31 "
AHS.330_02.000: Duration of surgical after-effects: Time unit";
label variable aldura31 "
AHS.330_02.000.R01: Duration of surgical after-effects (in years)";
label variable aldurb31 "
AHS.330_02.000.R02: Duration of surgical after-effects recode 2";
label variable alchrc31 "
AHS.330_02.000.R03: Surgical after-effects condition status";
label variable altime33 "
AHS.332_01.000: Duration of fatigue problem: Number of units";
label variable alunit33 "AHS.332_02.000: Duration of fatigue problem: Time unit
";
label variable aldura33 "
AHS.332_02.000.R01: Duration of fatigue problem (in years)";
label variable aldurb33 "
AHS.332_02.000.R02: Duration of fatigue problem recode 2";
label variable alchrc33 "AHS.332_02.000.R03: Fatigue problem condition status";
label variable altime34 "
AHS.333_01.000: Duration of pregnancy-related problem: Number of units";
label variable alunit34 "
AHS.333_02.000: Duration of pregnancy-related problem: Time unit";
label variable aldura34 "
AHS.333_02.000.R01: Duration of pregnancy-related problem (in years)";
label variable aldurb34 "
AHS.333_02.000.R02: Duration of pregnancy-related problem recode 2";
label variable alchrc34 "AHS.333_02.000.R03: Pregnancy-related condition status
";
label variable altime90 "
AHS.335_01.000: Duration of other N.E.C. problem (1): Number of units";
label variable alunit90 "
AHS.335_02.000: Duration of other N.E.C. problem (1): Time unit";
label variable aldura90 "
AHS.335_02.000.R01: Duration of other N.E.C. problem (1) (in years)";
label variable aldurb90 "
AHS.335_02.000.R02: Duration of other N.E.C. problem (1) recode 2";
label variable alchrc90 "
AHS.335_02.000.R03: Other N.E.C. problem (1) condition status";
label variable altime91 "
AHS.336_01.000: Duration of other N.E.C. problem (2): Number of units";
label variable alunit91 "
AHS.336_02.000: Duration of other N.E.C. problem (2): Time unit";
label variable aldura91 "
AHS.336_02.000.R01: Duration of other N.E.C. problem (2) (in years)";
label variable aldurb91 "
AHS.336_02.000.R02: Duration of other N.E.C. problem (2) recode2";
label variable alchrc91 "
AHS.336_02.000.R03: Other N.E.C. problem (2) condition status";
label variable alcndrt  "
AHS.336_02.000.R04: Chronic cond rec for ind w/functl lim";
label variable alchronr "
AHS.336_02.000.R05: Overall functl lim recode by cond status";

label variable smkev    "AHB.010_00.000: Ever smoked 100 cigarettes";
label variable smkreg   "AHB.020_00.000: Age first smoked fairly regularly";
label variable smknow   "
AHB.030_00.000: Smoke freq: everyday/some days/not at all";
label variable smkstat2 "AHB.030_00.000.R01: Smoking Status: Recode";
label variable smkqtno  "AHB.040_01.000: Time since quit: # of units";
label variable smkqttp  "AHB.040_02.000: Time since quit: time period";
label variable smkqty   "AHB.040_02.000.R01: Time since quit smoking (in years)
";
label variable cigsda1  "AHB.050_00.000: Number cigs per day (daily smokers)";
label variable cigdamo  "AHB.060_00.000: Number days smoked in past 30 days";
label variable cigsda2  "AHB.070_00.000: Number cigs per day (some day smokers)
";
label variable cigsday  "
AHB.070_00.000.R01: Number of cigarettes a day (all current smokers)";
label variable cigqtyr  "AHB.080_00.000: Tried quit smoking 1+ days, past 12 m";
label variable vigno    "AHB.090_01.000: Freq vigorous activity: # of units";
label variable vigtp    "AHB.090_02.000: Freq vigorous activity: Time units";
label variable vigfreqw "
AHB.090_02.000.R01: Freq vigorous activity (times per wk)";
label variable viglngno "AHB.100_01.000: Duration vigorous activity: # units";
label variable viglngtp "AHB.100_02.000: Duration vigorous activity: Time unit";
label variable vigmin   "
AHB.100_02.000.R01: Duration vigorous activity (in minutes)";
label variable modno    "AHB.110_01.000: Freq moderate activity: # of units";
label variable modtp    "AHB.110_02.000: Freq moderate activity: Time units";
label variable modfreqw "
AHB.110_02.000.R01: Freq light/moderate activity (times per wk)";
label variable modlngno "AHB.120_01.000: Duration moderate activity: # of units
";
label variable modlngtp "AHB.120_02.000: Duration moderate activity: Time unit";
label variable modmin   "
AHB.120_02.000.R01: Duration light/moderate activity (in minutes)";
label variable strngno  "AHB.130_01.000: Strength activity freq: # of units";
label variable strngtp  "AHB.130_02.000: Strength activity freq: Time units";
label variable strfreqw "
AHB.130_02.000.R01: Freq strength activity (times per wk)";
label variable alc1yr   "AHB.140_00.000: Ever had 12+ drinks in any  one year";
label variable alclife  "AHB.150_00.000: Had 12+ drinks in ENTIRE LIFE";
label variable alc12mno "AHB.160_01.000: Freq drank alcohol pst yr:  # of units
";
label variable alc12mtp "AHB.160_02.000: Freq drank alcohol pst yr:  Time unit";
label variable alc12mwk "AHB.160_02.000.R01: Freq drank alcohol: Days per week";
label variable alc12myr "
AHB.160_02.000.R02: Freq drank alcohol: Days in past year";
label variable alcamt   "AHB.170_00.000: Average # drinks on days drank";
label variable alcstat  "AHB.170_00.000.R01: Alcohol drinking status: Recode";
label variable alc5upno "AHB.180_01.000: Days 5+ drinks, past yr: # days";
label variable alc5uptp "AHB.180_02.000: Days 5+ drinks, past yr: Time unit";
label variable alc5upyr "
AHB.180_02.000.R01: Number of days had 5+ drinks past year";
label variable aheight  "AHB.190_04.000.R03: Total height in inches";
label variable aweightp "AHB.200_02.000.R03: Weight without shoes (pounds)";
label variable bmi      "AHB.200_02.000.R04: Body Mass Index (BMI)";
label variable sleep    "AHB.210_00.000: Hours of sleep";

label variable ausualpl "AAU.020_00.000: Place USUALLY go when sick";
label variable aplkind  "AAU.030_00.000: Place to go when sick (most often)";
label variable ahcplrou "
AAU.035_00.000: USUALLY go there for routine/preventive care";
label variable ahcplknd "
AAU.037_00.000: Place USUALLY go for routine/preventive care";
label variable ahcchgyr "AAU.040_00.000: Change health care place, past 12 m";
label variable ahcchghi "AAU.050_00.000: Change related to health insurance";
label variable ahcdlyr1 "
AAU.061_01.000: Couldn't get through on phone, past 12 m";
label variable ahcdlyr2 "
AAU.061_02.000: Couldn't get appt soon enough, past 12 m";
label variable ahcdlyr3 "AAU.061_03.000: Wait too long in dr's office, past 12 m
";
label variable ahcdlyr4 "AAU.061_04.000: Not open when you could go, past 12 m";
label variable ahcdlyr5 "AAU.061_05.000: No transportation, past 12 m";
label variable ahcafyr1 "
AAU.111_01.000: Can't afford prescription medicine, past 12 m";
label variable ahcafyr2 "
AAU.111_02.000: Can't afford mental health care/counseling, 12 m";
label variable ahcafyr3 "AAU.111_03.000: Can't afford dental care, past 12 m";
label variable ahcafyr4 "AAU.111_04.000: Can't afford eyeglasses, past 12 m";
label variable adnlong2 "AAU.135_00.000: Time since last saw a dentist";
label variable ahcsyr1  "
AAU.141_01.000: Seen/talked to mental health professional, past 12 m";
label variable ahcsyr2  "AAU.141_02.000: Seen/talked to eye doctor, past 12 m";
label variable ahcsyr3  "AAU.141_03.000: Seen/talked to foot doctor, past 12 m";
label variable ahcsyr4  "
AAU.141_04.000: Seen/talked to a chiropractor, past 12 m";
label variable ahcsyr5  "
AAU.141_05.000: Seen/talked to therapist (PT/OT/etc.), past 12 m";
label variable ahcsyr6  "
AAU.141_06.000: Seen/talked to a NP/PA/midwife, past 12 m";
label variable ahcsyr7  "AAU.200_00.000: Seen/talked to OB/GYN, past 12 m";
label variable ahcsyr8  "
AAU.211_01.000: Seen/talked to a medical specialist, past 12 m";
label variable ahcsyr9  "
AAU.211_02.000: Seen/talked to a general doctor, past 12 m";
label variable ahcsyr10 "AAU.230_00.000: Doctor treats both kids and adults";
label variable ahernoy2 "AAU.240_00.000: # times in ER/ED, past 12 m";
label variable ahchyr   "
AAU.250_00.000: Received home care from health professional, past 12 m";
label variable ahchmoyr "AAU.260_00.000: # months of home care, past 12 m";
label variable ahchnoy2 "AAU.270_00.000: Total number of home visits";
label variable ahcnoyr2 "
AAU.280_00.000: Total number of office visits, past 12 m";
label variable asrgyr   "AAU.290_00.000: Surgery/surgical procedure, past 12 m";
label variable asrgnoyr "AAU.300_00.000: # of surgeries, past 12 m";
label variable amdlongr "
AAU.305_00.000: Time since last seen/talked to health professional";
label variable shtfluyr "AAU.310_00.000: Flu shot past 12 m";
label variable sprfluyr "AAU.315_00.000: Flu spray past 12 m";
label variable shtpnuyr "AAU.320_00.000: Pneumonia shot (EVER)";
label variable apox     "AAU.330_00.000: Ever had chickenpox";
label variable apox12mo "AAU.340_00.000: Chickenpox, past 12 m";
label variable ahep     "AAU.350_00.000: Ever had hepatitis";
label variable ahepliv  "AAU.360_00.000: Ever lived w/ someone w/ hepatitis";
label variable shthepb  "AAU.370_00.000: Hepatitis B vaccine (EVER)";
label variable shepdos  "AAU.380_00.000: # doses of hepatitis B vaccine received
";

label variable bldgv    "ADS.010_00.000: Donated blood since March 1985";
label variable bldg12m  "ADS.020_00.000: Donated blood past 12 months";
label variable hivtst   "ADS.040_00.000: Ever been tested for HIV";
label variable whytst_r "
ADS.050_00.000: Reason why you have not been tested for HIV/AIDS";
label variable tst12m_m "ADS.060_01.000: Month of last test for HIV";
label variable tst12m_y "ADS.060_02.000: Year of last test for HIV";
label variable timetst  "ADS.061_00.000: Time period of most recent HIV test";
label variable reatst_c "ADS.065_00.000: Main reason for last HIV test";
label variable reaswhor "ADS.066_00.000: Who suggested you should be tested";
label variable lastst_c "ADS.070_00.000: Location of last HIV test";
label variable clntyp_c "ADS.072_00.000: Type of clinic for last HIV test";
label variable whoadm   "ADS.074_00.000: Who administered the test";
label variable givnam   "ADS.080_00.000: Gave your first and last names";
label variable extst12m "ADS.110_00.000: HIV test in the next 12 months";
label variable chnsadsp "ADS.140_00.001.R01: Chances of getting AIDS virus";
label variable stmtru   "ADS.150_00.000: Are any of these statements true";
label variable std      "ADS.160_00.000: Had STD other than HIV/AIDS, past 5 yrs
";
label variable stddoc   "
ADS.170_00.000: Saw a doctor or other health professional";
label variable stdwher  "ADS.180_00.000: Place where checked";
label variable tbhrd    "ADS.200_00.000: Ever heard of tuberculosis";
label variable tbknow   "ADS.210_00.000: Ever personally known anyone who had TB
";
label variable tb       "ADS.220_00.000: How much do you know about TB";
label variable tbsprd1  "
ADS.230_01.000: Breathing air around person sick with TB";
label variable tbsprd2  "ADS.230_02.000: Sharing eating/drinking utensils";
label variable tbsprd3  "ADS.230_03.000: Through semen/vaginal secretions (sex)
";
label variable tbsprd4  "ADS.230_04.000: From smoking";
label variable tbsprd5  "ADS.230_05.000: From mosquito or other insect bites";
label variable tbsprd6  "ADS.230_06.000: Other";
label variable tbcured  "ADS.240_00.000: Can TB be cured?";
label variable tbchanc  "ADS.250_00.000: Chances of getting TB";
label variable tbshame  "ADS.260_00.000: Ashamed if you/family diagnosed with TB
";
label variable homeless "
ADS.270_00.000: Spent 24+ hrs living in street, shelter, jail/prison";

* DEFINE VALUE LABELS FOR REPORTS;

label define sap001x
   10               "10 Household"
   20               "20 Person"
   30               "30 Sample Adult"
   40               "40 Sample Child"
   60               "60 Family"
   70               "70 Injury/Poisoning Episode"
   75               "75 Injury/Poisoning Verbatim"
;
label define sap002x
   2004             "2004"
;
label define sap008x
   1                "1 Physical or mental condition prohibits responding"
   2                "2 Sample adult is able to respond"
   3                "3 Unknown"
;
label define sap009x
   1                "1 Yes"
   2                "2 No"
;
label define sap010x
   1                "1 Relative who lives in household"
   2                "2 Relative who doesn't live in household"
   3                "3 Other caregiver"
   4                "4 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap011x
   1                "1 Working for pay at a job or business"
   2                "2 With a job or business but not at work"
   3                "3 Looking for work"
   4                "4 Working, but not for pay, at a job or business"
   5                "5 Not working at a job or business and not looking for work
"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap012x
   01               "01 Taking care of house or family"
   02               "02 Going to school"
   03               "03 Retired"
   04               "04 On a planned vacation from work"
   05               "05 On family or maternity leave"
   06               "06 Temporarily unable to work for health reasons"
   07               "07 Have job/contract and off-season"
   08               "08 On layoff"
   09               "09 Disabled"
   10               "10 Other"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap013x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap022x
   1                "1 Employee of a PRIVATE company for wages"
   2                "2 A FEDERAL government employee"
   3                "3 A STATE government employee"
   4                "4 A LOCAL government employee"
   5                "
5 Self-employed in OWN business, professional practice or farm"
   6                "6 Working WITHOUT PAY in a family-owned business or farm"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap024x
   01               "01 1-9 employees"
   02               "02 10-24 employees"
   03               "03 25-49 employees"
   04               "04 50-99 employees"
   05               "05 100-249 employees"
   06               "06 250-499 employees"
   07               "07 500-999 employees"
   08               "08 1000 employees or more"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap025x
   00               "00 Less than 1 year"
   35               "35 35 or more years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap045x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap076x
   85               "85 85+ years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap106x
   1                "1 Yes"
   2                "2 No"
   3                "3 Borderline"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap108x
   00               "00 Within past year"
   85               "85 85+ years"
   96               "96 1+ year(s) with diabetes and age is 85+"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap147x
   1                "1 Good"
   2                "2 A little trouble"
   3                "3 A lot of trouble"
   4                "4 Deaf"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap151x
   1                "1 ALL of the time"
   2                "2 MOST of the time"
   3                "3 SOME of the time"
   4                "4 A LITTLE of the time"
   5                "5 NONE of the time"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap157x
   1                "1 A lot"
   2                "2 Some"
   3                "3 A little"
   4                "4 Not at all"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap158x
   0                "0 Had job last week"
   1                "1 No job last week, had job past 12 m"
   2                "2 No job last week, no job past 12 m"
   3                "3 Never worked"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap159x
   000              "000 None"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap161x
   1                "1 Better"
   2                "2 Worse"
   3                "3 About the same"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap163x
   0                "0 Not at all difficult"
   1                "1 Only a little difficult"
   2                "2 Somewhat difficult"
   3                "3 Very difficult"
   4                "4 Can't do at all"
   6                "6 Do not do this activity"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap175x
   1                "1 Limited in any way"
   2                "2 Not limited in any way"
   3                "3 Unknown if limited"
;
label define sap212x
   95               "95 95+"
   96               "96 Since birth"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap213x
   1                "1 Day(s)"
   2                "2 Week(s)"
   3                "3 Month(s)"
   4                "4 Year(s)"
   6                "6 Since birth"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap214x
   00               "00 Less than 1 year"
   85               "85 85+ years"
   96               "96 Unknown number of years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap215x
   1                "1 Less than 3 months"
   2                "2 3-5 months"
   3                "3 6-12 months"
   4                "4 More than 1 year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap216x
   1                "1 Chronic"
   2                "2 Not chronic"
   9                "9 Unknown if chronic"
;
label define sap392x
   1                "1 At least one chronic cond causes functl lim"
   2                "2 No chronic cond causes functl lim"
   9                "9 Unk if any chronic cond causes functl lim"
;
label define sap393x
   0                "0 Not limited in any way (incl unk if limited)"
   1                "1 Limited; caused by at least one chronic cond"
   2                "2 Limited; not caused by chronic cond"
   3                "3 Limited; unk if cond is chronic"
;
label define sap395x
   85               "85 85 years or older"
   96               "96 Never smoked regularly"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap396x
   1                "1 Every day"
   2                "2 Some days"
   3                "3 Not at all"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap397x
   1                "1 Current every day smoker"
   2                "2 Current some day smoker"
   3                "3 Former smoker"
   4                "4 Never smoker"
   5                "5 Smoker, current status unknown"
   9                "9 Unknown if ever smoked"
;
label define sap398x
   95               "95 95+"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap399x
   1                "1 Day(s)"
   2                "2 Week(s)"
   3                "3 Month(s)"
   4                "4 Year(s)"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap400x
   00               "00 Less than 1 year"
   70               "70 70+ years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap401x
   95               "95 95+ cigarettes"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap402x
   00               "00 None"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap406x
   000              "000 Never"
   996              "996 Unable to do this type activity"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap407x
   0                "0 Never"
   1                "1 Per day"
   2                "2 Per week"
   3                "3 Per month"
   4                "4 Per year"
   6                "6 Unable to do this activity"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap408x
   00               "00 Less than once per week"
   95               "95 Never"
   96               "96 Unable to do vigorous activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap409x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap410x
   1                "1 Minutes"
   2                "2 Hours"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap411x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap414x
   00               "00 Less than once per week"
   95               "95 Never"
   96               "96 Unable to do light or moderate activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap420x
   00               "00 Less than once per week"
   95               "95 Never"
   96               "96 Unable to do strength activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap423x
   000              "000 Never"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap424x
   0                "0 Never/None"
   1                "1 Week"
   2                "2 Month"
   3                "3 Year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap425x
   00               "00 Less than one day per week"
   95               "95 Did not drink in past year"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap426x
   000              "000 Never/none"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap427x
   95               "95 95+ drinks"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap428x
   01               "01 Lifetime abstainer"
   02               "02 Former infrequent"
   03               "03 Former regular"
   04               "04 Former, unknown frequency"
   05               "05 Current infrequent"
   06               "06 Current light"
   07               "07 Current moderate"
   08               "08 Current heavier"
   09               "09 Current drinker, frequency/level unknown"
   10               "10 Drinking status unknown"
;
label define sap429x
   000              "000 Never/None"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap430x
   0                "0 Never/None"
   1                "1 Per week"
   2                "2 Per month"
   3                "3 Per year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap432x
   96               "96 Not available"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap433x
   996              "996 Not available"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap435x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap436x
   1                "1 Yes"
   2                "2 There is NO place"
   3                "3 There is MORE THAN ONE place"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap437x
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
label define sap439x
   0                "0 Doesn't get preventive care anywhere"
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
label define sap451x
   0                "0 Never"
   1                "1 6 months or less"
   2                "2 More than 6 mos, but not more than 1 yr ago"
   3                "3 More than 1 yr, but not more than 2 yrs ago"
   4                "4 More than 2 yrs, but not more than 5 yrs ago"
   5                "5 More than 5 years ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap462x
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
label define sap464x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap465x
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
label define sap468x
   95               "95 95+ times"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap478x
   1                "1 Received at least 3 doses"
   2                "2 Received less than 3 doses"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap482x
   01               "01 It's unlikely you've been exposed to HIV"
   02               "
02 You were afraid to find out if you were HIV positive (that you had"
   03               "
03 You didn't want to think about HIV or about being HIV positive"
   04               "
04 You were worried your name would be reported to the government if y"
   05               "05 You didn't know where to get tested"
   06               "06 You don't like needles"
   07               "
07 You were afraid of losing job, insurance, housing, friends, family,"
   08               "08 Some other reason"
   09               "09 No particular reason"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap483x
   01               "01 January"
   02               "02 February"
   03               "03 March"
   04               "04 April"
   05               "05 May"
   06               "06 June"
   07               "07 July"
   08               "08 August"
   09               "09 September"
   10               "10 October"
   11               "11 November"
   12               "12 December"
   96               "96 Time period format"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap484x
   9996             "9996 Time period format"
   9997             "9997 Refused"
   9998             "9998 Not ascertained"
   9999             "9999 Don't know"
;
label define sap485x
   1                "1 6 months or less"
   2                "2 More than 6 months but not more than 1 year ago"
   3                "3 More than 1 year, but not more than 2 years ago"
   4                "4 More than 2 years, but not more than 5 years ago"
   5                "5 More than 5 years ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap486x
   01               "01 Someone suggested you should be tested"
   02               "02 You might have been exposed through sex or drug use"
   03               "03 You might have been exposed through your work or at work
"
   04               "04 You just wanted to find out if you were infected or not"
   05               "
05 For part of a routine medical check-up, or for hospitalization or s"
   06               "06 You were sick or had a medical problem"
   07               "07 You were pregnant or delivered a baby"
   08               "08 For health or life insurance coverage"
   09               "09 For military induction, separation, or military service"
   10               "10 For immigration"
   11               "11 For marriage license or to get married"
   12               "12 You were concerned you could give HIV to someone"
   13               "
13 You wanted medical care or new treatments if you tested positive"
   14               "14 Some other reason"
   15               "15 No particular reason"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap487x
   1                "1 Doctor, nurse or other health care professional"
   2                "2 Sex partner"
   3                "3 Someone at health department"
   4                "4 Family member or friend"
   5                "5 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap488x
   01               "01 Private doctor/HMO"
   02               "02 AIDS clinic/counseling/testing site"
   03               "03 Hospital, emergency room, outpatient clinic"
   04               "04 Other type of clinic"
   05               "05 Public health department"
   06               "06 At home"
   07               "07 Drug treatment facility"
   08               "08 Military induction or military service site"
   09               "09 Immigration site"
   10               "10 In a correctional facility (jail or prison)"
   11               "11 Other location"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap489x
   01               "01 Family planning clinic"
   02               "02 Prenatal clinic"
   03               "03 Tuberculosis clinic"
   04               "04 STD clinic"
   05               "05 Community health clinic"
   06               "06 Clinic run by employer or insurance company"
   07               "07 Other"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap490x
   1                "1 Nurse or health worker"
   2                "2 Self-sampling kit"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap493x
   1                "1 High/Already have HIV/AIDS"
   2                "2 Medium"
   3                "3 Low"
   4                "4 None"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap494x
   1                "1 Yes, at least one statement is true"
   2                "2 No, none of these statements are true"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap497x
   1                "1 Private doctor"
   2                "2 Family planning clinic"
   3                "3 STD clinic"
   4                "4 Emergency room"
   5                "5 Health department"
   6                "6 Some other place"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap500x
   1                "1 A lot"
   2                "2 Some"
   3                "3 A little"
   4                "4 Nothing"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap508x
   1                "1 High"
   2                "2 Medium"
   3                "3 Low"
   4                "4 None"
   5                "5 Already have TB"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   sap001x;   label values srvy_yr   sap002x;

label values proxysa   sap008x;   label values prox1     sap009x;
label values prox2     sap010x;

label values doinglwa  sap011x;   label values whynowka  sap012x;
label values everwrk   sap013x;   label values wrkcata   sap022x;
label values businc1a  sap013x;   label values locall1a  sap024x;
label values yrswrkpa  sap025x;   label values wrklongh  sap013x;
label values hourpda   sap013x;   label values pdsicka   sap013x;
label values onejob    sap013x;

label values hypev     sap013x;   label values hypdifv   sap013x;
label values chdev     sap013x;   label values angev     sap013x;
label values miev      sap013x;   label values hrtev     sap013x;
label values strev     sap013x;   label values ephev     sap013x;
label values aasmev    sap013x;   label values aasstill  sap013x;
label values aasmyr    sap013x;   label values aasmeryr  sap013x;
label values ulcev     sap013x;   label values ulcyr     sap013x;
label values canev     sap013x;   label values cnkind1   sap045x;
label values cnkind2   sap045x;   label values cnkind3   sap045x;
label values cnkind4   sap045x;   label values cnkind5   sap045x;
label values cnkind6   sap045x;   label values cnkind7   sap045x;
label values cnkind8   sap045x;   label values cnkind9   sap045x;
label values cnkind10  sap045x;   label values cnkind11  sap045x;
label values cnkind12  sap045x;   label values cnkind13  sap045x;
label values cnkind14  sap045x;   label values cnkind15  sap045x;
label values cnkind16  sap045x;   label values cnkind17  sap045x;
label values cnkind18  sap045x;   label values cnkind19  sap045x;
label values cnkind20  sap045x;   label values cnkind21  sap045x;
label values cnkind22  sap045x;   label values cnkind23  sap045x;
label values cnkind24  sap045x;   label values cnkind25  sap045x;
label values cnkind26  sap045x;   label values cnkind27  sap045x;
label values cnkind28  sap045x;   label values cnkind29  sap045x;
label values cnkind30  sap045x;   label values cnkind31  sap045x;
label values canage1   sap076x;   label values canage2   sap076x;
label values canage3   sap076x;   label values canage4   sap076x;
label values canage5   sap076x;   label values canage6   sap076x;
label values canage7   sap076x;   label values canage8   sap076x;
label values canage9   sap076x;   label values canage10  sap076x;
label values canage11  sap076x;   label values canage12  sap076x;
label values canage13  sap076x;   label values canage14  sap076x;
label values canage15  sap076x;   label values canage16  sap076x;
label values canage17  sap076x;   label values canage18  sap076x;
label values canage19  sap076x;   label values canage20  sap076x;
label values canage21  sap076x;   label values canage22  sap076x;
label values canage23  sap076x;   label values canage24  sap076x;
label values canage25  sap076x;   label values canage26  sap076x;
label values canage27  sap076x;   label values canage28  sap076x;
label values canage29  sap076x;   label values canage30  sap076x;
label values dibev     sap106x;   label values dibage    sap076x;
label values difage2   sap108x;   label values insln     sap013x;
label values dibpill   sap013x;   label values ahayfyr   sap013x;
label values sinyr     sap013x;   label values cbrchyr   sap013x;
label values kidwkyr   sap013x;   label values livyr     sap013x;
label values jntsymp   sap013x;   label values jmthp1    sap045x;
label values jmthp2    sap045x;   label values jmthp3    sap045x;
label values jmthp4    sap045x;   label values jmthp5    sap045x;
label values jmthp6    sap045x;   label values jmthp7    sap045x;
label values jmthp8    sap045x;   label values jmthp9    sap045x;
label values jmthp10   sap045x;   label values jmthp11   sap045x;
label values jmthp12   sap045x;   label values jmthp13   sap045x;
label values jmthp14   sap045x;   label values jmthp15   sap045x;
label values jmthp16   sap045x;   label values jmthp17   sap045x;
label values jntchr    sap013x;   label values jnthp     sap013x;
label values arth1     sap013x;   label values arthlmt   sap013x;
label values paineck   sap013x;   label values painlb    sap013x;
label values painleg   sap013x;   label values painface  sap013x;
label values amigr     sap013x;   label values acold2w   sap013x;
label values aintil2w  sap013x;   label values pregnow   sap013x;
label values hearaid   sap013x;   label values ahearst   sap147x;
label values avision   sap013x;   label values ablind    sap013x;
label values lupprt    sap013x;   label values sad       sap151x;
label values nervous   sap151x;   label values restless  sap151x;
label values hopeless  sap151x;   label values effort    sap151x;
label values worthls   sap151x;   label values mhamtmo   sap157x;

label values wrklyr3   sap158x;   label values wkdayr    sap159x;
label values beddayr   sap159x;   label values ahstatyr  sap161x;
label values speceq    sap013x;   label values flwalk    sap163x;
label values flclimb   sap163x;   label values flstand   sap163x;
label values flsit     sap163x;   label values flstoop   sap163x;
label values flreach   sap163x;   label values flgrasp   sap163x;
label values flcarry   sap163x;   label values flpush    sap163x;
label values flshop    sap163x;   label values flsocl    sap163x;
label values flrelax   sap163x;   label values fla1ar    sap175x;
label values aflhca1   sap045x;   label values aflhca2   sap045x;
label values aflhca3   sap045x;   label values aflhca4   sap045x;
label values aflhca5   sap045x;   label values aflhca6   sap045x;
label values aflhca7   sap045x;   label values aflhca8   sap045x;
label values aflhca9   sap045x;   label values aflhca10  sap045x;
label values aflhca11  sap045x;   label values aflhca12  sap045x;
label values aflhca13  sap045x;   label values aflhca14  sap045x;
label values aflhca15  sap045x;   label values aflhca16  sap045x;
label values aflhca17  sap045x;   label values aflhca18  sap045x;
label values aflhc19_  sap045x;   label values aflhc20_  sap045x;
label values aflhc21_  sap045x;   label values aflhc22_  sap045x;
label values aflhc23_  sap045x;   label values aflhc24_  sap045x;
label values aflhc25_  sap045x;   label values aflhc26_  sap045x;
label values aflhc27_  sap045x;   label values aflhc28_  sap045x;
label values aflhc29_  sap045x;   label values aflhc30_  sap045x;
label values aflhc31_  sap045x;   label values aflhc32_  sap045x;
label values aflhc33_  sap045x;   label values aflhc34_  sap045x;
label values aflhca90  sap045x;   label values aflhca91  sap045x;
label values altime1   sap212x;   label values alunit1   sap213x;
label values aldura1   sap214x;   label values aldurb1   sap215x;
label values alchrc1   sap216x;   label values altime2   sap212x;
label values alunit2   sap213x;   label values aldura2   sap214x;
label values aldurb2   sap215x;   label values alchrc2   sap216x;
label values altime3   sap212x;   label values alunit3   sap213x;
label values aldura3   sap214x;   label values aldurb3   sap215x;
label values alchrc3   sap216x;   label values altime4   sap212x;
label values alunit4   sap213x;   label values aldura4   sap214x;
label values aldurb4   sap215x;   label values alchrc4   sap216x;
label values altime5   sap212x;   label values alunit5   sap213x;
label values aldura5   sap214x;   label values aldurb5   sap215x;
label values alchrc5   sap216x;   label values altime6   sap212x;
label values alunit6   sap213x;   label values aldura6   sap214x;
label values aldurb6   sap215x;   label values alchrc6   sap216x;
label values altime7   sap212x;   label values alunit7   sap213x;
label values aldura7   sap214x;   label values aldurb7   sap215x;
label values alchrc7   sap216x;   label values altime8   sap212x;
label values alunit8   sap213x;   label values aldura8   sap214x;
label values aldurb8   sap215x;   label values alchrc8   sap216x;
label values altime9   sap212x;   label values alunit9   sap213x;
label values aldura9   sap214x;   label values aldurb9   sap215x;
label values alchrc9   sap216x;   label values altime10  sap212x;
label values alunit10  sap213x;   label values aldura10  sap214x;
label values aldurb10  sap215x;   label values alchrc10  sap216x;
label values altime11  sap212x;   label values alunit11  sap213x;
label values aldura11  sap214x;   label values aldurb11  sap215x;
label values alchrc11  sap216x;   label values altime12  sap212x;
label values alunit12  sap213x;   label values aldura12  sap214x;
label values aldurb12  sap215x;   label values alchrc12  sap216x;
label values altime13  sap212x;   label values alunit13  sap213x;
label values aldura13  sap214x;   label values aldurb13  sap215x;
label values alchrc13  sap216x;   label values altime14  sap212x;
label values alunit14  sap213x;   label values aldura14  sap214x;
label values aldurb14  sap215x;   label values alchrc14  sap216x;
label values altime15  sap212x;   label values alunit15  sap213x;
label values aldura15  sap214x;   label values aldurb15  sap215x;
label values alchrc15  sap216x;   label values altime16  sap212x;
label values alunit16  sap213x;   label values aldura16  sap214x;
label values aldurb16  sap215x;   label values alchrc16  sap216x;
label values altime17  sap212x;   label values alunit17  sap213x;
label values aldura17  sap214x;   label values aldurb17  sap215x;
label values alchrc17  sap216x;   label values altime18  sap212x;
label values alunit18  sap213x;   label values aldura18  sap214x;
label values aldurb18  sap215x;   label values alchrc18  sap216x;
label values altime19  sap212x;   label values alunit19  sap213x;
label values aldura19  sap214x;   label values aldurb19  sap215x;
label values alchrc19  sap216x;   label values altime20  sap212x;
label values alunit20  sap213x;   label values aldura20  sap214x;
label values aldurb20  sap215x;   label values alchrc20  sap216x;
label values altime21  sap212x;   label values alunit21  sap213x;
label values aldura21  sap214x;   label values aldurb21  sap215x;
label values alchrc21  sap216x;   label values altime22  sap212x;
label values alunit22  sap213x;   label values aldura22  sap214x;
label values aldurb22  sap215x;   label values alchrc22  sap216x;
label values altime23  sap212x;   label values alunit23  sap213x;
label values aldura23  sap214x;   label values aldurb23  sap215x;
label values alchrc23  sap216x;   label values altime24  sap212x;
label values alunit24  sap213x;   label values aldura24  sap214x;
label values aldurb24  sap215x;   label values alchrc24  sap216x;
label values altime25  sap212x;   label values alunit25  sap213x;
label values aldura25  sap214x;   label values aldurb25  sap215x;
label values alchrc25  sap216x;   label values altime26  sap212x;
label values alunit26  sap213x;   label values aldura26  sap214x;
label values aldurb26  sap215x;   label values alchrc26  sap216x;
label values altime27  sap212x;   label values alunit27  sap213x;
label values aldura27  sap214x;   label values aldurb27  sap215x;
label values alchrc27  sap216x;   label values altime28  sap212x;
label values alunit28  sap213x;   label values aldura28  sap214x;
label values aldurb28  sap215x;   label values alchrc28  sap216x;
label values altime29  sap212x;   label values alunit29  sap213x;
label values aldura29  sap214x;   label values aldurb29  sap215x;
label values alchrc29  sap216x;   label values altime30  sap212x;
label values alunit30  sap213x;   label values aldura30  sap214x;
label values aldurb30  sap215x;   label values alchrc30  sap216x;
label values altime31  sap212x;   label values alunit31  sap213x;
label values aldura31  sap214x;   label values aldurb31  sap215x;
label values alchrc31  sap216x;   label values altime32  sap212x;
label values alunit32  sap213x;   label values aldura32  sap214x;
label values aldurb32  sap215x;   label values alchrc32  sap216x;
label values altime33  sap212x;   label values alunit33  sap213x;
label values aldura33  sap214x;   label values aldurb33  sap215x;
label values alchrc33  sap216x;   label values altime34  sap212x;
label values alunit34  sap213x;   label values aldura34  sap214x;
label values aldurb34  sap215x;   label values alchrc34  sap216x;
label values altime90  sap212x;   label values alunit90  sap213x;
label values aldura90  sap214x;   label values aldurb90  sap215x;
label values alchrc90  sap216x;   label values altime91  sap212x;
label values alunit91  sap213x;   label values aldura91  sap214x;
label values aldurb91  sap215x;   label values alchrc91  sap216x;
label values alcndrt   sap392x;   label values alchronr  sap393x;

label values smkev     sap013x;   label values smkreg    sap395x;
label values smknow    sap396x;   label values smkstat2  sap397x;
label values smkqtno   sap398x;   label values smkqttp   sap399x;
label values smkqty    sap400x;   label values cigsda1   sap401x;
label values cigdamo   sap402x;   label values cigsda2   sap401x;
label values cigsday   sap401x;   label values cigqtyr   sap013x;
label values vigno     sap406x;   label values vigtp     sap407x;
label values vigfreqw  sap408x;   label values viglngno  sap409x;
label values viglngtp  sap410x;   label values vigmin    sap411x;
label values modno     sap406x;   label values modtp     sap407x;
label values modfreqw  sap414x;   label values modlngno  sap409x;
label values modlngtp  sap410x;   label values modmin    sap411x;
label values strngno   sap406x;   label values strngtp   sap407x;
label values strfreqw  sap420x;   label values alc1yr    sap013x;
label values alclife   sap013x;   label values alc12mno  sap423x;
label values alc12mtp  sap424x;   label values alc12mwk  sap425x;
label values alc12myr  sap426x;   label values alcamt    sap427x;
label values alcstat   sap428x;   label values alc5upno  sap429x;
label values alc5uptp  sap430x;   label values alc5upyr  sap426x;
label values aheight   sap432x;   label values aweightp  sap433x;
label values bmi       sap434x;   label values sleep     sap435x;

label values ausualpl  sap436x;   label values aplkind   sap437x;
label values ahcplrou  sap013x;   label values ahcplknd  sap439x;
label values ahcchgyr  sap013x;   label values ahcchghi  sap013x;
label values ahcdlyr1  sap013x;   label values ahcdlyr2  sap013x;
label values ahcdlyr3  sap013x;   label values ahcdlyr4  sap013x;
label values ahcdlyr5  sap013x;   label values ahcafyr1  sap013x;
label values ahcafyr2  sap013x;   label values ahcafyr3  sap013x;
label values ahcafyr4  sap013x;   label values adnlong2  sap451x;
label values ahcsyr1   sap013x;   label values ahcsyr2   sap013x;
label values ahcsyr3   sap013x;   label values ahcsyr4   sap013x;
label values ahcsyr5   sap013x;   label values ahcsyr6   sap013x;
label values ahcsyr7   sap013x;   label values ahcsyr8   sap013x;
label values ahcsyr9   sap013x;   label values ahcsyr10  sap013x;
label values ahernoy2  sap462x;   label values ahchyr    sap013x;
label values ahchmoyr  sap464x;   label values ahchnoy2  sap465x;
label values ahcnoyr2  sap462x;   label values asrgyr    sap013x;
label values asrgnoyr  sap468x;   label values amdlongr  sap451x;
label values shtfluyr  sap013x;   label values sprfluyr  sap013x;
label values shtpnuyr  sap013x;   label values apox      sap013x;
label values apox12mo  sap013x;   label values ahep      sap013x;
label values ahepliv   sap013x;   label values shthepb   sap013x;
label values shepdos   sap478x;

label values bldgv     sap013x;   label values bldg12m   sap013x;
label values hivtst    sap013x;   label values whytst_r  sap482x;
label values tst12m_m  sap483x;   label values tst12m_y  sap484x;
label values timetst   sap485x;   label values reatst_c  sap486x;
label values reaswhor  sap487x;   label values lastst_c  sap488x;
label values clntyp_c  sap489x;   label values whoadm    sap490x;
label values givnam    sap013x;   label values extst12m  sap013x;
label values chnsadsp  sap493x;   label values stmtru    sap494x;
label values std       sap013x;   label values stddoc    sap013x;
label values stdwher   sap497x;   label values tbhrd     sap013x;
label values tbknow    sap013x;   label values tb        sap500x;
label values tbsprd1   sap045x;   label values tbsprd2   sap045x;
label values tbsprd3   sap045x;   label values tbsprd4   sap045x;
label values tbsprd5   sap045x;   label values tbsprd6   sap045x;
label values tbcured   sap013x;   label values tbchanc   sap508x;
label values tbshame   sap013x;   label values homeless  sap013x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sa];
save "$OUT/2004/samadult", replace;

#delimit cr

* data file is stored in samadult.dta
* log  file is stored in samadult.log

log close
