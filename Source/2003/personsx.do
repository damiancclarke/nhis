global DAT "~/database/NHIS/Data/raw/2003"
global OUT "~/database/NHIS/Data/dta/2003"
global LOG "~/database/NHIS/Log"

log using "$LOG/personsx.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 DECEMBER 1, 2004
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2003 NHIS PUBLIC USE PERSONSX.DAT ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE PERSONSX.DTA AND PERSONSX.LOG
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2003\

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
 str  px           15 -  16      intv_qrt     17 -  17
      sex          18 -  18      age_p        19 -  20
      r_age1       21 -  21      r_age2       22 -  22
 str  dob_m        23 -  24 str  dob_y_p      25 -  28
      origin_i     29 -  29      origimpt     30 -  30
      hispan_i     31 -  32      hispimpt     33 -  33
      racerpi2     34 -  35      raceimp2     36 -  36
      mracrpi2     37 -  38      mracbpi2     39 -  40
      racreci2     41 -  41      hiscodi2     42 -  42
      erimpflg     43 -  43      r_maritl     44 -  44
      cohab1       45 -  45      cohab2       46 -  46
      lg_mstat     47 -  47      cdcmstat     48 -  48
      rrp          49 -  50 str  hh_ref       51 -  52
 str  hhreflg      53 -  53      frrp         54 -  55
 str  fm_ref       56 -  57 str  fmreflg      58 -  58
      fm_resp      59 -  60 str  fmrpflg      61 -  61
      sib_deg      62 -  62 str  mother       63 -  64
      mom_deg      65 -  65 str  father       66 -  67
      dad_deg      68 -  68 str  guard        69 -  70
      parents      71 -  71      mom_ed       72 -  73
      dad_ed       74 -  75      fm_size      76 -  77
      fm_type      78 -  78      fm_strcp     79 -  80
      fm_strp      81 -  82      nowaf        83 -  83
      astatflg     84 -  84      cstatflg     85 -  85
      immunflg     86 -  86      region       87 -  87
      wtia         88 -  93      wtfa         94 -  99
      stratum     100 - 102      psu         103 - 103

      plaplylm    104 - 104      plaplyun    105 - 105
      pspedeis    106 - 106      pspedem     107 - 107
      plaadl      108 - 108      labath      109 - 109
      ladress     110 - 110      laeat       111 - 111
      labed       112 - 112      latoilt     113 - 113
      lahome      114 - 114      plaiadl     115 - 115
      plawknow    116 - 116      plawklim    117 - 117
      plawalk     118 - 118      plaremem    119 - 119
      plimany     120 - 120      la1ar       121 - 121
      lahcc1      122 - 122      lahcc2      123 - 123
      lahcc3      124 - 124      lahcc4      125 - 125
      lahcc5      126 - 126      lahcc6      127 - 127
      lahcc7      128 - 128      lahcc8      129 - 129
      lahcc9      130 - 130      lahcc10     131 - 131
      lahcc11     132 - 132      lahcc12     133 - 133
      lahcc13     134 - 134      lahcc90     135 - 135
      lahcc91     136 - 136      lctime1     137 - 138
      lcunit1     139 - 139      lcdura1     140 - 141
      lcdurb1     142 - 142      lcchrc1     143 - 143
      lctime2     144 - 145      lcunit2     146 - 146
      lcdura2     147 - 148      lcdurb2     149 - 149
      lcchrc2     150 - 150      lctime3     151 - 152
      lcunit3     153 - 153      lcdura3     154 - 155
      lcdurb3     156 - 156      lcchrc3     157 - 157
      lctime4     158 - 159      lcunit4     160 - 160
      lcdura4     161 - 162      lcdurb4     163 - 163
      lcchrc4     164 - 164      lctime5     165 - 166
      lcunit5     167 - 167      lcdura5     168 - 169
      lcdurb5     170 - 170      lcchrc5     171 - 171
      lctime6     172 - 173      lcunit6     174 - 174
      lcdura6     175 - 176      lcdurb6     177 - 177
      lcchrc6     178 - 178      lctime7     179 - 180
      lcunit7     181 - 181      lcdura7     182 - 183
      lcdurb7     184 - 184      lcchrc7     185 - 185
      lctime8     186 - 187      lcunit8     188 - 188
      lcdura8     189 - 190      lcdurb8     191 - 191
      lcchrc8     192 - 192      lctime9     193 - 194
      lcunit9     195 - 195      lcdura9     196 - 197
      lcdurb9     198 - 198      lcchrc9     199 - 199
      lctime10    200 - 201      lcunit10    202 - 202
      lcdura10    203 - 204      lcdurb10    205 - 205
      lcchrc10    206 - 206      lctime11    207 - 208
      lcunit11    209 - 209      lcdura11    210 - 211
      lcdurb11    212 - 212      lcchrc11    213 - 213
      lctime12    214 - 215      lcunit12    216 - 216
      lcdura12    217 - 218      lcdurb12    219 - 219
      lcchrc12    220 - 220      lctime13    221 - 222
      lcunit13    223 - 223      lcdura13    224 - 225
      lcdurb13    226 - 226      lcchrc13    227 - 227
      lctime90    228 - 229      lcunit90    230 - 230
      lcdura90    231 - 232      lcdurb90    233 - 233
      lcchrc90    234 - 234      lctime91    235 - 236
      lcunit91    237 - 237      lcdura91    238 - 239
      lcdurb91    240 - 240      lcchrc91    241 - 241
      lahca1      242 - 242      lahca2      243 - 243
      lahca3      244 - 244      lahca4      245 - 245
      lahca5      246 - 246      lahca6      247 - 247
      lahca7      248 - 248      lahca8      249 - 249
      lahca9      250 - 250      lahca10     251 - 251
      lahca11     252 - 252      lahca12     253 - 253
      lahca13     254 - 254      lahca14     255 - 255
      lahca15     256 - 256      lahca16     257 - 257
      lahca17     258 - 258      lahca18     259 - 259
      lahca19     260 - 260      lahca20     261 - 261
      lahca21     262 - 262      lahca22     263 - 263
      lahca23     264 - 264      lahca24     265 - 265
      lahca25     266 - 266      lahca26     267 - 267
      lahca27     268 - 268      lahca28     269 - 269
      lahca29     270 - 270      lahca30     271 - 271
      lahca31     272 - 272      lahca32     273 - 273
      lahca33     274 - 274      lahca34     275 - 275
      lahca90     276 - 276      lahca91     277 - 277
      latime1     278 - 279      launit1     280 - 280
      ladura1     281 - 282      ladurb1     283 - 283
      lachrc1     284 - 284      latime2     285 - 286
      launit2     287 - 287      ladura2     288 - 289
      ladurb2     290 - 290      lachrc2     291 - 291
      latime3     292 - 293      launit3     294 - 294
      ladura3     295 - 296      ladurb3     297 - 297
      lachrc3     298 - 298      latime4     299 - 300
      launit4     301 - 301      ladura4     302 - 303
      ladurb4     304 - 304      lachrc4     305 - 305
      latime5     306 - 307      launit5     308 - 308
      ladura5     309 - 310      ladurb5     311 - 311
      lachrc5     312 - 312      latime6     313 - 314
      launit6     315 - 315      ladura6     316 - 317
      ladurb6     318 - 318      lachrc6     319 - 319
      latime7     320 - 321      launit7     322 - 322
      ladura7     323 - 324      ladurb7     325 - 325
      lachrc7     326 - 326      latime8     327 - 328
      launit8     329 - 329      ladura8     330 - 331
      ladurb8     332 - 332      lachrc8     333 - 333
      latime9     334 - 335      launit9     336 - 336
      ladura9     337 - 338      ladurb9     339 - 339
      lachrc9     340 - 340      latime10    341 - 342
      launit10    343 - 343      ladura10    344 - 345
      ladurb10    346 - 346      lachrc10    347 - 347
      latime11    348 - 349      launit11    350 - 350
      ladura11    351 - 352      ladurb11    353 - 353
      lachrc11    354 - 354      latime12    355 - 356
      launit12    357 - 357      ladura12    358 - 359
      ladurb12    360 - 360      lachrc12    361 - 361
      latime13    362 - 363      launit13    364 - 364
      ladura13    365 - 366      ladurb13    367 - 367
      lachrc13    368 - 368      latime14    369 - 370
      launit14    371 - 371      ladura14    372 - 373
      ladurb14    374 - 374      lachrc14    375 - 375
      latime15    376 - 377      launit15    378 - 378
      ladura15    379 - 380      ladurb15    381 - 381
      lachrc15    382 - 382      latime16    383 - 384
      launit16    385 - 385      ladura16    386 - 387
      ladurb16    388 - 388      lachrc16    389 - 389
      latime17    390 - 391      launit17    392 - 392
      ladura17    393 - 394      ladurb17    395 - 395
      lachrc17    396 - 396      latime18    397 - 398
      launit18    399 - 399      ladura18    400 - 401
      ladurb18    402 - 402      lachrc18    403 - 403
      latime19    404 - 405      launit19    406 - 406
      ladura19    407 - 408      ladurb19    409 - 409
      lachrc19    410 - 410      latime20    411 - 412
      launit20    413 - 413      ladura20    414 - 415
      ladurb20    416 - 416      lachrc20    417 - 417
      latime21    418 - 419      launit21    420 - 420
      ladura21    421 - 422      ladurb21    423 - 423
      lachrc21    424 - 424      latime22    425 - 426
      launit22    427 - 427      ladura22    428 - 429
      ladurb22    430 - 430      lachrc22    431 - 431
      latime23    432 - 433      launit23    434 - 434
      ladura23    435 - 436      ladurb23    437 - 437
      lachrc23    438 - 438      latime24    439 - 440
      launit24    441 - 441      ladura24    442 - 443
      ladurb24    444 - 444      lachrc24    445 - 445
      latime25    446 - 447      launit25    448 - 448
      ladura25    449 - 450      ladurb25    451 - 451
      lachrc25    452 - 452      latime26    453 - 454
      launit26    455 - 455      ladura26    456 - 457
      ladurb26    458 - 458      lachrc26    459 - 459
      latime27    460 - 461      launit27    462 - 462
      ladura27    463 - 464      ladurb27    465 - 465
      lachrc27    466 - 466      latime28    467 - 468
      launit28    469 - 469      ladura28    470 - 471
      ladurb28    472 - 472      lachrc28    473 - 473
      latime29    474 - 475      launit29    476 - 476
      ladura29    477 - 478      ladurb29    479 - 479
      lachrc29    480 - 480      latime30    481 - 482
      launit30    483 - 483      ladura30    484 - 485
      ladurb30    486 - 486      lachrc30    487 - 487
      latime31    488 - 489      launit31    490 - 490
      ladura31    491 - 492      ladurb31    493 - 493
      lachrc31    494 - 494      latime32    495 - 496
      launit32    497 - 497      ladura32    498 - 499
      ladurb32    500 - 500      lachrc32    501 - 501
      latime33    502 - 503      launit33    504 - 504
      ladura33    505 - 506      ladurb33    507 - 507
      lachrc33    508 - 508      latime34    509 - 510
      launit34    511 - 511      ladura34    512 - 513
      ladurb34    514 - 514      lachrc34    515 - 515
      latime90    516 - 517      launit90    518 - 518
      ladura90    519 - 520      ladurb90    521 - 521
      lachrc90    522 - 522      latime91    523 - 524
      launit91    525 - 525      ladura91    526 - 527
      ladurb91    528 - 528      lachrc91    529 - 529
      lcondrt     530 - 530      lachronr    531 - 531
      phstat      532 - 532

      pdmed12m    533 - 533      pnmed12m    534 - 534
      phospyr     535 - 535      hospno      536 - 538
      hpnite      539 - 541      phchm2w     542 - 542
      phchmn2w    543 - 544      phcph2wr    545 - 545
      phcphn2w    546 - 547      phcdv2w     548 - 548
      phcdvn2w    549 - 550      p10dvyr     551 - 551

      hikinda     552 - 552      hikindb     553 - 553
      hikindc     554 - 554      hikindd     555 - 555
      hikinde     556 - 556      hikindf     557 - 557
      hikindg     558 - 558      hikindh     559 - 559
      hikindi     560 - 560      hikindj     561 - 561
      hikindk     562 - 562      hikindl     563 - 563
      hikindm     564 - 564      hikindn     565 - 565
      medicare    566 - 566      mcpart      567 - 567
      mcchoice    568 - 568      mchmo       569 - 569
      mcname      570 - 571      mcref       572 - 572
      mcpaypre    573 - 573      medicaid    574 - 574
      machmd      575 - 575      mapcmd      576 - 576
      maref       577 - 577      single      578 - 578
      sstypea     579 - 579      sstypeb     580 - 580
      sstypec     581 - 581      sstyped     582 - 582
      sstypee     583 - 583      sstypef     584 - 584
      sstypeg     585 - 585      sstypeh     586 - 586
      sstypei     587 - 587      sstypej     588 - 588
      sstypek     589 - 589      sstypel     590 - 590
      private     591 - 591      hitype1     592 - 593
      whonam1     594 - 594      plnwrk1     595 - 595
      plnpay11    596 - 596      plnpay21    597 - 597
      plnpay31    598 - 598      plnpay41    599 - 599
      plnpay51    600 - 600      plnpay61    601 - 601
      plnpay71    602 - 602      hicostr1    603 - 607
      plnmgd1     608 - 608      mgchmd1     609 - 609
      mgprmd1     610 - 610      mgpymd1     611 - 611
      mgpref1     612 - 612      hitype2     613 - 614
      whonam2     615 - 615      plnwrk2     616 - 616
      plnpay12    617 - 617      plnpay22    618 - 618
      plnpay32    619 - 619      plnpay42    620 - 620
      plnpay52    621 - 621      plnpay62    622 - 622
      plnpay72    623 - 623      hicostr2    624 - 628
      plnmgd2     629 - 629      mgchmd2     630 - 630
      mgprmd2     631 - 631      mgpymd2     632 - 632
      mgpref2     633 - 633      hitype3     634 - 635
      whonam3     636 - 636      plnwrk3     637 - 637
      plnpay13    638 - 638      plnpay23    639 - 639
      plnpay33    640 - 640      plnpay43    641 - 641
      plnpay53    642 - 642      plnpay63    643 - 643
      plnpay73    644 - 644      hicostr3    645 - 649
      plnmgd3     650 - 650      mgchmd3     651 - 651
      mgprmd3     652 - 652      mgpymd3     653 - 653
      mgpref3     654 - 654      hitype4     655 - 656
      whonam4     657 - 657      plnwrk4     658 - 658
      plnpay14    659 - 659      plnpay24    660 - 660
      plnpay34    661 - 661      plnpay44    662 - 662
      plnpay54    663 - 663      plnpay64    664 - 664
      plnpay74    665 - 665      hicostr4    666 - 670
      plnmgd4     671 - 671      mgchmd4     672 - 672
      mgprmd4     673 - 673      mgpymd4     674 - 674
      mgpref4     675 - 675      ihs         676 - 676
      military    677 - 677      chip        678 - 678
      otherpub    679 - 679      othergov    680 - 680
      notcov      681 - 681      hilast      682 - 682
      histop1     683 - 683      histop2     684 - 684
      histop3     685 - 685      histop4     686 - 686
      histop5     687 - 687      histop6     688 - 688
      histop7     689 - 689      histop8     690 - 690
      histop9     691 - 691      histop10    692 - 692
      histop11    693 - 693      histop12    694 - 694
      histop13    695 - 695      histop14    696 - 696
      histop15    697 - 697      hinotyr     698 - 698
      hinotmyr    699 - 700      hcspfyr     701 - 701

      regionbr    702 - 703      geobrth     704 - 704
      yrsinus     705 - 705      citizenp    706 - 706
      headst      707 - 707      headstv1    708 - 708
      educ        709 - 710      educ_r1     711 - 712
      miltryds    713 - 713      doinglw1    714 - 714
      whynowk1    715 - 716      wrkhrs      717 - 718
      wrkftall    719 - 719      wrklyr1     720 - 720
      wrkmyr      721 - 722      majr_act    723 - 723
      ernyr_p     724 - 725      hiempof     726 - 726

      psal        727 - 727      pseinc      728 - 728
      pssrr       729 - 729      pssrrdb     730 - 730
      pssrrd      731 - 731      ppens       732 - 732
      popens      733 - 733      pssi        734 - 734
      pssid       735 - 735      ptanf       736 - 736
      powben      737 - 737      pintrstr    738 - 738
      pdivd       739 - 739      pchldsp     740 - 740
      pincot      741 - 741      incgrp      742 - 743
      ab_bl20k    744 - 744      rat_cat     745 - 746
      houseown    747 - 747      fgah        748 - 748
      pssapl      749 - 749      psdapl      750 - 750
      tanfmyr     751 - 752      pfstp       753 - 753
      fstpmyr     754 - 755      eligpwic    756 - 756
      pwic        757 - 757      wic_flag    758 - 758
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
label variable racerpi2 "OMB groups w/multiple race";
label variable raceimp2 "Race Imputation Flag";
label variable mracrpi2 "Race coded to single/multiple race group";
label variable mracbpi2 "Race coded to single/multiple race group";
label variable racreci2 "Race Recode";
label variable hiscodi2 "Race/ethnicity recode";
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
label variable lachrc2  "Hearing problem condition status";
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
label variable ernyr_p  "{Person's} total earnings in 2002";
label variable hiempof  "Was health ins offered thru workplace?";
 
