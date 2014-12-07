global DAT "~/database/NHIS/Data/raw/2010"
global OUT "~/database/NHIS/Data/dta/2010"
global LOG "~/database/NHIS/Log"

log using "$LOG/samadult.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 JUNE 6, 2011 12:12 PM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2010 NHIS Public Use Sample Adult ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE samadult.dta AND samadult.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2010\

 THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
 LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
 USER SHOULD ENTER THE FOLLOWING STATA COMMAND: log close
 
 THIS IS STORED IN samadult.do
*********************************************************************;
clear;
set mem 200m;

* INPUT ALL VARIABLES;

infix
      rectype       1 -   2      srvy_yr       3 -   6
  str hhx           7 -  12      intv_qrt     13 -  13
      assignwk     14 -  15  str fmx          16 -  17
  str fpx          18 -  19      wtia_sa      20 -  26
      wtfa_sa      27 -  32

      region       33 -  33      strat_p      34 -  36
      psu_p        37 -  38

      sex          39 -  39      hispan_i     40 -  41
      racerpi2     42 -  43      mracrpi2     44 -  45
      mracbpi2     46 -  47      age_p        48 -  49

      r_maritl     50 -  50

      proxysa      51 -  51      prox1        52 -  52
      prox2        53 -  53

      qol_flg      54 -  54

      fdrn_flg     55 -  55

      doinglwa     56 -  56      whynowka     57 -  58
      everwrk      59 -  59      indstrn1     60 -  61
      indstrn2     62 -  63      occupn1      64 -  65
      occupn2      66 -  67      wrkcata      68 -  68
      businc1a     69 -  69      locall1a     70 -  71
      yrswrkpa     72 -  73      wrklongh     74 -  74
      hourpda      75 -  75      pdsicka      76 -  76
      onejob       77 -  77      wrklyr4      78 -  78
      mreclong     79 -  79      indspy1      80 -  81
      indspy2      82 -  83      occuppy1     84 -  85
      occuppy2     86 -  87      wrkcatpy     88 -  88
      yrswrkpy     89 -  90      indslh1      91 -  92
      indslh2      93 -  94      occuplh1     95 -  96
      occuplh2     97 -  98      wrkcatlh     99 -  99
      yrswrklh    100 - 101      wrkarrng    102 - 102
      wrktemp     103 - 103      wrksched    104 - 104
      worunemp    105 - 105      workwfam    106 - 106
      harassed    107 - 107      chemexp     108 - 108
      smokexp     109 - 109      wrkoutdr    110 - 110
      vaporexp    111 - 111      ipwhatr     112 - 112
      injwcclm    113 - 113      injwcben    114 - 114

      hypev       115 - 115      hypdifv     116 - 116
      chdev       117 - 117      angev       118 - 118
      miev        119 - 119      hrtev       120 - 120
      strev       121 - 121      ephev       122 - 122
      aasmev      123 - 123      aasstill    124 - 124
      aasmyr      125 - 125      aaseryr1    126 - 126
      aasage_p    127 - 128      aasage16    129 - 129
      aasstat     130 - 130      aasemp      131 - 131
      aascjob     132 - 132      aaslhjob    133 - 133
      indstas1    134 - 135      indstas2    136 - 137
      occupas1    138 - 139      occupas2    140 - 141
      aaswkrel    142 - 142      aasdwkrl    143 - 143
      aaswcclm    144 - 144      aaswcben    145 - 145
      aaswkday    146 - 148      aaschjob    149 - 149
      ulcev       150 - 150      ulcyr       151 - 151
      canev       152 - 152      cnkind1     153 - 153
      cnkind2     154 - 154      cnkind3     155 - 155
      cnkind4     156 - 156      cnkind5     157 - 157
      cnkind6     158 - 158      cnkind7     159 - 159
      cnkind8     160 - 160      cnkind9     161 - 161
      cnkind10    162 - 162      cnkind11    163 - 163
      cnkind12    164 - 164      cnkind13    165 - 165
      cnkind14    166 - 166      cnkind15    167 - 167
      cnkind16    168 - 168      cnkind17    169 - 169
      cnkind18    170 - 170      cnkind19    171 - 171
      cnkind20    172 - 172      cnkind21    173 - 173
      cnkind22    174 - 174      cnkind23    175 - 175
      cnkind24    176 - 176      cnkind25    177 - 177
      cnkind26    178 - 178      cnkind27    179 - 179
      cnkind28    180 - 180      cnkind29    181 - 181
      cnkind30    182 - 182      cnkind31    183 - 183
      canage1     184 - 186      canage2     187 - 189
      canage3     190 - 192      canage4     193 - 195
      canage5     196 - 198      canage6     199 - 201
      canage7     202 - 204      canage8     205 - 207
      canage9     208 - 210      canage10    211 - 213
      canage11    214 - 216      canage12    217 - 219
      canage13    220 - 222      canage14    223 - 225
      canage15    226 - 228      canage16    229 - 231
      canage17    232 - 234      canage18    235 - 237
      canage19    238 - 240      canage20    241 - 243
      canage21    244 - 246      canage22    247 - 249
      canage23    250 - 252      canage24    253 - 255
      canage25    256 - 258      canage26    259 - 261
      canage27    262 - 264      canage28    265 - 267
      canage29    268 - 270      canage30    271 - 273
      dibev       274 - 274      dibpre1     275 - 275
      dibage      276 - 277      difage2     278 - 279
      insln       280 - 280      dibpill     281 - 281
      epilep1     282 - 282      epilep2     283 - 283
      epilep3     284 - 284      epilep4     285 - 285
      epilep5     286 - 286      ahayfyr     287 - 287
      sinyr       288 - 288      cbrchyr     289 - 289
      kidwkyr     290 - 290      livyr       291 - 291
      drmyr       292 - 292      drmbody1    293 - 293
      drmbody2    294 - 294      drmbody3    295 - 295
      drmbody4    296 - 296      drmtret     297 - 297
      drmwkrel    298 - 298      drmcjob     299 - 299
      drmlhjob    300 - 300      indsdr1     301 - 302
      indsdr2     303 - 304      occupdr1    305 - 306
      occupdr2    307 - 308      drmwcclm    309 - 309
      drmwcben    310 - 310      drmwkday    311 - 313
      drmchjob    314 - 314      jntsymp     315 - 315
      jmthp1      316 - 316      jmthp2      317 - 317
      jmthp3      318 - 318      jmthp4      319 - 319
      jmthp5      320 - 320      jmthp6      321 - 321
      jmthp7      322 - 322      jmthp8      323 - 323
      jmthp9      324 - 324      jmthp10     325 - 325
      jmthp11     326 - 326      jmthp12     327 - 327
      jmthp13     328 - 328      jmthp14     329 - 329
      jmthp15     330 - 330      jmthp16     331 - 331
      jmthp17     332 - 332      jntchr      333 - 333
      jnthp       334 - 334      arth1       335 - 335
      arthlmt     336 - 336      ctsever     337 - 337
      ctsyr       338 - 338      ctsage_p    339 - 340
      ctswkrel    341 - 341      ctscjob     342 - 342
      ctslhjob    343 - 343      indstct1    344 - 345
      indstct2    346 - 347      occupct1    348 - 349
      occupct2    350 - 351      ctswcclm    352 - 352
      ctswcben    353 - 353      ctswkday    354 - 356
      ctschjob    357 - 357      paineck     358 - 358
      painlb      359 - 359      painleg     360 - 360
      painface    361 - 361      amigr       362 - 362
      acold2w     363 - 363      aintil2w    364 - 364
      pregnow     365 - 365      hraidnow    366 - 366
      hraidev     367 - 367      ahearst1    368 - 368
      avision     369 - 369      ablind      370 - 370
      lupprt      371 - 371      sad         372 - 372
      nervous     373 - 373      restless    374 - 374
      hopeless    375 - 375      effort      376 - 376
      worthls     377 - 377      mhamtmo     378 - 378

      wkdayr      379 - 381      beddayr     382 - 384
      ahstatyr    385 - 385      speceq      386 - 386
      flwalk      387 - 387      flclimb     388 - 388
      flstand     389 - 389      flsit       390 - 390
      flstoop     391 - 391      flreach     392 - 392
      flgrasp     393 - 393      flcarry     394 - 394
      flpush      395 - 395      flshop      396 - 396
      flsocl      397 - 397      flrelax     398 - 398
      fla1ar      399 - 399      aflhca1     400 - 400
      aflhca2     401 - 401      aflhca3     402 - 402
      aflhca4     403 - 403      aflhca5     404 - 404
      aflhca6     405 - 405      aflhca7     406 - 406
      aflhca8     407 - 407      aflhca9     408 - 408
      aflhca10    409 - 409      aflhca11    410 - 410
      aflhca12    411 - 411      aflhca13    412 - 412
      aflhca14    413 - 413      aflhca15    414 - 414
      aflhca16    415 - 415      aflhca17    416 - 416
      aflhca18    417 - 417      aflhc19_    418 - 418
      aflhc20_    419 - 419      aflhc21_    420 - 420
      aflhc22_    421 - 421      aflhc23_    422 - 422
      aflhc24_    423 - 423      aflhc25_    424 - 424
      aflhc26_    425 - 425      aflhc27_    426 - 426
      aflhc28_    427 - 427      aflhc29_    428 - 428
      aflhc30_    429 - 429      aflhc31_    430 - 430
      aflhc32_    431 - 431      aflhc33_    432 - 432
      aflhc34_    433 - 433      aflhca90    434 - 434
      aflhca91    435 - 435      altime1     436 - 437
      alunit1     438 - 438      aldura1     439 - 440
      aldurb1     441 - 441      alchrc1     442 - 442
      altime2     443 - 444      alunit2     445 - 445
      aldura2     446 - 447      aldurb2     448 - 448
      alchrc2     449 - 449      altime3     450 - 451
      alunit3     452 - 452      aldura3     453 - 454
      aldurb3     455 - 455      alchrc3     456 - 456
      altime4     457 - 458      alunit4     459 - 459
      aldura4     460 - 461      aldurb4     462 - 462
      alchrc4     463 - 463      altime5     464 - 465
      alunit5     466 - 466      aldura5     467 - 468
      aldurb5     469 - 469      alchrc5     470 - 470
      altime6     471 - 472      alunit6     473 - 473
      aldura6     474 - 475      aldurb6     476 - 476
      alchrc6     477 - 477      altime7     478 - 479
      alunit7     480 - 480      aldura7     481 - 482
      aldurb7     483 - 483      alchrc7     484 - 484
      altime8     485 - 486      alunit8     487 - 487
      aldura8     488 - 489      aldurb8     490 - 490
      alchrc8     491 - 491      altime9     492 - 493
      alunit9     494 - 494      aldura9     495 - 496
      aldurb9     497 - 497      alchrc9     498 - 498
      altime10    499 - 500      alunit10    501 - 501
      aldura10    502 - 503      aldurb10    504 - 504
      alchrc10    505 - 505      altime11    506 - 507
      alunit11    508 - 508      aldura11    509 - 510
      aldurb11    511 - 511      alchrc11    512 - 512
      altime12    513 - 514      alunit12    515 - 515
      aldura12    516 - 517      aldurb12    518 - 518
      alchrc12    519 - 519      altime13    520 - 521
      alunit13    522 - 522      aldura13    523 - 524
      aldurb13    525 - 525      alchrc13    526 - 526
      altime14    527 - 528      alunit14    529 - 529
      aldura14    530 - 531      aldurb14    532 - 532
      alchrc14    533 - 533      altime15    534 - 535
      alunit15    536 - 536      aldura15    537 - 538
      aldurb15    539 - 539      alchrc15    540 - 540
      altime16    541 - 542      alunit16    543 - 543
      aldura16    544 - 545      aldurb16    546 - 546
      alchrc16    547 - 547      altime17    548 - 549
      alunit17    550 - 550      aldura17    551 - 552
      aldurb17    553 - 553      alchrc17    554 - 554
      altime18    555 - 556      alunit18    557 - 557
      aldura18    558 - 559      aldurb18    560 - 560
      alchrc18    561 - 561      altime19    562 - 563
      alunit19    564 - 564      aldura19    565 - 566
      aldurb19    567 - 567      alchrc19    568 - 568
      altime20    569 - 570      alunit20    571 - 571
      aldura20    572 - 573      aldurb20    574 - 574
      alchrc20    575 - 575      altime21    576 - 577
      alunit21    578 - 578      aldura21    579 - 580
      aldurb21    581 - 581      alchrc21    582 - 582
      altime22    583 - 584      alunit22    585 - 585
      aldura22    586 - 587      aldurb22    588 - 588
      alchrc22    589 - 589      altime23    590 - 591
      alunit23    592 - 592      aldura23    593 - 594
      aldurb23    595 - 595      alchrc23    596 - 596
      altime24    597 - 598      alunit24    599 - 599
      aldura24    600 - 601      aldurb24    602 - 602
      alchrc24    603 - 603      altime25    604 - 605
      alunit25    606 - 606      aldura25    607 - 608
      aldurb25    609 - 609      alchrc25    610 - 610
      altime26    611 - 612      alunit26    613 - 613
      aldura26    614 - 615      aldurb26    616 - 616
      alchrc26    617 - 617      altime27    618 - 619
      alunit27    620 - 620      aldura27    621 - 622
      aldurb27    623 - 623      alchrc27    624 - 624
      altime28    625 - 626      alunit28    627 - 627
      aldura28    628 - 629      aldurb28    630 - 630
      alchrc28    631 - 631      altime29    632 - 633
      alunit29    634 - 634      aldura29    635 - 636
      aldurb29    637 - 637      alchrc29    638 - 638
      altime30    639 - 640      alunit30    641 - 641
      aldura30    642 - 643      aldurb30    644 - 644
      alchrc30    645 - 645      altime31    646 - 647
      alunit31    648 - 648      aldura31    649 - 650
      aldurb31    651 - 651      alchrc31    652 - 652
      altime32    653 - 654      alunit32    655 - 655
      aldura32    656 - 657      aldurb32    658 - 658
      alchrc32    659 - 659      altime33    660 - 661
      alunit33    662 - 662      aldura33    663 - 664
      aldurb33    665 - 665      alchrc33    666 - 666
      altime34    667 - 668      alunit34    669 - 669
      aldura34    670 - 671      aldurb34    672 - 672
      alchrc34    673 - 673      altime90    674 - 675
      alunit90    676 - 676      aldura90    677 - 678
      aldurb90    679 - 679      alchrc90    680 - 680
      altime91    681 - 682      alunit91    683 - 683
      aldura91    684 - 685      aldurb91    686 - 686
      alchrc91    687 - 687      alcndrt     688 - 688
      alchronr    689 - 689

      smkev       690 - 690      smkreg      691 - 692
      smknow      693 - 693      smkstat2    694 - 694
      smkqtno     695 - 696      smkqttp     697 - 697
      smkqty      698 - 699      cigsda1     700 - 701
      cigdamo     702 - 703      cigsda2     704 - 705
      cigsday     706 - 707      cigqtyr     708 - 708
      vigno       709 - 711      vigtp       712 - 712
      vigfreqw    713 - 714      viglngno    715 - 717
      viglngtp    718 - 718      vigmin      719 - 721
      modno       722 - 724      modtp       725 - 725
      modfreqw    726 - 727      modlngno    728 - 730
      modlngtp    731 - 731      modmin      732 - 734
      strngno     735 - 737      strngtp     738 - 738
      strfreqw    739 - 740      alc1yr      741 - 741
      alclife     742 - 742      alc12mno    743 - 745
      alc12mtp    746 - 746      alc12mwk    747 - 748
      alc12myr    749 - 751      alcamt      752 - 753
      alcstat     754 - 755      alc5upno    756 - 758
      alc5uptp    759 - 759      alc5upyr    760 - 762
      aheight     763 - 764      aweightp    765 - 767
      bmi         768 - 771      sleep       772 - 773

      ausualpl    774 - 774      aplkind     775 - 775
      ahcplrou    776 - 776      ahcplknd    777 - 777
      ahcchgyr    778 - 778      ahcchghi    779 - 779
      ahcdlyr1    780 - 780      ahcdlyr2    781 - 781
      ahcdlyr3    782 - 782      ahcdlyr4    783 - 783
      ahcdlyr5    784 - 784      ahcafyr1    785 - 785
      ahcafyr2    786 - 786      ahcafyr3    787 - 787
      ahcafyr4    788 - 788      adnlong2    789 - 789
      ahcsyr1     790 - 790      ahcsyr2     791 - 791
      ahcsyr3     792 - 792      ahcsyr4     793 - 793
      ahcsyr5     794 - 794      ahcsyr6     795 - 795
      ahcsyr7     796 - 796      ahcsyr8     797 - 797
      ahcsyr9     798 - 798      ahcsyr10    799 - 799
      ahernoy2    800 - 801      ahchyr      802 - 802
      ahchmoyr    803 - 804      ahchnoy2    805 - 806
      ahcnoyr2    807 - 808      asrgyr      809 - 809
      asrgnoyr    810 - 811      amdlongr    812 - 812
      ah1n1_1     813 - 813      ah1n1_3m    814 - 815
      ah1n1_4y    816 - 819      ah1n1_5     820 - 820
      shtfluyr    821 - 821      ashflu_m    822 - 823
      ashflu_y    824 - 827      sprfluyr    828 - 828
      aspflu_m    829 - 830      aspflu_y    831 - 834
      shtflu2     835 - 835      ashflum2    836 - 837
      ashfluy2    838 - 841      sprflu2     842 - 842
      aspflum2    843 - 844      aspfluy2    845 - 848
      shtpnuyr    849 - 849      apox        850 - 850
      apox12mo    851 - 851      ahep        852 - 852
      ahepliv     853 - 853      shthepb     854 - 854
      shepdos     855 - 855      shthepa     856 - 856
      shepanum    857 - 858      shingles    859 - 859
      shttd       860 - 860      shttd05     861 - 861
      shttdap     862 - 862      livev       863 - 863
      travel      864 - 864      wrkhlth     865 - 865
      wrkdir      866 - 866

      bldgv       867 - 867      bldg12m     868 - 868
      hivtst      869 - 869      whytst_r    870 - 871
      tst12m_m    872 - 873      tst12m_y    874 - 877
      timetst     878 - 878      reatst_c    879 - 880
      reaswhor    881 - 881      lastst_c    882 - 883
      clntyp_c    884 - 885      whoadm      886 - 886
      givnam      887 - 887      extst12m    888 - 888
      chnsadsp    889 - 889      stmtru      890 - 890
      std         891 - 891      stddoc      892 - 892
      stdwher     893 - 893      tbhrd       894 - 894
      tbknow      895 - 895      tb          896 - 896
      tbsprd1     897 - 897      tbsprd2     898 - 898
      tbsprd3     899 - 899      tbsprd4     900 - 900
      tbsprd5     901 - 901      tbsprd6     902 - 902
      tbcured     903 - 903      tbchanc     904 - 904
      tbshame     905 - 905      homeless    906 - 906

