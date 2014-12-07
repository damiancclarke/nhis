global DAT "~/database/NHIS/Data/raw/2007"
global OUT "~/database/NHIS/Data/dta/2007"
global LOG "~/database/NHIS/Log"

log using "$LOG/personsx.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 MAY 22, 2008  1:26 PM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2007 NHIS Public Use Person ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE personsx.dta AND personsx.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2007\

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

      region       32 -  32      strat_p      33 -  35
      psu_p        36 -  37

      sex          38 -  38      origin_i     39 -  39
      origimpt     40 -  40      hispan_i     41 -  42
      hispimpt     43 -  43      racerpi2     44 -  45
      raceimp2     46 -  46      mracrpi2     47 -  48
      mracbpi2     49 -  50      racreci3     51 -  51
      hiscodi3     52 -  52      erimpflg     53 -  53
      nowaf        54 -  54      rrp          55 -  56
  str hhreflg      57 -  57      frrp         58 -  59
  str dob_m        60 -  61  str dob_y_p      62 -  65
      age_p        66 -  67      age_chg      68 -  68

  str fmrpflg      69 -  69  str fmreflg      70 -  70
      r_maritl     71 -  71  str fspous2      72 -  73
      cohab1       74 -  74      cohab2       75 -  75
  str fcohab3      76 -  77      cdcmstat     78 -  78
      sib_deg      79 -  79  str fmother      80 -  81
      mom_deg      82 -  82  str ffather      83 -  84
      dad_deg      85 -  85      parents      86 -  86
      mom_ed       87 -  88      dad_ed       89 -  90
      astatflg     91 -  91      cstatflg     92 -  92

      plaplylm     93 -  93      plaplyun     94 -  94
      pspedeis     95 -  95      pspedem      96 -  96
      plaadl       97 -  97      labath       98 -  98
      ladress      99 -  99      laeat       100 - 100
      labed       101 - 101      latoilt     102 - 102
      lahome      103 - 103      plaiadl     104 - 104
      plawknow    105 - 105      plawklim    106 - 106
      plawalk     107 - 107      plaremem    108 - 108
      plimany     109 - 109      la1ar       110 - 110
      lahcc1      111 - 111      lahcc2      112 - 112
      lahcc3      113 - 113      lahcc4      114 - 114
      lahcc5      115 - 115      lahcc6      116 - 116
      lahcc7      117 - 117      lahcc8      118 - 118
      lahcc9      119 - 119      lahcc10     120 - 120
      lahcc11     121 - 121      lahcc12     122 - 122
      lahcc13     123 - 123      lahcc90     124 - 124
      lahcc91     125 - 125      lctime1     126 - 127
      lcunit1     128 - 128      lcdura1     129 - 130
      lcdurb1     131 - 131      lcchrc1     132 - 132
      lctime2     133 - 134      lcunit2     135 - 135
      lcdura2     136 - 137      lcdurb2     138 - 138
      lcchrc2     139 - 139      lctime3     140 - 141
      lcunit3     142 - 142      lcdura3     143 - 144
      lcdurb3     145 - 145      lcchrc3     146 - 146
      lctime4     147 - 148      lcunit4     149 - 149
      lcdura4     150 - 151      lcdurb4     152 - 152
      lcchrc4     153 - 153      lctime5     154 - 155
      lcunit5     156 - 156      lcdura5     157 - 158
      lcdurb5     159 - 159      lcchrc5     160 - 160
      lctime6     161 - 162      lcunit6     163 - 163
      lcdura6     164 - 165      lcdurb6     166 - 166
      lcchrc6     167 - 167      lctime7     168 - 169
      lcunit7     170 - 170      lcdura7     171 - 172
      lcdurb7     173 - 173      lcchrc7     174 - 174
      lctime8     175 - 176      lcunit8     177 - 177
      lcdura8     178 - 179      lcdurb8     180 - 180
      lcchrc8     181 - 181      lctime9     182 - 183
      lcunit9     184 - 184      lcdura9     185 - 186
      lcdurb9     187 - 187      lcchrc9     188 - 188
      lctime10    189 - 190      lcunit10    191 - 191
      lcdura10    192 - 193      lcdurb10    194 - 194
      lcchrc10    195 - 195      lctime11    196 - 197
      lcunit11    198 - 198      lcdura11    199 - 200
      lcdurb11    201 - 201      lcchrc11    202 - 202
      lctime12    203 - 204      lcunit12    205 - 205
      lcdura12    206 - 207      lcdurb12    208 - 208
      lcchrc12    209 - 209      lctime13    210 - 211
      lcunit13    212 - 212      lcdura13    213 - 214
      lcdurb13    215 - 215      lcchrc13    216 - 216
      lctime90    217 - 218      lcunit90    219 - 219
      lcdura90    220 - 221      lcdurb90    222 - 222
      lcchrc90    223 - 223      lctime91    224 - 225
      lcunit91    226 - 226      lcdura91    227 - 228
      lcdurb91    229 - 229      lcchrc91    230 - 230
      lahca1      231 - 231      lahca2      232 - 232
      lahca3      233 - 233      lahca4      234 - 234
      lahca5      235 - 235      lahca6      236 - 236
      lahca7      237 - 237      lahca8      238 - 238
      lahca9      239 - 239      lahca10     240 - 240
      lahca11     241 - 241      lahca12     242 - 242
      lahca13     243 - 243      lahca14     244 - 244
      lahca15     245 - 245      lahca16     246 - 246
      lahca17     247 - 247      lahca18     248 - 248
      lahca19_    249 - 249      lahca20_    250 - 250
      lahca21_    251 - 251      lahca22_    252 - 252
      lahca23_    253 - 253      lahca24_    254 - 254
      lahca25_    255 - 255      lahca26_    256 - 256
      lahca27_    257 - 257      lahca28_    258 - 258
      lahca29_    259 - 259      lahca30_    260 - 260
      lahca31_    261 - 261      lahca32_    262 - 262
      lahca33_    263 - 263      lahca34_    264 - 264
      lahca90     265 - 265      lahca91     266 - 266
      latime1     267 - 268      launit1     269 - 269
      ladura1     270 - 271      ladurb1     272 - 272
      lachrc1     273 - 273      latime2     274 - 275
      launit2     276 - 276      ladura2     277 - 278
      ladurb2     279 - 279      lachrc2     280 - 280
      latime3     281 - 282      launit3     283 - 283
      ladura3     284 - 285      ladurb3     286 - 286
      lachrc3     287 - 287      latime4     288 - 289
      launit4     290 - 290      ladura4     291 - 292
      ladurb4     293 - 293      lachrc4     294 - 294
      latime5     295 - 296      launit5     297 - 297
      ladura5     298 - 299      ladurb5     300 - 300
      lachrc5     301 - 301      latime6     302 - 303
      launit6     304 - 304      ladura6     305 - 306
      ladurb6     307 - 307      lachrc6     308 - 308
      latime7     309 - 310      launit7     311 - 311
      ladura7     312 - 313      ladurb7     314 - 314
      lachrc7     315 - 315      latime8     316 - 317
      launit8     318 - 318      ladura8     319 - 320
      ladurb8     321 - 321      lachrc8     322 - 322
      latime9     323 - 324      launit9     325 - 325
      ladura9     326 - 327      ladurb9     328 - 328
      lachrc9     329 - 329      latime10    330 - 331
      launit10    332 - 332      ladura10    333 - 334
      ladurb10    335 - 335      lachrc10    336 - 336
      latime11    337 - 338      launit11    339 - 339
      ladura11    340 - 341      ladurb11    342 - 342
      lachrc11    343 - 343      latime12    344 - 345
      launit12    346 - 346      ladura12    347 - 348
      ladurb12    349 - 349      lachrc12    350 - 350
      latime13    351 - 352      launit13    353 - 353
      ladura13    354 - 355      ladurb13    356 - 356
      lachrc13    357 - 357      latime14    358 - 359
      launit14    360 - 360      ladura14    361 - 362
      ladurb14    363 - 363      lachrc14    364 - 364
      latime15    365 - 366      launit15    367 - 367
      ladura15    368 - 369      ladurb15    370 - 370
      lachrc15    371 - 371      latime16    372 - 373
      launit16    374 - 374      ladura16    375 - 376
      ladurb16    377 - 377      lachrc16    378 - 378
      latime17    379 - 380      launit17    381 - 381
      ladura17    382 - 383      ladurb17    384 - 384
      lachrc17    385 - 385      latime18    386 - 387
      launit18    388 - 388      ladura18    389 - 390
      ladurb18    391 - 391      lachrc18    392 - 392
      latime19    393 - 394      launit19    395 - 395
      ladura19    396 - 397      ladurb19    398 - 398
      lachrc19    399 - 399      latime20    400 - 401
      launit20    402 - 402      ladura20    403 - 404
      ladurb20    405 - 405      lachrc20    406 - 406
      latime21    407 - 408      launit21    409 - 409
      ladura21    410 - 411      ladurb21    412 - 412
      lachrc21    413 - 413      latime22    414 - 415
      launit22    416 - 416      ladura22    417 - 418
      ladurb22    419 - 419      lachrc22    420 - 420
      latime23    421 - 422      launit23    423 - 423
      ladura23    424 - 425      ladurb23    426 - 426
      lachrc23    427 - 427      latime24    428 - 429
      launit24    430 - 430      ladura24    431 - 432
      ladurb24    433 - 433      lachrc24    434 - 434
      latime25    435 - 436      launit25    437 - 437
      ladura25    438 - 439      ladurb25    440 - 440
      lachrc25    441 - 441      latime26    442 - 443
      launit26    444 - 444      ladura26    445 - 446
      ladurb26    447 - 447      lachrc26    448 - 448
      latime27    449 - 450      launit27    451 - 451
      ladura27    452 - 453      ladurb27    454 - 454
      lachrc27    455 - 455      latime28    456 - 457
      launit28    458 - 458      ladura28    459 - 460
      ladurb28    461 - 461      lachrc28    462 - 462
      latime29    463 - 464      launit29    465 - 465
      ladura29    466 - 467      ladurb29    468 - 468
      lachrc29    469 - 469      latime30    470 - 471
      launit30    472 - 472      ladura30    473 - 474
      ladurb30    475 - 475      lachrc30    476 - 476
      latime31    477 - 478      launit31    479 - 479
      ladura31    480 - 481      ladurb31    482 - 482
      lachrc31    483 - 483      latime32    484 - 485
      launit32    486 - 486      ladura32    487 - 488
      ladurb32    489 - 489      lachrc32    490 - 490
      latime33    491 - 492      launit33    493 - 493
      ladura33    494 - 495      ladurb33    496 - 496
      lachrc33    497 - 497      latime34    498 - 499
      launit34    500 - 500      ladura34    501 - 502
      ladurb34    503 - 503      lachrc34    504 - 504
      latime90    505 - 506      launit90    507 - 507
      ladura90    508 - 509      ladurb90    510 - 510
      lachrc90    511 - 511      latime91    512 - 513
      launit91    514 - 514      ladura91    515 - 516
      ladurb91    517 - 517      lachrc91    518 - 518
      lcondrt     519 - 519      lachronr    520 - 520
      phstat      521 - 521

      pdmed12m    522 - 522      pnmed12m    523 - 523
      phospyr2    524 - 524      hospno      525 - 527
      hpnite      528 - 530      phchm2w     531 - 531
      phchmn2w    532 - 533      phcph2wr    534 - 534
      phcphn2w    535 - 536      phcdv2w     537 - 537
      phcdvn2w    538 - 539      p10dvyr     540 - 540

      notcov      541 - 541      medicare    542 - 542
      mcpart      543 - 543      mcchoice    544 - 544
      mchmo       545 - 545      mcnamen     546 - 547
      mcref       548 - 548      mcpaypre    549 - 549
      mcpartd     550 - 550      medicaid    551 - 551
      machmd      552 - 552      mapcmd      553 - 553
      maref       554 - 554      single      555 - 555
      sstypea     556 - 556      sstypeb     557 - 557
      sstypec     558 - 558      sstyped     559 - 559
      sstypee     560 - 560      sstypef     561 - 561
      sstypeg     562 - 562      sstypeh     563 - 563
      sstypei     564 - 564      sstypej     565 - 565
      sstypek     566 - 566      sstypel     567 - 567
      private     568 - 568      hitype1     569 - 570
      whonam1     571 - 571      plnwrkn1    572 - 573
      plnpay11    574 - 574      plnpay21    575 - 575
      plnpay31    576 - 576      plnpay41    577 - 577
      plnpay51    578 - 578      plnpay61    579 - 579
      plnpay71    580 - 580      hicostr1    581 - 585
      plnmgd1     586 - 586      hdhp1       587 - 587
      hsahra1     588 - 588      mgchmd1     589 - 589
      mgprmd1     590 - 590      mgpymd1     591 - 591
      mgpref1     592 - 592      prrxcov1    593 - 593
      hitype2     594 - 595      whonam2     596 - 596
      plnwrkn2    597 - 598      plnpay12    599 - 599
      plnpay22    600 - 600      plnpay32    601 - 601
      plnpay42    602 - 602      plnpay52    603 - 603
      plnpay62    604 - 604      plnpay72    605 - 605
      hicostr2    606 - 610      plnmgd2     611 - 611
      hdhp2       612 - 612      hsahra2     613 - 613
      mgchmd2     614 - 614      mgprmd2     615 - 615
      mgpymd2     616 - 616      mgpref2     617 - 617
      prrxcov2    618 - 618      prplplus    619 - 619
      schip       620 - 620      stdoc1      621 - 621
      stpcmd1     622 - 622      stref1      623 - 623
      otherpub    624 - 624      stdoc2      625 - 625
      stpcmd2     626 - 626      stref2      627 - 627
      othergov    628 - 628      stdoc3      629 - 629
      stpcmd3     630 - 630      stref3      631 - 631
      military    632 - 632      milspc1     633 - 633
      milspc2     634 - 634      milspc3     635 - 635
      milspc4     636 - 636      milman      637 - 637
      ihs         638 - 638      hilast      639 - 639
      histop1     640 - 640      histop2     641 - 641
      histop3     642 - 642      histop4     643 - 643
      histop5     644 - 644      histop6     645 - 645
      histop7     646 - 646      histop8     647 - 647
      histop9     648 - 648      histop10    649 - 649
      histop11    650 - 650      histop12    651 - 651
      histop13    652 - 652      histop14    653 - 653
      histop15    654 - 654      hinotyr     655 - 655
      hinotmyr    656 - 657      hcspfyr     658 - 658
      fsa         659 - 659      hikinda     660 - 660
      hikindb     661 - 661      hikindc     662 - 662
      hikindd     663 - 663      hikinde     664 - 664
      hikindf     665 - 665      hikindg     666 - 666
      hikindh     667 - 667      hikindi     668 - 668
      hikindj     669 - 669      hikindk     670 - 670
      mcareprb    671 - 671      mcaidprb    672 - 672
      sincov      673 - 673

      plborn      674 - 674      regionbr    675 - 676
      geobrth     677 - 677      yrsinus     678 - 678
      citizenp    679 - 679      headst      680 - 680
      headstv1    681 - 681      educ1       682 - 683
      pmiltry     684 - 684      doinglwp    685 - 685
      whynowkp    686 - 687      wrkhrs2     688 - 689
      wrkftall    690 - 690      wrklyr1     691 - 691
      wrkmyr      692 - 693      ernyr_p     694 - 695
      hiempof     696 - 696

      fincint     697 - 697      psal        698 - 698
      pseinc      699 - 699      pssrr       700 - 700
      pssrrdb     701 - 701      pssrrd      702 - 702
      ppens       703 - 703      popens      704 - 704
      pssi        705 - 705      pssid       706 - 706
      ptanf       707 - 707      powben      708 - 708
      pintrstr    709 - 709      pdivd       710 - 710
      pchldsp     711 - 711      pincot      712 - 712
      pssapl      713 - 713      psdapl      714 - 714
      tanfmyr     715 - 716      pfstp       717 - 717
      fstpmyr     718 - 719      eligpwic    720 - 720
      pwic        721 - 721      wic_flag    722 - 722

