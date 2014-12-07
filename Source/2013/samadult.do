global LOG "~/database/NHIS/Log"
global DAT "~/database/NHIS/Data/raw/2013"
global OUT "~/database/NHIS/Data/dta/2013"


log using "$LOG/samadult.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
  JUNE 11, 2014  3:03 PM

  THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
  FILE FROM THE 2013 NHIS Public Use Sample Adult ASCII FILE

  NOTES:

  EXECUTING THIS PROGRAM WILL REPLACE samadult.dta AND samadult.log
  IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

  THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
  DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
  WITHIN STATA IS THE FOLLOWING COMMAND: cd c:\nhis2013\

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
  intv_mon     14 -  15  str fmx          16 -  17
  str fpx          18 -  19      wtia_sa      20 -  26
  wtfa_sa      27 -  32

  region       33 -  33      strat_p      34 -  36
  psu_p        37 -  38

  sex          39 -  39      hispan_i     40 -  41
  racerpi2     42 -  43      mracrpi2     44 -  45
  mracbpi2     46 -  47      age_p        48 -  49

  r_maritl     50 -  50

  proxysa      51 -  51      prox1        52 -  52
  prox2        53 -  53      lateinta     54 -  54

  fdrn_flg     55 -  55

  doinglwa     56 -  56      whynowka     57 -  58
  everwrk      59 -  59      indstrn1     60 -  61
  indstrn2     62 -  63      occupn1      64 -  65
  occupn2      66 -  67      wrkcata      68 -  68
  businc1a     69 -  69      locall1a     70 -  71
  yrswrkpa     72 -  73      wrklongh     74 -  74
  hourpda      75 -  75      pdsicka      76 -  76
  onejob       77 -  77      wrklyr4      78 -  78

  hypev        79 -  79      hypdifv      80 -  80
  hypyr1       81 -  81      chlyr1       82 -  82
  chdev        83 -  83      angev        84 -  84
  miev         85 -  85      hrtev        86 -  86
  strev        87 -  87      ephev        88 -  88
  copdev       89 -  89      aspmedev     90 -  90
  aspmedad     91 -  91      aspmdmed     92 -  92
  asponown     93 -  93      aasmev       94 -  94
  aasstill     95 -  95      aasmyr       96 -  96
  aaseryr1     97 -  97      aasmhsp1     98 -  98
  awzmswk1     99 - 101      aasmmed1    102 - 102
  aasmtyp     103 - 103      aasmcan1    104 - 104
  aasmdtp2    105 - 105      aaswmp1     106 - 106
  aasclass    107 - 107      aas_rec     108 - 108
  aas_res     109 - 109      aas_mon     110 - 110
  aapenvln    111 - 111      aaroutin    112 - 114
  aasympt     115 - 115      aarescue    116 - 116
  aaactlim    117 - 117      ulcev       118 - 118
  ulcyr       119 - 119      canev       120 - 120
  cnkind1     121 - 121      cnkind2     122 - 122
  cnkind3     123 - 123      cnkind4     124 - 124
  cnkind5     125 - 125      cnkind6     126 - 126
  cnkind7     127 - 127      cnkind8     128 - 128
  cnkind9     129 - 129      cnkind10    130 - 130
  cnkind11    131 - 131      cnkind12    132 - 132
  cnkind13    133 - 133      cnkind14    134 - 134
  cnkind15    135 - 135      cnkind16    136 - 136
  cnkind17    137 - 137      cnkind18    138 - 138
  cnkind19    139 - 139      cnkind20    140 - 140
  cnkind21    141 - 141      cnkind22    142 - 142
  cnkind23    143 - 143      cnkind24    144 - 144
  cnkind25    145 - 145      cnkind26    146 - 146
  cnkind27    147 - 147      cnkind28    148 - 148
  cnkind29    149 - 149      cnkind30    150 - 150
  cnkind31    151 - 151      canage1     152 - 154
  canage2     155 - 157      canage3     158 - 160
  canage4     161 - 163      canage5     164 - 166
  canage6     167 - 169      canage7     170 - 172
  canage8     173 - 175      canage9     176 - 178
  canage10    179 - 181      canage11    182 - 184
  canage12    185 - 187      canage13    188 - 190
  canage14    191 - 193      canage15    194 - 196
  canage16    197 - 199      canage17    200 - 202
  canage18    203 - 205      canage19    206 - 208
  canage20    209 - 211      canage21    212 - 214
  canage22    215 - 217      canage23    218 - 220
  canage24    221 - 223      canage25    224 - 226
  canage26    227 - 229      canage27    230 - 232
  canage28    233 - 235      canage29    236 - 238
  canage30    239 - 241      dibev       242 - 242
  dibpre1     243 - 243      dibage      244 - 245
  difage2     246 - 247      insln       248 - 248
  dibpill     249 - 249      epilep1     250 - 250
  epilep2     251 - 251      epilep3     252 - 252
  epilep4     253 - 253      epilep5     254 - 254
  ahayfyr     255 - 255      sinyr       256 - 256
  cbrchyr     257 - 257      kidwkyr     258 - 258
  livyr       259 - 259      jntsymp     260 - 260
  jmthp1      261 - 261      jmthp2      262 - 262
  jmthp3      263 - 263      jmthp4      264 - 264
  jmthp5      265 - 265      jmthp6      266 - 266
  jmthp7      267 - 267      jmthp8      268 - 268
  jmthp9      269 - 269      jmthp10     270 - 270
  jmthp11     271 - 271      jmthp12     272 - 272
  jmthp13     273 - 273      jmthp14     274 - 274
  jmthp15     275 - 275      jmthp16     276 - 276
  jmthp17     277 - 277      jntchr      278 - 278
  jnthp       279 - 279      arth1       280 - 280
  arthlmt     281 - 281      paineck     282 - 282
  painlb      283 - 283      painleg     284 - 284
  painface    285 - 285      amigr       286 - 286
  acold2w     287 - 287      aintil2w    288 - 288
  pregnow     289 - 289      pregflyr    290 - 290
  hraidnow    291 - 291      hraidev     292 - 292
  ahearst1    293 - 293      avision     294 - 294
  ablind      295 - 295      lupprt      296 - 296


  aimsupev    297 - 297      aimspstl    298 - 298
  aimspmed    299 - 299      aimspchc    300 - 300
  aimspshc    301 - 301      aimspcan    302 - 302
  aimspcld    303 - 303

  wkdayr      304 - 306      beddayr     307 - 309
  ahstatyr    310 - 310      speceq      311 - 311
  flwalk      312 - 312      flclimb     313 - 313
  flstand     314 - 314      flsit       315 - 315
  flstoop     316 - 316      flreach     317 - 317
  flgrasp     318 - 318      flcarry     319 - 319
  flpush      320 - 320      flshop      321 - 321
  flsocl      322 - 322      flrelax     323 - 323
  fla1ar      324 - 324      aflhca1     325 - 325
  aflhca2     326 - 326      aflhca3     327 - 327
  aflhca4     328 - 328      aflhca5     329 - 329
  aflhca6     330 - 330      aflhca7     331 - 331
  aflhca8     332 - 332      aflhca9     333 - 333
  aflhca10    334 - 334      aflhca11    335 - 335
  aflhca12    336 - 336      aflhca13    337 - 337
  alhca14a    338 - 338      aflhca15    339 - 339
  aflhca16    340 - 340      aflhca17    341 - 341
  aflhca18    342 - 342      aflhc19_    343 - 343
  aflhc20_    344 - 344      aflhc21_    345 - 345
  aflhc22_    346 - 346      aflhc23_    347 - 347
  aflhc24_    348 - 348      aflhc25_    349 - 349
  aflhc26_    350 - 350      aflhc27_    351 - 351
  aflhc28_    352 - 352      aflhc29_    353 - 353
  aflhc30_    354 - 354      aflhc31_    355 - 355
  aflhc32_    356 - 356      aflhc33_    357 - 357
  aflhc34_    358 - 358      aflhca90    359 - 359
  aflhca91    360 - 360      altime1     361 - 362
  alunit1     363 - 363      aldura1     364 - 365
  aldurb1     366 - 366      alchrc1     367 - 367
  altime2     368 - 369      alunit2     370 - 370
  aldura2     371 - 372      aldurb2     373 - 373
  alchrc2     374 - 374      altime3     375 - 376
  alunit3     377 - 377      aldura3     378 - 379
  aldurb3     380 - 380      alchrc3     381 - 381
  altime4     382 - 383      alunit4     384 - 384
  aldura4     385 - 386      aldurb4     387 - 387
  alchrc4     388 - 388      altime5     389 - 390
  alunit5     391 - 391      aldura5     392 - 393
  aldurb5     394 - 394      alchrc5     395 - 395
  altime6     396 - 397      alunit6     398 - 398
  aldura6     399 - 400      aldurb6     401 - 401
  alchrc6     402 - 402      altime7     403 - 404
  alunit7     405 - 405      aldura7     406 - 407
  aldurb7     408 - 408      alchrc7     409 - 409
  altime8     410 - 411      alunit8     412 - 412
  aldura8     413 - 414      aldurb8     415 - 415
  alchrc8     416 - 416      altime9     417 - 418
  alunit9     419 - 419      aldura9     420 - 421
  aldurb9     422 - 422      alchrc9     423 - 423
  altime10    424 - 425      alunit10    426 - 426
  aldura10    427 - 428      aldurb10    429 - 429
  alchrc10    430 - 430      altime11    431 - 432
  alunit11    433 - 433      aldura11    434 - 435
  aldurb11    436 - 436      alchrc11    437 - 437
  altime12    438 - 439      alunit12    440 - 440
  aldura12    441 - 442      aldurb12    443 - 443
  alchrc12    444 - 444      altime13    445 - 446
  alunit13    447 - 447      aldura13    448 - 449
  aldurb13    450 - 450      alchrc13    451 - 451
  atime14a    452 - 453      aunit14a    454 - 454
  adura14a    455 - 456      adurb14a    457 - 457
  achrc14a    458 - 458      altime15    459 - 460
  alunit15    461 - 461      aldura15    462 - 463
  aldurb15    464 - 464      alchrc15    465 - 465
  altime16    466 - 467      alunit16    468 - 468
  aldura16    469 - 470      aldurb16    471 - 471
  alchrc16    472 - 472      altime17    473 - 474
  alunit17    475 - 475      aldura17    476 - 477
  aldurb17    478 - 478      alchrc17    479 - 479
  altime18    480 - 481      alunit18    482 - 482
  aldura18    483 - 484      aldurb18    485 - 485
  alchrc18    486 - 486      altime19    487 - 488
  alunit19    489 - 489      aldura19    490 - 491
  aldurb19    492 - 492      alchrc19    493 - 493
  altime20    494 - 495      alunit20    496 - 496
  aldura20    497 - 498      aldurb20    499 - 499
  alchrc20    500 - 500      altime21    501 - 502
  alunit21    503 - 503      aldura21    504 - 505
  aldurb21    506 - 506      alchrc21    507 - 507
  altime22    508 - 509      alunit22    510 - 510
  aldura22    511 - 512      aldurb22    513 - 513
  alchrc22    514 - 514      altime23    515 - 516
  alunit23    517 - 517      aldura23    518 - 519
  aldurb23    520 - 520      alchrc23    521 - 521
  altime24    522 - 523      alunit24    524 - 524
  aldura24    525 - 526      aldurb24    527 - 527
  alchrc24    528 - 528      altime25    529 - 530
  alunit25    531 - 531      aldura25    532 - 533
  aldurb25    534 - 534      alchrc25    535 - 535
  altime26    536 - 537      alunit26    538 - 538
  aldura26    539 - 540      aldurb26    541 - 541
  alchrc26    542 - 542      altime27    543 - 544
  alunit27    545 - 545      aldura27    546 - 547
  aldurb27    548 - 548      alchrc27    549 - 549
  altime28    550 - 551      alunit28    552 - 552
  aldura28    553 - 554      aldurb28    555 - 555
  alchrc28    556 - 556      altime29    557 - 558
  alunit29    559 - 559      aldura29    560 - 561
  aldurb29    562 - 562      alchrc29    563 - 563

  altime30    564 - 565      alunit30    566 - 566
  aldura30    567 - 568      aldurb30    569 - 569
  alchrc30    570 - 570      altime31    571 - 572
  alunit31    573 - 573      aldura31    574 - 575
  aldurb31    576 - 576      alchrc31    577 - 577
  altime32    578 - 579      alunit32    580 - 580
  aldura32    581 - 582      aldurb32    583 - 583
  alchrc32    584 - 584      altime33    585 - 586
  alunit33    587 - 587      aldura33    588 - 589
  aldurb33    590 - 590      alchrc33    591 - 591
  altime34    592 - 593      alunit34    594 - 594
  aldura34    595 - 596      aldurb34    597 - 597
  alchrc34    598 - 598      altime90    599 - 600
  alunit90    601 - 601      aldura90    602 - 603
  aldurb90    604 - 604      alchrc90    605 - 605
  altime91    606 - 607      alunit91    608 - 608
  aldura91    609 - 610      aldurb91    611 - 611
  alchrc91    612 - 612      alcndrt     613 - 613
  alchronr    614 - 614

  smkev       615 - 615      smkreg      616 - 617
  smknow      618 - 618      smkstat2    619 - 619
  smkqtno     620 - 621      smkqttp     622 - 622
  smkqty      623 - 624      cigsda1     625 - 626
  cigdamo     627 - 628      cigsda2     629 - 630
  cigsday     631 - 632      cigqtyr     633 - 633
  othcigev    634 - 634      othciged    635 - 635
  smklesev    636 - 636      smklesed    637 - 637
  toblasyr    638 - 638      tobqtyr     639 - 639
  vigno       640 - 642      vigtp       643 - 643
  vigfreqw    644 - 645      viglngno    646 - 648
  viglngtp    649 - 649      vigmin      650 - 652
  modno       653 - 655      modtp       656 - 656
  modfreqw    657 - 658      modlngno    659 - 661
  modlngtp    662 - 662      modmin      663 - 665
  strngno     666 - 668      strngtp     669 - 669
  strfreqw    670 - 671      alc1yr      672 - 672
  alclife     673 - 673      alc12mno    674 - 676
  alc12mtp    677 - 677      alc12mwk    678 - 679
  alc12myr    680 - 682      alcamt      683 - 684
  alcstat     685 - 686      alc5upno    687 - 689
  alc5uptp    690 - 690      alc5upyr    691 - 693
  aheight     694 - 695      aweightp    696 - 698
  bmi         699 - 702

  ausualpl    703 - 703      aplkind     704 - 704
  ahcplrou    705 - 705      ahcplknd    706 - 706
  ahcchgyr    707 - 707      ahcchghi    708 - 708
  anouspl1    709 - 709      anouspl2    710 - 710
  anouspl3    711 - 711      anouspl4    712 - 712
  anouspl5    713 - 713      anouspl6    714 - 714
  anouspl7    715 - 715      anouspl8    716 - 716
  anouspl9    717 - 717      aprvtryr    718 - 718
  aprvtrfd    719 - 719      adrnanp     720 - 720
  adrnai      721 - 721      ahcdlyr1    722 - 722
  ahcdlyr2    723 - 723      ahcdlyr3    724 - 724
  ahcdlyr4    725 - 725      ahcdlyr5    726 - 726
  ahcafyr1    727 - 727      ahcafyr2    728 - 728
  ahcafyr3    729 - 729      ahcafyr4    730 - 730
  ahcafyr5    731 - 731      ahcafyr6    732 - 732
  aworpay     733 - 733      ahicomp     734 - 734
  arx12mo     735 - 735      arx12_1     736 - 736
  arx12_2     737 - 737      arx12_3     738 - 738
  arx12_4     739 - 739      arx12_5     740 - 740
  arx12_6     741 - 741      adnlong2    742 - 742
  ahcsyr1     743 - 743      ahcsyr2     744 - 744
  ahcsyr3     745 - 745      ahcsyr4     746 - 746
  ahcsyr5     747 - 747      ahcsyr6     748 - 748
  ahcsyr7     749 - 749      ahcsyr8     750 - 750
  ahcsyr9     751 - 751      ahcsyr10    752 - 752
  ahernoy2    753 - 754      aervisnd    755 - 755
  aerhos      756 - 756      aerrea1r    757 - 757
  aerrea2r    758 - 758      aerrea3r    759 - 759
  aerrea4r    760 - 760      aerrea5r    761 - 761
  aerrea6r    762 - 762      aerrea7r    763 - 763
  aerrea8r    764 - 764      ahchyr      765 - 765
  ahchmoyr    766 - 767      ahchnoy2    768 - 769
  ahcnoyr2    770 - 771      asrgyr      772 - 772
  asrgnoyr    773 - 774      amdlongr    775 - 775
  avislast    776 - 776      alastyp1    777 - 777
  alastyp2    778 - 778      alastyp3    779 - 779
  alastyp4    780 - 780  str alastvrb    781 - 796
  avisapn2    797 - 798      avisapt2    799 - 799
  awaitrmn    800 - 801      awaitrmt    802 - 802
  hit1a       803 - 803      hit2a       804 - 804
  hit3a       805 - 805      hit4a       806 - 806
  hit5a       807 - 807      shtflu2     808 - 808
  ashflum2    809 - 810      ashfluy2    811 - 814
  flushpg1    815 - 815      flushpg2    816 - 816
  sprflu2     817 - 817      aspflum2    818 - 819
  aspfluy2    820 - 823      shtpnuyr    824 - 824
  apox        825 - 825      apox12mo    826 - 826
  ahep        827 - 827      ahepliv     828 - 828
  ahepbtst    829 - 829      shthepb     830 - 830
  shepdos     831 - 831      shthepa     832 - 832
  shepanum    833 - 834      ahepctst    835 - 835
  ahepcres    836 - 836      shingles    837 - 837
  shttd       838 - 838      shttd05     839 - 839
  shttdap2    840 - 840      shthpv2     841 - 841
  shhpvdos    842 - 843      ahpvage     844 - 846
  livev       847 - 847      travel      848 - 848
  wrkhlth2    849 - 849      wrkdir      850 - 850
  apsbpchk    851 - 851      apschchk    852 - 852
  apsbschk    853 - 853      apspap      854 - 854
  apsmam      855 - 855      apscol      856 - 856
  apsdiet     857 - 857      apssmkc     858 - 858
  ltcfam      859 - 859      ltchelp     860 - 860
  ltcwho1     861 - 861      ltcwho2     862 - 862
  ltcwho3     863 - 863      ltcwho4     864 - 864
  ltcwho5     865 - 865      aindins     866 - 866
  aindprch    867 - 867      aindwho     868 - 868
  ainddif1    869 - 869      ainddif2    870 - 870
  aindeny1    871 - 871      aindeny2    872 - 872
  aindeny3    873 - 873      aindnot1    874 - 874
  aindnot2    875 - 875      aindnot3    876 - 876
  aindnot4    877 - 877      aindnot5    878 - 878
  aexchng     879 - 879

  snonce      880 - 880      snnum1      881 - 883
  paphad1     884 - 884      rpap1_m1    885 - 886
  rpap1_y1    887 - 890      rpap1n1     891 - 892
  rpap1t1     893 - 893      rpap21      894 - 894
  rpap3a1     895 - 895      rpap3b1     896 - 896
  paprea1     897 - 897      mdrecp1     898 - 898
  papwhen     899 - 900      hyst        901 - 901
  mamhad      902 - 902      rmam1_mt    903 - 904
  rmam1_yr    905 - 908      rmam1n      909 - 910
  rmam1t      911 - 911      rmam2       912 - 912
  rmam3a      913 - 913      rmam3b      914 - 914
  mamreas     915 - 915      mdrecmam    916 - 916
  psarec      917 - 917      psahad      918 - 918
  rpsa1_mt    919 - 920      rpsa1_yr    921 - 924
  rpsa1n      925 - 926      rpsa1t      927 - 927
  rpsa2       928 - 928      rpsa3a      929 - 929
  rpsa3b      930 - 930      psareas     931 - 931
  colhad      932 - 932      col_mt      933 - 934
  col_yr      935 - 938      coln        939 - 940
  colt        941 - 941      col2        942 - 942
  col3a       943 - 943      col3b       944 - 944
  colreas     945 - 945      sighad      946 - 946
  sig_mt      947 - 948      sig_yr      949 - 952
  sign        953 - 954      sigt        955 - 955
  sig2        956 - 956      sig3a       957 - 957
  sig3b       958 - 958      sigreas     959 - 959
  hfobhad     960 - 960      rhfo1_mt    961 - 962
  rhfo1_yr    963 - 966      rhfo1n      967 - 968
  rhfo1t      969 - 969      rhfo2       970 - 970
  rhfob3a     971 - 971      rhfob3b     972 - 972
  hfobrea1    973 - 973      colprob1    974 - 974

  asicpuse    975 - 975      asisathc    976 - 976
  asitenur    977 - 977      asinhelp    978 - 978
  asincnto    979 - 979      asintru     980 - 980
  asinknt     981 - 981      asisim      982 - 982
  asisif      983 - 983      asiretr     984 - 984
  asimedc     985 - 985      asistlv     986 - 986
  asicnhc     987 - 987      asiccoll    988 - 988
  asinbill    989 - 989      asihcst     990 - 990
  asiccmp     991 - 991      asisleep    992 - 993
  asislpfl    994 - 995      asislpst    996 - 997
  asislpmd    998 - 999      asirest    1000 -1001
  asisad     1002 -1002      asinerv    1003 -1003
  asirstls   1004 -1004      asihopls   1005 -1005
  asieffrt   1006 -1006      asiwthls   1007 -1007
  asimuch    1008 -1008      asihivt    1009 -1009
  asihivwn   1010 -1011

  awebuse    1012 -1012      awebofno   1013 -1015
  aweboftp   1016 -1016      awebeml    1017 -1017
  awebmno    1018 -1020      awebmtp    1021 -1021

  using "$DAT/samadult.dat";