label variable psal     "Rec inc from wage/sal (last CY)";
label variable pseinc   "Rec inc from self-employment (last CY)";
label variable pssrr    "Rec inc from SS or RR (last CY)";
label variable pssrrdb  "Rec'd SS or RR a disability benefit";
label variable pssrrd   "Rec'd benefit due to disability";
label variable ppens    "Rec inc from otr disab pens (last CY)";
label variable popens   "Rec inc from any otr pens (last CY)";
label variable pssi     "Rec'd inc from SSI (last CY)";
label variable pssid    "Rec'd SSI due to disability";
label variable ptanf    "Rec'd inc from Welfare/TANF (last CY)";
label variable powben   "Rec'd otr govt assistance (last CY)";
label variable pintrstr "Rec int fr sav/bank accts (last CY)";
label variable pdivd    "Rec div from stocks/funds/etc. (last CY)";
label variable pchldsp  "Rec'd inc from child support (last CY)";
label variable pincot   "Rec'd inc from any other source (last CY";
label variable incgrp   "Total Combined Family Income (Grouped)";
label variable ab_bl20k "Fam inc at/above vs. below $20,000";
label variable rat_cat  "Ratio of fam inc to poverty threshold";
label variable houseown "Home Tenure Status";
label variable fgah     "Paying lower rent due to govt prgm";
label variable pssapl   "Ever applied for SSI";
label variable psdapl   "Ever applied for SSDI";
label variable tanfmyr  "Months rec Welfare/TANF (last CY)";
label variable pfstp    "Person auth to rec food stmps (last CY)";
label variable fstpmyr  "Months rec food stamps (last CY)";
label variable eligpwic "Anyone age-eligible for the WIC program?";
label variable pwic     "Rec'd WIC benefits (last CY)";
label variable wic_flag "WIC recipient age-eligible";

