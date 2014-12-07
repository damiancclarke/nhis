global LOG "~/database/NHIS/Log"
global DAT "~/database/NHIS/Data/raw/2013"
global OUT "~/database/NHIS/Data/dta/2013"

log using "$LOG/personsx.log", text replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
  JUNE 5, 2014  3:09 PM

  THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
  FILE FROM THE 2013 NHIS Public Use Person ASCII FILE

  NOTES:

  EXECUTING THIS PROGRAM WILL REPLACE personsx.dta AND personsx.log
  IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

  THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
  DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
  WITHIN STATA IS THE FOLLOWING COMMAND: cd c:\nhis2013\

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
  sib_degp     79 -  79  str fmother1     80 -  81
  mom_degp     82 -  82  str ffather1     83 -  84
  dad_degp     85 -  85      parents      86 -  86
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
  plnpay71    596 - 596      plnpre1     597 - 597
  hicostr1    598 - 602      emppay1     603 - 603
  ecostr1     604 - 608      empcstp1    609 - 611
  plnmgd1     612 - 612      hdhp1       613 - 613
  hsahra1     614 - 614      mgchmd1     615 - 615
  mgprmd1     616 - 616      mgpymd1     617 - 617
  mgpref1     618 - 618      pcpreq1     619 - 619
  prrxcov1    620 - 620      prdncov1    621 - 621
  whonam2     622 - 622      prpolh2     623 - 623
  prcooh2     624 - 624      prctoh2     625 - 626
  prrloh12    627 - 627      prrloh22    628 - 628
  prrloh32    629 - 629      prrloh42    630 - 630
  prcnum2     631 - 632      cohu192     633 - 634
  coh19252    635 - 636      coho252     637 - 638
  plnwrkr2    639 - 640      plnpay12    641 - 641
  plnpay22    642 - 642      plnpay32    643 - 643
  plnpay42    644 - 644      plnpay52    645 - 645
  plnpay62    646 - 646      plnpay72    647 - 647
  plnpre2     648 - 648      hicostr2    649 - 653
  emppay2     654 - 654      ecostr2     655 - 659
  empcstp2    660 - 662      plnmgd2     663 - 663
  hdhp2       664 - 664      hsahra2     665 - 665
  mgchmd2     666 - 666      mgprmd2     667 - 667
  mgpymd2     668 - 668      mgpref2     669 - 669
  pcpreq2     670 - 670      prrxcov2    671 - 671
  prdncov2    672 - 672      prplplus    673 - 673
  fcovconf    674 - 674      schip       675 - 675
  stdoc1      676 - 676      stpcmd1     677 - 677
  stref1      678 - 678      othpub      679 - 679
  stdoc2      680 - 680      stpcmd2     681 - 681
  stref2      682 - 682      othgov      683 - 683
  stdoc3      684 - 684      stpcmd3     685 - 685
  stref3      686 - 686      milcare     687 - 687
  milspc1     688 - 688      milspc2     689 - 689
  milspc3     690 - 690      milspc4     691 - 691
  milman      692 - 692      ihs         693 - 693
  hilast      694 - 694      histop1     695 - 695
  histop2     696 - 696      histop3     697 - 697
  histop4     698 - 698      histop5     699 - 699
  histop6     700 - 700      histop7     701 - 701
  histop8     702 - 702      histop9     703 - 703
  histop10    704 - 704      histop11    705 - 705
  histop12    706 - 706      histop13    707 - 707
  histop14    708 - 708      histop15    709 - 709
  hinotyr     710 - 710      hinotmyr    711 - 712
  fhichng     713 - 713      fhikdba     714 - 714
  fhikdbb     715 - 715      fhikdbc     716 - 716
  fhikdbd     717 - 717      fhikdbe     718 - 718
  fhikdbf     719 - 719      fhikdbg     720 - 720
  fhikdbh     721 - 721      fhikdbi     722 - 722
  fhikdbj     723 - 723      fhikdbk     724 - 724
  pwrkbr1     725 - 726      hcspfyr     727 - 727
  medbill     728 - 728      medbpay     729 - 729
  medbnop     730 - 730      fsa         731 - 731
  hikindna    732 - 732      hikindnb    733 - 733
  hikindnc    734 - 734      hikindnd    735 - 735
  hikindne    736 - 736      hikindnf    737 - 737
  hikindng    738 - 738      hikindnh    739 - 739
  hikindni    740 - 740      hikindnj    741 - 741
  hikindnk    742 - 742      mcareprb    743 - 743
  mcaidprb    744 - 744      sincov      745 - 745

  plborn      746 - 746      regionbr    747 - 748
  geobrth     749 - 749      yrsinus     750 - 750
  citizenp    751 - 751      headst      752 - 752
  headstv1    753 - 753      educ1       754 - 755
  armfver     756 - 756      armfev      757 - 757
  armffc      758 - 758      armftmr1    759 - 759
  armftm2p    760 - 760      armftmr3    761 - 761
  armftmr4    762 - 762      armftmr5    763 - 763
  armftm6p    764 - 764      armftm7p    765 - 765
  armfds2p    766 - 766      doinglwp    767 - 767
  whynowkp    768 - 769      wrkhrs2     770 - 771
  wrkftall    772 - 772      wrklyr1     773 - 773
  wrkmyr      774 - 775      ernyr_p     776 - 777
  hiempof     778 - 778

  fincint     779 - 779      psal        780 - 780
  pseinc      781 - 781      pssrr       782 - 782
  pssrrdb     783 - 783      pssrrd      784 - 784
  ppens       785 - 785      popens      786 - 786
  pssi        787 - 787      pssid       788 - 788
  ptanf       789 - 789      powben      790 - 790
  pintrstr    791 - 791      pdivd       792 - 792
  pchldsp     793 - 793      pincot      794 - 794
  pssapl      795 - 795      psdapl      796 - 796
  tanfmyr     797 - 798      eligpwic    799 - 799
  pwic        800 - 800      wic_flag    801 - 801

  englang     802 - 802

  using "$DAT/PERSONSX.dat";
replace wtia = wtia/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "File type identifier";
label variable srvy_yr  "Year of National Health Interview Survey";
label variable hhx      "Household Number";
label variable intv_qrt "Interview Quarter";
label variable intv_mon "Interview Month";
label variable fmx      "Family Number";
label variable fpx      "Person Number (Within family)";
label variable wtia     "Weight - Interim Annual";
label variable wtfa     "Weight - Final Annual";

label variable region   "Region";
label variable strat_p  "Pseudo-stratum for public-use file variance estimation
  ";
label variable psu_p    "Pseudo-PSU for public-use file variance estimation";

