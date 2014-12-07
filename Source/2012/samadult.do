global DAT "~/database/NHIS/Data/raw/2012"
global OUT "~/database/NHIS/Data/dta/2012"
global LOG "~/database/NHIS/Log"

log using "$LOG/samadult.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 MAY 16, 2013  2:10 PM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2012 NHIS Public Use Sample Adult ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE samadult.dta AND samadult.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd c:\nhis2012\

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

      afd_flg      50 -  50

      r_maritl     51 -  51

      proxysa      52 -  52      prox1        53 -  53
      prox2        54 -  54      lateinta     55 -  55

      fdrn_flg     56 -  56

      doinglwa     57 -  57      whynowka     58 -  59
      everwrk      60 -  60      indstrn1     61 -  62
      indstrn2     63 -  64      occupn1      65 -  66
      occupn2      67 -  68      wrkcata      69 -  69
      businc1a     70 -  70      locall1a     71 -  72
      yrswrkpa     73 -  74      wrklongh     75 -  75
      hourpda      76 -  76      pdsicka      77 -  77
      onejob       78 -  78      wrklyr4      79 -  79
      schoolyr     80 -  80

      hypev        81 -  81      hypdifv      82 -  82
      hypyr        83 -  83      chdev        84 -  84
      chdyr        85 -  85      angev        86 -  86
      miev         87 -  87      hrtev        88 -  88
      hrtyr        89 -  89      strev        90 -  90
      ephev        91 -  91      copdev       92 -  92
      aspmedev     93 -  93      aspmedad     94 -  94
      aspmdmed     95 -  95      asponown     96 -  96
      aasmev       97 -  97      aasstill     98 -  98
      aasmyr       99 -  99      aaseryr1    100 - 100
      ulcev       101 - 101      ulcyr       102 - 102
      chlev       103 - 103      chlyr       104 - 104
      aflupnev    105 - 105      aflupnyr    106 - 106
      astrepev    107 - 107      astrepyr    108 - 108
      prcirev     109 - 109      prciryr     110 - 110
      urev        111 - 111      uryr        112 - 112
      phobiaev    113 - 113      phobiayr    114 - 114
      addhyp1     115 - 115      bipdis      116 - 116
      adeprsev    117 - 117      adeprsyr    118 - 118
      mhdothev    119 - 119      mhdothyr    120 - 120
      respalyr    121 - 121      dgstalyr    122 - 122
      sknalyr     123 - 123      othalyr     124 - 124
      acidryr     125 - 125      afevryr     126 - 126
      acoldyr     127 - 127      anausyr     128 - 128
      athothyr    129 - 129      immothyr    130 - 130
      aheadyr     131 - 131      memlosyr    132 - 132
      neuroyr     133 - 133      aabdomyr    134 - 134
      spnyr       135 - 135      denyr       136 - 136
      amusclyr    137 - 137      apnothyr    138 - 138
      alctobyr    139 - 139      subabyr     140 - 140
      aovrwtyr    141 - 141      sknyr1      142 - 142
      fatigyr     143 - 143      fatyr       144 - 144
      insyr       145 - 145      anxnwyr     146 - 146
      astresyr    147 - 147      canev       148 - 148
      cnkind1     149 - 149      cnkind2     150 - 150
      cnkind3     151 - 151      cnkind4     152 - 152
      cnkind5     153 - 153      cnkind6     154 - 154
      cnkind7     155 - 155      cnkind8     156 - 156
      cnkind9     157 - 157      cnkind10    158 - 158
      cnkind11    159 - 159      cnkind12    160 - 160
      cnkind13    161 - 161      cnkind14    162 - 162
      cnkind15    163 - 163      cnkind16    164 - 164
      cnkind17    165 - 165      cnkind18    166 - 166
      cnkind19    167 - 167      cnkind20    168 - 168
      cnkind21    169 - 169      cnkind22    170 - 170
      cnkind23    171 - 171      cnkind24    172 - 172
      cnkind25    173 - 173      cnkind26    174 - 174
      cnkind27    175 - 175      cnkind28    176 - 176
      cnkind29    177 - 177      cnkind30    178 - 178
      cnkind31    179 - 179      canage1     180 - 182
      canage2     183 - 185      canage3     186 - 188
      canage4     189 - 191      canage5     192 - 194
      canage6     195 - 197      canage7     198 - 200
      canage8     201 - 203      canage9     204 - 206
      canage10    207 - 209      canage11    210 - 212
      canage12    213 - 215      canage13    216 - 218
      canage14    219 - 221      canage15    222 - 224
      canage16    225 - 227      canage17    228 - 230
      canage18    231 - 233      canage19    234 - 236
      canage20    237 - 239      canage21    240 - 242
      canage22    243 - 245      canage23    246 - 248
      canage24    249 - 251      canage25    252 - 254
      canage26    255 - 257      canage27    258 - 260
      canage28    261 - 263      canage29    264 - 266
      canage30    267 - 269      dibev       270 - 270
      dibpre1     271 - 271      dibage      272 - 273
      difage2     274 - 275      insln       276 - 276
      dibpill     277 - 277      ahayfyr     278 - 278
      sinyr       279 - 279      cbrchyr     280 - 280
      kidwkyr     281 - 281      livyr       282 - 282
      jntsymp     283 - 283      jmthp1      284 - 284
      jmthp2      285 - 285      jmthp3      286 - 286
      jmthp4      287 - 287      jmthp5      288 - 288
      jmthp6      289 - 289      jmthp7      290 - 290
      jmthp8      291 - 291      jmthp9      292 - 292
      jmthp10     293 - 293      jmthp11     294 - 294
      jmthp12     295 - 295      jmthp13     296 - 296
      jmthp14     297 - 297      jmthp15     298 - 298
      jmthp16     299 - 299      jmthp17     300 - 300
      jntchr      301 - 301      jnthp       302 - 302
      arth1       303 - 303      arthlmt     304 - 304
      arthtyp1    305 - 305      arthtyp2    306 - 306
      arthtyp3    307 - 307      arthtyp4    308 - 308
      arthtyp5    309 - 309      arthtyp6    310 - 310
      paineck     311 - 311      painlb      312 - 312
      painleg     313 - 313      painface    314 - 314
      amigr       315 - 315      acold2w     316 - 316
      aintil2w    317 - 317      pregnow     318 - 318
      pregflyr    319 - 319      mensyr      320 - 320
      menoyr      321 - 321      gynyr       322 - 322
      prostyr     323 - 323      hraidnow    324 - 324
      hraidev     325 - 325      ahearst1    326 - 326
      avision     327 - 327      ablind      328 - 328
      lupprt      329 - 329      sad         330 - 330
      nervous     331 - 331      restless    332 - 332
      hopeless    333 - 333      effort      334 - 334
      worthls     335 - 335      mhamtmo     336 - 336

      vslvyr      337 - 337      vslswyr     338 - 338
      vslspyr     339 - 339      vsllgyr     340 - 340
      vslspec     341 - 341      vslever     342 - 342
      vslhpd      343 - 343      vsldgtp1    344 - 344
      vsldgtp2    345 - 345      vsldgtp3    346 - 346
      vsldgtp4    347 - 347      vslvdg01    348 - 348
      vslvdg02    349 - 349      vslvdg03    350 - 350
      vslvdg04    351 - 351      vslvdg05    352 - 352
      vslvdg06    353 - 353      vslvdg07    354 - 354
      vslvdg08    355 - 355      vslvdg09    356 - 356
      vslvdg10    357 - 357      vslvdg11    358 - 358
      vslswd01    359 - 359      vslswd02    360 - 360
      vslswd03    361 - 361      vslswd04    362 - 362
      vslswd05    363 - 363      vslswd06    364 - 364
      vslswd07    365 - 365      vslswd08    366 - 366
      vslswd09    367 - 367      vslswd10    368 - 368
      vslspd01    369 - 369      vslspd02    370 - 370
      vslspd03    371 - 371      vslspd04    372 - 372
      vslspd05    373 - 373      vslspd06    374 - 374
      vslspd07    375 - 375      vslspd08    376 - 376
      vslspd09    377 - 377      vslspd10    378 - 378
      vsllgd01    379 - 379      vsllgd02    380 - 380
      vsllgd03    381 - 381      vsllgd04    382 - 382
      vsllgd05    383 - 383      vsllgd06    384 - 384
      vsllgd07    385 - 385      vsllgd08    386 - 386
      vsllgd09    387 - 387      vsllgd10    388 - 388
      vsllgd11    389 - 389      vslvdys     390 - 392
      vslswdys    393 - 395      vslspdys    396 - 398
      vsllgdys    399 - 401      vslv1wk     402 - 402
      vslsw1wk    403 - 403      vslsp1wk    404 - 404
      vsllg1wk    405 - 405      vslstutt    406 - 406
      vslstdeg    407 - 407      vsllgfam    408 - 408
      vslvage     409 - 411      vslswage    412 - 414
      vslspage    415 - 417      vsllgage    418 - 420
      vslvprb     421 - 421      vslswprb    422 - 422
      vslspprb    423 - 423      vsllgprb    424 - 424
      vslvslp     425 - 425      vslvpev     426 - 426
      vslswslp    427 - 427      vslswpev    428 - 428
      vslspslp    429 - 429      vslsppev    430 - 430
      vsllgslp    431 - 431      vsllgpev    432 - 432
      vslvtrt     433 - 433      vslvtr01    434 - 434
      vslvtr02    435 - 435      vslvtr03    436 - 436
      vslvtr04    437 - 437      vslvtr05    438 - 438
      vslvtr06    439 - 439      vslvtr07    440 - 440
      vslvtr08    441 - 441      vslvtr09    442 - 442
      vslvtr10    443 - 443      vslvtr11    444 - 444
      vslswtrt    445 - 445      vslswt01    446 - 446
      vslswt02    447 - 447      vslswt03    448 - 448
      vslswt04    449 - 449      vslswt05    450 - 450
      vslswt06    451 - 451      vslswt07    452 - 452
      vslswt08    453 - 453      vslswt09    454 - 454
      vslswt10    455 - 455      vslswt11    456 - 456
      vslsptrt    457 - 457      vslspt01    458 - 458
      vslspt02    459 - 459      vslspt03    460 - 460
      vslspt04    461 - 461      vslspt05    462 - 462
      vslspt06    463 - 463      vslspt07    464 - 464
      vslspt08    465 - 465      vslspt09    466 - 466
      vslspt10    467 - 467      vslspt11    468 - 468
      vsllgtrt    469 - 469      vsllgt01    470 - 470
      vsllgt02    471 - 471      vsllgt03    472 - 472
      vsllgt04    473 - 473      vsllgt05    474 - 474
      vsllgt06    475 - 475      vsllgt07    476 - 476
      vsllgt08    477 - 477      vsllgt09    478 - 478
      vsllgt10    479 - 479      vsllgt11    480 - 480
      vslvsoc     481 - 481      vslswsoc    482 - 482
      vslspsoc    483 - 483      vsllgsoc    484 - 484
      vslvsw      485 - 485      vslswsw     486 - 486
      vslspsw     487 - 487      vsllgsw     488 - 488
      vslvcom     489 - 489      vslswcom    490 - 490
      vslspcom    491 - 491      vsllgcom    492 - 492
      vslintyr    493 - 493      vslintcn    494 - 494
      vslintpr    495 - 495      vslinthp    496 - 496

      wkdayr      497 - 499      beddayr     500 - 502
      ahstatyr    503 - 503      speceq      504 - 504
      flwalk      505 - 505      flclimb     506 - 506
      flstand     507 - 507      flsit       508 - 508
      flstoop     509 - 509      flreach     510 - 510
      flgrasp     511 - 511      flcarry     512 - 512
      flpush      513 - 513      flshop      514 - 514
      flsocl      515 - 515      flrelax     516 - 516
      fla1ar      517 - 517      aflhca1     518 - 518
      aflhca2     519 - 519      aflhca3     520 - 520
      aflhca4     521 - 521      aflhca5     522 - 522
      aflhca6     523 - 523      aflhca7     524 - 524
      aflhca8     525 - 525      aflhca9     526 - 526
      aflhca10    527 - 527      aflhca11    528 - 528
      aflhca12    529 - 529      aflhca13    530 - 530
      alhca14a    531 - 531      aflhca15    532 - 532
      aflhca16    533 - 533      aflhca17    534 - 534
      aflhca18    535 - 535      aflhc19_    536 - 536
      aflhc20_    537 - 537      aflhc21_    538 - 538
      aflhc22_    539 - 539      aflhc23_    540 - 540
      aflhc24_    541 - 541      aflhc25_    542 - 542
      aflhc26_    543 - 543      aflhc27_    544 - 544
      aflhc28_    545 - 545      aflhc29_    546 - 546
      aflhc30_    547 - 547      aflhc31_    548 - 548
      aflhc32_    549 - 549      aflhc33_    550 - 550
      aflhc34_    551 - 551      aflhca90    552 - 552
      aflhca91    553 - 553      altime1     554 - 555
      alunit1     556 - 556      aldura1     557 - 558
      aldurb1     559 - 559      alchrc1     560 - 560
      altime2     561 - 562      alunit2     563 - 563
      aldura2     564 - 565      aldurb2     566 - 566
      alchrc2     567 - 567      altime3     568 - 569
      alunit3     570 - 570      aldura3     571 - 572
      aldurb3     573 - 573      alchrc3     574 - 574
      altime4     575 - 576      alunit4     577 - 577
      aldura4     578 - 579      aldurb4     580 - 580
      alchrc4     581 - 581      altime5     582 - 583
      alunit5     584 - 584      aldura5     585 - 586
      aldurb5     587 - 587      alchrc5     588 - 588
      altime6     589 - 590      alunit6     591 - 591
      aldura6     592 - 593      aldurb6     594 - 594
      alchrc6     595 - 595      altime7     596 - 597
      alunit7     598 - 598      aldura7     599 - 600
      aldurb7     601 - 601      alchrc7     602 - 602
      altime8     603 - 604      alunit8     605 - 605
      aldura8     606 - 607      aldurb8     608 - 608
      alchrc8     609 - 609      altime9     610 - 611
      alunit9     612 - 612      aldura9     613 - 614
      aldurb9     615 - 615      alchrc9     616 - 616
      altime10    617 - 618      alunit10    619 - 619
      aldura10    620 - 621      aldurb10    622 - 622
      alchrc10    623 - 623      altime11    624 - 625
      alunit11    626 - 626      aldura11    627 - 628
      aldurb11    629 - 629      alchrc11    630 - 630
      altime12    631 - 632      alunit12    633 - 633
      aldura12    634 - 635      aldurb12    636 - 636
      alchrc12    637 - 637      altime13    638 - 639
      alunit13    640 - 640      aldura13    641 - 642
      aldurb13    643 - 643      alchrc13    644 - 644
      atime14a    645 - 646      aunit14a    647 - 647
      adura14a    648 - 649      adurb14a    650 - 650
      achrc14a    651 - 651      altime15    652 - 653
      alunit15    654 - 654      aldura15    655 - 656
      aldurb15    657 - 657      alchrc15    658 - 658
      altime16    659 - 660      alunit16    661 - 661
      aldura16    662 - 663      aldurb16    664 - 664
      alchrc16    665 - 665      altime17    666 - 667
      alunit17    668 - 668      aldura17    669 - 670
      aldurb17    671 - 671      alchrc17    672 - 672
      altime18    673 - 674      alunit18    675 - 675
      aldura18    676 - 677      aldurb18    678 - 678
      alchrc18    679 - 679      altime19    680 - 681
      alunit19    682 - 682      aldura19    683 - 684
      aldurb19    685 - 685      alchrc19    686 - 686
      altime20    687 - 688      alunit20    689 - 689
      aldura20    690 - 691      aldurb20    692 - 692
      alchrc20    693 - 693      altime21    694 - 695
      alunit21    696 - 696      aldura21    697 - 698
      aldurb21    699 - 699      alchrc21    700 - 700
      altime22    701 - 702      alunit22    703 - 703
      aldura22    704 - 705      aldurb22    706 - 706
      alchrc22    707 - 707      altime23    708 - 709
      alunit23    710 - 710      aldura23    711 - 712
      aldurb23    713 - 713      alchrc23    714 - 714
      altime24    715 - 716      alunit24    717 - 717
      aldura24    718 - 719      aldurb24    720 - 720
      alchrc24    721 - 721      altime25    722 - 723
      alunit25    724 - 724      aldura25    725 - 726
      aldurb25    727 - 727      alchrc25    728 - 728
      altime26    729 - 730      alunit26    731 - 731
      aldura26    732 - 733      aldurb26    734 - 734
      alchrc26    735 - 735      altime27    736 - 737
      alunit27    738 - 738      aldura27    739 - 740
      aldurb27    741 - 741      alchrc27    742 - 742
      altime28    743 - 744      alunit28    745 - 745
      aldura28    746 - 747      aldurb28    748 - 748
      alchrc28    749 - 749      altime29    750 - 751
      alunit29    752 - 752      aldura29    753 - 754
      aldurb29    755 - 755      alchrc29    756 - 756
      altime30    757 - 758      alunit30    759 - 759
      aldura30    760 - 761      aldurb30    762 - 762
      alchrc30    763 - 763      altime31    764 - 765
      alunit31    766 - 766      aldura31    767 - 768
      aldurb31    769 - 769      alchrc31    770 - 770
      altime32    771 - 772      alunit32    773 - 773
      aldura32    774 - 775      aldurb32    776 - 776
      alchrc32    777 - 777      altime33    778 - 779
      alunit33    780 - 780      aldura33    781 - 782
      aldurb33    783 - 783      alchrc33    784 - 784
      altime34    785 - 786      alunit34    787 - 787
      aldura34    788 - 789      aldurb34    790 - 790
      alchrc34    791 - 791      altime90    792 - 793
      alunit90    794 - 794      aldura90    795 - 796
      aldurb90    797 - 797      alchrc90    798 - 798
      altime91    799 - 800      alunit91    801 - 801
      aldura91    802 - 803      aldurb91    804 - 804
      alchrc91    805 - 805      alcndrt     806 - 806
      alchronr    807 - 807

      smkev       808 - 808      smkreg      809 - 810
      smknow      811 - 811      smkstat2    812 - 812
      smkqtno     813 - 814      smkqttp     815 - 815
      smkqty      816 - 817      cigsda1     818 - 819
      cigdamo     820 - 821      cigsda2     822 - 823
      cigsday     824 - 825      cigqtyr     826 - 826
      othcigev    827 - 827      othciged    828 - 828
      smklesev    829 - 829      smklesed    830 - 830
      toblasyr    831 - 831      tobqtyr     832 - 832
      vigno       833 - 835      vigtp       836 - 836
      vigfreqw    837 - 838      viglngno    839 - 841
      viglngtp    842 - 842      vigmin      843 - 845
      modno       846 - 848      modtp       849 - 849
      modfreqw    850 - 851      modlngno    852 - 854
      modlngtp    855 - 855      modmin      856 - 858
      strngno     859 - 861      strngtp     862 - 862
      strfreqw    863 - 864      alc1yr      865 - 865
      alclife     866 - 866      alc12mno    867 - 869
      alc12mtp    870 - 870      alc12mwk    871 - 872
      alc12myr    873 - 875      alcamt      876 - 877
      alcstat     878 - 879      alc5upno    880 - 882
      alc5uptp    883 - 883      alc5upyr    884 - 886
      aheight     887 - 888      aweightp    889 - 891
      bmi         892 - 895      sleep       896 - 897

      ausualpl    898 - 898      aplkind     899 - 899
      ahcplrou    900 - 900      ahcplknd    901 - 901
      ahcchgyr    902 - 902      ahcchghi    903 - 903
      anouspl1    904 - 904      anouspl2    905 - 905
      anouspl3    906 - 906      anouspl4    907 - 907
      anouspl5    908 - 908      anouspl6    909 - 909
      anouspl7    910 - 910      anouspl8    911 - 911
      anouspl9    912 - 912      aprvtryr    913 - 913
      aprvtrfd    914 - 914      adrnanp     915 - 915
      adrnai      916 - 916      ahcdlyr1    917 - 917
      ahcdlyr2    918 - 918      ahcdlyr3    919 - 919
      ahcdlyr4    920 - 920      ahcdlyr5    921 - 921
      ahcafyr1    922 - 922      ahcafyr2    923 - 923
      ahcafyr3    924 - 924      ahcafyr4    925 - 925
      ahcafyr5    926 - 926      ahcafyr6    927 - 927
      aworpay     928 - 928      ahicomp     929 - 929
      arxpr_1     930 - 930      arxpr_2     931 - 931
      arxpr_3     932 - 932      arxpr_4     933 - 933
      arxpr_5     934 - 934      arxpr_6     935 - 935
      adnlong2    936 - 936      ahcsyr1     937 - 937
      ahcsyr2     938 - 938      ahcsyr3     939 - 939
      ahcsyr4     940 - 940      ahcsyr5     941 - 941
      ahcsyr6     942 - 942      ahcsyr7     943 - 943
      ahcsyr8     944 - 944      ahcsyr9     945 - 945
      ahcsyr10    946 - 946      ahernoy2    947 - 948
      aervisnd    949 - 949      aerhos      950 - 950
      aerreas1    951 - 951      aerreas2    952 - 952
      aerreas3    953 - 953      aerreas4    954 - 954
      aerreas5    955 - 955      aerreas6    956 - 956
      aerreas7    957 - 957      aerreas8    958 - 958
      aerrea1r    959 - 959      aerrea2r    960 - 960
      aerrea3r    961 - 961      aerrea4r    962 - 962
      aerrea5r    963 - 963      aerrea6r    964 - 964
      aerrea7r    965 - 965      aerrea8r    966 - 966
      ahchyr      967 - 967      ahchmoyr    968 - 969
      ahchnoy2    970 - 971      ahcnoyr2    972 - 973
      asrgyr      974 - 974      asrgnoyr    975 - 976
      amdlongr    977 - 977      avislast    978 - 978
      alastyp1    979 - 979      alastyp2    980 - 980
      alastyp3    981 - 981      alastyp4    982 - 982
  str alastvrb    983 - 997      avisapn2    998 - 999
      avisapt2   1000 -1000      awaitrmn   1001 -1002
      awaitrmt   1003 -1003      hit1a      1004 -1004
      hit2a      1005 -1005      hit3a      1006 -1006
      hit4a      1007 -1007      hit5a      1008 -1008
      shtflu2    1009 -1009      ashflum2   1010 -1011
      ashfluy2   1012 -1015      flushpg1   1016 -1016
      flushpg2   1017 -1017      sprflu2    1018 -1018
      aspflum2   1019 -1020      aspfluy2   1021 -1024
      shtpnuyr   1025 -1025      apox       1026 -1026
      apox12mo   1027 -1027      ahep       1028 -1028
      ahepliv    1029 -1029      shthepb    1030 -1030
      shepdos    1031 -1031      shthepa    1032 -1032
      shepanum   1033 -1034      shingles   1035 -1035
      shttd      1036 -1036      shttd05    1037 -1037
      shttdap2   1038 -1038      hpvhrd     1039 -1039
      shhpvhd1   1040 -1040      shthpv1    1041 -1041
      shhpvdos   1042 -1043      livev      1044 -1044
      travel     1045 -1045      wrkhlth2   1046 -1046
      wrkdir     1047 -1047      apsbpchk   1048 -1048
      apschchk   1049 -1049      apsbschk   1050 -1050
      apspap     1051 -1051      apsmam     1052 -1052
      apscol     1053 -1053      apsdiet    1054 -1054
      apssmkc    1055 -1055      ltcfam     1056 -1056
      ltchelp    1057 -1057      ltcwho1    1058 -1058
      ltcwho2    1059 -1059      ltcwho3    1060 -1060
      ltcwho4    1061 -1061      ltcwho5    1062 -1062
      aindins    1063 -1063      aindprch   1064 -1064
      aindwho    1065 -1065      ainddif1   1066 -1066
      ainddif2   1067 -1067      aindeny1   1068 -1068
      aindeny2   1069 -1069      aindeny3   1070 -1070
      aindnot1   1071 -1071      aindnot2   1072 -1072
      aindnot3   1073 -1073      aindnot4   1074 -1074
      aindnot5   1075 -1075      hivtst1    1076 -1076

      awebuse    1077 -1077      awebofno   1078 -1080
      aweboftp   1081 -1081      awebeml    1082 -1082
      awebmno    1083 -1085      awebmtp    1086 -1086

