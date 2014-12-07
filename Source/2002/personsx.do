global DAT "~/database/NHIS/Data/raw/2002"
global OUT "~/database/NHIS/Data/dta/2002"
global LOG "~/database/NHIS/Log"

log using "$LOG/personsx.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-ENDING
* DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 NOVEMBER 25, 2003
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2002 NHIS PUBLIC USE PERSONSX.DAT ASCII FILE

 NOTES:

EXECUTING THIS PROGRAM WILL REPLACE PERSONSX.DTA AND PERSONSX.LOG
IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN STATA'S WORKING
DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY 
WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2002\

THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
USER SHOULD ENTER THE FOLLOWING STATA COMMAND:  log close
 
 THIS IS STORED IN PERSONSX.DO
*********************************************************************;
clear;
set mem 200m;

* INPUT ALL VARIABLES;
infix
      rectype       1 -   2      srvy_yr       3 -   6
 str  hhx           7 -  12 str  fmx          13 -  14
 str  px           15 -  16      intv_qrt     17 -  17
      sex          18 -  18      age_p        19 -  20
      r_age1       21 -  21      r_age2       22 -  22
 str  dob_m        23 -  24 str  dob_y_p      25 -  28
      origin_i     29 -  29      origimpt     30 -  30
      hispan_i     31 -  32      hispimpt     33 -  33
      rcdt1p_i     34 -  35      rc_smp_i     36 -  37
      racerp_i     38 -  39      raceimpt     40 -  40
      mracrp_i     41 -  42      mracbp_i     43 -  44
      racrec_i     45 -  45      hiscod_i     46 -  46
      erimpflg     47 -  47      r_maritl     48 -  48
      cohab1       49 -  49      cohab2       50 -  50
      lg_mstat     51 -  51      cdcmstat     52 -  52
      rrp          53 -  54 str  hh_ref       55 -  56
 str  hhreflg      57 -  57      frrp         58 -  59
 str  fm_ref       60 -  61 str  fmreflg      62 -  62
      fm_resp      63 -  64 str  fmrpflg      65 -  65
      sib_deg      66 -  66 str  mother       67 -  68
      mom_deg      69 -  69 str  father       70 -  71
      dad_deg      72 -  72 str  guard        73 -  74
      parents      75 -  75      mom_ed       76 -  77
      dad_ed       78 -  79      fm_size      80 -  81
      fm_type      82 -  82      fm_strcp     83 -  84
      fm_strp      85 -  86      nowaf        87 -  87
      astatflg     88 -  88      cstatflg     89 -  89
      immunflg     90 -  90      region       91 -  91
      wtia         92 -  97      wtfa         98 - 103
      stratum     104 - 106      psu         107 - 107

      plaplylm    108 - 108      plaplyun    109 - 109
      pspedeis    110 - 110      pspedem     111 - 111
      plaadl      112 - 112      labath      113 - 113
      ladress     114 - 114      laeat       115 - 115
      labed       116 - 116      latoilt     117 - 117
      lahome      118 - 118      plaiadl     119 - 119
      plawknow    120 - 120      plawklim    121 - 121
      plawalk     122 - 122      plaremem    123 - 123
      plimany     124 - 124      la1ar       125 - 125
      lahcc1      126 - 126      lahcc2      127 - 127
      lahcc3      128 - 128      lahcc4      129 - 129
      lahcc5      130 - 130      lahcc6      131 - 131
      lahcc7      132 - 132      lahcc8      133 - 133
      lahcc9      134 - 134      lahcc10     135 - 135
      lahcc11     136 - 136      lahcc12     137 - 137
      lahcc13     138 - 138      lahcc90     139 - 139
      lahcc91     140 - 140      lctime1     141 - 142
      lcunit1     143 - 143      lcdura1     144 - 145
      lcdurb1     146 - 146      lcchrc1     147 - 147
      lctime2     148 - 149      lcunit2     150 - 150
      lcdura2     151 - 152      lcdurb2     153 - 153
      lcchrc2     154 - 154      lctime3     155 - 156
      lcunit3     157 - 157      lcdura3     158 - 159
      lcdurb3     160 - 160      lcchrc3     161 - 161
      lctime4     162 - 163      lcunit4     164 - 164
      lcdura4     165 - 166      lcdurb4     167 - 167
      lcchrc4     168 - 168      lctime5     169 - 170
      lcunit5     171 - 171      lcdura5     172 - 173
      lcdurb5     174 - 174      lcchrc5     175 - 175
      lctime6     176 - 177      lcunit6     178 - 178
      lcdura6     179 - 180      lcdurb6     181 - 181
      lcchrc6     182 - 182      lctime7     183 - 184
      lcunit7     185 - 185      lcdura7     186 - 187
      lcdurb7     188 - 188      lcchrc7     189 - 189
      lctime8     190 - 191      lcunit8     192 - 192
      lcdura8     193 - 194      lcdurb8     195 - 195
      lcchrc8     196 - 196      lctime9     197 - 198
      lcunit9     199 - 199      lcdura9     200 - 201
      lcdurb9     202 - 202      lcchrc9     203 - 203
      lctime10    204 - 205      lcunit10    206 - 206
      lcdura10    207 - 208      lcdurb10    209 - 209
      lcchrc10    210 - 210      lctime11    211 - 212
      lcunit11    213 - 213      lcdura11    214 - 215
      lcdurb11    216 - 216      lcchrc11    217 - 217
      lctime12    218 - 219      lcunit12    220 - 220
      lcdura12    221 - 222      lcdurb12    223 - 223
      lcchrc12    224 - 224      lctime13    225 - 226
      lcunit13    227 - 227      lcdura13    228 - 229
      lcdurb13    230 - 230      lcchrc13    231 - 231
      lctime90    232 - 233      lcunit90    234 - 234
      lcdura90    235 - 236      lcdurb90    237 - 237
      lcchrc90    238 - 238      lctime91    239 - 240
      lcunit91    241 - 241      lcdura91    242 - 243
      lcdurb91    244 - 244      lcchrc91    245 - 245
      lahca1      246 - 246      lahca2      247 - 247
      lahca3      248 - 248      lahca4      249 - 249
      lahca5      250 - 250      lahca6      251 - 251
      lahca7      252 - 252      lahca8      253 - 253
      lahca9      254 - 254      lahca10     255 - 255
      lahca11     256 - 256      lahca12     257 - 257
      lahca13     258 - 258      lahca14     259 - 259
      lahca15     260 - 260      lahca16     261 - 261
      lahca17     262 - 262      lahca18     263 - 263
      lahca19     264 - 264      lahca20     265 - 265
      lahca21     266 - 266      lahca22     267 - 267
      lahca23     268 - 268      lahca24     269 - 269
      lahca25     270 - 270      lahca26     271 - 271
      lahca27     272 - 272      lahca28     273 - 273
      lahca29     274 - 274      lahca30     275 - 275
      lahca31     276 - 276      lahca32     277 - 277
      lahca33     278 - 278      lahca34     279 - 279
      lahca90     280 - 280      lahca91     281 - 281
      latime1     282 - 283      launit1     284 - 284
      ladura1     285 - 286      ladurb1     287 - 287
      lachrc1     288 - 288      latime2     289 - 290
      launit2     291 - 291      ladura2     292 - 293
      ladurb2     294 - 294      lachrc2     295 - 295
      latime3     296 - 297      launit3     298 - 298
      ladura3     299 - 300      ladurb3     301 - 301
      lachrc3     302 - 302      latime4     303 - 304
      launit4     305 - 305      ladura4     306 - 307
      ladurb4     308 - 308      lachrc4     309 - 309
      latime5     310 - 311      launit5     312 - 312
      ladura5     313 - 314      ladurb5     315 - 315
      lachrc5     316 - 316      latime6     317 - 318
      launit6     319 - 319      ladura6     320 - 321
      ladurb6     322 - 322      lachrc6     323 - 323
      latime7     324 - 325      launit7     326 - 326
      ladura7     327 - 328      ladurb7     329 - 329
      lachrc7     330 - 330      latime8     331 - 332
      launit8     333 - 333      ladura8     334 - 335
      ladurb8     336 - 336      lachrc8     337 - 337
      latime9     338 - 339      launit9     340 - 340
      ladura9     341 - 342      ladurb9     343 - 343
      lachrc9     344 - 344      latime10    345 - 346
      launit10    347 - 347      ladura10    348 - 349
      ladurb10    350 - 350      lachrc10    351 - 351
      latime11    352 - 353      launit11    354 - 354
      ladura11    355 - 356      ladurb11    357 - 357
      lachrc11    358 - 358      latime12    359 - 360
      launit12    361 - 361      ladura12    362 - 363
      ladurb12    364 - 364      lachrc12    365 - 365
      latime13    366 - 367      launit13    368 - 368
      ladura13    369 - 370      ladurb13    371 - 371
      lachrc13    372 - 372      latime14    373 - 374
      launit14    375 - 375      ladura14    376 - 377
      ladurb14    378 - 378      lachrc14    379 - 379
      latime15    380 - 381      launit15    382 - 382
      ladura15    383 - 384      ladurb15    385 - 385
      lachrc15    386 - 386      latime16    387 - 388
      launit16    389 - 389      ladura16    390 - 391
      ladurb16    392 - 392      lachrc16    393 - 393
      latime17    394 - 395      launit17    396 - 396
      ladura17    397 - 398      ladurb17    399 - 399
      lachrc17    400 - 400      latime18    401 - 402
      launit18    403 - 403      ladura18    404 - 405
      ladurb18    406 - 406      lachrc18    407 - 407
      latime19    408 - 409      launit19    410 - 410
      ladura19    411 - 412      ladurb19    413 - 413
      lachrc19    414 - 414      latime20    415 - 416
      launit20    417 - 417      ladura20    418 - 419
      ladurb20    420 - 420      lachrc20    421 - 421
      latime21    422 - 423      launit21    424 - 424
      ladura21    425 - 426      ladurb21    427 - 427
      lachrc21    428 - 428      latime22    429 - 430
      launit22    431 - 431      ladura22    432 - 433
      ladurb22    434 - 434      lachrc22    435 - 435
      latime23    436 - 437      launit23    438 - 438
      ladura23    439 - 440      ladurb23    441 - 441
      lachrc23    442 - 442      latime24    443 - 444
      launit24    445 - 445      ladura24    446 - 447
      ladurb24    448 - 448      lachrc24    449 - 449
      latime25    450 - 451      launit25    452 - 452
      ladura25    453 - 454      ladurb25    455 - 455
      lachrc25    456 - 456      latime26    457 - 458
      launit26    459 - 459      ladura26    460 - 461
      ladurb26    462 - 462      lachrc26    463 - 463
      latime27    464 - 465      launit27    466 - 466
      ladura27    467 - 468      ladurb27    469 - 469
      lachrc27    470 - 470      latime28    471 - 472
      launit28    473 - 473      ladura28    474 - 475
      ladurb28    476 - 476      lachrc28    477 - 477
      latime29    478 - 479      launit29    480 - 480
      ladura29    481 - 482      ladurb29    483 - 483
      lachrc29    484 - 484      latime30    485 - 486
      launit30    487 - 487      ladura30    488 - 489
      ladurb30    490 - 490      lachrc30    491 - 491
      latime31    492 - 493      launit31    494 - 494
      ladura31    495 - 496      ladurb31    497 - 497
      lachrc31    498 - 498      latime32    499 - 500
      launit32    501 - 501      ladura32    502 - 503
      ladurb32    504 - 504      lachrc32    505 - 505
      latime33    506 - 507      launit33    508 - 508
      ladura33    509 - 510      ladurb33    511 - 511
      lachrc33    512 - 512      latime34    513 - 514
      launit34    515 - 515      ladura34    516 - 517
      ladurb34    518 - 518      lachrc34    519 - 519
      latime90    520 - 521      launit90    522 - 522
      ladura90    523 - 524      ladurb90    525 - 525
      lachrc90    526 - 526      latime91    527 - 528
      launit91    529 - 529      ladura91    530 - 531
      ladurb91    532 - 532      lachrc91    533 - 533
      lcondrt     534 - 534      lachronr    535 - 535
      phstat      536 - 536

      pdmed12m    537 - 537      pnmed12m    538 - 538
      phospyr     539 - 539      hospno      540 - 542
      hpnite      543 - 545      phchm2w     546 - 546
      phchmn2w    547 - 548      phcph2wr    549 - 549
      phcphn2w    550 - 551      phcdv2w     552 - 552
      phcdvn2w    553 - 554      p10dvyr     555 - 555

      hikinda     556 - 556      hikindb     557 - 557
      hikindc     558 - 558      hikindd     559 - 559
      hikinde     560 - 560      hikindf     561 - 561
      hikindg     562 - 562      hikindh     563 - 563
      hikindi     564 - 564      hikindj     565 - 565
      hikindk     566 - 566      hikindl     567 - 567
      hikindm     568 - 568      hikindn     569 - 569
      medicare    570 - 570      mcpart      571 - 571
      mcchoice    572 - 572      mchmo       573 - 573
      mcname      574 - 575      mcref       576 - 576
      mcpaypre    577 - 577      medicaid    578 - 578
      machmd      579 - 579      mapcmd      580 - 580
      maref       581 - 581      single      582 - 582
      sstypea     583 - 583      sstypeb     584 - 584
      sstypec     585 - 585      sstyped     586 - 586
      sstypee     587 - 587      sstypef     588 - 588
      sstypeg     589 - 589      sstypeh     590 - 590
      sstypei     591 - 591      sstypej     592 - 592
      sstypek     593 - 593      sstypel     594 - 594
      private     595 - 595      hitype1     596 - 597
      whonam1     598 - 598      plnwrk1     599 - 599
      plnpay11    600 - 600      plnpay21    601 - 601
      plnpay31    602 - 602      plnpay41    603 - 603
      plnpay51    604 - 604      plnpay61    605 - 605
      plnpay71    606 - 606      hicostr1    607 - 611
      plnmgd1     612 - 612      mgchmd1     613 - 613
      mgprmd1     614 - 614      mgpymd1     615 - 615
      mgpref1     616 - 616      hitype2     617 - 618
      whonam2     619 - 619      plnwrk2     620 - 620
      plnpay12    621 - 621      plnpay22    622 - 622
      plnpay32    623 - 623      plnpay42    624 - 624
      plnpay52    625 - 625      plnpay62    626 - 626
      plnpay72    627 - 627      hicostr2    628 - 632
      plnmgd2     633 - 633      mgchmd2     634 - 634
      mgprmd2     635 - 635      mgpymd2     636 - 636
      mgpref2     637 - 637      hitype3     638 - 639
      whonam3     640 - 640      plnwrk3     641 - 641
      plnpay13    642 - 642      plnpay23    643 - 643
      plnpay33    644 - 644      plnpay43    645 - 645
      plnpay53    646 - 646      plnpay63    647 - 647
      plnpay73    648 - 648      hicostr3    649 - 653
      plnmgd3     654 - 654      mgchmd3     655 - 655
      mgprmd3     656 - 656      mgpymd3     657 - 657
      mgpref3     658 - 658      hitype4     659 - 660
      whonam4     661 - 661      plnwrk4     662 - 662
      plnpay14    663 - 663      plnpay24    664 - 664
      plnpay34    665 - 665      plnpay44    666 - 666
      plnpay54    667 - 667      plnpay64    668 - 668
      plnpay74    669 - 669      hicostr4    670 - 674
      plnmgd4     675 - 675      mgchmd4     676 - 676
      mgprmd4     677 - 677      mgpymd4     678 - 678
      mgpref4     679 - 679      ihs         680 - 680
      military    681 - 681      chip        682 - 682
      otherpub    683 - 683      othergov    684 - 684
      notcov      685 - 685      hilast      686 - 686
      histop1     687 - 687      histop2     688 - 688
      histop3     689 - 689      histop4     690 - 690
      histop5     691 - 691      histop6     692 - 692
      histop7     693 - 693      histop8     694 - 694
      histop9     695 - 695      histop10    696 - 696
      histop11    697 - 697      histop12    698 - 698
      histop13    699 - 699      histop14    700 - 700
      histop15    701 - 701      hinotyr     702 - 702
      hinotmyr    703 - 704      hcspfyr     705 - 705

      regionbr    706 - 707      geobrth     708 - 708
      yrsinus     709 - 709      citizenp    710 - 710
      headst      711 - 711      headstv1    712 - 712
      educ        713 - 714      educ_r1     715 - 716
      miltryds    717 - 717      doinglw1    718 - 718
      whynowk1    719 - 720      wrkhrs      721 - 722
      wrkftall    723 - 723      wrklyr1     724 - 724
      wrkmyr      725 - 726      majr_act    727 - 727
      ernyr_p     728 - 729      hiempof     730 - 730

      psal        731 - 731      pseinc      732 - 732
      pssrr       733 - 733      pssrrdb     734 - 734
      pssrrd      735 - 735      ppens       736 - 736
      popens      737 - 737      pssi        738 - 738
      pssid       739 - 739      ptanf       740 - 740
      powben      741 - 741      pintrstr    742 - 742
      pdivd       743 - 743      pchldsp     744 - 744
      pincot      745 - 745      incgrp      746 - 747
      ab_bl20k    748 - 748      rat_cat     749 - 750
      houseown    751 - 751      fgah        752 - 752
      pssapl      753 - 753      psdapl      754 - 754
      tanfmyr     755 - 756      pfstp       757 - 757
      fstpmyr     758 - 759      eligpwic    760 - 760
      pwic        761 - 761      wic_flag    762 - 762
