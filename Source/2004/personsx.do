log using "$LOG/personsx.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 JULY 21, 2005 10:04 AM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2004 NHIS Public Use Person ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE PERSONSX.DTA AND PERSONSX.LOG
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2004\

 THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
 LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
 USER SHOULD ENTER THE FOLLOWING STATA COMMAND: log close
 
 THIS IS STORED IN PERSONSX.DO
*********************************************************************;
clear;
set mem 200m;

* INPUT ALL VARIABLES;

infix
      rectype       1 -   2      srvy_yr       3 -   6
 str  hhx           7 -  12 str  fmx          13 -  14
 str  fpx          15 -  16      wtia         17 -  22
      wtfa         23 -  28

      stratum      29 -  31      psu          32 -  32

      sex          33 -  33      origin_i     34 -  34
      origimpt     35 -  35      hispimpt     36 -  36
      hispan_i     37 -  38      racerpi2     39 -  40
      raceimp2     41 -  41      mracrpi2     42 -  43
      mracbpi2     44 -  45      racreci2     46 -  46
      hiscodi2     47 -  47      erimpflg     48 -  48
      nowaf        49 -  49      rrp          50 -  51
 str  hhreflg      52 -  52 str  dob_m        53 -  54
 str  dob_y_p      55 -  58      age_p        59 -  60

      frrp         61 -  62 str  fmrpflg      63 -  63
 str  fmreflg      64 -  64      r_maritl     65 -  65
      cohab1       66 -  66      cohab2       67 -  67
      cdcmstat     68 -  68      sib_deg      69 -  69
      fmother      70 -  71      mom_deg      72 -  72
      ffather      73 -  74      dad_deg      75 -  75
      parents      76 -  76      mom_ed       77 -  78
      dad_ed       79 -  80      astatflg     81 -  81
      cstatflg     82 -  82

      plaplylm     83 -  83      plaplyun     84 -  84
      pspedeis     85 -  85      pspedem      86 -  86
      plaadl       87 -  87      labath       88 -  88
      ladress      89 -  89      laeat        90 -  90
      labed        91 -  91      latoilt      92 -  92
      lahome       93 -  93      plaiadl      94 -  94
      plawknow     95 -  95      plawklim     96 -  96
      plawalk      97 -  97      plaremem     98 -  98
      plimany      99 -  99      la1ar       100 - 100
      lahcc1      101 - 101      lahcc2      102 - 102
      lahcc3      103 - 103      lahcc4      104 - 104
      lahcc5      105 - 105      lahcc6      106 - 106
      lahcc7      107 - 107      lahcc8      108 - 108
      lahcc9      109 - 109      lahcc10     110 - 110
      lahcc11     111 - 111      lahcc12     112 - 112
      lahcc13     113 - 113      lahcc90     114 - 114
      lahcc91     115 - 115      lctime1     116 - 117
      lcunit1     118 - 118      lcdura1     119 - 120
      lcdurb1     121 - 121      lcchrc1     122 - 122
      lctime2     123 - 124      lcunit2     125 - 125
      lcdura2     126 - 127      lcdurb2     128 - 128
      lcchrc2     129 - 129      lctime3     130 - 131
      lcunit3     132 - 132      lcdura3     133 - 134
      lcdurb3     135 - 135      lcchrc3     136 - 136
      lctime4     137 - 138      lcunit4     139 - 139
      lcdura4     140 - 141      lcdurb4     142 - 142
      lcchrc4     143 - 143      lctime5     144 - 145
      lcunit5     146 - 146      lcdura5     147 - 148
      lcdurb5     149 - 149      lcchrc5     150 - 150
      lctime6     151 - 152      lcunit6     153 - 153
      lcdura6     154 - 155      lcdurb6     156 - 156
      lcchrc6     157 - 157      lctime7     158 - 159
      lcunit7     160 - 160      lcdura7     161 - 162
      lcdurb7     163 - 163      lcchrc7     164 - 164
      lctime8     165 - 166      lcunit8     167 - 167
      lcdura8     168 - 169      lcdurb8     170 - 170
      lcchrc8     171 - 171      lctime9     172 - 173
      lcunit9     174 - 174      lcdura9     175 - 176
      lcdurb9     177 - 177      lcchrc9     178 - 178
      lctime10    179 - 180      lcunit10    181 - 181
      lcdura10    182 - 183      lcdurb10    184 - 184
      lcchrc10    185 - 185      lctime11    186 - 187
      lcunit11    188 - 188      lcdura11    189 - 190
      lcdurb11    191 - 191      lcchrc11    192 - 192
      lctime12    193 - 194      lcunit12    195 - 195
      lcdura12    196 - 197      lcdurb12    198 - 198
      lcchrc12    199 - 199      lctime13    200 - 201
      lcunit13    202 - 202      lcdura13    203 - 204
      lcdurb13    205 - 205      lcchrc13    206 - 206
      lctime90    207 - 208      lcunit90    209 - 209
      lcdura90    210 - 211      lcdurb90    212 - 212
      lcchrc90    213 - 213      lctime91    214 - 215
      lcunit91    216 - 216      lcdura91    217 - 218
      lcdurb91    219 - 219      lcchrc91    220 - 220
      lahca1      221 - 221      lahca2      222 - 222
      lahca3      223 - 223      lahca4      224 - 224
      lahca5      225 - 225      lahca6      226 - 226
      lahca7      227 - 227      lahca8      228 - 228
      lahca9      229 - 229      lahca10     230 - 230
      lahca11     231 - 231      lahca12     232 - 232
      lahca13     233 - 233      lahca14     234 - 234
      lahca15     235 - 235      lahca16     236 - 236
      lahca17     237 - 237      lahca18     238 - 238
      lahca19_    239 - 239      lahca20_    240 - 240
      lahca21_    241 - 241      lahca22_    242 - 242
      lahca23_    243 - 243      lahca24_    244 - 244
      lahca25_    245 - 245      lahca26_    246 - 246
      lahca27_    247 - 247      lahca28_    248 - 248
      lahca29_    249 - 249      lahca30_    250 - 250
      lahca31_    251 - 251      lahca32_    252 - 252
      lahca33_    253 - 253      lahca34_    254 - 254
      lahca90     255 - 255      lahca91     256 - 256
      latime1     257 - 258      launit1     259 - 259
      ladura1     260 - 261      ladurb1     262 - 262
      lachrc1     263 - 263      latime2     264 - 265
      launit2     266 - 266      ladura2     267 - 268
      ladurb2     269 - 269      lachrc2     270 - 270
      latime3     271 - 272      launit3     273 - 273
      ladura3     274 - 275      ladurb3     276 - 276
      lachrc3     277 - 277      latime4     278 - 279
      launit4     280 - 280      ladura4     281 - 282
      ladurb4     283 - 283      lachrc4     284 - 284
      latime5     285 - 286      launit5     287 - 287
      ladura5     288 - 289      ladurb5     290 - 290
      lachrc5     291 - 291      latime6     292 - 293
      launit6     294 - 294      ladura6     295 - 296
      ladurb6     297 - 297      lachrc6     298 - 298
      latime7     299 - 300      launit7     301 - 301
      ladura7     302 - 303      ladurb7     304 - 304
      lachrc7     305 - 305      latime8     306 - 307
      launit8     308 - 308      ladura8     309 - 310
      ladurb8     311 - 311      lachrc8     312 - 312
      latime9     313 - 314      launit9     315 - 315
      ladura9     316 - 317      ladurb9     318 - 318
      lachrc9     319 - 319      latime10    320 - 321
      launit10    322 - 322      ladura10    323 - 324
      ladurb10    325 - 325      lachrc10    326 - 326
      latime11    327 - 328      launit11    329 - 329
      ladura11    330 - 331      ladurb11    332 - 332
      lachrc11    333 - 333      latime12    334 - 335
      launit12    336 - 336      ladura12    337 - 338
      ladurb12    339 - 339      lachrc12    340 - 340
      latime13    341 - 342      launit13    343 - 343
      ladura13    344 - 345      ladurb13    346 - 346
      lachrc13    347 - 347      latime14    348 - 349
      launit14    350 - 350      ladura14    351 - 352
      ladurb14    353 - 353      lachrc14    354 - 354
      latime15    355 - 356      launit15    357 - 357
      ladura15    358 - 359      ladurb15    360 - 360
      lachrc15    361 - 361      latime16    362 - 363
      launit16    364 - 364      ladura16    365 - 366
      ladurb16    367 - 367      lachrc16    368 - 368
      latime17    369 - 370      launit17    371 - 371
      ladura17    372 - 373      ladurb17    374 - 374
      lachrc17    375 - 375      latime18    376 - 377
      launit18    378 - 378      ladura18    379 - 380
      ladurb18    381 - 381      lachrc18    382 - 382
      latime19    383 - 384      launit19    385 - 385
      ladura19    386 - 387      ladurb19    388 - 388
      lachrc19    389 - 389      latime20    390 - 391
      launit20    392 - 392      ladura20    393 - 394
      ladurb20    395 - 395      lachrc20    396 - 396
      latime21    397 - 398      launit21    399 - 399
      ladura21    400 - 401      ladurb21    402 - 402
      lachrc21    403 - 403      latime22    404 - 405
      launit22    406 - 406      ladura22    407 - 408
      ladurb22    409 - 409      lachrc22    410 - 410
      latime23    411 - 412      launit23    413 - 413
      ladura23    414 - 415      ladurb23    416 - 416
      lachrc23    417 - 417      latime24    418 - 419
      launit24    420 - 420      ladura24    421 - 422
      ladurb24    423 - 423      lachrc24    424 - 424
      latime25    425 - 426      launit25    427 - 427
      ladura25    428 - 429      ladurb25    430 - 430
      lachrc25    431 - 431      latime26    432 - 433
      launit26    434 - 434      ladura26    435 - 436
      ladurb26    437 - 437      lachrc26    438 - 438
      latime27    439 - 440      launit27    441 - 441
      ladura27    442 - 443      ladurb27    444 - 444
      lachrc27    445 - 445      latime28    446 - 447
      launit28    448 - 448      ladura28    449 - 450
      ladurb28    451 - 451      lachrc28    452 - 452
      latime29    453 - 454      launit29    455 - 455
      ladura29    456 - 457      ladurb29    458 - 458
      lachrc29    459 - 459      latime30    460 - 461
      launit30    462 - 462      ladura30    463 - 464
      ladurb30    465 - 465      lachrc30    466 - 466
      latime31    467 - 468      launit31    469 - 469
      ladura31    470 - 471      ladurb31    472 - 472
      lachrc31    473 - 473      latime32    474 - 475
      launit32    476 - 476      ladura32    477 - 478
      ladurb32    479 - 479      lachrc32    480 - 480
      latime33    481 - 482      launit33    483 - 483
      ladura33    484 - 485      ladurb33    486 - 486
      lachrc33    487 - 487      latime34    488 - 489
      launit34    490 - 490      ladura34    491 - 492
      ladurb34    493 - 493      lachrc34    494 - 494
      latime90    495 - 496      launit90    497 - 497
      ladura90    498 - 499      ladurb90    500 - 500
      lachrc90    501 - 501      latime91    502 - 503
      launit91    504 - 504      ladura91    505 - 506
      ladurb91    507 - 507      lachrc91    508 - 508
      lcondrt     509 - 509      lachronr    510 - 510
      phstat      511 - 511

      pdmed12m    512 - 512      pnmed12m    513 - 513
      phospyr     514 - 514      hospno      515 - 517
      hpnite      518 - 520      phchm2w     521 - 521
      phchmn2w    522 - 523      phcph2wr    524 - 524
      phcphn2w    525 - 526      phcdv2w     527 - 527
      phcdvn2w    528 - 529      p10dvyr     530 - 530

      notcov      531 - 531      medicare    532 - 532
      mcpart      533 - 533      mcchoice    534 - 534
      mchmo       535 - 535      mcnamen     536 - 537
      mcref       538 - 538      mcpaypre    539 - 539
      mcrxcard    540 - 540      medicaid    541 - 541
      machmd      542 - 542      mapcmd      543 - 543
      maref       544 - 544      single      545 - 545
      sstypea     546 - 546      sstypeb     547 - 547
      sstypec     548 - 548      sstyped     549 - 549
      sstypee     550 - 550      sstypef     551 - 551
      sstypeg     552 - 552      sstypeh     553 - 553
      sstypei     554 - 554      sstypej     555 - 555
      sstypek     556 - 556      sstypel     557 - 557
      private     558 - 558      hitype1     559 - 560
      whonam1     561 - 561      plnwrkn1    562 - 563
      plnpay11    564 - 564      plnpay21    565 - 565
      plnpay31    566 - 566      plnpay41    567 - 567
      plnpay51    568 - 568      plnpay61    569 - 569
      plnpay71    570 - 570      hicostr1    571 - 575
      plnmgd1     576 - 576      mgchmd1     577 - 577
      mgprmd1     578 - 578      mgpymd1     579 - 579
      mgpref1     580 - 580      prrxcov1    581 - 581
      hitype2     582 - 583      whonam2     584 - 584
      plnwrkn2    585 - 586      plnpay12    587 - 587
      plnpay22    588 - 588      plnpay32    589 - 589
      plnpay42    590 - 590      plnpay52    591 - 591
      plnpay62    592 - 592      plnpay72    593 - 593
      hicostr2    594 - 598      plnmgd2     599 - 599
      mgchmd2     600 - 600      mgprmd2     601 - 601
      mgpymd2     602 - 602      mgpref2     603 - 603
      prrxcov2    604 - 604      prplplus    605 - 605
      schip       606 - 606      stdoc1      607 - 607
      stpcmd1     608 - 608      stref1      609 - 609
      otherpub    610 - 610      stdoc2      611 - 611
      stpcmd2     612 - 612      stref2      613 - 613
      othergov    614 - 614      stdoc3      615 - 615
      stpcmd3     616 - 616      stref3      617 - 617
      military    618 - 618      milspc1     619 - 619
      milspc2     620 - 620      milspc3     621 - 621
      milspc4     622 - 622      milman      623 - 623
      ihs         624 - 624      hilast      625 - 625
      histop1     626 - 626      histop2     627 - 627
      histop3     628 - 628      histop4     629 - 629
      histop5     630 - 630      histop6     631 - 631
      histop7     632 - 632      histop8     633 - 633
      histop9     634 - 634      histop10    635 - 635
      histop11    636 - 636      histop12    637 - 637
      histop13    638 - 638      histop14    639 - 639
      histop15    640 - 640      hinotyr     641 - 641
      hinotmyr    642 - 643      hcspfyr     644 - 644
      hikinda     645 - 645      hikindb     646 - 646
      hikindc     647 - 647      hikindd     648 - 648
      hikinde     649 - 649      hikindf     650 - 650
      hikindg     651 - 651      hikindh     652 - 652
      hikindi     653 - 653      hikindj     654 - 654
      hikindk     655 - 655      mcareprb    656 - 656
      mcaidprb    657 - 657      sincov      658 - 658

      plborn      659 - 659      regionbr    660 - 661
      geobrth     662 - 662      yrsinus     663 - 663
      citizenp    664 - 664      headst      665 - 665
      headstv1    666 - 666      educ1       667 - 668
      pmiltry     669 - 669      doinglwp    670 - 670
      whynowkp    671 - 672      wrkhrs2     673 - 674
      wrkftall    675 - 675      wrklyr1     676 - 676
      wrkmyr      677 - 678      ernyr_p     679 - 680
      hiempof     681 - 681

      psal        682 - 682      pseinc      683 - 683
      pssrr       684 - 684      pssrrdb     685 - 685
      pssrrd      686 - 686      ppens       687 - 687
      popens      688 - 688      pssi        689 - 689
      pssid       690 - 690      ptanf       691 - 691
      powben      692 - 692      pintrstr    693 - 693
      pdivd       694 - 694      pchldsp     695 - 695
      pincot      696 - 696      pssapl      697 - 697
      psdapl      698 - 698      tanfmyr     699 - 700
      pfstp       701 - 701      fstpmyr     702 - 703
      eligpwic    704 - 704      pwic        705 - 705
      wic_flag    706 - 706