* DEFINE VALUE LABELS FOR REPORTS;

label define pep001x
   20               "20 Person"
;
label define pep002x
   2003             "2003"
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
   1                "1 Imputed: was 'refused' Hispanic Origin"
   2                "2 Imputed: was 'not ascertained' Hispanic Origin"
   3                "3 Imputed: was 'does not know' Hispanic Origin"
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
   1                "1 Imputed: was 'refused' Hispanic Origin"
   2                "2 Imputed: was 'not ascertained' Hispanic Origin"
   3                "3 Imputed: was 'does not know' Hispanic Origin"
   4                "4 Hispanic Origin type given by respondent/proxy"
;
label define pep017x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN only"
   04               "04 Asian only"
   05               "05 Race group not releasable*"
   06               "06 Multiple race"
;
label define pep018x
   1                "1 Imputed: was 'refused'"
   2                "2 Imputed: was 'not ascertained'"
   3                "3 Imputed: was 'does not know'"
   4                "4 Imputed: was 'other race'"
   5                "5 Imputed: was 'unspecified multiple race'"
   6                "6 Race given by respondent/proxy"
;
label define pep019x
   01               "01 White"
   02               "02 Black/African American"
   03               "03 Indian (American), Alaska Native"
   09               "09 Asian Indian"
   10               "10 Chinese"
   11               "11 Filipino"
   15               "15 Other Asian*"
   16               "16 Primary race not releasable**"
   17               "17 Multiple race, no primary race selected"