label variable sex      "Sex";
label variable origin_i "Hispanic Ethnicity";
label variable origimpt "Hispanic Origin Imputation Flag";
label variable hispan_i "Hispanic subgroup detail";
label variable hispimpt "Type of Hispanic Origin Imputation Flag";
label variable racerpi2 "OMB groups w/multiple race";
label variable raceimp2 "Race Imputation Flag";
label variable mracrpi2 "Race coded to single/multiple race group";
label variable mracbpi2 "Race coded to single/multiple race group";
label variable racreci3 "Race Recode";
label variable hiscodi3 "Race/ethnicity recode";
label variable erimpflg "Ethnicity/Race Imputation Flag";
label variable nowaf    "Armed Forces Status";
label variable rrp      "Relationship to the HH reference person";
label variable hhreflg  "HH Reference Person Flag";
label variable frrp     "Relationship to family ref. Person";
label variable dob_m    "Month of Birth";
label variable dob_y_p  "Year of Birth";
label variable age_p    "Age";
label variable age_chg  "Indication of AGE correction due to data entry error";
label variable fmrpflg  "Family Respondent Flag";
label variable fmreflg  "Family Reference Person Flag";
label variable r_maritl "Marital Status";
label variable fspous2  "Person # of spouse";
label variable cohab1   "Cohabiting person ever married";
label variable cohab2   "Cohabiting person's current marital status";
label variable fcohab3  "Person # of partner";
label variable cdcmstat "CDC standard for legal marital status";
label variable sib_degp "Degree of sibling relationship to HH reference person";
label variable fmother1 "Person # of mother";
label variable mom_degp "Type of relationship with Mother";
label variable ffather1 "Person # of father";
label variable dad_degp "Type of relationship with Father";
label variable parents  "Parent(s) present in the family";
label variable mom_ed   "Education of Mother";
label variable dad_ed   "Education of Father";
label variable astatflg "Sample Adult Flag";
label variable cstatflg "Sample Child Flag";
label variable qcadult  "Quality control flag for sample adult";
label variable qcchild  "Quality control flag for sample child";

label variable fdrn_flg "Disability Questions flag";
label variable plaplylm "Is - - limited in kind/amount play?";
label variable plaplyun "Is - - able to play at all?";
label variable pspedeis "Does - - receive Special Education or EIS?";
label variable pspedem  "
  Receive Special Education/EIS due to emotional/behavioral problem";
label variable plaadl   "Does - - need help with personal care?";
label variable labath   "Does - - need help with bathing/showering?";
label variable ladress  "Does - - need help dressing?";
label variable laeat    "Does - - need help eating?";
label variable labed    "Does - - need help in/out of bed or chairs?";
label variable latoilt  "Does - - need help using the toilet?";
label variable lahome   "Does - - need help to get around in the home?";
label variable plaiadl  "Does - - need help with routine needs?";
label variable plawknow "Is - - unable to work NOW due to health problem?";
label variable plawklim "Is - - limited in kind/amount of work?";
label variable plawalk  "Does - - have difficulty walking without equipment?";
label variable plaremem "Is - - limited by difficulty remembering?";
label variable plimany  "Is - - limited in any (other) way?";
label variable la1ar    "Any limitation - all persons, all conditions";
label variable lahcc1   "Vision/problem seeing causes limitation";
label variable lahcc2   "Hearing problem causes limitation";
label variable lahcc3   "Speech problem causes limitation";
label variable lahcc4   "Asthma/breathing problem causes limitation";
label variable lahcc5   "Birth defect causes limitation";
label variable lahcc6   "Injury causes limitation";
label variable lahcc7a  "
  Intellectual disability, also known as mental retardation causes limitation";
label variable lahcc8   "
  Other developmental problem (e.g., cerebral palsy) causes limitation";
label variable lahcc9   "
  Other mental, emotional, or behavioral problem causes limitation";
label variable lahcc10  "Bone, joint, or muscle problem causes limitation";
label variable lahcc11  "Epilepsy or seizures cause limitation";
label variable lahcc12  "Learning disability causes limitation";
label variable lahcc13  "
  Attention Deficit/Hyperactivity Disorder (ADD/ADHD) causes limitation";
label variable lahcc90  "Other impairment/problem (1) causes limitation";
label variable lahcc91  "Other impairment/problem (2) causes limitation";
label variable lctime1  "Duration of vision problem: Number of units";
label variable lcunit1  "Duration of vision problem: Time unit";
label variable lcdura1  "Duration of vision problem (in years)";
label variable lcdurb1  "Duration of vision problem recode 2";
label variable lcchrc1  "Vision problem condition status";
label variable lctime2  "Duration of hearing problem: Number of units";
label variable lcunit2  "Duration of hearing problem: Time unit";
label variable lcdura2  "Duration of hearing problem (in years)";
label variable lcdurb2  "Duration of hearing problem recode 2";
label variable lcchrc2  "Hearing problem condition status";
label variable lctime3  "Duration of speech problem: Number of units";
label variable lcunit3  "Duration of speech problem: Time unit";
label variable lcdura3  "Duration of speech problem (in years)";
label variable lcdurb3  "Duration of speech problem recode 2";
label variable lcchrc3  "Speech problem condition status";
label variable lctime4  "Duration of asthma/breathing problem: Number of units";
label variable lcunit4  "Duration of asthma/breathing problem: Time unit";
label variable lcdura4  "Duration of asthma/breathing problem (in years)";
label variable lcdurb4  "Duration of asthma/breathing problem recode 2";
label variable lcchrc4  "Asthma/breathing problem condition status";
label variable lctime5  "Duration of birth defect: Number of units";
label variable lcunit5  "Duration of birth defect: Time unit";
label variable lcdura5  "Duration of birth defect (in years)";
label variable lcdurb5  "Duration of birth defect recode 2";
label variable lcchrc5  "Birth defect condition status";
label variable lctime6  "Duration of injury: Number of units";
label variable lcunit6  "Duration of injury: Time unit";
label variable lcdura6  "Duration of injury (in years)";
label variable lcdurb6  "Duration of injury recode 2";
label variable lcchrc6  "Injury condition status";
label variable lctime7a "
  Duration of intellectual disability, also known as mental retardation: Number of
  units";
label variable lcunit7a "
  Duration of intellectual disability, also known as mental retardation: Time unit
  ";
label variable lcdura7a "
  Duration of intellectual disability, also known as mental retardation (in years)
  ";
label variable lcdurb7a "
  Duration of intellectual disability, also known as mental retardation recode 2";
label variable lcchrc7a "
  Intellectual disability, also known as mental retardation condition status";
label variable lctime8  "
  Duration of other developmental problem: Number of units";
label variable lcunit8  "Duration of other developmental problem: Time unit";
label variable lcdura8  "Duration of other developmental problem (in years)";
label variable lcdurb8  "Duration of other developmental problem recode 2";
label variable lcchrc8  "Other developmental problem condition status";
label variable lctime9  "
  Duration of other mental/emotional/behavioral problem: Number of units";
label variable lcunit9  "
  Duration of other mental, emotional, or behavioral problem: Number of units";
label variable lcdura9  "
  Duration of other mental, emotional, or behavioral problem (in years)";
label variable lcdurb9  "
  Duration of other mental, emotional, or behavioral problem recode 2";
label variable lcchrc9  "
  Other mental, emotional, or behavioral problem condition status";
label variable lctime10 "
  Duration of bone, joint, or muscle problem: Number of units";