using "$DAT/samadult.dat";
replace wtia_sa = wtia_sa/10;
replace bmi = bmi/100;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: Household Number";
label variable intv_qrt "IDN.000_25.000: Interview Quarter";
label variable assignwk "IDN.000_30.000: Assignment Week";
label variable fmx      "IDN.000_35.000: Family Number";
label variable fpx      "IDN.000_40.000: Person Number (Within family)";
label variable wtia_sa  "IDN.000_65.000: Weight - Interim Annual";
label variable wtfa_sa  "IDN.000_70.000: Weight - Final Annual";

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

label variable r_maritl "FID.250_00.000: Marital Status";

label variable proxysa  "AID.005_00.000: Sample adult status";
label variable prox1    "
AID.010_00.000: Knowledgeable proxy for Sample Adult available";
label variable prox2    "AID.015_00.000: Relationship of SA proxy to SA";

label variable qol_flg  "QOL.001_00.000: Quality of life flag";

label variable fdrn_flg "FDB.001_00.000: Disability Questions Tests flag";

label variable doinglwa "ASD.062_00.000: Corrected employment status last week";
label variable whynowka "ASD.065_00.000: Main reason for not working last week";
label variable everwrk  "ASD.066_00.000: Ever worked";
label variable indstrn1 "
ASD.080_00.000: Detailed industry classification (based on 2007 NAICS codes from
 Census)";
label variable indstrn2 "
ASD.080_00.000: Simple industry classification (based on 2007 NAICS Codes from C
ensus)";
label variable occupn1  "
ASD.090_00.000: Detailed occupation classification (based on 2010 SOC codes from
 Census)";
label variable occupn2  "
ASD.090_00.000: Simple occupation classification (based on 2010 SOC codes from C
ensus)";
label variable wrkcata  "ASD.110_00.000: Class of worker";
label variable businc1a "ASD.112_00.000: Current job an incorporated business";
label variable locall1a "ASD.120_00.000: Number of employees at work";
label variable yrswrkpa "ASD.140_02.000: Number of years on the job";
label variable wrklongh "
ASD.146_00.000: Current/most recent job also longest held job";
label variable hourpda  "
ASD.150_00.000: Paid by the hour at current/most recent job";
label variable pdsicka  "
ASD.160_00.000: Paid sick leave at current/most recent job";
label variable onejob   "ASD.170_00.000: Have more than one job";
label variable wrklyr4  "ASD.210_00.000: Work status: last week, past 12 months
";
label variable mreclong "
ASD.210_00.010: Job held in past 12 months was longest-held job";
label variable indspy1  "
ASD.210_00.030: Detailed industry classification (retired or 65+; worked in past
 12 months; not longest-held job)";
label variable indspy2  "
ASD.210_00.030: Simple industry classification (retired or 65+; worked in past 1
2 months; not longest-held job)";
label variable occuppy1 "
ASD.210_00.040: Detailed occupation classification (retired or 65+; worked in pa
st 12 months; not longest-held job)";
label variable occuppy2 "
ASD.210_00.040: Simple occupation classification (retired or 65+; worked in past
 12 months; not longest-held job)";
label variable wrkcatpy "
ASD.210_00.060: Class of worker (retired or 65+; worked in past 12 months; not l
ongest-held job)";
label variable yrswrkpy "
RECODE: Number of years on the job (retired or 65+; worked in past 12 months; no
t longest-held job)";
label variable indslh1  "
ASD.210_00.090: Detailed industry classification (current or most recent job not
 longest-held job)";
label variable indslh2  "
ASD.210_00.090: Simple industry classification (current or most recent job not l
ongest-held job)";
label variable occuplh1 "
ASD.210_00.100: Detailed occupation classification (current or most recent job n
ot longest-held job)";
label variable occuplh2 "
ASD.210_00.100: Simple occupation classification (current or most recent job not
 longest-held job)";
label variable wrkcatlh "
ASD.210_00.120: Class of worker (current or most recent job not longest-held job
)";
label variable yrswrklh "
RECODE: Number of years on the job (current or most recent job not longest-held 
job)";
label variable wrkarrng "ASD.210_00.140: Work arrangement";
label variable wrktemp  "ASD.210_00.150: Temporary job";
label variable wrksched "ASD.210_00.160: Work schedule";
label variable worunemp "ASD.210_00.170: Worried about becoming unemployed";
label variable workwfam "
ASD.210_00.180: Compatibility of work and family responsibilities";
label variable harassed "
ASD.210_00.190: Experienced harassment, bullying on the job, past 12 months";
label variable chemexp  "
ASD.210_00.200: Experienced regular skin contact with chemical substances on the
 job, past 12 months";
label variable smokexp  "
ASD.210_00.210: Experienced regular exposure to tobacco smoke from other people 
at work, past 12 months";
label variable wrkoutdr "
ASD.210_00.220: Regularly worked outdoors twice a week or more, past 12 months";
label variable vaporexp "
ASD.210_00.230: Regularly exposed to vapors, gas, dust, or fumes at work twice a
 week or more";
