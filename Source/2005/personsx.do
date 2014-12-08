log using "$LOG/personsx.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 JUNE 2, 2006  7:45 AM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2005 NHIS Public Use Person ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE personsx.dta AND personsx.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2005\

 THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
 LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
 USER SHOULD ENTER THE FOLLOWING STATA COMMAND: log close
 
 THIS IS STORED IN personsx.do
*********************************************************************;
clear;
set mem 200m;

* INPUT ALL VARIABLES;

infix
      rectype       1 -   2      srvy_yr       3 -   6
  str hhx           7 -  12      intv_qrt     13 -  13
      assignwk     14 -  15  str fmx          16 -  17
  str fpx          18 -  19      wtia         20 -  25
      wtfa         26 -  31

      region       32 -  32      stratum      33 -  35
      psu          36 -  36

      sex          37 -  37      origin_i     38 -  38
      origimpt     39 -  39      hispan_i     40 -  41
      hispimpt     42 -  42      racerpi2     43 -  44
      raceimp2     45 -  45      mracrpi2     46 -  47
      mracbpi2     48 -  49      racreci2     50 -  50
      hiscodi2     51 -  51      erimpflg     52 -  52
      nowaf        53 -  53      rrp          54 -  55
  str hhreflg      56 -  56      frrp         57 -  58
  str dob_m        59 -  60  str dob_y_p      61 -  64
      age_p        65 -  66      age_chg      67 -  67

  str fmrpflg      68 -  68  str fmreflg      69 -  69
      r_maritl     70 -  70      cohab1       71 -  71
      cohab2       72 -  72      cdcmstat     73 -  73
      sib_deg      74 -  74      fmother      75 -  76
      mom_deg      77 -  77      ffather      78 -  79
      dad_deg      80 -  80      parents      81 -  81
      mom_ed       82 -  83      dad_ed       84 -  85
      astatflg     86 -  86      cstatflg     87 -  87

      plaplylm     88 -  88      plaplyun     89 -  89
      pspedeis     90 -  90      pspedem      91 -  91
      plaadl       92 -  92      labath       93 -  93
      ladress      94 -  94      laeat        95 -  95
      labed        96 -  96      latoilt      97 -  97
      lahome       98 -  98      plaiadl      99 -  99
      plawknow    100 - 100      plawklim    101 - 101
      plawalk     102 - 102      plaremem    103 - 103
      plimany     104 - 104      la1ar       105 - 105
      lahcc1      106 - 106      lahcc2      107 - 107
      lahcc3      108 - 108      lahcc4      109 - 109
      lahcc5      110 - 110      lahcc6      111 - 111
      lahcc7      112 - 112      lahcc8      113 - 113
      lahcc9      114 - 114      lahcc10     115 - 115
      lahcc11     116 - 116      lahcc12     117 - 117
      lahcc13     118 - 118      lahcc90     119 - 119
      lahcc91     120 - 120      lctime1     121 - 122
      lcunit1     123 - 123      lcdura1     124 - 125
      lcdurb1     126 - 126      lcchrc1     127 - 127
      lctime2     128 - 129      lcunit2     130 - 130
      lcdura2     131 - 132      lcdurb2     133 - 133
      lcchrc2     134 - 134      lctime3     135 - 136
      lcunit3     137 - 137      lcdura3     138 - 139
      lcdurb3     140 - 140      lcchrc3     141 - 141
      lctime4     142 - 143      lcunit4     144 - 144
      lcdura4     145 - 146      lcdurb4     147 - 147
      lcchrc4     148 - 148      lctime5     149 - 150
      lcunit5     151 - 151      lcdura5     152 - 153
      lcdurb5     154 - 154      lcchrc5     155 - 155
      lctime6     156 - 157      lcunit6     158 - 158
      lcdura6     159 - 160      lcdurb6     161 - 161
      lcchrc6     162 - 162      lctime7     163 - 164
      lcunit7     165 - 165      lcdura7     166 - 167
      lcdurb7     168 - 168      lcchrc7     169 - 169
      lctime8     170 - 171      lcunit8     172 - 172
      lcdura8     173 - 174      lcdurb8     175 - 175
      lcchrc8     176 - 176      lctime9     177 - 178
      lcunit9     179 - 179      lcdura9     180 - 181
      lcdurb9     182 - 182      lcchrc9     183 - 183
      lctime10    184 - 185      lcunit10    186 - 186
      lcdura10    187 - 188      lcdurb10    189 - 189
      lcchrc10    190 - 190      lctime11    191 - 192
      lcunit11    193 - 193      lcdura11    194 - 195
      lcdurb11    196 - 196      lcchrc11    197 - 197
      lctime12    198 - 199      lcunit12    200 - 200
      lcdura12    201 - 202      lcdurb12    203 - 203
      lcchrc12    204 - 204      lctime13    205 - 206
      lcunit13    207 - 207      lcdura13    208 - 209
      lcdurb13    210 - 210      lcchrc13    211 - 211
      lctime90    212 - 213      lcunit90    214 - 214
      lcdura90    215 - 216      lcdurb90    217 - 217
      lcchrc90    218 - 218      lctime91    219 - 220
      lcunit91    221 - 221      lcdura91    222 - 223
      lcdurb91    224 - 224      lcchrc91    225 - 225
      lahca1      226 - 226      lahca2      227 - 227
      lahca3      228 - 228      lahca4      229 - 229
      lahca5      230 - 230      lahca6      231 - 231
      lahca7      232 - 232      lahca8      233 - 233
      lahca9      234 - 234      lahca10     235 - 235
      lahca11     236 - 236      lahca12     237 - 237
      lahca13     238 - 238      lahca14     239 - 239
      lahca15     240 - 240      lahca16     241 - 241
      lahca17     242 - 242      lahca18     243 - 243
      lahca19_    244 - 244      lahca20_    245 - 245
      lahca21_    246 - 246      lahca22_    247 - 247
      lahca23_    248 - 248      lahca24_    249 - 249
      lahca25_    250 - 250      lahca26_    251 - 251
      lahca27_    252 - 252      lahca28_    253 - 253
      lahca29_    254 - 254      lahca30_    255 - 255
      lahca31_    256 - 256      lahca32_    257 - 257
      lahca33_    258 - 258      lahca34_    259 - 259
      lahca90     260 - 260      lahca91     261 - 261
      latime1     262 - 263      launit1     264 - 264
      ladura1     265 - 266      ladurb1     267 - 267
      lachrc1     268 - 268      latime2     269 - 270
      launit2     271 - 271      ladura2     272 - 273
      ladurb2     274 - 274      lachrc2     275 - 275
      latime3     276 - 277      launit3     278 - 278
      ladura3     279 - 280      ladurb3     281 - 281
      lachrc3     282 - 282      latime4     283 - 284
      launit4     285 - 285      ladura4     286 - 287
      ladurb4     288 - 288      lachrc4     289 - 289
      latime5     290 - 291      launit5     292 - 292
      ladura5     293 - 294      ladurb5     295 - 295
      lachrc5     296 - 296      latime6     297 - 298
      launit6     299 - 299      ladura6     300 - 301
      ladurb6     302 - 302      lachrc6     303 - 303
      latime7     304 - 305      launit7     306 - 306
      ladura7     307 - 308      ladurb7     309 - 309
      lachrc7     310 - 310      latime8     311 - 312
      launit8     313 - 313      ladura8     314 - 315
      ladurb8     316 - 316      lachrc8     317 - 317
      latime9     318 - 319      launit9     320 - 320
      ladura9     321 - 322      ladurb9     323 - 323
      lachrc9     324 - 324      latime10    325 - 326
      launit10    327 - 327      ladura10    328 - 329
      ladurb10    330 - 330      lachrc10    331 - 331
      latime11    332 - 333      launit11    334 - 334
      ladura11    335 - 336      ladurb11    337 - 337
      lachrc11    338 - 338      latime12    339 - 340
      launit12    341 - 341      ladura12    342 - 343
      ladurb12    344 - 344      lachrc12    345 - 345
      latime13    346 - 347      launit13    348 - 348
      ladura13    349 - 350      ladurb13    351 - 351
      lachrc13    352 - 352      latime14    353 - 354
      launit14    355 - 355      ladura14    356 - 357
      ladurb14    358 - 358      lachrc14    359 - 359
      latime15    360 - 361      launit15    362 - 362
      ladura15    363 - 364      ladurb15    365 - 365
      lachrc15    366 - 366      latime16    367 - 368
      launit16    369 - 369      ladura16    370 - 371
      ladurb16    372 - 372      lachrc16    373 - 373
      latime17    374 - 375      launit17    376 - 376
      ladura17    377 - 378      ladurb17    379 - 379
      lachrc17    380 - 380      latime18    381 - 382
      launit18    383 - 383      ladura18    384 - 385
      ladurb18    386 - 386      lachrc18    387 - 387
      latime19    388 - 389      launit19    390 - 390
      ladura19    391 - 392      ladurb19    393 - 393
      lachrc19    394 - 394      latime20    395 - 396
      launit20    397 - 397      ladura20    398 - 399
      ladurb20    400 - 400      lachrc20    401 - 401
      latime21    402 - 403      launit21    404 - 404
      ladura21    405 - 406      ladurb21    407 - 407
      lachrc21    408 - 408      latime22    409 - 410
      launit22    411 - 411      ladura22    412 - 413
      ladurb22    414 - 414      lachrc22    415 - 415
      latime23    416 - 417      launit23    418 - 418
      ladura23    419 - 420      ladurb23    421 - 421
      lachrc23    422 - 422      latime24    423 - 424
      launit24    425 - 425      ladura24    426 - 427
      ladurb24    428 - 428      lachrc24    429 - 429
      latime25    430 - 431      launit25    432 - 432
      ladura25    433 - 434      ladurb25    435 - 435
      lachrc25    436 - 436      latime26    437 - 438
      launit26    439 - 439      ladura26    440 - 441
      ladurb26    442 - 442      lachrc26    443 - 443
      latime27    444 - 445      launit27    446 - 446
      ladura27    447 - 448      ladurb27    449 - 449
      lachrc27    450 - 450      latime28    451 - 452
      launit28    453 - 453      ladura28    454 - 455
      ladurb28    456 - 456      lachrc28    457 - 457
      latime29    458 - 459      launit29    460 - 460
      ladura29    461 - 462      ladurb29    463 - 463
      lachrc29    464 - 464      latime30    465 - 466
      launit30    467 - 467      ladura30    468 - 469
      ladurb30    470 - 470      lachrc30    471 - 471
      latime31    472 - 473      launit31    474 - 474
      ladura31    475 - 476      ladurb31    477 - 477
      lachrc31    478 - 478      latime32    479 - 480
      launit32    481 - 481      ladura32    482 - 483
      ladurb32    484 - 484      lachrc32    485 - 485
      latime33    486 - 487      launit33    488 - 488
      ladura33    489 - 490      ladurb33    491 - 491
      lachrc33    492 - 492      latime34    493 - 494
      launit34    495 - 495      ladura34    496 - 497
      ladurb34    498 - 498      lachrc34    499 - 499
      latime90    500 - 501      launit90    502 - 502
      ladura90    503 - 504      ladurb90    505 - 505
      lachrc90    506 - 506      latime91    507 - 508
      launit91    509 - 509      ladura91    510 - 511
      ladurb91    512 - 512      lachrc91    513 - 513
      lcondrt     514 - 514      lachronr    515 - 515
      phstat      516 - 516

      pdmed12m    517 - 517      pnmed12m    518 - 518
      phospyr     519 - 519      hospno      520 - 522
      hpnite      523 - 525      phchm2w     526 - 526
      phchmn2w    527 - 528      phcph2wr    529 - 529
      phcphn2w    530 - 531      phcdv2w     532 - 532
      phcdvn2w    533 - 534      p10dvyr     535 - 535

      notcov      536 - 536      medicare    537 - 537
      mcpart      538 - 538      mcchoice    539 - 539
      mchmo       540 - 540      mcnamen     541 - 542
      mcref       543 - 543      mcpaypre    544 - 544
      mcrxcard    545 - 545      medicaid    546 - 546
      machmd      547 - 547      mapcmd      548 - 548
      maref       549 - 549      single      550 - 550
      sstypea     551 - 551      sstypeb     552 - 552
      sstypec     553 - 553      sstyped     554 - 554
      sstypee     555 - 555      sstypef     556 - 556
      sstypeg     557 - 557      sstypeh     558 - 558
      sstypei     559 - 559      sstypej     560 - 560
      sstypek     561 - 561      sstypel     562 - 562
      private     563 - 563      hitype1     564 - 565
      whonam1     566 - 566      plnwrkn1    567 - 568
      plnpay11    569 - 569      plnpay21    570 - 570
      plnpay31    571 - 571      plnpay41    572 - 572
      plnpay51    573 - 573      plnpay61    574 - 574
      plnpay71    575 - 575      hicostr1    576 - 580
      plnmgd1     581 - 581      mgchmd1     582 - 582
      mgprmd1     583 - 583      mgpymd1     584 - 584
      mgpref1     585 - 585      prrxcov1    586 - 586
      hitype2     587 - 588      whonam2     589 - 589
      plnwrkn2    590 - 591      plnpay12    592 - 592
      plnpay22    593 - 593      plnpay32    594 - 594
      plnpay42    595 - 595      plnpay52    596 - 596
      plnpay62    597 - 597      plnpay72    598 - 598
      hicostr2    599 - 603      plnmgd2     604 - 604
      mgchmd2     605 - 605      mgprmd2     606 - 606
      mgpymd2     607 - 607      mgpref2     608 - 608
      prrxcov2    609 - 609      prplplus    610 - 610
      schip       611 - 611      stdoc1      612 - 612
      stpcmd1     613 - 613      stref1      614 - 614
      otherpub    615 - 615      stdoc2      616 - 616
      stpcmd2     617 - 617      stref2      618 - 618
      othergov    619 - 619      stdoc3      620 - 620
      stpcmd3     621 - 621      stref3      622 - 622
      military    623 - 623      milspc1     624 - 624
      milspc2     625 - 625      milspc3     626 - 626
      milspc4     627 - 627      milman      628 - 628
      ihs         629 - 629      hilast      630 - 630
      histop1     631 - 631      histop2     632 - 632
      histop3     633 - 633      histop4     634 - 634
      histop5     635 - 635      histop6     636 - 636
      histop7     637 - 637      histop8     638 - 638
      histop9     639 - 639      histop10    640 - 640
      histop11    641 - 641      histop12    642 - 642
      histop13    643 - 643      histop14    644 - 644
      histop15    645 - 645      hinotyr     646 - 646
      hinotmyr    647 - 648      hcspfyr     649 - 649
      hikinda     650 - 650      hikindb     651 - 651
      hikindc     652 - 652      hikindd     653 - 653
      hikinde     654 - 654      hikindf     655 - 655
      hikindg     656 - 656      hikindh     657 - 657
      hikindi     658 - 658      hikindj     659 - 659
      hikindk     660 - 660      mcareprb    661 - 661
      mcaidprb    662 - 662      sincov      663 - 663

      plborn      664 - 664      regionbr    665 - 666
      geobrth     667 - 667      yrsinus     668 - 668
      citizenp    669 - 669      headst      670 - 670
      headstv1    671 - 671      educ1       672 - 673
      pmiltry     674 - 674      doinglwp    675 - 675
      whynowkp    676 - 677      wrkhrs2     678 - 679
      wrkftall    680 - 680      wrklyr1     681 - 681
      wrkmyr      682 - 683      ernyr_p     684 - 685
      hiempof     686 - 686

      psal        687 - 687      pseinc      688 - 688
      pssrr       689 - 689      pssrrdb     690 - 690
      pssrrd      691 - 691      ppens       692 - 692
      popens      693 - 693      pssi        694 - 694
      pssid       695 - 695      ptanf       696 - 696
      powben      697 - 697      pintrstr    698 - 698
      pdivd       699 - 699      pchldsp     700 - 700
      pincot      701 - 701      pssapl      702 - 702
      psdapl      703 - 703      tanfmyr     704 - 705
      pfstp       706 - 706      fstpmyr     707 - 708
      eligpwic    709 - 709      pwic        710 - 710
      wic_flag    711 - 711