label variable lcunit10 "Duration of bone, joint, or muscle problem: Time unit";
label variable lcdura10 "Duration of bone, joint, or muscle problem (in years)";
label variable lcdurb10 "Duration of bone, joint, or muscle problem recode 2";
label variable lcchrc10 "Bone, joint, or muscle problem condition status";
label variable lctime11 "Duration of epilepsy or seizures: Number of units";
label variable lcunit11 "Duration of epilepsy or seizures: Time unit";
label variable lcdura11 "Duration of epilepsy or seizures (in years)";
label variable lcdurb11 "Duration of epilepsy or seizures recode 2";
label variable lcchrc11 "Epilepsy or seizures condition status";
label variable lctime12 "Duration of learning disability: Number of units";
label variable lcunit12 "Duration of learning disability: Time unit";
label variable lcdura12 "Duration of learning disability (in years)";
label variable lcdurb12 "Duration of learning disability recode 2";
label variable lcchrc12 "Learning disability condition status";
label variable lctime13 "
  Duration of attention deficit/hyperactivity disorder (ADD/ADHD): Number of units
  ";
label variable lcunit13 "
  Duration of attention deficit/hyperactivity disorder (ADD/ADHD): Time unit";
label variable lcdura13 "
  Duration of attention deficit/hyperactivity disorder (ADD/ADHD) (in years)";
label variable lcdurb13 "
  Duration of attention deficit/hyperactivity disorder (ADD/ADHD) recode 2";
label variable lcchrc13 "
  Attention deficit/hyperactivity disorder (ADD/ADHD) condition status";
label variable lctime90 "
  Duration of other impairment problem (1): Number of units";
label variable lcunit90 "Duration of other impairment/problem (1): Time unit";
label variable lcdura90 "Duration of other impairment/problem (1) (in years)";
label variable lcdurb90 "Duration of other impairment/problem (1) recode 2";
label variable lcchrc90 "Other impairment/problem (1) condition status";
label variable lctime91 "
  Duration of other impairment/problem (2): Number of units";
label variable lcunit91 "Duration of other impairment/problem (2): Time unit";
label variable lcdura91 "Duration of other impairment/problem (2) (in years)";
label variable lcdurb91 "Duration of other impairment/problem (2) recode 2";
label variable lcchrc91 "Other impairment/problem (2) condition status";
label variable lahca1   "Vision/problem seeing causes limitation";
label variable lahca2   "Hearing problem causes limitation";
label variable lahca3   "Arthritis/rheumatism causes limitation";
label variable lahca4   "Back or neck problem causes limitation";
label variable lahca5   "Fracture, bone/joint injury causes limitation";
label variable lahca6   "Other injury causes limitation";
label variable lahca7   "Heart problem causes limitation";
label variable lahca8   "Stroke problem causes limitation";
label variable lahca9   "Hypertension/high blood pressure causes limitation";
label variable lahca10  "Diabetes causes limitation";
label variable lahca11  "
  Lung/breathing problem (e.g., asthma and emphysema) causes limitation";
label variable lahca12  "Cancer causes limitation";
label variable lahca13  "Birth defect causes limitation";
label variable lahca14a "
  Intellectual disability, also known as mental retardation causes limitation";
label variable lahca15  "
  Other developmental problem (e.g., cerebral palsy) causes limitation";
label variable lahca16  "Senility causes limitation";
label variable lahca17  "Depression/anxiety/emotional problem causes limitation
  ";
label variable lahca18  "Weight problem causes limitation";
label variable lahca19_ "
  Missing or amputated limb/finger/digit causes limitation";
label variable lahca20_ "
  Musculoskeletal/connective tissue problem causes limitation";
label variable lahca21_ "
  Circulation problems (including blood clots) cause limitation";
label variable lahca22_ "
  Endocrine/nutritional/metabolic problem causes limitation";
label variable lahca23_ "
  Nervous system/sensory organ condition causes limitation";
label variable lahca24_ "Digestive system problem causes limitation";
label variable lahca25_ "Genitourinary system problem causes limitation";
label variable lahca26_ "Skin/subcutaneous system problem causes limitation";
label variable lahca27_ "Blood or blood-forming organ problem causes limitation
  ";
label variable lahca28_ "Benign tumor/cyst causes limitation";
label variable lahca29_ "Alcohol/drug/substance abuse problem causes limitation
  ";
label variable lahca30_ "
  Other mental problem/ADD/bipolar/schizophrenia causes limitation";
label variable lahca31_ "
  Surgical after-effects/medical treatment causes limitation";
label variable lahca32_ "
  'Old age'/elderly/aging-related problem causes limitation";
label variable lahca33_ "Fatigue/tiredness/weakness causes limitation";
label variable lahca34_ "Pregnancy-related problem causes limitation";
label variable lahca90  "Other impairment/problem (1) causes limitation";
label variable lahca91  "Other impairment/problem (2) causes limitation";
label variable latime1  "Duration of vision problem: Number of units";
label variable launit1  "Duration of vision problem: Time unit";
label variable ladura1  "Duration of vision problem (in years)";
label variable ladurb1  "Duration of vision problem recode 2";
label variable lachrc1  "Vision problem condition status";
label variable latime2  "Duration of hearing problem: Number of units";
label variable launit2  "Duration of hearing problem: Time unit";
label variable ladura2  "Duration of hearing problem (in years)";
label variable ladurb2  "Duration of hearing problem recode 2";
label variable lachrc2  "Hearing problem condition status";
label variable latime3  "Duration of arthritis/rheumatism: Number of units";
label variable launit3  "Duration of arthritis/rheumatism: Time unit";
label variable ladura3  "Duration of arthritis/rheumatism (in years)";
label variable ladurb3  "Duration of arthritis/rheumatism recode 2";
label variable lachrc3  "Arthritis/rheumatism condition status";
label variable latime4  "Duration of back or neck problem: Number of units";
label variable launit4  "Duration of back or neck problem: Time unit";
label variable ladura4  "Duration of back or neck problem (in years)";
label variable ladurb4  "Duration of back or neck problem recode 2";
label variable lachrc4  "Back or neck problem condition status";
label variable latime5  "
  Duration of fracture, bone/joint injury: Number of units";
label variable launit5  "Duration of fracture, bone/joint injury: Time unit";
label variable ladura5  "Duration of fracture, bone/joint injury (in years)";
label variable ladurb5  "Duration of fracture, bone/joint injury recode 2";
label variable lachrc5  "Fracture, bone/joint injury condition status";
label variable latime6  "Duration of other injury: Number of units";
label variable launit6  "Duration of other injury: Time unit";
label variable ladura6  "Duration of other injury (in years)";
label variable ladurb6  "Duration of other injury recode 2";
label variable lachrc6  "Other injury condition status";
label variable latime7  "Duration of heart problem: Number of units";
label variable launit7  "Duration of heart problem: Time unit";
label variable ladura7  "Duration of heart problem (in years)";
label variable ladurb7  "Duration of heart problem recode 2";
label variable lachrc7  "Heart problem condition status";
label variable latime8  "Duration of stroke problem: Number of units";
label variable launit8  "Duration of stroke problem: Time unit";
label variable ladura8  "Duration of stroke problem (in years)";
label variable ladurb8  "Duration of stroke problem recode 2";
label variable lachrc8  "Stroke problem condition status";
label variable latime9  "
  Duration of hypertension or high blood pressure: Number of units";
