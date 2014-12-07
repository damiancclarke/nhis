global DAT "~/database/NHIS/Data/raw/2011"
global OUT "~/database/NHIS/Data/dta/2011"
global LOG "~/database/NHIS/Log"

log using "$LOG/personsx.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 MAY 30, 2012  3:44 PM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2011 NHIS Public Use Person ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE personsx.dta AND personsx.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd c:\nhis2011\

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
      intv_mon     14 -  15  str fmx          16 -  17
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
      qcadult      93 -  93      qcchild      94 -  94

      fdrn_flg     95 -  95

      plaplylm     96 -  96      plaplyun     97 -  97
      pspedeis     98 -  98      pspedem      99 -  99
      plaadl      100 - 100      labath      101 - 101
      ladress     102 - 102      laeat       103 - 103
      labed       104 - 104      latoilt     105 - 105
      lahome      106 - 106      plaiadl     107 - 107
      plawknow    108 - 108      plawklim    109 - 109
      plawalk     110 - 110      plaremem    111 - 111
      plimany     112 - 112      la1ar       113 - 113
      lahcc1      114 - 114      lahcc2      115 - 115
      lahcc3      116 - 116      lahcc4      117 - 117
      lahcc5      118 - 118      lahcc6      119 - 119
      lahcc7a     120 - 120      lahcc8      121 - 121
      lahcc9      122 - 122      lahcc10     123 - 123
      lahcc11     124 - 124      lahcc12     125 - 125
      lahcc13     126 - 126      lahcc90     127 - 127
      lahcc91     128 - 128      lctime1     129 - 130
      lcunit1     131 - 131      lcdura1     132 - 133
      lcdurb1     134 - 134      lcchrc1     135 - 135
      lctime2     136 - 137      lcunit2     138 - 138
      lcdura2     139 - 140      lcdurb2     141 - 141
      lcchrc2     142 - 142      lctime3     143 - 144
      lcunit3     145 - 145      lcdura3     146 - 147
      lcdurb3     148 - 148      lcchrc3     149 - 149
      lctime4     150 - 151      lcunit4     152 - 152
      lcdura4     153 - 154      lcdurb4     155 - 155
      lcchrc4     156 - 156      lctime5     157 - 158
      lcunit5     159 - 159      lcdura5     160 - 161
      lcdurb5     162 - 162      lcchrc5     163 - 163
      lctime6     164 - 165      lcunit6     166 - 166
      lcdura6     167 - 168      lcdurb6     169 - 169
      lcchrc6     170 - 170      lctime7a    171 - 172
      lcunit7a    173 - 173      lcdura7a    174 - 175
      lcdurb7a    176 - 176      lcchrc7a    177 - 177
      lctime8     178 - 179      lcunit8     180 - 180
      lcdura8     181 - 182      lcdurb8     183 - 183
      lcchrc8     184 - 184      lctime9     185 - 186
      lcunit9     187 - 187      lcdura9     188 - 189
      lcdurb9     190 - 190      lcchrc9     191 - 191
      lctime10    192 - 193      lcunit10    194 - 194
      lcdura10    195 - 196      lcdurb10    197 - 197
      lcchrc10    198 - 198      lctime11    199 - 200
      lcunit11    201 - 201      lcdura11    202 - 203
      lcdurb11    204 - 204      lcchrc11    205 - 205
      lctime12    206 - 207      lcunit12    208 - 208
      lcdura12    209 - 210      lcdurb12    211 - 211
      lcchrc12    212 - 212      lctime13    213 - 214
      lcunit13    215 - 215      lcdura13    216 - 217
      lcdurb13    218 - 218      lcchrc13    219 - 219
      lctime90    220 - 221      lcunit90    222 - 222
      lcdura90    223 - 224      lcdurb90    225 - 225
      lcchrc90    226 - 226      lctime91    227 - 228
      lcunit91    229 - 229      lcdura91    230 - 231
      lcdurb91    232 - 232      lcchrc91    233 - 233
      lahca1      234 - 234      lahca2      235 - 235
      lahca3      236 - 236      lahca4      237 - 237
      lahca5      238 - 238      lahca6      239 - 239
      lahca7      240 - 240      lahca8      241 - 241
      lahca9      242 - 242      lahca10     243 - 243
      lahca11     244 - 244      lahca12     245 - 245
      lahca13     246 - 246      lahca14a    247 - 247
      lahca15     248 - 248      lahca16     249 - 249
      lahca17     250 - 250      lahca18     251 - 251
      lahca19_    252 - 252      lahca20_    253 - 253
      lahca21_    254 - 254      lahca22_    255 - 255
      lahca23_    256 - 256      lahca24_    257 - 257
      lahca25_    258 - 258      lahca26_    259 - 259
      lahca27_    260 - 260      lahca28_    261 - 261
      lahca29_    262 - 262      lahca30_    263 - 263
      lahca31_    264 - 264      lahca32_    265 - 265
      lahca33_    266 - 266      lahca34_    267 - 267
      lahca90     268 - 268      lahca91     269 - 269
      latime1     270 - 271      launit1     272 - 272
      ladura1     273 - 274      ladurb1     275 - 275
      lachrc1     276 - 276      latime2     277 - 278
      launit2     279 - 279      ladura2     280 - 281
      ladurb2     282 - 282      lachrc2     283 - 283
      latime3     284 - 285      launit3     286 - 286
      ladura3     287 - 288      ladurb3     289 - 289
      lachrc3     290 - 290      latime4     291 - 292
      launit4     293 - 293      ladura4     294 - 295
      ladurb4     296 - 296      lachrc4     297 - 297
      latime5     298 - 299      launit5     300 - 300
      ladura5     301 - 302      ladurb5     303 - 303
      lachrc5     304 - 304      latime6     305 - 306
      launit6     307 - 307      ladura6     308 - 309
      ladurb6     310 - 310      lachrc6     311 - 311
      latime7     312 - 313      launit7     314 - 314
      ladura7     315 - 316      ladurb7     317 - 317
      lachrc7     318 - 318      latime8     319 - 320
      launit8     321 - 321      ladura8     322 - 323
      ladurb8     324 - 324      lachrc8     325 - 325
      latime9     326 - 327      launit9     328 - 328
      ladura9     329 - 330      ladurb9     331 - 331
      lachrc9     332 - 332      latime10    333 - 334
      launit10    335 - 335      ladura10    336 - 337
      ladurb10    338 - 338      lachrc10    339 - 339
      latime11    340 - 341      launit11    342 - 342
      ladura11    343 - 344      ladurb11    345 - 345
      lachrc11    346 - 346      latime12    347 - 348
      launit12    349 - 349      ladura12    350 - 351
      ladurb12    352 - 352      lachrc12    353 - 353
      latime13    354 - 355      launit13    356 - 356
      ladura13    357 - 358      ladurb13    359 - 359
      lachrc13    360 - 360      ltime14a    361 - 362
      lunit14a    363 - 363      ldura14a    364 - 365
      ldurb14a    366 - 366      lchrc14a    367 - 367
      latime15    368 - 369      launit15    370 - 370
      ladura15    371 - 372      ladurb15    373 - 373
      lachrc15    374 - 374      latime16    375 - 376
      launit16    377 - 377      ladura16    378 - 379
      ladurb16    380 - 380      lachrc16    381 - 381
      latime17    382 - 383      launit17    384 - 384
      ladura17    385 - 386      ladurb17    387 - 387
      lachrc17    388 - 388      latime18    389 - 390
      launit18    391 - 391      ladura18    392 - 393
      ladurb18    394 - 394      lachrc18    395 - 395
      latime19    396 - 397      launit19    398 - 398
      ladura19    399 - 400      ladurb19    401 - 401
      lachrc19    402 - 402      latime20    403 - 404
      launit20    405 - 405      ladura20    406 - 407
      ladurb20    408 - 408      lachrc20    409 - 409
      latime21    410 - 411      launit21    412 - 412
      ladura21    413 - 414      ladurb21    415 - 415
      lachrc21    416 - 416      latime22    417 - 418
      launit22    419 - 419      ladura22    420 - 421
      ladurb22    422 - 422      lachrc22    423 - 423
      latime23    424 - 425      launit23    426 - 426
      ladura23    427 - 428      ladurb23    429 - 429
      lachrc23    430 - 430      latime24    431 - 432
      launit24    433 - 433      ladura24    434 - 435
      ladurb24    436 - 436      lachrc24    437 - 437
      latime25    438 - 439      launit25    440 - 440
      ladura25    441 - 442      ladurb25    443 - 443
      lachrc25    444 - 444      latime26    445 - 446
      launit26    447 - 447      ladura26    448 - 449
      ladurb26    450 - 450      lachrc26    451 - 451
      latime27    452 - 453      launit27    454 - 454
      ladura27    455 - 456      ladurb27    457 - 457
      lachrc27    458 - 458      latime28    459 - 460
      launit28    461 - 461      ladura28    462 - 463
      ladurb28    464 - 464      lachrc28    465 - 465
      latime29    466 - 467      launit29    468 - 468
      ladura29    469 - 470      ladurb29    471 - 471
      lachrc29    472 - 472      latime30    473 - 474
      launit30    475 - 475      ladura30    476 - 477
      ladurb30    478 - 478      lachrc30    479 - 479
      latime31    480 - 481      launit31    482 - 482
      ladura31    483 - 484      ladurb31    485 - 485
      lachrc31    486 - 486      latime32    487 - 488
      launit32    489 - 489      ladura32    490 - 491
      ladurb32    492 - 492      lachrc32    493 - 493
      latime33    494 - 495      launit33    496 - 496
      ladura33    497 - 498      ladurb33    499 - 499
      lachrc33    500 - 500      latime34    501 - 502
      launit34    503 - 503      ladura34    504 - 505
      ladurb34    506 - 506      lachrc34    507 - 507
      latime90    508 - 509      launit90    510 - 510
      ladura90    511 - 512      ladurb90    513 - 513
      lachrc90    514 - 514      latime91    515 - 516
      launit91    517 - 517      ladura91    518 - 519
      ladurb91    520 - 520      lachrc91    521 - 521
      lcondrt     522 - 522      lachronr    523 - 523
      phstat      524 - 524

      pdmed12m    525 - 525      pnmed12m    526 - 526
      phospyr2    527 - 527      hospno      528 - 530
      hpnite      531 - 533      phchm2w     534 - 534
      phchmn2w    535 - 536      phcph2wr    537 - 537
      phcphn2w    538 - 539      phcdv2w     540 - 540
      phcdvn2w    541 - 542      p10dvyr     543 - 543

      notcov      544 - 544      medicare    545 - 545
      mcpart      546 - 546      mcchoice    547 - 547
      mchmo       548 - 548      mcadvr      549 - 549
      mcprem      550 - 550      mcref       551 - 551
      mcpartd     552 - 552      medicaid    553 - 553
      machmd      554 - 554      mapcmd      555 - 555
      maref       556 - 556      single      557 - 557
      sstypea     558 - 558      sstypeb     559 - 559
      sstypec     560 - 560      sstyped     561 - 561
      sstypee     562 - 562      sstypef     563 - 563
      sstypeg     564 - 564      sstypeh     565 - 565
      sstypei     566 - 566      sstypej     567 - 567
      sstypek     568 - 568      sstypel     569 - 569
      private     570 - 570      whonam1     571 - 571
      prpolh1     572 - 572      prcooh1     573 - 573
      prctoh1     574 - 575      prrloh11    576 - 576
      prrloh21    577 - 577      prrloh31    578 - 578
      prrloh41    579 - 579      prcnum1     580 - 581
      cohu191     582 - 583      coh19251    584 - 585
      coho251     586 - 587      plnwrkr1    588 - 589
      plnpay11    590 - 590      plnpay21    591 - 591
      plnpay31    592 - 592      plnpay41    593 - 593
      plnpay51    594 - 594      plnpay61    595 - 595
      plnpay71    596 - 596      hicostr1    597 - 601
      emppay1     602 - 602      ecostr1     603 - 607
      empcstp1    608 - 610      plnmgd1     611 - 611
      hdhp1       612 - 612      hsahra1     613 - 613
      mgchmd1     614 - 614      mgprmd1     615 - 615
      mgpymd1     616 - 616      mgpref1     617 - 617
      pcpreq1     618 - 618      prrxcov1    619 - 619
      prdncov1    620 - 620      whonam2     621 - 621
      prpolh2     622 - 622      prcooh2     623 - 623
      prctoh2     624 - 625      prrloh12    626 - 626
      prrloh22    627 - 627      prrloh32    628 - 628
      prrloh42    629 - 629      prcnum2     630 - 631
      cohu192     632 - 633      coh19252    634 - 635
      coho252     636 - 637      plnwrkr2    638 - 639
      plnpay12    640 - 640      plnpay22    641 - 641
      plnpay32    642 - 642      plnpay42    643 - 643
      plnpay52    644 - 644      plnpay62    645 - 645
      plnpay72    646 - 646      hicostr2    647 - 651
      emppay2     652 - 652      ecostr2     653 - 657
      empcstp2    658 - 660      plnmgd2     661 - 661
      hdhp2       662 - 662      hsahra2     663 - 663
      mgchmd2     664 - 664      mgprmd2     665 - 665
      mgpymd2     666 - 666      mgpref2     667 - 667
      pcpreq2     668 - 668      prrxcov2    669 - 669
      prdncov2    670 - 670      prplplus    671 - 671
      fcovconf    672 - 672      schip       673 - 673
      stdoc1      674 - 674      stpcmd1     675 - 675
      stref1      676 - 676      othpub      677 - 677
      stdoc2      678 - 678      stpcmd2     679 - 679
      stref2      680 - 680      othgov      681 - 681
      stdoc3      682 - 682      stpcmd3     683 - 683
      stref3      684 - 684      milcare     685 - 685
      milspc1     686 - 686      milspc2     687 - 687
      milspc3     688 - 688      milspc4     689 - 689
      milman      690 - 690      ihs         691 - 691
      hilast      692 - 692      histop1     693 - 693
      histop2     694 - 694      histop3     695 - 695
      histop4     696 - 696      histop5     697 - 697
      histop6     698 - 698      histop7     699 - 699
      histop8     700 - 700      histop9     701 - 701
      histop10    702 - 702      histop11    703 - 703
      histop12    704 - 704      histop13    705 - 705
      histop14    706 - 706      histop15    707 - 707
      hinotyr     708 - 708      hinotmyr    709 - 710
      fhichng     711 - 711      fhikdba     712 - 712
      fhikdbb     713 - 713      fhikdbc     714 - 714
      fhikdbd     715 - 715      fhikdbe     716 - 716
      fhikdbf     717 - 717      fhikdbg     718 - 718
      fhikdbh     719 - 719      fhikdbi     720 - 720
      fhikdbj     721 - 721      fhikdbk     722 - 722
      pwrkbr1     723 - 724      hcspfyr     725 - 725
      medbill     726 - 726      medbpay     727 - 727
      medbnop     728 - 728      fsa         729 - 729
      hikindna    730 - 730      hikindnb    731 - 731
      hikindnc    732 - 732      hikindnd    733 - 733
      hikindne    734 - 734      hikindnf    735 - 735
      hikindng    736 - 736      hikindnh    737 - 737
      hikindni    738 - 738      hikindnj    739 - 739
      hikindnk    740 - 740      mcareprb    741 - 741
      mcaidprb    742 - 742      sincov      743 - 743

      plborn      744 - 744      regionbr    745 - 746
      geobrth     747 - 747      yrsinus     748 - 748
      citizenp    749 - 749      headst      750 - 750
      headstv1    751 - 751      educ1       752 - 753
      armfver     754 - 754      armfev      755 - 755
      armffc      756 - 756      armftm1     757 - 757
      armftm2     758 - 758      armftm3     759 - 759
      armftm4     760 - 760      armftm5     761 - 761
      armftm6     762 - 762      armftm7     763 - 763
      armftm8     764 - 764      armftm9     765 - 765
      armft10p    766 - 766      armfds      767 - 767
      doinglwp    768 - 768      whynowkp    769 - 770
      wrkhrs2     771 - 772      wrkftall    773 - 773
      wrklyr1     774 - 774      wrkmyr      775 - 776
      ernyr_p     777 - 778      ernyrflg    779 - 779
      hiempof     780 - 780

      fincint     781 - 781      psal        782 - 782
      pseinc      783 - 783      pssrr       784 - 784
      pssrrdb     785 - 785      pssrrd      786 - 786
      ppens       787 - 787      popens      788 - 788
      pssi        789 - 789      pssid       790 - 790
      ptanf       791 - 791      powben      792 - 792
      pintrstr    793 - 793      pdivd       794 - 794
      pchldsp     795 - 795      pincot      796 - 796
      pssapl      797 - 797      psdapl      798 - 798
      tanfmyr     799 - 800      eligpwic    801 - 801
      pwic        802 - 802      wic_flag    803 - 803