replace wtia_sa = wtia_sa/10;
replace bmi = bmi/100;

* DEFINE VARIABLE LABELS;

label variable rectype  "File type identifier";
label variable srvy_yr  "Year of National Health Interview Survey";
label variable hhx      "Household Number";
label variable intv_qrt "Interview Quarter";
label variable intv_mon "Interview Month";
label variable fmx      "Family Number";
label variable fpx      "Person Number (Within family)";
label variable wtia_sa  "Weight - Interim Annual";
label variable wtfa_sa  "Weight - Final Annual";

label variable region   "Region";
label variable strat_p  "Pseudo-stratum for public use file variance estimation
  ";
label variable psu_p    "Pseudo-PSU for public use file variance estimation";

label variable sex      "Sex";
label variable hispan_i "Hispanic subgroup detail";
label variable racerpi2 "OMB groups w/multiple race";
label variable mracrpi2 "Race coded to single/multiple race group";
label variable mracbpi2 "Race coded to single/multiple race group";
label variable age_p    "Age";

label variable r_maritl "Marital Status";

label variable proxysa  "Sample adult status";
label variable prox1    "Knowledgeable proxy for Sample Adult available";
label variable prox2    "Relationship of SA proxy to SA";
label variable lateinta "Late Sample Adult interviews";

label variable fdrn_flg "Disability Questions flag";

label variable doinglwa "Corrected employment status last week";
label variable whynowka "Main reason for not working last week";
label variable everwrk  "Ever worked";
label variable indstrn1 "
  Detailed industry classification (based on 2007 NAICS-informed codes from Census
  )";
label variable indstrn2 "
  Simple industry classification (based on 2007 NAICS-informed Codes from Census)
  ";
label variable occupn1  "
  Detailed occupation classification (based on 2010 SOC-informed codes from Census
  )";
label variable occupn2  "
  Simple occupation classification (based on 2010 SOC-informed codes from Census)
  ";
label variable wrkcata  "Class of worker";
label variable businc1a "Current job an incorporated business";
label variable locall1a "Number of employees at work";
label variable yrswrkpa "Number of years on the job";
label variable wrklongh "Current/most recent job also longest held job";
label variable hourpda  "Paid by the hour at current or most recent job";
label variable pdsicka  "Paid sick leave at current or most recent job";
label variable onejob   "Have more than one job";
label variable wrklyr4  "Work status: last week, past 12 months";

label variable hypev    "Ever been told you have hypertension";
label variable hypdifv  "Ever had hypertension on 2+ visits";
label variable hypyr1   "Had hypertension, past 12 months";
label variable chlyr1   "Had high cholesterol, past 12 months";
label variable chdev    "Ever been told you had coronary heart disease";
label variable angev    "Ever been told you had angina pectoris";
label variable miev     "Ever been told you had a heart attack";
label variable hrtev    "Ever been told you had a heart condition/disease";
label variable strev    "Ever been told you had a stroke";
label variable ephev    "Ever been told you had emphysema";
label variable copdev   "Ever been told you had COPD";
label variable aspmedev "Ever been told to take low-dose aspirin";
label variable aspmedad "Following low-dose aspirin advice";
label variable aspmdmed "Advised to stop taking low-dose aspirin";
label variable asponown "Taking low-dose aspirin on own";
label variable aasmev   "Ever been told you had asthma";
label variable aasstill "Still have asthma";
label variable aasmyr   "Had an asthma episode/attack past 12 m";
label variable aaseryr1 "Had visit to ER due to asthma past 12 m";
label variable aasmhsp1 "
  Had stayed overnight in hospital due to asthma, past 12 m";
label variable awzmswk1 "# Work days missed due to asthma, past 12 mo.";
label variable aasmmed1 "Used oral inhaler, past 3 mo";
label variable aasmtyp  "Type of rescue prescription asthma medication";
label variable aasmcan1 "Used more than 3 canisters of mouth inhaler, past 3 mo
  ";
label variable aasmdtp2 "Taking preventive asthma medication";
label variable aaswmp1  "Given asthma action plan";
label variable aasclass "Ever taken asthma mgmt. class";
label variable aas_rec  "Taught to recognize asthma episode";
label variable aas_res  "Taught how to respond to asthma episode";
label variable aas_mon  "Taught how to monitor peak flow for daily therapy";
label variable aapenvln "Ever advised to change environment for asthma";
label variable aaroutin "Routine checkup for your asthma, past 12 m";
label variable aasympt  "Last doctor visit, asked how often…had asthma symptoms
  ";
label variable aarescue "
  Last doctor visit, asked how often…used quick relief inhaler";
label variable aaactlim "
  Last doctor visit, asked how often…asthma symptoms limited activity";