using $DAT/personsx.dat;
replace wtia    = wtia    / 10;

* DEFINE VARIABLE LABELS;

label variable rectype  "Record Type";
label variable srvy_yr  "Survey Year";
label variable hhx      "Household Serial Number";
label variable fmx      "Family Serial Number";
label variable px       "Person Number";
label variable intv_qrt "Interview Quarter";
label variable sex      "Sex";
label variable age_p    "Age";
label variable r_age1   "Age Recode #1";
label variable r_age2   "Age Recode #2";
label variable dob_m    "Month of Birth";
label variable dob_y_p  "Year of Birth";
label variable origin_i "Hispanic Ethnicity";
label variable origimpt "Hispanic Origin Imputation Flag";
label variable hispan_i "Hispanic subgroup detail";
label variable hispimpt "Type of Hispanic Origin Imputation Flag";
label variable rcdt1p_i "Race coded to single/multiple race group";
label variable rc_smp_i "Summary for single/multiple race groups";
label variable racerp_i "OMB groups w/multiple race";
label variable raceimpt "Race Imputation Flag";
label variable mracrp_i "Race coded to a single race group";
label variable mracbp_i "Race coded to a single race group";
label variable racrec_i "Race Recode";
label variable hiscod_i "Combined race/ethnicity recode";
label variable erimpflg "Ethnicity/Race Imputation Flag";
label variable r_maritl "Marital status";
label variable cohab1   "Cohabitor ever married?";
label variable cohab2   "Legal marital status/cohab. respondent";
label variable lg_mstat "Legal marital status";
label variable cdcmstat "CDC standard for legal marital status";
label variable rrp      "Relationship to HH reference person";
label variable hh_ref   "Person # of HH reference person";
label variable hhreflg  "HH Reference Person Flag";
label variable frrp     "Rel to family ref person";
label variable fm_ref   "Person # of family reference person";
label variable fmreflg  "Family Reference Person Flag";
label variable fm_resp  "Person # of family respondent";
label variable fmrpflg  "Family Respondent Flag";
label variable sib_deg  "Degree of sib rel to HH ref person";
label variable mother   "Mother's person number";
label variable mom_deg  "Type of relationship with Mother";
label variable father   "Father's person number";
label variable dad_deg  "Type of relationship with Father";
label variable guard    "Person number of guardian";
label variable parents  "Parent(s) present in the family";
label variable mom_ed   "Education of Mother";
label variable dad_ed   "Education of Father";
label variable fm_size  "Number of persons in family";
label variable fm_type  "Family Type (on the person-level)";
label variable fm_strcp "Family Structure (at the person-level)";
label variable fm_strp  "Family Structure (on the person-level)";
label variable nowaf    "Armed Forces - active duty";
label variable astatflg "Sample Adult Flag";
label variable cstatflg "Sample Child Flag";
label variable immunflg "Child Immunization Flag";
label variable region   "Region";
label variable wtia     "Weight - Interim Annual";
label variable wtfa     "Weight - Final Annual";
label variable stratum  "Stratum for variance estimation";
label variable psu      "PSU for variance estimation";
 