using $DAT/personsx.dat;
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
label variable strat_p  "
UCF.000_00.000: Pseudo-stratum for public use file variance estimation";
label variable psu_p    "
UCF.000_00.000: Pseudo-PSU for public use file variance estimation";

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
label variable racreci3 "HHC.200_01.000: Race Recode";
label variable hiscodi3 "HHC.200_01.000: Race/ethnicity recode";
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
label variable fspous2  "FID.270_00.000: Person # of spouse";
label variable cohab1   "FID.280_00.000: Cohabiting person ever married";
label variable cohab2   "
FID.290_00.000: Cohabiting person's current marital status";
label variable fcohab3  "FID.300_00.000: Person # of partner";
label variable cdcmstat "FID: CDC standard for legal marital status";
label variable sib_deg  "FID.300_00.000: Degree of sib rel to HH ref person";
label variable fmother  "FID.326_00.000: Person # of mother";
label variable mom_deg  "FID.330_01.000: Type of relationship with Mother";
label variable ffather  "FID.340_00.000: Person # of father";
label variable dad_deg  "FID.350_01.000: Type of relationship with Father";
label variable parents  "FID: Parent(s) present in the family";
label variable mom_ed   "FID: Education of Mother";
label variable dad_ed   "FID: Education of Father";
label variable astatflg "FID: Sample Adult Flag";
label variable cstatflg "FID: Sample Child Flag";