label variable launit9  "
  Duration of hypertension or high blood pressure: Time unit";
label variable ladura9  "
  Duration of hypertension or high blood pressure (in years)";
label variable ladurb9  "
  Duration of hypertension or high blood pressure: recode 2";
label variable lachrc9  "Hypertension or high blood pressure condition status";
label variable latime10 "Duration of diabetes: Number of units";
label variable launit10 "Duration of diabetes: Time unit";
label variable ladura10 "Duration of diabetes (in years)";
label variable ladurb10 "Duration of diabetes recode 2";
label variable lachrc10 "Diabetes condition status";
label variable latime11 "
  Duration of lung or breathing problem (e.g., asthma and emphysema): Number of un
  its";
label variable launit11 "
  Duration of lung or breathing problem (e.g., asthma and emphysema): Time unit";
label variable ladura11 "
  Duration of lung or breathing problem (e.g., asthma and emphysema) (in years)";
label variable ladurb11 "
  Duration of lung or breathing problem (e.g., asthma and emphysema): recode 2";
label variable lachrc11 "
  Lung or breathing problem (e.g., asthma and emphysema): condition status";
label variable latime12 "Duration of cancer: Number of units";
label variable launit12 "Duration of cancer: Time unit";
label variable ladura12 "Duration of cancer (in years)";
label variable ladurb12 "Duration of cancer recode 2";
label variable lachrc12 "Cancer condition status";
label variable latime13 "Duration of birth defect: Number of units";
label variable launit13 "Duration of birth defect: Time unit";
label variable ladura13 "Duration of birth defect (in years)";
label variable ladurb13 "Duration of birth defect recode 2";
label variable lachrc13 "Birth defect condition status";
label variable ltime14a "
  Duration of intellectual disability, also known as mental retardation: Number of
  units";
label variable lunit14a "
  Duration of intellectual disability, also known as mental retardation: Time unit
  ";
label variable ldura14a "
  Duration of intellectual disability, also known as mental retardation (in years)
  ";
label variable ldurb14a "
  Duration of intellectual disability, also known as mental retardation recode 2";
label variable lchrc14a "
  Intellectual disability, also known as mental retardation condition status";
label variable latime15 "Duration of other developmental problem (e.g., cerebral palsy): Number of units
  ";
label variable launit15 "
  Duration of other developmental problem (e.g., cerebral palsy): Time unit";
label variable ladura15 "
  Duration of other developmental problem (e.g., cerebral palsy) (in years)";
label variable ladurb15 "
  Duration of other developmental problem (e.g., cerebral palsy) recode 2";
label variable lachrc15 "
  Other developmental problem (e.g., cerebral palsy) condition status";
label variable latime16 "Duration of senility: Number of units";
label variable launit16 "Duration of senility: Time unit";
label variable ladura16 "Duration of senility (in years)";
label variable ladurb16 "Duration of senility recode 2";
label variable lachrc16 "Senility condition status";
label variable latime17 "
  Duration of depression, anxiety, or emotional problem: Number of units";
label variable launit17 "
  Duration of depression, anxiety, or emotional problem: Time unit";
label variable ladura17 "
  Duration of depression, anxiety, or emotional problem (in years)";
label variable ladurb17 "
  Duration of depression, anxiety, or emotional problem recode 2";
label variable lachrc17 "Depression/anxiety/emotional problem condition status";
label variable latime18 "Duration of weight problem: Number of units";
label variable launit18 "Duration of weight problem: Time unit";
label variable ladura18 "Duration of weight problem (in years)";
label variable ladurb18 "Duration of weight problem recode 2";
label variable lachrc18 "Weight problem condition status";
label variable latime19 "
  Duration of missing limbs (fingers, toes, or digits); amputation: Number of unit
  s";
label variable launit19 "
  Duration of missing limbs (fingers, toes, or digits); amputation: Time unit";
label variable ladura19 "
  Duration of missing limbs (fingers, toes, or digits); amputation (in years)";
label variable ladurb19 "
  Duration of missing limbs (fingers, toes, or digits); amputation recode 2";
label variable lachrc19 "
  Missing limbs (fingers, toes, or digits); amputation condition status";
label variable latime20 "
  Duration of musculoskeletal/connective tissue problem: Number of units";
label variable launit20 "
  Duration of musculoskeletal/connective tissue problem: Time unit";
label variable ladura20 "
  Duration of musculoskeletal/connective tissue problem (in years)";
label variable ladurb20 "
  Duration of musculoskeletal/connective tissue problem recode 2";
label variable lachrc20 "
  Musculoskeletal/connective tissue problem condition status";
label variable latime21 "
  Duration of circulation problems (including blood clots) : Number of units";
label variable launit21 "
  Duration of circulation problems (including blood clots): Time unit";
label variable ladura21 "
  Duration of circulation problems (including blood clots) (in years)";
label variable ladurb21 "
  Duration of circulation problems (including blood clots) recode 2";
label variable lachrc21 "
  Circulation problems (including blood clots) condition status";
label variable latime22 "
  Duration of endocrine/nutritional/metabolic problem: Number of units";
label variable launit22 "
  Duration of endocrine/nutritional/metabolic problem: Time unit";
label variable ladura22 "
  Duration of endocrine/nutritional/metabolic problem (in years)";
label variable ladurb22 "
  Duration of endocrine/nutritional/metabolic problem recode 2";
label variable lachrc22 "
  Endocrine/nutritional/metabolic problem condition status";
label variable latime23 "
  Duration of nervous system /sensory organ condition: Number of units";
label variable launit23 "
  Duration of nervous system/sensory organ condition: Time unit";
label variable ladura23 "
  Duration of nervous system/sensory organ condition (in years)";
label variable ladurb23 "
  Duration of nervous system/sensory organ condition recode 2";
label variable lachrc23 "Nervous system/sensory organ condition status";
label variable latime24 "Duration of digestive system problems: Number of units
  ";
label variable launit24 "Duration of digestive system problems: Number of units
  ";
label variable ladura24 "Duration of digestive system problems (in years)";
label variable ladurb24 "Duration of digestive system problems recode 2";
label variable lachrc24 "Digestive system problems condition status";
label variable latime25 "
  Duration of genitourinary system problem: Number of units";
label variable launit25 "Duration of genitourinary system problem: Time unit";
label variable ladura25 "Duration of genitourinary system problem (in years)";
label variable ladurb25 "Duration of genitourinary system problem recode 2";
label variable lachrc25 "Genitourinary system problem condition status";
label variable latime26 "
  Duration of skin/subcutaneous system problems: Number of units";
label variable launit26 "
  Duration of skin/subcutaneous system problems: Time unit";
label variable ladura26 "
  Duration of skin/subcutaneous system problems (in years)";