label variable ulcev    "Ever been told you have an ulcer";
label variable ulcyr    "Had ulcer in past 12 m";
label variable canev    "Ever told by a doctor you had cancer";
label variable cnkind1  "What kind of cancer ... Bladder";
label variable cnkind2  "What kind of cancer ... Blood";
label variable cnkind3  "What kind of cancer ... Bone";
label variable cnkind4  "What kind of cancer ... Brain";
label variable cnkind5  "What kind of cancer ... Breast";
label variable cnkind6  "What kind of cancer ... Cervix";
label variable cnkind7  "What kind of cancer ... Colon";
label variable cnkind8  "What kind of cancer ... Esophagus";
label variable cnkind9  "What kind of cancer ... Gallbladder";
label variable cnkind10 "What kind of cancer ... Kidney";
label variable cnkind11 "What kind of cancer ... larynx-windpipe";
label variable cnkind12 "What kind of cancer ... Leukemia";
label variable cnkind13 "What kind of cancer ... Liver";
label variable cnkind14 "What kind of cancer ... Lung";
label variable cnkind15 "What kind of cancer ... Lymphoma";
label variable cnkind16 "What kind of cancer ... Melanoma";
label variable cnkind17 "What kind of cancer ... mouth/tongue/lip";
label variable cnkind18 "What kind of cancer ... Ovary";
label variable cnkind19 "What kind of cancer ... Pancreas";
label variable cnkind20 "What kind of cancer ... Prostate";
label variable cnkind21 "What kind of cancer ... Rectum";
label variable cnkind22 "What kind of cancer ... skin (non-melanoma)";
label variable cnkind23 "What kind of cancer ... skin (DK kind)";
label variable cnkind24 "What kind of cancer ... soft tissue (muscle or fat)";
label variable cnkind25 "What kind of cancer ... Stomach";
label variable cnkind26 "What kind of cancer ... Testis";
label variable cnkind27 "What kind of cancer ... throat - pharynx";
label variable cnkind28 "What kind of cancer ... Thyroid";
label variable cnkind29 "What kind of cancer ... Uterus";
label variable cnkind30 "What kind of cancer ... Other";
label variable cnkind31 "What kind of cancer ... more than 3 kinds";
label variable canage1  "Age first diagnosed w/bladder cancer";
label variable canage2  "Age first diagnosed w/blood cancer";
label variable canage3  "Age first diagnosed w/bone cancer";
label variable canage4  "Age first diagnosed w/brain cancer";
label variable canage5  "Age first diagnosed w/breast cancer";
label variable canage6  "Age first diagnosed w/cervical cancer";
label variable canage7  "Age first diagnosed w/colon cancer";
label variable canage8  "Age first diagnosed w/esophageal cancer";
label variable canage9  "Age first diagnosed w/gallbladder cancer";
label variable canage10 "Age first diagnosed w/kidney cancer";
label variable canage11 "Age first diagnosed w/larynx-windpipe cancer";
label variable canage12 "Age first diagnosed w/leukemia";
label variable canage13 "Age first diagnosed w/liver cancer";
label variable canage14 "Age first diagnosed w/lung cancer";
label variable canage15 "Age first diagnosed w/lymphoma";
label variable canage16 "Age first diagnosed w/melanoma";
label variable canage17 "Age first diagnosed w/mouth/tongue/lip cancer";
label variable canage18 "Age first diagnosed w/ovarian cancer";
label variable canage19 "Age first diagnosed w/pancreatic cancer";
label variable canage20 "Age first diagnosed w/prostate cancer";
label variable canage21 "Age first diagnosed w/rectal cancer";
label variable canage22 "Age first diagnosed w/skin (non-melanoma) cancer";
label variable canage23 "Age first diagnosed w/skin (DK kind) cancer";
label variable canage24 "Age first diagnosed w/soft tissue cancer";
label variable canage25 "Age first diagnosed w/stomach cancer";
label variable canage26 "Age first diagnosed w/testicular cancer";
label variable canage27 "Age first diagnosed w/throat/pharynx cancer";
label variable canage28 "Age first diagnosed w/thyroid cancer";
label variable canage29 "Age first diagnosed w/uterine cancer";
label variable canage30 "Age first diagnosed w/other cancer";
label variable dibev    "Ever been told that you have diabetes";
label variable dibpre1  "Ever had prediabetes or other symptoms";
label variable dibage   "Age first diagnosed w/diabetes";
label variable difage2  "Years since first diagnosed w/diabetes";
label variable insln    "NOW taking insulin";
label variable dibpill  "NOW taking diabetic pills";
label variable epilep1  "Ever been told you had seizure order/epilepsy";
label variable epilep2  "Now taking epilepsy meds";
label variable epilep3  "# Seizures past 12 m";
label variable epilep4  "Seen neurologist/specialist past 12 m";
label variable epilep5  "Epilepsy interfered w/ activities past 30 d";
label variable ahayfyr  "Told that you had hay fever, past 12 m";
label variable sinyr    "Told that you had sinusitis, past 12 m";
label variable cbrchyr  "Told you had chronic bronchitis, 12 m";
label variable kidwkyr  "Told you had weak/failing kidneys, 12 m";
label variable livyr    "Told you had liver condition, past 12 m";
label variable jntsymp  "Symptoms of joint pain/aching/stiffness past 30 d";
label variable jmthp1   "Which joint affected...shoulder-right";
label variable jmthp2   "Which joint affected...shoulder-left";
label variable jmthp3   "Which joint affected...elbow-right";
label variable jmthp4   "Which joint affected...elbow-left";
label variable jmthp5   "Which joint affected...hip-right";
label variable jmthp6   "Which joint affected...hip-left";
label variable jmthp7   "Which joint affected...wrist-right";
label variable jmthp8   "Which joint affected...wrist-left";
label variable jmthp9   "Which joint affected...knee-right";
label variable jmthp10  "Which joint affected...knee-left";
label variable jmthp11  "Which joint affected...ankle-right";
label variable jmthp12  "Which joint affected...ankle-left";
label variable jmthp13  "Which joint affected...toes-right";
label variable jmthp14  "Which joint affected...toes-left";
label variable jmthp15  "Which joint affected...fingers/thumb-right";
label variable jmthp16  "Which joint affected...fingers/thumb-left";
label variable jmthp17  "Which joint affected...other joint not listed";
label variable jntchr   "Joint symptoms begin more than 3 months ago";
label variable jnthp    "
  Ever seen doctor or health professional for joint symptoms";
label variable arth1    "Ever been told you had arthritis";
label variable arthlmt  "Limited due to arthritis or joint symptoms";
label variable paineck  "Had neck pain, past 3 months";
label variable painlb   "Had low back pain, past 3 months";
label variable painleg  "Pain spread down leg/below knees";
label variable painface "Had pain in jaw/front of ear, past 3 months";
label variable amigr    "Had severe headache/migraine, past 3 m";
label variable acold2w  "Had a head/chest cold past 2 w";
label variable aintil2w "Had stomach prob w/vomit/diarrhea, 2 w";
label variable pregnow  "Currently pregnant";
label variable pregflyr "Recently pregnant";
label variable hraidnow "Now use a hearing aid";
label variable hraidev  "Ever used a hearing aid if not now using";
label variable ahearst1 "Hearing w/o hearing aid";
label variable avision  "Trouble seeing even w/glasses/lenses";
label variable ablind   "Blind or unable to see at all";
label variable lupprt   "Lost all upper & lower natural teeth";

label variable aimsupev "Ever been told your immune system is weakened";
label variable aimspstl "Still have weakened immune system";
label variable aimspmed "
  Medications/treatments weakened your immune system, past 6 months";
label variable aimspchc "Current health condition weakens your immune system";
label variable aimspshc "
  Ever told your immune system is weakened due to kidney, lung, or liver disease,
  diabetes, poor nutrition or frailty";
label variable aimspcan "Ever told your immune system is weakened due to cancer
  ";
label variable aimspcld "
  Ever told your immune system is weakened because of many infections, colds or ca
  n't seem to get over them.";

label variable wkdayr   "Number of work loss days, past 12 months";
label variable beddayr  "Number of bed days, past 12 months";
label variable ahstatyr "Health better/worse/same, compared w/ 12 months ago";
label variable speceq   "Have health problem that requires special equipment";
label variable flwalk   "
  How difficult to walk 1/4 mile without special equipment";
label variable flclimb  "
  How difficult to climb 10 steps without special equipment";
label variable flstand  "
  How difficult to stand 2 hours without special equipment";
label variable flsit    "How difficult to sit 2 hours without special equipment
  ";
label variable flstoop  "
  How difficult to stoop, bend or kneel without special equipment";
label variable flreach  "
  How difficult to reach over head without special equipment";
label variable flgrasp  "
  How difficult to grasp small objects without special equipment";
label variable flcarry  "
  How difficult to lift/carry 10 lbs without special equipment";
label variable flpush   "
  How difficult to push large objects without special equipment";
label variable flshop   "
  How difficult to go out to events without special equipment";
label variable flsocl   "
  How difficult to participate in social activities without special equipment";
label variable flrelax  "
  How difficult to relax at home without special equipment";
label variable fla1ar   "Any functional limitation, all conditions";
label variable aflhca1  "Vision/problem seeing causes difficulty with activity";
label variable aflhca2  "Hearing problem causes difficulty with activity";
label variable aflhca3  "Arthritis/rheumatism causes difficulty with activity";
label variable aflhca4  "Back or neck problem causes difficulty with activity";
label variable aflhca5  "
  Fracture, bone/joint injury causes difficulty with activity";
label variable aflhca6  "Other injury causes difficulty with activity";
label variable aflhca7  "Heart problem causes difficulty with activity";
label variable aflhca8  "Stroke problem causes difficulty with activity";
label variable aflhca9  "
  Hypertension/high blood pressure causes difficulty with activity";
label variable aflhca10 "Diabetes causes difficulty with activity";
label variable aflhca11 "
  Lung/breathing problem (e.g., asthma and emphysema)  causes difficulty with acti
  vity";
label variable aflhca12 "Cancer causes difficulty with activity";
label variable aflhca13 "Birth defect causes difficulty with activity";
label variable alhca14a "
  Intellectual disability, also known as mental retardation causes difficulty with
  activity";
label variable aflhca15 "
  Other developmental problem (e.g., cerebral palsy) causes difficulty with activi
  ty";
label variable aflhca16 "Senility causes difficulty with activity";
label variable aflhca17 "
  Depression/anxiety/emotional problem causes difficulty with activity";
label variable aflhca18 "Weight problem causes difficulty with activity";
label variable aflhc19_ "
  Missing or amputated limb/finger/digit causes difficulty with activity";
label variable aflhc20_ "
  Musculoskeletal/connective tissue problem causes difficulty with activity";
label variable aflhc21_ "
  Circulation problems (including blood clots) cause difficulty with activity";
label variable aflhc22_ "
  Endocrine/nutritional/metabolic problem causes difficulty with activity";
label variable aflhc23_ "
  Nervous system/sensory organ condition causes difficulty with activity";
label variable aflhc24_ "
  Digestive system problem causes difficulty with activity";
label variable aflhc25_ "
  Genitourinary system problem causes difficulty with activity";
label variable aflhc26_ "
  Skin/subcutaneous system problem causes difficulty with activity";
label variable aflhc27_ "
  Blood or blood-forming organ problem causes difficulty with activity";
label variable aflhc28_ "Benign tumor/cyst causes difficulty with activity";
label variable aflhc29_ "
  Alcohol/drug/substance abuse problem causes difficulty with activity";
label variable aflhc30_ "
  Other mental problem/ADD/Bipolar/Schizophrenia causes difficulty with activity";
label variable aflhc31_ "
  Surgical after-effects/medical treatment causes difficulty with activity";
label variable aflhc32_ "
  'Old age'/elderly/aging-related problem causes difficulty with activity";
label variable aflhc33_ "
  Fatigue/tiredness/weakness causes difficulty with activity";
label variable aflhc34_ "
  Pregnancy-related problem causes difficulty with activity";
label variable aflhca90 "
  Other impairment/problem (1) causes difficulty with activity";
label variable aflhca91 "
  Other impairment/problem (2) causes difficulty with activity";
label variable altime1  "Duration of vision problem: Number of units";
label variable alunit1  "Duration of vision problem: Time unit";
label variable aldura1  "Duration (in years) of vision problem, recode 1";
label variable aldurb1  "Duration of vision problem, recode 2";
label variable alchrc1  "Vision problem condition status recode";
label variable altime2  "Duration of hearing problem: Number of units";
label variable alunit2  "Duration of hearing problem: Time unit";
label variable aldura2  "Duration (in years) of hearing problem, recode 1";
label variable aldurb2  "Duration of hearing problem, recode 2";
label variable alchrc2  "Hearing problem condition status recode";
label variable altime3  "Duration of arthritis/rheumatism: Number of units";
label variable alunit3  "Duration of arthritis/rheumatism: Time unit";
label variable aldura3  "Duration (in years) of arthritis/rheumatism, recode 1";
label variable aldurb3  "Duration of arthritis/rheumatism, recode 2";
label variable alchrc3  "Arthritis/rheumatism condition status recode";
label variable altime4  "Duration of back or neck problem: Number of units";
label variable alunit4  "Duration of back or neck problem: Time unit";
label variable aldura4  "Duration (in years) of back or neck problem, recode 1";
label variable aldurb4  "Duration of back or neck problem, recode 2";
label variable alchrc4  "Back or neck problem condition status recode";
label variable altime5  "
  Duration of fracture, bone/joint injury: Number of units";
label variable alunit5  "Duration of fracture, bone/joint injury: Time unit";
label variable aldura5  "
  Duration (in years) of fracture, bone/joint injury, recode 1";
label variable aldurb5  "Duration of fracture, bone/joint injury, recode 2";
label variable alchrc5  "Fracture, bone/joint injury condition status recode";
label variable altime6  "Duration of other injury: Number of units";
label variable alunit6  "Duration of other injury: Time unit";
label variable aldura6  "Duration (in years) of other injury, recode 1";
label variable aldurb6  "Duration of other injury, recode 2";
label variable alchrc6  "Other injury condition status recode";
label variable altime7  "Duration of heart problem: Number of units";
label variable alunit7  "Duration of heart problem: Time unit";
label variable aldura7  "Duration (in years) of heart problem, recode 1";
label variable aldurb7  "Duration of heart problem, recode 2";
label variable alchrc7  "Heart problem condition status recode";
label variable altime8  "Duration of stroke problem: Number of units";
label variable alunit8  "Duration of stroke problem: Time unit";
label variable aldura8  "Duration (in years) of stroke problem, recode 1";
label variable aldurb8  "Duration of stroke problem, recode 2";
label variable alchrc8  "Stroke problem condition status recode";
label variable altime9  "
  Duration of hypertension or high blood pressure: Number of units";