label variable plaplylm "FHS.010_00.000: Is - - limited in kind/amount play?";
label variable plaplyun "FHS.020_00.000: Is - - able to play at all?";
label variable pspedeis "
FHS.060_00.000: Does - - receive Special Education or EIS";
label variable pspedem  "
FHS.065_00.000: Receive Special Education/EIS due to emotional/behavioral proble
m";
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
FHS.180_00.000: Is - - unable to work NOW due to health prob?";
label variable plawklim "FHS.200_00.000: Is - - limited kind/amount of work?";
label variable plawalk  "
FHS.220_00.000: Does - - have difficulty walk w/o equipment?";
label variable plaremem "
FHS.240_00.000: Is - - limited by difficulty remembering?";
label variable plimany  "FHS.260_00.000: Is - - limited in any (other) way?";
label variable la1ar    "FHS: Any limitation - all persons, all conditions";
label variable lahcc1   "FHS.270_01.000: Vision problem causes limitation";
label variable lahcc2   "FHS.270_02.000: Hearing problem causes limitation";
label variable lahcc3   "FHS.270_03.000: Speech problem causes limitation";
label variable lahcc4   "
FHS.270_04.000: Asthma/breathing problem causes limitation";
label variable lahcc5   "FHS.270_05.000: Birth defect causes limitation";
label variable lahcc6   "FHS.270_06.000: Injury causes limitation";
label variable lahcc7   "FHS.270_07.000: Mental retardation causes limitation";
label variable lahcc8   "
FHS.270_08.000: Other developmental problem causes limitation";
label variable lahcc9   "
FHS.270_09.000: Other mental/emotional/behavioral problem causes limitation";
label variable lahcc10  "
FHS.270_10.000: Bone/joint/muscle problem causes limitation";
label variable lahcc11  "FHS.270_11.000: Epilepsy/seizures causes limitation";
label variable lahcc12  "FHS.270_12.000: Learning disability causes  limitation
";
label variable lahcc13  "FHS.270_13.000: ADD/ADHD causes limitation";
label variable lahcc90  "
FHS.270_90.000: Other impairment/problem (1) causes limitation";
label variable lahcc91  "
FHS.270_91.000: Other impairment/problem (2) causes limitation";
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
FHS.294_01.000: Duration of other mental/emotional/behavioral problem: Number of
 units";
label variable lcunit9  "
FHS.294_02.000: Duration of other mental/emotional/behavioral problem: Number of
 units";