using "$DAT/2004/personsx.dat";
replace wtia = wtia/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: Household Serial Number";
label variable fmx      "IDN.000_35.000: Family #";
label variable fpx      "IDN.000_40.000: Person #";
label variable wtia     "IDN.000_65.000: Weight - Interim Annual";
label variable wtfa     "IDN.000_70.000: Weight - Final Annual";

label variable stratum  "UCF.000_00.000.R18: Stratum for variance estimation";
label variable psu      "UCF.000_00.000.R19: PSU for variance estimation";

label variable sex      "HHC.110_00.000: Sex";
label variable origin_i "HHC.170_00.000.R01: Hispanic Ethnicity";
label variable origimpt "HHC.170_00.000.R02: Hispanic Origin Imputation Flag";
label variable hispimpt "
HHC.170_00.000.R04: Type of Hispanic Origin Imputation Flag";
label variable hispan_i "HHC.180_00.000.R03: Hispanic subgroup detail";
label variable racerpi2 "HHC.200_01.000.R13: OMB groups w/multiple race";
label variable raceimp2 "HHC.200_01.000.R18: Race Imputation Flag";
label variable mracrpi2 "
HHC.200_01.000.R21: Race coded to single/multiple race group";
label variable mracbpi2 "
HHC.200_01.000.R22: Race coded to single/multiple race group";
label variable racreci2 "HHC.200_01.000.R23: Race Recode";
label variable hiscodi2 "HHC.200_01.000.R24: Race/ethnicity recode";
label variable erimpflg "HHC.200_01.000.R25: Ethnicity/Race Imputation Flag";
label variable nowaf    "HHC.230_03.000: Armed Forces Status";
label variable rrp      "HHC.260_01.000: Relationship to the HH reference person
";
label variable hhreflg  "HHC.260_01.000.R01: HH Reference Person Flag";
label variable dob_m    "HHC.405_00.000: Month of Birth";
label variable dob_y_p  "HHC.415_00.000.R01: Year of Birth";
label variable age_p    "HHC.420_00.000.R01: Age";

label variable frrp     "FID.060_00.000: Relationship to family ref. Person";
label variable fmrpflg  "FID.060_00.000.R01: Family Respondent Flag";
label variable fmreflg  "FID.060_00.000.R02: Family Reference Person Flag";
label variable r_maritl "FID.250_00.000: Marital Status";
label variable cohab1   "FID.280_00.000: Cohabiting person ever married";
label variable cohab2   "
FID.290_00.000: Cohabiting person's current marital status";
label variable cdcmstat "
FID.300_00.000.R01: CDC standard for legal marital status";
label variable sib_deg  "FID.300_00.000.R02: Degree of sib rel to HH ref person
";
label variable fmother  "FID.326_00.000: Person # of mother";
label variable mom_deg  "FID.330_01.000.R01: Type of relationship with Mother";
label variable ffather  "FID.340_00.000: Person # of father";
label variable dad_deg  "FID.350_01.000.R01: Type of relationship with Father";
label variable parents  "FID.360_01.000.R01: Parent(s) present in the family";
label variable mom_ed   "FID.360_01.000.R02: Education of Mother";
label variable dad_ed   "FID.360_01.000.R03: Education of Father";
label variable astatflg "FID.360_01.000.R04: Sample Adult Flag";
label variable cstatflg "FID.360_01.000.R05: Sample Child Flag";