label variable alunit9  "
  Duration of hypertension or high blood pressure: Time unit";
label variable aldura9  "
  Duration (in years) of hypertension or high blood pressure: recode 1";
label variable aldurb9  "
  Duration of hypertension or high blood pressure: recode 2";
label variable alchrc9  "
  Hypertension or high blood pressure condition status recode";
label variable altime10 "Duration of diabetes: Number of units";
label variable alunit10 "Duration of diabetes: Time unit";
label variable aldura10 "Duration (in years) of diabetes, recode 1";
label variable aldurb10 "Duration of diabetes, recode 2";
label variable alchrc10 "Diabetes condition status recode";
label variable altime11 "
  Duration of lung/breathing problem (e.g., asthma and emphysema): Number of units
  ";
label variable alunit11 "
  Duration of lung/breathing problem: (e.g., asthma and emphysema) Time unit";
label variable aldura11 "
  Duration (in years) of lung/breathing problem (e.g., asthma and emphysema), reco
  de 1";
label variable aldurb11 "
  Duration of lung/breathing problem (e.g., asthma and emphysema), recode 2";
label variable alchrc11 "
  Lung/breathing problem (e.g., asthma and emphysema) condition status recode";
label variable altime12 "Duration of cancer: Number of units";
label variable alunit12 "Duration of cancer: Time unit";
label variable aldura12 "Duration (in years) of cancer, recode 1";
label variable aldurb12 "Duration of cancer, recode 2";
label variable alchrc12 "Cancer condition status recode";
label variable altime13 "Duration of birth defect: Number of units";
label variable alunit13 "Duration of birth defect: Time unit";
label variable aldura13 "Duration (in years) of birth defect, recode 1";
label variable aldurb13 "Duration of birth defect, recode 2";
label variable alchrc13 "Birth defect condition status recode";
label variable atime14a "
  Duration of intellectual disability, also known as mental retardation: Number of
  units";
label variable aunit14a "
  Duration of intellectual disability, also know as mental retardation: Time unit
  ";
label variable adura14a "
  Duration (in years) of intellectual disability, also known as mental retardation
  , recode 1";
label variable adurb14a "
  Duration of intellectual disability, also known as mental retardation, recode 2
  ";
label variable achrc14a "
  Intellectual disability, also known as mental retardation condition status recod
  e";
label variable altime15 "
  Duration of other developmental problem (e.g., cerebral palsy): Number of units
  ";
label variable alunit15 "
  Duration of other developmental problem (e.g., cerebral palsy): Time unit";
label variable aldura15 "
  Duration (in years) of other developmental problem (e.g., cerebral palsy), recod
  e 1";
label variable aldurb15 "
  Duration of other developmental problem (e.g., cerebral palsy), recode 2";
label variable alchrc15 "
  Other developmental problem (e.g., cerebral palsy) condition status recode";
label variable altime16 "Duration of senility: Number of units";
label variable alunit16 "Duration of senility: Time unit";
label variable aldura16 "Duration (in years) of senility, recode 1";
label variable aldurb16 "Duration of senility, recode 2";
label variable alchrc16 "Senility condition status recode";
label variable altime17 "
  Duration of depression/anxiety/emotional problem: Number of units";
label variable alunit17 "
  Duration of depression/anxiety/emotional problem: Time unit";
label variable aldura17 "
  Duration (in years) of depression/anxiety/emotional problem, recode 1";
label variable aldurb17 "
  Duration of depression/anxiety/emotional problem, recode 2";
label variable alchrc17 "
  Depression/anxiety/emotional problem condition status recode";
label variable altime18 "Duration of weight problem: Number of units";
label variable alunit18 "Duration of weight problem: Time unit";
label variable aldura18 "Duration (in years) of weight problem, recode 1";
label variable aldurb18 "Duration of weight problem, recode 2";
label variable alchrc18 "Weight problem condition status recode";
label variable altime19 "
  Duration of missing limbs (fingers, toes, or digits); amputation: Number of unit
  s";

label variable alunit19 "
  Duration of missing limbs (fingers, toes, or digits); amputation: Time unit";
label variable aldura19 "
  Duration (in years) of missing limbs (fingers, toes, or digits); amputation, rec
  ode 1";
label variable aldurb19 "
  Duration of missing limbs (fingers, toes, or digits); amputation, recode 2";
label variable alchrc19 "
  Missing limbs (fingers, toes, or digits); amputation condition status recode";
label variable altime20 "
  Duration of musculoskeletal/connective tissue problem: Number of units";
label variable alunit20 "
  Duration of musculoskeletal/connective tissue problem: Time unit";
label variable aldura20 "
  Duration (in years) of musculoskeletal/connective tissue problem, recode 1";
label variable aldurb20 "
  Duration of musculoskeletal/connective tissue problem, recode 2";
label variable alchrc20 "
  Musculoskeletal/connective tissue problem condition status recode";
label variable altime21 "
  Duration of circulation problems (including blood clots): Number of units";
label variable alunit21 "
  Duration of circulation problems (including blood clots): Time unit";
label variable aldura21 "
  Duration (in years) of circulation problems (including blood clots), recode 1";
label variable aldurb21 "
  Duration of circulation problems (including blood clots), recode 2";
label variable alchrc21 "
  Circulation problems (including blood clots) condition status recode";
label variable altime22 "
  Duration of endocrine/nutritional/metabolic problem: Number of units";
label variable alunit22 "
  Duration of endocrine/nutritional/metabolic problem: Time unit";
label variable aldura22 "
  Duration (in years) of endocrine/nutritional/metabolic problem, recode 1";
label variable aldurb22 "
  Duration of endocrine/nutritional/metabolic problem, recode 2";
label variable alchrc22 "
  Endocrine/nutritional/metabolic problem condition status recode";
label variable altime23 "
  Duration of nervous system/sensory organ condition: Number of units";
label variable alunit23 "
  Duration of nervous system/sensory organ condition: Time unit";
label variable aldura23 "
  Duration (in years) of nervous system/sensory organ condition, recode 1";
label variable aldurb23 "
  Duration of nervous system/sensory organ condition, recode 2";
label variable alchrc23 "Nervous system/sensory organ condition status recode";
label variable altime24 "Duration of digestive system problems: Number of units
  ";
label variable alunit24 "Duration of digestive system problems: Time unit";
label variable aldura24 "
  Duration (in years) of digestive system problems, recode 1";
label variable aldurb24 "Duration of digestive system problems, recode 2";
label variable alchrc24 "Digestive system problems condition status recode";
label variable altime25 "
  Duration of genitourinary system problem: Number of units";
label variable alunit25 "Duration of genitourinary system problem: Time unit";
label variable aldura25 "
  Duration (in years) of genitourinary system problem, recode 1";
label variable aldurb25 "Duration of genitourinary system problem, recode 2";
label variable alchrc25 "Genitourinary system problem condition status recode";
label variable altime26 "
  Duration of skin/subcutaneous system problems: Number of units";
label variable alunit26 "
  Duration of skin/subcutaneous system problems: Time unit";
label variable aldura26 "
  Duration (in years) of skin/subcutaneous system problems, recode 1";
label variable aldurb26 "Duration of skin/subcutaneous system problems, recode 2
  ";
label variable alchrc26 "
  Skin/subcutaneous system problems condition status recode";
label variable altime27 "
  Duration of blood or blood-forming organ problem: Number of units";
label variable alunit27 "
  Duration of blood or blood-forming organ problem: Time unit";
label variable aldura27 "
  Duration (in years) of blood or blood-forming organ problem, recode 1";
label variable aldurb27 "
  Duration of blood or blood-forming organ problem, recode 2";
label variable alchrc27 "
  Blood or blood-forming organ problem condition status recode";
label variable altime28 "Duration of benign tumor/cyst: Number of units";
label variable alunit28 "Duration of benign tumor/cyst: Time unit";
label variable aldura28 "Duration (in years) of benign tumor/cyst, recode 1";
label variable aldurb28 "Duration of benign tumor/cyst, recode 2";
label variable alchrc28 "Benign tumor/cyst condition status recode";
label variable altime29 "
  Duration of alcohol /drug/substance abuse problem: Number of units";
label variable alunit29 "
  Duration of alcohol/drug/substance abuse problem: Time unit";
label variable aldura29 "
  Duration (in years) of alcohol/drug/substance abuse problem, recode 1";
label variable aldurb29 "
  Duration of alcohol/drug/substance abuse problem, recode 2";
label variable alchrc29 "
  Alcohol /drug/substance abuse problem condition status recode";
label variable altime30 "
  Duration of other mental problem/ADD/Bipolar/Schizophrenia: Number of units";
label variable alunit30 "
  Duration of other mental problem/ADD/Bipolar/Schizophrenia: Time unit";
label variable aldura30 "
  Duration (in years) of other mental problem/ADD/Bipolar/Schizophrenia, recode 1
  ";
label variable aldurb30 "
  Duration of other mental problem/ADD/Bipolar/Schizophrenia, recode 2";
label variable alchrc30 "
  Other mental problem/ADD/Bipolar/Schizophrenia condition status recode";
label variable altime31 "
  Duration of surgical after-effects/medical treatment problems: Number of units";
label variable alunit31 "
  Duration of surgical after-effects/medical treatment problems: Time unit";
label variable aldura31 "
  Duration (in years) of surgical after-effects/medical treatment problems, recode
  1";
label variable aldurb31 "
  Duration of surgical after-effects/medical treatment problems, recode 2";
label variable alchrc31 "
  Surgical after-effects/medical treatment problems condition status recode";
label variable altime32 "
  Duration of 'old age'/elderly/aging-related problems: Number of units";
label variable alunit32 "
  Duration of 'old age'/elderly/aging-related problems: Time unit";
label variable aldura32 "
  Duration (in years) of 'old age'/elderly/aging-related problems, recode 1";
label variable aldurb32 "
  Duration of 'old age'/elderly/aging-related problems, recode 2";
label variable alchrc32 "
  'Old age'/elderly/aging-related problems condition status recode";
label variable altime33 "
  Duration of fatigue/tiredness/weakness problem: Number of units";
label variable alunit33 "
  Duration of fatigue/tiredness/weakness problem: Time unit";
label variable aldura33 "
  Duration (in years) of fatigue/tiredness/weakness problem, recode 1";
label variable aldurb33 "
  Duration of fatigue/tiredness/weakness problem, recode 2";
label variable alchrc33 "
  Fatigue/tiredness/weakness problem condition status recode";
label variable altime34 "Duration of pregnancy-related problem: Number of units
  ";
label variable alunit34 "Duration of pregnancy-related problem: Time unit";
label variable aldura34 "
  Duration (in years) of pregnancy-related problem, recode 1";
label variable aldurb34 "Duration of pregnancy-related problem, recode 2";
label variable alchrc34 "Pregnancy-related condition status recode";
label variable altime90 "
  Duration of other impairment/problem N.E.C. (1): Number of units";
label variable alunit90 "
  Duration of other impairment/problem N.E.C. (1): Time unit";
label variable aldura90 "
  Duration (in years) of other impairment/problem N.E.C. (1), recode 1";
label variable aldurb90 "
  Duration of other impairment/problem N.E.C. (1), recode 2";
label variable alchrc90 "
  Other impairment/problem N.E.C. (1) condition status recode";
label variable altime91 "
  Duration of other impairment/problem N.E.C. (2): Number of units";
label variable alunit91 "
  Duration of other impairment/problem N.E.C. (2): Time unit";
label variable aldura91 "
  Duration (in years) of other impairment/ problem N.E.C. (2), recode 1";
label variable aldurb91 "
  Duration of other impairment/problem N.E.C. (2), recode 2";
label variable alchrc91 "
  Other impairment/problem N.E.C. (2) condition status recode";
label variable alcndrt  "
  Chronic condition recode for individual with functional limitation";
label variable alchronr "
  Overall functional limitation recode by condition status";

label variable smkev    "Ever smoked 100 cigarettes";
label variable smkreg   "Age first smoked fairly regularly";
label variable smknow   "Smoke freq: everyday/some days/not at all";
label variable smkstat2 "Smoking Status: Recode";
label variable smkqtno  "Time since quit: # of units";
label variable smkqttp  "Time since quit: time period";
label variable smkqty   "Time since quit smoking (in years)";
label variable cigsda1  "Number cigs per day (daily smokers)";
label variable cigdamo  "Number days smoked in past 30 days";
label variable cigsda2  "Number cigs per day (some day smokers)";
label variable cigsday  "Number of cigarettes a day (all current smokers)";
label variable cigqtyr  "Tried quit smoking 1+ days, past 12 m";
label variable othcigev "Ever smoked tobacco products, OTHER than cigarettes";
label variable othciged "
  Smoke freq: everyday/some days/rarely/not at all (other than cigarettes)";
label variable smklesev "Ever used smokeless tobacco products";
label variable smklesed "
  Smokeless tobacco freq: everyday/some days/rarely/not at all";