using "$DAT/2005/personsx.dat";
replace wtia = wtia/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: Household Serial Number";
label variable intv_qrt "IDN.000_25.000: Interview Quarter";
label variable assignwk "IDN.000_30.000: Assignment Week";
label variable fmx      "IDN.000_35.000: Family #";
label variable fpx      "IDN.000_40.000: Person #";
label variable wtia     "IDN.000_65.000: Weight - Interim Annual";
label variable wtfa     "IDN.000_70.000: Weight - Final Annual";

label variable region   "UCF.000_00.000: Region";
label variable stratum  "UCF.000_00.000: Stratum for variance estimation";
label variable psu      "UCF.000_00.000: PSU for variance estimation";

label variable sex      "HHC.110_00.000: Sex";
label variable origin_i "HHC.170_00.000: Hispanic Ethnicity";
label variable origimpt "HHC.170_00.000: Hispanic Origin Imputation Flag";
label variable hispan_i "HHC.180_00.000: Hispanic subgroup detail";
label variable hispimpt "HHC.180_00.000: Type of Hispanic Origin Imputation Flag
";
label variable racerpi2 "HHC.200_01.000: OMB groups w/multiple race";
label variable raceimp2 "HHC.200_01.000: Race Imputation Flag";
label variable mracrpi2 "
HHC.200_01.000: Race coded to single/multiple race group";
label variable mracbpi2 "
HHC.200_01.000: Race coded to single/multiple race group";
label variable racreci2 "HHC.200_01.000: Race Recode";
label variable hiscodi2 "HHC.200_01.000: Race/ethnicity recode";
label variable erimpflg "HHC.200_01.000: Ethnicity/Race Imputation Flag";
label variable nowaf    "HHC.230_03.000: Armed Forces Status";
label variable rrp      "HHC.260_01.000: Relationship to the HH reference person
";
label variable hhreflg  "HHC.260_01.000: HH Reference Person Flag";
label variable frrp     "HHC.260_02.000: Relationship to family ref. Person";
label variable dob_m    "HHC.405_00.000: Month of Birth";
label variable dob_y_p  "HHC.415_00.000: Year of Birth";
label variable age_p    "HHC.420_00.000: Age";
label variable age_chg  "
HHC.425_00.000: Indication of AGE correction due to data entry error";