using "$DAT/samadult.dat";
replace wtia_sa = wtia_sa/10;
replace bmi = bmi/100;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: Household Number";
label variable intv_qrt "IDN.000_25.000: Interview Quarter";
label variable intv_mon "IDN.000_30.000: Interview Month";
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

label variable afd_flg  "FRT.002_00.000: Adult Functioning and Disability flag";

label variable r_maritl "FID.250_00.000: Marital Status";

label variable proxysa  "AID.005_00.000: Sample adult status";
label variable prox1    "
AID.010_00.000: Knowledgeable proxy for Sample Adult available";
label variable prox2    "AID.015_00.000: Relationship of SA proxy to SA";
label variable lateinta "AID.550_00.000: Late Sample Adult interviews";

label variable fdrn_flg "FDB.001_00.000: Disability Questions Test flag";

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
ASD.150_00.000: Paid by the hour at current or most recent job";
label variable pdsicka  "
ASD.160_00.000: Paid sick leave at current or most recent job";
label variable onejob   "ASD.170_00.000: Have more than one job";
label variable wrklyr4  "ASD.210_00.000: Work status: last week, past 12 months
";
label variable schoolyr "
ASD.215_00.010: Attended any kind of school, past 12 months";

label variable hypev    "ACN.010_00.000: Ever been told you have hypertension";
label variable hypdifv  "ACN.020_00.000: Ever had hypertension on 2+ visits";
label variable hypyr    "ACN.020_00.010: Had hypertension, past 12 months";
label variable chdev    "
ACN.031_01.000: Ever been told you had coronary heart disease";
label variable chdyr    "
ACN.031_01.010: Had coronary heart disease, past 12 months";
label variable angev    "ACN.031_02.000: Ever been told you had angina pectoris
";
label variable miev     "ACN.031_03.000: Ever been told you had a heart attack";
label variable hrtev    "
ACN.031_04.000: Ever been told you had a heart condition/disease";
label variable hrtyr    "
ACN.031_04.010: Had other heart condition, past 12 months";
label variable strev    "ACN.031_05.000: Ever been told you had a stroke";
label variable ephev    "ACN.031_06.000: Ever been told you had emphysema";
label variable copdev   "ACN.035_00.000: Ever been told you had COPD";
label variable aspmedev "ACN.040_00.010: Ever been told to take low-dose aspirin
";
label variable aspmedad "ACN.040_00.020: Following low-dose aspirin advice";
label variable aspmdmed "ACN.040_00.030: Advised to stop taking low-dose aspirin
";
label variable asponown "ACN.040_00.040: Taking low-dose aspirin on own";
label variable aasmev   "ACN.080_00.000: Ever been told you had asthma";
label variable aasstill "ACN.085_00.000: Still have asthma";
label variable aasmyr   "ACN.090_00.000: Had an asthma episode/attack past 12 m
";
label variable aaseryr1 "ACN.100_00.000: Had visit to ER due to asthma past 12 m
";
label variable ulcev    "ACN.110_00.000: Ever been told you have an ulcer";
label variable ulcyr    "ACN.120_00.000: Had ulcer in past 12 m";
label variable chlev    "ACN.121_00.010: Ever told you had high cholesterol";
label variable chlyr    "ACN.121_00.020: Had high cholesterol, past 12 months";
label variable aflupnev "ACN.121_00.030: Ever told you had influenza/pneumonia";
label variable aflupnyr "ACN.121_00.040: Had influenza/pneumonia, past 12 months
";
label variable astrepev "
ACN.121_00.050: Ever told you had strep throat/tonsillitis";
label variable astrepyr "
ACN.121_00.060: Had strep throat/tonsillitis, past 12 months";
label variable prcirev  "ACN.121_00.070: Ever told you had poor circulation";
label variable prciryr  "ACN.121_00.080: Had poor circulation, past 12 months";
label variable urev     "ACN.121_00.090: Ever told you had urinary problems";
label variable uryr     "ACN.121_00.100: Had urinary problems, past 12 months";
label variable phobiaev "ACN.121_00.110: Ever told you had phobia or fears";
label variable phobiayr "ACN.121_00.120: Had phobia or fears, past 12 months";
label variable addhyp1  "ACN.121_00.130: Ever told you had ADD/ADHD";
label variable bipdis   "ACN.121_00.140: Ever told you had Bipolar Disorder";
label variable adeprsev "ACN.121_00.150: Ever told you had depression";
label variable adeprsyr "ACN.121_00.160: Had depression, past 12 months";
label variable mhdothev "
ACN.121_00.170: Ever told you had other mental health disorders";
label variable mhdothyr "
ACN.121_00.180: Had mental health disorders, past 12 months";
label variable respalyr "ACN.125_00.010: Had respiratory allergy, past 12 months
";
label variable dgstalyr "ACN.125_00.020: Had digestive allergy, past 12 months";
label variable sknalyr  "ACN.125_00.030: Had eczema/skin allergy, past 12 months
";
label variable othalyr  "ACN.125_00.040: Had other allergy, past 12 months";
label variable acidryr  "
ACN.125_00.050: Had acid reflux/heartburn, past 12 months";
label variable afevryr  "
ACN.125_00.060: Had fever more than one day, past 12 months";
label variable acoldyr  "ACN.125_00.070: Had head/chest cold, past 12 months";
label variable anausyr  "ACN.125_00.080: Had nausea/vomiting, past 12 months";
label variable athothyr "ACN.125_00.090: Had sore throat, past 12 months";
label variable immothyr "ACN.125_00.100: Had infectious diseases, past 12 months
";
label variable aheadyr  "ACN.125_00.110: Had recurring headache, past 12 months
";
label variable memlosyr "ACN.125_00.120: Had memory loss, past 12 months";
label variable neuroyr  "
ACN.125_00.130: Had neurological problems, past 12 months";
label variable aabdomyr "ACN.125_00.140: Had abdominal pain, past 12 months";
label variable spnyr    "ACN.125_00.150: Had sprains/strains, past 12 months";
label variable denyr    "ACN.125_00.160: Had dental pain, past 12 months";
label variable amusclyr "ACN.125_00.170: Had muscle/bone pain, past 12 months";
label variable apnothyr "ACN.125_00.180: Had other chronic pain, past 12 months
";
label variable alctobyr "
ACN.125_00.190: Excessive alcohol/tobacco, past 12 months";
label variable subabyr  "ACN.125_00.200: Substance abuse, past 12 months";
label variable aovrwtyr "
ACN.125_00.210: Had problems being overweight, past 12 months";
label variable sknyr1   "ACN.125_00.220: Skin problems, past 12 months";
label variable fatigyr  "
ACN.125_00.230: Had fatigue/lack of energy, past 12 months";
label variable fatyr    "ACN.125_00.240: Excessive sleepiness, past 12 months";
label variable insyr    "ACN.125_00.250: Insomnia, past 12 months";
label variable anxnwyr  "ACN.125_00.260: Frequently anxious, past 12 months";
label variable astresyr "ACN.125_00.270: Frequently stressed, past 12 months";
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
label variable jntchr   "
ACN.270_00.000: Joint symptoms begin more than 3 months ago";
label variable jnthp    "
ACN.280_00.000: Ever seen doctor or health professional for joint symptoms";
label variable arth1    "ACN.290_00.000: Ever been told you had arthritis";
label variable arthlmt  "
ACN.295_00.000: Limited due to arthritis or joint symptoms";
label variable arthtyp1 "ACN.297_01.010: Ever told you had arthritis";
label variable arthtyp2 "ACN.297_02.010: Ever told you had rheumatoid arthritis
";
label variable arthtyp3 "ACN.297_03.010: Ever told you had gout";
label variable arthtyp4 "ACN.297_04.010: Ever told you had lupus";
label variable arthtyp5 "ACN.297_05.010: Ever told you had fibromyalgia";
label variable arthtyp6 "ACN.297_06.010: Ever told you had other joint condition
";
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
label variable pregflyr "ACN.370_00.010: Recently pregnant";
label variable mensyr   "ACN.372_00.010: Menstrual problems, past 12 months";
label variable menoyr   "ACN.372_00.020: Menopausal problems, past 12 months";
label variable gynyr    "ACN.372_00.030: Gynecological problems, past 12 months
";
label variable prostyr  "ACN.372_00.040: Prostate problems, past 12 months";
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