label variable plaplylm "FHS.010_00.000: Is - - limited in kind/amt play?";
label variable plaplyun "FHS.020_00.000: Is - - able to play at all?";
label variable pspedeis "FHS.060_00.000: Does - - receive Special Ed or EIS";
label variable pspedem  "
FHS.065_00.000: Receive Special Ed/EIS due to emotional/behavioral problem";
label variable plaadl   "FHS.080_00.000: Does - - need help with personal care?
";
label variable labath   "
FHS.090_01.000: Does - -  need help with bathing/showering?";
label variable ladress  "FHS.090_02.000: Does - -  need help dressing?";
label variable laeat    "FHS.090_03.000: Does - -  need help eating?";
label variable labed    "
FHS.090_04.000: Does - -  need help in/out of bed or chairs?";
label variable latoilt  "FHS.090_05.000: Does - -  need help using the toilet?";
label variable lahome   "
FHS.090_06.000: Does - -  need help to get around in the home?";
label variable plaiadl  "FHS.160_00.000: Does - - need help with routine needs?
";
label variable plawknow "
FHS.180_00.000: Is - - unable to work due to health problem?";
label variable plawklim "FHS.200_00.000: Is - - limited kind/amount of work?";
label variable plawalk  "
FHS.220_00.000: Does - - have difficulty walk w/o equip?";
label variable plaremem "
FHS.240_00.000: Is - - limited by difficulty remembering?";
label variable plimany  "FHS.260_00.000: Is - - limited in any (other) way?";
label variable la1ar    "
FHS.260_00.000.R01: Any limitation - all persons, all conds";
label variable lahcc1   "FHS.270_01.000: Vision problem causes limitation";
label variable lahcc2   "FHS.270_02.000: Hearing problem causes limitation";
label variable lahcc3   "FHS.270_03.000: Speech problem causes limitation";
label variable lahcc4   "
FHS.270_04.000: Asthma/breathing problem causes limitation";
label variable lahcc5   "FHS.270_05.000: Birth defect causes limitation";
label variable lahcc6   "FHS.270_06.000: Injury causes limitation";
label variable lahcc7   "FHS.270_07.000: Mental retardation causes limitation";
label variable lahcc8   "FHS.270_08.000: Other dev problem causes limitation";
label variable lahcc9   "
FHS.270_09.000: Other emot/behav problem causes limitation";
label variable lahcc10  "
FHS.270_10.000: Bone/joint/muscle problem causes limitation";
label variable lahcc11  "FHS.270_11.000: Epilepsy/seizures causes limitation";
label variable lahcc12  "FHS.270_12.000: Learning disability causes  limitation
";
label variable lahcc13  "FHS.270_13.000: ADD/ADHD causes limitation";
label variable lahcc90  "
FHS.270_90.000: Other impair/problem (1) causes limitation";
label variable lahcc91  "
FHS.270_91.000: Other impair/problem (2) causes limitation";
label variable lctime1  "
FHS.280_01.000: Duration of vision problem: Number of units";
label variable lcunit1  "FHS.280_02.000: Duration of vision problem: Time unit";
label variable lcdura1  "
FHS.280_02.000.R01: Duration of vision problem (in years)";
label variable lcdurb1  "FHS.280_02.000.R02: Duration of vision problem recode 2
";
label variable lcchrc1  "FHS.280_02.000.R03: Vision problem condition status";
label variable lctime2  "
FHS.282_01.000: Duration of hearing problem: Number of units";
label variable lcunit2  "FHS.282_02.000: Duration of hearing problem: Time unit
";
label variable lcdura2  "
FHS.282_02.000.R01: Duration of hearing problem (in years)";
label variable lcdurb2  "
FHS.282_02.000.R02: Duration of hearing problem recode 2";
label variable lcchrc2  "FHS.282_02.000.R03: Hearing problem condition status";
label variable lctime3  "
FHS.284_01.000: Duration of speech problem: Number of units";
label variable lcunit3  "FHS.284_02.000: Duration of speech problem: Time unit";
label variable lcdura3  "
FHS.284_02.000.R01: Duration of speech problem (in years)";
label variable lcdurb3  "FHS.284_02.000.R02: Duration of speech problem recode 2
";
label variable lcchrc3  "FHS.284_02.000.R03: Speech problem condition status";
label variable lctime4  "
FHS.286_01.000: Duration of asthma/breathing problem: Number of units";
label variable lcunit4  "
FHS.286_02.000: Duration of asthma/breathing problem: Time unit";
label variable lcdura4  "
FHS.286_02.000.R01: Duration of asthma/breathing problem (in years)";
label variable lcdurb4  "
FHS.286_02.000.R02: Duration of asthma/breathing problem recode 2";
label variable lcchrc4  "
FHS.286_02.000.R03: Asthma/breathing problem condition status";
label variable lctime5  "
FHS.287_01.000: Duration of birth defect: Number of units";
label variable lcunit5  "FHS.287_02.000: Duration of birth defect: Time unit";
label variable lcdura5  "FHS.287_02.000.R01: Duration of birth defect (in years)
";
label variable lcdurb5  "FHS.287_02.000.R02: Duration of birth defect recode 2";
label variable lcchrc5  "FHS.287_02.000.R03: Birth defect condition status";
label variable lctime6  "FHS.288_01.000: Duration of injury: Number of units";
label variable lcunit6  "FHS.288_02.000: Duration of injury: Time unit";
label variable lcdura6  "FHS.288_02.000.R01: Duration of injury (in years)";
label variable lcdurb6  "FHS.288_02.000.R02: Duration of injury recode 2";
label variable lcchrc6  "FHS.288_02.000.R03: Injury condition status";
label variable lctime7  "
FHS.290_01.000: Duration of mental retardation: Number of units";
label variable lcunit7  "
FHS.290_02.000: Duration of mental retardation: Time unit";
label variable lcdura7  "
FHS.290_02.000.R01: Duration of mental retardation (in years)";
label variable lcdurb7  "
FHS.290_02.000.R02: Duration of mental retardation recode 2";
label variable lcchrc7  "FHS.290_02.000.R03: Mental retardation condition status
";
label variable lctime8  "
FHS.292_01.000: Duration of other developmental problem: Number of units";
label variable lcunit8  "
FHS.292_02.000: Duration of other developmental problem: Time unit";
label variable lcdura8  "
FHS.292_02.000.R01: Duration of other developmental problem (in years)";
label variable lcdurb8  "
FHS.292_02.000.R02: Duration of other developmental problem recode 2";
label variable lcchrc8  "
FHS.292_02.000.R03: Other developmental problem condition status";
label variable lctime9  "
FHS.294_01.000: Duration of other mental/emot/behav problem: Number of units";
label variable lcunit9  "
FHS.294_02.000: Duration of otr ment/emot/behav problem: Number of units";
label variable lcdura9  "
FHS.294_02.000.R01: Duration of other mental/emot/behav problem (in years)";
label variable lcdurb9  "
FHS.294_02.000.R02: Duration of other mental/emotional/behavioral prob recode 2
";
label variable lcchrc9  "
FHS.294_02.000.R03: Other mental/emotional/behavioral problem condition status";
label variable lctime10 "
FHS.296_01.000: Duration of bone/joint/muscle problem: Number of units";
label variable lcunit10 "
FHS.296_02.000: Duration of bone/joint/muscle problem: Time unit";
label variable lcdura10 "
FHS.296_02.000.R01: Duration of bone/joint/muscle problem (in years)";
label variable lcdurb10 "
FHS.296_02.000.R02: Duration of bone/joint/muscle problem recode 2";
label variable lcchrc10 "
FHS.296_02.000.R03: Bone/joint/muscle problem condition status";
label variable lctime11 "
FHS.298_01.000: Duration of epilepsy/seizures: Number of units";
label variable lcunit11 "
FHS.298_02.000: Duration of epilepsy/seizures: Time unit";
label variable lcdura11 "
FHS.298_02.000.R01: Duration of epilepsy/seizures (in years)";
label variable lcdurb11 "
FHS.298_02.000.R02: Duration of epilepsy/seizures recode 2";
label variable lcchrc11 "FHS.298_02.000.R03: Epilepsy/seizures condition status
";
label variable lctime12 "
FHS.300_01.000: Duration of learning disability: Number of units";
label variable lcunit12 "
FHS.300_02.000: Duration of learning disability: Time unit";
label variable lcdura12 "
FHS.300_02.000.R01: Duration of learning disability (in years)";
label variable lcdurb12 "
FHS.300_02.000.R02: Duration of learning disability recode 2";
label variable lcchrc12 "
FHS.300_02.000.R03: Learning disability condition status";
label variable lctime13 "FHS.302_01.000: Duration of ADD/ADHD: Number of units";
label variable lcunit13 "FHS.302_02.000: Duration of ADD/ADHD: Time unit";
label variable lcdura13 "FHS.302_02.000.R01: Duration of ADD/ADHD (in years)";
label variable lcdurb13 "FHS.302_02.000.R02: Duration of ADD/ADHD recode 2";
label variable lcchrc13 "FHS.302_02.000.R03: ADD/ADHD condition status";
label variable lctime90 "
FHS.304_01.000: Duration of other impairment problem (1): Number of units";
label variable lcunit90 "
FHS.304_02.000: Duration of other impairment/problem (1): Time unit";
label variable lcdura90 "
FHS.304_02.000.R01: Duration of other impairment/problem (1) (in years)";
label variable lcdurb90 "
FHS.304_02.000.R02: Duration of other impairment/problem (1) recode 2";
label variable lcchrc90 "
FHS.304_02.000.R03: Other impairment/problem (1) condition status";
label variable lctime91 "
FHS.306_01.000: Duration of other impairment/problem (2): Number of units";
label variable lcunit91 "
FHS.306_02.000: Duration of other impairment/problem (2): Time unit";
label variable lcdura91 "
FHS.306_02.000.R01: Duration of other impairment/problem (2) (in years)";
label variable lcdurb91 "
FHS.306_02.000.R02: Duration of other impairment/problem (2) recode 2";
label variable lcchrc91 "
FHS.306_02.000.R03: Other impairment/problem (2) condition status";
label variable lahca1   "FHS.350_01.000: Vision problem causes limitation";
label variable lahca2   "FHS.350_02.000: Hearing problem causes limitation";
label variable lahca3   "FHS.350_03.000: Arthritis/rheumatism causes limitation
";
label variable lahca4   "FHS.350_04.000: Back/neck prob causes limitation";
label variable lahca5   "
FHS.350_05.000: fracture/bone/joint inj causes limitation";
label variable lahca6   "FHS.350_06.000: Other injury causes limitation";
label variable lahca7   "FHS.350_07.000: Heart problem causes limitation";
label variable lahca8   "FHS.350_08.000: Stroke causes limitation";
label variable lahca9   "FHS.350_09.000: Hypertension causes limitation";
label variable lahca10  "FHS.350_10.000: Diabetes causes limitation";
label variable lahca11  "FHS.350_11.000: Lung/breath problem causes limitation";
label variable lahca12  "FHS.350_12.000: Cancer causes limitation";
label variable lahca13  "FHS.350_13.000: Birth defect causes limitation";
label variable lahca14  "FHS.350_14.000: Mental retardation causes limitation";
label variable lahca15  "FHS.350_15.000: Otr dev problem causes limitation";
label variable lahca16  "FHS.350_16.000: Senility causes limitation";
label variable lahca17  "FHS.350_17.000: Dep/anx/emot problem causes limitation
";
label variable lahca18  "FHS.350_18.000: Weight problem causes limitation";
label variable lahca19_ "
FHS.350_18.000.R01: Missing or amputated limb/finger/digit";
label variable lahca20_ "
FHS.350_18.000.R02: Musculoskeletal/connective tissue problem";
label variable lahca21_ "FHS.350_18.000.R03: Circulation problem";
label variable lahca22_ "
FHS.350_18.000.R04: Endocrine/nutritional/metabolic problem";
label variable lahca23_ "
FHS.350_18.000.R05: Nervous system/sensory organ condition";
label variable lahca24_ "FHS.350_18.000.R06: Digestive system problem";
label variable lahca25_ "FHS.350_18.000.R07: Genitourinary system problem";
label variable lahca26_ "FHS.350_18.000.R08: Skin/subcutaneous system problem";
label variable lahca27_ "
FHS.350_18.000.R09: Blood or blood-forming organ problem";
label variable lahca28_ "FHS.350_18.000.R10: Benign tumor/cyst";
label variable lahca29_ "
FHS.350_18.000.R11: Alcohol/drug/substance abuse problem";
label variable lahca30_ "
FHS.350_18.000.R12: Otr mental problem/ADD/bipolar/schizophrenia";
label variable lahca31_ "
FHS.350_18.000.R13: Surgical after-effects/medical treatment";
label variable lahca33_ "FHS.350_18.000.R15: Fatigue/tiredness/weakness";
label variable lahca34_ "FHS.350_18.000.R16: Pregnancy-related problem";
label variable lahca90  "
FHS.350_90.000.R17: Other impair/problem(1) causes limitation";
label variable lahca91  "
FHS.350_91.000.R18: Other impair/problem(2) causes limitation";
label variable latime1  "
FHS.360_01.000: Duration of vision problem: Number of units";
label variable launit1  "FHS.360_02.000: Duration of vision problem: Time unit";
label variable ladura1  "
FHS.360_02.000.R01: Duration of vision problem (in years)";
label variable ladurb1  "FHS.360_02.000.R02: Duration of vision problem recode 2
";
label variable lachrc1  "FHS.360_02.000.R03: Vision problem condition status";
label variable latime2  "
FHS.362_01.000: Duration of hearing problem: Number of units";
label variable launit2  "FHS.362_02.000: Duration of hearing problem: Time unit
";
label variable ladura2  "
FHS.362_02.000.R01: Duration of hearing problem (in years)";
label variable ladurb2  "
FHS.362_02.000.R02: Duration of hearing problem recode 2";
label variable lachrc2  "FHS.362_02.000.R03: Hearing problem condition status";
label variable latime3  "
FHS.364_01.000: Duration of arthritis/rheumatism: Number of units";
label variable launit3  "
FHS.364_02.000: Duration of arthritis/rheumatism: Time unit";
label variable ladura3  "
FHS.364_02.000.R01: Duration of arthritis/rheumatism (in years)";
label variable ladurb3  "
FHS.364_02.000.R02: Duration of arthritis/rheumatism recode 2";
label variable lachrc3  "
FHS.364_02.000.R03: Arthritis/rheumatism condition status";
label variable latime4  "
FHS.366_01.000: Duration of back/neck problem: Number of units";
label variable launit4  "
FHS.366_02.000: Duration of back/neck problem: Time unit";
label variable ladura4  "
FHS.366_02.000.R01: Duration of back/neck problem (in years)";
label variable ladurb4  "
FHS.366_02.000.R02: Duration of back/neck problem recode 2";
label variable lachrc4  "FHS.366_02.000.R03: Back/neck problem condition status
";
label variable latime5  "
FHS.368_01.000: Duration of fracture/bone/joint injury: Number of units";
label variable launit5  "
FHS.368_02.000: Duration of fracture/bone/joint injury: Time unit";
label variable ladura5  "
FHS.368_02.000.R01: Duration of fracture/bone/joint injury (in years)";
label variable ladurb5  "
FHS.368_02.000.R02: Duration of fracture/bone/joint injury recode 2";
label variable lachrc5  "
FHS.368_02.000.R03: Fracture/bone/joint injury condition status";
label variable latime6  "
FHS.370_01.000: Duration of other injury: Number of units";
label variable launit6  "FHS.370_02.000: Duration of other injury: Time unit";
label variable ladura6  "FHS.370_02.000.R01: Duration of other injury (in years)
";
label variable ladurb6  "FHS.370_02.000.R02: Duration of other injury recode 2";
label variable lachrc6  "FHS.370_02.000.R03: Other injury condition status";
label variable latime7  "
FHS.372_01.000: Duration of heart problem: Number of units";
label variable launit7  "FHS.372_02.000: Duration of heart problem: Time unit";
label variable ladura7  "
FHS.372_02.000.R01: Duration of heart problem (in years)";
label variable ladurb7  "FHS.372_02.000.R02: Duration of heart problem recode 2
";
label variable lachrc7  "FHS.372_02.000.R03: Heart problem condition status";
label variable latime8  "FHS.374_01.000: Duration of stroke: Number of units";
label variable launit8  "FHS.374_02.000: Duration of stroke: Time unit";
label variable ladura8  "FHS.374_02.000.R01: Duration of stroke (in years)";
label variable ladurb8  "FHS.374_02.000.R02: Duration of stroke recode 2";
label variable lachrc8  "FHS.374_02.000.R03: Stroke condition status";
label variable latime9  "
FHS.376_01.000: Duration of hypertension: Number of units";
label variable launit9  "FHS.376_02.000: Duration of hypertension: Time unit";
label variable ladura9  "FHS.376_02.000.R01: Duration of hypertension (in years)
";
label variable ladurb9  "FHS.376_02.000.R02: Duration of hypertension recode 2";
label variable lachrc9  "FHS.376_02.000.R03: Hypertension condition status";
label variable latime10 "FHS.378_01.000: Duration of diabetes: Number of units";
label variable launit10 "FHS.378_02.000: Duration of diabetes: Time unit";
label variable ladura10 "FHS.378_02.000.R01: Duration of diabetes (in years)";
label variable ladurb10 "FHS.378_02.000.R02: Duration of diabetes recode 2";
label variable lachrc10 "FHS.378_02.000.R03: Diabetes condition status";
label variable latime11 "
FHS.380_01.000: Duration of lung/breathing problem: Number of units";
label variable launit11 "
FHS.380_02.000: Duration of lung/breath problem: Time unit";
label variable ladura11 "
FHS.380_02.000.R01: Duration of lung/breathing problem (in years)";
label variable ladurb11 "
FHS.380_02.000.R02: Duration of lung/breathing problem recode 2";
label variable lachrc11 "
FHS.380_02.000.R03: Lung/breathing problem condition status";
label variable latime12 "FHS.382_01.000: Duration of cancer: Number of units";
label variable launit12 "FHS.382_02.000: Duration of cancer: Time unit";
label variable ladura12 "FHS.382_02.000.R01: Duration of cancer (in years)";
label variable ladurb12 "FHS.382_02.000.R02: Duration of cancer recode 2";
label variable lachrc12 "FHS.382_02.000.R03: Cancer condition status";
label variable latime13 "
FHS.383_01.000: Duration of birth defect: Number of units";
label variable launit13 "FHS.383_02.000: Duration of birth defect: Time unit";
label variable ladura13 "FHS.383_02.000.R01: Duration of birth defect (in years)
";
label variable ladurb13 "FHS.383_02.000.R02: Duration of birth defect recode 2";
label variable lachrc13 "FHS.383_02.000.R03: Birth defect condition status";
label variable latime14 "
FHS.384_01.000: Duration of ment retardation: Number of units";
label variable launit14 "FHS.384_02.000: Duration of ment retardation: Time unit
";
label variable ladura14 "
FHS.384_02.000.R01: Duration of mental retardation (in years)";
label variable ladurb14 "
FHS.384_02.000.R02: Duration of mental retardation recode 2";
label variable lachrc14 "FHS.384_02.000.R03: Mental retardation condition status
";
label variable latime15 "
FHS.386_01.000: Duration of other developmental problem: Number of units";
label variable launit15 "FHS.386_02.000: Duration of otr dev problem: Time unit
";
label variable ladura15 "
FHS.386_02.000.R01: Duration of other developmental problem (in years)";
label variable ladurb15 "
FHS.386_02.000.R02: Duration of other developmental problem recode 2";
label variable lachrc15 "
FHS.386_02.000.R03: Other developmental problem condition status";
label variable latime16 "FHS.388_01.000: Duration of senility: Number of units";
label variable launit16 "FHS.388_02.000: Duration of senility: Time unit";
label variable ladura16 "FHS.388_02.000.R01: Duration of senility (in years)";
label variable ladurb16 "FHS.388_02.000.R02: Duration of senility recode 2";
label variable lachrc16 "FHS.388_02.000.R03: Senility condition status";
label variable latime17 "
FHS.390_01.000: Duration of dep/anx/emot problem: Number of units";
label variable launit17 "
FHS.390_02.000: Duration of dep/anx/emot problem: Time unit";
label variable ladura17 "
FHS.390_02.000.R01: Duration of depression/anxiety/emotional problem (in years)
";
label variable ladurb17 "
FHS.390_02.000.R02: Duration of depression/anxiety/emotional problem recode 2";
label variable lachrc17 "
FHS.390_02.000.R03: Depression/anxiety/emotional problem condition status";
label variable latime18 "
FHS.392_01.000: Duration of weight problem: Number of units";
label variable launit18 "FHS.392_02.000: Duration of weight problem: Time unit";
label variable ladura18 "
FHS.392_02.000.R01: Duration of weight problem (in years)";
label variable ladurb18 "FHS.392_02.000.R02: Duration of weight problem recode 2
";
label variable lachrc18 "FHS.392_02.000.R03: Weight problem condition status";
label variable latime19 "
FHS.394_01.000: Duration of missing limb/amputation: Number of units";
label variable launit19 "
FHS.394_02.000: Duration of missing limb/amputation: Time unit";
label variable ladura19 "
FHS.394_02.000.R01: Duration of missing limb/amputation (in years)";
label variable ladurb19 "
FHS.394_02.000.R02: Duration of missing limb/amputation recode 2";
label variable lachrc19 "
FHS.394_02.000.R03: Missing limb/amputation condition status";
label variable latime20 "
FHS.396_01.000: Duration of musculoskeletal problem: Number of units";
label variable launit20 "
FHS.396_02.000: Duration of musculoskeletal problem: Time unit";
label variable ladura20 "
FHS.396_02.000.R01: Duration of musculoskeletal problem (in years)";
label variable ladurb20 "
FHS.396_02.000.R02: Duration of musculoskeletal problem recode 2";
label variable lachrc20 "
FHS.396_02.000.R03: Musculoskeletal problem condition status";
label variable latime21 "
FHS.398_01.000: Duration of circulatory problem: Number of units";
label variable launit21 "
FHS.398_02.000: Duration of circulatory problem: Time unit";
label variable ladura21 "
FHS.398_02.000.R01: Duration of circulatory problem (in years)";
label variable ladurb21 "
FHS.398_02.000.R02: Duration of circulatory problem recode 2";
label variable lachrc21 "
FHS.398_02.000.R03: Circulatory problem condition status";
label variable latime22 "
FHS.400_01.000: Duration of endocrine problem: Number of units";
label variable launit22 "
FHS.400_02.000: Duration of endocrine problem: Time unit";
label variable ladura22 "
FHS.400_02.000.R01: Duration of endocrine problem (in years)";
label variable ladurb22 "
FHS.400_02.000.R02: Duration of endocrine problem recode 2";
label variable lachrc22 "FHS.400_02.000.R03: Endocrine problem condition status
";
label variable latime23 "
FHS.402_01.000: Duration of nervous system condition: Number of units";
label variable launit23 "
FHS.402_02.000: Duration of nervous system condition: Time unit";
label variable ladura23 "
FHS.402_02.000.R01: Duration of nervous system condition (in years)";
label variable ladurb23 "
FHS.402_02.000.R02: Duration of nervous system condition recode 2";
label variable lachrc23 "FHS.402_02.000.R03: Nervous system condition status";
label variable latime24 "
FHS.404_01.000: Duration of digestive problems: Number of units";
label variable launit24 "
FHS.404_02.000: Duration of digestive problems: Number of units";
label variable ladura24 "
FHS.404_02.000.R01: Duration of digestive problem (in years)";
label variable ladurb24 "
FHS.404_02.000.R02: Duration of digestive problem recode 2";
label variable lachrc24 "FHS.404_02.000.R03: Digestive problem condition status
";
label variable latime25 "
FHS.406_01.000: Duration of genitourinary problem: Number of units";
label variable launit25 "
FHS.406_02.000: Duration of genitourinary problem: Time unit";
label variable ladura25 "
FHS.406_02.000.R01: Duration of genitourinary problem (in years)";
label variable ladurb25 "
FHS.406_02.000.R02: Duration of genitourinary problem recode 2";
label variable lachrc25 "
FHS.406_02.000.R03: Genitourinary problem condition status";
label variable latime26 "
FHS.408_01.000: Duration of skin problems: Number of units";
label variable launit26 "FHS.408_02.000: Duration of skin problems: Time unit";
label variable ladura26 "FHS.408_02.000.R01: Duration of skin problem (in years)
";
label variable ladurb26 "FHS.408_02.000.R02: Duration of skin problem recode 2";
label variable lachrc26 "FHS.408_02.000.R03: Skin problems condition status";
label variable latime27 "
FHS.410_01.000: Duration of blood problem: Number of units";
label variable launit27 "FHS.410_02.000: Duration of blood problem: Time unit";
label variable ladura27 "
FHS.410_02.000.R01: Duration of blood problem (in years)";
label variable ladurb27 "FHS.410_02.000.R02: Duration of blood problem recode 2
";
label variable lachrc27 "FHS.410_02.000.R03: Blood problem condition status";
label variable latime28 "
FHS.412_01.000: Duration of benign tumor: Number of units";
label variable launit28 "FHS.412_02.000: Duration of benign tumor: Time unit";
label variable ladura28 "FHS.412_02.000.R01: Duration of benign tumor (in years)
";
label variable ladurb28 "FHS.412_02.000.R02: Duration of benign tumor recode 2";
label variable lachrc28 "FHS.412_02.000.R03: Benign tumor condition status";
label variable latime29 "
FHS.414_01.000: Duration of alcohol or drug problem: Number of units";
label variable launit29 "
FHS.414_02.000: Duration of alcohol or drug problem: Time unit";
label variable ladura29 "
FHS.414_02.000.R01: Duration of alcohol or drug problem (in years)";
label variable ladurb29 "
FHS.414_02.000.R02: Duration of alcohol or drug problem recode 2";
label variable lachrc29 "
FHS.414_02.000.R03: Alcohol or drug problem condition status";
label variable latime30 "
FHS.416_01.000: Duration of other mental problem: Number of units";
label variable launit30 "
FHS.416_02.000: Duration of other mental problem: Time unit";
label variable ladura30 "
FHS.416_02.000.R01: Duration of other mental problem (in years)";
label variable ladurb30 "
FHS.416_02.000.R02: Duration of other mental problem recode 2";
label variable lachrc30 "
FHS.416_02.000.R03: Other mental problem condition status";
label variable latime31 "
FHS.418_01.000: Duration of surgical after-effects: Number of units";
label variable launit31 "
FHS.418_02.000: Duration of surgical after-effects: Time unit";
label variable ladura31 "
FHS.418_02.000.R01: Duration of surgical after-effects (in years)";
label variable ladurb31 "
FHS.418_02.000.R02: Duration of surgical after-effects recode 2";
label variable lachrc31 "
FHS.418_02.000.R03: Surgical after-effects condition status";
label variable latime33 "
FHS.422_01.000: Duration of fatigue problem: Number of units";
label variable launit33 "FHS.422_02.000: Duration of fatigue problem: Time unit
";
label variable ladura33 "
FHS.422_02.000.R01: Duration of fatigue problem (in years)";
label variable ladurb33 "
FHS.422_02.000.R02: Duration of fatigue problem recode 2";
label variable lachrc33 "FHS.422_02.000.R03: Fatigue problem condition status";
label variable latime34 "
FHS.424_01.000: Duration of pregnancy-related problem: Number of units";
label variable launit34 "
FHS.424_02.000: Duration of pregnancy-related problem: Time unit";
label variable ladura34 "
FHS.424_02.000.R01: Duration of pregnancy-related problem (in years)";
label variable ladurb34 "
FHS.424_02.000.R02: Duration of pregnancy-related problem recode 2";
label variable lachrc34 "FHS.424_02.000.R03: Pregnancy-related condition status
";
label variable latime90 "
FHS.450_01.000: Duration of other N.E.C. problem (1): Number of units";
label variable launit90 "
FHS.450_02.000: Duration of other N.E.C. problem (1): Time unit";
label variable ladura90 "
FHS.450_02.000.R01: Duration of other N.E.C. problem (1) (in years)";
label variable ladurb90 "
FHS.450_02.000.R02: Duration of other N.E.C. problem (1) recode 2";
label variable lachrc90 "
FHS.450_02.000.R03: Other N.E.C. problem (1) condition status";
label variable latime91 "
FHS.452_01.000: Duration of other N.E.C. problem (2): Number of units";
label variable launit91 "
FHS.452_02.000: Duration of other N.E.C. problem (2): Time unit";
label variable ladura91 "
FHS.452_02.000.R01: Duration of other N.E.C. problem (2) (in years)";
label variable ladurb91 "
FHS.452_02.000.R02: Duration of other N.E.C. problem (2) recode2";
label variable lachrc91 "
FHS.452_02.000.R03: Other N.E.C. problem (2) condition status";
label variable lcondrt  "
FHS.452_02.000.R04: Chronic condition recode for person with LA";
label variable lachronr "
FHS.452_02.000.R05: Lim of activ recode by chron cond status";
label variable phstat   "FHS.500_00.000: Reported health status";