label variable plaplylm "Limited in kind/amount play";
label variable plaplyun "Is -- able to play AT ALL";
label variable pspedeis "Does -- receive Spec Ed or EIS";
label variable pspedem  "Rec services due to emot or behav prob";
label variable plaadl   "Does -- need help w/ADL";
label variable labath   "Need help with bath/shower";
label variable ladress  "Need help dressing";
label variable laeat    "Need help eating";
label variable labed    "Need help in/out of bed or chairs";
label variable latoilt  "Need help using the toilet";
label variable lahome   "Need help getting around in home";
label variable plaiadl  "Need help with IADL";
label variable plawknow "Is -- unable to work due to health prob";
label variable plawklim "Limited in kind/amt of work";
label variable plawalk  "Difficulty walking w/o equip";
label variable plaremem "Limited by dif remembering";
label variable plimany  "Is -- limited in ANY (other) WAY?";
label variable la1ar    "Any limitation - all persons, all conds";
label variable lahcc1   "Vision problem";
label variable lahcc2   "Hearing problem";
label variable lahcc3   "Speech problem";
label variable lahcc4   "Asthma/breathing problem";
label variable lahcc5   "Birth defect";
label variable lahcc6   "Injury";
label variable lahcc7   "Mental retardation";
label variable lahcc8   "Other developmental problem";
label variable lahcc9   "Other emotional/behavioral problem";
label variable lahcc10  "Bone/joint/muscle problem";
label variable lahcc11  "Epilepsy/seizures";
label variable lahcc12  "Learning disability";
label variable lahcc13  "ADD/ADHD";
label variable lahcc90  "Other impairment/problem (1)";
label variable lahcc91  "Other impairment/problem (2)";
label variable lctime1  "Duration of vision prob: # of units";
label variable lcunit1  "Duration of vision prob: Time unit";
label variable lcdura1  "Duration of vision prob (in years)";
label variable lcdurb1  "Duration of vision prob recode 2";
label variable lcchrc1  "Vision problem condition status";
label variable lctime2  "Duration of hearing prob: # of units";
label variable lcunit2  "Duration of hearing prob: Time unit";
label variable lcdura2  "Duration of hearing prob (in years)";
label variable lcdurb2  "Duration of hearing prob recode 2";
label variable lcchrc2  "Hearing problem condition status";
label variable lctime3  "Duration of speech prob: # of units";
label variable lcunit3  "Duration of speech prob: Time unit";
label variable lcdura3  "Duration of speech prob (in years)";
label variable lcdurb3  "Duration of speech prob recode 2";
label variable lcchrc3  "Speech problem condition status";
label variable lctime4  "Dur of asthma/breathing prob: # of units";
label variable lcunit4  "Dur of asthma/breathing prob: Time unit";
label variable lcdura4  "Dur of asthma/breathing prob (in years)";
label variable lcdurb4  "Dur of asthma/breathing prob recode 2";
label variable lcchrc4  "Asthma/breathing prob condition status";
label variable lctime5  "Duration of birth defect: # of units";
label variable lcunit5  "Duration of birth defect: Time unit";
label variable lcdura5  "Duration of birth defect (in years)";
label variable lcdurb5  "Duration of birth defect recode 2";
label variable lcchrc5  "Birth defect condition status";
label variable lctime6  "Duration of injury: # of units";
label variable lcunit6  "Duration of injury: Time unit";
label variable lcdura6  "Duration of injury (in years)";
label variable lcdurb6  "Duration of injury recode 2";
label variable lcchrc6  "Injury condition status";
label variable lctime7  "Dur of mental retardation: # of units";
label variable lcunit7  "Dur of mental retardation: Time unit";
label variable lcdura7  "Dur of mental retardation (in years)";
label variable lcdurb7  "Duration of mental retardation recode 2";
label variable lcchrc7  "Mental retardation condition status";
label variable lctime8  "Duration of other dev prob: # of units";
label variable lcunit8  "Duration of other dev prob: Time unit";
label variable lcdura8  "Duration of other dev prob (in years)";
label variable lcdurb8  "Duration of other dev prob recode 2";
label variable lcchrc8  "Other dev problem condition status";
label variable lctime9  "Dur of otr emot/behav prob: # of units";
label variable lcunit9  "Dur of otr emot/behav prob: Time unit";
label variable lcdura9  "Dur of otr emot/behav prob (in years)";
label variable lcdurb9  "Duration of otr emot/behav prob recode 2";
label variable lcchrc9  "Otr emot/behav problem condition status";
label variable lctime10 "Dur of bone/joint/muscl prob: # of units";
label variable lcunit10 "Dur of bone/joint/muscl prob: Time unit";
label variable lcdura10 "Dur of bone/joint/muscl prob (in years)";
label variable lcdurb10 "Dur of bone/joint/muscl prob recode 2";
label variable lcchrc10 "Bone/joint/muscl prob condition status";
label variable lctime11 "Dur of epilepsy/seizures: # of units";
label variable lcunit11 "Duration of epilepsy/seizures: Time unit";
label variable lcdura11 "Duration of epilepsy/seizures (in years)";
label variable lcdurb11 "Duration of epilepsy/seizures recode 2";
label variable lcchrc11 "Epilepsy/seizures condition status";
label variable lctime12 "Dur of learning disability: # of units";
label variable lcunit12 "Dur of learning disability: Time unit";
label variable lcdura12 "Dur of learning disability (in years)";
label variable lcdurb12 "Duration of learning disability recode 2";
label variable lcchrc12 "Learning disability condition status";
label variable lctime13 "Duration of ADD/ADHD: # of units";
label variable lcunit13 "Duration of ADD/ADHD: Time unit";
label variable lcdura13 "Duration of ADD/ADHD (in years)";
label variable lcdurb13 "Duration of ADD/ADHD recode 2";
label variable lcchrc13 "ADD/ADHD condition status";
label variable lctime90 "Dur of oth impair/prob (1): # of units";
label variable lcunit90 "Dur of oth impair/prob (1): Time unit";
label variable lcdura90 "Dur of oth impair/prob (1) (in years)";
label variable lcdurb90 "Dur of oth impair/prob (1) recode 2";
label variable lcchrc90 "Other impair/prob (1) condition status";
label variable lctime91 "Dur of oth impair/prob (2): # of units";
label variable lcunit91 "Dur of oth impair/prob (2): Time unit";
label variable lcdura91 "Dur of oth impair/prob (2) (in years)";
label variable lcdurb91 "Dur of oth impair/prob (2) recode 2";
label variable lcchrc91 "Other impair/prob (2) condition status";
label variable lahca1   "Vision problem";
label variable lahca2   "Hearing problem";
label variable lahca3   "Arthritis/rheumatism";
label variable lahca4   "Back/neck problem";
label variable lahca5   "Fracture/bone/joint injury";
label variable lahca6   "Other injury";
label variable lahca7   "Heart problem";
label variable lahca8   "Stroke";
label variable lahca9   "Hypertension/high blood pressure";
label variable lahca10  "Diabetes";
label variable lahca11  "Lung/breathing prob/asthma/emphysema";
label variable lahca12  "Cancer";
label variable lahca13  "Birth defect";
label variable lahca14  "Mental retardation";
label variable lahca15  "Otr developmental prob/cerebral palsy";
label variable lahca16  "Senility/dementia/alzheimers";
label variable lahca17  "Depression/anxiety/emotional problem";
label variable lahca18  "Weight problem/overweight/obesity";
label variable lahca19  "Missing or amputated limb/finger/digit";
label variable lahca20  "Musculoskeletal/connective tissue prob";
label variable lahca21  "Circulation problem";
label variable lahca22  "Endocrine/nutritional/metabolic prob";
label variable lahca23  "Nervous system/sensory organ condition";
label variable lahca24  "Digestive system problem";
label variable lahca25  "Genitourinary system problem";
label variable lahca26  "Skin/subcutaneous system problem";
label variable lahca27  "Blood or blood-forming organ problem";
label variable lahca28  "Benign tumor/cyst";
label variable lahca29  "Alcohol/drug/substance abuse problem";
label variable lahca30  "Otr mental prob/ADD/bipolar/schizophreni";
label variable lahca31  "Surgical after-effects/medical treatment";
label variable lahca32  "'Old age'/elderly/aging-related problem";
label variable lahca33  "Fatigue/tiredness/weakness";
label variable lahca34  "Pregnancy-related problem";
label variable lahca90  "Other prob 1, not elsewhere classified";
label variable lahca91  "Other prob 2, not elsewhere classified";
label variable latime1  "Duration of vision prob: # of units";
label variable launit1  "Duration of vision prob: Time unit";
label variable ladura1  "Duration of vision prob (in years)";
label variable ladurb1  "Duration of vision prob recode 2";
label variable lachrc1  "Vision problem condition status";
label variable latime2  "Duration of hearing prob: # of units";
label variable launit2  "Duration of hearing prob: Time unit";
label variable ladura2  "Duration of hearing prob (in years)";
label variable ladurb2  "Duration of hearing prob recode 2";
label variable lachrc2  "hearing problem condition status";
label variable latime3  "Duration of arthritis/rheum: # of units";
label variable launit3  "Duration of arthritis/rheum: Time unit";
label variable ladura3  "Duration of arthritis/rheum (in years)";
label variable ladurb3  "Duration of arthritis/rheum recode 2";
label variable lachrc3  "Arthritis/rheum condition status";
label variable latime4  "Duration of back/neck prob: # of units";
label variable launit4  "Duration of back/neck prob: Time unit";
label variable ladura4  "Duration of back/neck prob (in years)";
label variable ladurb4  "Duration of back/neck prob recode 2";
label variable lachrc4  "Back/neck problem condition status";
label variable latime5  "Dur of fract/bone/joint inj: # of units";
label variable launit5  "Dur of fract/bone/joint inj: Time unit";
label variable ladura5  "Dur of fract/bone/joint inj (in years)";
label variable ladurb5  "Dur of fract/bone/joint inj recode 2";
label variable lachrc5  "Fract/bone/joint inj condition status";
label variable latime6  "Duration of other injury: # of units";
label variable launit6  "Duration of other injury: Time unit";
label variable ladura6  "Duration of other injury (in years)";
label variable ladurb6  "Duration of other injury recode 2";
label variable lachrc6  "Other injury condition status";
label variable latime7  "Duration of heart prob: # of units";
label variable launit7  "Duration of heart prob: Time unit";
label variable ladura7  "Duration of heart prob (in years)";
label variable ladurb7  "Duration of heart prob recode 2";
label variable lachrc7  "Heart problem condition status";
label variable latime8  "Duration of stroke: # of units";
label variable launit8  "Duration of stroke: Time unit";
label variable ladura8  "Duration of stroke (in years)";
label variable ladurb8  "Duration of stroke recode 2";
label variable lachrc8  "Stroke condition status";
label variable latime9  "Duration of hypertension: # of units";
label variable launit9  "Duration of hypertension: Time unit";
label variable ladura9  "Duration of hypertension (in years)";
label variable ladurb9  "Duration of hypertension recode 2";
label variable lachrc9  "Hypertension condition status";
label variable latime10 "Duration of diabetes: # of units";
label variable launit10 "Duration of diabetes: Time unit";
label variable ladura10 "Duration of diabetes (in years)";
label variable ladurb10 "Duration of diabetes recode 2";
label variable lachrc10 "Diabetes condition status";
label variable latime11 "Duration of lung/breath prob: # of units";
label variable launit11 "Duration of lung/breath prob: Time unit";
label variable ladura11 "Duration of lung/breath prob (in years)";
label variable ladurb11 "Duration of lung/breath prob recode 2";
label variable lachrc11 "Lung/breath prob condition status";
label variable latime12 "Duration of cancer: # of units";
label variable launit12 "Duration of cancer: Time unit";
label variable ladura12 "Duration of cancer (in years)";
label variable ladurb12 "Duration of cancer recode 2";
label variable lachrc12 "Cancer condition status";
label variable latime13 "Duration of birth defect: # of units";
label variable launit13 "Duration of birth defect: Time unit";
label variable ladura13 "Duration of birth defect (in years)";
label variable ladurb13 "Duration of birth defect recode 2";
label variable lachrc13 "Birth defect condition status";
label variable latime14 "Dur of mental retardation: # of units";
label variable launit14 "Dur of mental retardation: Time unit";
label variable ladura14 "Dur of mental retardation (in years)";
label variable ladurb14 "Duration of mental retardation recode 2";
label variable lachrc14 "Mental retardation condition status";
label variable latime15 "Duration of otr dev prob: # of units";
label variable launit15 "Duration of otr dev prob: Time unit";
label variable ladura15 "Duration of otr dev prob (in years)";
label variable ladurb15 "Duration of otr dev prob recode 2";
label variable lachrc15 "Otr dev problem condition status";
label variable latime16 "Duration of senility: # of units";
label variable launit16 "Duration of senility: Time unit";
label variable ladura16 "Duration of senility (in years)";
label variable ladurb16 "Duration of senility recode 2";
label variable lachrc16 "Senility condition status";
label variable latime17 "Dur of dep/anx/emot prob: # of units";
label variable launit17 "Duration of dep/anx/emot prob: Time unit";
label variable ladura17 "Duration of dep/anx/emot prob (in years)";
label variable ladurb17 "Duration of dep/anx/emot prob recode 2";
label variable lachrc17 "Dep/anx/emot problem condition status";
label variable latime18 "Duration of weight prob: # of units";
label variable launit18 "Duration of weight prob: Time unit";
label variable ladura18 "Duration of weight prob (in years)";
label variable ladurb18 "Duration of weight prob recode 2";
label variable lachrc18 "Weight problem condition status";
label variable latime19 "Dur of miss limb/amputation: # of units";
label variable launit19 "Dur of miss limb/amputation: Time unit";
label variable ladura19 "Dur of miss limb/amputation (in years)";
label variable ladurb19 "Dur of miss limb/amputation recode 2";
label variable lachrc19 "Missing limb/amputation condition status";
label variable latime20 "Dur of musculoskeletal prob: # of units";
label variable launit20 "Dur of musculoskeletal prob: Time unit";
label variable ladura20 "Dur of musculoskeletal prob: (in years)";
label variable ladurb20 "Dur of musculoskeletal prob recode 2";
label variable lachrc20 "Musculoskeletal problem condition status";
label variable latime21 "Duration of circulatory prob: # of units";
label variable launit21 "Duration of circulatory prob: Time unit";
label variable ladura21 "Duration of circulatory prob (in years)";
label variable ladurb21 "Duration of circulatory prob recode 2";
label variable lachrc21 "Circulatory problem condition status";
label variable latime22 "Duration of endocrine prob: # of units";
label variable launit22 "Duration of endocrine problem: Time unit";
label variable ladura22 "Duration of endocrine problem (in years)";
label variable ladurb22 "Duration of endocrine problem recode 2";
label variable lachrc22 "Endocrine problem condition status";
label variable latime23 "Duration of nervous sys cond: # of units";
label variable launit23 "Duration of nervous sys cond: Time unit";
label variable ladura23 "Duration of nervous sys cond (in years)";
label variable ladurb23 "Duration of nervous sys cond recode 2";
label variable lachrc23 "Nervous sys condition status";
label variable latime24 "Dur of digestive prob: # of units";
label variable launit24 "Dur of digestive prob: Time unit";
label variable ladura24 "Dur of digestive prob (in years)";
label variable ladurb24 "Duration of digestive prob recode 2";
label variable lachrc24 "Digestive problem condition status";
label variable latime25 "Dur of genitourinary prob: # of units";
label variable launit25 "Dur of genitourinary prob: Time unit";
label variable ladura25 "Dur of genitourinary prob (in years)";
label variable ladurb25 "Duration of genitourinary prob recode 2";
label variable lachrc25 "Genitourinary prob condition status";
label variable latime26 "Duration of skin problem: # of units";
label variable launit26 "Duration of skin problem: Time unit";
label variable ladura26 "Duration of skin problem (in years)";
label variable ladurb26 "Duration of skin problem recode 2";
label variable lachrc26 "Skin problem condition status";
label variable latime27 "Duration of blood problem: # of units";
label variable launit27 "Duration of blood problem: Time unit";
label variable ladura27 "Duration of blood problem (in years)";
label variable ladurb27 "Blood problem recode 2";
label variable lachrc27 "Blood problem condition status";
label variable latime28 "Duration of benign tumor: # of units";
label variable launit28 "Duration of benign tumor: Time unit";
label variable ladura28 "Duration of benign tumor (in years)";
label variable ladurb28 "Duration of benign tumor recode 2";
label variable lachrc28 "Benign tumor condition status";
label variable latime29 "Dur of alcohol/drug prob: # of units";
label variable launit29 "Duration of alcohol/drug prob: Time unit";
label variable ladura29 "Duration of alcohol/drug prob (in years)";
label variable ladurb29 "Duration of alcohol/drug prob recode 2";
label variable lachrc29 "Alcohol or drug prob condition status";
label variable latime30 "Duration of oth mental prob: # of units";
label variable launit30 "Duration of oth mental prob: Time unit";
label variable ladura30 "Duration of oth mental prob (in years)";
label variable ladurb30 "Duration of oth mental prob recode 2";
label variable lachrc30 "Oth mental prob condition status";
label variable latime31 "Dur of surg after-effects: # of units";
label variable launit31 "Dur of surg after-effects: Time unit";
label variable ladura31 "Dur of surg after-effects (in years)";
label variable ladurb31 "Duration of surg after-effects recode 2";
label variable lachrc31 "Surgical after-effects condition status";
label variable latime32 "Duration of 'old age': # of units";
label variable launit32 "Duration of 'old age': Time unit";
label variable ladura32 "Duration of 'old age' (in years)";
label variable ladurb32 "Duration of 'old age' recode 2";
label variable lachrc32 "'Old age' condition status";
label variable latime33 "Duration of fatigue prob: # of units";
label variable launit33 "Duration of fatigue prob: Time unit";
label variable ladura33 "Duration of fatigue prob (in years)";
label variable ladurb33 "Duration of fatigue prob recode 2";
label variable lachrc33 "Fatigue problem condition status";
label variable latime34 "Dur of preg-related prob: # of units";
label variable launit34 "Duration of preg-related prob: Time unit";
label variable ladura34 "Duration of preg-related prob (in years)";
label variable ladurb34 "Duration of preg-related prob recode 2";
label variable lachrc34 "Pregnancy-related prob condition status";
label variable latime90 "Dur of oth N.E.C. prob (1): # of units";
label variable launit90 "Dur of oth N.E.C. prob (1): Time unit";
label variable ladura90 "Dur of oth N.E.C. prob (1) (in years)";
label variable ladurb90 "Dur of oth N.E.C. prob (1) recode 2";
label variable lachrc90 "Other N.E.C. prob (1) condition status";
label variable latime91 "Dur of oth N.E.C. prob (2): # of units";
label variable launit91 "Dur of oth N.E.C. prob (2): Time unit";
label variable ladura91 "Dur of oth N.E.C. prob (2) (in years)";
label variable ladurb91 "Dur of oth N.E.C. prob (2) recode 2";
label variable lachrc91 "Other N.E.C. prob (2) condition status";
label variable lcondrt  "Chronic cond rec for person with LA";
label variable lachronr "Lim of activ recode by chron cond status";
label variable phstat   "Reported health status";
 