label variable vslvyr   "ACD.010_00.000: Voice problem past 12 months";
label variable vslswyr  "ACD.015_00.000: Swallowing problem past 12 months";
label variable vslspyr  "ACD.020_00.000: Speech problem past 12 months";
label variable vsllgyr  "ACD.025_00.000: Language problem past 12 months";
label variable vslspec  "
ACD.030_00.000: Special services or instruction for problem(s)";
label variable vslever  "
ACD.035_00.000: Ever had voice, swallowing, speech, or language problem lasting 
1+ weeks";
label variable vslhpd   "
ACD.040_00.000: Given diagnosis for voice, swallowing, speech, language problem
";
label variable vsldgtp1 "ACD.045_01.000: Given diagnosis for voice problem";
label variable vsldgtp2 "ACD.045_02.000: Given diagnosis for swallowing problem
";
label variable vsldgtp3 "ACD.045_03.000: Given diagnosis for speech problem";
label variable vsldgtp4 "ACD.045_04.000: Given diagnosis for language problem";
label variable vslvdg01 "
ACD.050_01.000: Laryngitis caused by voice misuse, abuse, overuse caused voice p
roblem";
label variable vslvdg02 "
ACD.050_02.000: Laryngitis caused by colds/strep caused voice problem";
label variable vslvdg03 "
ACD.050_03.000: Vocal nodules or polyps caused voice problem";
label variable vslvdg04 "
ACD.050_04.000: Gastro-esophageal reflux disease (GERD) caused voice problem";
label variable vslvdg05 "ACD.050_05.000: Allergies caused voice problem";
label variable vslvdg06 "
ACD.050_06.000: Airborne irritants or environmental pollutants caused voice prob
lem";
label variable vslvdg07 "ACD.050_07.000: Head/neck injury caused voice problem";
label variable vslvdg08 "
ACD.050_08.000: Cancer anywhere in the head, neck, or throat caused voice proble
m";
label variable vslvdg09 "
ACD.050_09.000: Neurological cause (Alzheimer's, Parkinson's, dementia, etc.) ca
used voice problem";
label variable vslvdg10 "
ACD.050_10.000: Prescription medication or drugs caused voice problem";
label variable vslvdg11 "ACD.050_11.000: Something else caused voice problem";
label variable vslswd01 "ACD.060_01.000: Stroke caused swallowing problem";
label variable vslswd02 "
ACD.060_02.000: Neurological cause (Alzheimer's, Parkinson's, post-polio syndrom
e, dementia, etc.) caused swallowing problem";
label variable vslswd03 "
ACD.060_03.000: Cancer anywhere in the head, neck, or throat caused swallowing p
roblem";
label variable vslswd04 "
ACD.060_04.000: Chronic obstructive pulmonary disease (COPD) caused swallowing p
roblem";
label variable vslswd05 "
ACD.060_05.000: Congestive heart failure (CHF) caused swallowing problem";
label variable vslswd06 "
ACD.060_06.000: Head/neck injury caused swallowing problem";
label variable vslswd07 "
ACD.060_07.000: Arthritic changes in the neck (arthritis, cervical osteophyte) c
aused swallowing problem";
label variable vslswd08 "
ACD.060_08.000: Advancing age (deterioration of muscle function with age…sarcope
nia) caused swallowing problem";
label variable vslswd09 "
ACD.060_09.000: Prescription medication or drugs caused swallowing problem";
label variable vslswd10 "
ACD.060_10.000: Something else caused swallowing problem";
label variable vslspd01 "
ACD.065_01.000: Hearing loss or deafness caused speech problem";
label variable vslspd02 "
ACD.065_02.000: Developmental speech sound disorder (phonological, articulatory,
 dyspraxia) caused speech problem";