label variable lcdura9  "
FHS.294_02.000: Duration of other mental/emotional/behavioral problem (in years)
";
label variable lcdurb9  "
FHS.294_02.000: Duration of other mental/emotional/behavioral problem recode 2";
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
label variable lahca4   "FHS.350_04.000: Back/neck problem causes limitation";
label variable lahca5   "
FHS.350_05.000: Fracture/bone/joint injury causes limitation";
label variable lahca6   "FHS.350_06.000: Other injury causes limitation";
label variable lahca7   "FHS.350_07.000: Heart problem causes limitation";
label variable lahca8   "FHS.350_08.000: Stroke causes limitation";
label variable lahca9   "FHS.350_09.000: Hypertension causes limitation";
label variable lahca10  "FHS.350_10.000: Diabetes causes limitation";
label variable lahca11  "
FHS.350_11.000: Lung/breathing problem causes limitation";
label variable lahca12  "FHS.350_12.000: Cancer causes limitation";
label variable lahca13  "FHS.350_13.000: Birth defect causes limitation";
label variable lahca14  "FHS.350_14.000: Mental retardation causes limitation";
label variable lahca15  "
FHS.350_15.000: Other developmental problem causes limitation";
label variable lahca16  "FHS.350_16.000: Senility causes limitation";
label variable lahca17  "
FHS.350_17.000: Depression/anxiety/emotional problem causes limitation";
label variable lahca18  "FHS.350_18.000: Weight problem causes limitation";
label variable lahca19_ "
FHS.350_18.000: Missing or amputated limb/finger/digit causes limitation";
label variable lahca20_ "
FHS.350_18.000: Musculoskeletal/connective tissue problem causes limitation";
label variable lahca21_ "FHS.350_18.000: Circulation problem causes limitation";
label variable lahca22_ "
FHS.350_18.000: Endocrine/nutritional/metabolic problem causes limitation";
label variable lahca23_ "
FHS.350_18.000: Nervous system/sensory organ condition causes limitation";
label variable lahca24_ "
FHS.350_18.000: Digestive system problem causes limitation";
label variable lahca25_ "
FHS.350_18.000: Genitourinary system problem causes limitation";
label variable lahca26_ "
FHS.350_18.000: Skin/subcutaneous system problem causes limitation";
label variable lahca27_ "
FHS.350_18.000: Blood or blood-forming organ problem causes limitation";
label variable lahca28_ "FHS.350_18.000: Benign tumor/cyst causes limitation";
label variable lahca29_ "
FHS.350_18.000: Alcohol/drug/substance abuse problem causes limitation";
label variable lahca30_ "
FHS.350_18.000: Other mental problem/ADD/bipolar/schizophrenia causes limitation
";
label variable lahca31_ "
FHS.350_18.000: Surgical after-effects/medical treatment causes limitation";
label variable lahca32_ "
FHS.350_18.000: 'Old age'/elderly/aging-related problem causes limitation";
label variable lahca33_ "
FHS.350_18.000: Fatigue/tiredness/weakness causes limitation";
label variable lahca34_ "
FHS.350_18.000: Pregnancy-related problem causes limitation";
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
FHS.380_02.000: Duration of lung/breathing problem: Time unit";
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
FHS.384_01.000: Duration of mental retardation: Number of units";
label variable launit14 "
FHS.384_02.000: Duration of mental retardation: Time unit";
label variable ladura14 "
FHS.384_02.000: Duration of mental retardation (in years)";
label variable ladurb14 "FHS.384_02.000: Duration of mental retardation recode 2
";
label variable lachrc14 "FHS.384_02.000: Mental retardation condition status";
label variable latime15 "
FHS.386_01.000: Duration of other developmental problem: Number of units";
label variable launit15 "
FHS.386_02.000: Duration of other developmental problem: Time unit";
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
FHS.390_01.000: Duration of depression/anxiety/emotional problem: Number of unit
s";
label variable launit17 "
FHS.390_02.000: Duration of depression/anxiety/emotional problem: Time unit";
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
label variable ladura26 "FHS.408_02.000: Duration of skin problems (in years)";
label variable ladurb26 "FHS.408_02.000: Duration of skin problems recode 2";
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
label variable latime32 "FHS.420_01.000: Duration of 'old age': Number of units
";
label variable launit32 "FHS.420_02.000: Duration of 'old age': Number of units
";
label variable ladura32 "FHS.420_02.000: Duration of 'old age' (in years)";
label variable ladurb32 "FHS.420_02.000: Duration of 'old age' recode 2";
label variable lachrc32 "FHS.420_02.000: 'Old age' condition status";
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
FHS.452_02.000: Duration of other N.E.C. problem (2) recode 2";
label variable lachrc91 "
FHS.452_02.000: Other N.E.C. problem (2) condition status";
label variable lcondrt  "
FHS.452_02.000: Chronic condition recode for person with limitation of activity
";
label variable lachronr "
FHS.452_02.000: Limitation of activity recode by chronic condition status";
label variable phstat   "FHS.500_00.000: Reported health status";

label variable pdmed12m "
FAU.020_00.000: Was medical care delayed for - - (cost), 12m";
label variable pnmed12m "
FAU.040_00.000: Did - - need and NOT get medical care (cost), 12m";
label variable phospyr2 "FAU.060_00.000: Was - - in a hospital OVERNIGHT, 12m";
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
label variable mcpartd  "FHI.118_00.000: Medicare Part D";
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
FHI.210_01.000: How plan was originally obtained (Plan 1)";
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
label variable hdhp1    "FHI.241_01.000: High deductible health plan (Plan 1)";
label variable hsahra1  "
FHI.242_01.000: Health Savings Accounts/Health Reimbursement Accounts (Plan 1)";
label variable mgchmd1  "FHI.243_01.000: Doctor choice (Plan 1)";
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
label variable plnmgd2  "FHI.240_02.000: Type of private plan (Plan 2)";
label variable hdhp2    "FHI.241_02.000: High deductible health plan (Plan 2)";
label variable hsahra2  "
FHI.242_02.000: Health Savings Accounts/Health Reimbursement Accounts (Plan 2)";
label variable mgchmd2  "FHI.243_02.000: Doctor choice (Plan 2)";
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
label variable fsa      "FHI.330_00.000: Flexible Spending Accounts";
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
label variable regionbr "FSD.003_01.000: Geographic region of birth recode";
label variable geobrth  "FSD.003_01.000: Geographic place of birth recode";
label variable yrsinus  "FSD.005_00.000: Years that - - has been in the U.S.";
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

label variable fincint  "
FIN.010_00.000: Introduction to the family income section";
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
label define pep004x
   1        "1 Quarter 1"
   2        "2 Quarter 2"
   3        "3 Quarter 3"
   4        "4 Quarter 4"
;
label define pep005x
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
label define pep010x
   1        "1 Northeast"
   2        "2 Midwest"
   3        "3 South"
   4        "4 West"
;
label define pep013x
   1        "1 Male"
   2        "2 Female"
;
label define pep014x
   1        "1 Yes"
   2        "2 No"
;
label define pep015x
   1        "1 Imputed: was 'refused' Hispanic Origin"
   2        "2 Imputed: was 'not ascertained' Hispanic Origin"
   3        "3 Imputed: was 'does not know' Hispanic Origin"
   4        "4 Hispanic origin given by respondent/proxy"
;
label define pep016x
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
label define pep017x
   1        "1 Imputed: was 'refused' Hispanic Origin"
   2        "2 Imputed: was 'not ascertained' Hispanic Origin"
   3        "3 Imputed: was 'does not know' Hispanic Origin"
   4        "4 Hispanic Origin type given by respondent/proxy"
;
label define pep018x
   01       "01 White only"
   02       "02 Black/African American only"
   03       "03 AIAN only"
   04       "04 Asian only"
   05       "05 Race group not releasable (See file layout)"
   06       "06 Multiple race"
;
label define pep019x
   1        "1 Imputed: was 'refused'"
   2        "2 Imputed: was 'not ascertained'"
   3        "3 Imputed: was 'does not know'"
   4        "4 Imputed: was other race'"
   5        "5 Imputed: was 'unspecified multiple race'"
   6        "6 Race given by respondent/proxy"
;
label define pep020x
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
label define pep021x
   01       "01 White"
   02       "02 Black/African American"
   03       "03 Indian (American) (includes Eskimo, Aleut)"
   06       "06 Chinese"
   07       "07 Filipino"
   12       "12 Asian Indian"
   16       "16 Other race (See file layout)"
   17       "17 Multiple race, no primary race selected"
;
label define pep022x
   1        "1 White"
   2        "2 Black"
   3        "3 Asian"
   4        "4 All other race groups (See file layout)"
;
label define pep023x
   1        "1 Hispanic"
   2        "2 Non-Hispanic White"
   3        "3 Non-Hispanic Black"
   4        "4 Non-Hispanic Asian"
   5        "5 Non-Hispanic All other race groups"