label variable ipwhatr  "
ASD.210_00.239: Had injury/poisoning during the past 3 months while working at a
 paid job";
label variable injwcclm "
ASD.210_00.240: Filed workers' compensation form for on-the-job injury or poison
ing";
label variable injwcben "
ASD.210_00.250: Received workers' compensation benefits for on-the-job injury or
 poisoning";

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
label variable aaseryr1 "ACN.100_00.000: Had visit to ER due to asthma past 12 m
";
label variable aasage_p "ACN.105_00.010: Age when first told had asthma";
label variable aasage16 "ACN.105_00.015: Less than 16 first told had asthma";
label variable aasstat  "ACN.105_00.020: Asthma better/worse/same";
label variable aasemp   "ACN.105_00.030: Employed when asthma developed/worsened
";
label variable aascjob  "
ACN.105_00.040: Current/most recent job when asthma developed/worsened";
label variable aaslhjob "
ACN.105_00.045: Longest job held when asthma developed/worsened";
label variable indstas1 "ACN.105_00.060: Detailed industry classification";
label variable indstas2 "ACN.105_00.060: Simple industry classification";
label variable occupas1 "ACN.105_00.070: Detailed occupation classification";
label variable occupas2 "ACN.105_00.070: Simple occupation classification";
label variable aaswkrel "ACN.105_00.100: Ever told asthma work-related";
label variable aasdwkrl "ACN.105_00.110: Ever discuss if asthma work-related";
label variable aaswcclm "ACN.105_00.120: Ever filed workers' comp for asthma";
label variable aaswcben "ACN.105_00.130: Ever received workers' comp for asthma
";
label variable aaswkday "ACN.105_00.140: # Work days missed past 12 m";
label variable aaschjob "ACN.105_00.150: Change work activities past 12 m";
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
label variable cnkind23 "ACN.140_23.000: What kind of cancer ... skin (DK kind)
";
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
label variable dibpre1  "ACN.165_00.000: Ever had prediabetes or other symptoms
";
label variable dibage   "ACN.170_00.000: Age first diagnosed w/diabetes";
label variable difage2  "ACN.170_00.000: Years since first diagnosed w/diabetes
";
label variable insln    "ACN.180_00.000: NOW taking insulin";
label variable dibpill  "ACN.190_00.000: NOW taking diabetic pills";
label variable epilep1  "
ACN.192_00.010: Ever been told you had seizure disorder/epilepsy";
label variable epilep2  "ACN.192_00.020: Now taking epilepsy meds";
label variable epilep3  "ACN.192_00.030: # Seizures past 12 m";
label variable epilep4  "ACN.192_00.040: Seen neurologist/specialist past 12 m";
label variable epilep5  "
ACN.192_00.050: Epilepsy interfered w/activities past 30 d";
label variable ahayfyr  "ACN.201_01.000: Told that you had hay fever, past 12 m
";
label variable sinyr    "ACN.201_02.000: Told that you had sinusitis, past 12 m
";
label variable cbrchyr  "ACN.201_03.000: Told you had chronic bronchitis, 12 m";
label variable kidwkyr  "ACN.201_04.000: Told you had weak/failing kidneys, 12 m
";
label variable livyr    "ACN.201_05.000: Told you had liver condition, past 12 m
";
label variable drmyr    "ACN.210_00.010: Dermatitis/skin condition past 12 m";
label variable drmbody1 "ACN.215_01.010: What body part affected…hands";
label variable drmbody2 "ACN.215_02.010: What body part affected…arms";
label variable drmbody3 "ACN.215_03.010: What body part affected…head/face/neck
";
label variable drmbody4 "ACN.215_04.010: What body part affected…other";
label variable drmtret  "
ACN.217_00.010: Ever seen doctor/health prof for skin condition";
label variable drmwkrel "
ACN.217_00.020: Ever been told skin condition work-related";
label variable drmcjob  "
ACN.220_00.020: Skin condition related to current/most recent job";
label variable drmlhjob "
ACN.220_00.030: Skin condition related to longest-held job";
label variable indsdr1  "ACN.220_00.050: Detailed industry classification";
label variable indsdr2  "ACN.220_00.050: Simple industry classification";
label variable occupdr1 "ACN.220_00.060: Detailed occupation classification";
label variable occupdr2 "ACN.220_00.060: Simple occupation classification";
label variable drmwcclm "
ACN.220_00.100: Ever filed workers' comp for skin condition";
label variable drmwcben "
ACN.220_00.110: Ever receive workers' comp for skin condition";
label variable drmwkday "
ACN.220_00.120: # Work days missed due to skin condition past 12 m";
label variable drmchjob "ACN.220_00.130: Change in work activities past 12 m";
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
label variable jntchr   "
ACN.270_00.000: Joint symptoms begin more than 3 months ago";
label variable jnthp    "
ACN.280_00.000: Ever seen doctor or health professional for joint symptoms";
label variable arth1    "ACN.290_00.000: Ever been told you had arthritis";
label variable arthlmt  "
ACN.295_00.000: Limited due to arthritis or joint symptoms";
label variable ctsever  "
ACN.296_00.010: Ever been told you had carpal tunnel syndrome";
label variable ctsyr    "ACN.296_00.020: Carpal tunnel synd past 12m";
label variable ctsage_p "
ACN.297_00.010: Age first diagnosed w/ carpal tunnel synd";
label variable ctswkrel "ACN.297_00.015: Told carpal tunnel synd work-related";
label variable ctscjob  "
ACN.297_00.030: Carpal tunnel synd related to current/most recent job";
label variable ctslhjob "
ACN.297_00.040: Carpal tunnel synd related to longest-held job";
label variable indstct1 "ACN.297_00.060: Detailed industry classification";
label variable indstct2 "ACN.297_00.060: Simple industry classification";
label variable occupct1 "ACN.297_00.070: Detailed occupation classification";
label variable occupct2 "ACN.297_00.070: Simple occupation classification";
label variable ctswcclm "
ACN.297_00.100: Ever filed workers' comp for carpal tunnel synd";
label variable ctswcben "
ACN.297_00.110: Ever receive workers' comp for carpal tunnel synd";
label variable ctswkday "
ACN.297_00.120: # Work days missed due to carpal tunnel synd past 12 m";
label variable ctschjob "
ACN.297_00.130: Change in work activities due to carpal tunnel synd past 12 m";
label variable paineck  "ACN.300_00.000: Had neck pain, past 3 months";
label variable painlb   "ACN.310_00.000: Had low back pain, past 3 months";
label variable painleg  "ACN.320_00.000: Pain spread down leg/below knees";
label variable painface "
ACN.331_01.000: Had pain in jaw/front of ear, past 3 months";
label variable amigr    "ACN.331_02.000: Had severe headache/migraine, past 3 m
";
label variable acold2w  "ACN.350_00.000: Had a head/chest cold past 2 w";
label variable aintil2w "ACN.360_00.000: Had stomach prob w/vomit/diarrhea, 2 w
";
label variable pregnow  "ACN.370_00.000: Currently pregnant";
label variable hraidnow "ACN.400_00.000: Now use a hearing aid";
label variable hraidev  "
ACN.410_00.000: Ever used a hearing aid if not now using";
label variable ahearst1 "ACN.420_00.000: Hearing w/o hearing aid";
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

label variable wkdayr   "
AHS.040_00.000: Number of work loss days, past 12 months";
label variable beddayr  "AHS.050_00.000: Number of bed days, past 12 months";
label variable ahstatyr "
AHS.060_00.000: Health better/worse/same, compared w/ 12 months ago";
label variable speceq   "
AHS.070_00.000: Have health problem that requires special equipment";
label variable flwalk   "
AHS.091_01.000: How difficult to walk 1/4 mile without special equipment";
label variable flclimb  "
AHS.091_02.000: How difficult to climb 10 steps without special equipment";
label variable flstand  "
AHS.091_03.000: How difficult to stand 2 hours without special equipment";
label variable flsit    "
AHS.091_04.000: How difficult to sit 2 hours without special equipment";
label variable flstoop  "
AHS.091_05.000: How difficult to stoop, bend or kneel without special equipment
";
label variable flreach  "
AHS.091_06.000: How difficult to reach over head without special equipment";
label variable flgrasp  "
AHS.141_01.000: How difficult to grasp small objects without special equipment";
label variable flcarry  "
AHS.141_02.000: How difficult to lift/carry 10 lbs without special equipment";
label variable flpush   "
AHS.141_03.000: How difficult to push large objects without special equipment";
label variable flshop   "
AHS.171_01.000: How difficult to go out to events without special equipment";
label variable flsocl   "
AHS.171_02.000: How difficult to participate in social activities without specia
l equipment";
label variable flrelax  "
AHS.171_03.000: How difficult to relax at home without special equipment";
label variable fla1ar   "
AHS.171_00.000: Any functional limitation, all conditions";
label variable aflhca1  "
AHS.200_01.000: Vision/problem seeing causes difficulty with activity";
label variable aflhca2  "
AHS.200_02.000: Hearing problem causes difficulty with activity";
label variable aflhca3  "
AHS.200_03.000: Arthritis/rheumatism causes difficulty with activity";
label variable aflhca4  "
AHS.200_04.000: Back or neck problem causes difficulty with activity";
label variable aflhca5  "
AHS.200_05.000: Fracture, bone/joint injury causes difficulty with activity";
label variable aflhca6  "
AHS.200_06.000: Other injury causes difficulty with activity";
label variable aflhca7  "
AHS.200_07.000: Heart problem causes difficulty with activity";
label variable aflhca8  "
AHS.200_08.000: Stroke problem causes difficulty with activity";
label variable aflhca9  "
AHS.200_09.000: Hypertension/high blood pressure causes difficulty with activity
";
label variable aflhca10 "
AHS.200_10.000: Diabetes causes difficulty with activity";
label variable aflhca11 "
AHS.200_11.000: Lung/breathing problem (e.g., asthma and emphysema)  causes diff
iculty with activity";
label variable aflhca12 "AHS.200_12.000: Cancer causes difficulty with activity
";
label variable aflhca13 "
AHS.200_13.000: Birth defect causes difficulty with activity";
label variable aflhca14 "
AHS.200_14.000: Mental retardation causes difficulty with activity";
label variable aflhca15 "
AHS.200_15.000: Other developmental problem (e.g., cerebral palsy) causes diffic
ulty with activity";
label variable aflhca16 "
AHS.200_16.000: Senility causes difficulty with activity";
label variable aflhca17 "
AHS.200_17.000: Depression/anxiety/emotional problem causes difficulty with acti
vity";
label variable aflhca18 "
AHS.200_18.000: Weight problem causes difficulty with activity";
label variable aflhc19_ "
AHS.200_00.000: Missing or amputated limb/finger/digit causes difficulty with ac
tivity";
label variable aflhc20_ "
AHS.200_00.000: Musculoskeletal/connective tissue problem causes difficulty with
 activity";
label variable aflhc21_ "
AHS.200_00.000: Circulation problems (including blood clots) cause difficulty wi
th activity";
label variable aflhc22_ "
AHS.200_00.000: Endocrine/nutritional/metabolic problem causes difficulty with a
ctivity";
label variable aflhc23_ "
AHS.200_00.000: Nervous system/sensory organ condition causes difficulty with ac
tivity";
label variable aflhc24_ "
AHS.200_00.000: Digestive system problem causes difficulty with activity";
label variable aflhc25_ "
AHS.200_00.000: Genitourinary system problem causes difficulty with activity";
label variable aflhc26_ "
AHS.200_00.000: Skin/subcutaneous system problem causes difficulty with activity
";
label variable aflhc27_ "
AHS.200_00.000: Blood or blood-forming organ problem causes difficulty with acti
vity";
label variable aflhc28_ "
AHS.200_00.000: Benign tumor/cyst causes difficulty with activity";
label variable aflhc29_ "
AHS.200_00.000: Alcohol/drug/substance abuse problem causes difficulty with acti
vity";
label variable aflhc30_ "
AHS.200_00.000: Other mental problem/ADD/Bipolar/Schizophrenia causes difficulty
 with activity";