label variable pdmed12m "
FAU.020_00.000: Was medical care delayed for - - (cost), 12m";
label variable pnmed12m "
FAU.040_00.000: Did - - need and NOT get medical care (cost), 12m";
label variable phospyr  "FAU.060_00.000: Was - - in a hospital OVERNIGHT, 12m";
label variable hospno   "
FAU.070_00.000: Number of times in hospital overnight, 12m";
label variable hpnite   "FAU.110_00.000: Number of nights in hospital, 12m";
label variable phchm2w  "
FAU.130_00.000: Did - - receive HOME care by health professional, 2 wk";
label variable phchmn2w "
FAU.140_00.000: Number of HOME visits by health professional, 2wk";
label variable phcph2wr "
FAU.160_00.000: Did--get advice/test results by phone, 2wk";
label variable phcphn2w "
FAU.170_00.000: Number of PHONE calls to health professional, 2wk";
label variable phcdv2w  "
FAU.190_00.000: Did - - see health professional in office, etc, 2wk";
label variable phcdvn2w "
FAU.200_00.000: Number of times VISITED health professional, 2wk";
label variable p10dvyr  "FAU.220_00.000: Did - - receive care 10+ times, 12m";

label variable notcov   "
FHI.075_00.000: Cov stat as used in Health United States";
label variable medicare "FHI.075_00.000: Medicare coverage recode";
label variable mcpart   "FHI.090_00.000: Type of Medicare coverage";
label variable mcchoice "FHI.095_00.000: Enrolled in Medicare Advantage Plan";
label variable mchmo    "FHI.100_00.000: Is - - signed up with an HMO";
label variable mcnamen  "FHI.110_00.000: Medicare HMO name";
label variable mcref    "FHI.114_00.000: Need a referral for special care";
label variable mcpaypre "FHI.116_00.000: More comprehensive benefit plan";
label variable mcrxcard "FHI.118_00.000: Medicare prescription drug card";
label variable medicaid "FHI.118_00.000: Medicaid coverage recode";
label variable machmd   "
FHI.120_00.000: Any doc, chooses from a list, doc assigned";
label variable mapcmd   "FHI.140_00.000: Primary care physician for routine care
";
label variable maref    "FHI.150_00.000: Need a referral for special care";
label variable single   "FHI.150_00.000: Single service plan recode";
label variable sstypea  "FHI.156_01.000: Accidents";
label variable sstypeb  "FHI.156_02.000: AIDS care";
label variable sstypec  "FHI.156_03.000: Cancer treatment";
label variable sstyped  "FHI.156_04.000: Catastrophic care";
label variable sstypee  "FHI.156_05.000: Dental care";
label variable sstypef  "FHI.156_06.000: Disability insurance";
label variable sstypeg  "FHI.156_07.000: Hospice care";
label variable sstypeh  "FHI.156_08.000: Hospitalization only";
label variable sstypei  "FHI.156_09.000: Long-term care";
label variable sstypej  "FHI.156_10.000: Prescriptions";
label variable sstypek  "FHI.156_11.000: Vision care";
label variable sstypel  "FHI.156_12.000: Other";
label variable private  "FHI.157_00.000: Private health insurance recode";
label variable hitype1  "FHI.160_00.000: Name of plan (Plan 1)";
label variable whonam1  "FHI.200_01.000: Plan in whose name (Plan 1)";
label variable plnwrkn1 "
FHI.210_01.000: How plan was originally obtained (plan 1)";
label variable plnpay11 "FHI.220_11.000: Paid for by self or family (Plan 1)";
label variable plnpay21 "FHI.220_12.000: Paid for by employer or union (Plan 1)
";
label variable plnpay31 "
FHI.220_13.000: Paid for by someone outside the household (Plan 1)";
label variable plnpay41 "FHI.220_14.000: Paid for by Medicare (Plan 1)";
label variable plnpay51 "FHI.220_15.000: Paid for by Medicaid (Plan 1)";
label variable plnpay61 "FHI.220_16.000: Paid for by SCHIP (Plan 1)";
label variable plnpay71 "FHI.220_17.000: Paid for by government program (Plan 1)
";
label variable hicostr1 "FHI.230_12.000: Out-of-pocket premium cost (Plan 1)";
label variable plnmgd1  "FHI.240_01.000: Type of private plan (Plan 1)";
label variable mgchmd1  "FHI.242_01.000: Doctor choice (Plan 1)";
label variable mgprmd1  "FHI.244_01.000: Preferred list (Plan 1)";
label variable mgpymd1  "FHI.246_01.000: Out of plan use (Plan 1)";
label variable mgpref1  "FHI.248_01.000: Private referral (Plan 1)";
label variable prrxcov1 "FHI.249_01.000: Prescription drug benefit (Plan 1)";
label variable hitype2  "FHI.172_00.000: Name of plan (Plan 2)";
label variable whonam2  "FHI.200_02.000: Plan in whose name (Plan 2)";
label variable plnwrkn2 "
FHI.210_02.000: How plan was originally obtained (Plan 2)";
label variable plnpay12 "FHI.220_21.000: Paid for by self or family (Plan 2)";
label variable plnpay22 "FHI.220_22.000: Paid for by employer or union (Plan 2)
";
label variable plnpay32 "
FHI.220_23.000: Paid for by someone outside the household (Plan 2)";
label variable plnpay42 "FHI.220_24.000: Paid for by Medicare (Plan 2)";
label variable plnpay52 "FHI.220_25.000: Paid for by Medicaid (Plan 2)";
label variable plnpay62 "FHI.220_26.000: Paid for by SCHIP (Plan 2)";
label variable plnpay72 "FHI.220_27.000: Paid for by government program (Plan 2)
";
label variable hicostr2 "FHI.230_22.000: Out-of-pocket premium cost (Plan 2)";
label variable plnmgd2  "FHI.240_02.000: Type of private plan (plan 2)";
label variable mgchmd2  "FHI.242_02.000: Doctor choice (Plan 2)";
label variable mgprmd2  "FHI.244_02.000: Preferred list (Plan 2)";
label variable mgpymd2  "FHI.246_02.000: Out of plan use (Plan 2)";
label variable mgpref2  "FHI.248_02.000: Private referral (Plan 2)";
label variable prrxcov2 "FHI.249_02.000: Prescription drug benefit (Plan 2)";
label variable prplplus "FHI.249_04.000: Person has more than two private plans
";
label variable schip    "FHI.250_00.000: SCHIP coverage recode";
label variable stdoc1   "
FHI.251_00.000: Any doc, chooses from a list, doc assigned (SCHIP)";
label variable stpcmd1  "
FHI.252_00.000: Primary care physician for routine care (SCHIP)";
label variable stref1   "
FHI.253_00.000: Need a referral for special care (SCHIP)";
label variable otherpub "FHI.253_00.000: State-sponsored health plan recode";
label variable stdoc2   "
FHI.258_00.000: Any doc, chooses from a list, doc assigned (OTHERPUB)";
label variable stpcmd2  "
FHI.259_00.000: Primary care physician for routine care (OTHERPUB)";
label variable stref2   "
FHI.260_00.000: Need a referral for special care (OTHERPUB)";
label variable othergov "FHI.260_00.000: Other government program recode";
label variable stdoc3   "
FHI.265_00.000: Any doc, chooses from a list, doc assigned (OTHERGOV)";
label variable stpcmd3  "
FHI.266_00.000: Primary care physician for routine care (OTHERGOV)";
label variable stref3   "
FHI.267_00.000: Need a referral for special care (OTHERGOV)";
label variable military "FHI.267_00.000: Military health care coverage recode";
label variable milspc1  "FHI.270_01.000: TRICARE coverage";
label variable milspc2  "FHI.270_02.000: VA coverage";
label variable milspc3  "FHI.270_03.000: CHAMP-VA coverage";
label variable milspc4  "FHI.270_04.000: Other military coverage";
label variable milman   "FHI.275_00.000: Type of TRICARE coverage";
label variable ihs      "FHI.276_00.000: Indian Health Service recode";
label variable hilast   "FHI.280_00.000: How long since last had hlth coverage";
label variable histop1  "FHI.290_01.000: Lost job or changed employers";
label variable histop2  "FHI.290_02.000: Divorced/sep/death of spouse or parent
";
label variable histop3  "FHI.290_03.000: Ineligible because of age/left school";
label variable histop4  "
FHI.290_04.000: Employer does not offer/not eligible for cov";
label variable histop5  "FHI.290_05.000: Cost is too high";
label variable histop6  "FHI.290_06.000: Insurance company refused coverage";
label variable histop7  "
FHI.290_07.000: Medicaid/medi plan stopped after pregnancy";
label variable histop8  "
FHI.290_08.000: Lost Medicaid/new job/increase in income";
label variable histop9  "FHI.290_09.000: Lost Medicaid (other)";
label variable histop10 "FHI.290_10.000: Other";
label variable histop11 "FHI.290_10.000: Never had health insurance";
label variable histop12 "FHI.290_10.000: Moved from another county/state/country
";
label variable histop13 "FHI.290_10.000: Self-employed";
label variable histop14 "FHI.290_10.000: No need for it/chooses not to have";
label variable histop15 "FHI.290_10.000: Got married";
label variable hinotyr  "FHI.300_00.000: No hlth coverage during past 12 months
";
label variable hinotmyr "
FHI.310_00.000: Months without coverage in past 12 months";
label variable hcspfyr  "FHI.320_00.000: Amount family spent for medical care";
label variable hikinda  "FHI.070_01.000: Private health insurance";
label variable hikindb  "FHI.070_02.000: Medicare";
label variable hikindc  "FHI.070_03.000: Medi-Gap";
label variable hikindd  "FHI.070_04.000: Medicaid";
label variable hikinde  "FHI.070_05.000: SCHIP";
label variable hikindf  "FHI.070_06.000: Military health care";
label variable hikindg  "FHI.070_07.000: Indian Health Service";
label variable hikindh  "FHI.070_08.000: State-sponsored health plan";
label variable hikindi  "FHI.070_09.000: Other government plan";
label variable hikindj  "FHI.070_10.000: Single service plan";
label variable hikindk  "FHI.070_11.000: No coverage of any type";
label variable mcareprb "FHI.072_00.000: Medicare coverage probe";
label variable mcaidprb "FHI.073_00.000: Medicaid coverage probe";
label variable sincov   "FHI.074_00.000: Single service plan probe";