label variable vslspd03 "ACD.065_03.000: Cerebral palsy caused speech problem";
label variable vslspd04 "
ACD.065_04.000: Cleft lip/palate, cranial-facial anomaly (structural cause) caus
ed speech problem";
label variable vslspd05 "ACD.065_05.000: Head/neck injury caused speech problem
";
label variable vslspd06 "ACD.065_06.000: Stuttering caused speech problem";
label variable vslspd07 "
ACD.065_07.000: Cancer anywhere in the head, neck, or throat caused speech probl
em";
label variable vslspd08 "
ACD.065_08.000: Neurological cause/dysarthria (Alzheimer's, Parkinson's, ALS, mu
ltiple sclerosis, dementia, etc.) caused speech problem";
label variable vslspd09 "
ACD.065_09.000: Prescription medication or drugs caused speech problem";
label variable vslspd10 "ACD.065_10.000: Something else caused speech problem";
label variable vsllgd01 "
ACD.070_01.000: Hearing loss or deafness caused problems using or understanding 
words or sentences";
label variable vsllgd02 "
ACD.070_02.000: Genetic syndrome: Down Syndrome, Fragile X Syndrome, etc. cause 
problems using or understanding words or sentences";
label variable vsllgd03 "
ACD.070_03.000: Intellectual disability, also known as mental retardation caused
 problem using or understanding words or sentences";
label variable vsllgd04 "
ACD.070_04.000: Autism spectrum disorder caused problem using or understanding w
ords or sentences";
label variable vsllgd05 "
ACD.070_05.000: Developmental Language-Learning Disorder (e.g. Specific Language
 Impairment (SLI), learning disability, or dyslexia) cause problem using or unde
rstanding words or sentences";
label variable vsllgd06 "
ACD.070_06.000: Other developmental delay caused problem using or understanding 
words or sentences";
label variable vsllgd07 "
ACD.070_07.000: Head injury, traumatic brain injury (TBI) caused problem using o
r understanding words or sentences";
label variable vsllgd08 "
ACD.070_08.000: Stroke/aphasia caused problem using or understanding words or se
ntences";
label variable vsllgd09 "
ACD.070_09.000: Dementia or other neurological cause (Alzheimer's, Parkinson's, 
etc.) caused problem using or understanding words or sentences";
label variable vsllgd10 "
ACD.070_10.000: Prescription medication or drugs caused problem using or underst
anding words or sentences";
label variable vsllgd11 "
ACD.070_11.000: Something else caused problem using or understanding words or se
ntences";
label variable vslvdys  "
ACD.075_00.000: Number of days had voice problems in past year";
label variable vslswdys "
ACD.080_00.000: Number of days had swallowing problems in past year";
label variable vslspdys "
ACD.082_00.000: Number of days had speech problems in past year";
label variable vsllgdys "
ACD.085_00.000: Number of days had problems using or understanding words or sent
ences";
label variable vslv1wk  "ACD.090_00.000: Voice problems last 1+ weeks";
label variable vslsw1wk "ACD.095_00.000: Swallowing problems last 1+ weeks";
label variable vslsp1wk "ACD.100_00.000: Speech problems last 1+ weeks";
label variable vsllg1wk "
ACD.105_00.000: Problems using or understanding words or sentences last 1+ weeks
";
label variable vslstutt "
ACD.110_00.000: Stammering or stuttering problem in past 12 months";
label variable vslstdeg "
ACD.115_00.000: Degree of stammering or stuttering problem";
label variable vsllgfam "
ACD.120_00.000: Family, friends, associates had trouble understanding what you s
ay in past 12 months";
label variable vslvage  "ACD.125_00.000: Age first had voice problems";
label variable vslswage "ACD.130_00.000: Age first had swallowing problems";
label variable vslspage "ACD.135_00.000: Age first had speech problems";
label variable vsllgage "
ACD.140_00.000: Age first had problems using or understanding words or sentences
";
label variable vslvprb  "
ACD.145_00.000: How much of a problem with your voice in past 12 months";
label variable vslswprb "
ACD.150_00.000: How much of a problem with swallowing in past 12 months";
label variable vslspprb "
ACD.155_00.000: How much of a problem with speech in the past 12 months";
label variable vsllgprb "
ACD.160_00.000: How much of a problem using or understanding words or sentences 
in the past 12 months";
label variable vslvslp  "
ACD.165_00.000: Seen speech-language pathologist (SLP) or other health care prof
essional for voice problem in past 12 months";
label variable vslvpev  "
ACD.170_00.000: Ever seen speech-language pathologist (SLP) or other health care
 professional about voice problem?";
label variable vslswslp "
ACD.175_00.000: Seen speech-language pathologist (SLP) or other health care prof
essional for swallowing problem in past 12 months";
label variable vslswpev "
ACD.180_00.000: Ever seen speech-language pathologist (SLP) or other health care
 professional about swallowing  problem?";
label variable vslspslp "
ACD.185_00.000: Seen speech-language pathologist (SLP) or other health professio
nal for speech problem in past 12 months";
label variable vslsppev "
ACD.190_00.000: Ever seen speech-language pathologist (SLP) or other health care
 professional about speech problem in past 12 months";
label variable vsllgslp "
ACD.195_00.000: Seen speech-language pathologist (SLP) or other health care prof
essional for problem using or understanding words or sentences in past 12 months
";
label variable vsllgpev "
ACD.200_00.000: Ever seen speech-language pathologist (SLP) or other health care
 professional about problem using or understanding words or sentences in past 12
 months";