label variable ladurb26 "Duration of skin/subcutaneous system problem recode 2";
label variable lachrc26 "Skin/subcutaneous system problems condition status";
label variable latime27 "
  Duration of blood or blood-forming organ problem: Number of units";
label variable launit27 "
  Duration of blood or blood-forming organ problem: Time unit";
label variable ladura27 "
  Duration of blood or blood-forming organ problem (in years)";
label variable ladurb27 "
  Duration of blood or blood-forming organ problem recode 2";
label variable lachrc27 "Blood or blood-forming organ problem condition status";
label variable latime28 "Duration of benign tumor/cyst: Number of units";
label variable launit28 "Duration of benign tumor/cyst: Time unit";
label variable ladura28 "Duration of benign tumor/cyst (in years)";
label variable ladurb28 "Duration of benign tumor/cyst recode 2";
label variable lachrc28 "Benign tumor/cyst condition status";
label variable latime29 "
  Duration of alcohol/drug/substance abuse problem: Number of units";
label variable launit29 "
  Duration of alcohol/drug/substance abuse problem: Time unit";
label variable ladura29 "
  Duration of alcohol/drug/substance abuse problem (in years)";
label variable ladurb29 "
  Duration of alcohol/drug/substance abuse problem recode 2";
label variable lachrc29 "Alcohol/drug/substance abuse problem condition status";
label variable latime30 "
  Duration of other mental problem/ADD/Bipolar/Schizophrenia: Number of units";
label variable launit30 "
  Duration of other mental problem/ADD/Bipolar/Schizophrenia: Time unit";
label variable ladura30 "
  Duration of other mental problem/ADD/Bipolar/Schizophrenia (in years)";
label variable ladurb30 "
  Duration of other mental problem/ADD/Bipolar/Schizophrenia recode 2";
label variable lachrc30 "
  Other mental problem/ADD/Bipolar/Schizophrenia condition status";
label variable latime31 "
  Duration of surgical after-effects/medical treatment problems: Number of units";
label variable launit31 "
  Duration of surgical after-effects/medical treatment problems: Time unit";
label variable ladura31 "
  Duration of surgical after-effects/medical treatment problems (in years)";
label variable ladurb31 "
  Duration of surgical after-effects/medical treatment problems recode 2";
label variable lachrc31 "
  Surgical after-effects/medical treatment problems condition status";
label variable latime32 "
  Duration of 'old age'/elderly/aging-related problems: Number of units";
label variable launit32 "
  Duration of 'old age'/elderly/aging-related problems: Number of units";
label variable ladura32 "
  Duration of 'old age'/elderly/aging-related problems (in years)";
label variable ladurb32 "
  Duration of 'old age'/elderly/aging-related problems recode 2";
label variable lachrc32 "
  'Old age'/elderly/aging-related problems condition status";
label variable latime33 "
  Duration of fatigue/tiredness/weakness problem: Number of units";
label variable launit33 "
  Duration of fatigue/tiredness/weakness problem: Time unit";
label variable ladura33 "
  Duration of fatigue/tiredness/weakness problem (in years)";
label variable ladurb33 "Duration of fatigue/tiredness/weakness problem recode 2
  ";
label variable lachrc33 "Fatigue/tiredness/weakness problem condition status";
label variable latime34 "Duration of pregnancy-related problem: Number of units
  ";
label variable launit34 "Duration of pregnancy-related problem: Time unit";
label variable ladura34 "Duration of pregnancy-related problem (in years)";
label variable ladurb34 "Duration of pregnancy-related problem recode 2";
label variable lachrc34 "Pregnancy-related condition status";
label variable latime90 "
  Duration of other impairment/problem N.E.C. (1): Number of units";
label variable launit90 "
  Duration of other impairment/problem N.E.C. (1): Time unit";
label variable ladura90 "
  Duration of other impairment/problem N.E.C. (1) (in years)";
label variable ladurb90 "
  Duration of other impairment/problem N.E.C. (1) recode 2";
label variable lachrc90 "Other impairment/problem N.E.C. (1) condition status";
label variable latime91 "
  Duration of other impairment/problem N.E.C. (2): Number of units";
label variable launit91 "
  Duration of other impairment/problem N.E.C. (2): Time unit";
label variable ladura91 "
  Duration of other impairment/problem N.E.C. (2) (in years)";
label variable ladurb91 "
  Duration of other impairment/problem N.E.C. (2) recode 2";
label variable lachrc91 "Other impairment/problem N.E.C. (2) condition status";
label variable lcondrt  "
  Chronic condition recode for person with limitation of activity";
label variable lachronr "
  Limitation of activity recode by chronic condition status";
label variable phstat   "Reported health status";

label variable pdmed12m "Has medical care been delayed for - - (cost), 12m";
label variable pnmed12m "Did - - need and NOT get medical care (cost), 12m";
label variable phospyr2 "Has - - been in a hospital OVERNIGHT, 12m";
label variable hospno   "Number of times in hospital overnight, 12m";
label variable hpnite   "Number of nights in hospital, 12m";
label variable phchm2w  "Did - - receive HOME care by health professional, 2 wk
  ";
label variable phchmn2w "Number of HOME visits by health professional, 2wk";
label variable phcph2wr "Did--get advice/test results by phone, 2wk";
label variable phcphn2w "Number of PHONE calls to health professional, 2wk";
label variable phcdv2w  "Did - - see health professional in office, etc, 2wk";
label variable phcdvn2w "Number of times VISITED health professional, 2wk";
label variable p10dvyr  "Did - - receive care 10+ times, 12m";

label variable notcov   "Cov stat as used in Health United States";
label variable medicare "Medicare coverage recode";
label variable mcpart   "Type of Medicare coverage";
label variable mcchoice "Enrolled in Medicare Advantage Plan";
label variable mchmo    "Is - - signed up with an HMO";
label variable mcadvr   "Medicare Advantage Plan";
label variable mcprem   "Premium for Medicare Advantage/ Medicare HMO";
label variable mcref    "Need a referral for special care";
label variable mcpartd  "Medicare Part D";
label variable medicaid "Medicaid coverage recode";
label variable machmd   "Any doc, chooses from a list, doc assigned";
label variable mapcmd   "Primary care physician for routine care";
label variable maref    "Need a referral for special care";
label variable single   "Single service plan recode";
label variable sstypea  "Accidents";
label variable sstypeb  "AIDS care";
label variable sstypec  "Cancer treatment";
label variable sstyped  "Catastrophic care";
label variable sstypee  "Dental care";
label variable sstypef  "Disability insurance";
label variable sstypeg  "Hospice care";
label variable sstypeh  "Hospitalization only";
label variable sstypei  "Long-term care";
label variable sstypej  "Prescriptions";
label variable sstypek  "Vision care";
label variable sstypel  "Other";
label variable private  "Private health insurance recode";
label variable whonam1  "Plan in whose name (Plan 1)";
label variable prpolh1  "Relationship to outside policyholder (Plan 1)";
label variable prcooh1  "Covered persons outside family roster (Plan 1)";
label variable prctoh1  "Number of persons (Plan 1)";
label variable prrloh11 "Child, including stepchild (Plan 1)";
label variable prrloh21 "Spouse (Plan 1)";
label variable prrloh31 "Former spouse (Plan 1)";
label variable prrloh41 "Some other relationship (Plan 1)";
label variable prcnum1  "Number of children covered who live elsewhere (Plan 1)
  ";