label variable plborn   "FSD.001_00.000: Born in the United States";
label variable regionbr "FSD.003_01.000.R01: Geographic region of birth recode";
label variable geobrth  "FSD.003_01.000.R02: Geographic place of birth recode";
label variable yrsinus  "FSD.005_00.000.R01: Years that - - has been in the U.S.
";
label variable citizenp "FSD.006_00.000.R01: U.S. citizenship status";
label variable headst   "FSD.007_00.000: Now attending Head Start";
label variable headstv1 "FSD.008_00.000: Ever attended Head Start";
label variable educ1    "FSD.010_00.000: Highest level of school completed";
label variable pmiltry  "FSD.042_00.000: Did - - receive honorable discharge";
label variable doinglwp "FSD.050_00.000: What was - - doing last week";
label variable whynowkp "FSD.060_00.000: Main reason for not working last week";
label variable wrkhrs2  "FSD.070_00.000.R01: Hours worked last week";
label variable wrkftall "FSD.080_00.000: Usually work full time";
label variable wrklyr1  "FSD.100_00.000: Work for pay last year";
label variable wrkmyr   "FSD.110_00.000: Months worked last year";
label variable ernyr_p  "FSD.120_00.000.R01: Total earnings last year";
label variable hiempof  "FSD.130_00.000: Health insurance offered at workplace";