label variable aflhc31_ "
AHS.200_00.000: Surgical after-effects/medical treatment causes difficulty with 
activity";
label variable aflhc32_ "
AHS.200_00.000: 'Old age'/elderly/aging-related problem causes difficulty with a
ctivity";
label variable aflhc33_ "
AHS.200_00.000: Fatigue/tiredness/weakness causes difficulty with activity";
label variable aflhc34_ "
AHS.200_00.000: Pregnancy-related problem causes difficulty with activity";
label variable aflhca90 "
AHS.200_90.000: Other impairment/problem (1) causes difficulty with activity";
label variable aflhca91 "
AHS.200_91.000: Other impairment/problem (2) causes difficulty with activity";
label variable altime1  "
AHS.300_01.000: Duration of vision problem: Number of units";
label variable alunit1  "AHS.300_02.000: Duration of vision problem: Time unit";
label variable aldura1  "
AHS.300_02.000: Duration (in years) of vision problem, recode 1";
label variable aldurb1  "AHS.300_02.000: Duration of vision problem, recode 2";
label variable alchrc1  "AHS.300_02.000: Vision problem condition status recode
";
label variable altime2  "
AHS.301_01.000: Duration of hearing problem: Number of units";
label variable alunit2  "AHS.301_02.000: Duration of hearing problem: Time unit
";
label variable aldura2  "
AHS.301_02.000: Duration (in years) of hearing problem, recode 1";
label variable aldurb2  "AHS.301_02.000: Duration of hearing problem, recode 2";
label variable alchrc2  "AHS.301_02.000: Hearing problem condition status recode
";
label variable altime3  "
AHS.302_01.000: Duration of arthritis/rheumatism: Number of units";
label variable alunit3  "
AHS.302_02.000: Duration of arthritis/rheumatism: Time unit";
label variable aldura3  "
AHS.302_02.000: Duration (in years) of arthritis/rheumatism, recode 1";
label variable aldurb3  "
AHS.302_02.000: Duration of arthritis/rheumatism, recode 2";
label variable alchrc3  "
AHS.302_02.000: Arthritis/rheumatism condition status recode";
label variable altime4  "
AHS.303_01.000: Duration of back or neck problem: Number of units";
label variable alunit4  "
AHS.303_02.000: Duration of back or neck problem: Time unit";
label variable aldura4  "
AHS.303_02.000: Duration (in years) of back or neck problem, recode 1";
label variable aldurb4  "
AHS.303_02.000: Duration of back or neck problem, recode 2";
label variable alchrc4  "
AHS.303_02.000: Back or neck problem condition status recode";
label variable altime5  "
AHS.304_01.000: Duration of fracture, bone/joint injury: Number of units";
label variable alunit5  "
AHS.304_02.000: Duration of fracture, bone/joint injury: Time unit";
label variable aldura5  "
AHS.304_02.000: Duration (in years) of fracture, bone/joint injury, recode 1";
label variable aldurb5  "
AHS.304_02.000: Duration of fracture, bone/joint injury, recode 2";
label variable alchrc5  "
AHS.304_02.000: Fracture, bone/joint injury condition status recode";
label variable altime6  "
AHS.305_01.000: Duration of other injury: Number of units";
label variable alunit6  "AHS.305_02.000: Duration of other injury: Time unit";
label variable aldura6  "
AHS.305_02.000: Duration (in years) of other injury, recode 1";
label variable aldurb6  "AHS.305_02.000: Duration of other injury, recode 2";
label variable alchrc6  "AHS.305_02.000: Other injury condition status recode";
label variable altime7  "
AHS.306_01.000: Duration of heart problem: Number of units";
label variable alunit7  "AHS.306_02.000: Duration of heart problem: Time unit";
label variable aldura7  "
AHS.306_02.000: Duration (in years) of heart problem, recode 1";
label variable aldurb7  "AHS.306_02.000: Duration of heart problem, recode 2";
label variable alchrc7  "AHS.306_02.000: Heart problem condition status recode";
label variable altime8  "
AHS.307_01.000: Duration of stroke problem: Number of units";
label variable alunit8  "AHS.307_02.000: Duration of stroke problem: Time unit";
label variable aldura8  "
AHS.307_02.000: Duration (in years) of stroke problem, recode 1";
label variable aldurb8  "AHS.307_02.000: Duration of stroke problem, recode 2";
label variable alchrc8  "AHS.307_02.000: Stroke problem condition status recode
";
label variable altime9  "
AHS.308_01.000: Duration of hypertension/high blood pressure: Number of units";
label variable alunit9  "
AHS.308_02.000: Duration of hypertension/high blood pressure: Time unit";
label variable aldura9  "
AHS.308_02.000: Duration (in years) of hypertension/high blood pressure, recode 
1";
label variable aldurb9  "
AHS.308_02.000: Duration of hypertension/high blood, pressure recode 2";
label variable alchrc9  "
AHS.308_02.000: Hypertension/high blood pressure condition status recode";
label variable altime10 "AHS.309_01.000: Duration of diabetes: Number of units";
label variable alunit10 "AHS.309_02.000: Duration of diabetes: Time unit";
label variable aldura10 "
AHS.309_02.000: Duration (in years) of diabetes, recode 1";
label variable aldurb10 "AHS.309_02.000: Duration of diabetes, recode 2";
label variable alchrc10 "AHS.309_02.000: Diabetes condition status recode";
label variable altime11 "
AHS.310_01.000: Duration of lung/breathing problem (e.g., asthma and emphysema):
 Number of units";
label variable alunit11 "
AHS.310_02.000: Duration of lung/breathing problem: (e.g., asthma and emphysema)
 Time unit";
label variable aldura11 "
AHS.310_02.000: Duration (in years) of lung/breathing problem (e.g., asthma and 
emphysema), recode 1";
label variable aldurb11 "
AHS.310_02.000: Duration of lung/breathing problem (e.g., asthma and emphysema),
 recode 2";
label variable alchrc11 "
AHS.310_02.000: Lung/breathing problem (e.g., asthma and emphysema) condition st
atus recode";
label variable altime12 "AHS.311_01.000: Duration of cancer: Number of units";
label variable alunit12 "AHS.311_02.000: Duration of cancer: Time unit";
label variable aldura12 "AHS.311_02.000: Duration (in years) of cancer, recode 1
";
label variable aldurb12 "AHS.311_02.000: Duration of cancer, recode 2";
label variable alchrc12 "AHS.311_02.000: Cancer condition status recode";
label variable altime13 "
AHS.312_01.000: Duration of birth defect: Number of units";
label variable alunit13 "AHS.312_02.000: Duration of birth defect: Time unit";
label variable aldura13 "
AHS.312_02.000: Duration (in years) of birth defect, recode 1";
label variable aldurb13 "AHS.312_02.000: Duration of birth defect, recode 2";
label variable alchrc13 "AHS.312_02.000: Birth defect condition status recode";
label variable altime14 "
AHS.313_01.000: Duration of mental retardation: Number of units";
label variable alunit14 "
AHS.313_02.000: Duration of mental retardation: Time unit";
label variable aldura14 "
AHS.313_02.000: Duration (in years) of mental retardation, recode 1";
label variable aldurb14 "
AHS.313_02.000: Duration of mental retardation, recode 2";
label variable alchrc14 "
AHS.313_02.000: Mental retardation condition status recode";
label variable altime15 "
AHS.314_01.000: Duration of other developmental problem (e.g., cerebral palsy): 
Number of units";
label variable alunit15 "
AHS.314_02.000: Duration of other developmental problem (e.g., cerebral palsy): 
Time unit";
label variable aldura15 "
AHS.314_02.000: Duration (in years) of other developmental problem (e.g., cerebr
al palsy), recode 1";
label variable aldurb15 "
AHS.314_02.000: Duration of other developmental problem (e.g., cerebral palsy), 
recode 2";
label variable alchrc15 "
AHS.314_02.000: Other developmental problem (e.g., cerebral palsy) condition sta
tus recode";
label variable altime16 "AHS.315_01.000: Duration of senility: Number of units";
label variable alunit16 "AHS.315_02.000: Duration of senility: Time unit";
label variable aldura16 "
AHS.315_02.000: Duration (in years) of senility, recode 1";
label variable aldurb16 "AHS.315_02.000: Duration of senility, recode 2";
label variable alchrc16 "AHS.315_02.000: Senility condition status recode";
label variable altime17 "
AHS.316_01.000: Duration of depression/anxiety/emotional problem: Number of unit
s";
label variable alunit17 "
AHS.316_02.000: Duration of depression/anxiety/emotional problem: Time unit";
label variable aldura17 "
AHS.316_02.000: Duration (in years) of depression/anxiety/emotional problem, rec
ode 1";
label variable aldurb17 "
AHS.316_02.000: Duration of depression/anxiety/emotional problem, recode 2";
label variable alchrc17 "
AHS.316_02.000: Depression/anxiety/emotional problem condition status recode";
label variable altime18 "
AHS.317_01.000: Duration of weight problem: Number of units";
label variable alunit18 "AHS.317_02.000: Duration of weight problem: Time unit";
label variable aldura18 "
AHS.317_02.000: Duration (in years) of weight problem, recode 1";
label variable aldurb18 "AHS.317_02.000: Duration of weight problem, recode 2";
label variable alchrc18 "AHS.317_02.000: Weight problem condition status recode
";
label variable altime19 "
AHS.318_01.000 RECOD: Duration of missing limbs (fingers, toes, or digits); ampu
tation: Number of units";
label variable alunit19 "
AHS.318_02.000 RECOD: Duration of missing limbs (fingers, toes, or digits); ampu
tation: Time unit";
label variable aldura19 "
AHS.318_02.000: Duration (in years) of missing limbs (fingers, toes, or digits);
 amputation, recode 1";
label variable aldurb19 "
AHS.318_02.000: Duration of missing limbs (fingers, toes, or digits); amputation
, recode 2";
label variable alchrc19 "
AHS.318_02.000: Missing limbs (fingers, toes, or digits); amputation condition s
tatus recode";
label variable altime20 "
AHS.319_01.000 RECOD: Duration of musculoskeletal/connective tissue problem: Num
ber of units";
label variable alunit20 "
AHS.319_02.000 RECOD: Duration of musculoskeletal/connective tissue problem: Tim
e unit";
label variable aldura20 "
AHS.319_02.000: Duration (in years) of musculoskeletal/connective tissue problem
, recode 1";
label variable aldurb20 "
AHS.319_02.000: Duration of musculoskeletal/connective tissue problem, recode 2
";
label variable alchrc20 "
AHS.319_02.000: Musculoskeletal/connective tissue problem condition status recod
e";
label variable altime21 "
AHS.320_01.000 RECOD: Duration of circulation problems (including blood clots): 
Number of units";
label variable alunit21 "
AHS.320_02.000 RECOD: Duration of circulation problems (including blood clots): 
Time unit";
label variable aldura21 "
AHS.320_02.000: Duration (in years) of circulation problems (including blood clo
ts), recode 1";
label variable aldurb21 "
AHS.320_02.000: Duration of circulation problems (including blood clots), recode
 2";
label variable alchrc21 "
AHS.320_02.000: Circulation problems (including blood clots) condition status re
code";
label variable altime22 "
AHS.321_01.000 RECOD: Duration of endocrine/nutritional/metabolic problem: Numbe
r of units";
label variable alunit22 "
AHS.321_02.000 RECOD: Duration of endocrine/nutritional/metabolic problem: Time 
unit";
label variable aldura22 "
AHS.321_02.000: Duration (in years) of endocrine/nutritional/metabolic problem, 
recode 1";
label variable aldurb22 "
AHS.321_02.000: Duration of endocrine/nutritional/metabolic problem, recode 2";
label variable alchrc22 "
AHS.321_02.000: Endocrine/nutritional/metabolic problem condition status recode
";
label variable altime23 "
AHS.322_01.000 RECOD: Duration of nervous system/sensory organ condition: Number
 of units";