using "$DAT/personsx.dat";
replace wtia = wtia/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: Household Number";
label variable intv_qrt "IDN.000_25.000: Interview Quarter";
label variable intv_mon "IDN.000_30.000: Interview Month";
label variable fmx      "IDN.000_35.000: Family Number";
label variable fpx      "IDN.000_40.000: Person Number (Within family)";
label variable wtia     "IDN.000_65.000: Weight - Interim Annual";
label variable wtfa     "IDN.000_70.000: Weight - Final Annual";

label variable region   "UCF.000_00.000: Region";
label variable strat_p  "
UCF.000_00.000: Pseudo-stratum for public-use file variance estimation";
label variable psu_p    "
UCF.000_00.000: Pseudo-PSU for public-use file variance estimation";

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
label variable cdcmstat "FID.300_00.000: CDC standard for legal marital status";
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
label variable qcadult  "FID.580_00.000: Quality control flag for sample adult";
label variable qcchild  "FID.590_00.000: Quality control flag for sample child";

label variable fdrn_flg "FDB.001_00.000: Disability Questions Test flag";

label variable plaplylm "FHS.010_00.000: Is - - limited in kind/amount play?";
label variable plaplyun "FHS.020_00.000: Is - - able to play at all?";
label variable pspedeis "
FHS.060_00.000: Does - - receive Special Education or EIS?";
label variable pspedem  "
FHS.065_00.000: Receive Special Education/EIS due to emotional/behavioral proble
m";
label variable plaadl   "FHS.080_00.000: Does - - need help with personal care?
";
label variable labath   "
FHS.090_01.000: Does - - need help with bathing/showering?";
label variable ladress  "FHS.090_02.000: Does - - need help dressing?";
label variable laeat    "FHS.090_03.000: Does - - need help eating?";
label variable labed    "
FHS.090_04.000: Does - - need help in/out of bed or chairs?";
label variable latoilt  "FHS.090_05.000: Does - - need help using the toilet?";
label variable lahome   "
FHS.090_06.000: Does - - need help to get around in the home?";
label variable plaiadl  "FHS.160_00.000: Does - - need help with routine needs?
";
label variable plawknow "
FHS.180_00.000: Is - - unable to work NOW due to health problem?";
label variable plawklim "FHS.200_00.000: Is - - limited in kind/amount of work?
";
label variable plawalk  "
FHS.220_00.000: Does - - have difficulty walking without equipment?";
label variable plaremem "
FHS.240_00.000: Is - - limited by difficulty remembering?";
label variable plimany  "FHS.260_00.000: Is - - limited in any (other) way?";
label variable la1ar    "FHS: Any limitation - all persons, all conditions";
label variable lahcc1   "FHS.270_01.000: Vision/problem seeing causes limitation
";
label variable lahcc2   "FHS.270_02.000: Hearing problem causes limitation";
label variable lahcc3   "FHS.270_03.000: Speech problem causes limitation";
label variable lahcc4   "
FHS.270_04.000: Asthma/breathing problem causes limitation";
label variable lahcc5   "FHS.270_05.000: Birth defect causes limitation";
label variable lahcc6   "FHS.270_06.000: Injury causes limitation";
label variable lahcc7a  "
FHS.270_07.000: Intellectual disability, also known as mental retardation causes
 limitation";