label variable cohu191  "Number of children age 0-18 (Plan 1)";
label variable coh19251 "Number of children age 19-25 (Plan 1)";
label variable coho251  "Number of children age 26+ (Plan 1)";
label variable plnwrkr1 "How plan was originally obtained (Plan 1)";
label variable plnpay11 "Paid for by self or family (Plan 1)";
label variable plnpay21 "Paid for by employer or union (Plan 1)";
label variable plnpay31 "Paid for by someone outside the household (Plan 1)";
label variable plnpay41 "Paid for by Medicare (Plan 1)";
label variable plnpay51 "Paid for by Medicaid (Plan 1)";
label variable plnpay61 "Paid for by CHIP (Plan 1)";
label variable plnpay71 "Paid for by government program (Plan 1)";
label variable plnpre1  "Premium based on income (Plan 1)";
label variable hicostr1 "Out-of-pocket premium cost (Plan 1)";
label variable emppay1  "Know how much employer or union pays (Plan 1)";
label variable ecostr1  "Employer premium cost (Plan 1)";
label variable empcstp1 "Percent employer or union pays (Plan 1)";
label variable plnmgd1  "Type of private plan (Plan 1)";
label variable hdhp1    "High deductible health plan (Plan 1)";
label variable hsahra1  "
  Health Savings Accounts/Health Reimbursement Accounts (plan 1)";
label variable mgchmd1  "Doctor choice (Plan 1)";
label variable mgprmd1  "Preferred list (Plan 1)";
label variable mgpymd1  "Out of plan use (Plan 1)";
label variable mgpref1  "Private referral (Plan 1)";
label variable pcpreq1  "Primary care doctor required (Plan 1)";
label variable prrxcov1 "Prescription drug benefit (Plan 1)";
label variable prdncov1 "Dental Coverage (Plan 1)";
label variable whonam2  "Plan in whose name (Plan 2)";
label variable prpolh2  "Relationship to outside policyholder (Plan 2)";
label variable prcooh2  "Covered persons outside family roster (Plan 2)";
label variable prctoh2  "Number of persons (Plan 2)";
label variable prrloh12 "Child including stepchild (Plan 2)";
label variable prrloh22 "Spouse (Plan 2)";
label variable prrloh32 "Former spouse (Plan 2)";
label variable prrloh42 "Some other relationship (Plan 2)";
label variable prcnum2  "Number of children covered who live elsewhere (Plan 2)
  ";
label variable cohu192  "Number of children age 0-18 (Plan 2)";
label variable coh19252 "Number of children age 19-25 (Plan 2)";
label variable coho252  "Number of children age 26+ (Plan 2)";
label variable plnwrkr2 "How plan was originally obtained (Plan 2)";
label variable plnpay12 "Paid for by self or family (Plan 2)";
label variable plnpay22 "Paid for by employer or union (Plan 2)";
label variable plnpay32 "Paid for by someone outside the household (Plan 2)";
label variable plnpay42 "Paid for by Medicare (Plan 2)";
label variable plnpay52 "Paid for by Medicaid (Plan 2)";
label variable plnpay62 "Paid for by CHIP (Plan 2)";
label variable plnpay72 "Paid for by government program (Plan 2)";
label variable plnpre2  "Premium based on income (Plan 2)";
label variable hicostr2 "Out-of-pocket premium cost (Plan 2)";
label variable emppay2  "Know how much employer or union pays (Plan 2)";
label variable ecostr2  "Employer premium cost (Plan 2)";
label variable empcstp2 "Percent employer or union pays (Plan 2)";
label variable plnmgd2  "Type of private plan (plan 2)";
label variable hdhp2    "High deductible health plan (Plan 2)";
label variable hsahra2  "
  Health Savings Accounts/Health Reimbursement Accounts (plan 2)";
label variable mgchmd2  "Doctor choice (Plan 2)";
label variable mgprmd2  "Preferred list (Plan 2)";
label variable mgpymd2  "Out of plan use (Plan 2)";
label variable mgpref2  "Private referral (Plan 2)";
label variable pcpreq2  "Primary care doctor required (Plan 2)";
label variable prrxcov2 "Prescription drug benefit (Plan 2)";
label variable prdncov2 "Dental Coverage (Plan 2)";
label variable prplplus "Person has more than two private plans";
label variable fcovconf "Obtaining affordable coverage";
label variable schip    "SCHIP coverage recode";
label variable stdoc1   "Any doc, chooses from a list, doc assigned (SCHIP)";
label variable stpcmd1  "Primary care physician for routine care (SCHIP)";
label variable stref1   "Need a referral for special care (SCHIP)";
label variable othpub   "State-sponsored health plan recode";
label variable stdoc2   "Any doc, chooses from a list, doc assigned (OTHPUB)";
label variable stpcmd2  "Primary care physician for routine care (OTHPUB)";
label variable stref2   "Need a referral for special care (OTHPUB)";
label variable othgov   "Other government program recode";
label variable stdoc3   "Any doc, chooses from a list, doc assigned (OTHGOV)";
label variable stpcmd3  "Primary care physician for routine care (OTHGOV)";
label variable stref3   "Need a referral for special care (OTHGOV)";
label variable milcare  "Military health care coverage recode";
label variable milspc1  "TRICARE coverage";
label variable milspc2  "VA coverage";
label variable milspc3  "CHAMP-VA coverage";
label variable milspc4  "Other military coverage";
label variable milman   "Type of TRICARE coverage";
label variable ihs      "Indian Health Service recode";
label variable hilast   "How long since last had health coverage";
label variable histop1  "Lost job or changed employers";
label variable histop2  "Divorced/sep/death of spouse or parent";
label variable histop3  "Ineligible because of age/left school";
label variable histop4  "Employer does not offer/not eligible for cov";
label variable histop5  "Cost is too high";
label variable histop6  "Insurance company refused coverage";
label variable histop7  "Medicaid/medi plan stopped after pregnancy";
label variable histop8  "Lost Medicaid/new job/increase in income";
label variable histop9  "Lost Medicaid (other)";
label variable histop10 "Other";
label variable histop11 "Never had health insurance";
label variable histop12 "Moved from another county/state/country";
label variable histop13 "Self-employed";
label variable histop14 "No need for it/chooses not to have";
label variable histop15 "Got married";
label variable hinotyr  "No health coverage during past 12 months";
label variable hinotmyr "Months without coverage in past 12 months";
label variable fhichng  "Change in coverage in past 12 months";
label variable fhikdba  "
  Had private health insurance coverage in the past 12 months";