label variable alunit23 "
AHS.322_02.000 RECOD: Duration of nervous system/sensory organ condition: Time u
nit";
label variable aldura23 "
AHS.322_02.000: Duration (in years) of nervous system/sensory organ condition , 
recode 1";
label variable aldurb23 "
AHS.322_02.000: Duration of nervous system/sensory organ condition, recode 2";
label variable alchrc23 "
AHS.322_02.000: Nervous system/sensory organ condition status recode";
label variable altime24 "
AHS.323_01.000 RECOD: Duration of digestive system problems: Number of units";
label variable alunit24 "
AHS.323_02.000 RECOD: Duration of digestive system problems: Time unit";
label variable aldura24 "
AHS.323_02.000: Duration (in years) of digestive system problems, recode 1";
label variable aldurb24 "
AHS.323_02.000: Duration of digestive system problems, recode 2";
label variable alchrc24 "
AHS.323_02.000: Digestive system problems condition status recode";
label variable altime25 "
AHS.324_01.000 RECOD: Duration of genitourinary system problem: Number of units
";
label variable alunit25 "
AHS.324_02.000 RECOD: Duration of genitourinary system problem: Time unit";
label variable aldura25 "
AHS.324_02.000: Duration (in years) of genitourinary system problem, recode 1";
label variable aldurb25 "
AHS.324_02.000: Duration of genitourinary system problem, recode 2";
label variable alchrc25 "
AHS.324_02.000: Genitourinary system problem condition status recode";
label variable altime26 "
AHS.325_01.000 RECOD: Duration of skin/subcutaneous system problems: Number of u
nits";
label variable alunit26 "
AHS.325_02.000 RECOD: Duration of skin/subcutaneous system problems: Time unit";
label variable aldura26 "
AHS.325_02.000: Duration (in years) of skin/subcutaneous system problems, recode
 1";
label variable aldurb26 "
AHS.325_02.000: Duration of skin/subcutaneous system problems, recode 2";
label variable alchrc26 "
AHS.325_02.000: Skin/subcutaneous system problems condition status recode";
label variable altime27 "
AHS.326_01.000 RECOD: Duration of blood or blood-forming organ problem: Number o
f units";
label variable alunit27 "
AHS.326_02.000 RECOD: Duration of blood or blood-forming organ problem: Time uni
t";
label variable aldura27 "
AHS.326_02.000: Duration (in years) of blood or blood-forming organ problem, rec
ode 1";
label variable aldurb27 "
AHS.326_02.000: Duration of blood or blood-forming organ problem, recode 2";
label variable alchrc27 "
AHS.326_02.000: Blood or blood-forming organ problem condition status recode";
label variable altime28 "
AHS.327_01.000 RECOD: Duration of benign tumor/cyst: Number of units";
label variable alunit28 "
AHS.327_02.000 RECOD: Duration of benign tumor/cyst: Time unit";
label variable aldura28 "
AHS.327_02.000: Duration (in years) of benign tumor/cyst, recode 1";
label variable aldurb28 "AHS.327_02.000: Duration of benign tumor/cyst, recode 2
";
label variable alchrc28 "
AHS.327_02.000: Benign tumor/cyst condition status recode";
label variable altime29 "
AHS.328_01.000 RECOD: Duration of alcohol /drug/substance abuse problem: Number 
of units";
label variable alunit29 "
AHS.328_02.000 RECOD: Duration of alcohol/drug/substance abuse problem: Time uni
t";
label variable aldura29 "
AHS.328_02.000: Duration (in years) of alcohol/drug/substance abuse problem, rec
ode 1";
label variable aldurb29 "
AHS.328_02.000: Duration of alcohol/drug/substance abuse problem, recode 2";
label variable alchrc29 "
AHS.328_02.000: Alcohol /drug/substance abuse problem condition status recode";
label variable altime30 "
AHS.329_01.000 RECOD: Duration of other mental problem/ADD/Bipolar/Schizophrenia
: Number of units";
label variable alunit30 "
AHS.329_02.000 RECOD: Duration of other mental problem/ADD/Bipolar/Schizophrenia
: Time unit";
label variable aldura30 "
AHS.329_02.000: Duration (in years) of other mental problem/ADD/Bipolar/Schizoph
renia, recode 1";
label variable aldurb30 "
AHS.329_02.000: Duration of other mental problem/ADD/Bipolar/Schizophrenia, reco
de 2";
label variable alchrc30 "
AHS.329_02.000: Other mental problem/ADD/Bipolar/Schizophrenia condition status 
recode";
label variable altime31 "
AHS.330_01.000 RECOD: Duration of surgical after-effects/medical treatment probl
ems: Number of units";
label variable alunit31 "
AHS.330_02.000 RECOD: Duration of surgical after-effects/medical treatment probl
ems: Time unit";
label variable aldura31 "
AHS.330_02.000: Duration (in years) of surgical after-effects/medical treatment 
problems, recode 1";
label variable aldurb31 "
AHS.330_02.000: Duration of surgical after-effects/medical treatment problems, r
ecode 2";
label variable alchrc31 "
AHS.330_02.000: Surgical after-effects/medical treatment problems condition stat
us recode";
label variable altime32 "
AHS.331_01.000 RECOD: Duration of 'old age'/elderly/aging-related problems: Numb
er of units";
label variable alunit32 "
AHS.331_02.000 RECOD: Duration of 'old age'/elderly/aging-related problems: Time
 unit";
label variable aldura32 "
AHS.331_02.000: Duration (in years) of 'old age'/elderly/aging-related problems,
 recode 1";
label variable aldurb32 "
AHS.331_02.000: Duration of 'old age'/elderly/aging-related problems, recode 2";
label variable alchrc32 "
AHS.331_02.000: 'Old age'/elderly/aging-related problems condition status recode
";
label variable altime33 "
AHS.332_01.000 RECOD: Duration of fatigue/tiredness/weakness problem: Number of 
units";
label variable alunit33 "
AHS.332_02.000 RECOD: Duration of fatigue/tiredness/weakness problem: Time unit
";
label variable aldura33 "
AHS.332_02.000: Duration (in years) of fatigue/tiredness/weakness problem, recod
e 1";
label variable aldurb33 "
AHS.332_02.000: Duration of fatigue/tiredness/weakness problem, recode 2";
label variable alchrc33 "
AHS.332_02.000: Fatigue/tiredness/weakness problem condition status recode";
label variable altime34 "
AHS.333_01.000 RECOD: Duration of pregnancy-related problem: Number of units";
label variable alunit34 "
AHS.333_02.000 RECOD: Duration of pregnancy-related problem: Time unit";
label variable aldura34 "
AHS.333_02.000: Duration (in years) of pregnancy-related problem, recode 1";
label variable aldurb34 "
AHS.333_02.000: Duration of pregnancy-related problem, recode 2";
label variable alchrc34 "
AHS.333_02.000: Pregnancy-related condition status recode";
label variable altime90 "
AHS.335_01.000: Duration of other impairment/problem N.E.C. (1): Number of units
";
label variable alunit90 "
AHS.335_02.000: Duration of other impairment/problem N.E.C. (1): Time unit";
label variable aldura90 "
AHS.335_02.000: Duration (in years) of other impairment/problem N.E.C. (1), reco
de 1";
label variable aldurb90 "
AHS.335_02.000: Duration of other impairment/problem N.E.C. (1), recode 2";
label variable alchrc90 "
AHS.335_02.000: Other impairment/problem N.E.C. (1) condition status recode";
label variable altime91 "
AHS.336_01.000: Duration of other impairment/problem N.E.C. (2): Number of units
";
label variable alunit91 "
AHS.336_02.000: Duration of other impairment/problem N.E.C. (2): Time unit";
label variable aldura91 "
AHS.336_02.000: Duration (in years) of other impairment/ problem N.E.C. (2), rec
ode 1";
label variable aldurb91 "
AHS.336_02.000: Duration of other impairment/problem N.E.C. (2), recode 2";
label variable alchrc91 "
AHS.336_02.000: Other impairment/problem N.E.C. (2) condition status recode";
label variable alcndrt  "
AHS.336_02.000: Chronic condition recode for individual with functional limitati
on";
label variable alchronr "
AHS.336_02.000: Overall functional limitation recode by condition status";

label variable smkev    "AHB.010_00.000: Ever smoked 100 cigarettes";
label variable smkreg   "AHB.020_00.000: Age first smoked fairly regularly";
label variable smknow   "
AHB.030_00.000: Smoke freq: everyday/some days/not at all";
label variable smkstat2 "AHB.030_00.000: Smoking Status: Recode";
label variable smkqtno  "AHB.040_01.000: Time since quit: # of units";
label variable smkqttp  "AHB.040_02.000: Time since quit: time period";
label variable smkqty   "AHB.040_02.000: Time since quit smoking (in years)";
label variable cigsda1  "AHB.050_00.000: Number cigs per day (daily smokers)";
label variable cigdamo  "AHB.060_00.000: Number days smoked in past 30 days";
label variable cigsda2  "AHB.070_00.000: Number cigs per day (some day smokers)
";
label variable cigsday  "
AHB.070_00.000: Number of cigarettes a day (all current smokers)";
label variable cigqtyr  "AHB.080_00.000: Tried quit smoking 1+ days, past 12 m";
label variable vigno    "AHB.090_01.000: Freq vigorous activity: # of units";
label variable vigtp    "AHB.090_02.000: Freq vigorous activity: Time units";
label variable vigfreqw "AHB.090_02.000: Freq vigorous activity (times per wk)";
label variable viglngno "AHB.100_01.000: Duration vigorous activity: # units";
label variable viglngtp "AHB.100_02.000: Duration vigorous activity: Time unit";
label variable vigmin   "AHB.100_02.000: Duration vigorous activity (in minutes)
";
label variable modno    "AHB.110_01.000: Freq moderate activity: # of units";
label variable modtp    "AHB.110_02.000: Freq moderate activity: Time units";
label variable modfreqw "
AHB.110_02.000: Freq light/moderate activity (times per wk)";
label variable modlngno "AHB.120_01.000: Duration moderate activity: # of units
";
label variable modlngtp "AHB.120_02.000: Duration moderate activity: Time unit";
label variable modmin   "
AHB.120_02.000: Duration light/moderate activity (in minutes)";
label variable strngno  "AHB.130_01.000: Strength activity freq: # of units";
label variable strngtp  "AHB.130_02.000: Strength activity freq: Time units";
label variable strfreqw "AHB.130_02.000: Freq strength activity (times per wk)";
label variable alc1yr   "AHB.140_00.000: Ever had 12+ drinks in any  one year";
label variable alclife  "AHB.150_00.000: Had 12+ drinks in ENTIRE LIFE";
label variable alc12mno "AHB.160_01.000: Freq drank alcohol pst yr:  # of units
";
label variable alc12mtp "AHB.160_02.000: Freq drank alcohol pst yr:  Time unit";
label variable alc12mwk "AHB.160_02.000: Freq drank alcohol: Days per week";
label variable alc12myr "AHB.160_02.000: Freq drank alcohol: Days in past year";
label variable alcamt   "AHB.170_00.000: Average # drinks on days drank";
label variable alcstat  "AHB.170_00.000: Alcohol drinking status: Recode";
label variable alc5upno "AHB.180_01.000: Days 5+ drinks, past yr: # days";
label variable alc5uptp "AHB.180_02.000: Days 5+ drinks, past yr: Time unit";
label variable alc5upyr "AHB.180_02.000: Number of days had 5+ drinks past year
";
label variable aheight  "AHB.190_04.000: Total height in inches";
label variable aweightp "AHB.200_02.000: Weight without shoes (pounds)";
label variable bmi      "AHB.200_02.000: Body Mass Index (BMI)";
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
AAU.111_01.000: Couldn't afford prescription medicine, past 12 m";
label variable ahcafyr2 "
AAU.111_02.000: Couldn't afford mental health care/counseling, 12 m";
label variable ahcafyr3 "AAU.111_03.000: Couldn't afford dental care, past 12 m
";
label variable ahcafyr4 "AAU.111_04.000: Couldn't afford eyeglasses, past 12 m";
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
label variable ah1n1_1  "
AAU.306_00.010: Had an H1N1 flu vaccination since October 2009";
label variable ah1n1_3m "AAU.306_00.030: Month received H1N1 flu vaccine";
label variable ah1n1_4y "AAU.306_00.040: Year received H1N1 flu vaccine";
label variable ah1n1_5  "AAU.306_00.050: Shot or vaccine sprayed in the nose";
label variable shtfluyr "AAU.310_00.000: Seasonal flu shot past 12 m";
label variable ashflu_m "AAU.312_01.000: Month of most recent seasonal flu shot
";
label variable ashflu_y "AAU.312_02.000: Year of most recent seasonal flu shot";
label variable sprfluyr "AAU.315_00.000: Seasonal flu nasal spray past 12 m";
label variable aspflu_m "
AAU.318_01.000: Month of most recent seasonal flu nasal spray vaccine";
label variable aspflu_y "
AAU.318_02.000: Year of most recent seasonal flu nasal spray vaccine";
label variable shtflu2  "AAU.310_00.000: Flu shot past 12 m";
label variable ashflum2 "AAU.312_01.000: Month of most recent flu shot";
label variable ashfluy2 "AAU.312_02.000: Year of most recent flu shot";
label variable sprflu2  "AAU.315_00.000: Flu spray past 12 m";
label variable aspflum2 "AAU.318_01.000: Month of most recent flu spray";
label variable aspfluy2 "AAU.318_02.000: Year of most recent flu spray";
label variable shtpnuyr "AAU.320_00.000: Pneumonia shot (EVER)";
label variable apox     "AAU.330_00.000: Ever had chickenpox";
label variable apox12mo "AAU.340_00.000: Chickenpox, past 12 m";
label variable ahep     "AAU.350_00.000: Ever had hepatitis";
label variable ahepliv  "AAU.360_00.000: Ever lived w/ someone w/ hepatitis";
label variable shthepb  "AAU.370_00.000: Hepatitis B vaccine (EVER)";
label variable shepdos  "AAU.380_00.000: # doses of hepatitis B vaccine received
";
label variable shthepa  "AAU.390_00.010: Hepatitis A vaccine (EVER)";
label variable shepanum "AAU.400_00.010: # shots of hepatitis A vaccine received
";
label variable shingles "
AAU.410_00.010: Ever had the Zoster or Shingles vaccine?";
label variable shttd    "AAU.420_00.010: Tetanus shot in the past 10 years?";
label variable shttd05  "AAU.430_00.010: Tetanus shot given in 2005 or later?";
label variable shttdap  "
AAU.440_00.010: Vaccine included pertussis/whooping cough";
label variable livev    "
AAU.450_00.010: Ever told you had any kind of chronic/long-term liver condition
";
label variable travel   "
AAU.460_00.010: Ever traveled outside USA since 1995 (Excluding Europe, Japan, A
ustralia, New Zealand, and Canada)";
label variable wrkhlth  "
AAU.465_00.010: Work or volunteer in a health care setting";
label variable wrkdir   "AAU.470_00.010: Direct contact with patients";

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
label variable chnsadsp "ADS.140_00.001: Chances of getting AIDS virus";
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
label variable tbcured  "ADS.240_00.000: Can TB be cured";
label variable tbchanc  "ADS.250_00.000: Chances of getting TB";
label variable tbshame  "ADS.260_00.000: Ashamed if you/family diagnosed with TB
";
label variable homeless "
ADS.270_00.000: Spent 24+ hrs living in street, shelter, jail/prison";