label variable fmrpflg  "FID.060_00.000: Family Respondent Flag";
label variable fmreflg  "FID.060_00.000: Family Reference Person Flag";
label variable r_maritl "FID.250_00.000: Marital Status";
label variable cohab1   "FID.280_00.000: Cohabiting person ever married";
label variable cohab2   "
FID.290_00.000: Cohabiting person's current marital status";
label variable cdcmstat "FID.300_00.000: CDC standard for legal marital status";
label variable sib_deg  "FID.300_00.000: Degree of sib rel to HH ref person";
label variable fmother  "FID.326_00.000: Person # of mother";
label variable mom_deg  "FID.330_01.000: Type of relationship with Mother";
label variable ffather  "FID.340_00.000: Person # of father";
label variable dad_deg  "FID.350_01.000: Type of relationship with Father";
label variable parents  "FID.360_01.000: Parent(s) present in the family";
label variable mom_ed   "FID.360_01.000: Education of Mother";
label variable dad_ed   "FID.360_01.000: Education of Father";
label variable astatflg "FID.360_01.000: Sample Adult Flag";
label variable cstatflg "FID.360_01.000: Sample Child Flag";

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
label variable la1ar    "FHS.260_00.000: Any limitation - all persons, all conds
";
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
label variable lcdura1  "FHS.280_02.000: Duration of vision problem (in years)";
label variable lcdurb1  "FHS.280_02.000: Duration of vision problem recode 2";
label variable lcchrc1  "FHS.280_02.000: Vision problem condition status";
label variable lctime2  "
FHS.282_01.000: Duration of hearing problem: Number of units";
label variable lcunit2  "FHS.282_02.000: Duration of hearing problem: Time unit
";
label variable lcdura2  "FHS.282_02.000: Duration of hearing problem (in years)
";
label variable lcdurb2  "FHS.282_02.000: Duration of hearing problem recode 2";
label variable lcchrc2  "FHS.282_02.000: Hearing problem condition status";
label variable lctime3  "
FHS.284_01.000: Duration of speech problem: Number of units";
label variable lcunit3  "FHS.284_02.000: Duration of speech problem: Time unit";
label variable lcdura3  "FHS.284_02.000: Duration of speech problem (in years)";
label variable lcdurb3  "FHS.284_02.000: Duration of speech problem recode 2";
label variable lcchrc3  "FHS.284_02.000: Speech problem condition status";
label variable lctime4  "
FHS.286_01.000: Duration of asthma/breathing problem: Number of units";
label variable lcunit4  "
FHS.286_02.000: Duration of asthma/breathing problem: Time unit";
label variable lcdura4  "
FHS.286_02.000: Duration of asthma/breathing problem (in years)";
label variable lcdurb4  "
FHS.286_02.000: Duration of asthma/breathing problem recode 2";
label variable lcchrc4  "
FHS.286_02.000: Asthma/breathing problem condition status";
label variable lctime5  "
FHS.287_01.000: Duration of birth defect: Number of units";
label variable lcunit5  "FHS.287_02.000: Duration of birth defect: Time unit";
label variable lcdura5  "FHS.287_02.000: Duration of birth defect (in years)";
label variable lcdurb5  "FHS.287_02.000: Duration of birth defect recode 2";
label variable lcchrc5  "FHS.287_02.000: Birth defect condition status";
label variable lctime6  "FHS.288_01.000: Duration of injury: Number of units";
label variable lcunit6  "FHS.288_02.000: Duration of injury: Time unit";
label variable lcdura6  "FHS.288_02.000: Duration of injury (in years)";
label variable lcdurb6  "FHS.288_02.000: Duration of injury recode 2";
label variable lcchrc6  "FHS.288_02.000: Injury condition status";
label variable lctime7  "
FHS.290_01.000: Duration of mental retardation: Number of units";
label variable lcunit7  "
FHS.290_02.000: Duration of mental retardation: Time unit";
label variable lcdura7  "
FHS.290_02.000: Duration of mental retardation (in years)";
label variable lcdurb7  "FHS.290_02.000: Duration of mental retardation recode 2
";
label variable lcchrc7  "FHS.290_02.000: Mental retardation condition status";
label variable lctime8  "
FHS.292_01.000: Duration of other developmental problem: Number of units";
label variable lcunit8  "
FHS.292_02.000: Duration of other developmental problem: Time unit";
label variable lcdura8  "
FHS.292_02.000: Duration of other developmental problem (in years)";
label variable lcdurb8  "
FHS.292_02.000: Duration of other developmental problem recode 2";
label variable lcchrc8  "
FHS.292_02.000: Other developmental problem condition status";
label variable lctime9  "
FHS.294_01.000: Duration of other mental/emot/behav problem: Number of units";
label variable lcunit9  "
FHS.294_02.000: Duration of otr ment/emot/behav problem: Number of units";
label variable lcdura9  "
FHS.294_02.000: Duration of other mental/emot/behav problem (in years)";
label variable lcdurb9  "
FHS.294_02.000: Duration of other mental/emotional/behavioral prob recode 2";
label variable lcchrc9  "
FHS.294_02.000: Other mental/emotional/behavioral problem condition status";
label variable lctime10 "
FHS.296_01.000: Duration of bone/joint/muscle problem: Number of units";
label variable lcunit10 "
FHS.296_02.000: Duration of bone/joint/muscle problem: Time unit";
label variable lcdura10 "
FHS.296_02.000: Duration of bone/joint/muscle problem (in years)";
label variable lcdurb10 "
FHS.296_02.000: Duration of bone/joint/muscle problem recode 2";
label variable lcchrc10 "
FHS.296_02.000: Bone/joint/muscle problem condition status";
label variable lctime11 "
FHS.298_01.000: Duration of epilepsy/seizures: Number of units";
label variable lcunit11 "
FHS.298_02.000: Duration of epilepsy/seizures: Time unit";
label variable lcdura11 "
FHS.298_02.000: Duration of epilepsy/seizures (in years)";
label variable lcdurb11 "FHS.298_02.000: Duration of epilepsy/seizures recode 2
";
label variable lcchrc11 "FHS.298_02.000: Epilepsy/seizures condition status";
label variable lctime12 "
FHS.300_01.000: Duration of learning disability: Number of units";
label variable lcunit12 "
FHS.300_02.000: Duration of learning disability: Time unit";
label variable lcdura12 "
FHS.300_02.000: Duration of learning disability (in years)";
label variable lcdurb12 "
FHS.300_02.000: Duration of learning disability recode 2";
label variable lcchrc12 "FHS.300_02.000: Learning disability condition status";
label variable lctime13 "FHS.302_01.000: Duration of ADD/ADHD: Number of units";
label variable lcunit13 "FHS.302_02.000: Duration of ADD/ADHD: Time unit";
label variable lcdura13 "FHS.302_02.000: Duration of ADD/ADHD (in years)";
label variable lcdurb13 "FHS.302_02.000: Duration of ADD/ADHD recode 2";
label variable lcchrc13 "FHS.302_02.000: ADD/ADHD condition status";
label variable lctime90 "
FHS.304_01.000: Duration of other impairment problem (1): Number of units";
label variable lcunit90 "
FHS.304_02.000: Duration of other impairment/problem (1): Time unit";
label variable lcdura90 "
FHS.304_02.000: Duration of other impairment/problem (1) (in years)";
label variable lcdurb90 "
FHS.304_02.000: Duration of other impairment/problem (1) recode 2";
label variable lcchrc90 "
FHS.304_02.000: Other impairment/problem (1) condition status";
label variable lctime91 "
FHS.306_01.000: Duration of other impairment/problem (2): Number of units";
label variable lcunit91 "
FHS.306_02.000: Duration of other impairment/problem (2): Time unit";
label variable lcdura91 "
FHS.306_02.000: Duration of other impairment/problem (2) (in years)";
label variable lcdurb91 "
FHS.306_02.000: Duration of other impairment/problem (2) recode 2";
label variable lcchrc91 "
FHS.306_02.000: Other impairment/problem (2) condition status";
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
label variable lahca19_ "FHS.350_18.000: Missing or amputated limb/finger/digit
";
label variable lahca20_ "
FHS.350_18.000: Musculoskeletal/connective tissue problem";
label variable lahca21_ "FHS.350_18.000: Circulation problem";
label variable lahca22_ "FHS.350_18.000: Endocrine/nutritional/metabolic problem
";
label variable lahca23_ "FHS.350_18.000: Nervous system/sensory organ condition
";
label variable lahca24_ "FHS.350_18.000: Digestive system problem";
label variable lahca25_ "FHS.350_18.000: Genitourinary system problem";
label variable lahca26_ "FHS.350_18.000: Skin/subcutaneous system problem";
label variable lahca27_ "FHS.350_18.000: Blood or blood-forming organ problem";
label variable lahca28_ "FHS.350_18.000: Benign tumor/cyst";
label variable lahca29_ "FHS.350_18.000: Alcohol/drug/substance abuse problem";
label variable lahca30_ "
FHS.350_18.000: Otr mental problem/ADD/bipolar/schizophrenia";
label variable lahca31_ "
FHS.350_18.000: Surgical after-effects/medical treatment";
label variable lahca32_ "'Old age'/elderly/aging-related problem";
label variable lahca33_ "FHS.350_18.000: Fatigue/tiredness/weakness";
label variable lahca34_ "FHS.350_18.000: Pregnancy-related problem";
label variable lahca90  "
FHS.350_90.000: Other impair/problem(1) causes limitation";
label variable lahca91  "
FHS.350_91.000: Other impair/problem(2) causes limitation";
label variable latime1  "
FHS.360_01.000: Duration of vision problem: Number of units";
label variable launit1  "FHS.360_02.000: Duration of vision problem: Time unit";
label variable ladura1  "FHS.360_02.000: Duration of vision problem (in years)";
label variable ladurb1  "FHS.360_02.000: Duration of vision problem recode 2";
label variable lachrc1  "FHS.360_02.000: Vision problem condition status";
label variable latime2  "
FHS.362_01.000: Duration of hearing problem: Number of units";
label variable launit2  "FHS.362_02.000: Duration of hearing problem: Time unit
";
label variable ladura2  "FHS.362_02.000: Duration of hearing problem (in years)
";
label variable ladurb2  "FHS.362_02.000: Duration of hearing problem recode 2";
label variable lachrc2  "FHS.362_02.000: Hearing problem condition status";
label variable latime3  "
FHS.364_01.000: Duration of arthritis/rheumatism: Number of units";
label variable launit3  "
FHS.364_02.000: Duration of arthritis/rheumatism: Time unit";
label variable ladura3  "
FHS.364_02.000: Duration of arthritis/rheumatism (in years)";
label variable ladurb3  "
FHS.364_02.000: Duration of arthritis/rheumatism recode 2";
label variable lachrc3  "FHS.364_02.000: Arthritis/rheumatism condition status";
label variable latime4  "
FHS.366_01.000: Duration of back/neck problem: Number of units";
label variable launit4  "
FHS.366_02.000: Duration of back/neck problem: Time unit";
label variable ladura4  "
FHS.366_02.000: Duration of back/neck problem (in years)";
label variable ladurb4  "FHS.366_02.000: Duration of back/neck problem recode 2
";
label variable lachrc4  "FHS.366_02.000: Back/neck problem condition status";
label variable latime5  "
FHS.368_01.000: Duration of fracture/bone/joint injury: Number of units";
label variable launit5  "
FHS.368_02.000: Duration of fracture/bone/joint injury: Time unit";
label variable ladura5  "
FHS.368_02.000: Duration of fracture/bone/joint injury (in years)";
label variable ladurb5  "
FHS.368_02.000: Duration of fracture/bone/joint injury recode 2";
label variable lachrc5  "
FHS.368_02.000: Fracture/bone/joint injury condition status";
label variable latime6  "
FHS.370_01.000: Duration of other injury: Number of units";
label variable launit6  "FHS.370_02.000: Duration of other injury: Time unit";
label variable ladura6  "FHS.370_02.000: Duration of other injury (in years)";
label variable ladurb6  "FHS.370_02.000: Duration of other injury recode 2";
label variable lachrc6  "FHS.370_02.000: Other injury condition status";
label variable latime7  "
FHS.372_01.000: Duration of heart problem: Number of units";
label variable launit7  "FHS.372_02.000: Duration of heart problem: Time unit";
label variable ladura7  "FHS.372_02.000: Duration of heart problem (in years)";
label variable ladurb7  "FHS.372_02.000: Duration of heart problem recode 2";
label variable lachrc7  "FHS.372_02.000: Heart problem condition status";
label variable latime8  "FHS.374_01.000: Duration of stroke: Number of units";
label variable launit8  "FHS.374_02.000: Duration of stroke: Time unit";
label variable ladura8  "FHS.374_02.000: Duration of stroke (in years)";
label variable ladurb8  "FHS.374_02.000: Duration of stroke recode 2";
label variable lachrc8  "FHS.374_02.000: Stroke condition status";
label variable latime9  "
FHS.376_01.000: Duration of hypertension: Number of units";
label variable launit9  "FHS.376_02.000: Duration of hypertension: Time unit";
label variable ladura9  "FHS.376_02.000: Duration of hypertension (in years)";
label variable ladurb9  "FHS.376_02.000: Duration of hypertension recode 2";
label variable lachrc9  "FHS.376_02.000: Hypertension condition status";
label variable latime10 "FHS.378_01.000: Duration of diabetes: Number of units";
label variable launit10 "FHS.378_02.000: Duration of diabetes: Time unit";
label variable ladura10 "FHS.378_02.000: Duration of diabetes (in years)";
label variable ladurb10 "FHS.378_02.000: Duration of diabetes recode 2";
label variable lachrc10 "FHS.378_02.000: Diabetes condition status";
label variable latime11 "
FHS.380_01.000: Duration of lung/breathing problem: Number of units";
label variable launit11 "
FHS.380_02.000: Duration of lung/breath problem: Time unit";
label variable ladura11 "
FHS.380_02.000: Duration of lung/breathing problem (in years)";
label variable ladurb11 "
FHS.380_02.000: Duration of lung/breathing problem recode 2";
label variable lachrc11 "FHS.380_02.000: Lung/breathing problem condition status
";
label variable latime12 "FHS.382_01.000: Duration of cancer: Number of units";
label variable launit12 "FHS.382_02.000: Duration of cancer: Time unit";
label variable ladura12 "FHS.382_02.000: Duration of cancer (in years)";
label variable ladurb12 "FHS.382_02.000: Duration of cancer recode 2";
label variable lachrc12 "FHS.382_02.000: Cancer condition status";
label variable latime13 "
FHS.383_01.000: Duration of birth defect: Number of units";
label variable launit13 "FHS.383_02.000: Duration of birth defect: Time unit";
label variable ladura13 "FHS.383_02.000: Duration of birth defect (in years)";
label variable ladurb13 "FHS.383_02.000: Duration of birth defect recode 2";
label variable lachrc13 "FHS.383_02.000: Birth defect condition status";
label variable latime14 "
FHS.384_01.000: Duration of ment retardation: Number of units";
label variable launit14 "FHS.384_02.000: Duration of ment retardation: Time unit
";
label variable ladura14 "
FHS.384_02.000: Duration of mental retardation (in years)";
label variable ladurb14 "FHS.384_02.000: Duration of mental retardation recode 2
";
label variable lachrc14 "FHS.384_02.000: Mental retardation condition status";
label variable latime15 "
FHS.386_01.000: Duration of other developmental problem: Number of units";
label variable launit15 "FHS.386_02.000: Duration of otr dev problem: Time unit
";
label variable ladura15 "
FHS.386_02.000: Duration of other developmental problem (in years)";
label variable ladurb15 "
FHS.386_02.000: Duration of other developmental problem recode 2";
label variable lachrc15 "
FHS.386_02.000: Other developmental problem condition status";
label variable latime16 "FHS.388_01.000: Duration of senility: Number of units";
label variable launit16 "FHS.388_02.000: Duration of senility: Time unit";
label variable ladura16 "FHS.388_02.000: Duration of senility (in years)";
label variable ladurb16 "FHS.388_02.000: Duration of senility recode 2";
label variable lachrc16 "FHS.388_02.000: Senility condition status";
label variable latime17 "
FHS.390_01.000: Duration of dep/anx/emot problem: Number of units";
label variable launit17 "
FHS.390_02.000: Duration of dep/anx/emot problem: Time unit";
label variable ladura17 "
FHS.390_02.000: Duration of depression/anxiety/emotional problem (in years)";
label variable ladurb17 "
FHS.390_02.000: Duration of depression/anxiety/emotional problem recode 2";
label variable lachrc17 "
FHS.390_02.000: Depression/anxiety/emotional problem condition status";
label variable latime18 "
FHS.392_01.000: Duration of weight problem: Number of units";
label variable launit18 "FHS.392_02.000: Duration of weight problem: Time unit";
label variable ladura18 "FHS.392_02.000: Duration of weight problem (in years)";
label variable ladurb18 "FHS.392_02.000: Duration of weight problem recode 2";
label variable lachrc18 "FHS.392_02.000: Weight problem condition status";
label variable latime19 "
FHS.394_01.000: Duration of missing limb/amputation: Number of units";
label variable launit19 "
FHS.394_02.000: Duration of missing limb/amputation: Time unit";
label variable ladura19 "
FHS.394_02.000: Duration of missing limb/amputation (in years)";
label variable ladurb19 "
FHS.394_02.000: Duration of missing limb/amputation recode 2";
label variable lachrc19 "
FHS.394_02.000: Missing limb/amputation condition status";
label variable latime20 "
FHS.396_01.000: Duration of musculoskeletal problem: Number of units";
label variable launit20 "
FHS.396_02.000: Duration of musculoskeletal problem: Time unit";
label variable ladura20 "
FHS.396_02.000: Duration of musculoskeletal problem (in years)";
label variable ladurb20 "
FHS.396_02.000: Duration of musculoskeletal problem recode 2";
label variable lachrc20 "
FHS.396_02.000: Musculoskeletal problem condition status";
label variable latime21 "
FHS.398_01.000: Duration of circulatory problem: Number of units";
label variable launit21 "
FHS.398_02.000: Duration of circulatory problem: Time unit";
label variable ladura21 "
FHS.398_02.000: Duration of circulatory problem (in years)";
label variable ladurb21 "
FHS.398_02.000: Duration of circulatory problem recode 2";
label variable lachrc21 "FHS.398_02.000: Circulatory problem condition status";
label variable latime22 "
FHS.400_01.000: Duration of endocrine problem: Number of units";
label variable launit22 "
FHS.400_02.000: Duration of endocrine problem: Time unit";
label variable ladura22 "
FHS.400_02.000: Duration of endocrine problem (in years)";
label variable ladurb22 "FHS.400_02.000: Duration of endocrine problem recode 2
";
label variable lachrc22 "FHS.400_02.000: Endocrine problem condition status";
label variable latime23 "
FHS.402_01.000: Duration of nervous system condition: Number of units";
label variable launit23 "
FHS.402_02.000: Duration of nervous system condition: Time unit";
label variable ladura23 "
FHS.402_02.000: Duration of nervous system condition (in years)";
label variable ladurb23 "
FHS.402_02.000: Duration of nervous system condition recode 2";
label variable lachrc23 "FHS.402_02.000: Nervous system condition status";
label variable latime24 "
FHS.404_01.000: Duration of digestive problems: Number of units";
label variable launit24 "
FHS.404_02.000: Duration of digestive problems: Number of units";
label variable ladura24 "
FHS.404_02.000: Duration of digestive problem (in years)";
label variable ladurb24 "FHS.404_02.000: Duration of digestive problem recode 2
";
label variable lachrc24 "FHS.404_02.000: Digestive problem condition status";
label variable latime25 "
FHS.406_01.000: Duration of genitourinary problem: Number of units";
label variable launit25 "
FHS.406_02.000: Duration of genitourinary problem: Time unit";
label variable ladura25 "
FHS.406_02.000: Duration of genitourinary problem (in years)";
label variable ladurb25 "
FHS.406_02.000: Duration of genitourinary problem recode 2";
label variable lachrc25 "FHS.406_02.000: Genitourinary problem condition status
";
label variable latime26 "
FHS.408_01.000: Duration of skin problems: Number of units";
label variable launit26 "FHS.408_02.000: Duration of skin problems: Time unit";
label variable ladura26 "FHS.408_02.000: Duration of skin problem (in years)";
label variable ladurb26 "FHS.408_02.000: Duration of skin problem recode 2";
label variable lachrc26 "FHS.408_02.000: Skin problems condition status";
label variable latime27 "
FHS.410_01.000: Duration of blood problem: Number of units";
label variable launit27 "FHS.410_02.000: Duration of blood problem: Time unit";
label variable ladura27 "FHS.410_02.000: Duration of blood problem (in years)";
label variable ladurb27 "FHS.410_02.000: Duration of blood problem recode 2";
label variable lachrc27 "FHS.410_02.000: Blood problem condition status";
label variable latime28 "
FHS.412_01.000: Duration of benign tumor: Number of units";
label variable launit28 "FHS.412_02.000: Duration of benign tumor: Time unit";
label variable ladura28 "FHS.412_02.000: Duration of benign tumor (in years)";
label variable ladurb28 "FHS.412_02.000: Duration of benign tumor recode 2";
label variable lachrc28 "FHS.412_02.000: Benign tumor condition status";
label variable latime29 "
FHS.414_01.000: Duration of alcohol or drug problem: Number of units";
label variable launit29 "
FHS.414_02.000: Duration of alcohol or drug problem: Time unit";
label variable ladura29 "
FHS.414_02.000: Duration of alcohol or drug problem (in years)";
label variable ladurb29 "
FHS.414_02.000: Duration of alcohol or drug problem recode 2";
label variable lachrc29 "
FHS.414_02.000: Alcohol or drug problem condition status";
label variable latime30 "
FHS.416_01.000: Duration of other mental problem: Number of units";
label variable launit30 "
FHS.416_02.000: Duration of other mental problem: Time unit";
label variable ladura30 "
FHS.416_02.000: Duration of other mental problem (in years)";
label variable ladurb30 "
FHS.416_02.000: Duration of other mental problem recode 2";
label variable lachrc30 "FHS.416_02.000: Other mental problem condition status";
label variable latime31 "
FHS.418_01.000: Duration of surgical after-effects: Number of units";
label variable launit31 "
FHS.418_02.000: Duration of surgical after-effects: Time unit";
label variable ladura31 "
FHS.418_02.000: Duration of surgical after-effects (in years)";
label variable ladurb31 "
FHS.418_02.000: Duration of surgical after-effects recode 2";
label variable lachrc31 "FHS.418_02.000: Surgical after-effects condition status
";
label variable latime32 "Duration of 'old age': Number of units";
label variable launit32 "Duration of 'old age': Number of units";
label variable ladura32 "Duration of 'old age' (in years)";
label variable ladurb32 "Duration of 'old age' recode 2";
label variable lachrc32 "'Old age' condition status";
label variable latime33 "
FHS.422_01.000: Duration of fatigue problem: Number of units";
label variable launit33 "FHS.422_02.000: Duration of fatigue problem: Time unit
";
label variable ladura33 "FHS.422_02.000: Duration of fatigue problem (in years)
";
label variable ladurb33 "FHS.422_02.000: Duration of fatigue problem recode 2";
label variable lachrc33 "FHS.422_02.000: Fatigue problem condition status";
label variable latime34 "
FHS.424_01.000: Duration of pregnancy-related problem: Number of units";
label variable launit34 "
FHS.424_02.000: Duration of pregnancy-related problem: Time unit";
label variable ladura34 "
FHS.424_02.000: Duration of pregnancy-related problem (in years)";
label variable ladurb34 "
FHS.424_02.000: Duration of pregnancy-related problem recode 2";
label variable lachrc34 "FHS.424_02.000: Pregnancy-related condition status";
label variable latime90 "
FHS.450_01.000: Duration of other N.E.C. problem (1): Number of units";
label variable launit90 "
FHS.450_02.000: Duration of other N.E.C. problem (1): Time unit";
label variable ladura90 "
FHS.450_02.000: Duration of other N.E.C. problem (1) (in years)";
label variable ladurb90 "
FHS.450_02.000: Duration of other N.E.C. problem (1) recode 2";
label variable lachrc90 "
FHS.450_02.000: Other N.E.C. problem (1) condition status";
label variable latime91 "
FHS.452_01.000: Duration of other N.E.C. problem (2): Number of units";
label variable launit91 "
FHS.452_02.000: Duration of other N.E.C. problem (2): Time unit";
label variable ladura91 "
FHS.452_02.000: Duration of other N.E.C. problem (2) (in years)";
label variable ladurb91 "
FHS.452_02.000: Duration of other N.E.C. problem (2) recode2";
label variable lachrc91 "
FHS.452_02.000: Other N.E.C. problem (2) condition status";
label variable lcondrt  "
FHS.452_02.000: Chronic condition recode for person with LA";
label variable lachronr "
FHS.452_02.000: Lim of activ recode by chron cond status";
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
FHI.070_00.000: Cov stat as used in Health United States";
label variable medicare "FHI.070_00.000: Medicare coverage recode";
label variable mcpart   "FHI.090_00.000: Type of Medicare coverage";
label variable mcchoice "FHI.095_00.000: Enrolled in Medicare Advantage Plan";
label variable mchmo    "FHI.100_00.000: Is - - signed up with an HMO";
label variable mcnamen  "FHI.110_00.000: Medicare HMO name";
label variable mcref    "FHI.114_00.000: Need a referral for special care";
label variable mcpaypre "FHI.116_00.000: More comprehensive benefit plan";
label variable mcrxcard "FHI.118_00.000: Medicare prescription drug card";
label variable medicaid "FHI.070_00.000: Medicaid coverage recode";
label variable machmd   "
FHI.120_00.000: Any doc, chooses from a list, doc assigned";
label variable mapcmd   "FHI.140_00.000: Primary care physician for routine care
";
label variable maref    "FHI.150_00.000: Need a referral for special care";
label variable single   "FHI.070_00.000: Single service plan recode";
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
label variable private  "FHI.070_00.000: Private health insurance recode";
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
label variable prplplus "FHI.175_00.000: Person has more than two private plans
";
label variable schip    "FHI.070_00.000: SCHIP coverage recode";
label variable stdoc1   "
FHI.251_00.000: Any doc, chooses from a list, doc assigned (SCHIP)";
label variable stpcmd1  "
FHI.252_00.000: Primary care physician for routine care (SCHIP)";
label variable stref1   "
FHI.253_00.000: Need a referral for special care (SCHIP)";
label variable otherpub "FHI.070_00.000: State-sponsored health plan recode";
label variable stdoc2   "
FHI.258_00.000: Any doc, chooses from a list, doc assigned (OTHERPUB)";
label variable stpcmd2  "
FHI.259_00.000: Primary care physician for routine care (OTHERPUB)";
label variable stref2   "
FHI.260_00.000: Need a referral for special care (OTHERPUB)";
label variable othergov "FHI.070_00.000: Other government program recode";
label variable stdoc3   "
FHI.265_00.000: Any doc, chooses from a list, doc assigned (OTHERGOV)";
label variable stpcmd3  "
FHI.266_00.000: Primary care physician for routine care (OTHERGOV)";
label variable stref3   "
FHI.267_00.000: Need a referral for special care (OTHERGOV)";
label variable military "FHI.070_00.000: Military health care coverage recode";
label variable milspc1  "FHI.270_01.000: TRICARE coverage";
label variable milspc2  "FHI.270_02.000: VA coverage";
label variable milspc3  "FHI.270_03.000: CHAMP-VA coverage";
label variable milspc4  "FHI.270_04.000: Other military coverage";
label variable milman   "FHI.275_00.000: Type of TRICARE coverage";
label variable ihs      "FHI.070_00.000: Indian Health Service recode";
label variable hilast   "FHI.280_00.000: How long since last had health coverage
";
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
label variable hinotyr  "
FHI.300_00.000: No health coverage during past 12 months";
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
label variable regionbr "FSD Recode: Geographic region of birth recode";
label variable geobrth  "FSD Recode: Geographic place of birth recode";
label variable yrsinus  "FSD Recode: Years that - - has been in the U.S.";
label variable citizenp "FSD.006_00.000: U.S. citizenship status";
label variable headst   "FSD.007_00.000: Now attending Head Start";
label variable headstv1 "FSD.008_00.000: Ever attended Head Start";
label variable educ1    "FSD.010_00.000: Highest level of school completed";
label variable pmiltry  "FSD.042_00.000: Did - - receive honorable discharge";
label variable doinglwp "FSD.050_00.000: What was - - doing last week";
label variable whynowkp "FSD.060_00.000: Main reason for not working last week";
label variable wrkhrs2  "FSD.070_00.000: Hours worked last week";
label variable wrkftall "FSD.080_00.000: Usually work full time";
label variable wrklyr1  "FSD.100_00.000: Work for pay last year";
label variable wrkmyr   "FSD.110_00.000: Months worked last year";
label variable ernyr_p  "FSD.120_00.000: Total earnings last year";
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
FIN.384_00.000: Anyone age-eligible for the WIC program?";
label variable pwic     "FIN.385_00.000: Received WIC benefits";
label variable wic_flag "FIN.385_00.000: WIC recipient age-eligible";