;
label define pep024x
   1        "1 Ethnicity/race imputed"
   2        "2 Ethnicity/race given by respondent/proxy"
;
label define pep025x
   1        "1 Armed Forces"
   2        "2 Not Armed Forces"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep026x
   01       "01 Household reference person"
   02       "02 Spouse (husband/wife)"
   03       "03 Unmarried Partner"
   04       "04 Child (biological/adoptive/in-law/step/foster)"
   05       "05 Child of partner"
   06       "06 Grandchild"
   07       "07 Parent (biological/adoptive/in-law/step/foster)"
   08       "08 Brother/sister (biological/adoptive/in-law/step/foster)"
   09       "09 Grandparent (Grandmother/Grandfather)"
   10       "10 Aunt/Uncle"
   11       "11 Niece/Nephew"
   12       "12 Other relative"
   13       "13 Housemate/roommate"
   14       "14 Roomer/Boarder"
   15       "15 Other nonrelative"
   16       "16 Legal guardian"
   17       "17 Ward"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep028x
   01       "01 Family reference person"
   02       "02 Spouse (husband/wife)"
   03       "03 Unmarried Partner"
   04       "04 Child (biological/adoptive/in-law/step/foster)"
   05       "05 Child of partner"
   06       "06 Grandchild"
   07       "07 Parent (biological/adoptive/in-law/step/foster)"
   08       "08 Brother/sister (biological/adoptive/in-law/step/foster)"
   09       "09 Grandparent (Grandmother/Grandfather)"
   10       "10 Aunt/Uncle"
   11       "11 Niece/Nephew"
   12       "12 Other relative"
   16       "16 Legal guardian"
   17       "17 Ward"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep031x
   00       "00 Under 1 year"
   85       "85 85+ years"
;
label define pep032x
   1        "1 Change on AGE due to data entry error"
;
label define pep035x
   0        "0 Under 14 years"
   1        "1 Married - spouse in household"
   2        "2 Married - spouse not in household"
   3        "3 Married - spouse in household unknown"
   4        "4 Widowed"
   5        "5 Divorced"
   6        "6 Separated"
   7        "7 Never married"
   8        "8 Living with partner"
   9        "9 Unknown marital status"
;
label define pep037x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep038x
   1        "1 Married"
   2        "2 Widowed"
   3        "3 Divorced"
   4        "4 Separated"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep040x
   1        "1 Separated"
   2        "2 Divorced"
   3        "3 Married"
   4        "4 Single/never married"
   5        "5 Widowed"
   9        "9 Unknown marital status"
;
label define pep041x
   1        "1 Full {brother/sister}"
   2        "2 Half {brother/sister}"
   3        "3 Adopted {brother/sister}"
   4        "4 Step {brother/sister}"
   5        "5 Foster {brother/sister}"
   6        "6 {Brother/Sister}-in-law"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep043x
   1        "1 Biological"
   2        "2 Adoptive"
   3        "3 Step"
   4        "4 Foster"
   5        "5 In-law"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep046x
   1        "1 Mother, no father"
   2        "2 Father, no mother"
   3        "3 Mother and father"
   4        "4 Neither mother nor father"
   9        "9 Unknown"
;
label define pep047x
   01       "01 Less/equal to 8th grade"
   02       "02 9-12th grade, no high school diploma"
   03       "03 High school graduate/GED recipient"
   04       "04 Some college, no degree"
   05       "05 AA degree, technical or vocational"
   06       "06 AA degree, academic program"
   07       "07 Bachelor's degree"
   08       "08 Master's, professional, or doctoral degree"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep049x
   0        "0 Sample Adult - no record"
   1        "1 Sample Adult - has record"
   2        "2 Not selected as Sample Adult"
   3        "3 No one selected as Sample Adult"
   4        "4 Armed Force member"
   5        "5 Armed Force member - selected as Sample Adult"
;
label define pep050x
   0        "0 Sample Child - no record"
   1        "1 Sample Child - has record"
   2        "2 Not selected as Sample Child"
   3        "3 No one selected as Sample Child"
   4        "4 Emancipated minor"
;
label define pep064x
   0        "0 Unable to work"
   1        "1 Limited in work"
   2        "2 Not limited in work"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't Know"
;
label define pep067x
   0        "0 Limitation previously mentioned"
   1        "1 Yes, limited in some other way"
   2        "2 Not limited in any way"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep068x
   1        "1 Limited in any way"
   2        "2 Not limited in any way"
   3        "3 Unknown if limited"
;
label define pep069x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep084x
   95       "95 95+"
   96       "96 Since birth"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep085x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   6        "6 Since birth"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep086x
   00       "00 Less than 1 year"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep087x
   0        "0 Since birth and child <1 year of age"
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep088x
   1        "1 Chronic"
   2        "2 Not chronic"
   9        "9 Unknown if chronic"
;
label define pep197x
   00       "00 Less than 1 year"
   85       "85 85+ years"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep198x
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep375x
   1        "1 At least one condition causing limitation of activity is chronic"
   2        "2 No condition causing limitation of activity is chronic"
   9        "
9 Unknown if any condition causing limitation of activity is chronic"
;
label define pep376x
   0        "0 Not limited in any way (including unknown if limited)"
   1        "1 Limited; caused by at least one chronic condition"
   2        "2 Limited; not caused by chronic condition"
   3        "3 Limited; unknown if condition is chronic"
;
label define pep377x
   1        "1 Excellent"
   2        "2 Very good"
   3        "3 Good"
   4        "4 Fair"
   5        "5 Poor"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep381x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define pep384x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep390x
   1        "1 Not covered"
   2        "2 Covered"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep391x
   1        "1 Yes, information"
   2        "2 Yes, but no information"
   3        "3 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep392x
   1        "1 Part A - Hospital only"
   2        "2 Part B - Medical only"
   3        "3 Both Part A and Part B"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep395x
   04       "04 Medigap plan"
   12       "12 Group"
   22       "22 Staff"
   32       "32 IPA"
   92       "92 Other"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep400x
   1        "1  Any doctor"
   2        "2  Select from book/list"
   3        "3  Doctor is assigned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep403x
   1        "1 Yes, with information"
   2        "2 Yes, but no information"
   3        "3 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep418x
   1        "1 In own name"
   2        "2 Someone else in family"
   3        "3 Person not in household"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep419x
   01       "01 Through employer"
   02       "02 Through union"
   03       "03 Through workplace, but don't know if employer or union"
   04       "04 Through workplace, self-employed or professional association"
   05       "05 Purchased directly"
   06       "06 Through a state/local government or community program"
   07       "07 Other"
   08       "08 Through school"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep427x
   20000    "20000 $20,000 or more"
   99997    "99997 Refused"
   99998    "99998 Not ascertained"
   99999    "99999 Don't know"