label variable fhikdbb  "Had Medicare coverage in the past 12 months";
label variable fhikdbc  "Had Medi-Gap coverage in the past 12 months";
label variable fhikdbd  "Had Medicaid coverage in the past 12 months";
label variable fhikdbe  "Had SCHIP coverage in the past 12 months";
label variable fhikdbf  "Had Military health care coverage in the past 12 months
  ";
label variable fhikdbg  "
  Had Indian Health Service coverage in the past 12 months";
label variable fhikdbh  "
  Had State-sponsored health plan coverage in the past 12 months";
label variable fhikdbi  "
  Had Other government program coverage in the past 12 months";
label variable fhikdbj  "Had Single service plan coverage in the past 12 months
  ";
label variable fhikdbk  "Had no coverage in the past 12 months";
label variable pwrkbr1  "
  Which one of these categories best describes how [fill 1: your/ALIAS's] private
  health insurance was obtained?";
label variable hcspfyr  "Amount family spent for medical care";
label variable medbill  "Problems paying medical bills";
label variable medbpay  "Medical bills being paid off over time";
label variable medbnop  "Unable to pay medical bills";
label variable fsa      "Flexible Spending Accounts";
label variable hikindna "Private health insurance";
label variable hikindnb "Medicare";
label variable hikindnc "Medi-Gap";
label variable hikindnd "Medicaid";
label variable hikindne "SCHIP";
label variable hikindnf "Military health care";
label variable hikindng "Indian Health Service";
label variable hikindnh "State-sponsored health plan";
label variable hikindni "Other government plan";
label variable hikindnj "Single service plan";
label variable hikindnk "No coverage of any type";
label variable mcareprb "Medicare coverage probe";
label variable mcaidprb "Medicaid coverage probe";
label variable sincov   "Single service plan probe";

label variable plborn   "Born in the United States";
label variable regionbr "Geographic region of birth recode";
label variable geobrth  "Geographic place of birth recode";
label variable yrsinus  "Years that - - has been in the U.S.";
label variable citizenp "U.S. citizenship status";
label variable headst   "Now attending Head Start";
label variable headstv1 "Ever attended Head Start";
label variable educ1    "Highest level of school completed";
label variable armfver  "
  Currently on full-time active duty with the Armed Forces";
label variable armfev   "
  Has - - ever served in U.S. Armed Forces, Reserves, or National Guard?";
label variable armffc   "
  Was - - active duty personnel who served on a humanitarian or peacekeeping missi
  on?";
label variable armftmr1 "
  Was - - active duty in the U.S. Armed Forces in September, 2001 or later?";
label variable armftm2p "
  Was - - active duty in the U.S. Armed Forces in August, 1990 to August, 2001 (in
  cluding Persian Gulf War)?";
label variable armftmr3 "
  Was - - active duty in the U.S. Armed Forces in May, 1975 to July, 1990?";
label variable armftmr4 "
  Was - - active duty in the U.S. Armed Forces in August, 1964 to April 1975 (Viet
  nam War)?";
label variable armftmr5 "
  Was - - active duty in the U.S. Armed Forces in February, 1955 to July, 1964?";
label variable armftm6p "
  Was - - active duty in the U.S. Armed Forces in July, 1950 to January, 1955 (Kor
  ean War)?";
label variable armftm7p "
  Was -- active duty in the U.S. Armed Forces in June, 1950 or earlier?";
label variable armfds2p "
  Was - - active duty in the Persian Gulf during Desert Shield and/or Desert Storm
  between Aug., 1990 to Apr., 1991?";
label variable doinglwp "What was - - doing last week";
label variable whynowkp "Main reason for not working last week";
label variable wrkhrs2  "Hours worked last week";
label variable wrkftall "Usually work full time";
label variable wrklyr1  "Work for pay last year";
label variable wrkmyr   "Months worked last year";
label variable ernyr_p  "Total earnings last year";
label variable hiempof  "Health insurance offered at workplace";

label variable fincint  "Introduction to the family income section";
label variable psal     "Received income from wages or salary (last CY)";
label variable pseinc   "Received income from self-employment (last CY)";
label variable pssrr    "
  Received income from Social Security or Railroad Retirement (last CY)";
label variable pssrrdb  "
  Received Social Security or Railroad Retirement income as a disability benefit";
label variable pssrrd   "Received benefit due to disability";
label variable ppens    "
  Received income from any disability pension other than Social Security or Railro
  ad Retirement";
label variable popens   "Received income from any other pension";
label variable pssi     "Received income from SSI";
label variable pssid    "Received SSI due to disability";
label variable ptanf    "
  Received income from a state or county welfare program (e.g., TANF)";
label variable powben   "Received other government assistance";
label variable pintrstr "Received interest income";
label variable pdivd    "Received dividends from stocks, funds, etc.";
label variable pchldsp  "Received income from child support";
label variable pincot   "Received income from any other source";
label variable pssapl   "Ever applied for Supplemental Security Income (SSI)";
label variable psdapl   "
  Ever applied for Social Security Disability Insurance (SSDI)";
label variable tanfmyr  "Months received welfare/TANF (last CY)";
label variable eligpwic "Anyone age-eligible for the WIC program?";
label variable pwic     "Received WIC benefits";
label variable wic_flag "WIC recipient age-eligible";

label variable englang  "How well English is spoken";

* DEFINE VALUE LABELS FOR REPORTS;

label define pep001x
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
  1        "1 Full or Adopted {brother/sister}"
  2        "2 Half {brother/sister}"
  3        "3 Step {brother/sister}"
  4        "4 {Brother/Sister}-in-law"
  9        "9 Other and unknown"
  ;
label define pep043x
  1        "1 Biological or adoptive"
  2        "2 Step"
  3        "3 In-law"
  9        "9 Other and unknown"
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
  1        "1 Families selected to receive AFD (sample adults) section"
  2        "
  2 Families selected to receive FDB (all persons 1 year and older) section"
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
  1        "1  Any doctor"
  2        "2  Select from book/list"
  3        "3  Doctor is assigned"
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
label define pep441x
  20000    "20000 $20,000 or more"
  99997    "99997 Refused"
  99998    "99998 Not ascertained"
  99999    "99999 Don't know"
  ;
label define pep442x
  1        "1 Yes"
  2        "2 No"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define pep443x
  40000    "40000 $40,000 or more"
  99997    "99997 Refused"
  99998    "99998 Not ascertained"
  99999    "99999 Don't know"
  ;
label define pep444x
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don’t know"
  ;
label define pep445x
  1        "1 HMO/IPA"
  2        "2 PPO"
  3        "3 POS"
  4        "4 Fee-for-service/indemnity"
  5        "5 Other"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define pep446x
  1        "1 Less than [$1,250/$2,500]"
  2        "2 [$1,250/$2,500] or more"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define pep448x
  1        "1 Any doctor"
  2        "2 Select from group/list"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define pep481x
  1        "1 Less than [$1,200/$2,400]"
  2        "2 [$1,200/$2,400] or more"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define pep491x
  1        "1 Very confident"
  2        "2 Somewhat confident"
  3        "3 Not too confident"
  4        "4 Not confident at all"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define pep509x
  1        "1 TRICARE Prime"
  2        "2 TRICARE Extra"
  3        "3 TRICARE Standard"
  4        "4 TRICARE for life"
  5        "5 TRICARE other (specify)"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define pep511x
  1        "1 6 months or less"
  2        "2 More than 6 months, but not more than 1 year ago"
  3        "3 More than 1 year, but not more than 3 years ago"
  4        "4 More than 3 years"
  5        "5 Never"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define pep542x
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
label define pep562x
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
label define pep563x
  1        "1 USA: born in one of the 50 United States or D.C."
  2        "2 USA: born in a U.S. territory"
  3        "3 Not born in the U.S. or a U.S. territory"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define pep564x
  1        "1 Less than 1 year"
  2        "2 1 yr., less than 5 yrs."
  3        "3 5 yrs., less than 10 yrs."
  4        "4 10 yrs., less than 15 yrs."
  5        "5 15 years or more"
  9        "9 Unknown"
  ;
label define pep565x
  1        "1 Yes, citizen of the United States"
  2        "2 No, not a citizen of the United States"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define pep568x
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
label define pep580x
  1        "1 Working for pay at a job or business"
  2        "2 With a job or business but not at work"
  3        "3 Looking for work"
  4        "4 Working, but not for pay, at a family-owned job or business"
  5        "5 Not working at a job or business and not looking for work"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define pep581x
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
label define pep582x
  95       "95 95+ hours"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define pep585x
  01       "01 1 month or less"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define pep586x
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
  1        "1 Enter 1 to continue"
  8        "8 Not ascertained"
  ;
label define pep607x
  0        "0 No WIC age-eligible family members"
  1        "1 At least 1 WIC age-eligible family member"
  ;
label define pep609x
  0        "0 Person not age-eligible"
  1        "1 Person age-eligible"
  ;
label define pep610x
  1        "1 Very well"
  2        "2 Well"
  3        "3 Not well"
  4        "4 Not at all"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
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
label values sib_degp  pep041x;   label values mom_degp  pep043x;
label values dad_degp  pep043x;   label values parents   pep046x;
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
label values plnpay71  pep072x;   label values plnpre1   pep037x;
label values hicostr1  pep441x;   label values emppay1   pep442x;
label values ecostr1   pep443x;   label values empcstp1  pep444x;
label values plnmgd1   pep445x;   label values hdhp1     pep446x;
label values hsahra1   pep037x;   label values mgchmd1   pep448x;
label values mgprmd1   pep037x;   label values mgpymd1   pep037x;
label values mgpref1   pep037x;   label values pcpreq1   pep037x;
label values prrxcov1  pep037x;   label values prdncov1  pep037x;
label values whonam2   pep420x;   label values prpolh2   pep421x;
label values prcooh2   pep037x;   label values prctoh2   pep387x;
label values prrloh12  pep072x;   label values prrloh22  pep072x;
label values prrloh32  pep072x;   label values prrloh42  pep072x;
label values prcnum2   pep428x;   label values cohu192   pep387x;
label values coh19252  pep387x;   label values coho252   pep387x;
label values plnwrkr2  pep432x;   label values plnpay12  pep072x;
label values plnpay22  pep072x;   label values plnpay32  pep072x;
label values plnpay42  pep072x;   label values plnpay52  pep072x;
label values plnpay62  pep072x;   label values plnpay72  pep072x;
label values plnpre2   pep037x;   label values hicostr2  pep441x;
label values emppay2   pep442x;   label values ecostr2   pep443x;
label values empcstp2  pep444x;   label values plnmgd2   pep445x;
label values hdhp2     pep481x;   label values hsahra2   pep037x;
label values mgchmd2   pep448x;   label values mgprmd2   pep037x;
label values mgpymd2   pep037x;   label values mgpref2   pep037x;
label values pcpreq2   pep037x;   label values prrxcov2  pep037x;
label values prdncov2  pep037x;   label values prplplus  pep037x;
label values fcovconf  pep491x;   label values schip     pep394x;
label values stdoc1    pep403x;   label values stpcmd1   pep037x;
label values stref1    pep037x;   label values othpub    pep394x;
label values stdoc2    pep403x;   label values stpcmd2   pep037x;
label values stref2    pep037x;   label values othgov    pep394x;
label values stdoc3    pep403x;   label values stpcmd3   pep037x;
label values stref3    pep037x;   label values milcare   pep394x;
label values milspc1   pep072x;   label values milspc2   pep072x;
label values milspc3   pep072x;   label values milspc4   pep072x;
label values milman    pep509x;   label values ihs       pep037x;
label values hilast    pep511x;   label values histop1   pep072x;
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
label values pwrkbr1   pep432x;   label values hcspfyr   pep542x;
label values medbill   pep037x;   label values medbpay   pep037x;
label values medbnop   pep037x;   label values fsa       pep037x;
label values hikindna  pep072x;   label values hikindnb  pep072x;
label values hikindnc  pep072x;   label values hikindnd  pep072x;
label values hikindne  pep072x;   label values hikindnf  pep072x;
label values hikindng  pep072x;   label values hikindnh  pep072x;
label values hikindni  pep072x;   label values hikindnj  pep072x;
label values hikindnk  pep072x;   label values mcareprb  pep037x;
label values mcaidprb  pep037x;   label values sincov    pep037x;

label values plborn    pep037x;   label values regionbr  pep562x;
label values geobrth   pep563x;   label values yrsinus   pep564x;
label values citizenp  pep565x;   label values headst    pep037x;
label values headstv1  pep037x;   label values educ1     pep568x;
label values armfver   pep037x;   label values armfev    pep037x;
label values armffc    pep037x;   label values armftmr1  pep072x;
label values armftm2p  pep072x;   label values armftmr3  pep072x;
label values armftmr4  pep072x;   label values armftmr5  pep072x;
label values armftm6p  pep072x;   label values armftm7p  pep072x;
label values armfds2p  pep037x;   label values doinglwp  pep580x;
label values whynowkp  pep581x;   label values wrkhrs2   pep582x;
label values wrkftall  pep037x;   label values wrklyr1   pep037x;
label values wrkmyr    pep585x;   label values ernyr_p   pep586x;
label values hiempof   pep037x;

label values fincint   pep588x;   label values psal      pep037x;
label values pseinc    pep037x;   label values pssrr     pep037x;
label values pssrrdb   pep037x;   label values pssrrd    pep037x;
label values ppens     pep037x;   label values popens    pep037x;
label values pssi      pep037x;   label values pssid     pep037x;
label values ptanf     pep037x;   label values powben    pep037x;
label values pintrstr  pep037x;   label values pdivd     pep037x;
label values pchldsp   pep037x;   label values pincot    pep037x;
label values pssapl    pep037x;   label values psdapl    pep037x;
label values tanfmyr   pep387x;   label values eligpwic  pep607x;
label values pwic      pep037x;   label values wic_flag  pep609x;

label values englang   pep610x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa];
save "$DAT/personsx", replace;

#delimit cr

* data file is stored in personsx.dta
* log  file is stored in personsx.log

log close