label variable pdmed12m "Was med care delayed for - - (cost), 12m";
label variable pnmed12m "Did--need+NOT get med care (cost), 12m";
label variable phospyr  "Was - - in a hospital OVERNIGHT, 12m";
label variable hospno   "Number of times in hosp overnight, 12m";
label variable hpnite   "Number of nights in hospital, 12m";
label variable phchm2w  "Did - - rec HOME care by hlth prof, 2 wk";
label variable phchmn2w "Number of HOME visits by hlth prof, 2wk";
label variable phcph2wr "Did--get adv/test results by phone, 2wk";
label variable phcphn2w "Number of PHONE calls to hlth prof, 2wk";
label variable phcdv2w  "Did - - see hlth prof in office etc, 2wk";
label variable phcdvn2w "Number of times VISITED hlth prof, 2wk";
label variable p10dvyr  "Did - - receive care 10+ times, 12m";
 
label variable hikinda  "Private hlth ins from employer or work";
label variable hikindb  "Private hlth ins purchased directly";
label variable hikindc  "Private health insurance through gov/com";
label variable hikindd  "Medicare";
label variable hikinde  "Medi-Gap";
label variable hikindf  "Medicaid";
label variable hikindg  "Children's Health Insurance Program";
label variable hikindh  "Military hlth care/VA";
label variable hikindi  "TRICARE/CHAMPUS/CHAMP-VA";
label variable hikindj  "Indian Health Service";
label variable hikindk  "State-sponsored health plan";
label variable hikindl  "Other government program";
label variable hikindm  "Single service plan";
label variable hikindn  "No Health Insurance";
label variable medicare "Medicare coverage recode";
label variable mcpart   "Type of Medicare coverage";
label variable mcchoice "Enrolled in Medicare Plus Choice";
label variable mchmo    "Is - - signed up with an HMO?";
label variable mcname   "Type of Medicare HMO";
label variable mcref    "Need a referral for special care";
label variable mcpaypre "More comprehensive benefit plan";
label variable medicaid "Medicaid coverage recode";
label variable machmd   "Any doc, choose from list, doc assigned";
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
label variable private  "Private health insurance coverage recode";
label variable hitype1  "Name of plan (Plan 1)";
label variable whonam1  "Plan in whose name (Plan 1)";
label variable plnwrk1  "Originally thrgh work or union (Plan 1)";
label variable plnpay11 "Paid for by self or family (Plan 1)";
label variable plnpay21 "Paid for by employer or union (Plan 1)";
label variable plnpay31 "Paid by someone outside household Plan 1";
label variable plnpay41 "Paid for by Medicare (Plan 1)";
label variable plnpay51 "Paid for by Medicaid (Plan 1)";
label variable plnpay61 "Paid for by CHIP (Plan 1)";
label variable plnpay71 "Paid for by government program (Plan 1)";
label variable hicostr1 "Out-of-pocket premium cost (Plan 1)";
label variable plnmgd1  "Type of plan (Plan 1)";
label variable mgchmd1  "Doctor choice (Plan 1)";
label variable mgprmd1  "Preferred list (Plan 1)";
label variable mgpymd1  "Out of plan use (Plan 1)";
label variable mgpref1  "Private referral (plan 1)";
label variable hitype2  "Name of plan (Plan 2)";
label variable whonam2  "Plan in whose name (Plan 2)";
label variable plnwrk2  "Originally thrgh work or union (Plan 2)";
label variable plnpay12 "Paid for by self or family (Plan 2)";
label variable plnpay22 "Paid for by employer or union (Plan 2)";
label variable plnpay32 "Paid by someone outside household Plan 2";
label variable plnpay42 "Paid for by Medicare (Plan 2)";
label variable plnpay52 "Paid for by Medicaid (Plan 2)";
label variable plnpay62 "Paid for by CHIP (Plan 2)";
label variable plnpay72 "Paid for by government program (Plan 2)";
label variable hicostr2 "Out-of-pocket premium cost (Plan 2)";
label variable plnmgd2  "Type of plan (Plan 2)";
label variable mgchmd2  "Doctor choice (Plan 2)";
label variable mgprmd2  "Preferred list (Plan 2)";
label variable mgpymd2  "Out of plan use (Plan 2)";
label variable mgpref2  "Private referral (plan 2)";
label variable hitype3  "Name of plan (Plan 3)";
label variable whonam3  "Plan in whose name (Plan 3)";
label variable plnwrk3  "Originally thrgh work or union (Plan 3)";
label variable plnpay13 "Paid for by self or family (Plan 3)";
label variable plnpay23 "Paid for by employer or union (Plan 3)";
label variable plnpay33 "Paid by someone outside household Plan 3";
label variable plnpay43 "Paid for by Medicare (Plan 3)";
label variable plnpay53 "Paid for by Medicaid (Plan 3)";
label variable plnpay63 "Paid for by CHIP (Plan 3)";
label variable plnpay73 "Paid for by government program (Plan 3)";
label variable hicostr3 "Out-of-pocket premium cost (Plan 3)";
label variable plnmgd3  "Type of plan (Plan 3)";
label variable mgchmd3  "Doctor choice (Plan 3)";
label variable mgprmd3  "Preferred list (Plan 3)";
label variable mgpymd3  "Out of plan use (Plan 3)";
label variable mgpref3  "Private referral (plan 3)";
label variable hitype4  "Name of plan (Plan 4)";
label variable whonam4  "Plan in whose name (Plan 4)";
label variable plnwrk4  "Originally thrgh work or union (Plan 4)";
label variable plnpay14 "Paid for by self or family (Plan 4)";
label variable plnpay24 "Paid for by employer or union (Plan 4)";
label variable plnpay34 "Paid by someone outside household Plan 4";
label variable plnpay44 "Paid for by Medicare (Plan 4)";
label variable plnpay54 "Paid for by Medicaid (Plan 4)";
label variable plnpay64 "Paid for by CHIP (Plan 4)";
label variable plnpay74 "Paid for by government program (Plan 4)";
label variable hicostr4 "Out-of-pocket premium cost (Plan 4)";
label variable plnmgd4  "Type of plan (Plan 4)";
label variable mgchmd4  "Doctor choice (Plan 4)";
label variable mgprmd4  "Preferred list (Plan 4)";
label variable mgpymd4  "Out of plan use (Plan 4)";
label variable mgpref4  "Private referral (plan 4)";
label variable ihs      "Indian Health Service Recode";
label variable military "Military coverage recode";
label variable chip     "Children's Hlth Ins Program Recode";
label variable otherpub "Other State-Sponsored Health Plan Recode";
label variable othergov "Other government programs Recode";
label variable notcov   "Cov stat as used in Health United States";
label variable hilast   "How long since last had hlth coverage";
label variable histop1  "Lost job or changed employers";
label variable histop2  "Divorced/sep/death of spouse or parent";
label variable histop3  "Ineligible because of age/left school";
label variable histop4  "Employer not offer/not eligible for cov";
label variable histop5  "Cost is too high";
label variable histop6  "Insurance company refused coverage";
label variable histop7  "Medicaid/Medi plan stop after pregnancy";
label variable histop8  "Lost Medicaid new job/increase in income";
label variable histop9  "Lost Medicaid (other)";
label variable histop10 "Other";
label variable histop11 "Never had health insurance";
label variable histop12 "Moved from another county/state/country";
label variable histop13 "Self-employed";
label variable histop14 "No need for it/chooses not to have";
label variable histop15 "Got married";
label variable hinotyr  "No hlth coverage during past 12 months";
label variable hinotmyr "Months without coverage in past 12 month";
label variable hcspfyr  "Amount family spent for medical care";
 