label variable vslvtrt  "
ACD.205_00.000: Received treatments, therapy, or other rehabilitation services f
or voice problems in past 12 months";
label variable vslvtr01 "
ACD.210_01.000: Speech-language pathologist provided voice services";
label variable vslvtr02 "
ACD.210_02.000: Family physician, General Practitioner, or Osteopath provided vo
ice services";
label variable vslvtr03 "
ACD.210_03.000: Rehabilitation Specialist (Occupational or Physical Therapist) p
rovided voices services";
label variable vslvtr04 "
ACD.210_04.000: Ear, Nose, Throat Doctor (Otolaryngologist) provided voice servi
ces";
label variable vslvtr05 "
ACD.210_05.000: Audiologist, Hearing Specialist, or Hearing Aid Technician provi
ded voice services";
label variable vslvtr06 "
ACD.210_06.000: Specialty doctor in Internal Medicine, Geriatrics, Neurology, et
c. provided voice services";
label variable vslvtr07 "
ACD.210_07.000: Nutritionist or Dietician provided voice services";
label variable vslvtr08 "
ACD.210_08.000: Psychiatrist or Psychologist provided voice services";
label variable vslvtr09 "
ACD.210_09.000: Nurse or Nurse Practitioner provided voice services";
label variable vslvtr10 "
ACD.210_10.000: Dentist, Orthodontist, or Oral Surgeon provided voice services";
label variable vslvtr11 "
ACD.210_11.000: Some other health professional provided voice services";
label variable vslswtrt "
ACD.215_00.000: Received treatments, therapy, or other rehabilitation services f
or swallowing problems in past 12 months";
label variable vslswt01 "
ACD.220_01.000: Speech-language pathologist provided swallowing services";
label variable vslswt02 "
ACD.220_02.000: Family physician, General Practitioner, or Osteopath provided sw
allowing services";
label variable vslswt03 "
ACD.220_03.000: Rehabilitation Specialist (Occupational or Physical Therapist) p
rovided swallowing services";
label variable vslswt04 "
ACD.220_04.000: Ear, Nose, Throat Doctor (Otolaryngologist) provided swallowing 
services";
label variable vslswt05 "
ACD.220_05.000: Audiologist, Hearing Specialist, or Hearing Aid Technician provi
ded swallowing services";
label variable vslswt06 "
ACD.220_06.000: Specialty doctor in Internal Medicine, Geriatrics, Neurology, et
c. provided swallowing services";
label variable vslswt07 "
ACD.220_07.000: Nutritionist or Dietician provided swallowing services";
label variable vslswt08 "
ACD.220_08.000: Psychiatrist or Psychologist provided swallowing services";
label variable vslswt09 "
ACD.220_09.000: Nurse or Nurse Practitioner provided swallowing services";
label variable vslswt10 "
ACD.220_10.000: Dentist, Orthodontist, or Oral Surgeon provided swallowing servi
ces";
label variable vslswt11 "
ACD.220_11.000: Some other health professional provided swallowing services";
label variable vslsptrt "
ACD.225_00.000: Received treatments, therapy, or other rehabilitation services f
or speech problems in past 12 months";
label variable vslspt01 "
ACD.230_01.000: Speech-language pathologist provided speech services";
label variable vslspt02 "
ACD.230_02.000: Family physician, General Practitioner, or Osteopath provided sp
eech services";
label variable vslspt03 "
ACD.230_03.000: Rehabilitation Specialist (Occupational or Physical Therapist) p
rovided speech services";
label variable vslspt04 "
ACD.230_04.000: Ear, Nose, Throat Doctor (Otolaryngologist) provided speech serv
ices";
label variable vslspt05 "
ACD.230_05.000: Audiologist, Hearing Specialist, or Hearing Aid Technician provi
ded speech services";
label variable vslspt06 "
ACD.230_06.000: Specialty doctor in Internal Medicine, Geriatrics, Neurology, et
c. provided speech services";
label variable vslspt07 "
ACD.230_07.000: Nutritionist or Dietician provided speech services";
label variable vslspt08 "
ACD.230_08.000: Psychiatrist or Psychologist provided speech services";
label variable vslspt09 "
ACD.230_09.000: Nurse or Nurse Practitioner provided speech services";
label variable vslspt10 "
ACD.230_10.000: Dentist, Orthodontist, or Oral Surgeon provided speech services
";
label variable vslspt11 "
ACD.230_11.000: Some other health professional provided speech services";
label variable vsllgtrt "
ACD.235_00.000: Received treatments, therapy, or other rehabilitation services f
or problems using or understanding words or sentences in past 12 months";
label variable vsllgt01 "
ACD.240_01.000: Speech-language pathologist provided  language services";
label variable vsllgt02 "
ACD.240_02.000: Family physician, General Practitioner, or Osteopath provided la
nguage services";
label variable vsllgt03 "
ACD.240_03.000: Rehabilitation Specialist (Occupational or Physical Therapist) p
rovided language services";
label variable vsllgt04 "
ACD.240_04.000: Ear, Nose, Throat Doctor (Otolaryngologist) provided language se
rvices";
label variable vsllgt05 "
ACD.240_05.000: Audiologist, Hearing Specialist, or Hearing Aid Technician provi
ded language services";
label variable vsllgt06 "
ACD.240_06.000: Specialty doctor in Internal Medicine, Geriatrics, Neurology, et
c. provided language services";
label variable vsllgt07 "
ACD.240_07.000: Nutritionist or Dietician provided language services";
label variable vsllgt08 "
ACD.240_08.000: Psychiatrist or Psychologist provided language services";
label variable vsllgt09 "
ACD.240_09.000: Nurse or Nurse Practitioner provided language services";
label variable vsllgt10 "
ACD.240_10.000: Dentist, Orthodontist, or Oral Surgeon provided language service
s";
label variable vsllgt11 "
ACD.240_11.000: Some other health professional provided language services";
label variable vslvsoc  "
ACD.245_00.000: Did treatments or other rehabilitation services for voice proble
m make personal or social life better?";
label variable vslswsoc "
ACD.250_00.000: Did treatments or other rehabilitation services for swallowing p
roblem make personal or social life better?";
label variable vslspsoc "
ACD.255_00.000: Did treatments or other rehabilitation services for speech probl
em make personal or social life better?";
label variable vsllgsoc "
ACD.260_00.000: Did treatments or other rehabilitation services for problem usin
g or understanding words or sentences make personal or social life better?";
label variable vslvsw   "
ACD.265_00.000: Did treatments or other rehabilitation services for voice proble
m make school or work life better?";
label variable vslswsw  "
ACD.270_00.000: Did treatments or other rehabilitation services for swallowing p
roblem make school or work life better?";
label variable vslspsw  "
ACD.275_00.000: Did treatments or other rehabilitation services for speech probl
em make school or work life better?";
label variable vsllgsw  "
ACD.280_00.000: Did treatments or other rehabilitation services for problems usi
ng or understanding words or sentences make school or work life better?";
label variable vslvcom  "
ACD.285_00.000: Voice problems better or worse compared to 12 months ago";
label variable vslswcom "
ACD.290_00.000: Swallowing problems better or worse compared to 12 months ago";
label variable vslspcom "
ACD.295_00.000: Speech problems better or worse compared to 12 months ago";
label variable vsllgcom "
ACD.300_00.000: Problems using or understanding words or sentences better or wor
se compared to 12 months ago";
label variable vslintyr "
ACD.305_00.000: Get information from Internet about health, medical treatments o
r rehabilitation services in past 12 months";
label variable vslintcn "
ACD.310_00.000: Did you get information on (voice/swallowing/speech/problems usi
ng or understanding words or sentences problems in the past 12 months";
label variable vslintpr "
ACD.315_00.000: Was this information written by a doctor, other health professio
nal, medical associations, or other health-related organization?";
label variable vslinthp "
ACD.320_00.000: How helpful was the information on the Internet?";

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
label variable alhca14a "
AHS.200_14.000: Intellectual disability, also known as mental retardation causes
 difficulty with activity";
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
AHS.308_01.000: Duration of hypertension or high blood pressure: Number of units
";
label variable alunit9  "
AHS.308_02.000: Duration of hypertension or high blood pressure: Time unit";
label variable aldura9  "
AHS.308_02.000: Duration (in years) of hypertension or high blood pressure: reco
de 1";
label variable aldurb9  "
AHS.308_02.000: Duration of hypertension or high blood pressure: recode 2";
label variable alchrc9  "
AHS.308_02.000: Hypertension or high blood pressure condition status recode";
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
label variable atime14a "
AHS.313_01.000: Duration of intellectual disability, also known as mental retard
ation: Number of units";
label variable aunit14a "
AHS.313_02.000: Duration of intellectual disability, also know as mental retarda
tion: Time unit";
label variable adura14a "
AHS.313_02.000: Duration (in years) of intellectual disability, also known as me
ntal retardation, recode 1";
label variable adurb14a "
AHS.313_02.000: Duration of intellectual disability, also known as mental retard
ation, recode 2";
label variable achrc14a "
AHS.313_02.000: Intellectual disability, also known as mental retardation condit
ion status recode";
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
AHS.322_02.000: Duration (in years) of nervous system/sensory organ condition, r
ecode 1";
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
label variable othcigev "
AHB.085_00.010: Ever smoked tobacco products, OTHER than cigarettes";
label variable othciged "
AHB.085_00.020: Smoke freq: everyday/some days/rarely/not at all (other than cig
arettes)";
label variable smklesev "AHB.085_00.030: Ever used smokeless tobacco products";
label variable smklesed "
AHB.085_00.040: Smokeless tobacco freq: everyday/some days/rarely/not at all";
label variable toblasyr "
AHB.085_00.050: Using any tobacco product, around this time last year";
label variable tobqtyr  "
AHB.085_00.060: Tried quit all tobacco products 1+ days, past 12 m";
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
label variable anouspl1 "
AAU.050_01.010: Doesn't need doctor/haven't had problems";
label variable anouspl2 "AAU.050_02.010: Doesn't like/trust/believe in doctors";
label variable anouspl3 "AAU.050_03.010: Doesn't know where to go";
label variable anouspl4 "AAU.050_04.010: Previous doctor is not available/moved
";
label variable anouspl5 "AAU.050_05.010: Too expensive/no insurance/cost";
label variable anouspl6 "AAU.050_06.010: Speak a different language";
label variable anouspl7 "
AAU.050_07.010: No care available/too far away/not convenient";
label variable anouspl8 "AAU.050_08.010: Put if off/didn't get around to it";
label variable anouspl9 "AAU.050_09.010: Other reason no usual place of care";
label variable aprvtryr "
AAU.051_00.010: Trouble finding a doctor/provider, past 12 m";
label variable aprvtrfd "AAU.053_00.010: Able to find doctor/provider, past 12 m
";
label variable adrnanp  "
AAU.057_00.010: Doctor's office not accept you as new patient, past 12 m";
label variable adrnai   "
AAU.059_00.010: Doctor's office not accept your health insurance, past 12 m";
label variable ahcdlyr1 "
AAU.061_01.000: Couldn't get through on phone, past 12 m";
label variable ahcdlyr2 "
AAU.061_02.000: Couldn't get appointment soon enough, past 12 m";
label variable ahcdlyr3 "
AAU.061_03.000: Wait too long in doctor's office, past 12 m";
label variable ahcdlyr4 "AAU.061_04.000: Not open when you could go, past 12 m";
label variable ahcdlyr5 "AAU.061_05.000: No transportation, past 12 m";
label variable ahcafyr1 "
AAU.111_01.000: Couldn't afford prescription medicine, past 12 m";
label variable ahcafyr2 "
AAU.111_02.000: Couldn't afford mental health care/counseling, past 12 m";
label variable ahcafyr3 "AAU.111_03.000: Couldn't afford dental care, past 12 m
";
label variable ahcafyr4 "AAU.111_04.000: Couldn't afford eyeglasses, past 12 m";
label variable ahcafyr5 "
AAU.111_05.010: Couldn't afford to see a specialist, past 12 m";
label variable ahcafyr6 "
AAU.111_06.010: Couldn't afford follow-up care, past 12 m";
label variable aworpay  "
AAU.113_00.010: Get sick or have accident, worried about paying medical bills";
label variable ahicomp  "
AAU.113_00.020: Health insurance coverage compared to a year ago";
label variable arxpr_1  "
AAU.127_01.010: Skipped medication doses to save money, past 12 m";
label variable arxpr_2  "
AAU.127_02.010: Took less medicine to save money, past 12 m";
label variable arxpr_3  "
AAU.127_03.010: Delayed filling a prescription to save money, past 12 m";
label variable arxpr_4  "
AAU.127_04.010: Asked doctor for lower cost medication to save money, past 12 m
";
label variable arxpr_5  "
AAU.127_05.010: Bought prescription drugs from another country to save money, pa
st 12 m";
label variable arxpr_6  "
AAU.127_06.010: Used alternative therapies to save money, past 12 m";
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
label variable aervisnd "AAU.243_00.010: ER visit at night or on weekend";
label variable aerhos   "AAU.245_00.010: ER visit resulted in hospital admission
";
label variable aerreas1 "
AAU.248_01.010: ER visit because didn't have another place to go";
label variable aerreas2 "
AAU.248_02.020: ER visit because doctors office or clinic was not open";
label variable aerreas3 "
AAU.248_03.030: ER visit because advised by health provider to go";
label variable aerreas4 "
AAU.248_04.040: ER visit because problem too serious for doctor's office/clinic
";
label variable aerreas5 "
AAU.248_05.050: ER visit because only hospital could help";
label variable aerreas6 "AAU.248_06.060: ER visit because it is closest provider
";
label variable aerreas7 "
AAU.248_07.070: ER visit because it is usual place to get care";
label variable aerreas8 "
AAU.248_08.080: Arrived at ER by ambulance/other emergency vehicle";
label variable aerrea1r "
AAU.248_01.010: ER visit because didn't have another place to go";
label variable aerrea2r "
AAU.248_02.020: ER visit because doctors office or clinic was not open";
label variable aerrea3r "
AAU.248_03.030: ER visit because advised by health provider to go";
label variable aerrea4r "
AAU.248_04.040: ER visit because problem too serious for doctor's office/clinic
";
label variable aerrea5r "
AAU.248_05.050: ER visit because only hospital could help";
label variable aerrea6r "AAU.248_06.060: ER visit because it is closest provider
";
label variable aerrea7r "
AAU.248_07.070: ER visit because it is usual place to get care";
label variable aerrea8r "
AAU.248_08.080: Arrived at ER by ambulance/other emergency vehicle";
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
label variable avislast "AAU.306_00.010: Place of last medical visit";
label variable alastyp1 "AAU.306_00.021: General doctor seen on last visit";
label variable alastyp2 "AAU.306_00.022: Specialist seen on last visit";
label variable alastyp3 "
AAU.306_00.023: Nurse practitioner/physician assistant seen on last visit";
label variable alastyp4 "
AAU.306_00.024: Other health provider seen on last visit";
label variable alastvrb "
AAU.306_00.025: Other Health professional seen (verbatim)";
label variable avisapn2 "AAU.307_01.010: Appointment wait time-number";
label variable avisapt2 "AAU.307_02.020: Appointment wait time-time period";
label variable awaitrmn "AAU.308_01.010: Time in waiting room-number";
label variable awaitrmt "AAU.308_02.020: Time in waiting room-time period";
label variable hit1a    "
AAU.309_00.010: Looked up health information on Internet, past 12 m";
label variable hit2a    "
AAU.309_00.020: Filled a prescription on Internet, past 12 m";
label variable hit3a    "
AAU.309_00.030: Scheduled medical appointment on Internet, past 12 m";
label variable hit4a    "
AAU.309_00.040: Communicated with health care provider by email, past 12 m";
label variable hit5a    "
AAU.309_00.050: Used chat groups to learn about health topics, past 12 m";
label variable shtflu2  "AAU.310_00.000: Flu shot past 12 m";
label variable ashflum2 "AAU.312_01.000: Month of most recent flu shot";
label variable ashfluy2 "AAU.312_02.000: Year of most recent flu shot";
label variable flushpg1 "
AAU.313_00.000: Flu shot before/during your current pregnancy, interviewed Jan-M
ar or Aug-Dec, 2012";
label variable flushpg2 "
AAU.314_00.000: Flu shot before/during/after a pregnancy";
label variable sprflu2  "AAU.315_00.000: Flu nasal spray past 12 m";
label variable aspflum2 "AAU.318_01.000: Month of most recent flu nasal spray";
label variable aspfluy2 "AAU.318_02.000: Year of most recent flu nasal spray";
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
label variable shingles "AAU.410_00.010: Ever had the Zoster or Shingles vaccine
";
label variable shttd    "AAU.420_00.010: Tetanus shot in the past 10 years";
label variable shttd05  "AAU.430_00.010: Tetanus shot given in 2005 or later";
label variable shttdap2 "
AAU.440_00.010: Vaccine included pertussis/whooping cough";
label variable hpvhrd   "AAU.442_00.010: Ever heard of HPV";
label variable shhpvhd1 "AAU.444_00.010: Ever heard of HPV vaccines or shots";
label variable shthpv1  "AAU.446_00.010: Ever received HPV shot/vaccine";
label variable shhpvdos "AAU.448_00.010: Number of HPV shots received";
label variable livev    "
AAU.450_00.010: Ever told you had any kind of chronic/long-term liver condition
";
label variable travel   "
AAU.460_00.010: Ever traveled outside USA since 1995 (Excluding Europe, Japan, A
ustralia, New Zealand, and Canada)";
label variable wrkhlth2 "
AAU.465_00.010: Work or volunteer in a health care setting";
label variable wrkdir   "AAU.470_00.010: Direct contact with patients";
label variable apsbpchk "
AAU.500_00.010: Blood pressure checked by doctor/nurse/health professional, past
 12 m";
label variable apschchk "
AAU.510_00.010: Cholesterol checked by doctor/nurse/health professional, past 12
 m";
label variable apsbschk "
AAU.520_00.010: Fasting test for high blood sugar/diabetes, past 12 m";
label variable apspap   "AAU.530_00.010: Pap smear/test, past 12 m";
label variable apsmam   "AAU.540_00.010: Mammogram, past 12 m";
label variable apscol   "AAU.550_00.010: Test for colon cancer, past 12 m";
label variable apsdiet  "
AAU.560_00.010: Doctor/health professional talked to you about diet, past 12 m";
label variable apssmkc  "
AAU.570_00.010: Doctor/health professional talked to you about smoking, past 12 
m";
label variable ltcfam   "
AAU.580_00.010: Have family member who needed ADL help for 1+ yrs";
label variable ltchelp  "AAU.582_00.010: How likely you will need ADL help";
label variable ltcwho1  "AAU.584_01.010: Family would provide ADL help";
label variable ltcwho2  "AAU.584_02.010: Hire someone to provide ADL help";
label variable ltcwho3  "
AAU.584_03.010: Home health care organization would provide ADL help";
label variable ltcwho4  "
AAU.584_04.010: Nursing home/assisted living would provide ADL help";
label variable ltcwho5  "AAU.584_05.010: Other would provide ADL help";
label variable aindins  "
AAU.600_00.010: Tried to purchase health insurance directly, past 3 yrs";
label variable aindprch "
AAU.600_00.020: Purchased health insurance directly, past 3 yrs";
label variable aindwho  "
AAU.600_00.030: For whom was health insurance purchased, past 3 yrs";
label variable ainddif1 "
AAU.600_00.040: How difficult to find health insurance for coverage needed, past
 3 yrs";
label variable ainddif2 "
AAU.600_00.050: How difficult to find affordable health insurance, past 3 yrs";
label variable aindeny1 "AAU.600_01.060: Turned down for coverage, past 3 yrs";
label variable aindeny2 "
AAU.600_02.060: Charged higher price for coverage because of health, past 3 yrs
";
label variable aindeny3 "
AAU.600_03.060: Specific health problem excluded from coverage, past 3 yrs";
label variable aindnot1 "AAU.601_01.070: Didn’t buy plan because turned down";
label variable aindnot2 "AAU.601_02.070: Didn’t buy plan because of cost";
label variable aindnot3 "
AAU.601_03.070: Didn’t buy plan because of pre-existing condition";
label variable aindnot4 "
AAU.601_04.070: Didn’t buy plan because got health insurance from other source";
label variable aindnot5 "AAU.601_05.070: Other reason didn't buy plan";
label variable hivtst1  "AAU.700_00.000: Ever been tested for HIV";

label variable awebuse  "AWB.010_00.000: Internet use";
label variable awebofno "AWB.020_01.000: Frequency internet use: # of units";
label variable aweboftp "AWB.020_02.000: Frequency internet use: Time units";
label variable awebeml  "AWB.030_00.000: Email use";
label variable awebmno  "AWB.050_01.000: Frequency email use: # of units";
label variable awebmtp  "AWB.050_02.000: Frequency email use: Time units";

* DEFINE VALUE LABELS FOR REPORTS;

label define sap001x
   10       "10 Household"
   20       "20 Person"
   25       "25 Income Imputation"
   30       "30 Sample Adult"
   31       "31 Sample Adult Cancer"
   34       "34 Adult Alternative Medicine"
   38       "38 Functioning and Disability"
   39       "39 Adult Disability Questions Test"
   40       "40 Sample Child"
   44       "44 Child Alternative Medicine"
   49       "49 Child Disability Questions Test"
   60       "60 Family"
   63       "63 Family Disability Questions Test"
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
   1        "1 Sample Adult selected to receive AFD section"
   2        "2 Sample Adult not selected to receive AFD section"
;
label define sap020x
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
label define sap021x
   1        "1 Physical or mental condition prohibits responding"
   2        "2 Sample adult is able to respond"
   3        "3 Unknown"
;
label define sap022x
   1        "1 Yes"
   2        "2 No"
;
label define sap023x
   1        "1 Relative who lives in household"
   2        "2 Relative who doesn't live in household"
   3        "3 Other caregiver"
   4        "4 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap024x
   1        "1 Started Sample Adult Core 2+ weeks after the initial interview"
   2        "
2 Started Sample Adult Core less than 2 weeks after the initial interview"
;
label define sap025x
   1        "
1 Families selected to receive ADB (sample adults) and CDB (sample children 1-17
 years) sections"
   2        "
2 Families selected to receive FDB (all persons 1 year and older) sections"
;
label define sap026x
   1        "1 Working for pay at a job or business"
   2        "2 With a job or business but not at work"
   3        "3 Looking for work"
   4        "4 Working, but not for pay, at a family-owned job or business"
   5        "5 Not working at a job or business and not looking for work"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap027x
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
label define sap028x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap033x
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
label define sap035x
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
label define sap036x
   00       "00 Less than 1 year"
   35       "35 35 or more years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap041x
   0        "0 Had job last week"
   1        "1 No job last week, had job past 12 months"
   2        "2 No job last week, no job past 12 months"
   3        "3 Never worked"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap111x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap142x
   85       "85 85+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap172x
   1        "1 Yes"
   2        "2 No"
   3        "3 Borderline"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap175x
   00       "00 Within past year"
   85       "85 85+ years"
   96       "96 1+ year(s) with diabetes and age is 85+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap226x
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
label define sap230x
   1        "1 ALL of the time"
   2        "2 MOST of the time"
   3        "3 SOME of the time"
   4        "4 A LITTLE of the time"
   5        "5 NONE of the time"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap236x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap290x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap299x
   1        "1 Mild"
   2        "2 Moderate"
   3        "3 Severe"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap300x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap305x
   1        "1 No problem"
   2        "2 A small problem"
   3        "3 A moderate problem"
   4        "4 A big problem"
   5        "5 A very big problem"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap373x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap380x
   1        "1 Very helpful"
   2        "2 Somewhat helpful"
   3        "3 Not helpful"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap381x
   000      "000 None"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap385x
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
label define sap397x
   1        "1 Limited in any way"
   2        "2 Not limited in any way"
   3        "3 Unknown if limited"
;
label define sap434x
   95       "95 95+"
   96       "96 Since birth"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap435x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   6        "6 Since birth"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap436x
   00       "00 Less than 1 year"
   85       "85 85+ years"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap437x
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap438x
   1        "1 Chronic"
   2        "2 Not chronic"
   9        "9 Unknown if chronic"
;
label define sap614x
   1        "1 At least one condition causing functional limitation is chronic"
   2        "2 No condition causing functional limitation"
   9        "9 Unknown if any condition causing functional limitation is chronic
"
;
label define sap615x
   0        "0 Not limited in any way (including unknown if limited)"
   1        "1 Limited; caused by at least one chronic condition"
   2        "2 Limited; not caused by chronic condition"
   3        "3 Limited; unknown if condition is chronic"
;
label define sap617x
   85       "85 85 years or older"
   96       "96 Never smoked regularly"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap618x
   1        "1 Every day"
   2        "2 Some days"
   3        "3 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap619x
   1        "1 Current every day smoker"
   2        "2 Current some day smoker"
   3        "3 Former smoker"
   4        "4 Never smoker"
   5        "5 Smoker, current status unknown"
   9        "9 Unknown if ever smoked"
;
label define sap620x
   95       "95 95+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap621x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap622x
   00       "00 Less than 1 year"
   70       "70 70+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap623x
   95       "95 95+ cigarettes"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap624x
   00       "00 None"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap629x
   1        "1 Every day"
   2        "2 Some days"
   3        "3 Rarely"
   4        "4 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap634x
   000      "000 Never"
   996      "996 Unable to do this type activity"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap635x
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
label define sap636x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do vigorous activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap638x
   1        "1 Minutes"
   2        "2 Hours"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap642x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do light or moderate activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap648x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do strength activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap651x
   000      "000 Never"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap652x
   0        "0 Never/None"
   1        "1 Week"
   2        "2 Month"
   3        "3 Year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap653x
   00       "00 Less than one day per week"
   95       "95 Did not drink in past year"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap654x
   000      "000 Never/none"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap655x
   95       "95 95+ drinks"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap656x
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
label define sap658x
   0        "0 Never/None"
   1        "1 Per week"
   2        "2 Per month"
   3        "3 Per year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap660x
   96       "96 Not available"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap661x
   996      "996 Not available"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap663x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap664x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap665x
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
label define sap667x
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
label define sap670x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap682x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t' know"
;
label define sap694x
   1        "1 Very worried"
   2        "2 Somewhat worried"
   3        "3 Not at all worried"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap702x
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
label define sap713x
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
label define sap734x
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
label define sap737x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap739x
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
label define sap745x
   00       "00 Same day/walk-in appt/no appt made"
   96       "
96 Routine appt/appt arranged on previous visit/rec'd appt reminder card"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap746x
   1        "1 Days"
   2        "2 Weeks"
   3        "3 Months"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap747x
   00       "00 No time"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don’t know"
;
label define sap748x
   1        "1 Minutes"
   2        "2 Hours"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap755x
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
label define sap756x
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define sap757x
   1        "1 Before this pregnancy"
   2        "2 During this pregnancy"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap758x
   1        "1 Before this pregnancy"
   2        "2 During this pregnancy"
   3        "3 After this pregnancy"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap768x
   1        "1 Received at least 3 doses"
   2        "2 Received less than 3 doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap770x
   96       "96 Received all shots"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap774x
   1        "1 Yes-included pertussis"
   2        "2 No-did not include pertussis"
   3        "3 Doctor did not say"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap777x
   1        "1 Yes"
   2        "2 No"
   3        "3 Doctor refused when asked"
   7        "7 Refused"
   8        "8 Not Ascertained"
   9        "9 Don't know"
;
label define sap778x
   96       "96 All shots"
   97       "97 Refused"
   98       "98 Not Ascertained"
   99       "99 Don't know"
;
label define sap792x
   1        "1 Very likely"
   2        "2 Somewhat likely"
   3        "3 Somewhat unlikely"
   4        "4 Very unlikely"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap800x
   1        "1 Self"
   2        "2 Someone else in family"
   3        "3 Both"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap801x
   1        "1 Very difficult"
   2        "2 Somewhat difficult"
   3        "3 Not at all difficult"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap802x
   1        "1 Very difficult"
   2        "2 Somewhat difficult"
   3        "3 Not at all difficult"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap814x
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

label values afd_flg   sap019x;

label values r_maritl  sap020x;

label values proxysa   sap021x;   label values prox1     sap022x;
label values prox2     sap023x;   label values lateinta  sap024x;

label values fdrn_flg  sap025x;

label values doinglwa  sap026x;   label values whynowka  sap027x;
label values everwrk   sap028x;   label values wrkcata   sap033x;
label values businc1a  sap028x;   label values locall1a  sap035x;
label values yrswrkpa  sap036x;   label values wrklongh  sap028x;
label values hourpda   sap028x;   label values pdsicka   sap028x;
label values onejob    sap028x;   label values wrklyr4   sap041x;
label values schoolyr  sap028x;

label values hypev     sap028x;   label values hypdifv   sap028x;
label values hypyr     sap028x;   label values chdev     sap028x;
label values chdyr     sap028x;   label values angev     sap028x;
label values miev      sap028x;   label values hrtev     sap028x;
label values hrtyr     sap028x;   label values strev     sap028x;
label values ephev     sap028x;   label values copdev    sap028x;
label values aspmedev  sap028x;   label values aspmedad  sap028x;
label values aspmdmed  sap028x;   label values asponown  sap028x;
label values aasmev    sap028x;   label values aasstill  sap028x;
label values aasmyr    sap028x;   label values aaseryr1  sap028x;
label values ulcev     sap028x;   label values ulcyr     sap028x;
label values chlev     sap028x;   label values chlyr     sap028x;
label values aflupnev  sap028x;   label values aflupnyr  sap028x;
label values astrepev  sap028x;   label values astrepyr  sap028x;
label values prcirev   sap028x;   label values prciryr   sap028x;
label values urev      sap028x;   label values uryr      sap028x;
label values phobiaev  sap028x;   label values phobiayr  sap028x;
label values addhyp1   sap028x;   label values bipdis    sap028x;
label values adeprsev  sap028x;   label values adeprsyr  sap028x;
label values mhdothev  sap028x;   label values mhdothyr  sap028x;
label values respalyr  sap028x;   label values dgstalyr  sap028x;
label values sknalyr   sap028x;   label values othalyr   sap028x;
label values acidryr   sap028x;   label values afevryr   sap028x;
label values acoldyr   sap028x;   label values anausyr   sap028x;
label values athothyr  sap028x;   label values immothyr  sap028x;
label values aheadyr   sap028x;   label values memlosyr  sap028x;
label values neuroyr   sap028x;   label values aabdomyr  sap028x;
label values spnyr     sap028x;   label values denyr     sap028x;
label values amusclyr  sap028x;   label values apnothyr  sap028x;
label values alctobyr  sap028x;   label values subabyr   sap028x;
label values aovrwtyr  sap028x;   label values sknyr1    sap028x;
label values fatigyr   sap028x;   label values fatyr     sap028x;
label values insyr     sap028x;   label values anxnwyr   sap028x;
label values astresyr  sap028x;   label values canev     sap028x;
label values cnkind1   sap111x;   label values cnkind2   sap111x;
label values cnkind3   sap111x;   label values cnkind4   sap111x;
label values cnkind5   sap111x;   label values cnkind6   sap111x;
label values cnkind7   sap111x;   label values cnkind8   sap111x;
label values cnkind9   sap111x;   label values cnkind10  sap111x;
label values cnkind11  sap111x;   label values cnkind12  sap111x;
label values cnkind13  sap111x;   label values cnkind14  sap111x;
label values cnkind15  sap111x;   label values cnkind16  sap111x;
label values cnkind17  sap111x;   label values cnkind18  sap111x;
label values cnkind19  sap111x;   label values cnkind20  sap111x;
label values cnkind21  sap111x;   label values cnkind22  sap111x;
label values cnkind23  sap111x;   label values cnkind24  sap111x;
label values cnkind25  sap111x;   label values cnkind26  sap111x;
label values cnkind27  sap111x;   label values cnkind28  sap111x;
label values cnkind29  sap111x;   label values cnkind30  sap111x;
label values cnkind31  sap111x;   label values canage1   sap142x;
label values canage2   sap142x;   label values canage3   sap142x;
label values canage4   sap142x;   label values canage5   sap142x;
label values canage6   sap142x;   label values canage7   sap142x;
label values canage8   sap142x;   label values canage9   sap142x;
label values canage10  sap142x;   label values canage11  sap142x;
label values canage12  sap142x;   label values canage13  sap142x;
label values canage14  sap142x;   label values canage15  sap142x;
label values canage16  sap142x;   label values canage17  sap142x;
label values canage18  sap142x;   label values canage19  sap142x;
label values canage20  sap142x;   label values canage21  sap142x;
label values canage22  sap142x;   label values canage23  sap142x;
label values canage24  sap142x;   label values canage25  sap142x;
label values canage26  sap142x;   label values canage27  sap142x;
label values canage28  sap142x;   label values canage29  sap142x;
label values canage30  sap142x;   label values dibev     sap172x;
label values dibpre1   sap028x;   label values dibage    sap142x;
label values difage2   sap175x;   label values insln     sap028x;
label values dibpill   sap028x;   label values ahayfyr   sap028x;
label values sinyr     sap028x;   label values cbrchyr   sap028x;
label values kidwkyr   sap028x;   label values livyr     sap028x;
label values jntsymp   sap028x;   label values jmthp1    sap111x;
label values jmthp2    sap111x;   label values jmthp3    sap111x;
label values jmthp4    sap111x;   label values jmthp5    sap111x;
label values jmthp6    sap111x;   label values jmthp7    sap111x;
label values jmthp8    sap111x;   label values jmthp9    sap111x;
label values jmthp10   sap111x;   label values jmthp11   sap111x;
label values jmthp12   sap111x;   label values jmthp13   sap111x;
label values jmthp14   sap111x;   label values jmthp15   sap111x;
label values jmthp16   sap111x;   label values jmthp17   sap111x;
label values jntchr    sap028x;   label values jnthp     sap028x;
label values arth1     sap028x;   label values arthlmt   sap028x;
label values arthtyp1  sap111x;   label values arthtyp2  sap111x;
label values arthtyp3  sap111x;   label values arthtyp4  sap111x;
label values arthtyp5  sap111x;   label values arthtyp6  sap111x;
label values paineck   sap028x;   label values painlb    sap028x;
label values painleg   sap028x;   label values painface  sap028x;
label values amigr     sap028x;   label values acold2w   sap028x;
label values aintil2w  sap028x;   label values pregnow   sap028x;
label values pregflyr  sap028x;   label values mensyr    sap028x;
label values menoyr    sap028x;   label values gynyr     sap028x;
label values prostyr   sap028x;   label values hraidnow  sap028x;
label values hraidev   sap028x;   label values ahearst1  sap226x;
label values avision   sap028x;   label values ablind    sap028x;
label values lupprt    sap028x;   label values sad       sap230x;
label values nervous   sap230x;   label values restless  sap230x;
label values hopeless  sap230x;   label values effort    sap230x;
label values worthls   sap230x;   label values mhamtmo   sap236x;

label values vslvyr    sap028x;   label values vslswyr   sap028x;
label values vslspyr   sap028x;   label values vsllgyr   sap028x;
label values vslspec   sap028x;   label values vslever   sap028x;
label values vslhpd    sap028x;   label values vsldgtp1  sap111x;
label values vsldgtp2  sap111x;   label values vsldgtp3  sap111x;
label values vsldgtp4  sap111x;   label values vslvdg01  sap111x;
label values vslvdg02  sap111x;   label values vslvdg03  sap111x;
label values vslvdg04  sap111x;   label values vslvdg05  sap111x;
label values vslvdg06  sap111x;   label values vslvdg07  sap111x;
label values vslvdg08  sap111x;   label values vslvdg09  sap111x;
label values vslvdg10  sap111x;   label values vslvdg11  sap111x;
label values vslswd01  sap111x;   label values vslswd02  sap111x;
label values vslswd03  sap111x;   label values vslswd04  sap111x;
label values vslswd05  sap111x;   label values vslswd06  sap111x;
label values vslswd07  sap111x;   label values vslswd08  sap111x;
label values vslswd09  sap111x;   label values vslswd10  sap111x;
label values vslspd01  sap111x;   label values vslspd02  sap111x;
label values vslspd03  sap111x;   label values vslspd04  sap111x;
label values vslspd05  sap111x;   label values vslspd06  sap111x;
label values vslspd07  sap111x;   label values vslspd08  sap111x;
label values vslspd09  sap111x;   label values vslspd10  sap111x;
label values vsllgd01  sap111x;   label values vsllgd02  sap111x;
label values vsllgd03  sap111x;   label values vsllgd04  sap111x;
label values vsllgd05  sap111x;   label values vsllgd06  sap111x;
label values vsllgd07  sap111x;   label values vsllgd08  sap111x;
label values vsllgd09  sap111x;   label values vsllgd10  sap111x;
label values vsllgd11  sap111x;   label values vslvdys   sap290x;
label values vslswdys  sap290x;   label values vslspdys  sap290x;
label values vsllgdys  sap290x;   label values vslv1wk   sap028x;
label values vslsw1wk  sap028x;   label values vslsp1wk  sap028x;
label values vsllg1wk  sap028x;   label values vslstutt  sap028x;
label values vslstdeg  sap299x;   label values vsllgfam  sap300x;
label values vslvage   sap290x;   label values vslswage  sap290x;
label values vslspage  sap290x;   label values vsllgage  sap290x;
label values vslvprb   sap305x;   label values vslswprb  sap305x;
label values vslspprb  sap305x;   label values vsllgprb  sap305x;
label values vslvslp   sap028x;   label values vslvpev   sap028x;
label values vslswslp  sap028x;   label values vslswpev  sap028x;
label values vslspslp  sap028x;   label values vslsppev  sap028x;
label values vsllgslp  sap028x;   label values vsllgpev  sap028x;
label values vslvtrt   sap028x;   label values vslvtr01  sap111x;
label values vslvtr02  sap111x;   label values vslvtr03  sap111x;
label values vslvtr04  sap111x;   label values vslvtr05  sap111x;
label values vslvtr06  sap111x;   label values vslvtr07  sap111x;
label values vslvtr08  sap111x;   label values vslvtr09  sap111x;
label values vslvtr10  sap111x;   label values vslvtr11  sap111x;
label values vslswtrt  sap028x;   label values vslswt01  sap111x;
label values vslswt02  sap111x;   label values vslswt03  sap111x;
label values vslswt04  sap111x;   label values vslswt05  sap111x;
label values vslswt06  sap111x;   label values vslswt07  sap111x;
label values vslswt08  sap111x;   label values vslswt09  sap111x;
label values vslswt10  sap111x;   label values vslswt11  sap111x;
label values vslsptrt  sap028x;   label values vslspt01  sap111x;
label values vslspt02  sap111x;   label values vslspt03  sap111x;
label values vslspt04  sap111x;   label values vslspt05  sap111x;
label values vslspt06  sap111x;   label values vslspt07  sap111x;
label values vslspt08  sap111x;   label values vslspt09  sap111x;
label values vslspt10  sap111x;   label values vslspt11  sap111x;
label values vsllgtrt  sap028x;   label values vsllgt01  sap111x;
label values vsllgt02  sap111x;   label values vsllgt03  sap111x;
label values vsllgt04  sap111x;   label values vsllgt05  sap111x;
label values vsllgt06  sap111x;   label values vsllgt07  sap111x;
label values vsllgt08  sap111x;   label values vsllgt09  sap111x;
label values vsllgt10  sap111x;   label values vsllgt11  sap111x;
label values vslvsoc   sap028x;   label values vslswsoc  sap028x;
label values vslspsoc  sap028x;   label values vsllgsoc  sap028x;
label values vslvsw    sap028x;   label values vslswsw   sap028x;
label values vslspsw   sap028x;   label values vsllgsw   sap028x;
label values vslvcom   sap373x;   label values vslswcom  sap373x;
label values vslspcom  sap373x;   label values vsllgcom  sap373x;
label values vslintyr  sap300x;   label values vslintcn  sap300x;
label values vslintpr  sap300x;   label values vslinthp  sap380x;

label values wkdayr    sap381x;   label values beddayr   sap381x;
label values ahstatyr  sap373x;   label values speceq    sap028x;
label values flwalk    sap385x;   label values flclimb   sap385x;
label values flstand   sap385x;   label values flsit     sap385x;
label values flstoop   sap385x;   label values flreach   sap385x;
label values flgrasp   sap385x;   label values flcarry   sap385x;
label values flpush    sap385x;   label values flshop    sap385x;
label values flsocl    sap385x;   label values flrelax   sap385x;
label values fla1ar    sap397x;   label values aflhca1   sap111x;
label values aflhca2   sap111x;   label values aflhca3   sap111x;
label values aflhca4   sap111x;   label values aflhca5   sap111x;
label values aflhca6   sap111x;   label values aflhca7   sap111x;
label values aflhca8   sap111x;   label values aflhca9   sap111x;
label values aflhca10  sap111x;   label values aflhca11  sap111x;
label values aflhca12  sap111x;   label values aflhca13  sap111x;
label values alhca14a  sap111x;   label values aflhca15  sap111x;
label values aflhca16  sap111x;   label values aflhca17  sap111x;
label values aflhca18  sap111x;   label values aflhc19_  sap111x;
label values aflhc20_  sap111x;   label values aflhc21_  sap111x;
label values aflhc22_  sap111x;   label values aflhc23_  sap111x;
label values aflhc24_  sap111x;   label values aflhc25_  sap111x;
label values aflhc26_  sap111x;   label values aflhc27_  sap111x;
label values aflhc28_  sap111x;   label values aflhc29_  sap111x;
label values aflhc30_  sap111x;   label values aflhc31_  sap111x;
label values aflhc32_  sap111x;   label values aflhc33_  sap111x;
label values aflhc34_  sap111x;   label values aflhca90  sap111x;
label values aflhca91  sap111x;   label values altime1   sap434x;
label values alunit1   sap435x;   label values aldura1   sap436x;
label values aldurb1   sap437x;   label values alchrc1   sap438x;
label values altime2   sap434x;   label values alunit2   sap435x;
label values aldura2   sap436x;   label values aldurb2   sap437x;
label values alchrc2   sap438x;   label values altime3   sap434x;
label values alunit3   sap435x;   label values aldura3   sap436x;
label values aldurb3   sap437x;   label values alchrc3   sap438x;
label values altime4   sap434x;   label values alunit4   sap435x;
label values aldura4   sap436x;   label values aldurb4   sap437x;
label values alchrc4   sap438x;   label values altime5   sap434x;
label values alunit5   sap435x;   label values aldura5   sap436x;
label values aldurb5   sap437x;   label values alchrc5   sap438x;
label values altime6   sap434x;   label values alunit6   sap435x;
label values aldura6   sap436x;   label values aldurb6   sap437x;
label values alchrc6   sap438x;   label values altime7   sap434x;
label values alunit7   sap435x;   label values aldura7   sap436x;
label values aldurb7   sap437x;   label values alchrc7   sap438x;
label values altime8   sap434x;   label values alunit8   sap435x;
label values aldura8   sap436x;   label values aldurb8   sap437x;
label values alchrc8   sap438x;   label values altime9   sap434x;
label values alunit9   sap435x;   label values aldura9   sap436x;
label values aldurb9   sap437x;   label values alchrc9   sap438x;
label values altime10  sap434x;   label values alunit10  sap435x;
label values aldura10  sap436x;   label values aldurb10  sap437x;
label values alchrc10  sap438x;   label values altime11  sap434x;
label values alunit11  sap435x;   label values aldura11  sap436x;
label values aldurb11  sap437x;   label values alchrc11  sap438x;
label values altime12  sap434x;   label values alunit12  sap435x;
label values aldura12  sap436x;   label values aldurb12  sap437x;
label values alchrc12  sap438x;   label values altime13  sap434x;
label values alunit13  sap435x;   label values aldura13  sap436x;
label values aldurb13  sap437x;   label values alchrc13  sap438x;
label values atime14a  sap434x;   label values aunit14a  sap435x;
label values adura14a  sap436x;   label values adurb14a  sap437x;
label values achrc14a  sap438x;   label values altime15  sap434x;
label values alunit15  sap435x;   label values aldura15  sap436x;
label values aldurb15  sap437x;   label values alchrc15  sap438x;
label values altime16  sap434x;   label values alunit16  sap435x;
label values aldura16  sap436x;   label values aldurb16  sap437x;
label values alchrc16  sap438x;   label values altime17  sap434x;
label values alunit17  sap435x;   label values aldura17  sap436x;
label values aldurb17  sap437x;   label values alchrc17  sap438x;
label values altime18  sap434x;   label values alunit18  sap435x;
label values aldura18  sap436x;   label values aldurb18  sap437x;
label values alchrc18  sap438x;   label values altime19  sap434x;
label values alunit19  sap435x;   label values aldura19  sap436x;
label values aldurb19  sap437x;   label values alchrc19  sap438x;
label values altime20  sap434x;   label values alunit20  sap435x;
label values aldura20  sap436x;   label values aldurb20  sap437x;
label values alchrc20  sap438x;   label values altime21  sap434x;
label values alunit21  sap435x;   label values aldura21  sap436x;
label values aldurb21  sap437x;   label values alchrc21  sap438x;
label values altime22  sap434x;   label values alunit22  sap435x;
label values aldura22  sap436x;   label values aldurb22  sap437x;
label values alchrc22  sap438x;   label values altime23  sap434x;
label values alunit23  sap435x;   label values aldura23  sap436x;
label values aldurb23  sap437x;   label values alchrc23  sap438x;
label values altime24  sap434x;   label values alunit24  sap435x;
label values aldura24  sap436x;   label values aldurb24  sap437x;
label values alchrc24  sap438x;   label values altime25  sap434x;
label values alunit25  sap435x;   label values aldura25  sap436x;
label values aldurb25  sap437x;   label values alchrc25  sap438x;
label values altime26  sap434x;   label values alunit26  sap435x;
label values aldura26  sap436x;   label values aldurb26  sap437x;
label values alchrc26  sap438x;   label values altime27  sap434x;
label values alunit27  sap435x;   label values aldura27  sap436x;
label values aldurb27  sap437x;   label values alchrc27  sap438x;
label values altime28  sap434x;   label values alunit28  sap435x;
label values aldura28  sap436x;   label values aldurb28  sap437x;
label values alchrc28  sap438x;   label values altime29  sap434x;
label values alunit29  sap435x;   label values aldura29  sap436x;
label values aldurb29  sap437x;   label values alchrc29  sap438x;
label values altime30  sap434x;   label values alunit30  sap435x;
label values aldura30  sap436x;   label values aldurb30  sap437x;
label values alchrc30  sap438x;   label values altime31  sap434x;
label values alunit31  sap435x;   label values aldura31  sap436x;
label values aldurb31  sap437x;   label values alchrc31  sap438x;
label values altime32  sap434x;   label values alunit32  sap435x;
label values aldura32  sap436x;   label values aldurb32  sap437x;
label values alchrc32  sap438x;   label values altime33  sap434x;
label values alunit33  sap435x;   label values aldura33  sap436x;
label values aldurb33  sap437x;   label values alchrc33  sap438x;
label values altime34  sap434x;   label values alunit34  sap435x;
label values aldura34  sap436x;   label values aldurb34  sap437x;
label values alchrc34  sap438x;   label values altime90  sap434x;
label values alunit90  sap435x;   label values aldura90  sap436x;
label values aldurb90  sap437x;   label values alchrc90  sap438x;
label values altime91  sap434x;   label values alunit91  sap435x;
label values aldura91  sap436x;   label values aldurb91  sap437x;
label values alchrc91  sap438x;   label values alcndrt   sap614x;
label values alchronr  sap615x;

label values smkev     sap028x;   label values smkreg    sap617x;
label values smknow    sap618x;   label values smkstat2  sap619x;
label values smkqtno   sap620x;   label values smkqttp   sap621x;
label values smkqty    sap622x;   label values cigsda1   sap623x;
label values cigdamo   sap624x;   label values cigsda2   sap623x;
label values cigsday   sap623x;   label values cigqtyr   sap028x;
label values othcigev  sap028x;   label values othciged  sap629x;
label values smklesev  sap028x;   label values smklesed  sap629x;
label values toblasyr  sap028x;   label values tobqtyr   sap028x;
label values vigno     sap634x;   label values vigtp     sap635x;
label values vigfreqw  sap636x;   label values viglngno  sap290x;
label values viglngtp  sap638x;   label values vigmin    sap290x;
label values modno     sap634x;   label values modtp     sap635x;
label values modfreqw  sap642x;   label values modlngno  sap290x;
label values modlngtp  sap638x;   label values modmin    sap290x;
label values strngno   sap634x;   label values strngtp   sap635x;
label values strfreqw  sap648x;   label values alc1yr    sap028x;
label values alclife   sap028x;   label values alc12mno  sap651x;
label values alc12mtp  sap652x;   label values alc12mwk  sap653x;
label values alc12myr  sap654x;   label values alcamt    sap655x;
label values alcstat   sap656x;   label values alc5upno  sap654x;
label values alc5uptp  sap658x;   label values alc5upyr  sap654x;
label values aheight   sap660x;   label values aweightp  sap661x;
label values sleep     sap663x;

label values ausualpl  sap664x;   label values aplkind   sap665x;
label values ahcplrou  sap028x;   label values ahcplknd  sap667x;
label values ahcchgyr  sap028x;   label values ahcchghi  sap028x;
label values anouspl1  sap670x;   label values anouspl2  sap670x;
label values anouspl3  sap670x;   label values anouspl4  sap670x;
label values anouspl5  sap670x;   label values anouspl6  sap670x;
label values anouspl7  sap670x;   label values anouspl8  sap670x;
label values anouspl9  sap670x;   label values aprvtryr  sap028x;
label values aprvtrfd  sap300x;   label values adrnanp   sap300x;
label values adrnai    sap682x;   label values ahcdlyr1  sap028x;
label values ahcdlyr2  sap028x;   label values ahcdlyr3  sap028x;
label values ahcdlyr4  sap028x;   label values ahcdlyr5  sap028x;
label values ahcafyr1  sap028x;   label values ahcafyr2  sap028x;
label values ahcafyr3  sap028x;   label values ahcafyr4  sap028x;
label values ahcafyr5  sap300x;   label values ahcafyr6  sap300x;
label values aworpay   sap694x;   label values ahicomp   sap373x;
label values arxpr_1   sap028x;   label values arxpr_2   sap300x;
label values arxpr_3   sap028x;   label values arxpr_4   sap028x;
label values arxpr_5   sap028x;   label values arxpr_6   sap028x;
label values adnlong2  sap702x;   label values ahcsyr1   sap028x;
label values ahcsyr2   sap028x;   label values ahcsyr3   sap028x;
label values ahcsyr4   sap028x;   label values ahcsyr5   sap028x;
label values ahcsyr6   sap028x;   label values ahcsyr7   sap028x;
label values ahcsyr8   sap028x;   label values ahcsyr9   sap028x;
label values ahcsyr10  sap028x;   label values ahernoy2  sap713x;
label values aervisnd  sap028x;   label values aerhos    sap028x;
label values aerreas1  sap028x;   label values aerreas2  sap028x;
label values aerreas3  sap028x;   label values aerreas4  sap028x;
label values aerreas5  sap028x;   label values aerreas6  sap028x;
label values aerreas7  sap300x;   label values aerreas8  sap300x;
label values aerrea1r  sap028x;   label values aerrea2r  sap028x;
label values aerrea3r  sap028x;   label values aerrea4r  sap028x;
label values aerrea5r  sap028x;   label values aerrea6r  sap028x;
label values aerrea7r  sap300x;   label values aerrea8r  sap300x;
label values ahchyr    sap028x;   label values ahchmoyr  sap663x;
label values ahchnoy2  sap734x;   label values ahcnoyr2  sap713x;
label values asrgyr    sap028x;   label values asrgnoyr  sap737x;
label values amdlongr  sap702x;   label values avislast  sap739x;
label values alastyp1  sap111x;   label values alastyp2  sap111x;
label values alastyp3  sap111x;   label values alastyp4  sap111x;
label values avisapn2  sap745x;   label values avisapt2  sap746x;
label values awaitrmn  sap747x;   label values awaitrmt  sap748x;
label values hit1a     sap300x;   label values hit2a     sap028x;
label values hit3a     sap028x;   label values hit4a     sap300x;
label values hit5a     sap300x;   label values shtflu2   sap028x;
label values ashflum2  sap755x;   label values ashfluy2  sap756x;
label values flushpg1  sap757x;   label values flushpg2  sap758x;
label values sprflu2   sap028x;   label values aspflum2  sap755x;
label values aspfluy2  sap756x;   label values shtpnuyr  sap028x;
label values apox      sap028x;   label values apox12mo  sap028x;
label values ahep      sap028x;   label values ahepliv   sap028x;
label values shthepb   sap028x;   label values shepdos   sap768x;
label values shthepa   sap028x;   label values shepanum  sap770x;
label values shingles  sap028x;   label values shttd     sap028x;
label values shttd05   sap028x;   label values shttdap2  sap774x;
label values hpvhrd    sap028x;   label values shhpvhd1  sap028x;
label values shthpv1   sap777x;   label values shhpvdos  sap778x;
label values livev     sap028x;   label values travel    sap028x;
label values wrkhlth2  sap028x;   label values wrkdir    sap028x;
label values apsbpchk  sap028x;   label values apschchk  sap028x;
label values apsbschk  sap028x;   label values apspap    sap028x;
label values apsmam    sap028x;   label values apscol    sap300x;
label values apsdiet   sap028x;   label values apssmkc   sap300x;
label values ltcfam    sap300x;   label values ltchelp   sap792x;
label values ltcwho1   sap670x;   label values ltcwho2   sap670x;
label values ltcwho3   sap670x;   label values ltcwho4   sap670x;
label values ltcwho5   sap670x;   label values aindins   sap300x;
label values aindprch  sap300x;   label values aindwho   sap800x;
label values ainddif1  sap801x;   label values ainddif2  sap802x;
label values aindeny1  sap300x;   label values aindeny2  sap300x;
label values aindeny3  sap300x;   label values aindnot1  sap670x;
label values aindnot2  sap670x;   label values aindnot3  sap670x;
label values aindnot4  sap670x;   label values aindnot5  sap670x;
label values hivtst1   sap028x;

label values awebuse   sap028x;   label values awebofno  sap290x;
label values aweboftp  sap814x;   label values awebeml   sap028x;
label values awebmno   sap290x;   label values awebmtp   sap814x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sa];
save "$OUT/samadult", replace;

#delimit cr

* data file is stored in samadult.dta
* log  file is stored in samadult.log

log close