label variable psal     "
FIN.040_00.000: Receive income from wages/salary (last CY)";
label variable pseinc   "
FIN.060_00.000: Receive income from self-employment (last CY)";
label variable pssrr    "FIN.080_00.000: Receive income from SS or RR (last CY)
";
label variable pssrrdb  "
FIN.084_00.000: Received SS or RR as a disability benefit";
label variable pssrrd   "FIN.086_00.000: Received benefit due to disability";
label variable ppens    "
FIN.100_00.000: Receive income from other pensions (disability)";
label variable popens   "FIN.104_00.000: Receive income from any other pension";
label variable pssi     "FIN.120_00.000: Received income from SSI";
label variable pssid    "FIN.122_00.000: Received SSI due to disability";
label variable ptanf    "FIN.160_00.000: Received income from welfare/TANF";
label variable powben   "FIN.166_00.000: Received other government assistance";
label variable pintrstr "FIN.180_00.000: Receive interest income";
label variable pdivd    "
FIN.200_00.000: Receive dividends from stocks, funds, etc.";
label variable pchldsp  "FIN.220_00.000: Receive income from child support";
label variable pincot   "FIN.240_00.000: Received income from any other source";
label variable pssapl   "FIN.310_00.000: Ever applied for SSI";
label variable psdapl   "FIN.340_00.000: Ever applied for SSDI";
label variable tanfmyr  "FIN.350_00.000: Months received welfare/TANF (last CY)
";
label variable pfstp    "
FIN.370_00.000: Person authorized to receive food stamps (last CY)";
label variable fstpmyr  "FIN.380_00.000: Months received food stamps (last CY)";
label variable eligpwic "
FIN.384_00.000.R01: Anyone age-eligible for the WIC program?";
label variable pwic     "FIN.385_00.000: Received WIC benefits";
label variable wic_flag "FIN.385_00.000.R01: WIC recipient age-eligible";

* DEFINE VALUE LABELS FOR REPORTS;

label define pep001x
   10               "10 Household"
   20               "20 Person"
   30               "30 Sample Adult"
   40               "40 Sample Child"
   60               "60 Family"
   70               "70 Injury/Poisoning Episode"
   75               "75 Injury/Poisoning Verbatim"
;
label define pep002x
   2004             "2004"
;
label define pep010x
   1                "1 Male"
   2                "2 Female"
;
label define pep011x
   1                "1 Yes"
   2                "2 No"
;
label define pep012x
   1                "1 Imputed: was 'refused' Hispanic Origin"
   2                "2 Imputed: was 'not ascertained' Hispanic Origin"
   3                "3 Imputed: was 'does not know' Hispanic Origin"
   4                "4 Hispanic origin given by respondent/proxy"
;
label define pep013x
   1                "1 Imputed: was 'refused' Hispanic Origin"
   2                "2 Imputed: was 'not ascertained' Hispanic Origin"
   3                "3 Imputed: was 'does not know' Hispanic Origin"
   4                "4 Hispanic Origin type given by respondent/proxy"
;
label define pep014x
   00               "00 Multiple Hispanic"
   01               "01 Puerto Rico"
   02               "02 Mexican"
   03               "03 Mexican-American"
   04               "04 Cuban/Cuban American"
   05               "05 Dominican (Republic)"
   06               "06 Central or South American"
   07               "07 Other Latin American, type not specified"
   08               "08 Other Spanish"
   09               "09 Hispanic/Latino/Spanish, non-specific type"
   10               "10 Hispanic/Latino/Spanish, type refused"
   11               "11 Hispanic/Latino/Spanish, type not ascertained"
   12               "12 Not Hispanic/Spanish origin"
;
label define pep015x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN only"
   04               "04 Asian only"
   05               "05 Race group not releasable (See file layout)"
   06               "06 Multiple race"
;
label define pep016x
   1                "1 Imputed: was 'refused'"
   2                "2 Imputed: was 'not ascertained'"
   3                "3 Imputed: was 'does not know'"
   4                "4 Imputed: was other race'"
   5                "5 Imputed: was 'unspecified multiple race'"
   6                "6 Race given by respondent/proxy"
;
label define pep017x
   01               "01 White"
   02               "02 Black/African American"
   03               "03 Indian (American), Alaska Native"
   09               "09 Asian Indian"
   10               "10 Chinese"
   11               "11 Filipino"
   15               "15 Other Asian (See file layout)"
   16               "16 Primary race not releasable (See file layout)"
   17               "17 Multiple race, no primary race selected"
;
label define pep018x
   01               "01 White"
   02               "02 Black/African American"
   03               "03 Indian (American) (includes Eskimo, Aleut)"
   06               "06 Chinese"
   07               "07 Filipino"
   12               "12 Asian Indian"
   16               "16 Other race (See file layout)"
   17               "17 Multiple race, no primary race selected"
;
label define pep019x
   1                "1 White"
   2                "2 Black"
   3                "3 All other race groups (See file layout)"
;
label define pep020x
   1                "1 Hispanic"
   2                "2 Non-Hispanic White"
   3                "3 Non-Hispanic Black"
   4                "4 Non-Hispanic All other race groups"
;
label define pep021x
   1                "1 Ethnicity/race imputed"
   2                "2 Ethnicity/race given by respondent/proxy"
;
label define pep022x
   1                "1 Armed Forces"
   2                "2 Not Armed Forces"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep023x
   01               "01 Household reference person"
   02               "02 Spouse (husband/wife)"
   03               "03 Unmarried Partner"
   04               "04 Child (biological/adoptive/in-law/step/foster)"
   05               "05 Child of partner"
   06               "06 Grandchild"
   07               "07 Parent (biological/adoptive/in-law/step/foster)"
   08               "08 Brother/sister (biological/adoptive/in-law/step/foster)"
   09               "09 Grandparent (Grandmother/Grandfather)"
   10               "10 Aunt/Uncle"
   11               "11 Niece/Nephew"
   12               "12 Other relative"
   13               "13 Housemate/roommate"
   14               "14 Roomer/Boarder"
   15               "15 Other nonrelative"
   16               "16 Legal guardian"
   17               "17 Ward"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep027x
   00               "00 Under 1 year"
   85               "85 85+ years"
;
label define pep028x
   01               "01 Family reference person"
   02               "02 Spouse (husband/wife)"
   03               "03 Unmarried Partner"
   04               "04 Child (biological/adoptive/in-law/step/foster)"
   05               "05 Child of partner"
   06               "06 Grandchild"
   07               "07 Parent (biological/adoptive/in-law/step/foster)"
   08               "08 Brother/sister (biological/adoptive/in-law/step/foster)"
   09               "09 Grandparent (Grandmother/Grandfather)"
   10               "10 Aunt/Uncle"
   11               "11 Niece/Nephew"
   12               "12 Other relative"
   16               "16 Legal guardian"
   17               "17 Ward"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep031x
   0                "0 Under 14 years"
   1                "1 Married - spouse in household"
   2                "2 Married - spouse not in household"
   3                "3 Married - spouse in household unknown"
   4                "4 Widowed"
   5                "5 Divorced"
   6                "6 Separated"
   7                "7 Never married"
   8                "8 Living with partner"
   9                "9 Unknown marital status"
;
label define pep032x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep033x
   1                "1 Married"
   2                "2 Widowed"
   3                "3 Divorced"
   4                "4 Separated"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep034x
   1                "1 Separated"
   2                "2 Divorced"
   3                "3 Married"
   4                "4 Single/never married"
   5                "5 Widowed"
   9                "9 Unknown marital status"
;
label define pep035x
   1                "1 Full {brother/sister}"
   2                "2 Half {brother/sister}"
   3                "3 Adopted {brother/sister}"
   4                "4 Step {brother/sister}"
   5                "5 Foster {brother/sister}"
   6                "6 {Brother/Sister}-in-law"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep036x
   00               "00 Mother not a household member"
   96               "96 Has legal guardian"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep037x
   1                "1 Biological"
   2                "2 Adoptive"
   3                "3 Step"
   4                "4 Foster"
   5                "5 In-law"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep038x
   00               "00 Father not in household"
   96               "96 Has legal guardian"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep040x
   1                "1 Mother, no father"
   2                "2 Father, no mother"
   3                "3 Mother and father"
   4                "4 Neither mother nor father"
   9                "9 Unknown"
;
label define pep041x
   01               "01 Less/equal to 8th grade"
   02               "02 9-12th grade, no high school diploma"
   03               "03 High school graduate/GED recipient"
   04               "04 Some college, no degree"
   05               "05 AA degree, technical or vocational"
   06               "06 AA degree, academic program"
   07               "07 Bachelor's degree"
   08               "08 Master's, professional, or doctoral degree"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep043x
   0                "0 Sample Adult - no record"
   1                "1 Sample Adult - has record"
   2                "2 Not selected as Sample Adult"
   3                "3 No one selected as Sample Adult"
   4                "4 Armed Force member"
   5                "5 Armed Force member - selected as Sample Adult"
;
label define pep044x
   0                "0 Sample Child - no record"
   1                "1 Sample Child - has record"
   2                "2 Not selected as Sample Child"
   3                "3 No one selected as Sample Child"
   4                "4 Emancipated minor"
;
label define pep058x
   0                "0 Unable to work"
   1                "1 Limited in work"
   2                "2 Not limited in work"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define pep061x
   0                "0 Limitation previously mentioned"
   1                "1 Yes, limited in some other way"
   2                "2 Not limited in any way"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep062x
   1                "1 Limited in any way"
   2                "2 Not limited in any way"
   3                "3 Unknown if limited"
;
label define pep063x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep078x
   95               "95 95+"
   96               "96 Since birth"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep079x
   1                "1 Day(s)"
   2                "2 Week(s)"
   3                "3 Month(s)"
   4                "4 Year(s)"
   6                "6 Since birth"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep080x
   00               "00 Less than 1 year"
   96               "96 Unknown number of years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep081x
   0                "0 Since birth and child <1 year of age"
   1                "1 Less than 3 months"
   2                "2 3-5 months"
   3                "3 6-12 months"
   4                "4 More than 1 year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep082x
   1                "1 Chronic"
   2                "2 Not chronic"
   9                "9 Unknown if chronic"