label variable lahcc8   "
FHS.270_08.000: Other developmental problem (e.g., cerebral palsy) causes limita
tion";
label variable lahcc9   "
FHS.270_09.000: Other mental, emotional, or behavioral problem causes limitation
";
label variable lahcc10  "
FHS.270_10.000: Bone, joint, or muscle problem causes limitation";
label variable lahcc11  "FHS.270_11.000: Epilepsy or seizures cause limitation";
label variable lahcc12  "FHS.270_12.000: Learning disability causes limitation";
label variable lahcc13  "
FHS.270_13.000: Attention Deficit/Hyperactivity Disorder (ADD/ADHD) causes limit
ation";
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
label variable lctime7a "
FHS.290_01.000: Duration of intellectual disability, also known as mental retard
ation: Number of units";
label variable lcunit7a "
FHS.290_02.000: Duration of intellectual disability, also known as mental retard
ation: Time unit";
label variable lcdura7a "
FHS.290_02.000: Duration of intellectual disability, also known as mental retard
ation (in years)";
label variable lcdurb7a "
FHS.290_02.000: Duration of intellectual disability, also known as mental retard
ation recode 2";
label variable lcchrc7a "
FHS.290_02.000: Intellectual disability, also known as mental retardation condit
ion status";
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
FHS.294_02.000: Duration of other mental, emotional, or behavioral problem: Numb
er of units";
label variable lcdura9  "
FHS.294_02.000: Duration of other mental, emotional, or behavioral problem (in y
ears)";
label variable lcdurb9  "
FHS.294_02.000: Duration of other mental, emotional, or behavioral problem recod
e 2";
label variable lcchrc9  "
FHS.294_02.000: Other mental, emotional, or behavioral problem condition status
";
label variable lctime10 "
FHS.296_01.000: Duration of bone, joint, or muscle problem: Number of units";
label variable lcunit10 "
FHS.296_02.000: Duration of bone, joint, or muscle problem: Time unit";
label variable lcdura10 "
FHS.296_02.000: Duration of bone, joint, or muscle problem (in years)";
label variable lcdurb10 "
FHS.296_02.000: Duration of bone, joint, or muscle problem recode 2";
label variable lcchrc10 "
FHS.296_02.000: Bone, joint, or muscle problem condition status";
label variable lctime11 "
FHS.298_01.000: Duration of epilepsy or seizures: Number of units";
label variable lcunit11 "
FHS.298_02.000: Duration of epilepsy or seizures: Time unit";
label variable lcdura11 "
FHS.298_02.000: Duration of epilepsy or seizures (in years)";
label variable lcdurb11 "
FHS.298_02.000: Duration of epilepsy or seizures recode 2";
label variable lcchrc11 "FHS.298_02.000: Epilepsy or seizures condition status";
label variable lctime12 "
FHS.300_01.000: Duration of learning disability: Number of units";
label variable lcunit12 "
FHS.300_02.000: Duration of learning disability: Time unit";
label variable lcdura12 "
FHS.300_02.000: Duration of learning disability (in years)";
label variable lcdurb12 "
FHS.300_02.000: Duration of learning disability recode 2";
label variable lcchrc12 "FHS.300_02.000: Learning disability condition status";
label variable lctime13 "
FHS.302_01.000: Duration of attention deficit/hyperactivity disorder (ADD/ADHD):
 Number of units";
label variable lcunit13 "
FHS.302_02.000: Duration of attention deficit/hyperactivity disorder (ADD/ADHD):
 Time unit";
label variable lcdura13 "
FHS.302_02.000: Duration of attention deficit/hyperactivity disorder (ADD/ADHD) 
(in years)";
label variable lcdurb13 "
FHS.302_02.000: Duration of attention deficit/hyperactivity disorder (ADD/ADHD) 
recode 2";
label variable lcchrc13 "
FHS.302_02.000: Attention deficit/hyperactivity disorder (ADD/ADHD) condition st
atus";
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
label variable lahca1   "FHS.350_01.000: Vision/problem seeing causes limitation
";
label variable lahca2   "FHS.350_02.000: Hearing problem causes limitation";
label variable lahca3   "FHS.350_03.000: Arthritis/rheumatism causes limitation
";
label variable lahca4   "FHS.350_04.000: Back or neck problem causes limitation
";
label variable lahca5   "
FHS.350_05.000: Fracture, bone/joint injury causes limitation";
label variable lahca6   "FHS.350_06.000: Other injury causes limitation";
label variable lahca7   "FHS.350_07.000: Heart problem causes limitation";
label variable lahca8   "FHS.350_08.000: Stroke problem causes limitation";
label variable lahca9   "
FHS.350_09.000: Hypertension/high blood pressure causes limitation";
label variable lahca10  "FHS.350_10.000: Diabetes causes limitation";
label variable lahca11  "
FHS.350_11.000: Lung/breathing problem (e.g., asthma and emphysema) causes limit
ation";
label variable lahca12  "FHS.350_12.000: Cancer causes limitation";
label variable lahca13  "FHS.350_13.000: Birth defect causes limitation";
label variable lahca14a "
FHS.350_14.000: Intellectual disability, also known as mental retardation causes
 limitation";
label variable lahca15  "
FHS.350_15.000: Other developmental problem (e.g., cerebral palsy) causes limita
tion";
label variable lahca16  "FHS.350_16.000: Senility causes limitation";
label variable lahca17  "
FHS.350_17.000: Depression/anxiety/emotional problem causes limitation";
label variable lahca18  "FHS.350_18.000: Weight problem causes limitation";
label variable lahca19_ "
FHS.350_18.000: Missing or amputated limb/finger/digit causes limitation";
label variable lahca20_ "
FHS.350_18.000: Musculoskeletal/connective tissue problem causes limitation";
label variable lahca21_ "
FHS.350_18.000: Circulation problems (including blood clots) cause limitation";
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
FHS.350_90.000: Other impairment/problem (1) causes limitation";
label variable lahca91  "
FHS.350_91.000: Other impairment/problem (2) causes limitation";
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
FHS.366_01.000: Duration of back or neck problem: Number of units";
label variable launit4  "
FHS.366_02.000: Duration of back or neck problem: Time unit";
label variable ladura4  "
FHS.366_02.000: Duration of back or neck problem (in years)";
label variable ladurb4  "
FHS.366_02.000: Duration of back or neck problem recode 2";
label variable lachrc4  "FHS.366_02.000: Back or neck problem condition status";
label variable latime5  "
FHS.368_01.000: Duration of fracture, bone/joint injury: Number of units";
label variable launit5  "
FHS.368_02.000: Duration of fracture, bone/joint injury: Time unit";
label variable ladura5  "
FHS.368_02.000: Duration of fracture, bone/joint injury (in years)";
label variable ladurb5  "
FHS.368_02.000: Duration of fracture, bone/joint injury recode 2";
label variable lachrc5  "
FHS.368_02.000: Fracture, bone/joint injury condition status";
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
label variable latime8  "
FHS.374_01.000: Duration of stroke problem: Number of units";
label variable launit8  "FHS.374_02.000: Duration of stroke problem: Time unit";
label variable ladura8  "FHS.374_02.000: Duration of stroke problem (in years)";
label variable ladurb8  "FHS.374_02.000: Duration of stroke problem recode 2";
label variable lachrc8  "FHS.374_02.000: Stroke problem condition status";
label variable latime9  "
FHS.376_01.000: Duration of hypertension or high blood pressure: Number of units
";
label variable launit9  "
FHS.376_02.000: Duration of hypertension or high blood pressure: Time unit";
label variable ladura9  "
FHS.376_02.000: Duration of hypertension or high blood pressure (in years)";
label variable ladurb9  "
FHS.376_02.000: Duration of hypertension or high blood pressure: recode 2";
label variable lachrc9  "
FHS.376_02.000: Hypertension or high blood pressure condition status";
label variable latime10 "FHS.378_01.000: Duration of diabetes: Number of units";
label variable launit10 "FHS.378_02.000: Duration of diabetes: Time unit";
label variable ladura10 "FHS.378_02.000: Duration of diabetes (in years)";
label variable ladurb10 "FHS.378_02.000: Duration of diabetes recode 2";
label variable lachrc10 "FHS.378_02.000: Diabetes condition status";
label variable latime11 "
FHS.380_01.000: Duration of lung or breathing problem (e.g., asthma and emphysem
a): Number of units";
label variable launit11 "
FHS.380_02.000: Duration of lung or breathing problem (e.g., asthma and emphysem
a): Time unit";
label variable ladura11 "
FHS.380_02.000: Duration of lung or breathing problem (e.g., asthma and emphysem
a) (in years)";
label variable ladurb11 "
FHS.380_02.000: Duration of lung or breathing problem (e.g., asthma and emphysem
a): recode 2";
label variable lachrc11 "
FHS.380_02.000: Lung or breathing problem (e.g., asthma and emphysema): conditio
n status";
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
label variable ltime14a "
FHS.384_01.000: Duration of intellectual disability, also known as mental retard
ation: Number of units";
label variable lunit14a "
FHS.384_02.000: Duration of intellectual disability, also known as mental retard
ation: Time unit";
label variable ldura14a "
FHS.384_02.000: Duration of intellectual disability, also known as mental retard
ation (in years)";
label variable ldurb14a "
FHS.384_02.000: Duration of intellectual disability, also known as mental retard
ation recode 2";
label variable lchrc14a "
FHS.384_02.000: Intellectual disability, also known as mental retardation condit
ion status";
label variable latime15 "
FHS.386_01.000: Duration of other developmental problem (e.g., cerebral palsy): 
Number of units";
label variable launit15 "
FHS.386_02.000: Duration of other developmental problem (e.g., cerebral palsy): 
Time unit";
label variable ladura15 "
FHS.386_02.000: Duration of other developmental problem (e.g., cerebral palsy) (
in years)";
label variable ladurb15 "
FHS.386_02.000: Duration of other developmental problem (e.g., cerebral palsy) r
ecode 2";
label variable lachrc15 "
FHS.386_02.000: Other developmental problem (e.g., cerebral palsy) condition sta
tus";
label variable latime16 "FHS.388_01.000: Duration of senility: Number of units";
label variable launit16 "FHS.388_02.000: Duration of senility: Time unit";
label variable ladura16 "FHS.388_02.000: Duration of senility (in years)";
label variable ladurb16 "FHS.388_02.000: Duration of senility recode 2";
label variable lachrc16 "FHS.388_02.000: Senility condition status";
label variable latime17 "
FHS.390_01.000: Duration of depression, anxiety, or emotional problem: Number of
 units";