;
label define pep428x
   1        "1 HMO/IPA"
   2        "2 PPO"
   3        "3 POS"
   4        "4 Fee-for-service/indemnity"
   5        "5 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep429x
   1        "1 Less than [$1,100/$2,200]"
   2        "2 [$1,100/$2,200] or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep431x
   1        "1 Any doctor"
   2        "2 Select from group/list"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep473x
   1        "1 TRICARE Prime"
   2        "2 TRICARE Extra"
   3        "3 TRICARE Standard"
   4        "4 TRICARE for life"
   5        "5 TRICARE other (specify)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep475x
   1        "1 6 months or less"
   2        "2 More than 6 months, but not more than 1 year ago"
   3        "3 More than 1 year, but not more than 3 years ago"
   4        "4 More than 3 years"
   5        "5 Never"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep493x
   0        "0 Zero"
   1        "1 Less than $500"
   2        "2 $500 - $1,999"
   3        "3 $2,000 - $2,999"
   4        "4 $3,000 - $4,999"
   5        "5 $5,000 or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep510x
   01       "01 United States"
   02       "02 Mexico, Central America, Caribbean Islands"
   03       "03 South America"
   04       "04 Europe"
   05       "05 Russia (and former USSR areas)"
   06       "06 Africa"
   07       "07 Middle East"
   08       "08 Indian Subcontinent"
   09       "09 Asia"
   10       "10 SE Asia"
   11       "11 Elsewhere"
   99       "99 Unknown"
;
label define pep511x
   1        "1 USA: born in one of the 50 United States or D.C."
   2        "2 USA: born in a U.S. territory"
   3        "3 Not born in the U.S. or a U.S. territory"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep512x
   1        "1 Less than 1 year"
   2        "2 1 yr., less than 5 yrs."
   3        "3 5 yrs., less than 10 yrs."
   4        "4 10 yrs., less than 15 yrs."
   5        "5 15 years or more"
   9        "9 Unknown"
;
label define pep513x
   1        "1 Yes, citizen of the United States"
   2        "2 No, not a citizen of the United States"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep516x
   00       "00 Never attended/kindergarten only"
   01       "01 1st grade"
   02       "02 2nd grade"
   03       "03 3rd grade"
   04       "04 4th grade"
   05       "05 5th grade"
   06       "06 6th grade"
   07       "07 7th grade"
   08       "08 8th grade"
   09       "09 9th grade"
   10       "10 10th grade"
   11       "11 11th grade"
   12       "12 12th grade, no diploma"
   13       "13 GED or equivalent"
   14       "14 High School Graduate"
   15       "15 Some college, no degree"
   16       "16 Associate degree: occupational, technical, or vocational program
"
   17       "17 Associate degree: academic program"
   18       "18 Bachelor's degree (Example: BA, AB, BS, BBA)"
   19       "19 Master's degree (Example: MA, MS, MEng, MEd, MBA)"
   20       "20 Professional School degree (Example: MD, DDS, DVM, JD)"
   21       "21 Doctoral degree (Example: PhD, EdD)"
   96       "96 Child under 5 years old"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep518x
   1        "1 Working for pay at a job or business"
   2        "2 With a job or business but not at work"
   3        "3 Looking for work"
   4        "4 Working, but not for pay, at a family-owned job or business"
   5        "5 Not working at a job or business and not looking for work"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep519x
   01       "01 Taking care of house or family"
   02       "02 Going to school"
   03       "03 Retired"
   04       "04 On a planned vacation from work"
   05       "05 On family or maternity leave"
   06       "06 Temporarily unable to work for health reasons"
   07       "07 Have job/contract and off-season"
   08       "08 On layoff"
   09       "09 Disabled"
   10       "10 Other"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep520x
   95       "95 95+ hours"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep523x
   01       "01 1 month or less"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep524x
   01       "01 $01-$4,999"
   02       "02 $5,000-$9,999"
   03       "03 $10,000-$14,999"
   04       "04 $15,000-$19,999"
   05       "05 $20,000-$24,999"
   06       "06 $25,000-$34,999"
   07       "07 $35,000-$44,999"
   08       "08 $45,000-$54,999"
   09       "09 $55,000-$64,999"
   10       "10 $65,000-$74,999"
   11       "11 $75,000 and over"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep526x
   1        "1 Enter 1 to continue"
   8        "8 Not ascertained"
;
label define pep547x
   0        "0 No WIC age-eligible family members"
   1        "1 At least 1 WIC age-eligible family member"
;
label define pep549x
   0        "0 Person not age-eligible"
   1        "1 Person age-eligible"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   pep001x;   label values intv_qrt  pep004x;
label values assignwk  pep005x;

label values region    pep010x;

label values sex       pep013x;   label values origin_i  pep014x;
label values origimpt  pep015x;   label values hispan_i  pep016x;
label values hispimpt  pep017x;   label values racerpi2  pep018x;
label values raceimp2  pep019x;   label values mracrpi2  pep020x;
label values mracbpi2  pep021x;   label values racreci3  pep022x;
label values hiscodi3  pep023x;   label values erimpflg  pep024x;
label values nowaf     pep025x;   label values rrp       pep026x;
label values frrp      pep028x;   label values age_p     pep031x;
label values age_chg   pep032x;

label values r_maritl  pep035x;   label values cohab1    pep037x;
label values cohab2    pep038x;   label values cdcmstat  pep040x;
label values sib_deg   pep041x;   label values mom_deg   pep043x;
label values dad_deg   pep043x;   label values parents   pep046x;
label values mom_ed    pep047x;   label values dad_ed    pep047x;
label values astatflg  pep049x;   label values cstatflg  pep050x;