* DEFINE VALUE LABELS FOR REPORTS;

label define sap001x
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
label define sap004x
   1        "1 Quarter 1"
   2        "2 Quarter 2"
   3        "3 Quarter 3"
   4        "4 Quarter 4"
;
label define sap005x
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
label define sap010x
   1        "1 Northeast"
   2        "2 Midwest"
   3        "3 South"
   4        "4 West"
;
label define sap013x
   1        "1 Male"
   2        "2 Female"
;
label define sap014x
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
label define sap015x
   01       "01 White only"
   02       "02 Black/African American only"
   03       "03 AIAN only"
   04       "04 Asian only"
   05       "05 Race group not releasable (See file layout)"
   06       "06 Multiple race"
;
label define sap016x
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
label define sap017x
   01       "01 White"
   02       "02 Black/African American"
   03       "03 Indian (American) (includes Eskimo, Aleut)"
   06       "06 Chinese"
   07       "07 Filipino"
   12       "12 Asian Indian"
   16       "16 Other race (See file layout)"
   17       "17 Multiple race, no primary race selected"
;
label define sap018x
   00       "00 Under 1 year"
   85       "85 85+ years"
;
label define sap019x
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
label define sap020x
   1        "1 Physical or mental condition prohibits responding"
   2        "2 Sample adult is able to respond"
   3        "3 Unknown"
;
label define sap021x
   1        "1 Yes"
   2        "2 No"
;
label define sap022x
   1        "1 Relative who lives in household"
   2        "2 Relative who doesn't live in household"
   3        "3 Other caregiver"
   4        "4 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap023x
   1        "1 Selected to receive QOL section"
   2        "2 Not selected to receive QOL section"
;
label define sap024x
   1        "1 Not selected to receive FDB section"
   2        "2 Selected to receive FDB section"
;
label define sap025x
   1        "1 Working for pay at a job or business"
   2        "2 With a job or business but not at work"
   3        "3 Looking for work"
   4        "4 Working, but not for pay, at a family-owned job or business"
   5        "5 Not working at a job or business and not looking for work"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap026x
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
label define sap027x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap032x
   1        "1 Employee of a PRIVATE company for wages"
   2        "2 A FEDERAL government employee"
   3        "3 A STATE government employee"
   4        "4 A LOCAL government employee"
   5        "5 Self-employed in OWN business, professional practice or farm"
   6        "6 Working WITHOUT PAY in a family-owned business or farm"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap034x
   01       "01 1-9 employees"
   02       "02 10-24 employees"
   03       "03 25-49 employees"
   04       "04 50-99 employees"
   05       "05 100-249 employees"
   06       "06 250-499 employees"
   07       "07 500-999 employees"
   08       "08 1000 employees or more"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap035x
   00       "00 Less than 1 year"
   35       "35 35 or more years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap040x
   0        "0 Had job last week"
   1        "1 No job last week, had job past 12 months"
   2        "2 No job last week, no job past 12 months"
   3        "3 Never worked"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap046x
   1        "
1 An employee of a PRIVATE company, business, or individual for wages, salary, o
r commission"
   2        "2 A FEDERAL government employee"
   3        "3 A STATE government employee"
   4        "4 A LOCAL government employee"
   5        "5 Self-employed in OWN business, professional practice or farm"
   6        "6 Working WITHOUT PAY in family-owned business or farm"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap054x
   1        "
1 You [work/worked] as an independent contractor, independent consultant, or fre
elance worker"
   2        "
2 You [are/were] on-call, and [work/worked] only when called to work"
   3        "3 You [are/were] paid by a temporary agency"
   4        "
4 You [work/worked] for a contractor who provides workers and services to others
 under contract"
   5        "
5 You [are/were] a regular, permanent employee (standard work arrangement)"
   6        "6 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap055x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   9        "9 Don't know"
;
label define sap056x
   1        "1 A regular daytime schedule"
   2        "2 A regular evening shift"
   3        "3 A regular night shift"
   4        "4 A rotating shift"
   5        "5 Some other schedule"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap057x
   1        "1 Strongly agree"
   2        "2 Agree"
   3        "3 Disagree"
   4        "4 Strongly disagree"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap064x
   1        "1 Yes"
;
label define sap065x
   1        "1 Yes"
   2        "2 No"
   3        "3 No injuries/poisonings on the job"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap066x
   1        "1 Yes"
   2        "2 No"
   3        "3 Claim(s) in process"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap079x
   85       "85 85+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap080x
   1        "1 Less than 16"
   2        "2 16 or older"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap081x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap093x
   000      "000 None"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap098x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap159x
   1        "1 Yes"
   2        "2 No"
   3        "3 Borderline"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap162x
   00       "00 Within past year"
   85       "85 85+ years"
   96       "96 1+ year(s) with diabetes and age is 85+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap167x
   0        "0 None"
   1        "1 One"
   2        "2 Two or three"
   3        "3 Between four and ten"
   4        "4 More than 10"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap169x
   1        "1 Not at all"
   2        "2 Slightly"
   3        "3 Moderately"
   4        "4 Quite a bit"
   5        "5 Extremely"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap238x
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
label define sap242x
   1        "1 ALL of the time"
   2        "2 MOST of the time"
   3        "3 SOME of the time"
   4        "4 A LITTLE of the time"
   5        "5 NONE of the time"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap248x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap253x
   0        "0 Not at all difficult"
   1        "1 Only a little difficult"
   2        "2 Somewhat difficult"
   3        "3 Very difficult"
   4        "4 Can't do at all"
   6        "6 Do not do this activity"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap265x
   1        "1 Limited in any way"
   2        "2 Not limited in any way"
   3        "3 Unknown if limited"
;
label define sap302x
   95       "95 95+"
   96       "96 Since birth"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap303x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   6        "6 Since birth"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap304x
   00       "00 Less than 1 year"
   85       "85 85+ years"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap305x
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap306x
   1        "1 Chronic"
   2        "2 Not chronic"
   9        "9 Unknown if chronic"
;
label define sap482x
   1        "1 At least one condition causing functional limitation is chronic"
   2        "2 No condition causing functional limitation"
   9        "9 Unknown if any condition causing functional limitation is chronic
"
;
label define sap483x
   0        "0 Not limited in any way (including unknown if limited)"
   1        "1 Limited; caused by at least one chronic condition"
   2        "2 Limited; not caused by chronic condition"
   3        "3 Limited; unknown if condition is chronic"
;
label define sap485x
   85       "85 85 years or older"
   96       "96 Never smoked regularly"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap486x
   1        "1 Every day"
   2        "2 Some days"
   3        "3 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap487x
   1        "1 Current every day smoker"
   2        "2 Current some day smoker"
   3        "3 Former smoker"
   4        "4 Never smoker"
   5        "5 Smoker, current status unknown"
   9        "9 Unknown if ever smoked"
;
label define sap488x
   95       "95 95+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap489x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap490x
   00       "00 Less than 1 year"
   70       "70 70+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap491x
   95       "95 95+ cigarettes"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap492x
   00       "00 None"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap496x
   000      "000 Never"
   996      "996 Unable to do this type activity"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap497x
   0        "0 Never"
   1        "1 Per day"
   2        "2 Per week"
   3        "3 Per month"
   4        "4 Per year"
   6        "6 Unable to do this activity"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap498x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do vigorous activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap499x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap500x
   1        "1 Minutes"
   2        "2 Hours"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap504x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do light or moderate activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap510x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do strength activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap513x
   000      "000 Never"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap514x
   0        "0 Never/None"
   1        "1 Week"
   2        "2 Month"
   3        "3 Year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap515x
   00       "00 Less than one day per week"
   95       "95 Did not drink in past year"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap516x
   000      "000 Never/none"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap517x
   95       "95 95+ drinks"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap518x
   01       "01 Lifetime abstainer"
   02       "02 Former infrequent"
   03       "03 Former regular"
   04       "04 Former, unknown frequency"
   05       "05 Current infrequent"
   06       "06 Current light"
   07       "07 Current moderate"
   08       "08 Current heavier"
   09       "09 Current drinker, frequency/level unknown"
   10       "10 Drinking status unknown"