label variable toblasyr "Using any tobacco product, around this time last year";
label variable tobqtyr  "Tried quit all tobacco products 1+ days, past 12 m";
label variable vigno    "Freq vigorous activity: # of units";
label variable vigtp    "Freq vigorous activity: Time units";
label variable vigfreqw "Freq vigorous activity (times per wk)";
label variable viglngno "Duration vigorous activity: # units";
label variable viglngtp "Duration vigorous activity: Time unit";
label variable vigmin   "Duration vigorous activity (in minutes)";
label variable modno    "Freq moderate activity: # of units";
label variable modtp    "Freq moderate activity: Time units";
label variable modfreqw "Freq light/moderate activity (times per wk)";
label variable modlngno "Duration moderate activity: # of units";
label variable modlngtp "Duration moderate activity: Time unit";
label variable modmin   "Duration light/moderate activity (in minutes)";
label variable strngno  "Strength activity freq: # of units";
label variable strngtp  "Strength activity freq: Time units";
label variable strfreqw "Freq strength activity (times per wk)";
label variable alc1yr   "Ever had 12+ drinks in any  one year";
label variable alclife  "Had 12+ drinks in ENTIRE LIFE";
label variable alc12mno "Freq drank alcohol pst yr:  # of units";
label variable alc12mtp "Freq drank alcohol pst yr:  Time unit";
label variable alc12mwk "Freq drank alcohol: Days per week";
label variable alc12myr "Freq drank alcohol: Days in past year";
label variable alcamt   "Average # drinks on days drank";
label variable alcstat  "Alcohol drinking status: Recode";
label variable alc5upno "Days 5+ drinks, past yr: # days";
label variable alc5uptp "Days 5+ drinks, past yr: Time unit";
label variable alc5upyr "Number of days had 5+ drinks past year";
label variable aheight  "Total height in inches";
label variable aweightp "Weight without shoes (pounds)";
label variable bmi      "Body Mass Index (BMI)";

label variable ausualpl "Place USUALLY go when sick";
label variable aplkind  "Place to go when sick (most often)";
label variable ahcplrou "USUALLY go there for routine/preventive care";
label variable ahcplknd "Place USUALLY go for routine/preventive care";
label variable ahcchgyr "Change health care place, past 12 m";
label variable ahcchghi "Change related to health insurance";
label variable anouspl1 "Doesn't need doctor/haven't had problems";
label variable anouspl2 "Doesn't like/trust/believe in doctors";
label variable anouspl3 "Doesn't know where to go";
label variable anouspl4 "Previous doctor is not available/moved";
label variable anouspl5 "Too expensive/no insurance/cost";
label variable anouspl6 "Speak a different language";
label variable anouspl7 "No care available/too far away/not convenient";
label variable anouspl8 "Put if off/didn't get around to it";
label variable anouspl9 "Other reason no usual place of care";
label variable aprvtryr "Trouble finding a doctor/provider, past 12 m";
label variable aprvtrfd "Able to find doctor/provider, past 12 m";
label variable adrnanp  "
  Doctor's office not accept you as new patient, past 12 m";
label variable adrnai   "
  Doctor's office not accept your health insurance, past 12 m";
label variable ahcdlyr1 "Couldn't get through on phone, past 12 m";
label variable ahcdlyr2 "Couldn't get appointment soon enough, past 12 m";
label variable ahcdlyr3 "Wait too long in doctor's office, past 12 m";
label variable ahcdlyr4 "Not open when you could go, past 12 m";
label variable ahcdlyr5 "No transportation, past 12 m";
label variable ahcafyr1 "Couldn't afford prescription medicine, past 12 m";
label variable ahcafyr2 "
  Couldn't afford mental health care/counseling, past 12 m";
label variable ahcafyr3 "Couldn't afford dental care, past 12 m";
label variable ahcafyr4 "Couldn't afford eyeglasses, past 12 m";
label variable ahcafyr5 "Couldn't afford to see a specialist, past 12 m";
label variable ahcafyr6 "Couldn't afford follow-up care, past 12 m";
label variable aworpay  "
  Get sick or have accident, worried about paying medical bills";
label variable ahicomp  "Health insurance coverage compared to a year ago";
label variable arx12mo  "
  Prescribed medication by doctor/health professional, past 12 m";
label variable arx12_1  "Skipped medication doses to save money, past 12 m";
label variable arx12_2  "Took less medicine to save money, past 12 m";
label variable arx12_3  "Delayed filling a prescription to save money, past 12 m
  ";
label variable arx12_4  "
  Asked doctor for lower cost medication to save money, past 12 m";
label variable arx12_5  "
  Bought prescription drugs from another country to save money, past 12 m";
label variable arx12_6  "Used alternative therapies to save money, past 12 m";
label variable adnlong2 "Time since last saw a dentist";
label variable ahcsyr1  "Seen/talked to mental health professional, past 12 m";
label variable ahcsyr2  "Seen/talked to eye doctor, past 12 m";
label variable ahcsyr3  "Seen/talked to foot doctor, past 12 m";
label variable ahcsyr4  "Seen/talked to a chiropractor, past 12 m";
label variable ahcsyr5  "Seen/talked to therapist (PT/OT/etc.), past 12 m";
label variable ahcsyr6  "Seen/talked to a NP/PA/midwife, past 12 m";
label variable ahcsyr7  "Seen/talked to OB/GYN, past 12 m";
label variable ahcsyr8  "Seen/talked to a medical specialist, past 12 m";
label variable ahcsyr9  "Seen/talked to a general doctor, past 12 m";
label variable ahcsyr10 "Doctor treats both kids and adults";
label variable ahernoy2 "# times in ER/ED, past 12 m";
label variable aervisnd "ER visit at night or on weekend";
label variable aerhos   "ER visit resulted in hospital admission";
label variable aerrea1r "ER visit because didn't have another place to go";
label variable aerrea2r "ER visit because doctors office or clinic was not open
  ";
label variable aerrea3r "ER visit because advised by health provider to go";
label variable aerrea4r "
  ER visit because problem too serious for doctor's office/clinic";
label variable aerrea5r "ER visit because only hospital could help";
label variable aerrea6r "ER visit because it is closest provider";
label variable aerrea7r "ER visit because it is usual place to get care";
label variable aerrea8r "Arrived at ER by ambulance/other emergency vehicle";
label variable ahchyr   "Received home care from health professional, past 12 m
  ";
label variable ahchmoyr "# months of home care, past 12 m";
label variable ahchnoy2 "Total number of home visits";
label variable ahcnoyr2 "Total number of office visits, past 12 m";
label variable asrgyr   "Surgery/surgical procedure, past 12 m";
label variable asrgnoyr "# of surgeries, past 12 m";
label variable amdlongr "Time since last seen/talked to health professional";
label variable avislast "Place of last medical visit";
label variable alastyp1 "General doctor seen on last visit";
label variable alastyp2 "Specialist seen on last visit";
label variable alastyp3 "
  Nurse practitioner/physician assistant seen on last visit";
label variable alastyp4 "Other health provider seen on last visit";
label variable alastvrb "Other Health professional seen (categorized verbatim)";
label variable avisapn2 "Appointment wait time-number";
label variable avisapt2 "Appointment wait time-time period";
label variable awaitrmn "Time in waiting room-number";
label variable awaitrmt "Time in waiting room-time period";
label variable hit1a    "Looked up health information on Internet, past 12 m";
label variable hit2a    "Filled a prescription on Internet, past 12 m";
label variable hit3a    "Scheduled medical appointment on Internet, past 12 m";
label variable hit4a    "
  Communicated with health care provider by email, past 12 m";
label variable hit5a    "
  Used chat groups to learn about health topics, past 12 m";
label variable shtflu2  "Flu shot past 12 m";
label variable ashflum2 "Month of most recent flu shot";
label variable ashfluy2 "Year of most recent flu shot";
label variable flushpg1 "
  Flu shot before/during your current pregnancy, interviewed Jan-Mar or Aug-Dec, 2
  013";
label variable flushpg2 "Flu shot before/during/after a pregnancy";
label variable sprflu2  "Flu nasal spray past 12 m";
label variable aspflum2 "Month of most recent flu nasal spray";
label variable aspfluy2 "Year of most recent flu nasal spray";
label variable shtpnuyr "Pneumonia shot (EVER)";
label variable apox     "Ever had chickenpox";
label variable apox12mo "Chickenpox, past 12 m";
label variable ahep     "Ever had hepatitis";
label variable ahepliv  "Ever lived w/ someone w/ hepatitis";
label variable ahepbtst "Ever had a blood test for hepatitis B";
label variable shthepb  "Hepatitis B vaccine (EVER)";
label variable shepdos  "# doses of hepatitis B vaccine received";
label variable shthepa  "Hepatitis A vaccine (EVER)";
label variable shepanum "# shots of hepatitis A vaccine received";
label variable ahepctst "Ever had a blood test for hepatitis C";
label variable ahepcres "Main reason tested for Hepatitis C";
label variable shingles "Ever had the Zoster or Shingles vaccine";
label variable shttd    "Tetanus shot in the past 10 years";
label variable shttd05  "Tetanus shot given in 2005 or later";
label variable shttdap2 "Vaccine included pertussis/whooping cough";
label variable shthpv2  "Ever received HPV shot/vaccine";
label variable shhpvdos "Number of HPV shots received";
label variable ahpvage  "Age at first HPV shot";
label variable livev    "
  Ever told you had any kind of chronic/long-term liver condition";
label variable travel   "
  Ever traveled outside USA since 1995 (Excluding Europe, Japan, Australia, New Ze
  aland, and Canada)";
label variable wrkhlth2 "Work or volunteer in a health care setting";
label variable wrkdir   "Direct contact with patients";
label variable apsbpchk "
  Blood pressure checked by doctor/nurse/health professional, past 12 m";
label variable apschchk "
  Cholesterol checked by doctor/nurse/health professional, past 12 m";
label variable apsbschk "Fasting test for high blood sugar/diabetes, past 12 m";
label variable apspap   "Pap smear/test, past 12 m";
label variable apsmam   "Mammogram, past 12 m";
label variable apscol   "Test for colon cancer, past 12 m";
label variable apsdiet  "
  Doctor/health professional talked to you about diet, past 12 m";
label variable apssmkc  "
  Doctor/health professional talked to you about smoking, past 12 m";
label variable ltcfam   "Have family member who needed ADL help for 1+ yrs";
label variable ltchelp  "How likely you will need ADL help";
label variable ltcwho1  "Family would provide ADL help";
label variable ltcwho2  "Hire someone to provide ADL help";
label variable ltcwho3  "Home health care organization would provide ADL help";
label variable ltcwho4  "Nursing home/assisted living would provide ADL help";
label variable ltcwho5  "Other would provide ADL help";
label variable aindins  "Tried to purchase health insurance directly, past 3 yrs
  ";
label variable aindprch "Purchased health insurance directly, past 3 yrs";
label variable aindwho  "For whom was health insurance purchased, past 3 yrs";
label variable ainddif1 "
  How difficult to find health insurance for coverage needed, past 3 yrs";
label variable ainddif2 "
  How difficult to find affordable health insurance, past 3 yrs";
label variable aindeny1 "Turned down for coverage, past 3 yrs";
label variable aindeny2 "
  Charged higher price for coverage because of health, past 3 yrs";
label variable aindeny3 "
  Specific health problem excluded from coverage, past 3 yrs";
label variable aindnot1 "Didn’t buy plan because turned down, past 3 yrs";
label variable aindnot2 "Didn’t buy plan because of cost, past 3 yrs";
label variable aindnot3 "
  Didn’t buy plan because of pre-existing condition, past 3 yrs";
label variable aindnot4 "
  Didn’t buy plan because got health insurance from other source, past 3 yrs";
label variable aindnot5 "Other reason didn't buy plan, past 3 yrs";
label variable aexchng  "
  Looked into purchasing health insurance coverage through the Health Insurance Ma
  rketplace";

label variable snonce   "Used indoor tanning device during past 12 months";
label variable snnum1   "
  Number of times used tanning device during past 12 months";
label variable paphad1  "Ever had Pap smear/Pap test";
label variable rpap1_m1 "Month of most recent Pap test";
label variable rpap1_y1 "Year of most recent Pap test";
label variable rpap1n1  "Time ago date of most recent Pap test: # of units";
label variable rpap1t1  "Time ago date of most recent Pap test: Time unit";
label variable rpap21   "Most recent Pap test, time categories";
label variable rpap3a1  "
  Most recent Pap test, time categories (using 2005 method)";
label variable rpap3b1  "
  Most recent Pap test, time categories (using 2000 method)";
label variable paprea1  "Main reason for most recent Pap test";
label variable mdrecp1  "Doctor recommended Pap test";
label variable papwhen  "When next Pap smear/test will be done";
label variable hyst     "Ever had a hysterectomy";
label variable mamhad   "Ever had a mammogram";
label variable rmam1_mt "Month of most recent mammogram";
label variable rmam1_yr "Year of most recent mammogram";
label variable rmam1n   "Time ago date of most recent mammogram: # of units";
label variable rmam1t   "Time ago date of most recent mammogram: Time unit";
label variable rmam2    "Most recent mammogram, time categories";
label variable rmam3a   "
  Most recent mammogram, time categories (using 2005 method)";
label variable rmam3b   "
  Most recent mammogram, time categories (using 2000 method)";
label variable mamreas  "Main reason for most recent mammogram";
label variable mdrecmam "Doctor recommended mammogram";
label variable psarec   "Doctor recommended a PSA test";
label variable psahad   "Ever had a PSA test";
label variable rpsa1_mt "Month of most recent PSA test";
label variable rpsa1_yr "Year of most recent PSA test";
label variable rpsa1n   "Time ago date of most recent PSA test: # of units";
label variable rpsa1t   "Time ago date of most recent PSA test: Time unit";
label variable rpsa2    "Most recent PSA test, time categories";
label variable rpsa3a   "
  Most recent PSA test, time categories (using 2005 method)";
label variable rpsa3b   "
  Most recent PSA test, time categories (using 2000 method)";