* DEFINE VALUE LABELS FOR REPORTS;

label define pep001x
   10               "Household"
   20               "Person"
   30               "Sample Adult"
   31               "Sample Adult Cancer"
   40               "Sample Child"
   60               "Family"
   70               "Injury/Poisoning Episode"
   75               "Injury/Poisoning Verbatim"
;
label define pep002x
   2005             "2005"
;
label define pep004x
   1                "Quarter 1"
   2                "Quarter 2"
   3                "Quarter 3"
   4                "Quarter 4"
;
label define pep005x
   01               "Week 1"
   02               "Week 2"
   03               "Week 3"
   04               "Week 4"
   05               "Week 5"
   06               "Week 6"
   07               "Week 7"
   08               "Week 8"
   09               "Week 9"
   10               "Week 10"
   11               "Week 11"
   12               "Week 12"
   13               "Week 13"
;
label define pep010x
   1                "Northeast"
   2                "Midwest"
   3                "South"
   4                "West"
;
label define pep013x
   1                "Male"
   2                "Female"
;
label define pep014x
   1                "Yes"
   2                "No"
;
label define pep015x
   1                "Imputed: was 'refused' Hispanic Origin"
   2                "Imputed: was 'not ascertained' Hispanic Origin"
   3                "Imputed: was 'does not know' Hispanic Origin"
   4                "Hispanic origin given by respondent/proxy"