label variable launit17 "
FHS.390_02.000: Duration of depression, anxiety, or emotional problem: Time unit
";
label variable ladura17 "
FHS.390_02.000: Duration of depression, anxiety, or emotional problem (in years)
";
label variable ladurb17 "
FHS.390_02.000: Duration of depression, anxiety, or emotional problem recode 2";
label variable lachrc17 "
FHS.390_02.000: Depression/anxiety/emotional problem condition status";
label variable latime18 "
FHS.392_01.000: Duration of weight problem: Number of units";
label variable launit18 "FHS.392_02.000: Duration of weight problem: Time unit";
label variable ladura18 "FHS.392_02.000: Duration of weight problem (in years)";
label variable ladurb18 "FHS.392_02.000: Duration of weight problem recode 2";
label variable lachrc18 "FHS.392_02.000: Weight problem condition status";
label variable latime19 "
FHS.394_01.000 RECOD: Duration of missing limbs (fingers, toes, or digits); ampu
tation: Number of units";
label variable launit19 "
FHS.394_02.000 RECOD: Duration of missing limbs (fingers, toes, or digits); ampu
tation: Time unit";
label variable ladura19 "
FHS.394_02.000: Duration of missing limbs (fingers, toes, or digits); amputation
 (in years)";
label variable ladurb19 "
FHS.394_02.000: Duration of missing limbs (fingers, toes, or digits); amputation
 recode 2";
label variable lachrc19 "
FHS.394_02.000: Missing limbs (fingers, toes, or digits); amputation condition s
tatus";
label variable latime20 "
FHS.396_01.000 RECOD: Duration of musculoskeletal/connective tissue problem: Num
ber of units";
label variable launit20 "
FHS.396_02.000 RECOD: Duration of musculoskeletal/connective tissue problem: Tim
e unit";
label variable ladura20 "
FHS.396_02.000: Duration of musculoskeletal/connective tissue problem (in years)
";
label variable ladurb20 "
FHS.396_02.000: Duration of musculoskeletal/connective tissue problem recode 2";
label variable lachrc20 "
FHS.396_02.000: Musculoskeletal/connective tissue problem condition status";
label variable latime21 "
FHS.398_01.000 RECOD: Duration of circulation problems (including blood clots) :
 Number of units";
label variable launit21 "
FHS.398_02.000 RECOD: Duration of circulation problems (including blood clots): 
Time unit";
label variable ladura21 "
FHS.398_02.000: Duration of circulation problems (including blood clots) (in yea
rs)";
label variable ladurb21 "
FHS.398_02.000: Duration of circulation problems (including blood clots) recode 
2";
label variable lachrc21 "
FHS.398_02.000: Circulation problems (including blood clots) condition status";
label variable latime22 "
FHS.400_01.000 RECOD: Duration of endocrine/nutritional/metabolic problem: Numbe
r of units";
label variable launit22 "
FHS.400_02.000 RECOD: Duration of endocrine/nutritional/metabolic problem: Time 
unit";
label variable ladura22 "
FHS.400_02.000: Duration of endocrine/nutritional/metabolic problem (in years)";
label variable ladurb22 "
FHS.400_02.000: Duration of endocrine/nutritional/metabolic problem recode 2";
label variable lachrc22 "
FHS.400_02.000: Endocrine/nutritional/metabolic problem condition status";
label variable latime23 "
FHS.402_01.000 RECOD: Duration of nervous system /sensory organ condition: Numbe
r of units";
label variable launit23 "
FHS.402_02.000 RECOD: Duration of nervous system/sensory organ condition: Time u
nit";
label variable ladura23 "
FHS.402_02.000: Duration of nervous system/sensory organ condition (in years)";
label variable ladurb23 "
FHS.402_02.000: Duration of nervous system/sensory organ condition recode 2";
label variable lachrc23 "
FHS.402_02.000: Nervous system/sensory organ condition status";
label variable latime24 "
FHS.404_01.000 RECOD: Duration of digestive system problems: Number of units";
label variable launit24 "
FHS.404_02.000 RECOD: Duration of digestive system problems: Number of units";
label variable ladura24 "
FHS.404_02.000: Duration of digestive system problems (in years)";
label variable ladurb24 "
FHS.404_02.000: Duration of digestive system problems recode 2";
label variable lachrc24 "
FHS.404_02.000: Digestive system problems condition status";
label variable latime25 "
FHS.406_01.000 RECOD: Duration of genitourinary system problem: Number of units
";
label variable launit25 "
FHS.406_02.000 RECOD: Duration of genitourinary system problem: Time unit";
label variable ladura25 "
FHS.406_02.000: Duration of genitourinary system problem (in years)";
label variable ladurb25 "
FHS.406_02.000: Duration of genitourinary system problem recode 2";
label variable lachrc25 "
FHS.406_02.000: Genitourinary system problem condition status";
label variable latime26 "
FHS.408_01.000 RECOD: Duration of skin/subcutaneous system problems: Number of u
nits";
label variable launit26 "
FHS.408_02.000 RECOD: Duration of skin/subcutaneous system problems: Time unit";
label variable ladura26 "
FHS.408_02.000: Duration of skin/subcutaneous system problems (in years)";
label variable ladurb26 "
FHS.408_02.000: Duration of skin/subcutaneous system problem recode 2";
label variable lachrc26 "
FHS.408_02.000: Skin/subcutaneous system problems condition status";
label variable latime27 "
FHS.410_01.000 RECOD: Duration of blood or blood-forming organ problem: Number o
f units";
label variable launit27 "
FHS.410_02.000 RECOD: Duration of blood or blood-forming organ problem: Time uni
t";
label variable ladura27 "
FHS.410_02.000: Duration of blood or blood-forming organ problem (in years)";
label variable ladurb27 "
FHS.410_02.000: Duration of blood or blood-forming organ problem recode 2";
label variable lachrc27 "
FHS.410_02.000: Blood or blood-forming organ problem condition status";
label variable latime28 "
FHS.412_01.000 RECOD: Duration of benign tumor/cyst: Number of units";
label variable launit28 "
FHS.412_02.000 RECOD: Duration of benign tumor/cyst: Time unit";
label variable ladura28 "
FHS.412_02.000: Duration of benign tumor/cyst (in years)";
label variable ladurb28 "FHS.412_02.000: Duration of benign tumor/cyst recode 2
";
label variable lachrc28 "FHS.412_02.000: Benign tumor/cyst condition status";
label variable latime29 "
FHS.414_01.000 RECOD: Duration of alcohol/drug/substance abuse problem: Number o
f units";
label variable launit29 "
FHS.414_02.000 RECOD: Duration of alcohol/drug/substance abuse problem: Time uni
t";
label variable ladura29 "
FHS.414_02.000: Duration of alcohol/drug/substance abuse problem (in years)";
label variable ladurb29 "
FHS.414_02.000: Duration of alcohol/drug/substance abuse problem recode 2";
label variable lachrc29 "
FHS.414_02.000: Alcohol/drug/substance abuse problem condition status";
label variable latime30 "
FHS.416_01.000 RECOD: Duration of other mental problem/ADD/Bipolar/Schizophrenia
: Number of units";
label variable launit30 "
FHS.416_02.000 RECOD: Duration of other mental problem/ADD/Bipolar/Schizophrenia
: Time unit";
label variable ladura30 "
FHS.416_02.000: Duration of other mental problem/ADD/Bipolar/Schizophrenia (in y
ears)";
label variable ladurb30 "
FHS.416_02.000: Duration of other mental problem/ADD/Bipolar/Schizophrenia recod
e 2";
label variable lachrc30 "
FHS.416_02.000: Other mental problem/ADD/Bipolar/Schizophrenia condition status
";
label variable latime31 "
FHS.418_01.000 RECOD: Duration of surgical after-effects/medical treatment probl
ems: Number of units";
label variable launit31 "
FHS.418_02.000 RECOD: Duration of surgical after-effects/medical treatment probl
ems: Time unit";
label variable ladura31 "
FHS.418_02.000: Duration of surgical after-effects/medical treatment problems (i
n years)";
label variable ladurb31 "
FHS.418_02.000: Duration of surgical after-effects/medical treatment problems re
code 2";
label variable lachrc31 "
FHS.418_02.000: Surgical after-effects/medical treatment problems condition stat
us";
label variable latime32 "
FHS.420_01.000 RECOD: Duration of 'old age'/elderly/aging-related problems: Numb
er of units";
label variable launit32 "
FHS.420_02.000 RECOD: Duration of 'old age'/elderly/aging-related problems: Numb
er of units";
label variable ladura32 "
FHS.420_02.000: Duration of 'old age'/elderly/aging-related problems (in years)
";
label variable ladurb32 "
FHS.420_02.000: Duration of 'old age'/elderly/aging-related problems recode 2";
label variable lachrc32 "
FHS.420_02.000: 'Old age'/elderly/aging-related problems condition status";
label variable latime33 "
FHS.422_01.000 RECOD: Duration of fatigue/tiredness/weakness problem: Number of 
units";
label variable launit33 "
FHS.422_02.000 RECOD: Duration of fatigue/tiredness/weakness problem: Time unit
";
label variable ladura33 "
FHS.422_02.000: Duration of fatigue/tiredness/weakness problem (in years)";
label variable ladurb33 "
FHS.422_02.000: Duration of fatigue/tiredness/weakness problem recode 2";
label variable lachrc33 "
FHS.422_02.000: Fatigue/tiredness/weakness problem condition status";
label variable latime34 "
FHS.424_01.000 RECOD: Duration of pregnancy-related problem: Number of units";
label variable launit34 "
FHS.424_02.000 RECOD: Duration of pregnancy-related problem: Time unit";
label variable ladura34 "
FHS.424_02.000: Duration of pregnancy-related problem (in years)";
label variable ladurb34 "
FHS.424_02.000: Duration of pregnancy-related problem recode 2";
label variable lachrc34 "FHS.424_02.000: Pregnancy-related condition status";
label variable latime90 "
FHS.450_01.000: Duration of other impairment/problem N.E.C. (1): Number of units
";
label variable launit90 "
FHS.450_02.000: Duration of other impairment/problem N.E.C. (1): Time unit";
label variable ladura90 "
FHS.450_02.000: Duration of other impairment/problem N.E.C. (1) (in years)";
label variable ladurb90 "
FHS.450_02.000: Duration of other impairment/problem N.E.C. (1) recode 2";
label variable lachrc90 "
FHS.450_02.000: Other impairment/problem N.E.C. (1) condition status";
label variable latime91 "
FHS.452_01.000: Duration of other impairment/problem N.E.C. (2): Number of units
";
label variable launit91 "
FHS.452_02.000: Duration of other impairment/problem N.E.C. (2): Time unit";
label variable ladura91 "
FHS.452_02.000: Duration of other impairment/problem N.E.C. (2) (in years)";
label variable ladurb91 "
FHS.452_02.000: Duration of other impairment/problem N.E.C. (2) recode 2";
label variable lachrc91 "
FHS.452_02.000: Other impairment/problem N.E.C. (2) condition status";
label variable lcondrt  "
FHS.452_02.000: Chronic condition recode for person with limitation of activity
";
label variable lachronr "
FHS.452_02.000: Limitation of activity recode by chronic condition status";
label variable phstat   "FHS.500_00.000: Reported health status";