label variable psareas  "Main reason for most recent PSA test";
label variable colhad   "Ever had a colonoscopy";
label variable col_mt   "Month of most recent colonoscopy";
label variable col_yr   "Year of most recent colonoscopy";
label variable coln     "Time ago date of most recent colonoscopy: # of units";
label variable colt     "Time ago date of most recent colonoscopy: Time unit";
label variable col2     "Most recent colonoscopy, time categories";
label variable col3a    "
  Most recent colonoscopy, time categories (using 2005 method)";
label variable col3b    "
  Most recent colonoscopy, time categories (using 2000 method)";
label variable colreas  "Main reason for most recent colonoscopy";
label variable sighad   "Ever had a Sigmoidoscopy";
label variable sig_mt   "Month of most recent Sigmoidoscopy";
label variable sig_yr   "Year of most recent Sigmoidoscopy";
label variable sign     "Time ago date of most recent Sigmoidoscopy: # of units
  ";

label variable sigt     "Time ago date of most recent Sigmoidoscopy: Time unit";
label variable sig2     "Most recent Sigmoidoscopy, time categories";
label variable sig3a    "
  Most recent Sigmoidoscopy, time categories (using 2005 method)";
label variable sig3b    "
  Most recent Sigmoidoscopy, time categories (using 2000 method)";
label variable sigreas  "Main reason for most recent Sigmoidoscopy";
label variable hfobhad  "Had blood stool test using home test kit";
label variable rhfo1_mt "Month of most recent home blood stool test";
label variable rhfo1_yr "Year of most recent home blood stool test";
label variable rhfo1n   "
  Time ago date of most recent home blood stool test: # of units";
label variable rhfo1t   "
  Time ago date of most recent home blood stool test: Time unit";
label variable rhfo2    "Most recent home blood stool test, time categories";
label variable rhfob3a  "
  Most recent home blood stool test, time categories (using 2005 method)";
label variable rhfob3b  "
  Most recent home blood stool test, time categories (using 2000 method)";
label variable hfobrea1 "Main reason for most recent home blood stool test";
label variable colprob1 "
  Doctor recommended you be tested for colon/rectum problems, past 12 months";

label variable asicpuse "How often do you use a computer";
label variable asisathc "How satisfied with health care, past 12 mo";
label variable asitenur "Length of time living in neighborhood";
label variable asinhelp "Agree/disagree…people in neighborhood help each other";
label variable asincnto "Agree/disagree…people I count on in neighborhood";
label variable asintru  "Agree/disagree…people in neighborhood can be trusted";
label variable asinknt  "Agree/disagree…close-knit neighborhood";
label variable asisim   "How you think of yourself (sexual orientation; male)";
label variable asisif   "
  How do you think of yourself (Sexual orientation; female)";
label variable asiretr  "How worried are you about…money for retirement";
label variable asimedc  "
  How worried are you about…medical costs of illness/accident";
label variable asistlv  "
  How worried are you about…maintaining standard of living";
label variable asicnhc  "How worried are you about…medical costs of healthcare";
label variable asiccoll "How worried are you about…paying for children's college
  ";
label variable asinbill "How worried are you about…paying monthly bills";
label variable asihcst  "
  How worried are you about…paying rent/mortgage/housing costs";
label variable asiccmp  "How worried are you about…credit card payments";
label variable asisleep "Hours of sleep";
label variable asislpfl "# times having trouble falling asleep, past week";
label variable asislpst "# times having trouble staying asleep, past week";
label variable asislpmd "# times taking medication for sleep, past week";
label variable asirest  "Days woke up feeling rested, past week";
label variable asisad   "So sad nothing cheers you up, past 30 days";
label variable asinerv  "How often felt nervous, past 30 days";
label variable asirstls "How often restless/fidgety, past 30 days";
label variable asihopls "How often felt hopeless, past 30 days";
label variable asieffrt "How often felt everything was an effort, past 30 days";
label variable asiwthls "How often felt worthless, past 30 days";
label variable asimuch  "Feelings interfered w/ life, past 30 days";
label variable asihivt  "Ever been tested for HIV";
label variable asihivwn "Main reason not tested for HIV";

label variable awebuse  "Internet use";
label variable awebofno "Frequency internet use: # of units";
label variable aweboftp "Frequency internet use: Time units";
label variable awebeml  "Email use";
label variable awebmno  "Frequency email use: # of units";
label variable awebmtp  "Frequency email use: Time units";

* DEFINE VALUE LABELS FOR REPORTS;

label define sap001x
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
label define sap004x
  1        "1 Quarter 1"
  2        "2 Quarter 2"
  3        "3 Quarter 3"
  4        "4 Quarter 4"
  ;
label define sap005x
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
  1        "1 Started Sample Adult Core 2+ weeks after the initial interview"
  2        "
  2 Started Sample Adult Core less than 2 weeks after the initial interview"
  ;
label define sap024x
  1        "1 Families selected to receive AFD (sample adults) section"
  2        "
  2 Families selected to receive FDB (all persons 1 year and older) section"
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
  07       "07 Have job or contract and off-season"
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
label define sap061x
  000      "000 None"
  996      "996 Unable to do this activity"
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don't know"
  ;
label define sap063x
  1        "1 Inhaler or disk"
  2        "2 Nebulizer"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap065x
  1        "1 Every day or almost every day"
  2        "2 Less often"
  3        "3 Never"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap071x
  1        "1 Yes"
  2        "2 No"
  3        "3 Was told no changes needed"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap072x
  000      "000 None"
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don’t know"
  ;
label define sap073x
  1        "1 Yes"
  2        "2 No"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define sap079x
  1        "1 Mentioned"
  2        "2 Not mentioned"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap110x
  85       "85 85+ years"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap140x
  1        "1 Yes"
  2        "2 No"
  3        "3 Borderline"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap143x
  00       "00 Within past year"
  85       "85 85+ years"
  96       "96 1+ year(s) with diabetes and age is 85+"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap148x
  0        "0 None"
  1        "1 One"
  2        "2 Two or three"
  3        "3 Between four and ten"
  4        "4 More than 10"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap150x
  1        "1 Not at all"
  2        "2 Slightly"
  3        "3 Moderately"
  4        "4 Quite a bit"
  5        "5 Extremely"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap189x
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
label define sap200x
  000      "000 None"
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don't know"
  ;
label define sap202x
  1        "1 Better"
  2        "2 Worse"
  3        "3 About the same"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap204x
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
label define sap216x
  1        "1 Limited in any way"
  2        "2 Not limited in any way"
  3        "3 Unknown if limited"
  ;
label define sap253x
  95       "95 95+"
  96       "96 Since birth"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap254x
  1        "1 Day(s)"
  2        "2 Week(s)"
  3        "3 Month(s)"
  4        "4 Year(s)"
  6        "6 Since birth"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap255x
  00       "00 Less than 1 year"
  85       "85 85+ years"
  96       "96 Unknown number of years"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap256x
  1        "1 Less than 3 months"
  2        "2 3-5 months"
  3        "3 6-12 months"
  4        "4 More than 1 year"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap257x
  1        "1 Chronic"
  2        "2 Not chronic"
  9        "9 Unknown if chronic"
  ;
label define sap433x
  1        "1 At least one condition causing functional limitation is chronic"
  2        "2 No condition causing functional limitation"
  9        "9 Unknown if any condition causing functional limitation is chronic
  "
  ;
label define sap434x
  0        "0 Not limited in any way (including unknown if limited)"
  1        "1 Limited; caused by at least one chronic condition"
  2        "2 Limited; not caused by chronic condition"
  3        "3 Limited; unknown if condition is chronic"
  ;
label define sap436x
  85       "85 85 years or older"
  96       "96 Never smoked regularly"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap437x
  1        "1 Every day"
  2        "2 Some days"
  3        "3 Not at all"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap438x
  1        "1 Current every day smoker"
  2        "2 Current some day smoker"
  3        "3 Former smoker"
  4        "4 Never smoker"
  5        "5 Smoker, current status unknown"
  9        "9 Unknown if ever smoked"
  ;
label define sap439x
  95       "95 95+"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap440x
  1        "1 Day(s)"
  2        "2 Week(s)"
  3        "3 Month(s)"
  4        "4 Year(s)"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap441x
  00       "00 Less than 1 year"
  70       "70 70+ years"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap442x
  95       "95 95+ cigarettes"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap443x
  00       "00 None"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap448x
  1        "1 Every day"
  2        "2 Some days"
  3        "3 Rarely"
  4        "4 Not at all"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap453x
  000      "000 Never"
  996      "996 Unable to do this type activity"
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don't know"
  ;
label define sap454x
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
label define sap455x
  00       "00 Less than once per week"
  95       "95 Never"
  96       "96 Unable to do vigorous activity"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap456x
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don't know"
  ;
label define sap457x
  1        "1 Minutes"
  2        "2 Hours"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap461x
  00       "00 Less than once per week"
  95       "95 Never"
  96       "96 Unable to do light or moderate activity"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap467x
  00       "00 Less than once per week"
  95       "95 Never"
  96       "96 Unable to do strength activity"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap470x
  000      "000 Never"
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don't know"
  ;
label define sap471x
  0        "0 Never/None"
  1        "1 Week"
  2        "2 Month"
  3        "3 Year"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap472x
  00       "00 Less than one day per week"
  95       "95 Did not drink in past year"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap473x
  000      "000 Never/none"
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don't know"
  ;
label define sap474x
  95       "95 95+ drinks"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap475x
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
label define sap477x
  0        "0 Never/None"
  1        "1 Per week"
  2        "2 Per month"
  3        "3 Per year"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap479x
  96       "96 Not available"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap480x
  996      "996 Not available"
  997      "997 Refused"
  998      "998 Not ascertained"
  999      "999 Don't know"
  ;
label define sap482x
  1        "1 Yes"
  2        "2 There is NO place"
  3        "3 There is MORE THAN ONE place"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap483x
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
label define sap485x
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
label define sap488x
  1        "1 Mentioned"
  2        "2 Not mentioned"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define sap500x
  1        "1 Yes"
  2        "2 No"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t' know"
  ;
label define sap512x
  1        "1 Very worried"
  2        "2 Somewhat worried"
  3        "3 Not at all worried"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap521x
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
label define sap532x
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
label define sap544x
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap545x
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
label define sap548x
  95       "95 95+ times"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap550x
  1        "1 Clinic or health center"
  2        "2 Doctor's office or HMO"
  3        "3 Hospital emergency room"
  4        "4 Hospital outpatient department"
  5        "5 Urgent care center"
  6        "6 Some other place"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap556x
  00       "00 Same day/walk-in appt/no appt made"
  96       "
  96 Routine appt/appt arranged on previous visit/rec'd appt reminder card"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap557x
  1        "1 Days"
  2        "2 Weeks"
  3        "3 Months"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define sap558x
  00       "00 No time"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don’t know"
  ;
label define sap559x
  1        "1 Minutes"
  2        "2 Hours"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define sap566x
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
label define sap567x
  9997     "9997 Refused"
  9998     "9998 Not ascertained"
  9999     "9999 Don't know"
  ;
label define sap568x
  1        "1 Before this pregnancy"
  2        "2 During this pregnancy"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap569x
  1        "1 Before this pregnancy"
  2        "2 During this pregnancy"
  3        "3 After this pregnancy"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap580x
  1        "1 Received at least 3 doses"
  2        "2 Received less than 3 doses"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap582x
  96       "96 Received all shots"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap584x
  1        "
  1 You or your doctor thought you were at risk of having hepatitis C because a bl
  ood test or symptoms like fatigue, nausea, stomach pain, yel"
  2        "2 You were born from 1945 through 1965"
  3        "
  3 You were at risk of hepatitis C infection due to exposure to blood on your job
  , injection drug use or receipt of transfusion before 1992"
  4        "4 Some other reason"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define sap588x
  1        "1 Yes-included pertussis"
  2        "2 No-did not include pertussis"
  3        "3 Doctor did not say"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap589x
  1        "1 Yes"
  2        "2 No"
  3        "3 Doctor refused when asked"
  7        "7 Refused"
  8        "8 Not Ascertained"
  9        "9 Don't know"
  ;
label define sap590x
  50       "50 50+"
  96       "96 All shots"
  97       "97 Refused"
  98       "98 Not Ascertained"
  99       "99 Don't know"
  ;
label define sap605x
  1        "1 Very likely"
  2        "2 Somewhat likely"
  3        "3 Somewhat unlikely"
  4        "4 Very unlikely"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap613x
  1        "1 Self"
  2        "2 Someone else in family"
  3        "3 Both"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define sap614x
  1        "1 Very difficult"
  2        "2 Somewhat difficult"
  3        "3 Not at all difficult"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don’t know"
  ;
label define sap615x
  1        "1 Very difficult"
  2        "2 Somewhat difficult"
  3        "3 Not at all difficult"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap628x
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
label define sap629x
  9996     "9996 Time period format"
  9997     "9997 Refused"
  9998     "9998 Not ascertained"
  9999     "9999 Don't know"
  ;