label values plaplylm  pep037x;   label values plaplyun  pep037x;
label values pspedeis  pep037x;   label values pspedem   pep037x;
label values plaadl    pep037x;   label values labath    pep037x;
label values ladress   pep037x;   label values laeat     pep037x;
label values labed     pep037x;   label values latoilt   pep037x;
label values lahome    pep037x;   label values plaiadl   pep037x;
label values plawknow  pep037x;   label values plawklim  pep064x;
label values plawalk   pep037x;   label values plaremem  pep037x;
label values plimany   pep067x;   label values la1ar     pep068x;
label values lahcc1    pep069x;   label values lahcc2    pep069x;
label values lahcc3    pep069x;   label values lahcc4    pep069x;
label values lahcc5    pep069x;   label values lahcc6    pep069x;
label values lahcc7    pep069x;   label values lahcc8    pep069x;
label values lahcc9    pep069x;   label values lahcc10   pep069x;
label values lahcc11   pep069x;   label values lahcc12   pep069x;
label values lahcc13   pep069x;   label values lahcc90   pep069x;
label values lahcc91   pep069x;   label values lctime1   pep084x;
label values lcunit1   pep085x;   label values lcdura1   pep086x;
label values lcdurb1   pep087x;   label values lcchrc1   pep088x;
label values lctime2   pep084x;   label values lcunit2   pep085x;
label values lcdura2   pep086x;   label values lcdurb2   pep087x;
label values lcchrc2   pep088x;   label values lctime3   pep084x;
label values lcunit3   pep085x;   label values lcdura3   pep086x;
label values lcdurb3   pep087x;   label values lcchrc3   pep088x;
label values lctime4   pep084x;   label values lcunit4   pep085x;
label values lcdura4   pep086x;   label values lcdurb4   pep087x;
label values lcchrc4   pep088x;   label values lctime5   pep084x;
label values lcunit5   pep085x;   label values lcdura5   pep086x;
label values lcdurb5   pep087x;   label values lcchrc5   pep088x;
label values lctime6   pep084x;   label values lcunit6   pep085x;
label values lcdura6   pep086x;   label values lcdurb6   pep087x;
label values lcchrc6   pep088x;   label values lctime7   pep084x;
label values lcunit7   pep085x;   label values lcdura7   pep086x;
label values lcdurb7   pep087x;   label values lcchrc7   pep088x;
label values lctime8   pep084x;   label values lcunit8   pep085x;
label values lcdura8   pep086x;   label values lcdurb8   pep087x;
label values lcchrc8   pep088x;   label values lctime9   pep084x;
label values lcunit9   pep085x;   label values lcdura9   pep086x;
label values lcdurb9   pep087x;   label values lcchrc9   pep088x;
label values lctime10  pep084x;   label values lcunit10  pep085x;
label values lcdura10  pep086x;   label values lcdurb10  pep087x;
label values lcchrc10  pep088x;   label values lctime11  pep084x;
label values lcunit11  pep085x;   label values lcdura11  pep086x;
label values lcdurb11  pep087x;   label values lcchrc11  pep088x;
label values lctime12  pep084x;   label values lcunit12  pep085x;
label values lcdura12  pep086x;   label values lcdurb12  pep087x;
label values lcchrc12  pep088x;   label values lctime13  pep084x;
label values lcunit13  pep085x;   label values lcdura13  pep086x;
label values lcdurb13  pep087x;   label values lcchrc13  pep088x;
label values lctime90  pep084x;   label values lcunit90  pep085x;
label values lcdura90  pep086x;   label values lcdurb90  pep087x;
label values lcchrc90  pep088x;   label values lctime91  pep084x;
label values lcunit91  pep085x;   label values lcdura91  pep086x;
label values lcdurb91  pep087x;   label values lcchrc91  pep088x;
label values lahca1    pep069x;   label values lahca2    pep069x;
label values lahca3    pep069x;   label values lahca4    pep069x;
label values lahca5    pep069x;   label values lahca6    pep069x;
label values lahca7    pep069x;   label values lahca8    pep069x;
label values lahca9    pep069x;   label values lahca10   pep069x;
label values lahca11   pep069x;   label values lahca12   pep069x;
label values lahca13   pep069x;   label values lahca14   pep069x;
label values lahca15   pep069x;   label values lahca16   pep069x;
label values lahca17   pep069x;   label values lahca18   pep069x;
label values lahca19_  pep069x;   label values lahca20_  pep069x;
label values lahca21_  pep069x;   label values lahca22_  pep069x;
label values lahca23_  pep069x;   label values lahca24_  pep069x;
label values lahca25_  pep069x;   label values lahca26_  pep069x;
label values lahca27_  pep069x;   label values lahca28_  pep069x;
label values lahca29_  pep069x;   label values lahca30_  pep069x;
label values lahca31_  pep069x;   label values lahca32_  pep069x;
label values lahca33_  pep069x;   label values lahca34_  pep069x;
label values lahca90   pep069x;   label values lahca91   pep069x;
label values latime1   pep084x;   label values launit1   pep085x;
label values ladura1   pep197x;   label values ladurb1   pep198x;
label values lachrc1   pep088x;   label values latime2   pep084x;
label values launit2   pep085x;   label values ladura2   pep197x;
label values ladurb2   pep198x;   label values lachrc2   pep088x;
label values latime3   pep084x;   label values launit3   pep085x;
label values ladura3   pep197x;   label values ladurb3   pep198x;
label values lachrc3   pep088x;   label values latime4   pep084x;
label values launit4   pep085x;   label values ladura4   pep197x;
label values ladurb4   pep198x;   label values lachrc4   pep088x;
label values latime5   pep084x;   label values launit5   pep085x;
label values ladura5   pep197x;   label values ladurb5   pep198x;
label values lachrc5   pep088x;   label values latime6   pep084x;
label values launit6   pep085x;   label values ladura6   pep197x;
label values ladurb6   pep198x;   label values lachrc6   pep088x;
label values latime7   pep084x;   label values launit7   pep085x;
label values ladura7   pep197x;   label values ladurb7   pep198x;
label values lachrc7   pep088x;   label values latime8   pep084x;
label values launit8   pep085x;   label values ladura8   pep197x;
label values ladurb8   pep198x;   label values lachrc8   pep088x;
label values latime9   pep084x;   label values launit9   pep085x;
label values ladura9   pep197x;   label values ladurb9   pep198x;
label values lachrc9   pep088x;   label values latime10  pep084x;
label values launit10  pep085x;   label values ladura10  pep197x;
label values ladurb10  pep198x;   label values lachrc10  pep088x;
label values latime11  pep084x;   label values launit11  pep085x;
label values ladura11  pep197x;   label values ladurb11  pep198x;
label values lachrc11  pep088x;   label values latime12  pep084x;
label values launit12  pep085x;   label values ladura12  pep197x;
label values ladurb12  pep198x;   label values lachrc12  pep088x;
label values latime13  pep084x;   label values launit13  pep085x;
label values ladura13  pep197x;   label values ladurb13  pep198x;
label values lachrc13  pep088x;   label values latime14  pep084x;
label values launit14  pep085x;   label values ladura14  pep197x;
label values ladurb14  pep198x;   label values lachrc14  pep088x;
label values latime15  pep084x;   label values launit15  pep085x;
label values ladura15  pep197x;   label values ladurb15  pep198x;
label values lachrc15  pep088x;   label values latime16  pep084x;
label values launit16  pep085x;   label values ladura16  pep197x;
label values ladurb16  pep198x;   label values lachrc16  pep088x;
label values latime17  pep084x;   label values launit17  pep085x;
label values ladura17  pep197x;   label values ladurb17  pep198x;
label values lachrc17  pep088x;   label values latime18  pep084x;
label values launit18  pep085x;   label values ladura18  pep197x;
label values ladurb18  pep198x;   label values lachrc18  pep088x;
label values latime19  pep084x;   label values launit19  pep085x;
label values ladura19  pep197x;   label values ladurb19  pep198x;
label values lachrc19  pep088x;   label values latime20  pep084x;
label values launit20  pep085x;   label values ladura20  pep197x;
label values ladurb20  pep198x;   label values lachrc20  pep088x;
label values latime21  pep084x;   label values launit21  pep085x;
label values ladura21  pep197x;   label values ladurb21  pep198x;
label values lachrc21  pep088x;   label values latime22  pep084x;
label values launit22  pep085x;   label values ladura22  pep197x;
label values ladurb22  pep198x;   label values lachrc22  pep088x;
label values latime23  pep084x;   label values launit23  pep085x;
label values ladura23  pep197x;   label values ladurb23  pep198x;
label values lachrc23  pep088x;   label values latime24  pep084x;
label values launit24  pep085x;   label values ladura24  pep197x;
label values ladurb24  pep198x;   label values lachrc24  pep088x;
label values latime25  pep084x;   label values launit25  pep085x;
label values ladura25  pep197x;   label values ladurb25  pep198x;
label values lachrc25  pep088x;   label values latime26  pep084x;
label values launit26  pep085x;   label values ladura26  pep197x;
label values ladurb26  pep198x;   label values lachrc26  pep088x;
label values latime27  pep084x;   label values launit27  pep085x;
label values ladura27  pep197x;   label values ladurb27  pep198x;
label values lachrc27  pep088x;   label values latime28  pep084x;
label values launit28  pep085x;   label values ladura28  pep197x;
label values ladurb28  pep198x;   label values lachrc28  pep088x;
label values latime29  pep084x;   label values launit29  pep085x;
label values ladura29  pep197x;   label values ladurb29  pep198x;
label values lachrc29  pep088x;   label values latime30  pep084x;
label values launit30  pep085x;   label values ladura30  pep197x;
label values ladurb30  pep198x;   label values lachrc30  pep088x;
label values latime31  pep084x;   label values launit31  pep085x;
label values ladura31  pep197x;   label values ladurb31  pep198x;
label values lachrc31  pep088x;   label values latime32  pep084x;
label values launit32  pep085x;   label values ladura32  pep197x;
label values ladurb32  pep198x;   label values lachrc32  pep088x;
label values latime33  pep084x;   label values launit33  pep085x;
label values ladura33  pep197x;   label values ladurb33  pep198x;
label values lachrc33  pep088x;   label values latime34  pep084x;
label values launit34  pep085x;   label values ladura34  pep197x;
label values ladurb34  pep198x;   label values lachrc34  pep088x;
label values latime90  pep084x;   label values launit90  pep085x;
label values ladura90  pep197x;   label values ladurb90  pep198x;
label values lachrc90  pep088x;   label values latime91  pep084x;
label values launit91  pep085x;   label values ladura91  pep197x;
label values ladurb91  pep198x;   label values lachrc91  pep088x;
label values lcondrt   pep375x;   label values lachronr  pep376x;
label values phstat    pep377x;