;
label define pep020x
   01               "01 White"
   02               "02 Black/African American"
   03               "03 Indian (American) (includes Eskimo, Aleut)"
   06               "06 Chinese"
   07               "07 Filipino"
   12               "12 Asian Indian"
   16               "16 Other race*"
   17               "17 Multiple race, no primary race selected"
;
label define pep021x
   1                "1 White"
   2                "2 Black"
   3                "3 All other race groups*"
;
label define pep022x
   1                "1 Hispanic"
   2                "2 Non-Hispanic White"
   3                "3 Non-Hispanic Black"
   4                "4 Non-Hispanic All other race groups"
;
label define pep023x
   1                "1 Ethnicity/race imputed"
   2                "2 Ethnicity/race given by respondent/proxy"
;
label define pep024x
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
label define pep025x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep026x
   1                "1 Married"
   2                "2 Widowed"
   3                "3 Divorced"
   4                "4 Separated"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep027x
   1                "1 Married, spouse in household"
   2                "2 Married, spouse not in household"
   3                "3 Married, spouse in household unknown"
   4                "4 Widowed"
   5                "5 Divorced"
   6                "6 Separated"
   7                "7 Never Married"
   9                "9 Unknown marital status"
;
label define pep028x
   1                "1 Separated"
   2                "2 Divorced"
   3                "3 Married"
   4                "4 Single/never married"
   5                "5 Widowed"
   9                "9 Unknown marital status"
;
label define pep029x
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
label define pep032x
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
label define pep035x
   98               "98 Not ascertained"
;
label define pep037x
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
label define pep039x
   1                "1 Biological"
   2                "2 Adoptive"
   3                "3 Step"
   4                "4 Foster"
   5                "5 In-law"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep043x
   1                "1 Mother, no father"
   2                "2 Father, no mother"
   3                "3 Mother and father"
   4                "4 Neither mother nor father"
   9                "9 Unknown"
;
label define pep044x
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
label define pep047x
   1                "1 One adult, no child(ren) under 18"
   2                "2 Multiple adults, no child(ren) under 18"
   3                "3 One adult, 1+ child(ren) under 18"
   4                "4 Multiple adults, 1+ child(ren) under 18"
   9                "9 Unknown"
;
label define pep050x
   1                "1 Armed Forces"
   2                "2 Not Armed Forces"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep051x
   0                "0 Sample Adult - no record"
   1                "1 Sample Adult - has record"
   2                "2 Not selected as Sample Adult"
   3                "3 No one selected as Sample Adult"
   4                "4 Armed Force member"
   5                "5 Armed Force member - selected as Sample Adult"
;
label define pep052x
   0                "0 Sample Child - no record"
   1                "1 Sample Child - has record"
   2                "2 Not selected as Sample Child"
   3                "3 No one selected as Sample Child"
   4                "4 Emancipated Minor"
;
label define pep053x
   0                "0 Immunization Child - no record"
   1                "1 Immunization Child - has record"
   2                "2 Not eligible for immunization questions"
;
label define pep054x
   1                "1 Northeast"
   2                "2 Midwest"
   3                "3 South"
   4                "4 West"