label variable pdmed12m "
FAU.020_00.000: Has medical care been delayed for - - (cost), 12m";
label variable pnmed12m "
FAU.040_00.000: Did - - need and NOT get medical care (cost), 12m";
label variable phospyr2 "
FAU.060_00.000: Has - - been in a hospital OVERNIGHT, 12m";
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
label variable mcadvr   "FHI.112_00.000: Medicare Advantage Plan";
label variable mcprem   "
FHI.113_00.000: Premium for Medicare Advantage/ Medicare HMO";
label variable mcref    "FHI.114_00.000: Need a referral for special care";
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
label variable whonam1  "FHI.200_01.000: Plan in whose name (Plan 1)";
label variable prpolh1  "
FHI.202_01.010: Relationship to outside policyholder (Plan 1)";
label variable prcooh1  "
FHI.204_01.010: Covered persons outside family roster (Plan 1)";
label variable prctoh1  "FHI.205_01.010: Number of persons (Plan 1)";
label variable prrloh11 "FHI.206_11.010: Child, including stepchild (Plan 1)";
label variable prrloh21 "FHI.206_12.010: Spouse (Plan 1)";
label variable prrloh31 "FHI.206_13.010: Former spouse (Plan 1)";
label variable prrloh41 "FHI.206_14.010: Some other relationship (Plan 1)";
label variable prcnum1  "
FHI.207_01.010: Number of children covered who live elsewhere (Plan 1)";
label variable cohu191  "FHI.207_01.010: Number of children age 0-18 (Plan 1)";
label variable coh19251 "FHI.207_01.010: Number of children age 19-25 (Plan 1)";
label variable coho251  "FHI.207_01.010: Number of children age 26+ (Plan 1)";
label variable plnwrkr1 "
FHI.210_01.000: How plan was originally obtained (Plan 1)";
label variable plnpay11 "FHI.220_11.000: Paid for by self or family (Plan 1)";
label variable plnpay21 "FHI.220_12.000: Paid for by employer or union (Plan 1)
";
label variable plnpay31 "
FHI.220_13.000: Paid for by someone outside the household (Plan 1)";
label variable plnpay41 "FHI.220_14.000: Paid for by Medicare (Plan 1)";
label variable plnpay51 "FHI.220_15.000: Paid for by Medicaid (Plan 1)";
label variable plnpay61 "FHI.220_16.000: Paid for by CHIP (Plan 1)";
label variable plnpay71 "FHI.220_17.000: Paid for by government program (Plan 1)
";
label variable hicostr1 "FHI.230_12.000: Out-of-pocket premium cost (Plan 1)";
label variable emppay1  "
FHI.235_01.010: Know how much employer or union pays (Plan 1)";
label variable ecostr1  "FHI.237_01.010: Employer premium cost (Plan 1)";
label variable empcstp1 "FHI.237_02.030: Percent employer or union pays (Plan 1)
";
label variable plnmgd1  "FHI.240_01.000: Type of private plan (Plan 1)";
label variable hdhp1    "FHI.241_01.000: High deductible health plan (Plan 1)";
label variable hsahra1  "
FHI.242_01.000: Health Savings Accounts/Health Reimbursement Accounts (Plan 1)";
label variable mgchmd1  "FHI.243_01.000: Doctor choice (Plan 1)";
label variable mgprmd1  "FHI.244_01.000: Preferred list (Plan 1)";
label variable mgpymd1  "FHI.246_01.000: Out of plan use (Plan 1)";
label variable mgpref1  "FHI.248_01.000: Private referral (Plan 1)";
label variable pcpreq1  "FHI.248_05.000: Primary care doctor required (Plan 1)";
label variable prrxcov1 "FHI.249_01.010: Prescription drug benefit (Plan 1)";
label variable prdncov1 "FHI.249_02.010: Dental Coverage (Plan 1)";
label variable whonam2  "FHI.200_02.000: Plan in whose name (Plan 2)";
label variable prpolh2  "
FHI.202_02.010: Relationship to outside policyholder (Plan 2)";
label variable prcooh2  "
FHI.204_02.010: Covered persons outside family roster (Plan 2)";
label variable prctoh2  "FHI.205_02.010: Number of persons (Plan 2)";
label variable prrloh12 "FHI.206_21.010: Child including stepchild (Plan 2)";
label variable prrloh22 "FHI.206_22.010: Spouse (Plan 2)";
label variable prrloh32 "FHI.206_23.010: Former spouse (Plan 2)";
label variable prrloh42 "FHI.206_24.010: Some other relationship (Plan 2)";
label variable prcnum2  "
FHI.207_02.010: Number of children covered who live elsewhere (Plan 2)";
label variable cohu192  "FHI.207_02.010: Number of children age 0-18 (Plan 2)";
label variable coh19252 "FHI.207_02.010: Number of children age 19-25 (Plan 2)";
label variable coho252  "FHI.207_02.010: Number of children age 26+ (Plan 2)";
label variable plnwrkr2 "
FHI.210_02.000: How plan was originally obtained (Plan 2)";
label variable plnpay12 "FHI.220_21.000: Paid for by self or family (Plan 2)";
label variable plnpay22 "FHI.220_22.000: Paid for by employer or union (Plan 2)
";
label variable plnpay32 "
FHI.220_23.000: Paid for by someone outside the household (Plan 2)";
label variable plnpay42 "FHI.220_24.000: Paid for by Medicare (Plan 2)";
label variable plnpay52 "FHI.220_25.000: Paid for by Medicaid (Plan 2)";
label variable plnpay62 "FHI.220_26.000: Paid for by CHIP (Plan 2)";
label variable plnpay72 "FHI.220_27.000: Paid for by government program (Plan 2)
";
label variable hicostr2 "FHI.230_22.000: Out-of-pocket premium cost (Plan 2)";
label variable emppay2  "
FHI.235_02.020: Know how much employer or union pays (Plan 2)";
label variable ecostr2  "FHI.237_11.010: Employer premium cost (Plan 2)";
label variable empcstp2 "FHI.237_12.030: Percent employer or union pays (Plan 2)
";
label variable plnmgd2  "FHI.240_02.000: Type of private plan (plan 2)";
label variable hdhp2    "FHI.241_02.000: High deductible health plan (Plan 2)";
label variable hsahra2  "
FHI.242_02.000: Health Savings Accounts/Health Reimbursement Accounts (Plan 2)";
label variable mgchmd2  "FHI.243_02.000: Doctor choice (Plan 2)";
label variable mgprmd2  "FHI.244_02.000: Preferred list (Plan 2)";
label variable mgpymd2  "FHI.246_02.000: Out of plan use (Plan 2)";
label variable mgpref2  "FHI.248_02.000: Private referral (Plan 2)";
label variable pcpreq2  "FHI.248_06.000: Primary care doctor required (Plan 2)";
label variable prrxcov2 "FHI.249_01.020: Prescription drug benefit (Plan 2)";
label variable prdncov2 "FHI.249_02.020: Dental Coverage (Plan 2)";
label variable prplplus "FHI.175_00.000: Person has more than two private plans
";
label variable fcovconf "FHI.249_03.000: Obtaining affordable coverage";
label variable schip    "FHI.070_00.000: SCHIP coverage recode";
label variable stdoc1   "
FHI.251_00.000: Any doc, chooses from a list, doc assigned (SCHIP)";
label variable stpcmd1  "
FHI.252_00.000: Primary care physician for routine care (SCHIP)";
label variable stref1   "
FHI.253_00.000: Need a referral for special care (SCHIP)";
label variable othpub   "FHI.070_00.000: State-sponsored health plan recode";
label variable stdoc2   "
FHI.258_00.000: Any doc, chooses from a list, doc assigned (OTHPUB)";
label variable stpcmd2  "
FHI.259_00.000: Primary care physician for routine care (OTHPUB)";
label variable stref2   "
FHI.260_00.000: Need a referral for special care (OTHPUB)";
label variable othgov   "FHI.070_00.000: Other government program recode";
label variable stdoc3   "
FHI.265_00.000: Any doc, chooses from a list, doc assigned (OTHGOV)";
label variable stpcmd3  "
FHI.266_00.000: Primary care physician for routine care (OTHGOV)";
label variable stref3   "
FHI.267_00.000: Need a referral for special care (OTHGOV)";
label variable milcare  "FHI.070_00.000: Military health care coverage recode";
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
label variable fhichng  "FHI.312_00.010: Change in coverage in past 12 months";
label variable fhikdba  "
FHI.315_01.010: Had private health insurance coverage in the past 12 months";
label variable fhikdbb  "
FHI.315_02.010: Had Medicare coverage in the past 12 months";
label variable fhikdbc  "
FHI.315_03.010: Had Medi-Gap coverage in the past 12 months";
label variable fhikdbd  "
FHI.315_04.010: Had Medicaid coverage in the past 12 months";
label variable fhikdbe  "
FHI.315_05.010: Had SCHIP coverage in the past 12 months";
label variable fhikdbf  "
FHI.315_06.010: Had Military health care coverage in the past 12 months";
label variable fhikdbg  "
FHI.315_07.010: Had Indian Health Service coverage in the past 12 months";
label variable fhikdbh  "
FHI.315_08.010: Had State-sponsored health plan coverage in the past 12 months";
label variable fhikdbi  "
FHI.315_09.010: Had Other government program coverage in the past 12 months";
label variable fhikdbj  "
FHI.315_10.010: Had Single service plan coverage in the past 12 months";
label variable fhikdbk  "FHI.315_11.010: Had No coverage in the past 12 months";
label variable pwrkbr1  "
FHI.316_00.010: Which one of these categories best describes how [fill 1: your/A
LIAS's] private health insurance was obtained?";
label variable hcspfyr  "FHI.320_00.000: Amount family spent for medical care";
label variable medbill  "FHI.325_00.010: Problems paying medical bills";
label variable medbpay  "FHI.327_00.010: Medical bills being paid off over time
";
label variable medbnop  "FHI.327_00.020: Unable to pay medical bills";
label variable fsa      "FHI.330_00.000: Flexible Spending Accounts";
label variable hikindna "FHI.070_01.000: Private health insurance";
label variable hikindnb "FHI.070_02.000: Medicare";
label variable hikindnc "FHI.070_03.000: Medi-Gap";
label variable hikindnd "FHI.070_04.000: Medicaid";
label variable hikindne "FHI.070_05.000: SCHIP";
label variable hikindnf "FHI.070_06.000: Military health care";
label variable hikindng "FHI.070_07.000: Indian Health Service";
label variable hikindnh "FHI.070_08.000: State-sponsored health plan";
label variable hikindni "FHI.070_09.000: Other government plan";
label variable hikindnj "FHI.070_10.000: Single service plan";
label variable hikindnk "FHI.070_11.000: No coverage of any type";
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
label variable armfver  "
FSD.020_00.000: Currently on full-time active duty with the Armed Forces";
label variable armfev   "
FSD.021_00.000: Has - - ever served in U.S. Armed Forces, Reserves, or National 
Guard?";
label variable armffc   "
FSD.022_00.000: Was - - active duty personnel who served on a humanitarian or pe
acekeeping mission?";
label variable armftm1  "
FSD.023_01.000: Was - - active duty in the U.S. Armed Forces in September, 2001 
or later?";
label variable armftm2  "
FSD.023_02.000: Was - - active duty in the U.S. Armed Forces in August, 1990 to 
August, 2001 (including Persian Gulf War)?";
label variable armftm3  "
FSD.023_03.000: Was - - active duty in the U.S. Armed Forces in September, 1980 
to July, 1990?";
label variable armftm4  "
FSD.023_04.000: Was - - active duty in the U.S. Armed Forces in May, 1975 to Aug
ust, 1980?";
label variable armftm5  "
FSD.023_05.000: Was - - active duty in the U.S. Armed Forces during the Vietnam 
era (August, 1964 to April, 1975)?";
label variable armftm6  "
FSD.023_06.000: Was - - active duty in the U.S. Armed Forces in March, 1961 to J
uly, 1964?";
label variable armftm7  "
FSD.023_07.000: Was - - active duty in the U.S. Armed Forces in February, 1955 t
o February, 1961?";
label variable armftm8  "
FSD.023_08.000: Was - - active duty in the U.S. Armed Forces during the Korean W
ar (July, 1950 to January, 1955)?";
label variable armftm9  "
FSD.023_09.000: Was - - active duty in the U.S. Armed Forces in January, 1947 to
 June 1950?";
label variable armft10p "
FSD.023_10.000: Was - - active duty in the U.S. Armed Forces in December, 1946 o
r earlier?";
label variable armfds   "
FSD.024_00.000: Was - - active duty in the Persian Gulf during Desert Shield and
/or Desert Storm between Aug., 1990 to Apr., 1991?";
label variable doinglwp "FSD.050_00.000: What was - - doing last week";
label variable whynowkp "FSD.060_00.000: Main reason for not working last week";
label variable wrkhrs2  "FSD.070_00.000: Hours worked last week";
label variable wrkftall "FSD.080_00.000: Usually work full time";
label variable wrklyr1  "FSD.100_00.000: Work for pay last year";
label variable wrkmyr   "FSD.110_00.000: Months worked last year";
label variable ernyr_p  "FSD.120_00.000: Total earnings last year";
label variable ernyrflg "
FSD.120_00.000: Flag indicating difference in how earnings data were collected";
label variable hiempof  "FSD.130_00.000: Health insurance offered at workplace";

label variable fincint  "
FIN.010_00.000: Introduction to the family income section";
label variable psal     "
FIN.040_00.000: Received income from wages or salary (last CY)";
label variable pseinc   "
FIN.060_00.000: Received income from self-employment (last CY)";
label variable pssrr    "
FIN.080_00.000: Received income from Social Security or Railroad Retirement (las
t CY)";
label variable pssrrdb  "
FIN.084_00.000: Received Social Security or Railroad Retirement income as a disa
bility benefit";
label variable pssrrd   "FIN.086_00.000: Received benefit due to disability";
label variable ppens    "
FIN.100_00.000: Received income from other disability pensions";
label variable popens   "FIN.104_00.000: Received income from any other pension
";
label variable pssi     "FIN.120_00.000: Received income from SSI";
label variable pssid    "FIN.122_00.000: Received SSI due to disability";
label variable ptanf    "
FIN.160_00.000: Received income from a state or county welfare program (e.g., TA
NF)";
label variable powben   "FIN.166_00.000: Received other government assistance";
label variable pintrstr "FIN.180_00.000: Received interest income";
label variable pdivd    "
FIN.200_00.000: Received dividends from stocks, funds, etc.";
label variable pchldsp  "FIN.220_00.000: Received income from child support";
label variable pincot   "FIN.240_00.000: Received income from any other source";
label variable pssapl   "
FIN.310_00.000: Ever applied for Supplemental Security Income (SSI)";
label variable psdapl   "
FIN.340_00.000: Ever applied for Social Security Disability Insurance (SSDI)";
label variable tanfmyr  "FIN.350_00.000: Months received welfare/TANF (last CY)
";
label variable eligpwic "
FIN.384_00.000: Anyone age-eligible for the WIC program?";
label variable pwic     "FIN.385_00.000: Received WIC benefits";
label variable wic_flag "FIN.385_00.000: WIC recipient age-eligible";

* DEFINE VALUE LABELS FOR REPORTS;

label define pep001x
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
label define pep004x
   1        "1 Quarter 1"
   2        "2 Quarter 2"
   3        "3 Quarter 3"
   4        "4 Quarter 4"
;
label define pep005x
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
   01       "01 Less than/equal to 8th grade"
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
label define pep051x
   1        "1 No sample adult record due to quality reasons"
;
label define pep052x
   1        "1 No sample child record due to quality reasons"
;
label define pep053x
   1        "
1 Families selected to receive ADB (sample adults) and CDB (sample children 1-17
 years) sections"
   2        "
2 Families selected to receive FDB (all persons 1 year and older) and AFD (sampl
e adults) sections"
;
label define pep067x
   0        "0 Unable to work"
   1        "1 Limited in work"
   2        "2 Not limited in work"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep070x
   0        "0 Limitation previously mentioned"
   1        "1 Yes, limited in some other way"
   2        "2 Not limited in any way"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep071x
   1        "1 Limited in any way"
   2        "2 Not limited in any way"
   3        "3 Unknown if limited"
;
label define pep072x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep087x
   95       "95 95+"
   96       "96 Since birth"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep088x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   6        "6 Since birth"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep089x
   00       "00 Less than 1 year"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep090x
   0        "0 Since birth and child <1 year of age"
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep091x
   1        "1 Chronic"
   2        "2 Not chronic"
   9        "9 Unknown if chronic"
;
label define pep200x
   00       "00 Less than 1 year"
   85       "85 85+ years"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep201x
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep378x
   1        "1 At least one condition causing limitation of activity is chronic"
   2        "2 No condition causing limitation of activity is chronic"
   9        "
9 Unknown if any condition causing limitation of activity is chronic"
;
label define pep379x
   0        "0 Not limited in any way (including unknown if limited)"
   1        "1 Limited; caused by at least one chronic condition"
   2        "2 Limited; not caused by chronic condition"
   3        "3 Limited; unknown if condition is chronic"
;
label define pep380x
   1        "1 Excellent"
   2        "2 Very good"
   3        "3 Good"
   4        "4 Fair"
   5        "5 Poor"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep384x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define pep387x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep393x
   1        "1 Not covered"
   2        "2 Covered"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep394x
   1        "1 Yes, information"
   2        "2 Yes, but no information"
   3        "3 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep395x
   1        "1 Part A - Hospital only"
   2        "2 Part B - Medical only"
   3        "3 Both Part A and Part B"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep398x
   1        "1 Medicare Advantage"
   2        "2 Private plan not Medicare Advantage"
   7        "7 Refused"
   8        "8 Not Ascertained"
   9        "9 Don't Know"
;
label define pep403x
   1        "1 Any doctor"
   2        "2 Select from book/list"
   3        "3 Doctor is assigned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep406x
   1        "1 Yes, with information"
   2        "2 Yes, but no information"
   3        "3 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep420x
   1        "1 In own name"
   2        "2 Someone else in family"
   3        "3 Person not in household"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep421x
   1        "1 Child (including stepchildren)"
   2        "2 Spouse"
   3        "3 Former spouse"
   4        "4 Some other relationship"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep428x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don’t know"
;
label define pep432x
   01       "01 Through employer"
   02       "02 Through union"
   03       "03 Through workplace, but don't know if employer or union"
   04       "04 Through workplace, self-employed or professional association"
   05       "05 Purchased directly"
   06       "06 Through a state/local government or community program"
   07       "07 Other"
   08       "08 Through school"
   09       "09 Through parents"
   10       "10 Through relative other than parents"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep440x
   20000    "20000 $20,000 or more"
   99997    "99997 Refused"
   99998    "99998 Not ascertained"
   99999    "99999 Don't know"
;
label define pep441x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define pep442x
   40000    "40000 $40,000 or more"
   99997    "99997 Refused"
   99998    "99998 Not ascertained"
   99999    "99999 Don't know"
;
label define pep443x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don’t know"
;
label define pep444x
   1        "1 HMO/IPA"
   2        "2 PPO"
   3        "3 POS"
   4        "4 Fee-for-service/indemnity"
   5        "5 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep445x
   1        "1 Less than [$1,200/$2,400]"
   2        "2 [$1,200/$2,400] or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep447x
   1        "1 Any doctor"
   2        "2 Select from group/list"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep489x
   1        "1 Very confident"
   2        "2 Somewhat confident"
   3        "3 Not too confident"
   4        "4 Not confident at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define pep507x
   1        "1 TRICARE Prime"
   2        "2 TRICARE Extra"
   3        "3 TRICARE Standard"
   4        "4 TRICARE for life"
   5        "5 TRICARE other (specify)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep509x
   1        "1 6 months or less"
   2        "2 More than 6 months, but not more than 1 year ago"
   3        "3 More than 1 year, but not more than 3 years ago"
   4        "4 More than 3 years"
   5        "5 Never"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep540x
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
label define pep560x
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
label define pep561x
   1        "1 USA: born in one of the 50 United States or D.C."
   2        "2 USA: born in a U.S. territory"
   3        "3 Not born in the U.S. or a U.S. territory"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep562x
   1        "1 Less than 1 year"
   2        "2 1 yr., less than 5 yrs."
   3        "3 5 yrs., less than 10 yrs."
   4        "4 10 yrs., less than 15 yrs."
   5        "5 15 years or more"
   9        "9 Unknown"
;
label define pep563x
   1        "1 Yes, citizen of the United States"
   2        "2 No, not a citizen of the United States"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep566x
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
label define pep581x
   1        "1 Working for pay at a job or business"
   2        "2 With a job or business but not at work"
   3        "3 Looking for work"
   4        "4 Working, but not for pay, at a family-owned job or business"
   5        "5 Not working at a job or business and not looking for work"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define pep582x
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
label define pep583x
   95       "95 95+ hours"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep586x
   01       "01 1 month or less"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define pep587x
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
label define pep588x
   1        "1 Earnings data collected differently"
;
label define pep590x
   1        "1 Enter 1 to continue"
   8        "8 Not ascertained"
;
label define pep609x
   0        "0 No WIC age-eligible family members"
   1        "1 At least 1 WIC age-eligible family member"
;
label define pep611x
   0        "0 Person not age-eligible"
   1        "1 Person age-eligible"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   pep001x;   label values intv_qrt  pep004x;
label values intv_mon  pep005x;

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
label values qcadult   pep051x;   label values qcchild   pep052x;

label values fdrn_flg  pep053x;

label values plaplylm  pep037x;   label values plaplyun  pep037x;
label values pspedeis  pep037x;   label values pspedem   pep037x;
label values plaadl    pep037x;   label values labath    pep037x;
label values ladress   pep037x;   label values laeat     pep037x;
label values labed     pep037x;   label values latoilt   pep037x;
label values lahome    pep037x;   label values plaiadl   pep037x;
label values plawknow  pep037x;   label values plawklim  pep067x;
label values plawalk   pep037x;   label values plaremem  pep037x;
label values plimany   pep070x;   label values la1ar     pep071x;
label values lahcc1    pep072x;   label values lahcc2    pep072x;
label values lahcc3    pep072x;   label values lahcc4    pep072x;
label values lahcc5    pep072x;   label values lahcc6    pep072x;
label values lahcc7a   pep072x;   label values lahcc8    pep072x;
label values lahcc9    pep072x;   label values lahcc10   pep072x;
label values lahcc11   pep072x;   label values lahcc12   pep072x;
label values lahcc13   pep072x;   label values lahcc90   pep072x;
label values lahcc91   pep072x;   label values lctime1   pep087x;
label values lcunit1   pep088x;   label values lcdura1   pep089x;
label values lcdurb1   pep090x;   label values lcchrc1   pep091x;
label values lctime2   pep087x;   label values lcunit2   pep088x;
label values lcdura2   pep089x;   label values lcdurb2   pep090x;
label values lcchrc2   pep091x;   label values lctime3   pep087x;
label values lcunit3   pep088x;   label values lcdura3   pep089x;
label values lcdurb3   pep090x;   label values lcchrc3   pep091x;
label values lctime4   pep087x;   label values lcunit4   pep088x;
label values lcdura4   pep089x;   label values lcdurb4   pep090x;
label values lcchrc4   pep091x;   label values lctime5   pep087x;
label values lcunit5   pep088x;   label values lcdura5   pep089x;
label values lcdurb5   pep090x;   label values lcchrc5   pep091x;
label values lctime6   pep087x;   label values lcunit6   pep088x;
label values lcdura6   pep089x;   label values lcdurb6   pep090x;
label values lcchrc6   pep091x;   label values lctime7a  pep087x;
label values lcunit7a  pep088x;   label values lcdura7a  pep089x;
label values lcdurb7a  pep090x;   label values lcchrc7a  pep091x;
label values lctime8   pep087x;   label values lcunit8   pep088x;
label values lcdura8   pep089x;   label values lcdurb8   pep090x;
label values lcchrc8   pep091x;   label values lctime9   pep087x;
label values lcunit9   pep088x;   label values lcdura9   pep089x;
label values lcdurb9   pep090x;   label values lcchrc9   pep091x;
label values lctime10  pep087x;   label values lcunit10  pep088x;
label values lcdura10  pep089x;   label values lcdurb10  pep090x;
label values lcchrc10  pep091x;   label values lctime11  pep087x;
label values lcunit11  pep088x;   label values lcdura11  pep089x;
label values lcdurb11  pep090x;   label values lcchrc11  pep091x;
label values lctime12  pep087x;   label values lcunit12  pep088x;
label values lcdura12  pep089x;   label values lcdurb12  pep090x;
label values lcchrc12  pep091x;   label values lctime13  pep087x;
label values lcunit13  pep088x;   label values lcdura13  pep089x;
label values lcdurb13  pep090x;   label values lcchrc13  pep091x;
label values lctime90  pep087x;   label values lcunit90  pep088x;
label values lcdura90  pep089x;   label values lcdurb90  pep090x;
label values lcchrc90  pep091x;   label values lctime91  pep087x;
label values lcunit91  pep088x;   label values lcdura91  pep089x;
label values lcdurb91  pep090x;   label values lcchrc91  pep091x;
label values lahca1    pep072x;   label values lahca2    pep072x;
label values lahca3    pep072x;   label values lahca4    pep072x;
label values lahca5    pep072x;   label values lahca6    pep072x;
label values lahca7    pep072x;   label values lahca8    pep072x;
label values lahca9    pep072x;   label values lahca10   pep072x;
label values lahca11   pep072x;   label values lahca12   pep072x;
label values lahca13   pep072x;   label values lahca14a  pep072x;
label values lahca15   pep072x;   label values lahca16   pep072x;
label values lahca17   pep072x;   label values lahca18   pep072x;
label values lahca19_  pep072x;   label values lahca20_  pep072x;
label values lahca21_  pep072x;   label values lahca22_  pep072x;
label values lahca23_  pep072x;   label values lahca24_  pep072x;
label values lahca25_  pep072x;   label values lahca26_  pep072x;
label values lahca27_  pep072x;   label values lahca28_  pep072x;
label values lahca29_  pep072x;   label values lahca30_  pep072x;
label values lahca31_  pep072x;   label values lahca32_  pep072x;
label values lahca33_  pep072x;   label values lahca34_  pep072x;
label values lahca90   pep072x;   label values lahca91   pep072x;
label values latime1   pep087x;   label values launit1   pep088x;
label values ladura1   pep200x;   label values ladurb1   pep201x;
label values lachrc1   pep091x;   label values latime2   pep087x;
label values launit2   pep088x;   label values ladura2   pep200x;
label values ladurb2   pep201x;   label values lachrc2   pep091x;
label values latime3   pep087x;   label values launit3   pep088x;
label values ladura3   pep200x;   label values ladurb3   pep201x;
label values lachrc3   pep091x;   label values latime4   pep087x;
label values launit4   pep088x;   label values ladura4   pep200x;
label values ladurb4   pep201x;   label values lachrc4   pep091x;
label values latime5   pep087x;   label values launit5   pep088x;
label values ladura5   pep200x;   label values ladurb5   pep201x;
label values lachrc5   pep091x;   label values latime6   pep087x;
label values launit6   pep088x;   label values ladura6   pep200x;
label values ladurb6   pep201x;   label values lachrc6   pep091x;
label values latime7   pep087x;   label values launit7   pep088x;
label values ladura7   pep200x;   label values ladurb7   pep201x;
label values lachrc7   pep091x;   label values latime8   pep087x;
label values launit8   pep088x;   label values ladura8   pep200x;
label values ladurb8   pep201x;   label values lachrc8   pep091x;
label values latime9   pep087x;   label values launit9   pep088x;
label values ladura9   pep200x;   label values ladurb9   pep201x;
label values lachrc9   pep091x;   label values latime10  pep087x;
label values launit10  pep088x;   label values ladura10  pep200x;
label values ladurb10  pep201x;   label values lachrc10  pep091x;
label values latime11  pep087x;   label values launit11  pep088x;
label values ladura11  pep200x;   label values ladurb11  pep201x;
label values lachrc11  pep091x;   label values latime12  pep087x;
label values launit12  pep088x;   label values ladura12  pep200x;
label values ladurb12  pep201x;   label values lachrc12  pep091x;
label values latime13  pep087x;   label values launit13  pep088x;
label values ladura13  pep200x;   label values ladurb13  pep201x;
label values lachrc13  pep091x;   label values ltime14a  pep087x;
label values lunit14a  pep088x;   label values ldura14a  pep200x;
label values ldurb14a  pep201x;   label values lchrc14a  pep091x;
label values latime15  pep087x;   label values launit15  pep088x;
label values ladura15  pep200x;   label values ladurb15  pep201x;
label values lachrc15  pep091x;   label values latime16  pep087x;
label values launit16  pep088x;   label values ladura16  pep200x;
label values ladurb16  pep201x;   label values lachrc16  pep091x;
label values latime17  pep087x;   label values launit17  pep088x;
label values ladura17  pep200x;   label values ladurb17  pep201x;
label values lachrc17  pep091x;   label values latime18  pep087x;
label values launit18  pep088x;   label values ladura18  pep200x;
label values ladurb18  pep201x;   label values lachrc18  pep091x;
label values latime19  pep087x;   label values launit19  pep088x;
label values ladura19  pep200x;   label values ladurb19  pep201x;
label values lachrc19  pep091x;   label values latime20  pep087x;
label values launit20  pep088x;   label values ladura20  pep200x;
label values ladurb20  pep201x;   label values lachrc20  pep091x;
label values latime21  pep087x;   label values launit21  pep088x;
label values ladura21  pep200x;   label values ladurb21  pep201x;
label values lachrc21  pep091x;   label values latime22  pep087x;
label values launit22  pep088x;   label values ladura22  pep200x;
label values ladurb22  pep201x;   label values lachrc22  pep091x;
label values latime23  pep087x;   label values launit23  pep088x;
label values ladura23  pep200x;   label values ladurb23  pep201x;
label values lachrc23  pep091x;   label values latime24  pep087x;
label values launit24  pep088x;   label values ladura24  pep200x;
label values ladurb24  pep201x;   label values lachrc24  pep091x;
label values latime25  pep087x;   label values launit25  pep088x;
label values ladura25  pep200x;   label values ladurb25  pep201x;
label values lachrc25  pep091x;   label values latime26  pep087x;
label values launit26  pep088x;   label values ladura26  pep200x;
label values ladurb26  pep201x;   label values lachrc26  pep091x;
label values latime27  pep087x;   label values launit27  pep088x;
label values ladura27  pep200x;   label values ladurb27  pep201x;
label values lachrc27  pep091x;   label values latime28  pep087x;
label values launit28  pep088x;   label values ladura28  pep200x;
label values ladurb28  pep201x;   label values lachrc28  pep091x;
label values latime29  pep087x;   label values launit29  pep088x;
label values ladura29  pep200x;   label values ladurb29  pep201x;
label values lachrc29  pep091x;   label values latime30  pep087x;
label values launit30  pep088x;   label values ladura30  pep200x;
label values ladurb30  pep201x;   label values lachrc30  pep091x;
label values latime31  pep087x;   label values launit31  pep088x;
label values ladura31  pep200x;   label values ladurb31  pep201x;
label values lachrc31  pep091x;   label values latime32  pep087x;
label values launit32  pep088x;   label values ladura32  pep200x;
label values ladurb32  pep201x;   label values lachrc32  pep091x;
label values latime33  pep087x;   label values launit33  pep088x;
label values ladura33  pep200x;   label values ladurb33  pep201x;
label values lachrc33  pep091x;   label values latime34  pep087x;
label values launit34  pep088x;   label values ladura34  pep200x;
label values ladurb34  pep201x;   label values lachrc34  pep091x;
label values latime90  pep087x;   label values launit90  pep088x;
label values ladura90  pep200x;   label values ladurb90  pep201x;
label values lachrc90  pep091x;   label values latime91  pep087x;
label values launit91  pep088x;   label values ladura91  pep200x;
label values ladurb91  pep201x;   label values lachrc91  pep091x;
label values lcondrt   pep378x;   label values lachronr  pep379x;
label values phstat    pep380x;

label values pdmed12m  pep037x;   label values pnmed12m  pep037x;
label values phospyr2  pep037x;   label values hospno    pep384x;
label values hpnite    pep384x;   label values phchm2w   pep037x;
label values phchmn2w  pep387x;   label values phcph2wr  pep037x;
label values phcphn2w  pep387x;   label values phcdv2w   pep037x;
label values phcdvn2w  pep387x;   label values p10dvyr   pep037x;

label values notcov    pep393x;   label values medicare  pep394x;
label values mcpart    pep395x;   label values mcchoice  pep037x;
label values mchmo     pep037x;   label values mcadvr    pep398x;
label values mcprem    pep037x;   label values mcref     pep037x;
label values mcpartd   pep037x;   label values medicaid  pep394x;
label values machmd    pep403x;   label values mapcmd    pep037x;
label values maref     pep037x;   label values single    pep406x;
label values sstypea   pep072x;   label values sstypeb   pep072x;
label values sstypec   pep072x;   label values sstyped   pep072x;
label values sstypee   pep072x;   label values sstypef   pep072x;
label values sstypeg   pep072x;   label values sstypeh   pep072x;
label values sstypei   pep072x;   label values sstypej   pep072x;
label values sstypek   pep072x;   label values sstypel   pep072x;
label values private   pep394x;   label values whonam1   pep420x;
label values prpolh1   pep421x;   label values prcooh1   pep037x;
label values prctoh1   pep387x;   label values prrloh11  pep072x;
label values prrloh21  pep072x;   label values prrloh31  pep072x;
label values prrloh41  pep072x;   label values prcnum1   pep428x;
label values cohu191   pep387x;   label values coh19251  pep387x;
label values coho251   pep387x;   label values plnwrkr1  pep432x;
label values plnpay11  pep072x;   label values plnpay21  pep072x;
label values plnpay31  pep072x;   label values plnpay41  pep072x;
label values plnpay51  pep072x;   label values plnpay61  pep072x;
label values plnpay71  pep072x;   label values hicostr1  pep440x;
label values emppay1   pep441x;   label values ecostr1   pep442x;
label values empcstp1  pep443x;   label values plnmgd1   pep444x;
label values hdhp1     pep445x;   label values hsahra1   pep037x;
label values mgchmd1   pep447x;   label values mgprmd1   pep037x;
label values mgpymd1   pep037x;   label values mgpref1   pep037x;
label values pcpreq1   pep037x;   label values prrxcov1  pep037x;
label values prdncov1  pep037x;   label values whonam2   pep420x;
label values prpolh2   pep421x;   label values prcooh2   pep037x;
label values prctoh2   pep387x;   label values prrloh12  pep072x;
label values prrloh22  pep072x;   label values prrloh32  pep072x;
label values prrloh42  pep072x;   label values prcnum2   pep428x;
label values cohu192   pep387x;   label values coh19252  pep387x;
label values coho252   pep387x;   label values plnwrkr2  pep432x;
label values plnpay12  pep072x;   label values plnpay22  pep072x;
label values plnpay32  pep072x;   label values plnpay42  pep072x;
label values plnpay52  pep072x;   label values plnpay62  pep072x;
label values plnpay72  pep072x;   label values hicostr2  pep440x;
label values emppay2   pep441x;   label values ecostr2   pep442x;
label values empcstp2  pep443x;   label values plnmgd2   pep444x;
label values hdhp2     pep445x;   label values hsahra2   pep037x;
label values mgchmd2   pep447x;   label values mgprmd2   pep037x;
label values mgpymd2   pep037x;   label values mgpref2   pep037x;
label values pcpreq2   pep037x;   label values prrxcov2  pep037x;
label values prdncov2  pep037x;   label values prplplus  pep037x;
label values fcovconf  pep489x;   label values schip     pep394x;
label values stdoc1    pep403x;   label values stpcmd1   pep037x;
label values stref1    pep037x;   label values othpub    pep394x;
label values stdoc2    pep403x;   label values stpcmd2   pep037x;
label values stref2    pep037x;   label values othgov    pep394x;
label values stdoc3    pep403x;   label values stpcmd3   pep037x;
label values stref3    pep037x;   label values milcare   pep394x;
label values milspc1   pep072x;   label values milspc2   pep072x;
label values milspc3   pep072x;   label values milspc4   pep072x;
label values milman    pep507x;   label values ihs       pep037x;
label values hilast    pep509x;   label values histop1   pep072x;
label values histop2   pep072x;   label values histop3   pep072x;
label values histop4   pep072x;   label values histop5   pep072x;
label values histop6   pep072x;   label values histop7   pep072x;
label values histop8   pep072x;   label values histop9   pep072x;
label values histop10  pep072x;   label values histop11  pep072x;
label values histop12  pep072x;   label values histop13  pep072x;
label values histop14  pep072x;   label values histop15  pep072x;
label values hinotyr   pep037x;   label values hinotmyr  pep387x;
label values fhichng   pep037x;   label values fhikdba   pep072x;
label values fhikdbb   pep072x;   label values fhikdbc   pep072x;
label values fhikdbd   pep072x;   label values fhikdbe   pep072x;
label values fhikdbf   pep072x;   label values fhikdbg   pep072x;
label values fhikdbh   pep072x;   label values fhikdbi   pep072x;
label values fhikdbj   pep072x;   label values fhikdbk   pep072x;
label values pwrkbr1   pep432x;   label values hcspfyr   pep540x;
label values medbill   pep037x;   label values medbpay   pep037x;
label values medbnop   pep037x;   label values fsa       pep037x;
label values hikindna  pep072x;   label values hikindnb  pep072x;
label values hikindnc  pep072x;   label values hikindnd  pep072x;
label values hikindne  pep072x;   label values hikindnf  pep072x;
label values hikindng  pep072x;   label values hikindnh  pep072x;
label values hikindni  pep072x;   label values hikindnj  pep072x;
label values hikindnk  pep072x;   label values mcareprb  pep037x;
label values mcaidprb  pep037x;   label values sincov    pep037x;

label values plborn    pep037x;   label values regionbr  pep560x;
label values geobrth   pep561x;   label values yrsinus   pep562x;
label values citizenp  pep563x;   label values headst    pep037x;
label values headstv1  pep037x;   label values educ1     pep566x;
label values armfver   pep037x;   label values armfev    pep037x;
label values armffc    pep037x;   label values armftm1   pep072x;
label values armftm2   pep072x;   label values armftm3   pep072x;
label values armftm4   pep072x;   label values armftm5   pep072x;
label values armftm6   pep072x;   label values armftm7   pep072x;
label values armftm8   pep072x;   label values armftm9   pep072x;
label values armft10p  pep072x;   label values armfds    pep037x;
label values doinglwp  pep581x;   label values whynowkp  pep582x;
label values wrkhrs2   pep583x;   label values wrkftall  pep037x;
label values wrklyr1   pep037x;   label values wrkmyr    pep586x;
label values ernyr_p   pep587x;   label values ernyrflg  pep588x;
label values hiempof   pep037x;

label values fincint   pep590x;   label values psal      pep037x;
label values pseinc    pep037x;   label values pssrr     pep037x;
label values pssrrdb   pep037x;   label values pssrrd    pep037x;
label values ppens     pep037x;   label values popens    pep037x;
label values pssi      pep037x;   label values pssid     pep037x;
label values ptanf     pep037x;   label values powben    pep037x;
label values pintrstr  pep037x;   label values pdivd     pep037x;
label values pchldsp   pep037x;   label values pincot    pep037x;
label values pssapl    pep037x;   label values psdapl    pep037x;
label values tanfmyr   pep387x;   label values eligpwic  pep609x;
label values pwic      pep037x;   label values wic_flag  pep611x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa];
save "$OUT/personsx", replace;

#delimit cr

* data file is stored in personsx.dta
* log  file is stored in personsx.log

log close