;
label define pep191x
   00               "00 Less than 1 year"
   85               "85 85+ years"
   96               "96 Unknown number of years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep192x
   1                "1 Less than 3 months"
   2                "2 3-5 months"
   3                "3 6-12 months"
   4                "4 More than 1 year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep369x
   1                "1 At least one condition causing LA is chronic"
   2                "2 No condition causing LA is chronic"
   9                "9 Unk if any condition causing LA is chronic"
;
label define pep370x
   0                "0 Not limited in any way (incl unk if limited)"
   1                "1 Limited; caused by at least one chronic cond"
   2                "2 Limited; not caused by chronic cond"
   3                "3 Limited; unk if cond is chronic"
;
label define pep371x
   1                "1 Excellent"
   2                "2 Very good"
   3                "3 Good"
   4                "4 Fair"
   5                "5 Poor"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep375x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define pep376x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define pep378x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep380x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep382x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep384x
   1                "1 Not covered"
   2                "2 Covered"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep385x
   1                "1 Yes, information"
   2                "2 Yes, but no information"
   3                "3 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep386x
   1                "1 Part A - Hospital only"
   2                "2 Part B - Medical only"
   3                "3 Both Part A and Part B"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep389x
   04               "04 Medigap plan"
   12               "12 Group"
   22               "22 Staff"
   32               "32 IPA"
   92               "92 Other"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep394x
   1                "1  Any doctor"
   2                "2  Select from book/list"
   3                "3  Doctor is assigned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep397x
   1                "1 Yes, with information"
   2                "2 Yes, but no information"
   3                "3 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep411x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep412x
   1                "1 In own name"
   2                "2 Someone else in family"
   3                "3 Person not in household"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep413x
   01               "01 Through employer"
   02               "02 Through union"
   03               "03 Through workplace, but don't know if employer or union"
   04               "
04 Through workplace, self-employed or professional association"
   05               "05 Purchased directly"
   06               "06 Through a state/local government or community program"
   07               "07 Other"
   08               "08 Through school"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep421x
   20000            "20000 $20,000 or more"
   99997            "99997 Refused"
   99998            "99998 Not ascertained"
   99999            "99999 Don't know"
;
label define pep422x
   1                "1 HMO/IPA"
   2                "2 PPO"
   3                "3 POS"
   4                "4 Fee-for-service/indemnity"
   5                "5 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep423x
   1                "1 Any doctor"
   2                "2 Select from group/list"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep463x
   1                "1 TRICARE Prime"
   2                "2 TRICARE Extra"
   3                "3 TRICARE Standard"
   4                "4 TRICARE for life"
   5                "5 TRICARE other (specify)"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep465x
   1                "1 6 months or less"
   2                "2 More than 6 months, but not more than 1 year ago"
   3                "3 More than 1 year, but not more than 3 years ago"
   4                "4 More than 3 years"
   5                "5 Never"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep482x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep483x
   0                "0 Zero"
   1                "1 Less than $500"
   2                "2 $500 - $1,999"
   3                "3 $2,000 - $2,999"
   4                "4 $3,000 - $4,999"
   5                "5 $5,000 or more"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep499x
   01               "01 United States"
   02               "02 Mexico, Central America, Caribbean Islands"
   03               "03 South America"
   04               "04 Europe"
   05               "05 Russia (and former USSR areas)"
   06               "06 Africa"
   07               "07 Middle East"
   08               "08 Indian Subcontinent"
   09               "09 Asia"
   10               "10 SE Asia"
   11               "11 Elsewhere"
   99               "99 Unknown"
;
label define pep500x
   1                "1 USA: born in one of the 50 United States or D.C."
   2                "2 USA: born in a U.S. territory"
   3                "3 Not born in the U.S. or a U.S. territory"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep501x
   1                "1 Less than 1 year"
   2                "2 1 yr., less than 5 yrs."
   3                "3 5 yrs., less than 10 yrs."
   4                "4 10 yrs., less than 15 yrs."
   5                "5 15 years or more"
   9                "9 Unknown"
;
label define pep502x
   1                "1 Yes, citizen of the United States"
   2                "2 No, not a citizen of the United States"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep505x
   00               "00 Never attended/kindergarten only"
   01               "01 1st grade"
   02               "02 2nd grade"
   03               "03 3rd grade"
   04               "04 4th grade"
   05               "05 5th grade"
   06               "06 6th grade"
   07               "07 7th grade"
   08               "08 8th grade"
   09               "09 9th grade"
   10               "10th grade"
   11               "11th grade"
   12               "12th grade, no diploma"
   13               "13 GED or equivalent"
   14               "14 High School Graduate"
   15               "15 Some college, no degree"
   16               "
16 Associate degree: occupational, technical, or vocational program"
   17               "17 Associate degree: academic program"
   18               "18 Bachelor's degree (Example: BA, AB, BS, BBA)"
   19               "19 Master's degree (Example: MA, MS, MEng, MEd, MBA)"
   20               "20 Professional School degree (Example: MD, DDS, DVM, JD)"
   21               "21 Doctoral degree (Example: PhD, EdD)"
   96               "96 Child under 5 years old"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep507x
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
label define pep508x
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
label define pep509x
   95               "95 95+ hours"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep512x
   01               "01 1 month or less"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep513x
   01               "01 $01-$4,999"
   02               "02 $5,000-$9,999"
   03               "03 $10,000-$14,999"
   04               "04 $15,000-$19,999"
   05               "05 $20,000-$24,999"
   06               "06 $25,000-$34,999"
   07               "07 $35,000-$44,999"
   08               "08 $45,000-$54,999"
   09               "09 $55,000-$64,999"
   10               "10 $65,000-$74,999"
   11               "11 $75,000 and over"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep535x
   0                "0 No WIC age-eligible family members"
   1                "1 At least 1 WIC age-eligible family member"
;
label define pep537x
   0                "0 Person not age-eligible"
   1                "1 Person age-eligible"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   pep001x;   label values srvy_yr   pep002x;



label values sex       pep010x;   label values origin_i  pep011x;
label values origimpt  pep012x;   label values hispimpt  pep013x;
label values hispan_i  pep014x;   label values racerpi2  pep015x;
label values raceimp2  pep016x;   label values mracrpi2  pep017x;
label values mracbpi2  pep018x;   label values racreci2  pep019x;
label values hiscodi2  pep020x;   label values erimpflg  pep021x;
label values nowaf     pep022x;   label values rrp       pep023x;
label values age_p     pep027x;

label values frrp      pep028x;   label values r_maritl  pep031x;
label values cohab1    pep032x;   label values cohab2    pep033x;
label values cdcmstat  pep034x;   label values sib_deg   pep035x;
label values fmother   pep036x;   label values mom_deg   pep037x;
label values ffather   pep038x;   label values dad_deg   pep037x;
label values parents   pep040x;   label values mom_ed    pep041x;
label values dad_ed    pep041x;   label values astatflg  pep043x;
label values cstatflg  pep044x;