;
label define pep016x
   00               "Multiple Hispanic"
   01               "Puerto Rico"
   02               "Mexican"
   03               "Mexican-American"
   04               "Cuban/Cuban American"
   05               "Dominican (Republic)"
   06               "Central or South American"
   07               "Other Latin American, type not specified"
   08               "Other Spanish"
   09               "Hispanic/Latino/Spanish, non-specific type"
   10               "Hispanic/Latino/Spanish, type refused"
   11               "Hispanic/Latino/Spanish, type not ascertained"
   12               "Not Hispanic/Spanish origin"
;
label define pep017x
   1                "Imputed: was 'refused' Hispanic Origin"
   2                "Imputed: was 'not ascertained' Hispanic Origin"
   3                "Imputed: was 'does not know' Hispanic Origin"
   4                "Hispanic Origin type given by respondent/proxy"
;
label define pep018x
   01               "White only"
   02               "Black/African American only"
   03               "AIAN only"
   04               "Asian only"
   05               "Race group not releasable (See file layout)"
   06               "Multiple race"
;
label define pep019x
   1                "Imputed: was 'refused'"
   2                "Imputed: was 'not ascertained'"
   3                "Imputed: was 'does not know'"
   4                "Imputed: was other race'"
   5                "Imputed: was 'unspecified multiple race'"
   6                "Race given by respondent/proxy"