label variable regionbr "Geographic region of birth recode";
label variable geobrth  "Geographic place of birth recode";
label variable yrsinus  "Years that -- has been in the U.S.";
label variable citizenp "Citizenship Status";
label variable headst   "Now attending Head Start?";
label variable headstv1 "Ever attended Head Start?";
label variable educ     "Highest level of school completed";
label variable educ_r1  "Education Recode";
label variable miltryds "Ever honorably discharged (active duty)?";
label variable doinglw1 "What was -- doing last week?";
label variable whynowk1 "Main reason for not working last week";
label variable wrkhrs   "Total hrs worked last week/usually";
label variable wrkftall "Does -- usually work full time?";
label variable wrklyr1  "Did -- work for pay in last year?";
label variable wrkmyr   "Months in {last yr} person had 1+ jobs";
label variable majr_act "Major activity in last week";
label variable ernyr_p  "{Person's} total earnings in 2001";
label variable hiempof  "Was health ins offered thru workplace?";
 
label variable psal     "Rec inc from wage/sal (last CY)";
label variable pseinc   "Rec inc from self-employ (last CY)";
label variable pssrr    "Rec inc from SS or RR (last CY)";
label variable pssrrdb  "Rec'd SS or RR a disability benefit";
label variable pssrrd   "Rec'd benefit due to disability";
label variable ppens    "Rec inc from otr disab pens (last CY)";
label variable popens   "Rec inc from any otr pension (last CY)";
label variable pssi     "Rec'd inc from SSI (last calendar year)";
label variable pssid    "Rec'd SSI due to disability";
label variable ptanf    "Rec'd inc from Welfare/TANF (last CY)";
label variable powben   "Rec'd otr govt assistance (last CY)";
label variable pintrstr "Rec int fr sav/bank accts (last Cal Yr)";
label variable pdivd    "Rec div from stocks/funds/etc. (last CY)";
label variable pchldsp  "Rec inc from child support (last CY)";
label variable pincot   "Rec inc from any otr source (last CY)";
label variable incgrp   "Total Combined Family Income (Grouped)";
label variable ab_bl20k "Fam inc at/above vs. below $20,000";
label variable rat_cat  "Ratio of fam inc to poverty threshold";
label variable houseown "Home Tenure Status";
label variable fgah     "Paying lower rent due to govt prgm";
label variable pssapl   "Ever applied for SSI";
label variable psdapl   "Ever applied for SSDI";
label variable tanfmyr  "Months rec Welfare/TANF (last CY)";
label variable pfstp    "Author to rec food stmps (last CY)";
label variable fstpmyr  "Months rec food stamps (last CY)";
label variable eligpwic "Anyone age-eligible for the WIC program?";
label variable pwic     "Rec'd WIC benefits (last CY)";
label variable wic_flag "WIC recipient age-eligible";

* DEFINE VALUE LABELS FOR REPORTS;

label define pep001x
   20               "20 Person"
;
label define pep002x
   2002             "2002"
;
label define pep006x
   1                "1 Quarter 1"
   2                "2 Quarter 2"
   3                "3 Quarter 3"
   4                "4 Quarter 4"
;
label define pep007x
   1                "1 Male"
   2                "2 Female"
;
label define pep008x
   00               "00 Under 1 year"
   85               "85 85+ years"
;
label define pep009x
   1                "1 Under 5 years"
   2                "2 5-17 years"
   3                "3 18-24 years"
   4                "4 25-44 years"
   5                "5 45-64 years"
   6                "6 65-69 years"
   7                "7 70-74 years"
   8                "8 75 years and over"
;
label define pep010x
   1                "1 Under 6 years"
   2                "2 6-16 years"
   3                "3 17-24 years"
   4                "4 25-34 years"
   5                "5 35-44 years"
   6                "6 45-54 years"
   7                "7 55-64 years"
   8                "8 65-74 years"
   9                "9 75 years and over"
;
label define pep013x
   1                "1 Yes"
   2                "2 No"
;
label define pep014x
   1                "1 Imputed 'refused' Hispanic Origin response"
   2                "2 Imputed 'not ascertained' Hispanic Origin"
   3                "3 Imputed 'does not know' Hispanic Origin"
   4                "4 Hispanic origin given by respondent/proxy"
;
label define pep015x
   00               "00 Multiple Hispanic"
   01               "01 Puerto Rican"
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
label define pep016x
   1                "1 Imputed 'refused' Hispanic Origin type"
   2                "2 Imputed 'not ascertained' Hispanic Origin type"
   3                "3 Imputed 'does not know' Hispanic Origin type"
   4                "4 Hispanic Origin type given by respondent/proxy"
;
label define pep017x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN only"
   09               "09 Asian Indian only"
   10               "10 Chinese only"
   11               "11 Filipino only"
   15               "15 Other Asian only"
   16               "16 Other race only"
   17               "17 Multiple detailed race*"
;
label define pep018x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN only*"
   04               "04 Asian only"
   05               "05 Other race only"
   06               "06 Multiple detailed race only"
;
label define pep019x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN* only"
   04               "04 Asian only"
   05               "05 Other race only"
   06               "06 Multiple race"
;
label define pep020x
   1                "1 Imputed 'refused' race response"
   2                "2 Imputed 'not ascertained' race response"
   3                "3 Imputed 'does not know' race response"
   4                "4 Race given by respondent/proxy"
;
label define pep021x
   01               "01 White"
   02               "02 Black/African American"
   03               "03 Indian (American), Alaska Native"
   09               "09 Asian Indian"
   10               "10 Chinese"
   11               "11 Filipino"
   15               "15 Other Asian*"
   16               "16 Other Race*"
   17               "17 Multiple Race*"