;
label define pep072x
   0                "0 Unable to work"
   1                "1 Limited in work"
   2                "2 Not limited in work"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep073x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep075x
   0                "0 Limitation previously mentioned"
   1                "1 Yes, limited in some other way"
   2                "2 Not limited in any way"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep076x
   1                "1 Limited in any way"
   2                "2 Not limited in any way"
   3                "3 Unknown if limited"
;
label define pep077x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   6                "6 No condition at all"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep092x
   95               "95 95+"
   96               "96 Since birth"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep093x
   1                "1 Day(s)"
   2                "2 Week(s)"
   3                "3 Month(s)"
   4                "4 Year(s)"
   6                "6 Since birth"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep094x
   00               "00 Less than 1 year"
   96               "96 Unknown number of years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep095x
   0                "0 Since birth and child < 1 year of age"
   1                "1 Less than 3 months"
   2                "2 3 - 5 months"
   3                "3 6 - 12 months"
   4                "4 More than 1 year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep096x
   1                "1 Chronic"
   2                "2 Not chronic"
   9                "9 Unknown if chronic"
;
label define pep205x
   00               "00 Less than 1 year"
   85               "85 85+ years"
   96               "96 Unknown number of years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep206x
   1                "1 Less than 3 months"
   2                "2 3 - 5 months"
   3                "3 6 - 12 months"
   4                "4 More than 1 year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep383x
   1                "1 At least one condition causing LA is chronic"
   2                "2 No condition causing LA is chronic"
   9                "9 Unk if any condition causing LA is chronic"
;
label define pep384x
   0                "0 Not limited in any way (incl unk if limited)"
   1                "1 Limited; caused by at least one chronic cond"
   2                "2 Limited; not caused by chronic cond"
   3                "3 Limited; unk if cond causing LA is chronic"
;
label define pep385x
   1                "1 Excellent"
   2                "2 Very good"
   3                "3 Good"
   4                "4 Fair"
   5                "5 Poor"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep389x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define pep390x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define pep392x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
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
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep412x
   1                "1 Yes, information"
   2                "2 Yes, but no information"
   3                "3 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep413x
   1                "1 Part A - Hospital Only"
   2                "2 Part B - Medical Only"
   3                "3 Both Part A and Part B"
   4                "4 Card Not Available"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep416x
   04               "04 Medigap plan"
   12               "12 Group"
   22               "22 Staff"
   32               "32 IPA"
   92               "92 Other"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep420x
   1                "1 Any doctor"
   2                "2 Select from a book/list"
   3                "3 Doctor is assigned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep423x
   1                "1 Yes with information"
   2                "2 Yes with no information"
   3                "3 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep424x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep437x
   98               "98 Not ascertained"
   99               "99 Unknown"
;
label define pep438x
   1                "1 In own name"
   2                "2 Someone else in family"
   3                "3 Person not in household"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep439x
   1                "1 Employer"
   2                "2 Union"
   3                "3 Through work, but DK if employer or union"
   4                "4 Through work, self-employ or prof assoc"
   5                "5 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep447x
   20000            "20000 $20,000 or more"
   99997            "99997 Refused"
   99998            "99998 Not ascertained"
   99999            "99999 Don't know"
;
label define pep448x
   1                "1 HMO/IPA"
   2                "2 PPO"
   3                "3 POS"
   4                "4 Fee-for-service/indemnity"
   5                "5 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep449x
   1                "1 Any doctor"
   2                "2 Select from group/list"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep502x
   1                "1 Yes, Military/VA only"
   2                "2 Yes, TRICARE/CHAMPUS/CHAMP-VA only"
   3                "3 Yes Both Military/VA + TRICARE/CHAMPUS/CHAMP-VA"
   4                "4 Yes unknown type"
   5                "5 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep506x
   1                "1 Not covered"
   2                "2 Covered"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep507x
   1                "1 6 months or less"
   2                "2 More than 6 months, but not more than 1 year ago"
   3                "3 More than 1 year, but not more than 3 years ago"
   4                "4 More than 3 years"
   5                "5 Never"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep524x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep525x
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
label define pep526x
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
label define pep527x
   1                "1 USA: born in one of the 50 United States or D.C"
   2                "2 USA: born in a U.S. territory"
   3                "3 Not born in the U.S. or a U.S. territory"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep528x
   1                "1 Less than 1 year"
   2                "2 1 yr., less than 5 yrs."
   3                "3 5 yrs., less than 10 yrs."
   4                "4 10 yrs., less than 15 yrs."
   5                "5 15 years or more"
   9                "9 Unknown"
;
label define pep529x
   1                "1 Yes, citizen of the United States"
   2                "2 No, not a citizen of the United States"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep532x
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
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep533x
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
label define pep535x
   1                "1 Working for pay at a job or business"
   2                "2 With a job or business but not at work"
   3                "3 Looking for work"
   4                "4 Working, but not for pay, at a job or business"
   5                "5 Not working and not looking for work"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep536x
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
label define pep537x
   95               "95 95+ hours"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep541x
   1                "1 Working at a job or business"
   2                "2 Keeping house"
   3                "3 Going to school"
   4                "4 Something else"
   5                "5 Unknown"
;
label define pep542x
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
label define pep559x
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
label define pep560x
   1                "1 $20,000 or more"
   2                "2 Less than $20,000"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep561x
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
label define pep562x
   1                "1 Owned or being bought"
   2                "2 Rented"
   3                "3 Other arrangement"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define pep566x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define pep569x
   0                "0 No WIC age-eligible family members"
   1                "1 At least 1 WIC age-eligible family member"
;
label define pep571x
   0                "0 Person not age-eligible"
   1                "1 Person age-eligible"
;

* ASSOCIATE VARIABLES WITH LABEL DEFINITIONS;