;
label define pep020x
   01               "White"
   02               "Black/African American"
   03               "Indian (American), Alaska Native"
   09               "Asian Indian"
   10               "Chinese"
   11               "Filipino"
   15               "Other Asian (See file layout)"
   16               "Primary race not releasable (See file layout)"
   17               "Multiple race, no primary race selected"
;
label define pep021x
   01               "White"
   02               "Black/African American"
   03               "Indian (American) (includes Eskimo, Aleut)"
   06               "Chinese"
   07               "Filipino"
   12               "Asian Indian"
   16               "Other race (See file layout)"
   17               "Multiple race, no primary race selected"
;
label define pep022x
   1                "White"
   2                "Black"
   3                "All other race groups (See file layout)"
;
label define pep023x
   1                "Hispanic"
   2                "Non-Hispanic White"
   3                "Non-Hispanic Black"
   4                "Non-Hispanic All other race groups"
;
label define pep024x
   1                "Ethnicity/race imputed"
   2                "Ethnicity/race given by respondent/proxy"
;
label define pep025x
   1                "Armed Forces"
   2                "Not Armed Forces"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep026x
   01               "Household reference person"
   02               "Spouse (husband/wife)"
   03               "Unmarried Partner"
   04               "Child (biological/adoptive/in-law/step/foster)"
   05               "Child of partner"
   06               "Grandchild"
   07               "Parent (biological/adoptive/in-law/step/foster)"
   08               "Brother/sister (biological/adoptive/in-law/step/foster)"
   09               "Grandparent (Grandmother/Grandfather)"
   10               "Aunt/Uncle"
   11               "Niece/Nephew"
   12               "Other relative"
   13               "Housemate/roommate"
   14               "Roomer/Boarder"
   15               "Other nonrelative"
   16               "Legal guardian"
   17               "Ward"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep028x
   01               "Family reference person"
   02               "Spouse (husband/wife)"
   03               "Unmarried Partner"
   04               "Child (biological/adoptive/in-law/step/foster)"
   05               "Child of partner"
   06               "Grandchild"
   07               "Parent (biological/adoptive/in-law/step/foster)"
   08               "Brother/sister (biological/adoptive/in-law/step/foster)"
   09               "Grandparent (Grandmother/Grandfather)"
   10               "Aunt/Uncle"
   11               "Niece/Nephew"
   12               "Other relative"
   16               "Legal guardian"
   17               "Ward"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep031x
   00               "Under 1 year"
   85               "85+ years"
;
label define pep032x
   1                "Change on AGE due to data entry error"
;
label define pep035x
   0                "Under 14 years"
   1                "Married - spouse in household"
   2                "Married - spouse not in household"
   3                "Married - spouse in household unknown"
   4                "Widowed"
   5                "Divorced"
   6                "Separated"
   7                "Never married"
   8                "Living with partner"
   9                "Unknown marital status"
;
label define pep036x
   1                "Yes"
   2                "No"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep037x
   1                "Married"
   2                "Widowed"
   3                "Divorced"
   4                "Separated"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep038x
   1                "Separated"
   2                "Divorced"
   3                "Married"
   4                "Single/never married"
   5                "Widowed"
   9                "Unknown marital status"
;
label define pep039x
   1                "Full {brother/sister}"
   2                "Half {brother/sister}"
   3                "Adopted {brother/sister}"
   4                "Step {brother/sister}"
   5                "Foster {brother/sister}"
   6                "{Brother/Sister}-in-law"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep040x
   00               "Mother not a household member"
   96               "Has legal guardian"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep041x
   1                "Biological"
   2                "Adoptive"
   3                "Step"
   4                "Foster"
   5                "In-law"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep042x
   00               "Father not in household"
   96               "Has legal guardian"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep044x
   1                "Mother, no father"
   2                "Father, no mother"
   3                "Mother and father"
   4                "Neither mother nor father"
   9                "Unknown"
;
label define pep045x
   01               "Less/equal to 8th grade"
   02               "9-12th grade, no high school diploma"
   03               "High school graduate/GED recipient"
   04               "Some college, no degree"
   05               "AA degree, technical or vocational"
   06               "AA degree, academic program"
   07               "Bachelor's degree"
   08               "Master's, professional, or doctoral degree"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep047x
   0                "Sample Adult - no record"
   1                "Sample Adult - has record"
   2                "Not selected as Sample Adult"
   3                "No one selected as Sample Adult"
   4                "Armed Force member"
   5                "Armed Force member - selected as Sample Adult"
;
label define pep048x
   0                "Sample Child - no record"
   1                "Sample Child - has record"
   2                "Not selected as Sample Child"
   3                "No one selected as Sample Child"
   4                "Emancipated minor"
;
label define pep062x
   0                "Unable to work"
   1                "Limited in work"
   2                "Not limited in work"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't Know"
;
label define pep065x
   0                "Limitation previously mentioned"
   1                "Yes, limited in some other way"
   2                "Not limited in any way"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep066x
   1                "Limited in any way"
   2                "Not limited in any way"
   3                "Unknown if limited"
;
label define pep067x
   1                "Mentioned"
   2                "Not mentioned"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep082x
   95               "95+"
   96               "Since birth"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep083x
   1                "Day(s)"
   2                "Week(s)"
   3                "Month(s)"
   4                "Year(s)"
   6                "Since birth"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep084x
   00               "Less than 1 year"
   96               "Unknown number of years"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep085x
   0                "Since birth and child <1 year of age"
   1                "Less than 3 months"
   2                "3-5 months"
   3                "6-12 months"
   4                "More than 1 year"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep086x
   1                "Chronic"
   2                "Not chronic"
   9                "Unknown if chronic"
;
label define pep195x
   00               "Less than 1 year"
   85               "85+ years"
   96               "Unknown number of years"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep196x
   1                "Less than 3 months"
   2                "3-5 months"
   3                "6-12 months"
   4                "More than 1 year"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep373x
   1                "At least one condition causing LA is chronic"
   2                "No condition causing LA is chronic"
   9                "Unk if any condition causing LA is chronic"
;
label define pep374x
   0                "Not limited in any way (incl unk if limited)"
   1                "Limited; caused by at least one chronic cond"
   2                "Limited; not caused by chronic cond"
   3                "Limited; unk if cond is chronic"
;
label define pep375x
   1                "Excellent"
   2                "Very good"
   3                "Good"
   4                "Fair"
   5                "Poor"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep379x
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define pep380x
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define pep382x
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep384x
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep386x
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep388x
   1                "Not covered"
   2                "Covered"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep389x
   1                "Yes, information"
   2                "Yes, but no information"
   3                "No"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep390x
   1                "Part A - Hospital only"
   2                "Part B - Medical only"
   3                "Both Part A and Part B"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep393x
   04               "Medigap plan"
   12               "Group"
   22               "Staff"
   32               "IPA"
   92               "Other"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep398x
   1                "Any doctor"
   2                "Select from book/list"
   3                "Doctor is assigned"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep401x
   1                "Yes, with information"
   2                "Yes, but no information"
   3                "No"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep415x
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep416x
   1                "In own name"
   2                "Someone else in family"
   3                "Person not in household"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep417x
   01               "Through employer"
   02               "Through union"
   03               "Through workplace, but don't know if employer or union"
   04               "
Through workplace, self-employed or professional association"
   05               "Purchased directly"
   06               "Through a state/local government or community program"
   07               "Other"
   08               "Through school"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep425x
   20000            "$20,000 or more"
   99997            "Refused"
   99998            "Not ascertained"
   99999            "Don't know"
;
label define pep426x
   1                "HMO/IPA"
   2                "PPO"
   3                "POS"
   4                "Fee-for-service/indemnity"
   5                "Other"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep427x
   1                "Any doctor"
   2                "Select from group/list"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep467x
   1                "TRICARE Prime"
   2                "TRICARE Extra"
   3                "TRICARE Standard"
   4                "TRICARE for life"
   5                "TRICARE other (specify)"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep469x
   1                "6 months or less"
   2                "More than 6 months, but not more than 1 year ago"
   3                "More than 1 year, but not more than 3 years ago"
   4                "More than 3 years"
   5                "Never"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep486x
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep487x
   0                "Zero"
   1                "Less than $500"
   2                "$500 - $1,999"
   3                "$2,000 - $2,999"
   4                "$3,000 - $4,999"
   5                "$5,000 or more"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep503x
   01               "United States"
   02               "Mexico, Central America, Caribbean Islands"
   03               "South America"
   04               "Europe"
   05               "Russia (and former USSR areas)"
   06               "Africa"
   07               "Middle East"
   08               "Indian Subcontinent"
   09               "Asia"
   10               "SE Asia"
   11               "Elsewhere"
   99               "Unknown"
;
label define pep504x
   1                "USA: born in one of the 50 United States or D.C."
   2                "USA: born in a U.S. territory"
   3                "Not born in the U.S. or a U.S. territory"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep505x
   1                "Less than 1 year"
   2                "1 yr., less than 5 yrs."
   3                "5 yrs., less than 10 yrs."
   4                "10 yrs., less than 15 yrs."
   5                "15 years or more"
   9                "Unknown"