;
label define pep022x
   01               "01 White"
   02               "02 Black/African American"
   03               "03 Indian (American) (includes Eskimo, Aleut)"
   06               "06 Chinese"
   07               "07 Filipino"
   12               "12 Asian Indian"
   16               "16 Other race"
   17               "17 Multiple race"
;
label define pep023x
   1                "1 White"
   2                "2 Black"
   3                "3 Other"
;
label define pep024x
   1                "1 Hispanic"
   2                "2 Non-Hispanic White"
   3                "3 Non-Hispanic Black"
   4                "4 Non-Hispanic Other"
;
label define pep025x
   1                "1 Ethnicity/race imputed"
   2                "2 Ethnicity/race given by respondent/proxy"
;
label define pep026x
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
label define pep027x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep028x
   1                "1 Married"
   2                "2 Widowed"
   3                "3 Divorced"
   4                "4 Separated"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep029x
   1                "1 Married, spouse in household"
   2                "2 Married, spouse not in household"
   3                "3 Married, spouse in household unknown"
   4                "4 Widowed"
   5                "5 Divorced"
   6                "6 Separated"
   7                "7 Never Married"
   9                "9 Unknown marital status"
;
label define pep030x
   1                "1 Separated"
   2                "2 Divorced"
   3                "3 Married"
   4                "4 Single/never married"
   5                "5 Widowed"
   9                "9 Unknown marital status"
;
label define pep031x
   01               "01 Household reference person"
   02               "02 Spouse (husband/wife)"
   03               "03 Unmarried Partner"
   04               "04 Child (biological/adoptive/in-law/step/foster)"
   05               "05 Child of partner"
   06               "06 Grandchild"
   07               "07 Parent (bio./adoptive/in-law/step/foster)"
   08               "08 Brother/sister (bio./adop./in-law/step/foster)"
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
   99               "99 Don't know"
;
label define pep034x
   01               "01 Family reference person"
   02               "02 Spouse (husband/wife)"
   03               "03 Unmarried Partner"
   04               "04 Child (biological/adoptive/in-law/step/foster)"
   05               "05 Child of partner"
   06               "06 Grandchild"
   07               "07 Parent (bio./adoptive/in-law/step/foster)"
   08               "08 Brother/sister (bio./adop./in-law/step/foster)"
   09               "09 Grandparent (Grandmother/Grandfather)"
   10               "10 Aunt/Uncle"
   11               "11 Niece/Nephew"
   12               "12 Other relative"
   16               "16 Legal guardian"
   17               "17 Ward"
   97               "97 Refused"
   99               "99 Don't know"
;
label define pep037x
   98               "98 Not ascertained"
;
label define pep039x
   1                "1 Full  {brother/sister}"
   2                "2 Half {brother/sister}"
   3                "3 Adopted {brother/sister}"
   4                "4 Step {brother/sister}"
   5                "5 Foster {brother/sister}"
   6                "6 {brother/sister}-in-law"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep041x
   1                "1 Biological"
   2                "2 Step"
   3                "3 Adoptive"
   4                "4 Foster"
   5                "5 In-law"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep045x
   1                "1 Mother, no father"
   2                "2 Father, no mother"
   3                "3 Mother and father"
   4                "4 Neither mother nor father"
   9                "9 Unknown"
;
label define pep046x
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
label define pep049x
   1                "1 One adult, no child(ren) under 18"
   2                "2 Multiple adults, no child(ren) under 18"
   3                "3 One adult, 1+ child(ren) under 18"
   4                "4 Multiple adults, 1+ child(ren) under 18"
   9                "9 Unknown"
;
label define pep052x
   1                "1 Armed Forces"
   2                "2 Not Armed Forces"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep053x
   0                "0 Sample Adult - no record"
   1                "1 Sample Adult - has record"
   2                "2 Not selected as Sample Adult"
   3                "3 No one selected as Sample Adult"
   4                "4 Armed Force member"
   5                "5 Armed Force member - selected as Sample Adult"
;
label define pep054x
   0                "0 Sample Child - no record"
   1                "1 Sample Child - has record"
   2                "2 Not selected as Sample Child"
   3                "3 No one selected as Sample Child"
   4                "4 Emancipated Minor"
;
label define pep055x
   0                "0 Immunization Child - no record"
   1                "1 Immunization Child - has record"
   2                "2 Not eligible for immunization questions"
;
label define pep056x
   1                "1 Northeast"
   2                "2 Midwest"
   3                "3 South"
   4                "4 West"
;
label define pep074x
   0                "0 Unable to work"
   1                "1 Limited in work"
   2                "2 Not limited in work"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep075x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep077x
   0                "0 Limitation previously mentioned"
   1                "1 Yes, limited in some other way"
   2                "2 Not limited in any way"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep078x
   1                "1 Limited in any way"
   2                "2 Not limited in any way"
   3                "3 Unknown if limited"
;
label define pep079x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   6                "6 No condition at all"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep094x
   95               "95 95+"
   96               "96 Since birth"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep095x
   1                "1 Day(s)"
   2                "2 Week(s)"
   3                "3 Month(s)"
   4                "4 Year(s)"
   6                "6 Since birth"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep096x
   00               "00 Less than 1 year"
   96               "96 Unknown number of years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep097x
   0                "0 Since birth and child < 1 year of age"
   1                "1 Less than 3 months"
   2                "2 3 - 5 months"
   3                "3 6 - 12 months"
   4                "4 More than 1 year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep098x
   1                "1 Chronic"
   2                "2 Not chronic"
   9                "9 Unknown if chronic"
;
label define pep207x
   00               "00 Less than 1 year"
   85               "85 85+ years"
   96               "96 Unknown number of years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep208x
   1                "1 Less than 3 months"
   2                "2 3 - 5 months"
   3                "3 6 - 12 months"
   4                "4 More than 1 year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep385x
   1                "1 At least one condition causing LA is chronic"
   2                "2 No condition causing LA is chronic"
   9                "9 Unk if any condition causing LA is chronic"
;
label define pep386x
   0                "0 Not limited in any way (incl unk if limited)"
   1                "1 Limited; caused by at least one chronic cond"
   2                "2 Limited; not caused by chronic cond"
   3                "3 Limited; unk if cond causing LA is chronic"
;
label define pep387x
   1                "1 Excellent"
   2                "2 Very good"
   3                "3 Good"
   4                "4 Fair"
   5                "5 Poor"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep391x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define pep392x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define pep394x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep396x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep398x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep400x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep414x
   1                "1 Yes, information"
   2                "2 Yes, but no information"
   3                "3 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep415x
   1                "1 Part A - Hospital Only"
   2                "2 Part B - Medical Only"
   3                "3 Both Part A and Part B"
   4                "4 Card Not Available"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep418x
   04               "04 Medigap plan"
   12               "12 Group"
   22               "22 Staff"
   32               "32 IPA"
   92               "92 Other"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep422x
   1                "1 Any doctor"
   2                "2 Select from a book/list"
   3                "3 Doctor is assigned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep425x
   1                "1 Yes with information"
   2                "2 Yes with no information"
   3                "3 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep426x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep439x
   98               "98 Not ascertained"
   99               "99 Unknown"
;
label define pep440x
   1                "1 In own name"
   2                "2 Someone else in family"
   3                "3 Person not in household"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep441x
   1                "1 Employer"
   2                "2 Union"
   3                "3 Through work, but DK if employer or union"
   4                "4 Through work, self-employ or prof assoc"
   5                "5 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep449x
   20000            "20000 $20,000 or more"
   99997            "99997 Refused"
   99998            "99998 Not ascertained"
   99999            "99999 Don't know"
;
label define pep450x
   1                "1 HMO/IPA"
   2                "2 PPO"
   3                "3 POS"
   4                "4 Fee-for-service/indemnity"
   5                "5 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep451x
   1                "1 Any doctor"
   2                "2 Select from group/list"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep504x
   1                "1 Yes, Military/VA only"
   2                "2 Yes, TRICARE/CHAMPUS/CHAMP-VA only"
   3                "3 Yes Both Military/VA + TRICARE/CHAMPUS/CHAMP-VA"
   4                "4 Yes unknown type"
   5                "5 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep508x
   1                "1 Not covered"
   2                "2 Covered"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep509x
   1                "1 6 months or less"
   2                "2 More than 6 months, but not more than 1 year ago"
   3                "3 More than 1 year, but not more than 3 years ago"
   4                "4 More than 3 years"
   5                "5 Never"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep526x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep527x
   0                "0 Zero"
   1                "1 Less than $500"
   2                "2 $500-$1,999"
   3                "3 $2,000-$2,999"
   4                "4 $3,000-$4,999"
   5                "5 $5,000 or more"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define pep528x
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
label define pep529x
   1                "1 USA: born in one of the 50 United States or D.C"
   2                "2 USA: born in a U.S. territory"
   3                "3 Not born in the U.S. or a U.S. territory"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep530x
   1                "1 Less than 1 year"
   2                "2 1 yr., less than 5 yrs."
   3                "3 5 yrs., less than 10 yrs."
   4                "4 10 yrs., less than 15 yrs."
   5                "5 15 years or more"
   9                "9 Unknown"
;
label define pep531x
   1                "1 Yes, citizen of the United States"
   2                "2 No, not a citizen of the United States"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep534x
   00               "00 Never attended/ kindergarten only"
   12               "12 12th grade, no diploma"
   13               "13 HIGH SCHOOL GRADUATE"
   14               "14 GED or equivalent"
   15               "15 Some college, no degree"
   16               "16 AA degree: technical or vocational"
   17               "17 AA degree: academic program"
   18               "18 Bachelor's degree (BA, AB, BS, BBA)"
   19               "19 Master's degree (MA, MS, MEng, MEd, MBA)"
   20               "20 Professional degree (MD, DDS, DVM, JD)"
   21               "21 Doctoral degree (PhD, EdD)"
   96               "96 Child under 5 years old"
   97               "97 Refused"
   98               "98 Not Ascertained"
   99               "99 Don't know"