label define sap631x
  1        "1 Days ago"
  2        "2 Weeks ago"
  3        "3 Months ago"
  4        "4 Years ago"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap632x
  1        "1 A year ago or less"
  2        "2 More than 1 year but not more than 2 years"
  3        "3 More than 2 years but not more than 3 years"
  4        "4 More than 3 years but not more than 5 years"
  5        "5 Over 5 years ago"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap633x
  1        "1 A year ago or less"
  2        "2 More than 1 year but not more than 2 years"
  3        "3 More than 2 years but not more than 3 years"
  4        "4 More than 3 years but not more than 5 years"
  5        "5 Over 5 years"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap635x
  1        "1 Part of a routine exam"
  2        "2 Because of a problem"
  3        "3 Other reason"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap636x
  1        "1 Yes"
  2        "2 No"
  3        "3 Did not see a doctor in the past 12 months"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap637x
  01       "01 A year or less from now"
  02       "02 More than 1 year to 3 years from now"
  03       "03 More than 3 years to 5 years from now"
  04       "04 More than 5 years from now"
  05       "05 When doctor recommends it"
  06       "06 Never, had HPV DNA test"
  07       "07 Never, had HPV vaccine"
  08       "08 Never, other reason"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap664x
  1        "1 A year ago or less"
  2        "2 More than 1 year but not more than 2 years"
  3        "3 More than 2 years but not more than 3 years"
  4        "4 More than 3 years but not more than 5 years"
  5        "5 More than 5 years but not more than 10 years"
  6        "6 Over 10 years ago"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap667x
  1        "1 Part of a routine exam"
  2        "2 Because of a problem"
  3        "3 Follow-up test of an earlier test or screening exam"
  4        "4 Other reason"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap687x
  1        "1 Never or almost never"
  2        "2 Some days"
  3        "3 Most days"
  4        "4 Every day"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap688x
  1        "1 Very satisfied"
  2        "2 Somewhat satisfied"
  3        "3 Somewhat dissatisfied"
  4        "4 Very dissatisfied"
  5        "5 You haven't had health care in the past 12 months"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap689x
  1        "1 Less than 1 year"
  2        "2 1-3 years"
  3        "3 4-10 years"
  4        "4 11-20 years"
  5        "5 More than 20 years"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap690x
  1        "1 Definitely agree"
  2        "2 Somewhat agree"
  3        "3 Somewhat disagree"
  4        "4 Definitely disagree"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap694x
  1        "1 Gay"
  2        "2 Straight, that is, not gay"
  3        "3 Bisexual"
  4        "4 Something else"
  5        "5 I don't know the answer"
  7        "7 Refused"
  8        "8 Not ascertained"
  ;
label define sap695x
  1        "1 Lesbian or gay"
  2        "2 Straight, that is, not lesbian or gay"
  3        "3 Bisexual"
  4        "4 Something else"
  5        "5 I don't know the answer"
  7        "7 Refused"
  8        "8 Not ascertained"
  ;
label define sap696x
  1        "1 Very worried"
  2        "2 Moderately worried"
  3        "3 Not too worried"
  4        "4 Not worried at all"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap700x
  1        "1 Very worried"
  2        "2 Moderately worried"
  3        "3 Not too worried"
  4        "4 Not worried at all"
  5        "5 This does not apply to me"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap703x
  1        "1 Very worried"
  2        "2 Moderately worried"
  3        "3 Not too worried"
  4        "4 Not worried at all"
  5        "5 I don't have credit cards"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap705x
  00       "00 Did not have trouble falling asleep in the past week"
  07       "07 7 or more times"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap706x
  00       "00 Did not have trouble staying asleep in the past week"
  07       "07 7 or more times"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap707x
  00       "00 Did not take medication to help sleep in the past week"
  07       "07 7 or more times"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap708x
  00       "00 Never felt rested in the past week"
  97       "97 Refused"
  98       "98 Not ascertained"
  99       "99 Don't know"
  ;
label define sap709x
  1        "1 ALL of the time"
  2        "2 MOST of the time"
  3        "3 SOME of the time"
  4        "4 A LITTLE of the time"
  5        "5 NONE of the time"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap715x
  1        "1 A lot"
  2        "2 Some"
  3        "3 A little"
  4        "4 Not at all"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;
label define sap717x
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
label define sap720x
  1        "1 Per day"
  2        "2 Per week"
  3        "3 Per month"
  4        "4 Per year"
  7        "7 Refused"
  8        "8 Not ascertained"
  9        "9 Don't know"
  ;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   sap001x;   label values intv_qrt  sap004x;
label values intv_mon  sap005x;

label values region    sap010x;

label values sex       sap013x;   label values hispan_i  sap014x;
label values racerpi2  sap015x;   label values mracrpi2  sap016x;
label values mracbpi2  sap017x;   label values age_p     sap018x;

label values r_maritl  sap019x;

label values proxysa   sap020x;   label values prox1     sap021x;
label values prox2     sap022x;   label values lateinta  sap023x;

label values fdrn_flg  sap024x;

label values doinglwa  sap025x;   label values whynowka  sap026x;
label values everwrk   sap027x;   label values wrkcata   sap032x;
label values businc1a  sap027x;   label values locall1a  sap034x;
label values yrswrkpa  sap035x;   label values wrklongh  sap027x;
label values hourpda   sap027x;   label values pdsicka   sap027x;
label values onejob    sap027x;   label values wrklyr4   sap040x;

label values hypev     sap027x;   label values hypdifv   sap027x;
label values hypyr1    sap027x;   label values chlyr1    sap027x;
label values chdev     sap027x;   label values angev     sap027x;
label values miev      sap027x;   label values hrtev     sap027x;
label values strev     sap027x;   label values ephev     sap027x;
label values copdev    sap027x;   label values aspmedev  sap027x;
label values aspmedad  sap027x;   label values aspmdmed  sap027x;
label values asponown  sap027x;   label values aasmev    sap027x;
label values aasstill  sap027x;   label values aasmyr    sap027x;
label values aaseryr1  sap027x;   label values aasmhsp1  sap027x;
label values awzmswk1  sap061x;   label values aasmmed1  sap027x;
label values aasmtyp   sap063x;   label values aasmcan1  sap027x;
label values aasmdtp2  sap065x;   label values aaswmp1   sap027x;
label values aasclass  sap027x;   label values aas_rec   sap027x;
label values aas_res   sap027x;   label values aas_mon   sap027x;
label values aapenvln  sap071x;   label values aaroutin  sap072x;
label values aasympt   sap073x;   label values aarescue  sap073x;
label values aaactlim  sap073x;   label values ulcev     sap027x;
label values ulcyr     sap027x;   label values canev     sap027x;
label values cnkind1   sap079x;   label values cnkind2   sap079x;
label values cnkind3   sap079x;   label values cnkind4   sap079x;
label values cnkind5   sap079x;   label values cnkind6   sap079x;
label values cnkind7   sap079x;   label values cnkind8   sap079x;
label values cnkind9   sap079x;   label values cnkind10  sap079x;
label values cnkind11  sap079x;   label values cnkind12  sap079x;
label values cnkind13  sap079x;   label values cnkind14  sap079x;
label values cnkind15  sap079x;   label values cnkind16  sap079x;
label values cnkind17  sap079x;   label values cnkind18  sap079x;
label values cnkind19  sap079x;   label values cnkind20  sap079x;
label values cnkind21  sap079x;   label values cnkind22  sap079x;
label values cnkind23  sap079x;   label values cnkind24  sap079x;
label values cnkind25  sap079x;   label values cnkind26  sap079x;
label values cnkind27  sap079x;   label values cnkind28  sap079x;
label values cnkind29  sap079x;   label values cnkind30  sap079x;
label values cnkind31  sap079x;   label values canage1   sap110x;
label values canage2   sap110x;   label values canage3   sap110x;
label values canage4   sap110x;   label values canage5   sap110x;
label values canage6   sap110x;   label values canage7   sap110x;
label values canage8   sap110x;   label values canage9   sap110x;
label values canage10  sap110x;   label values canage11  sap110x;
label values canage12  sap110x;   label values canage13  sap110x;
label values canage14  sap110x;   label values canage15  sap110x;
label values canage16  sap110x;   label values canage17  sap110x;
label values canage18  sap110x;   label values canage19  sap110x;
label values canage20  sap110x;   label values canage21  sap110x;
label values canage22  sap110x;   label values canage23  sap110x;
label values canage24  sap110x;   label values canage25  sap110x;
label values canage26  sap110x;   label values canage27  sap110x;
label values canage28  sap110x;   label values canage29  sap110x;
label values canage30  sap110x;   label values dibev     sap140x;
label values dibpre1   sap027x;   label values dibage    sap110x;
label values difage2   sap143x;   label values insln     sap027x;
label values dibpill   sap027x;   label values epilep1   sap027x;
label values epilep2   sap027x;   label values epilep3   sap148x;
label values epilep4   sap027x;   label values epilep5   sap150x;
label values ahayfyr   sap027x;   label values sinyr     sap027x;
label values cbrchyr   sap027x;   label values kidwkyr   sap027x;
label values livyr     sap027x;   label values jntsymp   sap027x;
label values jmthp1    sap079x;   label values jmthp2    sap079x;
label values jmthp3    sap079x;   label values jmthp4    sap079x;
label values jmthp5    sap079x;   label values jmthp6    sap079x;
label values jmthp7    sap079x;   label values jmthp8    sap079x;
label values jmthp9    sap079x;   label values jmthp10   sap079x;
label values jmthp11   sap079x;   label values jmthp12   sap079x;
label values jmthp13   sap079x;   label values jmthp14   sap079x;
label values jmthp15   sap079x;   label values jmthp16   sap079x;
label values jmthp17   sap079x;   label values jntchr    sap027x;
label values jnthp     sap027x;   label values arth1     sap027x;
label values arthlmt   sap027x;   label values paineck   sap027x;
label values painlb    sap027x;   label values painleg   sap027x;
label values painface  sap027x;   label values amigr     sap027x;
label values acold2w   sap027x;   label values aintil2w  sap027x;
label values pregnow   sap027x;   label values pregflyr  sap027x;
label values hraidnow  sap027x;   label values hraidev   sap027x;
label values ahearst1  sap189x;   label values avision   sap027x;
label values ablind    sap027x;   label values lupprt    sap027x;

label values aimsupev  sap027x;   label values aimspstl  sap027x;
label values aimspmed  sap027x;   label values aimspchc  sap027x;
label values aimspshc  sap027x;   label values aimspcan  sap027x;
label values aimspcld  sap027x;
label values wkdayr    sap200x;   label values beddayr   sap200x;
label values ahstatyr  sap202x;   label values speceq    sap027x;
label values flwalk    sap204x;   label values flclimb   sap204x;
label values flstand   sap204x;   label values flsit     sap204x;
label values flstoop   sap204x;   label values flreach   sap204x;
label values flgrasp   sap204x;   label values flcarry   sap204x;
label values flpush    sap204x;   label values flshop    sap204x;
label values flsocl    sap204x;   label values flrelax   sap204x;
label values fla1ar    sap216x;   label values aflhca1   sap079x;
label values aflhca2   sap079x;   label values aflhca3   sap079x;
label values aflhca4   sap079x;   label values aflhca5   sap079x;
label values aflhca6   sap079x;   label values aflhca7   sap079x;
label values aflhca8   sap079x;   label values aflhca9   sap079x;
label values aflhca10  sap079x;   label values aflhca11  sap079x;
label values aflhca12  sap079x;   label values aflhca13  sap079x;
label values alhca14a  sap079x;   label values aflhca15  sap079x;
label values aflhca16  sap079x;   label values aflhca17  sap079x;
label values aflhca18  sap079x;   label values aflhc19_  sap079x;
label values aflhc20_  sap079x;   label values aflhc21_  sap079x;
label values aflhc22_  sap079x;   label values aflhc23_  sap079x;
label values aflhc24_  sap079x;   label values aflhc25_  sap079x;
label values aflhc26_  sap079x;   label values aflhc27_  sap079x;
label values aflhc28_  sap079x;   label values aflhc29_  sap079x;
label values aflhc30_  sap079x;   label values aflhc31_  sap079x;
label values aflhc32_  sap079x;   label values aflhc33_  sap079x;
label values aflhc34_  sap079x;   label values aflhca90  sap079x;
label values aflhca91  sap079x;   label values altime1   sap253x;
label values alunit1   sap254x;   label values aldura1   sap255x;
label values aldurb1   sap256x;   label values alchrc1   sap257x;
label values altime2   sap253x;   label values alunit2   sap254x;
label values aldura2   sap255x;   label values aldurb2   sap256x;
label values alchrc2   sap257x;   label values altime3   sap253x;
label values alunit3   sap254x;   label values aldura3   sap255x;
label values aldurb3   sap256x;   label values alchrc3   sap257x;
label values altime4   sap253x;   label values alunit4   sap254x;
label values aldura4   sap255x;   label values aldurb4   sap256x;
label values alchrc4   sap257x;   label values altime5   sap253x;
label values alunit5   sap254x;   label values aldura5   sap255x;
label values aldurb5   sap256x;   label values alchrc5   sap257x;
label values altime6   sap253x;   label values alunit6   sap254x;
label values aldura6   sap255x;   label values aldurb6   sap256x;
label values alchrc6   sap257x;   label values altime7   sap253x;
label values alunit7   sap254x;   label values aldura7   sap255x;
label values aldurb7   sap256x;   label values alchrc7   sap257x;
label values altime8   sap253x;   label values alunit8   sap254x;
label values aldura8   sap255x;   label values aldurb8   sap256x;
label values alchrc8   sap257x;   label values altime9   sap253x;
label values alunit9   sap254x;   label values aldura9   sap255x;
label values aldurb9   sap256x;   label values alchrc9   sap257x;
label values altime10  sap253x;   label values alunit10  sap254x;
label values aldura10  sap255x;   label values aldurb10  sap256x;
label values alchrc10  sap257x;   label values altime11  sap253x;
label values alunit11  sap254x;   label values aldura11  sap255x;
label values aldurb11  sap256x;   label values alchrc11  sap257x;
label values altime12  sap253x;   label values alunit12  sap254x;
label values aldura12  sap255x;   label values aldurb12  sap256x;
label values alchrc12  sap257x;   label values altime13  sap253x;
label values alunit13  sap254x;   label values aldura13  sap255x;
label values aldurb13  sap256x;   label values alchrc13  sap257x;
label values atime14a  sap253x;   label values aunit14a  sap254x;
label values adura14a  sap255x;   label values adurb14a  sap256x;
label values achrc14a  sap257x;   label values altime15  sap253x;
label values alunit15  sap254x;   label values aldura15  sap255x;
label values aldurb15  sap256x;   label values alchrc15  sap257x;
label values altime16  sap253x;   label values alunit16  sap254x;
label values aldura16  sap255x;   label values aldurb16  sap256x;
label values alchrc16  sap257x;   label values altime17  sap253x;
label values alunit17  sap254x;   label values aldura17  sap255x;
label values aldurb17  sap256x;   label values alchrc17  sap257x;
label values altime18  sap253x;   label values alunit18  sap254x;
label values aldura18  sap255x;   label values aldurb18  sap256x;
label values alchrc18  sap257x;   label values altime19  sap253x;
label values alunit19  sap254x;   label values aldura19  sap255x;
label values aldurb19  sap256x;   label values alchrc19  sap257x;
label values altime20  sap253x;   label values alunit20  sap254x;
label values aldura20  sap255x;   label values aldurb20  sap256x;
label values alchrc20  sap257x;   label values altime21  sap253x;
label values alunit21  sap254x;   label values aldura21  sap255x;
label values aldurb21  sap256x;   label values alchrc21  sap257x;
label values altime22  sap253x;   label values alunit22  sap254x;
label values aldura22  sap255x;   label values aldurb22  sap256x;
label values alchrc22  sap257x;   label values altime23  sap253x;
label values alunit23  sap254x;   label values aldura23  sap255x;
label values aldurb23  sap256x;   label values alchrc23  sap257x;
label values altime24  sap253x;   label values alunit24  sap254x;
label values aldura24  sap255x;   label values aldurb24  sap256x;
label values alchrc24  sap257x;   label values altime25  sap253x;
label values alunit25  sap254x;   label values aldura25  sap255x;
label values aldurb25  sap256x;   label values alchrc25  sap257x;
label values altime26  sap253x;   label values alunit26  sap254x;
label values aldura26  sap255x;   label values aldurb26  sap256x;
label values alchrc26  sap257x;   label values altime27  sap253x;
label values alunit27  sap254x;   label values aldura27  sap255x;
label values aldurb27  sap256x;   label values alchrc27  sap257x;
label values altime28  sap253x;   label values alunit28  sap254x;
label values aldura28  sap255x;   label values aldurb28  sap256x;
label values alchrc28  sap257x;   label values altime29  sap253x;
label values alunit29  sap254x;   label values aldura29  sap255x;
label values aldurb29  sap256x;   label values alchrc29  sap257x;
label values altime30  sap253x;   label values alunit30  sap254x;
label values aldura30  sap255x;   label values aldurb30  sap256x;
label values alchrc30  sap257x;   label values altime31  sap253x;
label values alunit31  sap254x;   label values aldura31  sap255x;
label values aldurb31  sap256x;   label values alchrc31  sap257x;
label values altime32  sap253x;   label values alunit32  sap254x;
label values aldura32  sap255x;   label values aldurb32  sap256x;
label values alchrc32  sap257x;   label values altime33  sap253x;
label values alunit33  sap254x;   label values aldura33  sap255x;
label values aldurb33  sap256x;   label values alchrc33  sap257x;
label values altime34  sap253x;   label values alunit34  sap254x;
label values aldura34  sap255x;   label values aldurb34  sap256x;
label values alchrc34  sap257x;   label values altime90  sap253x;
label values alunit90  sap254x;   label values aldura90  sap255x;
label values aldurb90  sap256x;   label values alchrc90  sap257x;
label values altime91  sap253x;   label values alunit91  sap254x;
label values aldura91  sap255x;   label values aldurb91  sap256x;
label values alchrc91  sap257x;   label values alcndrt   sap433x;
label values alchronr  sap434x;