label values rectype   pep001x;   label values srvy_yr   pep002x;
label values intv_qrt  pep006x;   label values sex       pep007x;
label values age_p     pep008x;   label values r_age1    pep009x;
label values r_age2    pep010x;   label values origin_i  pep013x;
label values origimpt  pep014x;   label values hispan_i  pep015x;
label values hispimpt  pep016x;   label values racerpi2  pep017x;
label values raceimp2  pep018x;   label values mracrpi2  pep019x;
label values mracbpi2  pep020x;   label values racreci2  pep021x;
label values hiscodi2  pep022x;   label values erimpflg  pep023x;
label values r_maritl  pep024x;   label values cohab1    pep025x;
label values cohab2    pep026x;   label values lg_mstat  pep027x;
label values cdcmstat  pep028x;   label values rrp       pep029x;
label values frrp      pep032x;   label values fm_resp   pep035x;
label values sib_deg   pep037x;   label values mom_deg   pep039x;
label values dad_deg   pep039x;   label values parents   pep043x;
label values mom_ed    pep044x;   label values dad_ed    pep044x;
label values fm_type   pep047x;   label values nowaf     pep050x;
label values astatflg  pep051x;   label values cstatflg  pep052x;
label values immunflg  pep053x;   label values region    pep054x;

label values plaplylm  pep025x;   label values plaplyun  pep025x;
label values pspedeis  pep025x;   label values pspedem   pep025x;
label values plaadl    pep025x;   label values labath    pep025x;
label values ladress   pep025x;   label values laeat     pep025x;
label values labed     pep025x;   label values latoilt   pep025x;
label values lahome    pep025x;   label values plaiadl   pep025x;
label values plawknow  pep025x;   label values plawklim  pep072x;
label values plawalk   pep073x;   label values plaremem  pep073x;
label values plimany   pep075x;   label values la1ar     pep076x;
label values lahcc1    pep077x;   label values lahcc2    pep077x;
label values lahcc3    pep077x;   label values lahcc4    pep077x;
label values lahcc5    pep077x;   label values lahcc6    pep077x;
label values lahcc7    pep077x;   label values lahcc8    pep077x;
label values lahcc9    pep077x;   label values lahcc10   pep077x;
label values lahcc11   pep077x;   label values lahcc12   pep077x;
label values lahcc13   pep077x;   label values lahcc90   pep077x;
label values lahcc91   pep077x;   label values lctime1   pep092x;
label values lcunit1   pep093x;   label values lcdura1   pep094x;
label values lcdurb1   pep095x;   label values lcchrc1   pep096x;
label values lctime2   pep092x;   label values lcunit2   pep093x;
label values lcdura2   pep094x;   label values lcdurb2   pep095x;
label values lcchrc2   pep096x;   label values lctime3   pep092x;
label values lcunit3   pep093x;   label values lcdura3   pep094x;
label values lcdurb3   pep095x;   label values lcchrc3   pep096x;
label values lctime4   pep092x;   label values lcunit4   pep093x;
label values lcdura4   pep094x;   label values lcdurb4   pep095x;
label values lcchrc4   pep096x;   label values lctime5   pep092x;
label values lcunit5   pep093x;   label values lcdura5   pep094x;
label values lcdurb5   pep095x;   label values lcchrc5   pep096x;
label values lctime6   pep092x;   label values lcunit6   pep093x;
label values lcdura6   pep094x;   label values lcdurb6   pep095x;
label values lcchrc6   pep096x;   label values lctime7   pep092x;
label values lcunit7   pep093x;   label values lcdura7   pep094x;
label values lcdurb7   pep095x;   label values lcchrc7   pep096x;
label values lctime8   pep092x;   label values lcunit8   pep093x;
label values lcdura8   pep094x;   label values lcdurb8   pep095x;
label values lcchrc8   pep096x;   label values lctime9   pep092x;
label values lcunit9   pep093x;   label values lcdura9   pep094x;
label values lcdurb9   pep095x;   label values lcchrc9   pep096x;
label values lctime10  pep092x;   label values lcunit10  pep093x;
label values lcdura10  pep094x;   label values lcdurb10  pep095x;
label values lcchrc10  pep096x;   label values lctime11  pep092x;
label values lcunit11  pep093x;   label values lcdura11  pep094x;
label values lcdurb11  pep095x;   label values lcchrc11  pep096x;
label values lctime12  pep092x;   label values lcunit12  pep093x;
label values lcdura12  pep094x;   label values lcdurb12  pep095x;
label values lcchrc12  pep096x;   label values lctime13  pep092x;
label values lcunit13  pep093x;   label values lcdura13  pep094x;
label values lcdurb13  pep095x;   label values lcchrc13  pep096x;
label values lctime90  pep092x;   label values lcunit90  pep093x;
label values lcdura90  pep094x;   label values lcdurb90  pep095x;
label values lcchrc90  pep096x;   label values lctime91  pep092x;
label values lcunit91  pep093x;   label values lcdura91  pep094x;
label values lcdurb91  pep095x;   label values lcchrc91  pep096x;
label values lahca1    pep077x;   label values lahca2    pep077x;
label values lahca3    pep077x;   label values lahca4    pep077x;
label values lahca5    pep077x;   label values lahca6    pep077x;
label values lahca7    pep077x;   label values lahca8    pep077x;
label values lahca9    pep077x;   label values lahca10   pep077x;
label values lahca11   pep077x;   label values lahca12   pep077x;
label values lahca13   pep077x;   label values lahca14   pep077x;
label values lahca15   pep077x;   label values lahca16   pep077x;
label values lahca17   pep077x;   label values lahca18   pep077x;
label values lahca19   pep077x;   label values lahca20   pep077x;
label values lahca21   pep077x;   label values lahca22   pep077x;
label values lahca23   pep077x;   label values lahca24   pep077x;
label values lahca25   pep077x;   label values lahca26   pep077x;
label values lahca27   pep077x;   label values lahca28   pep077x;
label values lahca29   pep077x;   label values lahca30   pep077x;
label values lahca31   pep077x;   label values lahca32   pep077x;
label values lahca33   pep077x;   label values lahca34   pep077x;
label values lahca90   pep077x;   label values lahca91   pep077x;
label values latime1   pep092x;   label values launit1   pep093x;
label values ladura1   pep205x;   label values ladurb1   pep206x;
label values lachrc1   pep096x;   label values latime2   pep092x;
label values launit2   pep093x;   label values ladura2   pep205x;
label values ladurb2   pep206x;   label values lachrc2   pep096x;
label values latime3   pep092x;   label values launit3   pep093x;
label values ladura3   pep205x;   label values ladurb3   pep206x;
label values lachrc3   pep096x;   label values latime4   pep092x;
label values launit4   pep093x;   label values ladura4   pep205x;
label values ladurb4   pep206x;   label values lachrc4   pep096x;
label values latime5   pep092x;   label values launit5   pep093x;
label values ladura5   pep205x;   label values ladurb5   pep206x;
label values lachrc5   pep096x;   label values latime6   pep092x;
label values launit6   pep093x;   label values ladura6   pep205x;
label values ladurb6   pep206x;   label values lachrc6   pep096x;
label values latime7   pep092x;   label values launit7   pep093x;
label values ladura7   pep205x;   label values ladurb7   pep206x;
label values lachrc7   pep096x;   label values latime8   pep092x;
label values launit8   pep093x;   label values ladura8   pep205x;
label values ladurb8   pep206x;   label values lachrc8   pep096x;
label values latime9   pep092x;   label values launit9   pep093x;
label values ladura9   pep205x;   label values ladurb9   pep206x;
label values lachrc9   pep096x;   label values latime10  pep092x;
label values launit10  pep093x;   label values ladura10  pep205x;
label values ladurb10  pep206x;   label values lachrc10  pep096x;
label values latime11  pep092x;   label values launit11  pep093x;
label values ladura11  pep205x;   label values ladurb11  pep206x;
label values lachrc11  pep096x;   label values latime12  pep092x;
label values launit12  pep093x;   label values ladura12  pep205x;
label values ladurb12  pep206x;   label values lachrc12  pep096x;
label values latime13  pep092x;   label values launit13  pep093x;
label values ladura13  pep205x;   label values ladurb13  pep206x;
label values lachrc13  pep096x;   label values latime14  pep092x;
label values launit14  pep093x;   label values ladura14  pep205x;
label values ladurb14  pep206x;   label values lachrc14  pep096x;
label values latime15  pep092x;   label values launit15  pep093x;
label values ladura15  pep205x;   label values ladurb15  pep206x;
label values lachrc15  pep096x;   label values latime16  pep092x;
label values launit16  pep093x;   label values ladura16  pep205x;
label values ladurb16  pep206x;   label values lachrc16  pep096x;
label values latime17  pep092x;   label values launit17  pep093x;
label values ladura17  pep205x;   label values ladurb17  pep206x;
label values lachrc17  pep096x;   label values latime18  pep092x;
label values launit18  pep093x;   label values ladura18  pep205x;
label values ladurb18  pep206x;   label values lachrc18  pep096x;
label values latime19  pep092x;   label values launit19  pep093x;
label values ladura19  pep205x;   label values ladurb19  pep206x;
label values lachrc19  pep096x;   label values latime20  pep092x;
label values launit20  pep093x;   label values ladura20  pep205x;
label values ladurb20  pep206x;   label values lachrc20  pep096x;
label values latime21  pep092x;   label values launit21  pep093x;
label values ladura21  pep205x;   label values ladurb21  pep206x;
label values lachrc21  pep096x;   label values latime22  pep092x;
label values launit22  pep093x;   label values ladura22  pep205x;
label values ladurb22  pep206x;   label values lachrc22  pep096x;
label values latime23  pep092x;   label values launit23  pep093x;
label values ladura23  pep205x;   label values ladurb23  pep206x;
label values lachrc23  pep096x;   label values latime24  pep092x;
label values launit24  pep093x;   label values ladura24  pep205x;
label values ladurb24  pep206x;   label values lachrc24  pep096x;
label values latime25  pep092x;   label values launit25  pep093x;
label values ladura25  pep205x;   label values ladurb25  pep206x;
label values lachrc25  pep096x;   label values latime26  pep092x;
label values launit26  pep093x;   label values ladura26  pep205x;
label values ladurb26  pep206x;   label values lachrc26  pep096x;
label values latime27  pep092x;   label values launit27  pep093x;
label values ladura27  pep205x;   label values ladurb27  pep206x;
label values lachrc27  pep096x;   label values latime28  pep092x;
label values launit28  pep093x;   label values ladura28  pep205x;
label values ladurb28  pep206x;   label values lachrc28  pep096x;
label values latime29  pep092x;   label values launit29  pep093x;
label values ladura29  pep205x;   label values ladurb29  pep206x;
label values lachrc29  pep096x;   label values latime30  pep092x;
label values launit30  pep093x;   label values ladura30  pep205x;
label values ladurb30  pep206x;   label values lachrc30  pep096x;
label values latime31  pep092x;   label values launit31  pep093x;
label values ladura31  pep205x;   label values ladurb31  pep206x;
label values lachrc31  pep096x;   label values latime32  pep092x;
label values launit32  pep093x;   label values ladura32  pep205x;
label values ladurb32  pep206x;   label values lachrc32  pep096x;
label values latime33  pep092x;   label values launit33  pep093x;
label values ladura33  pep205x;   label values ladurb33  pep206x;
label values lachrc33  pep096x;   label values latime34  pep092x;
label values launit34  pep093x;   label values ladura34  pep205x;
label values ladurb34  pep206x;   label values lachrc34  pep096x;
label values latime90  pep092x;   label values launit90  pep093x;
label values ladura90  pep205x;   label values ladurb90  pep206x;
label values lachrc90  pep096x;   label values latime91  pep092x;
label values launit91  pep093x;   label values ladura91  pep205x;
label values ladurb91  pep206x;   label values lachrc91  pep096x;
label values lcondrt   pep383x;   label values lachronr  pep384x;
label values phstat    pep385x;