label values pdmed12m  pep037x;   label values pnmed12m  pep037x;
label values phospyr2  pep037x;   label values hospno    pep381x;
label values hpnite    pep381x;   label values phchm2w   pep037x;
label values phchmn2w  pep384x;   label values phcph2wr  pep037x;
label values phcphn2w  pep384x;   label values phcdv2w   pep037x;
label values phcdvn2w  pep384x;   label values p10dvyr   pep037x;

label values notcov    pep390x;   label values medicare  pep391x;
label values mcpart    pep392x;   label values mcchoice  pep037x;
label values mchmo     pep037x;   label values mcnamen   pep395x;
label values mcref     pep037x;   label values mcpaypre  pep037x;
label values mcpartd   pep037x;   label values medicaid  pep391x;
label values machmd    pep400x;   label values mapcmd    pep037x;
label values maref     pep037x;   label values single    pep403x;
label values sstypea   pep069x;   label values sstypeb   pep069x;
label values sstypec   pep069x;   label values sstyped   pep069x;
label values sstypee   pep069x;   label values sstypef   pep069x;
label values sstypeg   pep069x;   label values sstypeh   pep069x;
label values sstypei   pep069x;   label values sstypej   pep069x;
label values sstypek   pep069x;   label values sstypel   pep069x;
label values private   pep391x;   label values hitype1   pep384x;
label values whonam1   pep418x;   label values plnwrkn1  pep419x;
label values plnpay11  pep069x;   label values plnpay21  pep069x;
label values plnpay31  pep069x;   label values plnpay41  pep069x;
label values plnpay51  pep069x;   label values plnpay61  pep069x;
label values plnpay71  pep069x;   label values hicostr1  pep427x;
label values plnmgd1   pep428x;   label values hdhp1     pep429x;
label values hsahra1   pep037x;   label values mgchmd1   pep431x;
label values mgprmd1   pep037x;   label values mgpymd1   pep037x;
label values mgpref1   pep037x;   label values prrxcov1  pep037x;
label values hitype2   pep384x;   label values whonam2   pep418x;
label values plnwrkn2  pep419x;   label values plnpay12  pep069x;
label values plnpay22  pep069x;   label values plnpay32  pep069x;
label values plnpay42  pep069x;   label values plnpay52  pep069x;
label values plnpay62  pep069x;   label values plnpay72  pep069x;
label values hicostr2  pep427x;   label values plnmgd2   pep428x;
label values hdhp2     pep429x;   label values hsahra2   pep037x;
label values mgchmd2   pep431x;   label values mgprmd2   pep037x;
label values mgpymd2   pep037x;   label values mgpref2   pep037x;
label values prrxcov2  pep037x;   label values prplplus  pep037x;
label values schip     pep391x;   label values stdoc1    pep400x;
label values stpcmd1   pep037x;   label values stref1    pep037x;
label values otherpub  pep391x;   label values stdoc2    pep400x;
label values stpcmd2   pep037x;   label values stref2    pep037x;
label values othergov  pep391x;   label values stdoc3    pep400x;
label values stpcmd3   pep037x;   label values stref3    pep037x;
label values military  pep391x;   label values milspc1   pep069x;
label values milspc2   pep069x;   label values milspc3   pep069x;
label values milspc4   pep069x;   label values milman    pep473x;
label values ihs       pep037x;   label values hilast    pep475x;
label values histop1   pep069x;   label values histop2   pep069x;
label values histop3   pep069x;   label values histop4   pep069x;
label values histop5   pep069x;   label values histop6   pep069x;
label values histop7   pep069x;   label values histop8   pep069x;
label values histop9   pep069x;   label values histop10  pep069x;
label values histop11  pep069x;   label values histop12  pep069x;
label values histop13  pep069x;   label values histop14  pep069x;
label values histop15  pep069x;   label values hinotyr   pep037x;
label values hinotmyr  pep384x;   label values hcspfyr   pep493x;
label values fsa       pep037x;   label values hikinda   pep069x;
label values hikindb   pep069x;   label values hikindc   pep069x;
label values hikindd   pep069x;   label values hikinde   pep069x;
label values hikindf   pep069x;   label values hikindg   pep069x;
label values hikindh   pep069x;   label values hikindi   pep069x;
label values hikindj   pep069x;   label values hikindk   pep069x;
label values mcareprb  pep037x;   label values mcaidprb  pep037x;
label values sincov    pep037x;

label values plborn    pep037x;   label values regionbr  pep510x;
label values geobrth   pep511x;   label values yrsinus   pep512x;
label values citizenp  pep513x;   label values headst    pep037x;
label values headstv1  pep037x;   label values educ1     pep516x;
label values pmiltry   pep037x;   label values doinglwp  pep518x;
label values whynowkp  pep519x;   label values wrkhrs2   pep520x;
label values wrkftall  pep037x;   label values wrklyr1   pep037x;
label values wrkmyr    pep523x;   label values ernyr_p   pep524x;
label values hiempof   pep037x;

label values fincint   pep526x;   label values psal      pep037x;
label values pseinc    pep037x;   label values pssrr     pep037x;
label values pssrrdb   pep037x;   label values pssrrd    pep037x;
label values ppens     pep037x;   label values popens    pep037x;
label values pssi      pep037x;   label values pssid     pep037x;
label values ptanf     pep037x;   label values powben    pep037x;
label values pintrstr  pep037x;   label values pdivd     pep037x;
label values pchldsp   pep037x;   label values pincot    pep037x;
label values pssapl    pep037x;   label values psdapl    pep037x;
label values tanfmyr   pep384x;   label values pfstp     pep037x;
label values fstpmyr   pep384x;   label values eligpwic  pep547x;
label values pwic      pep037x;   label values wic_flag  pep549x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa];
save $OUT/personsx, replace;

#delimit cr

* data file is stored in personsx.dta
* log  file is stored in personsx.log

log close