label values smkev     sap027x;   label values smkreg    sap436x;
label values smknow    sap437x;   label values smkstat2  sap438x;
label values smkqtno   sap439x;   label values smkqttp   sap440x;
label values smkqty    sap441x;   label values cigsda1   sap442x;
label values cigdamo   sap443x;   label values cigsda2   sap442x;
label values cigsday   sap442x;   label values cigqtyr   sap027x;
label values othcigev  sap027x;   label values othciged  sap448x;
label values smklesev  sap027x;   label values smklesed  sap448x;
label values toblasyr  sap027x;   label values tobqtyr   sap027x;
label values vigno     sap453x;   label values vigtp     sap454x;
label values vigfreqw  sap455x;   label values viglngno  sap456x;
label values viglngtp  sap457x;   label values vigmin    sap456x;
label values modno     sap453x;   label values modtp     sap454x;
label values modfreqw  sap461x;   label values modlngno  sap456x;
label values modlngtp  sap457x;   label values modmin    sap456x;
label values strngno   sap453x;   label values strngtp   sap454x;
label values strfreqw  sap467x;   label values alc1yr    sap027x;
label values alclife   sap027x;   label values alc12mno  sap470x;
label values alc12mtp  sap471x;   label values alc12mwk  sap472x;
label values alc12myr  sap473x;   label values alcamt    sap474x;
label values alcstat   sap475x;   label values alc5upno  sap473x;
label values alc5uptp  sap477x;   label values alc5upyr  sap473x;
label values aheight   sap479x;   label values aweightp  sap480x;

label values ausualpl  sap482x;   label values aplkind   sap483x;
label values ahcplrou  sap027x;   label values ahcplknd  sap485x;
label values ahcchgyr  sap027x;   label values ahcchghi  sap027x;
label values anouspl1  sap488x;   label values anouspl2  sap488x;
label values anouspl3  sap488x;   label values anouspl4  sap488x;
label values anouspl5  sap488x;   label values anouspl6  sap488x;
label values anouspl7  sap488x;   label values anouspl8  sap488x;
label values anouspl9  sap488x;   label values aprvtryr  sap027x;
label values aprvtrfd  sap073x;   label values adrnanp   sap073x;
label values adrnai    sap500x;   label values ahcdlyr1  sap027x;
label values ahcdlyr2  sap027x;   label values ahcdlyr3  sap027x;
label values ahcdlyr4  sap027x;   label values ahcdlyr5  sap027x;
label values ahcafyr1  sap027x;   label values ahcafyr2  sap027x;
label values ahcafyr3  sap027x;   label values ahcafyr4  sap027x;
label values ahcafyr5  sap073x;   label values ahcafyr6  sap073x;
label values aworpay   sap512x;   label values ahicomp   sap202x;
label values arx12mo   sap027x;   label values arx12_1   sap027x;
label values arx12_2   sap073x;   label values arx12_3   sap027x;
label values arx12_4   sap027x;   label values arx12_5   sap027x;
label values arx12_6   sap027x;   label values adnlong2  sap521x;
label values ahcsyr1   sap027x;   label values ahcsyr2   sap027x;
label values ahcsyr3   sap027x;   label values ahcsyr4   sap027x;
label values ahcsyr5   sap027x;   label values ahcsyr6   sap027x;
label values ahcsyr7   sap027x;   label values ahcsyr8   sap027x;
label values ahcsyr9   sap027x;   label values ahcsyr10  sap027x;
label values ahernoy2  sap532x;   label values aervisnd  sap027x;
label values aerhos    sap027x;   label values aerrea1r  sap027x;
label values aerrea2r  sap027x;   label values aerrea3r  sap027x;
label values aerrea4r  sap027x;   label values aerrea5r  sap027x;
label values aerrea6r  sap027x;   label values aerrea7r  sap073x;
label values aerrea8r  sap073x;   label values ahchyr    sap027x;
label values ahchmoyr  sap544x;   label values ahchnoy2  sap545x;
label values ahcnoyr2  sap532x;   label values asrgyr    sap027x;
label values asrgnoyr  sap548x;   label values amdlongr  sap521x;
label values avislast  sap550x;   label values alastyp1  sap079x;
label values alastyp2  sap079x;   label values alastyp3  sap079x;
label values alastyp4  sap079x;   label values avisapn2  sap556x;
label values avisapt2  sap557x;   label values awaitrmn  sap558x;
label values awaitrmt  sap559x;   label values hit1a     sap073x;
label values hit2a     sap027x;   label values hit3a     sap027x;
label values hit4a     sap073x;   label values hit5a     sap073x;
label values shtflu2   sap027x;   label values ashflum2  sap566x;
label values ashfluy2  sap567x;   label values flushpg1  sap568x;
label values flushpg2  sap569x;   label values sprflu2   sap027x;
label values aspflum2  sap566x;   label values aspfluy2  sap567x;
label values shtpnuyr  sap027x;   label values apox      sap027x;
label values apox12mo  sap027x;   label values ahep      sap027x;
label values ahepliv   sap027x;   label values ahepbtst  sap073x;
label values shthepb   sap027x;   label values shepdos   sap580x;
label values shthepa   sap027x;   label values shepanum  sap582x;
label values ahepctst  sap073x;   label values ahepcres  sap584x;
label values shingles  sap027x;   label values shttd     sap027x;
label values shttd05   sap027x;   label values shttdap2  sap588x;
label values shthpv2   sap589x;   label values shhpvdos  sap590x;
label values ahpvage   sap456x;   label values livev     sap027x;
label values travel    sap027x;   label values wrkhlth2  sap027x;
label values wrkdir    sap027x;   label values apsbpchk  sap027x;
label values apschchk  sap027x;   label values apsbschk  sap027x;
label values apspap    sap027x;   label values apsmam    sap027x;
label values apscol    sap073x;   label values apsdiet   sap027x;
label values apssmkc   sap073x;   label values ltcfam    sap073x;
label values ltchelp   sap605x;   label values ltcwho1   sap488x;
label values ltcwho2   sap488x;   label values ltcwho3   sap488x;
label values ltcwho4   sap488x;   label values ltcwho5   sap488x;
label values aindins   sap073x;   label values aindprch  sap073x;
label values aindwho   sap613x;   label values ainddif1  sap614x;
label values ainddif2  sap615x;   label values aindeny1  sap073x;
label values aindeny2  sap073x;   label values aindeny3  sap073x;
label values aindnot1  sap488x;   label values aindnot2  sap488x;
label values aindnot3  sap488x;   label values aindnot4  sap488x;
label values aindnot5  sap488x;   label values aexchng   sap027x;

label values snonce    sap027x;   label values snnum1    sap456x;
label values paphad1   sap027x;   label values rpap1_m1  sap628x;
label values rpap1_y1  sap629x;   label values rpap1n1   sap439x;
label values rpap1t1   sap631x;   label values rpap21    sap632x;
label values rpap3a1   sap633x;   label values rpap3b1   sap633x;
label values paprea1   sap635x;   label values mdrecp1   sap636x;
label values papwhen   sap637x;   label values hyst      sap027x;
label values mamhad    sap027x;   label values rmam1_mt  sap628x;
label values rmam1_yr  sap629x;   label values rmam1n    sap439x;
label values rmam1t    sap631x;   label values rmam2     sap632x;
label values rmam3a    sap632x;   label values rmam3b    sap632x;
label values mamreas   sap635x;   label values mdrecmam  sap636x;
label values psarec    sap027x;   label values psahad    sap027x;
label values rpsa1_mt  sap628x;   label values rpsa1_yr  sap629x;
label values rpsa1n    sap439x;   label values rpsa1t    sap631x;
label values rpsa2     sap632x;   label values rpsa3a    sap632x;
label values rpsa3b    sap632x;   label values psareas   sap635x;
label values colhad    sap027x;   label values col_mt    sap628x;
label values col_yr    sap629x;   label values coln      sap439x;
label values colt      sap631x;   label values col2      sap664x;
label values col3a     sap664x;   label values col3b     sap664x;
label values colreas   sap667x;   label values sighad    sap027x;
label values sig_mt    sap628x;   label values sig_yr    sap629x;
label values sign      sap439x;   label values sigt      sap631x;
label values sig2      sap664x;   label values sig3a     sap664x;
label values sig3b     sap664x;   label values sigreas   sap667x;
label values hfobhad   sap027x;   label values rhfo1_mt  sap628x;
label values rhfo1_yr  sap629x;   label values rhfo1n    sap439x;
label values rhfo1t    sap631x;   label values rhfo2     sap664x;
label values rhfob3a   sap664x;   label values rhfob3b   sap664x;
label values hfobrea1  sap635x;   label values colprob1  sap027x;

label values asicpuse  sap687x;   label values asisathc  sap688x;
label values asitenur  sap689x;   label values asinhelp  sap690x;
label values asincnto  sap690x;   label values asintru   sap690x;
label values asinknt   sap690x;   label values asisim    sap694x;
label values asisif    sap695x;   label values asiretr   sap696x;
label values asimedc   sap696x;   label values asistlv   sap696x;
label values asicnhc   sap696x;   label values asiccoll  sap700x;
label values asinbill  sap696x;   label values asihcst   sap696x;
label values asiccmp   sap703x;   label values asisleep  sap544x;
label values asislpfl  sap705x;   label values asislpst  sap706x;
label values asislpmd  sap707x;   label values asirest   sap708x;
label values asisad    sap709x;   label values asinerv   sap709x;
label values asirstls  sap709x;   label values asihopls  sap709x;
label values asieffrt  sap709x;   label values asiwthls  sap709x;
label values asimuch   sap715x;   label values asihivt   sap027x;
label values asihivwn  sap717x;

label values awebuse   sap027x;   label values awebofno  sap456x;
label values aweboftp  sap720x;   label values awebeml   sap027x;
label values awebmno   sap456x;   label values awebmtp   sap720x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sa];
save "$OUT/samadult", replace;

#delimit cr

* data file is stored in samadult.dta
* log  file is stored in samadult.log

log close