label values pdmed12m  pep073x;   label values pnmed12m  pep073x;
label values phospyr   pep073x;   label values hospno    pep389x;
label values hpnite    pep390x;   label values phchm2w   pep073x;
label values phchmn2w  pep392x;   label values phcph2wr  pep073x;
label values phcphn2w  pep394x;   label values phcdv2w   pep073x;
label values phcdvn2w  pep396x;   label values p10dvyr   pep073x;

label values hikinda   pep398x;   label values hikindb   pep398x;
label values hikindc   pep398x;   label values hikindd   pep398x;
label values hikinde   pep398x;   label values hikindf   pep398x;
label values hikindg   pep398x;   label values hikindh   pep398x;
label values hikindi   pep398x;   label values hikindj   pep398x;
label values hikindk   pep398x;   label values hikindl   pep398x;
label values hikindm   pep398x;   label values hikindn   pep398x;
label values medicare  pep412x;   label values mcpart    pep413x;
label values mcchoice  pep025x;   label values mchmo     pep025x;
label values mcname    pep416x;   label values mcref     pep025x;
label values mcpaypre  pep025x;   label values medicaid  pep412x;
label values machmd    pep420x;   label values mapcmd    pep025x;
label values maref     pep025x;   label values single    pep423x;
label values sstypea   pep424x;   label values sstypeb   pep424x;
label values sstypec   pep424x;   label values sstyped   pep424x;
label values sstypee   pep424x;   label values sstypef   pep424x;
label values sstypeg   pep424x;   label values sstypeh   pep424x;
label values sstypei   pep424x;   label values sstypej   pep424x;
label values sstypek   pep424x;   label values sstypel   pep424x;
label values private   pep412x;   label values hitype1   pep437x;
label values whonam1   pep438x;   label values plnwrk1   pep439x;
label values plnpay11  pep424x;   label values plnpay21  pep424x;
label values plnpay31  pep424x;   label values plnpay41  pep424x;
label values plnpay51  pep424x;   label values plnpay61  pep424x;
label values plnpay71  pep424x;   label values hicostr1  pep447x;
label values plnmgd1   pep448x;   label values mgchmd1   pep449x;
label values mgprmd1   pep025x;   label values mgpymd1   pep025x;
label values mgpref1   pep025x;   label values hitype2   pep437x;
label values whonam2   pep438x;   label values plnwrk2   pep439x;
label values plnpay12  pep424x;   label values plnpay22  pep424x;
label values plnpay32  pep424x;   label values plnpay42  pep424x;
label values plnpay52  pep424x;   label values plnpay62  pep424x;
label values plnpay72  pep424x;   label values hicostr2  pep447x;
label values plnmgd2   pep448x;   label values mgchmd2   pep449x;
label values mgprmd2   pep025x;   label values mgpymd2   pep025x;
label values mgpref2   pep025x;   label values hitype3   pep437x;
label values whonam3   pep438x;   label values plnwrk3   pep439x;
label values plnpay13  pep424x;   label values plnpay23  pep424x;
label values plnpay33  pep424x;   label values plnpay43  pep424x;
label values plnpay53  pep424x;   label values plnpay63  pep424x;
label values plnpay73  pep424x;   label values hicostr3  pep447x;
label values plnmgd3   pep448x;   label values mgchmd3   pep449x;
label values mgprmd3   pep025x;   label values mgpymd3   pep025x;
label values mgpref3   pep025x;   label values hitype4   pep437x;
label values whonam4   pep438x;   label values plnwrk4   pep439x;
label values plnpay14  pep424x;   label values plnpay24  pep424x;
label values plnpay34  pep424x;   label values plnpay44  pep424x;
label values plnpay54  pep424x;   label values plnpay64  pep424x;
label values plnpay74  pep424x;   label values hicostr4  pep447x;
label values plnmgd4   pep448x;   label values mgchmd4   pep449x;
label values mgprmd4   pep025x;   label values mgpymd4   pep025x;
label values mgpref4   pep025x;   label values ihs       pep073x;
label values military  pep502x;   label values chip      pep073x;
label values otherpub  pep073x;   label values othergov  pep073x;
label values notcov    pep506x;   label values hilast    pep507x;
label values histop1   pep424x;   label values histop2   pep424x;
label values histop3   pep424x;   label values histop4   pep424x;
label values histop5   pep424x;   label values histop6   pep424x;
label values histop7   pep424x;   label values histop8   pep424x;
label values histop9   pep424x;   label values histop10  pep424x;
label values histop11  pep424x;   label values histop12  pep424x;
label values histop13  pep424x;   label values histop14  pep424x;
label values histop15  pep424x;   label values hinotyr   pep025x;
label values hinotmyr  pep524x;   label values hcspfyr   pep525x;