label values plaplylm  pep032x;   label values plaplyun  pep032x;
label values pspedeis  pep032x;   label values pspedem   pep032x;
label values plaadl    pep032x;   label values labath    pep032x;
label values ladress   pep032x;   label values laeat     pep032x;
label values labed     pep032x;   label values latoilt   pep032x;
label values lahome    pep032x;   label values plaiadl   pep032x;
label values plawknow  pep032x;   label values plawklim  pep058x;
label values plawalk   pep032x;   label values plaremem  pep032x;
label values plimany   pep061x;   label values la1ar     pep062x;
label values lahcc1    pep063x;   label values lahcc2    pep063x;
label values lahcc3    pep063x;   label values lahcc4    pep063x;
label values lahcc5    pep063x;   label values lahcc6    pep063x;
label values lahcc7    pep063x;   label values lahcc8    pep063x;
label values lahcc9    pep063x;   label values lahcc10   pep063x;
label values lahcc11   pep063x;   label values lahcc12   pep063x;
label values lahcc13   pep063x;   label values lahcc90   pep063x;
label values lahcc91   pep063x;   label values lctime1   pep078x;
label values lcunit1   pep079x;   label values lcdura1   pep080x;
label values lcdurb1   pep081x;   label values lcchrc1   pep082x;
label values lctime2   pep078x;   label values lcunit2   pep079x;
label values lcdura2   pep080x;   label values lcdurb2   pep081x;
label values lcchrc2   pep082x;   label values lctime3   pep078x;
label values lcunit3   pep079x;   label values lcdura3   pep080x;
label values lcdurb3   pep081x;   label values lcchrc3   pep082x;
label values lctime4   pep078x;   label values lcunit4   pep079x;
label values lcdura4   pep080x;   label values lcdurb4   pep081x;
label values lcchrc4   pep082x;   label values lctime5   pep078x;
label values lcunit5   pep079x;   label values lcdura5   pep080x;
label values lcdurb5   pep081x;   label values lcchrc5   pep082x;
label values lctime6   pep078x;   label values lcunit6   pep079x;
label values lcdura6   pep080x;   label values lcdurb6   pep081x;
label values lcchrc6   pep082x;   label values lctime7   pep078x;
label values lcunit7   pep079x;   label values lcdura7   pep080x;
label values lcdurb7   pep081x;   label values lcchrc7   pep082x;
label values lctime8   pep078x;   label values lcunit8   pep079x;
label values lcdura8   pep080x;   label values lcdurb8   pep081x;
label values lcchrc8   pep082x;   label values lctime9   pep078x;
label values lcunit9   pep079x;   label values lcdura9   pep080x;
label values lcdurb9   pep081x;   label values lcchrc9   pep082x;
label values lctime10  pep078x;   label values lcunit10  pep079x;
label values lcdura10  pep080x;   label values lcdurb10  pep081x;
label values lcchrc10  pep082x;   label values lctime11  pep078x;
label values lcunit11  pep079x;   label values lcdura11  pep080x;
label values lcdurb11  pep081x;   label values lcchrc11  pep082x;
label values lctime12  pep078x;   label values lcunit12  pep079x;
label values lcdura12  pep080x;   label values lcdurb12  pep081x;
label values lcchrc12  pep082x;   label values lctime13  pep078x;
label values lcunit13  pep079x;   label values lcdura13  pep080x;
label values lcdurb13  pep081x;   label values lcchrc13  pep082x;
label values lctime90  pep078x;   label values lcunit90  pep079x;
label values lcdura90  pep080x;   label values lcdurb90  pep081x;
label values lcchrc90  pep082x;   label values lctime91  pep078x;
label values lcunit91  pep079x;   label values lcdura91  pep080x;
label values lcdurb91  pep081x;   label values lcchrc91  pep082x;
label values lahca1    pep063x;   label values lahca2    pep063x;
label values lahca3    pep063x;   label values lahca4    pep063x;
label values lahca5    pep063x;   label values lahca6    pep063x;
label values lahca7    pep063x;   label values lahca8    pep063x;
label values lahca9    pep063x;   label values lahca10   pep063x;
label values lahca11   pep063x;   label values lahca12   pep063x;
label values lahca13   pep063x;   label values lahca14   pep063x;
label values lahca15   pep063x;   label values lahca16   pep063x;
label values lahca17   pep063x;   label values lahca18   pep063x;
label values lahca19_  pep063x;   label values lahca20_  pep063x;
label values lahca21_  pep063x;   label values lahca22_  pep063x;
label values lahca23_  pep063x;   label values lahca24_  pep063x;
label values lahca25_  pep063x;   label values lahca26_  pep063x;
label values lahca27_  pep063x;   label values lahca28_  pep063x;
label values lahca29_  pep063x;   label values lahca30_  pep063x;
label values lahca31_  pep063x;   label values lahca32_  pep063x;
label values lahca33_  pep063x;   label values lahca34_  pep063x;
label values lahca90   pep063x;   label values lahca91   pep063x;
label values latime1   pep078x;   label values launit1   pep079x;
label values ladura1   pep191x;   label values ladurb1   pep192x;
label values lachrc1   pep082x;   label values latime2   pep078x;
label values launit2   pep079x;   label values ladura2   pep191x;
label values ladurb2   pep192x;   label values lachrc2   pep082x;
label values latime3   pep078x;   label values launit3   pep079x;
label values ladura3   pep191x;   label values ladurb3   pep192x;
label values lachrc3   pep082x;   label values latime4   pep078x;
label values launit4   pep079x;   label values ladura4   pep191x;
label values ladurb4   pep192x;   label values lachrc4   pep082x;
label values latime5   pep078x;   label values launit5   pep079x;
label values ladura5   pep191x;   label values ladurb5   pep192x;
label values lachrc5   pep082x;   label values latime6   pep078x;
label values launit6   pep079x;   label values ladura6   pep191x;
label values ladurb6   pep192x;   label values lachrc6   pep082x;
label values latime7   pep078x;   label values launit7   pep079x;
label values ladura7   pep191x;   label values ladurb7   pep192x;
label values lachrc7   pep082x;   label values latime8   pep078x;
label values launit8   pep079x;   label values ladura8   pep191x;
label values ladurb8   pep192x;   label values lachrc8   pep082x;
label values latime9   pep078x;   label values launit9   pep079x;
label values ladura9   pep191x;   label values ladurb9   pep192x;
label values lachrc9   pep082x;   label values latime10  pep078x;
label values launit10  pep079x;   label values ladura10  pep191x;
label values ladurb10  pep192x;   label values lachrc10  pep082x;
label values latime11  pep078x;   label values launit11  pep079x;
label values ladura11  pep191x;   label values ladurb11  pep192x;
label values lachrc11  pep082x;   label values latime12  pep078x;
label values launit12  pep079x;   label values ladura12  pep191x;
label values ladurb12  pep192x;   label values lachrc12  pep082x;
label values latime13  pep078x;   label values launit13  pep079x;
label values ladura13  pep191x;   label values ladurb13  pep192x;
label values lachrc13  pep082x;   label values latime14  pep078x;
label values launit14  pep079x;   label values ladura14  pep191x;
label values ladurb14  pep192x;   label values lachrc14  pep082x;
label values latime15  pep078x;   label values launit15  pep079x;
label values ladura15  pep191x;   label values ladurb15  pep192x;
label values lachrc15  pep082x;   label values latime16  pep078x;
label values launit16  pep079x;   label values ladura16  pep191x;
label values ladurb16  pep192x;   label values lachrc16  pep082x;
label values latime17  pep078x;   label values launit17  pep079x;
label values ladura17  pep191x;   label values ladurb17  pep192x;
label values lachrc17  pep082x;   label values latime18  pep078x;
label values launit18  pep079x;   label values ladura18  pep191x;
label values ladurb18  pep192x;   label values lachrc18  pep082x;
label values latime19  pep078x;   label values launit19  pep079x;
label values ladura19  pep191x;   label values ladurb19  pep192x;
label values lachrc19  pep082x;   label values latime20  pep078x;
label values launit20  pep079x;   label values ladura20  pep191x;
label values ladurb20  pep192x;   label values lachrc20  pep082x;
label values latime21  pep078x;   label values launit21  pep079x;
label values ladura21  pep191x;   label values ladurb21  pep192x;
label values lachrc21  pep082x;   label values latime22  pep078x;
label values launit22  pep079x;   label values ladura22  pep191x;
label values ladurb22  pep192x;   label values lachrc22  pep082x;
label values latime23  pep078x;   label values launit23  pep079x;
label values ladura23  pep191x;   label values ladurb23  pep192x;
label values lachrc23  pep082x;   label values latime24  pep078x;
label values launit24  pep079x;   label values ladura24  pep191x;
label values ladurb24  pep192x;   label values lachrc24  pep082x;
label values latime25  pep078x;   label values launit25  pep079x;
label values ladura25  pep191x;   label values ladurb25  pep192x;
label values lachrc25  pep082x;   label values latime26  pep078x;
label values launit26  pep079x;   label values ladura26  pep191x;
label values ladurb26  pep192x;   label values lachrc26  pep082x;
label values latime27  pep078x;   label values launit27  pep079x;
label values ladura27  pep191x;   label values ladurb27  pep192x;
label values lachrc27  pep082x;   label values latime28  pep078x;
label values launit28  pep079x;   label values ladura28  pep191x;
label values ladurb28  pep192x;   label values lachrc28  pep082x;
label values latime29  pep078x;   label values launit29  pep079x;
label values ladura29  pep191x;   label values ladurb29  pep192x;
label values lachrc29  pep082x;   label values latime30  pep078x;
label values launit30  pep079x;   label values ladura30  pep191x;
label values ladurb30  pep192x;   label values lachrc30  pep082x;
label values latime31  pep078x;   label values launit31  pep079x;
label values ladura31  pep191x;   label values ladurb31  pep192x;
label values lachrc31  pep082x;   label values latime32  pep078x;
label values launit32  pep079x;   label values ladura32  pep191x;
label values ladurb32  pep192x;   label values lachrc32  pep082x;
label values latime33  pep078x;   label values launit33  pep079x;
label values ladura33  pep191x;   label values ladurb33  pep192x;
label values lachrc33  pep082x;   label values latime34  pep078x;
label values launit34  pep079x;   label values ladura34  pep191x;
label values ladurb34  pep192x;   label values lachrc34  pep082x;
label values latime90  pep078x;   label values launit90  pep079x;
label values ladura90  pep191x;   label values ladurb90  pep192x;
label values lachrc90  pep082x;   label values latime91  pep078x;
label values launit91  pep079x;   label values ladura91  pep191x;
label values ladurb91  pep192x;   label values lachrc91  pep082x;
label values lcondrt   pep369x;   label values lachronr  pep370x;
label values phstat    pep371x;

label values pdmed12m  pep032x;   label values pnmed12m  pep032x;
label values phospyr   pep032x;   label values hospno    pep375x;
label values hpnite    pep376x;   label values phchm2w   pep032x;
label values phchmn2w  pep378x;   label values phcph2wr  pep032x;
label values phcphn2w  pep380x;   label values phcdv2w   pep032x;
label values phcdvn2w  pep382x;   label values p10dvyr   pep032x;

label values notcov    pep384x;   label values medicare  pep385x;
label values mcpart    pep386x;   label values mcchoice  pep032x;
label values mchmo     pep032x;   label values mcnamen   pep389x;
label values mcref     pep032x;   label values mcpaypre  pep032x;
label values mcrxcard  pep032x;   label values medicaid  pep385x;
label values machmd    pep394x;   label values mapcmd    pep032x;
label values maref     pep032x;   label values single    pep397x;
label values sstypea   pep063x;   label values sstypeb   pep063x;
label values sstypec   pep063x;   label values sstyped   pep063x;
label values sstypee   pep063x;   label values sstypef   pep063x;
label values sstypeg   pep063x;   label values sstypeh   pep063x;
label values sstypei   pep063x;   label values sstypej   pep063x;
label values sstypek   pep063x;   label values sstypel   pep063x;
label values private   pep385x;   label values hitype1   pep411x;
label values whonam1   pep412x;   label values plnwrkn1  pep413x;
label values plnpay11  pep063x;   label values plnpay21  pep063x;
label values plnpay31  pep063x;   label values plnpay41  pep063x;
label values plnpay51  pep063x;   label values plnpay61  pep063x;
label values plnpay71  pep063x;   label values hicostr1  pep421x;
label values plnmgd1   pep422x;   label values mgchmd1   pep423x;
label values mgprmd1   pep032x;   label values mgpymd1   pep032x;
label values mgpref1   pep032x;   label values prrxcov1  pep032x;
label values hitype2   pep411x;   label values whonam2   pep412x;
label values plnwrkn2  pep413x;   label values plnpay12  pep063x;
label values plnpay22  pep063x;   label values plnpay32  pep063x;
label values plnpay42  pep063x;   label values plnpay52  pep063x;
label values plnpay62  pep063x;   label values plnpay72  pep063x;
label values hicostr2  pep421x;   label values plnmgd2   pep422x;
label values mgchmd2   pep423x;   label values mgprmd2   pep032x;
label values mgpymd2   pep032x;   label values mgpref2   pep032x;
label values prrxcov2  pep032x;   label values prplplus  pep032x;
label values schip     pep385x;   label values stdoc1    pep394x;
label values stpcmd1   pep032x;   label values stref1    pep032x;
label values otherpub  pep385x;   label values stdoc2    pep394x;
label values stpcmd2   pep032x;   label values stref2    pep032x;
label values othergov  pep385x;   label values stdoc3    pep394x;
label values stpcmd3   pep032x;   label values stref3    pep032x;
label values military  pep385x;   label values milspc1   pep063x;
label values milspc2   pep063x;   label values milspc3   pep063x;
label values milspc4   pep063x;   label values milman    pep463x;
label values ihs       pep032x;   label values hilast    pep465x;
label values histop1   pep063x;   label values histop2   pep063x;
label values histop3   pep063x;   label values histop4   pep063x;
label values histop5   pep063x;   label values histop6   pep063x;
label values histop7   pep063x;   label values histop8   pep063x;
label values histop9   pep063x;   label values histop10  pep063x;
label values histop11  pep063x;   label values histop12  pep063x;
label values histop13  pep063x;   label values histop14  pep063x;
label values histop15  pep063x;   label values hinotyr   pep032x;
label values hinotmyr  pep482x;   label values hcspfyr   pep483x;
label values hikinda   pep063x;   label values hikindb   pep063x;
label values hikindc   pep063x;   label values hikindd   pep063x;
label values hikinde   pep063x;   label values hikindf   pep063x;
label values hikindg   pep063x;   label values hikindh   pep063x;
label values hikindi   pep063x;   label values hikindj   pep063x;
label values hikindk   pep063x;   label values mcareprb  pep032x;
label values mcaidprb  pep032x;   label values sincov    pep032x;

label values plborn    pep032x;   label values regionbr  pep499x;
label values geobrth   pep500x;   label values yrsinus   pep501x;
label values citizenp  pep502x;   label values headst    pep032x;
label values headstv1  pep032x;   label values educ1     pep505x;
label values pmiltry   pep032x;   label values doinglwp  pep507x;
label values whynowkp  pep508x;   label values wrkhrs2   pep509x;
label values wrkftall  pep032x;   label values wrklyr1   pep032x;
label values wrkmyr    pep512x;   label values ernyr_p   pep513x;
label values hiempof   pep032x;

label values psal      pep032x;   label values pseinc    pep032x;
label values pssrr     pep032x;   label values pssrrdb   pep032x;
label values pssrrd    pep032x;   label values ppens     pep032x;
label values popens    pep032x;   label values pssi      pep032x;
label values pssid     pep032x;   label values ptanf     pep032x;
label values powben    pep032x;   label values pintrstr  pep032x;
label values pdivd     pep032x;   label values pchldsp   pep032x;
label values pincot    pep032x;   label values pssapl    pep032x;
label values psdapl    pep032x;   label values tanfmyr   pep482x;
label values pfstp     pep032x;   label values fstpmyr   pep482x;
label values eligpwic  pep535x;   label values pwic      pep032x;
label values wic_flag  pep537x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa];
save "$OUT/2004/personsx", replace;

#delimit cr

* data file is stored in personsx.dta
* log  file is stored in personsx.log

log close