;
label define pep506x
   1                "Yes, citizen of the United States"
   2                "No, not a citizen of the United States"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep509x
   00               "Never attended/kindergarten only"
   01               "1st grade"
   02               "2nd grade"
   03               "3rd grade"
   04               "4th grade"
   05               "5th grade"
   06               "6th grade"
   07               "7th grade"
   08               "8th grade"
   09               "9th grade"
   10               "10th grade"
   11               "11th grade"
   12               "12th grade, no diploma"
   13               "GED or equivalent"
   14               "High School Graduate"
   15               "Some college, no degree"
   16               "
Associate degree: occupational, technical, or vocational program"
   17               "Associate degree: academic program"
   18               "Bachelor's degree (Example: BA, AB, BS, BBA)"
   19               "Master's degree (Example: MA, MS, MEng, MEd, MBA)"
   20               "Professional School degree (Example: MD, DDS, DVM, JD)"
   21               "Doctoral degree (Example: PhD, EdD)"
   96               "Child under 5 years old"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep511x
   1                "Working for pay at a job or business"
   2                "With a job or business but not at work"
   3                "Looking for work"
   4                "Working, but not for pay, at a job or business"
   5                "Not working at a job or business and not looking for work"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define pep512x
   01               "Taking care of house or family"
   02               "Going to school"
   03               "Retired"
   04               "On a planned vacation from work"
   05               "On family or maternity leave"
   06               "Temporarily unable to work for health reasons"
   07               "Have job/contract and off-season"
   08               "On layoff"
   09               "Disabled"
   10               "Other"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep513x
   95               "95+ hours"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep516x
   01               "1 month or less"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep517x
   01               "$01-$4,999"
   02               "$5,000-$9,999"
   03               "$10,000-$14,999"
   04               "$15,000-$19,999"
   05               "$20,000-$24,999"
   06               "$25,000-$34,999"
   07               "$35,000-$44,999"
   08               "$45,000-$54,999"
   09               "$55,000-$64,999"
   10               "$65,000-$74,999"
   11               "$75,000 and over"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define pep539x
   0                "No WIC age-eligible family members"
   1                "At least 1 WIC age-eligible family member"
;
label define pep541x
   0                "Person not age-eligible"
   1                "Person age-eligible"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   pep001x;   label values srvy_yr   pep002x;
label values intv_qrt  pep004x;   label values assignwk  pep005x;

label values region    pep010x;

label values sex       pep013x;   label values origin_i  pep014x;
label values origimpt  pep015x;   label values hispan_i  pep016x;
label values hispimpt  pep017x;   label values racerpi2  pep018x;
label values raceimp2  pep019x;   label values mracrpi2  pep020x;
label values mracbpi2  pep021x;   label values racreci2  pep022x;
label values hiscodi2  pep023x;   label values erimpflg  pep024x;
label values nowaf     pep025x;   label values rrp       pep026x;
label values frrp      pep028x;   label values age_p     pep031x;
label values age_chg   pep032x;

label values r_maritl  pep035x;   label values cohab1    pep036x;
label values cohab2    pep037x;   label values cdcmstat  pep038x;
label values sib_deg   pep039x;   label values fmother   pep040x;
label values mom_deg   pep041x;   label values ffather   pep042x;
label values dad_deg   pep041x;   label values parents   pep044x;
label values mom_ed    pep045x;   label values dad_ed    pep045x;
label values astatflg  pep047x;   label values cstatflg  pep048x;

label values plaplylm  pep036x;   label values plaplyun  pep036x;
label values pspedeis  pep036x;   label values pspedem   pep036x;
label values plaadl    pep036x;   label values labath    pep036x;
label values ladress   pep036x;   label values laeat     pep036x;
label values labed     pep036x;   label values latoilt   pep036x;
label values lahome    pep036x;   label values plaiadl   pep036x;
label values plawknow  pep036x;   label values plawklim  pep062x;
label values plawalk   pep036x;   label values plaremem  pep036x;
label values plimany   pep065x;   label values la1ar     pep066x;
label values lahcc1    pep067x;   label values lahcc2    pep067x;
label values lahcc3    pep067x;   label values lahcc4    pep067x;
label values lahcc5    pep067x;   label values lahcc6    pep067x;
label values lahcc7    pep067x;   label values lahcc8    pep067x;
label values lahcc9    pep067x;   label values lahcc10   pep067x;
label values lahcc11   pep067x;   label values lahcc12   pep067x;
label values lahcc13   pep067x;   label values lahcc90   pep067x;
label values lahcc91   pep067x;   label values lctime1   pep082x;
label values lcunit1   pep083x;   label values lcdura1   pep084x;
label values lcdurb1   pep085x;   label values lcchrc1   pep086x;
label values lctime2   pep082x;   label values lcunit2   pep083x;
label values lcdura2   pep084x;   label values lcdurb2   pep085x;
label values lcchrc2   pep086x;   label values lctime3   pep082x;
label values lcunit3   pep083x;   label values lcdura3   pep084x;
label values lcdurb3   pep085x;   label values lcchrc3   pep086x;
label values lctime4   pep082x;   label values lcunit4   pep083x;
label values lcdura4   pep084x;   label values lcdurb4   pep085x;
label values lcchrc4   pep086x;   label values lctime5   pep082x;
label values lcunit5   pep083x;   label values lcdura5   pep084x;
label values lcdurb5   pep085x;   label values lcchrc5   pep086x;
label values lctime6   pep082x;   label values lcunit6   pep083x;
label values lcdura6   pep084x;   label values lcdurb6   pep085x;
label values lcchrc6   pep086x;   label values lctime7   pep082x;
label values lcunit7   pep083x;   label values lcdura7   pep084x;
label values lcdurb7   pep085x;   label values lcchrc7   pep086x;
label values lctime8   pep082x;   label values lcunit8   pep083x;
label values lcdura8   pep084x;   label values lcdurb8   pep085x;
label values lcchrc8   pep086x;   label values lctime9   pep082x;
label values lcunit9   pep083x;   label values lcdura9   pep084x;
label values lcdurb9   pep085x;   label values lcchrc9   pep086x;
label values lctime10  pep082x;   label values lcunit10  pep083x;
label values lcdura10  pep084x;   label values lcdurb10  pep085x;
label values lcchrc10  pep086x;   label values lctime11  pep082x;
label values lcunit11  pep083x;   label values lcdura11  pep084x;
label values lcdurb11  pep085x;   label values lcchrc11  pep086x;
label values lctime12  pep082x;   label values lcunit12  pep083x;
label values lcdura12  pep084x;   label values lcdurb12  pep085x;
label values lcchrc12  pep086x;   label values lctime13  pep082x;
label values lcunit13  pep083x;   label values lcdura13  pep084x;
label values lcdurb13  pep085x;   label values lcchrc13  pep086x;
label values lctime90  pep082x;   label values lcunit90  pep083x;
label values lcdura90  pep084x;   label values lcdurb90  pep085x;
label values lcchrc90  pep086x;   label values lctime91  pep082x;
label values lcunit91  pep083x;   label values lcdura91  pep084x;
label values lcdurb91  pep085x;   label values lcchrc91  pep086x;
label values lahca1    pep067x;   label values lahca2    pep067x;
label values lahca3    pep067x;   label values lahca4    pep067x;
label values lahca5    pep067x;   label values lahca6    pep067x;
label values lahca7    pep067x;   label values lahca8    pep067x;
label values lahca9    pep067x;   label values lahca10   pep067x;
label values lahca11   pep067x;   label values lahca12   pep067x;
label values lahca13   pep067x;   label values lahca14   pep067x;
label values lahca15   pep067x;   label values lahca16   pep067x;
label values lahca17   pep067x;   label values lahca18   pep067x;
label values lahca19_  pep067x;   label values lahca20_  pep067x;
label values lahca21_  pep067x;   label values lahca22_  pep067x;
label values lahca23_  pep067x;   label values lahca24_  pep067x;
label values lahca25_  pep067x;   label values lahca26_  pep067x;
label values lahca27_  pep067x;   label values lahca28_  pep067x;
label values lahca29_  pep067x;   label values lahca30_  pep067x;
label values lahca31_  pep067x;   label values lahca32_  pep067x;
label values lahca33_  pep067x;   label values lahca34_  pep067x;
label values lahca90   pep067x;   label values lahca91   pep067x;
label values latime1   pep082x;   label values launit1   pep083x;
label values ladura1   pep195x;   label values ladurb1   pep196x;
label values lachrc1   pep086x;   label values latime2   pep082x;
label values launit2   pep083x;   label values ladura2   pep195x;
label values ladurb2   pep196x;   label values lachrc2   pep086x;
label values latime3   pep082x;   label values launit3   pep083x;
label values ladura3   pep195x;   label values ladurb3   pep196x;
label values lachrc3   pep086x;   label values latime4   pep082x;
label values launit4   pep083x;   label values ladura4   pep195x;
label values ladurb4   pep196x;   label values lachrc4   pep086x;
label values latime5   pep082x;   label values launit5   pep083x;
label values ladura5   pep195x;   label values ladurb5   pep196x;
label values lachrc5   pep086x;   label values latime6   pep082x;
label values launit6   pep083x;   label values ladura6   pep195x;
label values ladurb6   pep196x;   label values lachrc6   pep086x;
label values latime7   pep082x;   label values launit7   pep083x;
label values ladura7   pep195x;   label values ladurb7   pep196x;
label values lachrc7   pep086x;   label values latime8   pep082x;
label values launit8   pep083x;   label values ladura8   pep195x;
label values ladurb8   pep196x;   label values lachrc8   pep086x;
label values latime9   pep082x;   label values launit9   pep083x;
label values ladura9   pep195x;   label values ladurb9   pep196x;
label values lachrc9   pep086x;   label values latime10  pep082x;
label values launit10  pep083x;   label values ladura10  pep195x;
label values ladurb10  pep196x;   label values lachrc10  pep086x;
label values latime11  pep082x;   label values launit11  pep083x;
label values ladura11  pep195x;   label values ladurb11  pep196x;
label values lachrc11  pep086x;   label values latime12  pep082x;
label values launit12  pep083x;   label values ladura12  pep195x;
label values ladurb12  pep196x;   label values lachrc12  pep086x;
label values latime13  pep082x;   label values launit13  pep083x;
label values ladura13  pep195x;   label values ladurb13  pep196x;
label values lachrc13  pep086x;   label values latime14  pep082x;
label values launit14  pep083x;   label values ladura14  pep195x;
label values ladurb14  pep196x;   label values lachrc14  pep086x;
label values latime15  pep082x;   label values launit15  pep083x;
label values ladura15  pep195x;   label values ladurb15  pep196x;
label values lachrc15  pep086x;   label values latime16  pep082x;
label values launit16  pep083x;   label values ladura16  pep195x;
label values ladurb16  pep196x;   label values lachrc16  pep086x;
label values latime17  pep082x;   label values launit17  pep083x;
label values ladura17  pep195x;   label values ladurb17  pep196x;
label values lachrc17  pep086x;   label values latime18  pep082x;
label values launit18  pep083x;   label values ladura18  pep195x;
label values ladurb18  pep196x;   label values lachrc18  pep086x;
label values latime19  pep082x;   label values launit19  pep083x;
label values ladura19  pep195x;   label values ladurb19  pep196x;
label values lachrc19  pep086x;   label values latime20  pep082x;
label values launit20  pep083x;   label values ladura20  pep195x;
label values ladurb20  pep196x;   label values lachrc20  pep086x;
label values latime21  pep082x;   label values launit21  pep083x;
label values ladura21  pep195x;   label values ladurb21  pep196x;
label values lachrc21  pep086x;   label values latime22  pep082x;
label values launit22  pep083x;   label values ladura22  pep195x;
label values ladurb22  pep196x;   label values lachrc22  pep086x;
label values latime23  pep082x;   label values launit23  pep083x;
label values ladura23  pep195x;   label values ladurb23  pep196x;
label values lachrc23  pep086x;   label values latime24  pep082x;
label values launit24  pep083x;   label values ladura24  pep195x;
label values ladurb24  pep196x;   label values lachrc24  pep086x;
label values latime25  pep082x;   label values launit25  pep083x;
label values ladura25  pep195x;   label values ladurb25  pep196x;
label values lachrc25  pep086x;   label values latime26  pep082x;
label values launit26  pep083x;   label values ladura26  pep195x;
label values ladurb26  pep196x;   label values lachrc26  pep086x;
label values latime27  pep082x;   label values launit27  pep083x;
label values ladura27  pep195x;   label values ladurb27  pep196x;
label values lachrc27  pep086x;   label values latime28  pep082x;
label values launit28  pep083x;   label values ladura28  pep195x;
label values ladurb28  pep196x;   label values lachrc28  pep086x;
label values latime29  pep082x;   label values launit29  pep083x;
label values ladura29  pep195x;   label values ladurb29  pep196x;
label values lachrc29  pep086x;   label values latime30  pep082x;
label values launit30  pep083x;   label values ladura30  pep195x;
label values ladurb30  pep196x;   label values lachrc30  pep086x;
label values latime31  pep082x;   label values launit31  pep083x;
label values ladura31  pep195x;   label values ladurb31  pep196x;
label values lachrc31  pep086x;   label values latime32  pep082x;
label values launit32  pep083x;   label values ladura32  pep195x;
label values ladurb32  pep196x;   label values lachrc32  pep086x;
label values latime33  pep082x;   label values launit33  pep083x;
label values ladura33  pep195x;   label values ladurb33  pep196x;
label values lachrc33  pep086x;   label values latime34  pep082x;
label values launit34  pep083x;   label values ladura34  pep195x;
label values ladurb34  pep196x;   label values lachrc34  pep086x;
label values latime90  pep082x;   label values launit90  pep083x;
label values ladura90  pep195x;   label values ladurb90  pep196x;
label values lachrc90  pep086x;   label values latime91  pep082x;
label values launit91  pep083x;   label values ladura91  pep195x;
label values ladurb91  pep196x;   label values lachrc91  pep086x;
label values lcondrt   pep373x;   label values lachronr  pep374x;
label values phstat    pep375x;