;
label define pep535x
   01               "01 Less/equal to 8th grade"
   02               "02 9-12th grade, no high school diploma"
   03               "03 High school graduate"
   04               "04 GED recipient"
   05               "05 Some college, no degree"
   06               "06 AA degree, technical or vocational"
   07               "07 AA degree, academic program"
   08               "08 Bachelor's degree (BA, BS, AB, BBA)"
   09               "09 Master's, professional, or doctoral degree"
   96               "96 Child under 5 years of age"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep537x
   1                "1 Working for pay at a job or business"
   2                "2 With a job or business but not at work"
   3                "3 Looking for work"
   4                "4 Working, but not for pay, at a job or business"
   5                "5 Not working and not looking for work"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep538x
   01               "01 Taking care of house or family"
   02               "02 Going to school"
   03               "03 Retired"
   04               "04 On a planned vacation from work"
   05               "05 On family or maternity leave"
   06               "06 Temporarily unable to work for health reasons"
   07               "07 On layoff"
   08               "08 Disabled"
   09               "09 Have job/contract; off-season"
   10               "10 Other"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep539x
   95               "95 95+ hours"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep543x
   1                "1 Working at a job or business"
   2                "2 Keeping house"
   3                "3 Going to school"
   4                "4 Something else"
   5                "5 Unknown"
;
label define pep544x
   01               "01 $01-$4999"
   02               "02 $5000-$9999"
   03               "03 $10000-$14999"
   04               "04 $15000-$19999"
   05               "05 $20000-$24999"
   06               "06 $25000-$34999"
   07               "07 $35000-$44999"
   08               "08 $45000-$54999"
   09               "09 $55000-$64999"
   10               "10 $65000-$74999"
   11               "11 $75000 and over"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep561x
   01               "01 0-$4999"
   02               "02 $5000-$9999"
   03               "03 $10000-$14999"
   04               "04 $15000-$19999"
   05               "05 $20000-$24999"
   06               "06 $25000-$34999"
   07               "07 $35000-$44999"
   08               "08 $45000-$54999"
   09               "09 $55000-$64999"
   10               "10 $65000-$74999"
   11               "11 $75000 and over"
   12               "12 $20000 or more (no detail)"
   13               "13 Less than $20000 (no detail)"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep562x
   1                "1 $20,000 or more"
   2                "2 Less than $20,000"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep563x
   01               "01 Under .50"
   02               "02 .50 to .74"
   03               "03 .75 to .99"
   04               "04 1.00 to 1.24"
   05               "05 1.25 to 1.49"
   06               "06 1.50 to 1.74"
   07               "07 1.75 to 1.99"
   08               "08 2.00 to 2.49"
   09               "09 2.50 to 2.99"
   10               "10 3.00 to 3.49"
   11               "11 3.50 to 3.99"
   12               "12 4.00 to 4.49"
   13               "13 4.50 to 4.99"
   14               "14 5.00 and over"
   96               "96 Undefinable"
   99               "99 Unknown"
;
label define pep564x
   1                "1 Owned or being bought"
   2                "2 Rented"
   3                "3 Other arrangement"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep568x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep571x
   0                "0 No WIC age-eligible family members"
   1                "1 At least 1 WIC age-eligible family member"
;
label define pep573x
   0                "0 Person not age-eligible"
   1                "1 Person age-eligible"
;

* ASSOCIATE VARIABLES WITH LABEL DEFINITIONS;

label values rectype   pep001x;   label values srvy_yr   pep002x;
label values intv_qrt  pep006x;   label values sex       pep007x;
label values age_p     pep008x;   label values r_age1    pep009x;
label values r_age2    pep010x;   label values origin_i  pep013x;
label values origimpt  pep014x;   label values hispan_i  pep015x;
label values hispimpt  pep016x;   label values rcdt1p_i  pep017x;
label values rc_smp_i  pep018x;   label values racerp_i  pep019x;
label values raceimpt  pep020x;   label values mracrp_i  pep021x;
label values mracbp_i  pep022x;   label values racrec_i  pep023x;
label values hiscod_i  pep024x;   label values erimpflg  pep025x;
label values r_maritl  pep026x;   label values cohab1    pep027x;
label values cohab2    pep028x;   label values lg_mstat  pep029x;
label values cdcmstat  pep030x;   label values rrp       pep031x;
label values frrp      pep034x;   label values fm_resp   pep037x;
label values sib_deg   pep039x;   label values mom_deg   pep041x;
label values dad_deg   pep041x;   label values parents   pep045x;
label values mom_ed    pep046x;   label values dad_ed    pep046x;
label values fm_type   pep049x;   label values nowaf     pep052x;
label values astatflg  pep053x;   label values cstatflg  pep054x;
label values immunflg  pep055x;   label values region    pep056x;

label values plaplylm  pep027x;   label values plaplyun  pep027x;
label values pspedeis  pep027x;   label values pspedem   pep027x;
label values plaadl    pep027x;   label values labath    pep027x;
label values ladress   pep027x;   label values laeat     pep027x;
label values labed     pep027x;   label values latoilt   pep027x;
label values lahome    pep027x;   label values plaiadl   pep027x;
label values plawknow  pep027x;   label values plawklim  pep074x;
label values plawalk   pep075x;   label values plaremem  pep075x;
label values plimany   pep077x;   label values la1ar     pep078x;
label values lahcc1    pep079x;   label values lahcc2    pep079x;
label values lahcc3    pep079x;   label values lahcc4    pep079x;
label values lahcc5    pep079x;   label values lahcc6    pep079x;
label values lahcc7    pep079x;   label values lahcc8    pep079x;
label values lahcc9    pep079x;   label values lahcc10   pep079x;
label values lahcc11   pep079x;   label values lahcc12   pep079x;
label values lahcc13   pep079x;   label values lahcc90   pep079x;
label values lahcc91   pep079x;   label values lctime1   pep094x;
label values lcunit1   pep095x;   label values lcdura1   pep096x;
label values lcdurb1   pep097x;   label values lcchrc1   pep098x;
label values lctime2   pep094x;   label values lcunit2   pep095x;
label values lcdura2   pep096x;   label values lcdurb2   pep097x;
label values lcchrc2   pep098x;   label values lctime3   pep094x;
label values lcunit3   pep095x;   label values lcdura3   pep096x;
label values lcdurb3   pep097x;   label values lcchrc3   pep098x;
label values lctime4   pep094x;   label values lcunit4   pep095x;
label values lcdura4   pep096x;   label values lcdurb4   pep097x;
label values lcchrc4   pep098x;   label values lctime5   pep094x;
label values lcunit5   pep095x;   label values lcdura5   pep096x;
label values lcdurb5   pep097x;   label values lcchrc5   pep098x;
label values lctime6   pep094x;   label values lcunit6   pep095x;
label values lcdura6   pep096x;   label values lcdurb6   pep097x;
label values lcchrc6   pep098x;   label values lctime7   pep094x;
label values lcunit7   pep095x;   label values lcdura7   pep096x;
label values lcdurb7   pep097x;   label values lcchrc7   pep098x;
label values lctime8   pep094x;   label values lcunit8   pep095x;
label values lcdura8   pep096x;   label values lcdurb8   pep097x;
label values lcchrc8   pep098x;   label values lctime9   pep094x;
label values lcunit9   pep095x;   label values lcdura9   pep096x;
label values lcdurb9   pep097x;   label values lcchrc9   pep098x;
label values lctime10  pep094x;   label values lcunit10  pep095x;
label values lcdura10  pep096x;   label values lcdurb10  pep097x;
label values lcchrc10  pep098x;   label values lctime11  pep094x;
label values lcunit11  pep095x;   label values lcdura11  pep096x;
label values lcdurb11  pep097x;   label values lcchrc11  pep098x;
label values lctime12  pep094x;   label values lcunit12  pep095x;
label values lcdura12  pep096x;   label values lcdurb12  pep097x;
label values lcchrc12  pep098x;   label values lctime13  pep094x;
label values lcunit13  pep095x;   label values lcdura13  pep096x;
label values lcdurb13  pep097x;   label values lcchrc13  pep098x;
label values lctime90  pep094x;   label values lcunit90  pep095x;
label values lcdura90  pep096x;   label values lcdurb90  pep097x;
label values lcchrc90  pep098x;   label values lctime91  pep094x;
label values lcunit91  pep095x;   label values lcdura91  pep096x;
label values lcdurb91  pep097x;   label values lcchrc91  pep098x;
label values lahca1    pep079x;   label values lahca2    pep079x;
label values lahca3    pep079x;   label values lahca4    pep079x;
label values lahca5    pep079x;   label values lahca6    pep079x;
label values lahca7    pep079x;   label values lahca8    pep079x;
label values lahca9    pep079x;   label values lahca10   pep079x;
label values lahca11   pep079x;   label values lahca12   pep079x;
label values lahca13   pep079x;   label values lahca14   pep079x;
label values lahca15   pep079x;   label values lahca16   pep079x;
label values lahca17   pep079x;   label values lahca18   pep079x;
label values lahca19   pep079x;   label values lahca20   pep079x;
label values lahca21   pep079x;   label values lahca22   pep079x;
label values lahca23   pep079x;   label values lahca24   pep079x;
label values lahca25   pep079x;   label values lahca26   pep079x;
label values lahca27   pep079x;   label values lahca28   pep079x;
label values lahca29   pep079x;   label values lahca30   pep079x;
label values lahca31   pep079x;   label values lahca32   pep079x;
label values lahca33   pep079x;   label values lahca34   pep079x;
label values lahca90   pep079x;   label values lahca91   pep079x;
label values latime1   pep094x;   label values launit1   pep095x;
label values ladura1   pep207x;   label values ladurb1   pep208x;
label values lachrc1   pep098x;   label values latime2   pep094x;
label values launit2   pep095x;   label values ladura2   pep207x;
label values ladurb2   pep208x;   label values lachrc2   pep098x;
label values latime3   pep094x;   label values launit3   pep095x;
label values ladura3   pep207x;   label values ladurb3   pep208x;
label values lachrc3   pep098x;   label values latime4   pep094x;
label values launit4   pep095x;   label values ladura4   pep207x;
label values ladurb4   pep208x;   label values lachrc4   pep098x;
label values latime5   pep094x;   label values launit5   pep095x;
label values ladura5   pep207x;   label values ladurb5   pep208x;
label values lachrc5   pep098x;   label values latime6   pep094x;
label values launit6   pep095x;   label values ladura6   pep207x;
label values ladurb6   pep208x;   label values lachrc6   pep098x;
label values latime7   pep094x;   label values launit7   pep095x;
label values ladura7   pep207x;   label values ladurb7   pep208x;
label values lachrc7   pep098x;   label values latime8   pep094x;
label values launit8   pep095x;   label values ladura8   pep207x;
label values ladurb8   pep208x;   label values lachrc8   pep098x;
label values latime9   pep094x;   label values launit9   pep095x;
label values ladura9   pep207x;   label values ladurb9   pep208x;
label values lachrc9   pep098x;   label values latime10  pep094x;
label values launit10  pep095x;   label values ladura10  pep207x;
label values ladurb10  pep208x;   label values lachrc10  pep098x;
label values latime11  pep094x;   label values launit11  pep095x;
label values ladura11  pep207x;   label values ladurb11  pep208x;
label values lachrc11  pep098x;   label values latime12  pep094x;
label values launit12  pep095x;   label values ladura12  pep207x;
label values ladurb12  pep208x;   label values lachrc12  pep098x;
label values latime13  pep094x;   label values launit13  pep095x;
label values ladura13  pep207x;   label values ladurb13  pep208x;
label values lachrc13  pep098x;   label values latime14  pep094x;
label values launit14  pep095x;   label values ladura14  pep207x;
label values ladurb14  pep208x;   label values lachrc14  pep098x;
label values latime15  pep094x;   label values launit15  pep095x;
label values ladura15  pep207x;   label values ladurb15  pep208x;
label values lachrc15  pep098x;   label values latime16  pep094x;
label values launit16  pep095x;   label values ladura16  pep207x;
label values ladurb16  pep208x;   label values lachrc16  pep098x;
label values latime17  pep094x;   label values launit17  pep095x;
label values ladura17  pep207x;   label values ladurb17  pep208x;
label values lachrc17  pep098x;   label values latime18  pep094x;
label values launit18  pep095x;   label values ladura18  pep207x;
label values ladurb18  pep208x;   label values lachrc18  pep098x;
label values latime19  pep094x;   label values launit19  pep095x;
label values ladura19  pep207x;   label values ladurb19  pep208x;
label values lachrc19  pep098x;   label values latime20  pep094x;
label values launit20  pep095x;   label values ladura20  pep207x;
label values ladurb20  pep208x;   label values lachrc20  pep098x;
label values latime21  pep094x;   label values launit21  pep095x;
label values ladura21  pep207x;   label values ladurb21  pep208x;
label values lachrc21  pep098x;   label values latime22  pep094x;
label values launit22  pep095x;   label values ladura22  pep207x;
label values ladurb22  pep208x;   label values lachrc22  pep098x;
label values latime23  pep094x;   label values launit23  pep095x;
label values ladura23  pep207x;   label values ladurb23  pep208x;
label values lachrc23  pep098x;   label values latime24  pep094x;
label values launit24  pep095x;   label values ladura24  pep207x;
label values ladurb24  pep208x;   label values lachrc24  pep098x;
label values latime25  pep094x;   label values launit25  pep095x;
label values ladura25  pep207x;   label values ladurb25  pep208x;
label values lachrc25  pep098x;   label values latime26  pep094x;
label values launit26  pep095x;   label values ladura26  pep207x;
label values ladurb26  pep208x;   label values lachrc26  pep098x;
label values latime27  pep094x;   label values launit27  pep095x;
label values ladura27  pep207x;   label values ladurb27  pep208x;
label values lachrc27  pep098x;   label values latime28  pep094x;
label values launit28  pep095x;   label values ladura28  pep207x;
label values ladurb28  pep208x;   label values lachrc28  pep098x;
label values latime29  pep094x;   label values launit29  pep095x;
label values ladura29  pep207x;   label values ladurb29  pep208x;
label values lachrc29  pep098x;   label values latime30  pep094x;
label values launit30  pep095x;   label values ladura30  pep207x;
label values ladurb30  pep208x;   label values lachrc30  pep098x;
label values latime31  pep094x;   label values launit31  pep095x;
label values ladura31  pep207x;   label values ladurb31  pep208x;
label values lachrc31  pep098x;   label values latime32  pep094x;
label values launit32  pep095x;   label values ladura32  pep207x;
label values ladurb32  pep208x;   label values lachrc32  pep098x;
label values latime33  pep094x;   label values launit33  pep095x;
label values ladura33  pep207x;   label values ladurb33  pep208x;
label values lachrc33  pep098x;   label values latime34  pep094x;
label values launit34  pep095x;   label values ladura34  pep207x;
label values ladurb34  pep208x;   label values lachrc34  pep098x;
label values latime90  pep094x;   label values launit90  pep095x;
label values ladura90  pep207x;   label values ladurb90  pep208x;
label values lachrc90  pep098x;   label values latime91  pep094x;
label values launit91  pep095x;   label values ladura91  pep207x;
label values ladurb91  pep208x;   label values lachrc91  pep098x;
label values lcondrt   pep385x;   label values lachronr  pep386x;
label values phstat    pep387x;