;
label define sap520x
   0        "0 Never/None"
   1        "1 Per week"
   2        "2 Per month"
   3        "3 Per year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap522x
   96       "96 Not available"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap523x
   996      "996 Not available"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap525x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap526x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap527x
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
label define sap529x
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
label define sap541x
   0        "0 Never"
   1        "1 6 months or less"
   2        "2 More than 6 mos, but not more than 1 yr ago"
   3        "3 More than 1 yr, but not more than 2 yrs ago"
   4        "4 More than 2 yrs, but not more than 5 yrs ago"
   5        "5 More than 5 years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap552x
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
label define sap555x
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
label define sap558x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap561x
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
label define sap562x
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define sap563x
   1        "1 Flu shot"
   2        "2 Flu nasal spray (spray, mist or drop in nose)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap582x
   1        "1 Received at least 3 doses"
   2        "2 Received less than 3 doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap584x
   96       "96 Received all shots"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap588x
   1        "1 Yes-included pertussis"
   2        "2 No-did not include pertussis"
   3        "3 Doctor did not say"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap596x
   01       "01 It's unlikely you've been exposed to HIV"
   02       "
02 You were afraid to find out if you were HIV positive (that you had HIV)"
   03       "03 You didn't want to think about HIV or about being HIV positive"
   04       "
04 You were worried your name would be reported to the government if you tested 
positive"
   05       "05 You didn't know where to get tested"
   06       "06 You don't like needles"
   07       "
07 You were afraid of losing job, insurance, housing, friends, family, if people
 knew you were positive for AIDS infection"
   08       "08 Some other reason"
   09       "09 No particular reason"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap597x
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
   96       "96 Time period format"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap598x
   9996     "9996 Time period format"
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define sap599x
   1        "1 6 months or less"
   2        "2 More than 6 months but not more than 1 year ago"
   3        "3 More than 1 year, but not more than 2 years ago"
   4        "4 More than 2 years, but not more than 5 years ago"
   5        "5 More than 5 years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap600x
   01       "01 Someone suggested you should be tested"
   02       "02 You might have been exposed through sex or drug use"
   03       "03 You might have been exposed through your work or at work"
   04       "04 You just wanted to find out if you were infected or not"
   05       "
05 For part of a routine medical check-up, or for hospitalization or surgical pr
ocedure"
   06       "06 You were sick or had a medical problem"
   07       "07 You were pregnant or delivered a baby"
   08       "08 For health or life insurance coverage"
   09       "09 For military induction, separation, or military service"
   10       "10 For immigration"
   11       "11 For marriage license or to get married"
   12       "12 You were concerned you could give HIV to someone"
   13       "13 You wanted medical care or new treatments if you tested positive
"
   14       "14 Some other reason"
   15       "15 No particular reason"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap601x
   1        "1 Doctor, nurse or other health care professional"
   2        "2 Sex partner"
   3        "3 Someone at health department"
   4        "4 Family member or friend"
   5        "5 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap602x
   01       "01 Private doctor/HMO"
   02       "02 AIDS clinic/counseling/testing site"
   03       "03 Hospital, emergency room, outpatient clinic"
   04       "04 Other type of clinic"
   05       "05 Public health department"
   06       "06 At home"
   07       "07 Drug treatment facility"
   08       "08 Military induction or military service site"
   09       "09 Immigration site"
   10       "10 In a correctional facility (jail or prison)"
   11       "11 Other location"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap603x
   01       "01 Family planning clinic"
   02       "02 Prenatal clinic"
   03       "03 Tuberculosis clinic"
   04       "04 STD clinic"
   05       "05 Community health clinic"
   06       "06 Clinic run by employer or insurance company"
   07       "07 Other"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap604x
   1        "1 Nurse or health worker"
   2        "2 Self-sampling kit"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap607x
   1        "1 High/Already have HIV/AIDS"
   2        "2 Medium"
   3        "3 Low"
   4        "4 None"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap608x
   1        "1 Yes, at least one statement is true"
   2        "2 No, none of these statements are true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap611x
   1        "1 Private doctor"
   2        "2 Family planning clinic"
   3        "3 STD clinic"
   4        "4 Emergency room"
   5        "5 Health department"
   6        "6 Some other place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap614x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Nothing"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap622x
   1        "1 High"
   2        "2 Medium"
   3        "3 Low"
   4        "4 None"
   5        "5 Already have TB"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   sap001x;   label values intv_qrt  sap004x;
label values assignwk  sap005x;

label values region    sap010x;

label values sex       sap013x;   label values hispan_i  sap014x;
label values racerpi2  sap015x;   label values mracrpi2  sap016x;
label values mracbpi2  sap017x;   label values age_p     sap018x;

label values r_maritl  sap019x;

label values proxysa   sap020x;   label values prox1     sap021x;
label values prox2     sap022x;

label values qol_flg   sap023x;

label values fdrn_flg  sap024x;

label values doinglwa  sap025x;   label values whynowka  sap026x;
label values everwrk   sap027x;   label values wrkcata   sap032x;
label values businc1a  sap027x;   label values locall1a  sap034x;
label values yrswrkpa  sap035x;   label values wrklongh  sap027x;
label values hourpda   sap027x;   label values pdsicka   sap027x;
label values onejob    sap027x;   label values wrklyr4   sap040x;
label values mreclong  sap027x;   label values wrkcatpy  sap046x;
label values yrswrkpy  sap035x;   label values wrkcatlh  sap046x;
label values yrswrklh  sap035x;   label values wrkarrng  sap054x;
label values wrktemp   sap055x;   label values wrksched  sap056x;
label values worunemp  sap057x;   label values workwfam  sap057x;
label values harassed  sap027x;   label values chemexp   sap027x;
label values smokexp   sap027x;   label values wrkoutdr  sap027x;
label values vaporexp  sap027x;   label values ipwhatr   sap064x;
label values injwcclm  sap065x;   label values injwcben  sap066x;

label values hypev     sap027x;   label values hypdifv   sap027x;
label values chdev     sap027x;   label values angev     sap027x;
label values miev      sap027x;   label values hrtev     sap027x;
label values strev     sap027x;   label values ephev     sap027x;
label values aasmev    sap027x;   label values aasstill  sap027x;
label values aasmyr    sap027x;   label values aaseryr1  sap027x;
label values aasage_p  sap079x;   label values aasage16  sap080x;
label values aasstat   sap081x;   label values aasemp    sap027x;
label values aascjob   sap027x;   label values aaslhjob  sap027x;
label values aaswkrel  sap027x;   label values aasdwkrl  sap027x;
label values aaswcclm  sap027x;   label values aaswcben  sap066x;
label values aaswkday  sap093x;   label values aaschjob  sap027x;
label values ulcev     sap027x;   label values ulcyr     sap027x;
label values canev     sap027x;   label values cnkind1   sap098x;
label values cnkind2   sap098x;   label values cnkind3   sap098x;
label values cnkind4   sap098x;   label values cnkind5   sap098x;
label values cnkind6   sap098x;   label values cnkind7   sap098x;
label values cnkind8   sap098x;   label values cnkind9   sap098x;
label values cnkind10  sap098x;   label values cnkind11  sap098x;
label values cnkind12  sap098x;   label values cnkind13  sap098x;
label values cnkind14  sap098x;   label values cnkind15  sap098x;
label values cnkind16  sap098x;   label values cnkind17  sap098x;
label values cnkind18  sap098x;   label values cnkind19  sap098x;
label values cnkind20  sap098x;   label values cnkind21  sap098x;
label values cnkind22  sap098x;   label values cnkind23  sap098x;
label values cnkind24  sap098x;   label values cnkind25  sap098x;
label values cnkind26  sap098x;   label values cnkind27  sap098x;
label values cnkind28  sap098x;   label values cnkind29  sap098x;
label values cnkind30  sap098x;   label values cnkind31  sap098x;
label values canage1   sap079x;   label values canage2   sap079x;
label values canage3   sap079x;   label values canage4   sap079x;
label values canage5   sap079x;   label values canage6   sap079x;
label values canage7   sap079x;   label values canage8   sap079x;
label values canage9   sap079x;   label values canage10  sap079x;
label values canage11  sap079x;   label values canage12  sap079x;
label values canage13  sap079x;   label values canage14  sap079x;
label values canage15  sap079x;   label values canage16  sap079x;
label values canage17  sap079x;   label values canage18  sap079x;
label values canage19  sap079x;   label values canage20  sap079x;
label values canage21  sap079x;   label values canage22  sap079x;
label values canage23  sap079x;   label values canage24  sap079x;
label values canage25  sap079x;   label values canage26  sap079x;
label values canage27  sap079x;   label values canage28  sap079x;
label values canage29  sap079x;   label values canage30  sap079x;
label values dibev     sap159x;   label values dibpre1   sap027x;
label values dibage    sap079x;   label values difage2   sap162x;
label values insln     sap027x;   label values dibpill   sap027x;
label values epilep1   sap027x;   label values epilep2   sap027x;
label values epilep3   sap167x;   label values epilep4   sap027x;
label values epilep5   sap169x;   label values ahayfyr   sap027x;
label values sinyr     sap027x;   label values cbrchyr   sap027x;
label values kidwkyr   sap027x;   label values livyr     sap027x;
label values drmyr     sap027x;   label values drmbody1  sap098x;
label values drmbody2  sap098x;   label values drmbody3  sap098x;
label values drmbody4  sap098x;   label values drmtret   sap027x;
label values drmwkrel  sap027x;   label values drmcjob   sap027x;
label values drmlhjob  sap027x;   label values drmwcclm  sap027x;
label values drmwcben  sap066x;   label values drmwkday  sap093x;
label values drmchjob  sap027x;   label values jntsymp   sap027x;
label values jmthp1    sap098x;   label values jmthp2    sap098x;
label values jmthp3    sap098x;   label values jmthp4    sap098x;
label values jmthp5    sap098x;   label values jmthp6    sap098x;
label values jmthp7    sap098x;   label values jmthp8    sap098x;
label values jmthp9    sap098x;   label values jmthp10   sap098x;
label values jmthp11   sap098x;   label values jmthp12   sap098x;
label values jmthp13   sap098x;   label values jmthp14   sap098x;
label values jmthp15   sap098x;   label values jmthp16   sap098x;
label values jmthp17   sap098x;   label values jntchr    sap027x;
label values jnthp     sap027x;   label values arth1     sap027x;
label values arthlmt   sap027x;   label values ctsever   sap027x;
label values ctsyr     sap027x;   label values ctsage_p  sap079x;
label values ctswkrel  sap027x;   label values ctscjob   sap027x;
label values ctslhjob  sap027x;   label values ctswcclm  sap027x;
label values ctswcben  sap066x;   label values ctswkday  sap093x;
label values ctschjob  sap027x;   label values paineck   sap027x;
label values painlb    sap027x;   label values painleg   sap027x;
label values painface  sap027x;   label values amigr     sap027x;
label values acold2w   sap027x;   label values aintil2w  sap027x;
label values pregnow   sap027x;   label values hraidnow  sap027x;
label values hraidev   sap027x;   label values ahearst1  sap238x;
label values avision   sap027x;   label values ablind    sap027x;
label values lupprt    sap027x;   label values sad       sap242x;
label values nervous   sap242x;   label values restless  sap242x;
label values hopeless  sap242x;   label values effort    sap242x;
label values worthls   sap242x;   label values mhamtmo   sap248x;