label values regionbr  pep526x;   label values geobrth   pep527x;
label values yrsinus   pep528x;   label values citizenp  pep529x;
label values headst    pep025x;   label values headstv1  pep025x;
label values educ      pep532x;   label values educ_r1   pep533x;
label values miltryds  pep025x;   label values doinglw1  pep535x;
label values whynowk1  pep536x;   label values wrkhrs    pep537x;
label values wrkftall  pep025x;   label values wrklyr1   pep025x;
label values wrkmyr    pep524x;   label values majr_act  pep541x;
label values ernyr_p   pep542x;   label values hiempof   pep025x;

label values psal      pep025x;   label values pseinc    pep025x;
label values pssrr     pep073x;   label values pssrrdb   pep025x;
label values pssrrd    pep025x;   label values ppens     pep073x;
label values popens    pep073x;   label values pssi      pep073x;
label values pssid     pep025x;   label values ptanf     pep073x;
label values powben    pep073x;   label values pintrstr  pep073x;
label values pdivd     pep073x;   label values pchldsp   pep073x;
label values pincot    pep073x;   label values incgrp    pep559x;
label values ab_bl20k  pep560x;   label values rat_cat   pep561x;
label values houseown  pep562x;   label values fgah      pep025x;
label values pssapl    pep073x;   label values psdapl    pep073x;
label values tanfmyr   pep566x;   label values pfstp     pep073x;
label values fstpmyr   pep566x;   label values eligpwic  pep569x;
label values pwic      pep025x;   label values wic_flag  pep571x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate educ [fweight=wtfa];
save $OUT/personsx, replace;

#delimit cr

* data file is stored in personsx.dta
* log  file is stored in personsx.log

log close