label values pdmed12m  pep075x;   label values pnmed12m  pep075x;
label values phospyr   pep075x;   label values hospno    pep391x;
label values hpnite    pep392x;   label values phchm2w   pep075x;
label values phchmn2w  pep394x;   label values phcph2wr  pep075x;
label values phcphn2w  pep396x;   label values phcdv2w   pep075x;
label values phcdvn2w  pep398x;   label values p10dvyr   pep075x;

label values hikinda   pep400x;   label values hikindb   pep400x;
label values hikindc   pep400x;   label values hikindd   pep400x;
label values hikinde   pep400x;   label values hikindf   pep400x;
label values hikindg   pep400x;   label values hikindh   pep400x;
label values hikindi   pep400x;   label values hikindj   pep400x;
label values hikindk   pep400x;   label values hikindl   pep400x;
label values hikindm   pep400x;   label values hikindn   pep400x;
label values medicare  pep414x;   label values mcpart    pep415x;
label values mcchoice  pep027x;   label values mchmo     pep027x;
label values mcname    pep418x;   label values mcref     pep027x;
label values mcpaypre  pep027x;   label values medicaid  pep414x;
label values machmd    pep422x;   label values mapcmd    pep027x;
label values maref     pep027x;   label values single    pep425x;
label values sstypea   pep426x;   label values sstypeb   pep426x;
label values sstypec   pep426x;   label values sstyped   pep426x;
label values sstypee   pep426x;   label values sstypef   pep426x;
label values sstypeg   pep426x;   label values sstypeh   pep426x;
label values sstypei   pep426x;   label values sstypej   pep426x;
label values sstypek   pep426x;   label values sstypel   pep426x;
label values private   pep414x;   label values hitype1   pep439x;
label values whonam1   pep440x;   label values plnwrk1   pep441x;
label values plnpay11  pep426x;   label values plnpay21  pep426x;
label values plnpay31  pep426x;   label values plnpay41  pep426x;
label values plnpay51  pep426x;   label values plnpay61  pep426x;
label values plnpay71  pep426x;   label values hicostr1  pep449x;
label values plnmgd1   pep450x;   label values mgchmd1   pep451x;
label values mgprmd1   pep027x;   label values mgpymd1   pep027x;
label values mgpref1   pep027x;   label values hitype2   pep439x;
label values whonam2   pep440x;   label values plnwrk2   pep441x;
label values plnpay12  pep426x;   label values plnpay22  pep426x;
label values plnpay32  pep426x;   label values plnpay42  pep426x;
label values plnpay52  pep426x;   label values plnpay62  pep426x;
label values plnpay72  pep426x;   label values hicostr2  pep449x;
label values plnmgd2   pep450x;   label values mgchmd2   pep451x;
label values mgprmd2   pep027x;   label values mgpymd2   pep027x;
label values mgpref2   pep027x;   label values hitype3   pep439x;
label values whonam3   pep440x;   label values plnwrk3   pep441x;
label values plnpay13  pep426x;   label values plnpay23  pep426x;
label values plnpay33  pep426x;   label values plnpay43  pep426x;
label values plnpay53  pep426x;   label values plnpay63  pep426x;
label values plnpay73  pep426x;   label values hicostr3  pep449x;
label values plnmgd3   pep450x;   label values mgchmd3   pep451x;
label values mgprmd3   pep027x;   label values mgpymd3   pep027x;
label values mgpref3   pep027x;   label values hitype4   pep439x;
label values whonam4   pep440x;   label values plnwrk4   pep441x;
label values plnpay14  pep426x;   label values plnpay24  pep426x;
label values plnpay34  pep426x;   label values plnpay44  pep426x;
label values plnpay54  pep426x;   label values plnpay64  pep426x;
label values plnpay74  pep426x;   label values hicostr4  pep449x;
label values plnmgd4   pep450x;   label values mgchmd4   pep451x;
label values mgprmd4   pep027x;   label values mgpymd4   pep027x;
label values mgpref4   pep027x;   label values ihs       pep075x;
label values military  pep504x;   label values chip      pep075x;
label values otherpub  pep075x;   label values othergov  pep075x;
label values notcov    pep508x;   label values hilast    pep509x;
label values histop1   pep426x;   label values histop2   pep426x;
label values histop3   pep426x;   label values histop4   pep426x;
label values histop5   pep426x;   label values histop6   pep426x;
label values histop7   pep426x;   label values histop8   pep426x;
label values histop9   pep426x;   label values histop10  pep426x;
label values histop11  pep426x;   label values histop12  pep426x;
label values histop13  pep426x;   label values histop14  pep426x;
label values histop15  pep426x;   label values hinotyr   pep027x;
label values hinotmyr  pep526x;   label values hcspfyr   pep527x;

label values regionbr  pep528x;   label values geobrth   pep529x;
label values yrsinus   pep530x;   label values citizenp  pep531x;
label values headst    pep027x;   label values headstv1  pep027x;
label values educ      pep534x;   label values educ_r1   pep535x;
label values miltryds  pep027x;   label values doinglw1  pep537x;
label values whynowk1  pep538x;   label values wrkhrs    pep539x;
label values wrkftall  pep027x;   label values wrklyr1   pep027x;
label values wrkmyr    pep526x;   label values majr_act  pep543x;
label values ernyr_p   pep544x;   label values hiempof   pep027x;

label values psal      pep027x;   label values pseinc    pep027x;
label values pssrr     pep075x;   label values pssrrdb   pep027x;
label values pssrrd    pep027x;   label values ppens     pep075x;
label values popens    pep075x;   label values pssi      pep075x;
label values pssid     pep027x;   label values ptanf     pep075x;
label values powben    pep075x;   label values pintrstr  pep075x;
label values pdivd     pep075x;   label values pchldsp   pep075x;
label values pincot    pep075x;   label values incgrp    pep561x;
label values ab_bl20k  pep562x;   label values rat_cat   pep563x;
label values houseown  pep564x;   label values fgah      pep027x;
label values pssapl    pep075x;   label values psdapl    pep075x;
label values tanfmyr   pep568x;   label values pfstp     pep075x;
label values fstpmyr   pep568x;   label values eligpwic  pep571x;
label values pwic      pep027x;   label values wic_flag  pep573x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate educ [fweight=wtfa];
save $OUT/personsx, replace;

#delimit cr

* data file is stored in personsx.dta
* log  file is stored in personsx.log

log close