label values wkdayr    sap093x;   label values beddayr   sap093x;
label values ahstatyr  sap081x;   label values speceq    sap027x;
label values flwalk    sap253x;   label values flclimb   sap253x;
label values flstand   sap253x;   label values flsit     sap253x;
label values flstoop   sap253x;   label values flreach   sap253x;
label values flgrasp   sap253x;   label values flcarry   sap253x;
label values flpush    sap253x;   label values flshop    sap253x;
label values flsocl    sap253x;   label values flrelax   sap253x;
label values fla1ar    sap265x;   label values aflhca1   sap098x;
label values aflhca2   sap098x;   label values aflhca3   sap098x;
label values aflhca4   sap098x;   label values aflhca5   sap098x;
label values aflhca6   sap098x;   label values aflhca7   sap098x;
label values aflhca8   sap098x;   label values aflhca9   sap098x;
label values aflhca10  sap098x;   label values aflhca11  sap098x;
label values aflhca12  sap098x;   label values aflhca13  sap098x;
label values aflhca14  sap098x;   label values aflhca15  sap098x;
label values aflhca16  sap098x;   label values aflhca17  sap098x;
label values aflhca18  sap098x;   label values aflhc19_  sap098x;
label values aflhc20_  sap098x;   label values aflhc21_  sap098x;
label values aflhc22_  sap098x;   label values aflhc23_  sap098x;
label values aflhc24_  sap098x;   label values aflhc25_  sap098x;
label values aflhc26_  sap098x;   label values aflhc27_  sap098x;
label values aflhc28_  sap098x;   label values aflhc29_  sap098x;
label values aflhc30_  sap098x;   label values aflhc31_  sap098x;
label values aflhc32_  sap098x;   label values aflhc33_  sap098x;
label values aflhc34_  sap098x;   label values aflhca90  sap098x;
label values aflhca91  sap098x;   label values altime1   sap302x;
label values alunit1   sap303x;   label values aldura1   sap304x;
label values aldurb1   sap305x;   label values alchrc1   sap306x;
label values altime2   sap302x;   label values alunit2   sap303x;
label values aldura2   sap304x;   label values aldurb2   sap305x;
label values alchrc2   sap306x;   label values altime3   sap302x;
label values alunit3   sap303x;   label values aldura3   sap304x;
label values aldurb3   sap305x;   label values alchrc3   sap306x;
label values altime4   sap302x;   label values alunit4   sap303x;
label values aldura4   sap304x;   label values aldurb4   sap305x;
label values alchrc4   sap306x;   label values altime5   sap302x;
label values alunit5   sap303x;   label values aldura5   sap304x;
label values aldurb5   sap305x;   label values alchrc5   sap306x;
label values altime6   sap302x;   label values alunit6   sap303x;
label values aldura6   sap304x;   label values aldurb6   sap305x;
label values alchrc6   sap306x;   label values altime7   sap302x;
label values alunit7   sap303x;   label values aldura7   sap304x;
label values aldurb7   sap305x;   label values alchrc7   sap306x;
label values altime8   sap302x;   label values alunit8   sap303x;
label values aldura8   sap304x;   label values aldurb8   sap305x;
label values alchrc8   sap306x;   label values altime9   sap302x;
label values alunit9   sap303x;   label values aldura9   sap304x;
label values aldurb9   sap305x;   label values alchrc9   sap306x;
label values altime10  sap302x;   label values alunit10  sap303x;
label values aldura10  sap304x;   label values aldurb10  sap305x;
label values alchrc10  sap306x;   label values altime11  sap302x;
label values alunit11  sap303x;   label values aldura11  sap304x;
label values aldurb11  sap305x;   label values alchrc11  sap306x;
label values altime12  sap302x;   label values alunit12  sap303x;
label values aldura12  sap304x;   label values aldurb12  sap305x;
label values alchrc12  sap306x;   label values altime13  sap302x;
label values alunit13  sap303x;   label values aldura13  sap304x;
label values aldurb13  sap305x;   label values alchrc13  sap306x;
label values altime14  sap302x;   label values alunit14  sap303x;
label values aldura14  sap304x;   label values aldurb14  sap305x;
label values alchrc14  sap306x;   label values altime15  sap302x;
label values alunit15  sap303x;   label values aldura15  sap304x;
label values aldurb15  sap305x;   label values alchrc15  sap306x;
label values altime16  sap302x;   label values alunit16  sap303x;
label values aldura16  sap304x;   label values aldurb16  sap305x;
label values alchrc16  sap306x;   label values altime17  sap302x;
label values alunit17  sap303x;   label values aldura17  sap304x;
label values aldurb17  sap305x;   label values alchrc17  sap306x;
label values altime18  sap302x;   label values alunit18  sap303x;
label values aldura18  sap304x;   label values aldurb18  sap305x;
label values alchrc18  sap306x;   label values altime19  sap302x;
label values alunit19  sap303x;   label values aldura19  sap304x;
label values aldurb19  sap305x;   label values alchrc19  sap306x;
label values altime20  sap302x;   label values alunit20  sap303x;
label values aldura20  sap304x;   label values aldurb20  sap305x;
label values alchrc20  sap306x;   label values altime21  sap302x;
label values alunit21  sap303x;   label values aldura21  sap304x;
label values aldurb21  sap305x;   label values alchrc21  sap306x;
label values altime22  sap302x;   label values alunit22  sap303x;
label values aldura22  sap304x;   label values aldurb22  sap305x;
label values alchrc22  sap306x;   label values altime23  sap302x;
label values alunit23  sap303x;   label values aldura23  sap304x;
label values aldurb23  sap305x;   label values alchrc23  sap306x;
label values altime24  sap302x;   label values alunit24  sap303x;
label values aldura24  sap304x;   label values aldurb24  sap305x;
label values alchrc24  sap306x;   label values altime25  sap302x;
label values alunit25  sap303x;   label values aldura25  sap304x;
label values aldurb25  sap305x;   label values alchrc25  sap306x;
label values altime26  sap302x;   label values alunit26  sap303x;
label values aldura26  sap304x;   label values aldurb26  sap305x;
label values alchrc26  sap306x;   label values altime27  sap302x;
label values alunit27  sap303x;   label values aldura27  sap304x;
label values aldurb27  sap305x;   label values alchrc27  sap306x;
label values altime28  sap302x;   label values alunit28  sap303x;
label values aldura28  sap304x;   label values aldurb28  sap305x;
label values alchrc28  sap306x;   label values altime29  sap302x;
label values alunit29  sap303x;   label values aldura29  sap304x;
label values aldurb29  sap305x;   label values alchrc29  sap306x;
label values altime30  sap302x;   label values alunit30  sap303x;
label values aldura30  sap304x;   label values aldurb30  sap305x;
label values alchrc30  sap306x;   label values altime31  sap302x;
label values alunit31  sap303x;   label values aldura31  sap304x;
label values aldurb31  sap305x;   label values alchrc31  sap306x;
label values altime32  sap302x;   label values alunit32  sap303x;
label values aldura32  sap304x;   label values aldurb32  sap305x;
label values alchrc32  sap306x;   label values altime33  sap302x;
label values alunit33  sap303x;   label values aldura33  sap304x;
label values aldurb33  sap305x;   label values alchrc33  sap306x;
label values altime34  sap302x;   label values alunit34  sap303x;
label values aldura34  sap304x;   label values aldurb34  sap305x;
label values alchrc34  sap306x;   label values altime90  sap302x;
label values alunit90  sap303x;   label values aldura90  sap304x;
label values aldurb90  sap305x;   label values alchrc90  sap306x;
label values altime91  sap302x;   label values alunit91  sap303x;
label values aldura91  sap304x;   label values aldurb91  sap305x;
label values alchrc91  sap306x;   label values alcndrt   sap482x;
label values alchronr  sap483x;

label values smkev     sap027x;   label values smkreg    sap485x;
label values smknow    sap486x;   label values smkstat2  sap487x;
label values smkqtno   sap488x;   label values smkqttp   sap489x;
label values smkqty    sap490x;   label values cigsda1   sap491x;
label values cigdamo   sap492x;   label values cigsda2   sap491x;
label values cigsday   sap491x;   label values cigqtyr   sap027x;
label values vigno     sap496x;   label values vigtp     sap497x;
label values vigfreqw  sap498x;   label values viglngno  sap499x;
label values viglngtp  sap500x;   label values vigmin    sap499x;
label values modno     sap496x;   label values modtp     sap497x;
label values modfreqw  sap504x;   label values modlngno  sap499x;
label values modlngtp  sap500x;   label values modmin    sap499x;
label values strngno   sap496x;   label values strngtp   sap497x;
label values strfreqw  sap510x;   label values alc1yr    sap027x;
label values alclife   sap027x;   label values alc12mno  sap513x;
label values alc12mtp  sap514x;   label values alc12mwk  sap515x;
label values alc12myr  sap516x;   label values alcamt    sap517x;
label values alcstat   sap518x;   label values alc5upno  sap516x;
label values alc5uptp  sap520x;   label values alc5upyr  sap516x;
label values aheight   sap522x;   label values aweightp  sap523x;
label values sleep     sap525x;

label values ausualpl  sap526x;   label values aplkind   sap527x;
label values ahcplrou  sap027x;   label values ahcplknd  sap529x;
label values ahcchgyr  sap027x;   label values ahcchghi  sap027x;
label values ahcdlyr1  sap027x;   label values ahcdlyr2  sap027x;
label values ahcdlyr3  sap027x;   label values ahcdlyr4  sap027x;
label values ahcdlyr5  sap027x;   label values ahcafyr1  sap027x;
label values ahcafyr2  sap027x;   label values ahcafyr3  sap027x;
label values ahcafyr4  sap027x;   label values adnlong2  sap541x;
label values ahcsyr1   sap027x;   label values ahcsyr2   sap027x;
label values ahcsyr3   sap027x;   label values ahcsyr4   sap027x;
label values ahcsyr5   sap027x;   label values ahcsyr6   sap027x;
label values ahcsyr7   sap027x;   label values ahcsyr8   sap027x;
label values ahcsyr9   sap027x;   label values ahcsyr10  sap027x;
label values ahernoy2  sap552x;   label values ahchyr    sap027x;
label values ahchmoyr  sap525x;   label values ahchnoy2  sap555x;
label values ahcnoyr2  sap552x;   label values asrgyr    sap027x;
label values asrgnoyr  sap558x;   label values amdlongr  sap541x;
label values ah1n1_1   sap027x;   label values ah1n1_3m  sap561x;
label values ah1n1_4y  sap562x;   label values ah1n1_5   sap563x;
label values shtfluyr  sap027x;   label values ashflu_m  sap561x;
label values ashflu_y  sap562x;   label values sprfluyr  sap027x;
label values aspflu_m  sap561x;   label values aspflu_y  sap562x;
label values shtflu2   sap027x;   label values ashflum2  sap561x;
label values ashfluy2  sap562x;   label values sprflu2   sap027x;
label values aspflum2  sap561x;   label values aspfluy2  sap562x;
label values shtpnuyr  sap027x;   label values apox      sap027x;
label values apox12mo  sap027x;   label values ahep      sap027x;
label values ahepliv   sap027x;   label values shthepb   sap027x;
label values shepdos   sap582x;   label values shthepa   sap027x;
label values shepanum  sap584x;   label values shingles  sap027x;
label values shttd     sap027x;   label values shttd05   sap027x;
label values shttdap   sap588x;   label values livev     sap027x;
label values travel    sap027x;   label values wrkhlth   sap027x;
label values wrkdir    sap027x;

label values bldgv     sap027x;   label values bldg12m   sap027x;
label values hivtst    sap027x;   label values whytst_r  sap596x;
label values tst12m_m  sap597x;   label values tst12m_y  sap598x;
label values timetst   sap599x;   label values reatst_c  sap600x;
label values reaswhor  sap601x;   label values lastst_c  sap602x;
label values clntyp_c  sap603x;   label values whoadm    sap604x;
label values givnam    sap027x;   label values extst12m  sap027x;
label values chnsadsp  sap607x;   label values stmtru    sap608x;
label values std       sap027x;   label values stddoc    sap027x;
label values stdwher   sap611x;   label values tbhrd     sap027x;
label values tbknow    sap027x;   label values tb        sap614x;
label values tbsprd1   sap098x;   label values tbsprd2   sap098x;
label values tbsprd3   sap098x;   label values tbsprd4   sap098x;
label values tbsprd5   sap098x;   label values tbsprd6   sap098x;
label values tbcured   sap027x;   label values tbchanc   sap622x;
label values tbshame   sap027x;   label values homeless  sap027x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sa];
save "$OUT/samadult", replace;

#delimit cr

* data file is stored in samadult.dta
* log  file is stored in samadult.log

log close