label values pdmed12m  pep036x;   label values pnmed12m  pep036x;
label values phospyr   pep036x;   label values hospno    pep379x;
label values hpnite    pep380x;   label values phchm2w   pep036x;
label values phchmn2w  pep382x;   label values phcph2wr  pep036x;
label values phcphn2w  pep384x;   label values phcdv2w   pep036x;
label values phcdvn2w  pep386x;   label values p10dvyr   pep036x;

label values notcov    pep388x;   label values medicare  pep389x;
label values mcpart    pep390x;   label values mcchoice  pep036x;
label values mchmo     pep036x;   label values mcnamen   pep393x;
label values mcref     pep036x;   label values mcpaypre  pep036x;
label values mcrxcard  pep036x;   label values medicaid  pep389x;
label values machmd    pep398x;   label values mapcmd    pep036x;
label values maref     pep036x;   label values single    pep401x;
label values sstypea   pep067x;   label values sstypeb   pep067x;
label values sstypec   pep067x;   label values sstyped   pep067x;
label values sstypee   pep067x;   label values sstypef   pep067x;
label values sstypeg   pep067x;   label values sstypeh   pep067x;
label values sstypei   pep067x;   label values sstypej   pep067x;
label values sstypek   pep067x;   label values sstypel   pep067x;
label values private   pep389x;   label values hitype1   pep415x;
label values whonam1   pep416x;   label values plnwrkn1  pep417x;
label values plnpay11  pep067x;   label values plnpay21  pep067x;
label values plnpay31  pep067x;   label values plnpay41  pep067x;
label values plnpay51  pep067x;   label values plnpay61  pep067x;
label values plnpay71  pep067x;   label values hicostr1  pep425x;
label values plnmgd1   pep426x;   label values mgchmd1   pep427x;
label values mgprmd1   pep036x;   label values mgpymd1   pep036x;
label values mgpref1   pep036x;   label values prrxcov1  pep036x;
label values hitype2   pep415x;   label values whonam2   pep416x;
label values plnwrkn2  pep417x;   label values plnpay12  pep067x;
label values plnpay22  pep067x;   label values plnpay32  pep067x;
label values plnpay42  pep067x;   label values plnpay52  pep067x;
label values plnpay62  pep067x;   label values plnpay72  pep067x;
label values hicostr2  pep425x;   label values plnmgd2   pep426x;
label values mgchmd2   pep427x;   label values mgprmd2   pep036x;
label values mgpymd2   pep036x;   label values mgpref2   pep036x;
label values prrxcov2  pep036x;   label values prplplus  pep036x;
label values schip     pep389x;   label values stdoc1    pep398x;
label values stpcmd1   pep036x;   label values stref1    pep036x;
label values otherpub  pep389x;   label values stdoc2    pep398x;
label values stpcmd2   pep036x;   label values stref2    pep036x;
label values othergov  pep389x;   label values stdoc3    pep398x;
label values stpcmd3   pep036x;   label values stref3    pep036x;
label values military  pep389x;   label values milspc1   pep067x;
label values milspc2   pep067x;   label values milspc3   pep067x;
label values milspc4   pep067x;   label values milman    pep467x;
label values ihs       pep036x;   label values hilast    pep469x;
label values histop1   pep067x;   label values histop2   pep067x;
label values histop3   pep067x;   label values histop4   pep067x;
label values histop5   pep067x;   label values histop6   pep067x;
label values histop7   pep067x;   label values histop8   pep067x;
label values histop9   pep067x;   label values histop10  pep067x;
label values histop11  pep067x;   label values histop12  pep067x;
label values histop13  pep067x;   label values histop14  pep067x;
label values histop15  pep067x;   label values hinotyr   pep036x;
label values hinotmyr  pep486x;   label values hcspfyr   pep487x;
label values hikinda   pep067x;   label values hikindb   pep067x;
label values hikindc   pep067x;   label values hikindd   pep067x;
label values hikinde   pep067x;   label values hikindf   pep067x;
label values hikindg   pep067x;   label values hikindh   pep067x;
label values hikindi   pep067x;   label values hikindj   pep067x;
label values hikindk   pep067x;   label values mcareprb  pep036x;
label values mcaidprb  pep036x;   label values sincov    pep036x;

label values plborn    pep036x;   label values regionbr  pep503x;
label values geobrth   pep504x;   label values yrsinus   pep505x;
label values citizenp  pep506x;   label values headst    pep036x;
label values headstv1  pep036x;   label values educ1     pep509x;
label values pmiltry   pep036x;   label values doinglwp  pep511x;
label values whynowkp  pep512x;   label values wrkhrs2   pep513x;
label values wrkftall  pep036x;   label values wrklyr1   pep036x;
label values wrkmyr    pep516x;   label values ernyr_p   pep517x;
label values hiempof   pep036x;

label values psal      pep036x;   label values pseinc    pep036x;
label values pssrr     pep036x;   label values pssrrdb   pep036x;
label values pssrrd    pep036x;   label values ppens     pep036x;
label values popens    pep036x;   label values pssi      pep036x;
label values pssid     pep036x;   label values ptanf     pep036x;
label values powben    pep036x;   label values pintrstr  pep036x;
label values pdivd     pep036x;   label values pchldsp   pep036x;
label values pincot    pep036x;   label values pssapl    pep036x;
label values psdapl    pep036x;   label values tanfmyr   pep486x;
label values pfstp     pep036x;   label values fstpmyr   pep486x;
label values eligpwic  pep539x;   label values pwic      pep036x;
label values wic_flag  pep541x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa];
save "$OUT/2005/personsx", replace;

#delimit cr

* data file is stored in personsx.dta
* log  file is stored in personsx.log

log close
