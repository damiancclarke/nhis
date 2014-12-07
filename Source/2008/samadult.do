global DAT "~/database/NHIS/Data/raw/2008"
global OUT "~/database/NHIS/Data/dta/2008"
global LOG "~/database/NHIS/Log"

log using "$LOG/samadult.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 JUNE 16, 2009 10:36 AM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2008 NHIS Public Use Sample Adult ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE samadult.dta AND samadult.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2008\

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

      doinglwa     54 -  54      whynowka     55 -  56
      everwrk      57 -  57      indstrn1     58 -  59
      indstrn2     60 -  61      occupn1      62 -  63
      occupn2      64 -  65      wrkcata      66 -  66
      businc1a     67 -  67      locall1a     68 -  69
      yrswrkpa     70 -  71      wrklongh     72 -  72
      hourpda      73 -  73      pdsicka      74 -  74
      onejob       75 -  75

      hypev        76 -  76      hypdifv      77 -  77
      hyplow       78 -  78      hybpckno     79 -  80
      hybpcktp     81 -  81      hybplev      82 -  82
      clckno       83 -  84      clcktp       85 -  85
      clhi         86 -  86      chdev        87 -  87
      angev        88 -  88      miev         89 -  89
      hrtev        90 -  90      strev        91 -  91
      ephev        92 -  92      jawp         93 -  93
      wea          94 -  94      che          95 -  95
      arm          96 -  96      brth         97 -  97
      ahado        98 -  98      acpr         99 -  99
      acprlo      100 - 100      aasmev      101 - 101
      aasstill    102 - 102      aasmyr      103 - 103
      aasmeryr    104 - 104      aasmhsp     105 - 105
      aasmmc      106 - 106      awzmswk     107 - 109
      awzpin      110 - 110      aasminst    111 - 111
      aasmpmed    112 - 112      aasmcan     113 - 113
      aasmed      114 - 114      aasmdtp     115 - 115
      aaswmp      116 - 116      aasclass    117 - 117
      aas_rec     118 - 118      aas_res     119 - 119
      aas_mon     120 - 120      aapenvln    121 - 121
      aapenvdo    122 - 122      chrfatig    123 - 123
      thylow      124 - 124      chrinfct    125 - 125
      muldyst     126 - 126      epilepsy    127 - 127
      cerebrlp    128 - 128      spineinj    129 - 129
      headinj     130 - 130      movedis     131 - 131
      migraine    132 - 132      rhdache     133 - 133
      mulscler    134 - 134      ulcev       135 - 135
      ulcyr       136 - 136      canev       137 - 137
      cnkind1     138 - 138      cnkind2     139 - 139
      cnkind3     140 - 140      cnkind4     141 - 141
      cnkind5     142 - 142      cnkind6     143 - 143
      cnkind7     144 - 144      cnkind8     145 - 145
      cnkind9     146 - 146      cnkind10    147 - 147
      cnkind11    148 - 148      cnkind12    149 - 149
      cnkind13    150 - 150      cnkind14    151 - 151
      cnkind15    152 - 152      cnkind16    153 - 153
      cnkind17    154 - 154      cnkind18    155 - 155
      cnkind19    156 - 156      cnkind20    157 - 157
      cnkind21    158 - 158      cnkind22    159 - 159
      cnkind23    160 - 160      cnkind24    161 - 161
      cnkind25    162 - 162      cnkind26    163 - 163
      cnkind27    164 - 164      cnkind28    165 - 165
      cnkind29    166 - 166      cnkind30    167 - 167
      cnkind31    168 - 168      canage1     169 - 171
      canage2     172 - 174      canage3     175 - 177
      canage4     178 - 180      canage5     181 - 183
      canage6     184 - 186      canage7     187 - 189
      canage8     190 - 192      canage9     193 - 195
      canage10    196 - 198      canage11    199 - 201
      canage12    202 - 204      canage13    205 - 207
      canage14    208 - 210      canage15    211 - 213
      canage16    214 - 216      canage17    217 - 219
      canage18    220 - 222      canage19    223 - 225
      canage20    226 - 228      canage21    229 - 231
      canage22    232 - 234      canage23    235 - 237
      canage24    238 - 240      canage25    241 - 243
      canage26    244 - 246      canage27    247 - 249
      canage28    250 - 252      canage29    253 - 255
      canage30    256 - 258      dibev       259 - 259
      dibpre1     260 - 260      dibage      261 - 262
      difage2     263 - 264      insln       265 - 265
      dibpill     266 - 266      ahayfyr     267 - 267
      sinyr       268 - 268      cbrchyr     269 - 269
      kidwkyr     270 - 270      livyr       271 - 271
      jntsymp     272 - 272      jmthp1      273 - 273
      jmthp2      274 - 274      jmthp3      275 - 275
      jmthp4      276 - 276      jmthp5      277 - 277
      jmthp6      278 - 278      jmthp7      279 - 279
      jmthp8      280 - 280      jmthp9      281 - 281
      jmthp10     282 - 282      jmthp11     283 - 283
      jmthp12     284 - 284      jmthp13     285 - 285
      jmthp14     286 - 286      jmthp15     287 - 287
      jmthp16     288 - 288      jmthp17     289 - 289
      jntchr      290 - 290      jnthp       291 - 291
      arth1       292 - 292      arthlmt     293 - 293
      arthtyp1    294 - 294      arthtyp2    295 - 295
      arthtyp3    296 - 296      arthtyp4    297 - 297
      arthtyp5    298 - 298      arthtyp6    299 - 299
      paineck     300 - 300      painlb      301 - 301
      painleg     302 - 302      painface    303 - 303
      amigr       304 - 304      acold2w     305 - 305
      aintil2w    306 - 306      pregnow     307 - 307
      hraidnow    308 - 308      hraidev     309 - 309
      ahearst1    310 - 310      hrwors      311 - 311
      hrwhich     312 - 312      hrright     313 - 313
      hrleft      314 - 314      hrtin       315 - 315
      hrtinlng    316 - 317      hrtinoft    318 - 318
      hrtinmus    319 - 319      hrtinslp    320 - 320
      hrtnprob    321 - 321      avision     322 - 322
      ablind      323 - 323      vim_drev    324 - 324
      vimls_dr    325 - 325      vim_caev    326 - 326
      vimls_ca    327 - 327      vimcsurg    328 - 328
      vim_glev    329 - 329      vimls_gl    330 - 330
      vim_mdev    331 - 331      vimls_md    332 - 332
      vimglass    333 - 333      vimread     334 - 334
      vimdrive    335 - 335      avisreh     336 - 336
      avisdev     337 - 337      avdf_nws    338 - 338
      avdf_cls    339 - 339      avdf_nit    340 - 340
      avdf_drv    341 - 341      avdf_per    342 - 342
      avdf_crd    343 - 343      avisexam    344 - 344
      avisact     345 - 345      avisprot    346 - 346
      lupprt      347 - 347      sad         348 - 348
      nervous     349 - 349      restless    350 - 350
      hopeless    351 - 351      effort      352 - 352
      worthls     353 - 353      mhamtmo     354 - 354
      depress     355 - 355      ganxiety    356 - 356
      panicd      357 - 357

      wrklyr3     358 - 358      wkdayr      359 - 361
      beddayr     362 - 364      ahstatyr    365 - 365
      speceq      366 - 366      flwalk      367 - 367
      flclimb     368 - 368      flstand     369 - 369
      flsit       370 - 370      flstoop     371 - 371
      flreach     372 - 372      flgrasp     373 - 373
      flcarry     374 - 374      flpush      375 - 375
      flshop      376 - 376      flsocl      377 - 377
      flrelax     378 - 378      fla1ar      379 - 379
      aflhca1     380 - 380      aflhca2     381 - 381
      aflhca3     382 - 382      aflhca4     383 - 383
      aflhca5     384 - 384      aflhca6     385 - 385
      aflhca7     386 - 386      aflhca8     387 - 387
      aflhca9     388 - 388      aflhca10    389 - 389
      aflhca11    390 - 390      aflhca12    391 - 391
      aflhca13    392 - 392      aflhca14    393 - 393
      aflhca15    394 - 394      aflhca16    395 - 395
      aflhca17    396 - 396      aflhca18    397 - 397
      aflhc19_    398 - 398      aflhc20_    399 - 399
      aflhc21_    400 - 400      aflhc22_    401 - 401
      aflhc23_    402 - 402      aflhc24_    403 - 403
      aflhc25_    404 - 404      aflhc26_    405 - 405
      aflhc27_    406 - 406      aflhc28_    407 - 407
      aflhc29_    408 - 408      aflhc30_    409 - 409
      aflhc31_    410 - 410      aflhc32_    411 - 411
      aflhc33_    412 - 412      aflhc34_    413 - 413
      aflhca90    414 - 414      aflhca91    415 - 415
      altime1     416 - 417      alunit1     418 - 418
      aldura1     419 - 420      aldurb1     421 - 421
      alchrc1     422 - 422      altime2     423 - 424
      alunit2     425 - 425      aldura2     426 - 427
      aldurb2     428 - 428      alchrc2     429 - 429
      altime3     430 - 431      alunit3     432 - 432
      aldura3     433 - 434      aldurb3     435 - 435
      alchrc3     436 - 436      altime4     437 - 438
      alunit4     439 - 439      aldura4     440 - 441
      aldurb4     442 - 442      alchrc4     443 - 443
      altime5     444 - 445      alunit5     446 - 446
      aldura5     447 - 448      aldurb5     449 - 449
      alchrc5     450 - 450      altime6     451 - 452
      alunit6     453 - 453      aldura6     454 - 455
      aldurb6     456 - 456      alchrc6     457 - 457
      altime7     458 - 459      alunit7     460 - 460
      aldura7     461 - 462      aldurb7     463 - 463
      alchrc7     464 - 464      altime8     465 - 466
      alunit8     467 - 467      aldura8     468 - 469
      aldurb8     470 - 470      alchrc8     471 - 471
      altime9     472 - 473      alunit9     474 - 474
      aldura9     475 - 476      aldurb9     477 - 477
      alchrc9     478 - 478      altime10    479 - 480
      alunit10    481 - 481      aldura10    482 - 483
      aldurb10    484 - 484      alchrc10    485 - 485
      altime11    486 - 487      alunit11    488 - 488
      aldura11    489 - 490      aldurb11    491 - 491
      alchrc11    492 - 492      altime12    493 - 494
      alunit12    495 - 495      aldura12    496 - 497
      aldurb12    498 - 498      alchrc12    499 - 499
      altime13    500 - 501      alunit13    502 - 502
      aldura13    503 - 504      aldurb13    505 - 505
      alchrc13    506 - 506      altime14    507 - 508
      alunit14    509 - 509      aldura14    510 - 511
      aldurb14    512 - 512      alchrc14    513 - 513
      altime15    514 - 515      alunit15    516 - 516
      aldura15    517 - 518      aldurb15    519 - 519
      alchrc15    520 - 520      altime16    521 - 522
      alunit16    523 - 523      aldura16    524 - 525
      aldurb16    526 - 526      alchrc16    527 - 527
      altime17    528 - 529      alunit17    530 - 530
      aldura17    531 - 532      aldurb17    533 - 533
      alchrc17    534 - 534      altime18    535 - 536
      alunit18    537 - 537      aldura18    538 - 539
      aldurb18    540 - 540      alchrc18    541 - 541
      altime19    542 - 543      alunit19    544 - 544
      aldura19    545 - 546      aldurb19    547 - 547
      alchrc19    548 - 548      altime20    549 - 550
      alunit20    551 - 551      aldura20    552 - 553
      aldurb20    554 - 554      alchrc20    555 - 555
      altime21    556 - 557      alunit21    558 - 558
      aldura21    559 - 560      aldurb21    561 - 561
      alchrc21    562 - 562      altime22    563 - 564
      alunit22    565 - 565      aldura22    566 - 567
      aldurb22    568 - 568      alchrc22    569 - 569
      altime23    570 - 571      alunit23    572 - 572
      aldura23    573 - 574      aldurb23    575 - 575
      alchrc23    576 - 576      altime24    577 - 578
      alunit24    579 - 579      aldura24    580 - 581
      aldurb24    582 - 582      alchrc24    583 - 583
      altime25    584 - 585      alunit25    586 - 586
      aldura25    587 - 588      aldurb25    589 - 589
      alchrc25    590 - 590      altime26    591 - 592
      alunit26    593 - 593      aldura26    594 - 595
      aldurb26    596 - 596      alchrc26    597 - 597
      altime27    598 - 599      alunit27    600 - 600
      aldura27    601 - 602      aldurb27    603 - 603
      alchrc27    604 - 604      altime28    605 - 606
      alunit28    607 - 607      aldura28    608 - 609
      aldurb28    610 - 610      alchrc28    611 - 611
      altime29    612 - 613      alunit29    614 - 614
      aldura29    615 - 616      aldurb29    617 - 617
      alchrc29    618 - 618      altime30    619 - 620
      alunit30    621 - 621      aldura30    622 - 623
      aldurb30    624 - 624      alchrc30    625 - 625
      altime31    626 - 627      alunit31    628 - 628
      aldura31    629 - 630      aldurb31    631 - 631
      alchrc31    632 - 632      altime32    633 - 634
      alunit32    635 - 635      aldura32    636 - 637
      aldurb32    638 - 638      alchrc32    639 - 639
      altime33    640 - 641      alunit33    642 - 642
      aldura33    643 - 644      aldurb33    645 - 645
      alchrc33    646 - 646      altime34    647 - 648
      alunit34    649 - 649      aldura34    650 - 651
      aldurb34    652 - 652      alchrc34    653 - 653
      altime90    654 - 655      alunit90    656 - 656
      aldura90    657 - 658      aldurb90    659 - 659
      alchrc90    660 - 660      altime91    661 - 662
      alunit91    663 - 663      aldura91    664 - 665
      aldurb91    666 - 666      alchrc91    667 - 667
      alcndrt     668 - 668      alchronr    669 - 669

      smkev       670 - 670      smkreg      671 - 672
      smknow      673 - 673      smkstat2    674 - 674
      smkqtno     675 - 676      smkqttp     677 - 677
      smkqty      678 - 679      cigsda1     680 - 681
      cigdamo     682 - 683      cigsda2     684 - 685
      cigsday     686 - 687      cigqtyr     688 - 688
      vigno       689 - 691      vigtp       692 - 692
      vigfreqw    693 - 694      viglngno    695 - 697
      viglngtp    698 - 698      vigmin      699 - 701
      modno       702 - 704      modtp       705 - 705
      modfreqw    706 - 707      modlngno    708 - 710
      modlngtp    711 - 711      modmin      712 - 714
      strngno     715 - 717      strngtp     718 - 718
      strfreqw    719 - 720      alc1yr      721 - 721
      alclife     722 - 722      alc12mno    723 - 725
      alc12mtp    726 - 726      alc12mwk    727 - 728
      alc12myr    729 - 731      alcamt      732 - 733
      alcstat     734 - 735      alc5upno    736 - 738
      alc5uptp    739 - 739      alc5upyr    740 - 742
      aheight     743 - 744      aweightp    745 - 747
      bmi         748 - 751      sleep       752 - 753

      ausualpl    754 - 754      aplkind     755 - 755
      ahcplrou    756 - 756      ahcplknd    757 - 757
      ahcchgyr    758 - 758      ahcchghi    759 - 759
      ahcdlyr1    760 - 760      ahcdlyr2    761 - 761
      ahcdlyr3    762 - 762      ahcdlyr4    763 - 763
      ahcdlyr5    764 - 764      ahcafyr1    765 - 765
      ahcafyr2    766 - 766      ahcafyr3    767 - 767
      ahcafyr4    768 - 768      adnlong2    769 - 769
      ahcsyr1     770 - 770      ahcsyr2     771 - 771
      ahcsyr3     772 - 772      ahcsyr4     773 - 773
      ahcsyr5     774 - 774      ahcsyr6     775 - 775
      ahcsyr7     776 - 776      ahcsyr8     777 - 777
      ahcsyr9     778 - 778      ahcsyr10    779 - 779
      ahernoy2    780 - 781      ahchyr      782 - 782
      ahchmoyr    783 - 784      ahchnoy2    785 - 786
      ahcnoyr2    787 - 788      asrgyr      789 - 789
      asrgnoyr    790 - 791      amdlongr    792 - 792
      shtfluyr    793 - 793      ashflu_m    794 - 795
      ashflu_y    796 - 799      sprfluyr    800 - 800
      aspflu_m    801 - 802      aspflu_y    803 - 806
      shtpnuyr    807 - 807      apox        808 - 808
      apox12mo    809 - 809      ahep        810 - 810
      ahepliv     811 - 811      shthepb     812 - 812
      shepdos     813 - 813      shthepa     814 - 814
      shepanum    815 - 816      shingles    817 - 817
      shttd       818 - 818      shttd05     819 - 819
      shttdap     820 - 820      livev       821 - 821
      travel      822 - 822

      ocond       823 - 823      obtws       824 - 824
      oemb        825 - 825      oreas_1     826 - 827
      oreas_2     828 - 829      oreas_3     830 - 831
      oreas_4     832 - 833      oprob_01    834 - 834
      oprob_02    835 - 835      oprob_03    836 - 836
      oprob_04    837 - 837      oprob_05    838 - 838
      oprob_06    839 - 839      oprob_07    840 - 840
      oprob_08    841 - 841      oprob_09    842 - 842
      oprob_10    843 - 843      oprob_11    844 - 844
      oprob_12    845 - 845      odent1      846 - 846
      odent2      847 - 847      onoden_1    848 - 848
      onoden_2    849 - 849      onoden_3    850 - 850
      onoden_4    851 - 851      onoden_5    852 - 852
      onoden_6    853 - 853      onoden_7    854 - 854
      oint_1      855 - 855      oint_2      856 - 856
      oint_3      857 - 857      oint_4      858 - 858
      ocexam      859 - 859      octong      860 - 860
      ocneck      861 - 861      ocexwhen    862 - 862
      oexcheck    863 - 863      ocexprof    864 - 864

      bldgv       865 - 865      bldg12m     866 - 866
      hivtst      867 - 867      whytst_r    868 - 869
      tst12m_m    870 - 871      tst12m_y    872 - 875
      timetst     876 - 876      reatst_c    877 - 878
      reaswhor    879 - 879      lastst_c    880 - 881
      clntyp_c    882 - 883      whoadm      884 - 884
      givnam      885 - 885      extst12m    886 - 886
      chnsadsp    887 - 887      stmtru      888 - 888
      std         889 - 889      stddoc      890 - 890
      stdwher     891 - 891      tbhrd       892 - 892
      tbknow      893 - 893      tb          894 - 894
      tbsprd1     895 - 895      tbsprd2     896 - 896
      tbsprd3     897 - 897      tbsprd4     898 - 898
      tbsprd5     899 - 899      tbsprd6     900 - 900
      tbcured     901 - 901      tbchanc     902 - 902
      tbshame     903 - 903      homeless    904 - 904

      sun1_sha    905 - 905      sun1_cap    906 - 906
      sun1_hat    907 - 907      sun2_lgs    908 - 908
      sun2_lgp    909 - 909      sun2_scr    910 - 910
      spf         911 - 912      spfscale    913 - 913
      snnum       914 - 916      paphad      917 - 917
      pap6yr      918 - 919      rpap1_mt    920 - 921
      rpap1_yr    922 - 925      rpap1n      926 - 927
      rpap1t      928 - 928      rpap2ca     929 - 929
      papreas     930 - 930      papabn      931 - 931
      papnot      932 - 933      mdrecpap    934 - 934
      papwhen     935 - 936      hyst        937 - 937
      hpvhrd      938 - 938      hpvcaus     939 - 939
      hpvsexcn    940 - 940      hpvtret     941 - 941
      hpvhad      942 - 942      shhpvhrd    943 - 943
      shthpv      944 - 944      shhpvdos    945 - 946
      hpvint      947 - 947      hpvnot      948 - 949
      hpvcost     950 - 950      hpvlocst    951 - 951
      mamhad      952 - 952      mam6yr      953 - 954
      rmam1_mt    955 - 956      rmam1_yr    957 - 960
      rmam1n      961 - 962      rmam1t      963 - 963
      rmam2ca     964 - 964      mamreas     965 - 965
      mdrecmam    966 - 966      maminfo     967 - 967
      mamdelay    968 - 968      hrtever     969 - 969
      hrtnow      970 - 970      hrtlong     971 - 971
      psahad      972 - 972      rpsa1_mt    973 - 974
      rpsa1_yr    975 - 978      rpsa1n      979 - 980
      rpsa1t      981 - 981      rpsa2       982 - 982
      psareas     983 - 983      mdrecpsa    984 - 984
      crehad      985 - 985      rcre1_mt    986 - 987
      rcre1_yr    988 - 991      rcre1n      992 - 993
      rcre1t      994 - 994      rcre2       995 - 995
      crenam      996 - 996      crereas     997 - 997
      crerec      998 - 998      hfobhad     999 - 999
      rhfo1_mt   1000 -1001      rhfo1_yr   1002 -1005
      rhfo1n     1006 -1007      rhfo1t     1008 -1008
      rhfo2      1009 -1009      mdhfob     1010 -1010

      hyppreg    1011 -1011      hloswgt    1012 -1012
      wgtadev    1013 -1013      wgtadnow   1014 -1014
      lowslt     1015 -1015      lowsltev   1016 -1016
      lowsltnw   1017 -1017      exerc      1018 -1018
      exercev    1019 -1019      exercnw    1020 -1020
      hbpalc     1021 -1021      hbpalcev   1022 -1022
      hbpalcnw   1023 -1023      hypmedev   1024 -1024
      hypmed     1025 -1025      hymdmed    1026 -1026

      baid_01    1027 -1027      baid_02    1028 -1028
      baid_03    1029 -1029      baid_04    1030 -1030
      baid_05    1031 -1031      baid_06    1032 -1032
      baid_07    1033 -1033      baid_08    1034 -1034
      bbrac1     1035 -1035      bbrac2     1036 -1036
      bbrac3     1037 -1037      bbrac4     1038 -1038
      bbrac5     1039 -1039      bbrac6     1040 -1040
      bbrac7     1041 -1041      bart1      1042 -1042
      bart2      1043 -1043      bart3      1044 -1044
      bart4      1045 -1045      bart5      1046 -1046
      bdizz      1047 -1047      bbal_01    1048 -1048
      bbal_02    1049 -1049      bbal_03    1050 -1050
      bbal_04    1051 -1051      bbal_05    1052 -1052
      bbal_06    1053 -1053      bbal_07    1054 -1054
      bbal_08    1055 -1055      bbal_09    1056 -1056
      bbal_10    1057 -1057      bbal_11    1058 -1058
      bbal_12    1059 -1059      bbal_13    1060 -1060
      bbal_14    1061 -1061      bbal_15    1062 -1062
      bbalct     1063 -1064      btype_01   1065 -1065
      btype_02   1066 -1066      btype_03   1067 -1067
      btype_04   1068 -1068      btype_05   1069 -1069
      btype_06   1070 -1070      btypect    1071 -1071
      bboth      1072 -1072      bage       1073 -1075
      blong      1076 -1077      boften     1078 -1079
      blast      1080 -1081      btrig_01   1082 -1082
      btrig_02   1083 -1083      btrig_03   1084 -1084
      btrig_04   1085 -1085      btrig_05   1086 -1086
      btrig_06   1087 -1087      btrig_07   1088 -1088
      btrig_08   1089 -1089      btrig_09   1090 -1090
      btrig_10   1091 -1091      btrig_11   1092 -1092
      btrig_12   1093 -1093      btrig_13   1094 -1094
      bsame_01   1095 -1095      bsame_02   1096 -1096
      bsame_03   1097 -1097      bsame_04   1098 -1098
      bsame_05   1099 -1099      bsame_06   1100 -1100
      bsame_07   1101 -1101      bsame_08   1102 -1102
      bsame_09   1103 -1103      bsame_10   1104 -1104
      bsame_11   1105 -1105      bsame_12   1106 -1106
      bsame_13   1107 -1107      bsame_14   1108 -1108
      bsame_15   1109 -1109      bsame_16   1110 -1110
      bsame_17   1111 -1111      bsame_18   1112 -1112
      bsame_19   1113 -1113      bsame_20   1114 -1114
      bsame_21   1115 -1115      bsame_22   1116 -1116
      bonly_01   1117 -1117      bonly_02   1118 -1118
      bonly_03   1119 -1119      bonly_04   1120 -1120
      bonly_05   1121 -1121      bonly_06   1122 -1122
      bonly_07   1123 -1123      bonly_08   1124 -1124
      bonly_09   1125 -1125      bonly_10   1126 -1126
      bonly_11   1127 -1127      bonly_12   1128 -1128
      bonly_13   1129 -1129      bonly_14   1130 -1130
      bonly_15   1131 -1131      bonly_16   1132 -1132
      bonly_17   1133 -1133      bonly_18   1134 -1134
      bonly_19   1135 -1135      bonly_20   1136 -1136
      bonly_21   1137 -1137      bonly_22   1138 -1138
      bhosp      1139 -1139      bhospno    1140 -1140
      bhp        1141 -1141      bhp_01     1142 -1142
      bhp_02     1143 -1143      bhp_03     1144 -1144
      bhp_04     1145 -1145      bhp_05     1146 -1146
      bhp_06     1147 -1147      bhp_07     1148 -1148
      bhp_08     1149 -1149      bhp_09     1150 -1150
      bhp_10     1151 -1151      bhp_11     1152 -1152
      bhp_12     1153 -1153      bhp_13     1154 -1154
      bhp_14     1155 -1155      bhp_15     1156 -1156
      bhp_16     1157 -1157      b5yrs      1158 -1158
      bfirst     1159 -1159      bdiff      1160 -1160
      bhelp      1161 -1161      bthlp_no   1162 -1164
      bthlp_tp   1165 -1165      bdiag      1166 -1166
      bcaus_01   1167 -1167      bcaus_02   1168 -1168
      bcaus_03   1169 -1169      bcaus_04   1170 -1170
      bcaus_05   1171 -1171      bcaus_06   1172 -1172
      bcaus_07   1173 -1173      bcaus_08   1174 -1174
      bcaus_09   1175 -1175      bcaus_10   1176 -1176
      bcaus_11   1177 -1177      bcaus_12   1178 -1178
      bcaus_13   1179 -1179      bcaus_14   1180 -1180
      bcaus_15   1181 -1181      bcaus_16   1182 -1182
      btret      1183 -1183      btret_01   1184 -1184
      btret_02   1185 -1185      btret_03   1186 -1186
      btret_04   1187 -1187      btret_05   1188 -1188
      btret_06   1189 -1189      btret_07   1190 -1190
      btret_08   1191 -1191      btret_09   1192 -1192
      btret_10   1193 -1193      btret_11   1194 -1194
      btret_12   1195 -1195      btret_13   1196 -1196
      btret_14   1197 -1197      btret_15   1198 -1198
      btret_16   1199 -1199      btret_17   1200 -1200
      btret_18   1201 -1201      btret_19   1202 -1202
      btret_20   1203 -1203      btret_21   1204 -1204
      btret_22   1205 -1205      btret_23   1206 -1206
      bstat      1207 -1207      bmedic     1208 -1208
      bbett      1209 -1209      bchng      1210 -1210
      bchng_01   1211 -1211      bchng_02   1212 -1212
      bchng_03   1213 -1213      bchng_04   1214 -1214
      bchng_05   1215 -1215      bchng_06   1216 -1216
      bchng_07   1217 -1217      bchng_08   1218 -1218
      bchng_09   1219 -1219      bchng_10   1220 -1220
      bmisswk    1221 -1221      blms_no    1222 -1224
      blms_tp    1225 -1225      bm12_no    1226 -1228
      bm12_tp    1229 -1229      bprob      1230 -1230
      bmed_01    1231 -1231      bmed_02    1232 -1232
      bmed_03    1233 -1233      bmed_04    1234 -1234
      bmed_05    1235 -1235      bmed_06    1236 -1236
      bmed_07    1237 -1237      bmed_08    1238 -1238
      bbio       1239 -1239      bfall5     1240 -1240
      bfl_01     1241 -1241      bfl_02     1242 -1242
      bfl_03     1243 -1243      bfl_04     1244 -1244
      bfl_05     1245 -1245      bfl_06     1246 -1246
      bfall12    1247 -1247      bf12_no    1248 -1250
      bf12_tp    1251 -1251      bftime     1252 -1252
      binj       1253 -1253      bijms_no   1254 -1256
      bijms_tp   1257 -1257      bfwhy_01   1258 -1258
      bfwhy_02   1259 -1259      bfwhy_03   1260 -1260
      bfwhy_04   1261 -1261      bfwhy_05   1262 -1262
      bfwhy_06   1263 -1263      bfwhy_07   1264 -1264
      bfwhy_08   1265 -1265      bfwhy_09   1266 -1266
      bfwhy_10   1267 -1267      bfwhy_11   1268 -1268
      bfwhy_12   1269 -1269      bfwhy_13   1270 -1270
      bfwhy_14   1271 -1271      bfwhy_15   1272 -1272
      bfwhy_16   1273 -1273      bfwhy_17   1274 -1274
      bfwhy_18   1275 -1275      bfwhy_19   1276 -1276
      bfwhy_20   1277 -1277      bfwhy_21   1278 -1278
      bfwhy_22   1279 -1279

using "$DAT/samadult.dat";
replace wtia_sa = wtia_sa/10;
replace bmi = bmi/100;

* DEFINE VARIABLE LABELS;

label variable rectype  "IDN.000_00.000: File type identifier";
label variable srvy_yr  "
IDN.000_02.000: Year of National Health Interview Survey";
label variable hhx      "IDN.000_04.000: HH identifier";
label variable intv_qrt "IDN.000_25.000: Interview Quarter";
label variable assignwk "IDN.000_30.000: Assignment Week";
label variable fmx      "IDN.000_35.000: Family Serial Number";
label variable fpx      "IDN.000_40.000: Person Number (in family)";
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
ASD.090_00.000: Detailed occupation classification (based on 2000 SOC codes from
 Census)";
label variable occupn2  "
ASD.090_00.000: Simple occupation classification (based on 2000 SOC codes from C
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

label variable hypev    "ACN.010_00.000: Ever been told you have hypertension";
label variable hypdifv  "ACN.020_00.000: Ever had hypertension on 2+ visits";
label variable hyplow   "ACN.020_00.010: Ever had low blood pressure";
label variable hybpckno "ACN.021_01.010: Time since last BP check: # of units";
label variable hybpcktp "ACN.021_02.010: Time since last BP check: Time units";
label variable hybplev  "
ACN.022_00.010: Told blood pressure was high, normal, or low";
label variable clckno   "ACN.023_01.010: Time since cholesterol checked: # units
";
label variable clcktp   "
ACN.023_02.020: Time since cholesterol checked: Time units";
label variable clhi     "ACN.024_00.010: Told blood cholesterol level was high";
label variable chdev    "
ACN.031_01.000: Ever been told you had coronary heart disease";
label variable angev    "ACN.031_02.000: Ever been told you had angina pectoris
";
label variable miev     "ACN.031_03.000: Ever been told you had a heart attack";
label variable hrtev    "
ACN.031_04.000: Ever been told you had a heart condition/disease";
label variable strev    "ACN.031_05.000: Ever been told you had a stroke";
label variable ephev    "ACN.031_06.000: Ever been told you had emphysema";
label variable jawp     "
ACN.032_01.010: Heart Attack Knowledge: Pain or discomfort in the jaw, neck or b
ack";
label variable wea      "
ACN.032_02.020: Heart Attack Knowledge: Feeling weak, lightheaded or faint";
label variable che      "
ACN.032_03.030: Heart Attack Knowledge: Chest pain or discomfort";
label variable arm      "
ACN.032_04.040: Heart Attack Knowledge: Pain or discomfort in the arms or should
er";
label variable brth     "
ACN.032_05.050: Heart Attack Knowledge: Shortness of breath";
label variable ahado    "
ACN.033_00.010: Best thing to do right away if having a heart attack";
label variable acpr     "
ACN.034_00.010: Ever received formal training or certification in CPR for Adults
";
label variable acprlo   "
ACN.035_00.010: How long ago received formal CPR training";
label variable aasmev   "ACN.080_00.000: Ever been told you had asthma";
label variable aasstill "ACN.085_00.000: Still have asthma";
label variable aasmyr   "ACN.090_00.000: Had an asthma episode/attack past 12 m
";
label variable aasmeryr "ACN.100_00.000: Had visit to ER due to asthma past 12 m
";
label variable aasmhsp  "
ACN.100_00.010: Had stayed overnight in hospital due to asthma, past 12 m";
label variable aasmmc   "
ACN.100_00.020: Talk with health professional about long term asthma care";
label variable awzmswk  "
ACN.100_00.030: # Work days missed due to asthma, past 12 mo.";
label variable awzpin   "ACN.100_00.040: Ever used prescription inhaler";
label variable aasminst "ACN.100_00.050: Shown how to use inhaler";
label variable aasmpmed "ACN.100_00.060: Used oral inhaler, past 3 mo";
label variable aasmcan  "
ACN.100_00.070: Used more than 3 canisters of mouth inhaler, past 3 mo";
label variable aasmed   "ACN.100_00.080: Ever taken preventive asthma meds";
label variable aasmdtp  "ACN.100_00.090: Now taking asthma meds";
label variable aaswmp   "ACN.100_00.100: Given an asthma management plan";
label variable aasclass "ACN.100_00.110: Ever taken asthma mgmt. class";
label variable aas_rec  "ACN.105_01.010: Taught to recognize asthma episode";
label variable aas_res  "ACN.105_02.020: Taught how to respond to asthma episode
";
label variable aas_mon  "
ACN.105_03.030: Taught how to monitor peak flow for daily therapy";
label variable aapenvln "
ACN.107_00.010: Ever advised to change environment for asthma";
label variable aapenvdo "
ACN.107_00.020: Follow advice to change environment for asthma";
label variable chrfatig "ACN.108_01.010: Ever had chronic fatigue syndrome";
label variable thylow   "
ACN.108_02.020: Ever had low thyroid function or hypothyroidism";
label variable chrinfct "ACN.108_03.030: Ever had chronic infection";
label variable muldyst  "ACN.108_04.040: Ever had muscular dystrophy";
label variable epilepsy "ACN.108_05.050: Ever had epilepsy or seizures";
label variable cerebrlp "ACN.108_06.060: Ever had cerebral palsy";
label variable spineinj "ACN.108_07.070: Ever had a spinal cord or neck injury";
label variable headinj  "ACN.108_08.080: Ever had injury to head or brain";
label variable movedis  "
ACN.108_09.090: Ever had movement disorders such as Parkinson's disease, ALS, or
 Lou Gehrig's disease";
label variable migraine "ACN.108_10.100: Ever had migraine headaches";
label variable rhdache  "
ACN.108_11.110: Ever had regular headaches, other than migraine";
label variable mulscler "ACN.108_12.120: Ever had multiple sclerosis";
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
label variable hraidnow "ACN.400_00.000: Now use a hearing aid";
label variable hraidev  "
ACN.410_00.000: Ever used a hearing aid if not now using";
label variable ahearst1 "ACN.420_00.000: Hearing w/o hearing aid";
label variable hrwors   "ACN.422_00.010: Hearing worse in one ear";
label variable hrwhich  "ACN.422_00.020: Which ear is worse";
label variable hrright  "ACN.422_00.030: Hearing in right ear";
label variable hrleft   "ACN.422_00.040: Hearing in left ear";
label variable hrtin    "
ACN.425_00.010: Bothered by ringing/roaring/buzzing in ears, past 12 m";
label variable hrtinlng "
ACN.425_00.020: Duration of ringing/roaring/buzzing in ears";
label variable hrtinoft "
ACN.425_00.030: How often R had ringing/roaring/buzzing, past 12 m";
label variable hrtinmus "
ACN.425_00.040: Ringing/roaring/buzzing after hearing loud sounds/music";
label variable hrtinslp "
ACN.425_00.050: Ringing/roaring/buzzing when going to sleep";
label variable hrtnprob "
ACN.425_00.060: How much a problem is ringing/roaring/buzzing";
label variable avision  "ACN.430_00.000: Trouble seeing even w/glasses/lenses";
label variable ablind   "ACN.440_00.000: Blind or unable to see at all";
label variable vim_drev "
ACN.440_00.010: EVER been told you had diabetic retinopathy";
label variable vimls_dr "
ACN.440_00.020: Lost vision because of diabetic retinopathy";
label variable vim_caev "ACN.440_00.030: EVER been told you had cataracts";
label variable vimls_ca "ACN.440_00.040: Lost vision because of cataracts";
label variable vimcsurg "ACN.440_00.045: Ever had cataract surgery";
label variable vim_glev "ACN.440_00.050: EVER been told you had glaucoma";
label variable vimls_gl "ACN.440_00.060: Lost vision because of glaucoma";
label variable vim_mdev "
ACN.440_00.070: EVER been told you had macular degeneration";
label variable vimls_md "
ACN.440_00.080: Lost vision because of macular degeneration";
label variable vimglass "
ACN.440_00.100: Currently wear eyeglasses or contact lenses?";
label variable vimread  "
ACN.440_00.110: Wear eyeglasses or contact lenses to read/write/cook/sew";
label variable vimdrive "
ACN.440_00.120: Wear eyeglasses or contact lenses to drive/read signs/watch TV";
label variable avisreh  "ACN.440_00.130: Use any vision rehabilitation services
";
label variable avisdev  "
ACN.440_00.140: Use any adaptive devices such as magnifiers, talking materials";
label variable avdf_nws "
ACN.441_00.010: Even when wearing glasses difficult for you to read newspapers";
label variable avdf_cls "
ACN.441_00.020: Even when wearing glasses difficult for you to see up close/cook
/sew";
label variable avdf_nit "
ACN.441_00.030: Even when wearing glasses difficult for you to go down stairs in
 dim light";
label variable avdf_drv "
ACN.441_00.040: Even when wearing glasses difficult for you to drive during dayt
ime";
label variable avdf_per "
ACN.441_00.050: Even when wearing glasses difficult for you to notice objects wh
ile walking";
label variable avdf_crd "
ACN.441_00.060: Even when wearing glasses difficult for you to find something on
 crowded shelf";
label variable avisexam "
ACN.442_00.010: Last time you had an eye exam (pupils dilated)";
label variable avisact  "
ACN.442_00.020: Participate in sports/other activities that can cause eye injury
";
label variable avisprot "
ACN.442_00.030: When doing these activities, on average, do you wear eye protect
ion";
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
label variable depress  "ACN.535_01.010: Ever had depression";
label variable ganxiety "ACN.535_02.020: Ever had generalized anxiety";
label variable panicd   "ACN.535_03.030: Ever had panic disorder";

label variable wrklyr3  "AHS: Work status: last week, past 12 months";
label variable wkdayr   "
AHS.040_00.000: Number of work loss days, past 12 months";
label variable beddayr  "AHS.050_00.000: Number of bed days, past 12 months";
label variable ahstatyr "
AHS.060_00.000: Health better/worse/same, compared w/ 12 months ago";
label variable speceq   "
AHS.070_00.000: Have health problem that requires special equipment";
label variable flwalk   "
AHS.091_01.000: How difficult to walk 1/4 mile w/o special equipment";
label variable flclimb  "
AHS.091_02.000: How difficult to climb 10 steps w/o special equipment";
label variable flstand  "
AHS.091_03.000: How difficult to stand 2 hours w/o special equipment";
label variable flsit    "
AHS.091_04.000: How difficult to sit 2 hours w/o special equipment";
label variable flstoop  "
AHS.091_05.000: How difficult to stoop, bend or kneel w/o special equipment";
label variable flreach  "
AHS.091_06.000: How difficult to reach over head w/o special equipment";
label variable flgrasp  "
AHS.141_01.000: How difficult to grasp small objects w/o special equipment";
label variable flcarry  "
AHS.141_02.000: How difficult to lift/carry 10 lbs w/o special equipment";
label variable flpush   "
AHS.141_03.000: How difficult to push large objects w/o special equipment";
label variable flshop   "
AHS.171_01.000: How difficult to go out to events w/o special equipment";
label variable flsocl   "
AHS.171_02.000: How difficult to participate in social activities w/o sp eq";
label variable flrelax  "
AHS.171_03.000: How difficult to relax at home w/o special equipment";
label variable fla1ar   "
AHS.171_00.000: Any functional limitation, all conditions";
label variable aflhca1  "
AHS.200_01.000: Vision problem causes difficulty with activity";
label variable aflhca2  "
AHS.200_02.000: Hearing problem causes difficulty with activity";
label variable aflhca3  "
AHS.200_03.000: Arthritis/rheumatism causes difficulty with activity";
label variable aflhca4  "
AHS.200_04.000: Back/neck problem causes difficulty with activity";
label variable aflhca5  "
AHS.200_05.000: Fract/bone/joint injury causes difficulty with activity";
label variable aflhca6  "
AHS.200_06.000: Other injury causes difficulty with activity";
label variable aflhca7  "
AHS.200_07.000: Heart problem causes difficulty with activity";
label variable aflhca8  "AHS.200_08.000: Stroke causes difficulty with activity
";
label variable aflhca9  "
AHS.200_09.000: Hypertension causes difficulty with activity";
label variable aflhca10 "
AHS.200_10.000: Diabetes causes difficulty with activity";
label variable aflhca11 "
AHS.200_11.000: Lung/breathing problem causes difficulty with activity";
label variable aflhca12 "AHS.200_12.000: Cancer causes difficulty with activity
";
label variable aflhca13 "
AHS.200_13.000: Birth defect causes difficulty with activity";
label variable aflhca14 "
AHS.200_14.000: Mental retardation causes difficulty with activity";
label variable aflhca15 "
AHS.200_15.000: Other developmental problem causes difficulty with activity";
label variable aflhca16 "
AHS.200_16.000: Senility/dementia/Alzheimer's causes difficulty with activity";
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
AHS.200_00.000: Circulation problem causes difficulty with activity";
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
label variable aldura1  "AHS.300_02.000: Duration of vision problem (in years)";
label variable aldurb1  "AHS.300_02.000: Duration of vision problem recode 2";
label variable alchrc1  "AHS.300_02.000: Vision problem condition status";
label variable altime2  "
AHS.301_01.000: Duration of hearing problem: Number of units";
label variable alunit2  "AHS.301_02.000: Duration of hearing problem: Time unit
";
label variable aldura2  "AHS.301_02.000: Duration of hearing problem (in years)
";
label variable aldurb2  "AHS.301_02.000: Duration of hearing problem recode 2";
label variable alchrc2  "AHS.301_02.000: Hearing problem condition status";
label variable altime3  "
AHS.302_01.000: Duration of arthritis/rheumatism: Number of units";
label variable alunit3  "
AHS.302_02.000: Duration of arthritis/rheumatism: Time unit";
label variable aldura3  "
AHS.302_02.000: Duration of arthritis or rheumatism problem (in years)";
label variable aldurb3  "
AHS.302_02.000: Duration of arthritis or rheumatism problem recode 2";
label variable alchrc3  "
AHS.302_02.000: Arthritis or rheumatism problem condition status";
label variable altime4  "
AHS.303_01.000: Duration of back or neck problem: Number of units";
label variable alunit4  "
AHS.303_02.000: Duration of back or neck problem: Time unit";
label variable aldura4  "
AHS.303_02.000: Duration of back or neck problem (in years)";
label variable aldurb4  "
AHS.303_02.000: Duration of back or neck problem recode 2";
label variable alchrc4  "AHS.303_02.000: Back or neck condition status";
label variable altime5  "
AHS.304_01.000: Duration of fracture, bone/joint injury: Number of units";
label variable alunit5  "
AHS.304_02.000: Duration of fracture, bone/joint injury: Time unit";
label variable aldura5  "
AHS.304_02.000: Duration of fracture, bone/joint injury problem (in years)";
label variable aldurb5  "
AHS.304_02.000: Duration of fracture, bone/joint injury problem recode 2";
label variable alchrc5  "
AHS.304_02.000: Fracture, bone/joint injury condition status";
label variable altime6  "
AHS.305_01.000: Duration of other injury: Number of units";
label variable alunit6  "AHS.305_02.000: Duration of other injury: Time unit";
label variable aldura6  "
AHS.305_02.000: Duration of other injury problem (in years)";
label variable aldurb6  "
AHS.305_02.000: Duration of other injury problem recode 2";
label variable alchrc6  "AHS.305_02.000: Other injury condition status";
label variable altime7  "
AHS.306_01.000: Duration of heart problem: Number of units";
label variable alunit7  "AHS.306_02.000: Duration of heart problem: Time unit";
label variable aldura7  "AHS.306_02.000: Duration of heart problem (in years)";
label variable aldurb7  "AHS.306_02.000: Duration of heart problem recode 2";
label variable alchrc7  "AHS.306_02.000: Heart problem condition status";
label variable altime8  "
AHS.307_01.000: Duration of stroke problem: Number of units";
label variable alunit8  "AHS.307_02.000: Duration of stroke problem: Time unit";
label variable aldura8  "AHS.307_02.000: Duration of stroke problem (in years)";
label variable aldurb8  "AHS.307_02.000: Duration of stroke problem recode 2";
label variable alchrc8  "AHS.307_02.000: Stroke problem condition status";
label variable altime9  "
AHS.308_01.000: Duration of hypertension/high blood pressure problem: Number of 
units";
label variable alunit9  "
AHS.308_02.000: Duration of hypertension/high blood pressure problem: Time unit
";
label variable aldura9  "
AHS.308_02.000: Duration of hypertension/high blood pressure problem (in years)
";
label variable aldurb9  "
AHS.308_02.000: Duration of hypertension/high problem recode 2";
label variable alchrc9  "
AHS.308_02.000: Hypertension/high blood pressure problem condition status";
label variable altime10 "AHS.309_01.000: Duration of diabetes: Number of units";
label variable alunit10 "AHS.309_02.000: Duration of diabetes: Time unit";
label variable aldura10 "AHS.309_02.000: Duration of diabetes (in years)";
label variable aldurb10 "AHS.309_02.000: Duration of diabetes problem recode 2";
label variable alchrc10 "AHS.309_02.000: Diabetes problem condition status";
label variable altime11 "
AHS.310_01.000: Duration of lung/breathing problem: Number of units";
label variable alunit11 "
AHS.310_02.000: Duration of lung/breathing problem: Time unit";
label variable aldura11 "
AHS.310_02.000: Duration of lung/breathing problem (in years)";
label variable aldurb11 "
AHS.310_02.000: Duration of lung/breathing problem recode 2";
label variable alchrc11 "AHS.310_02.000: Lung/breathing problem condition status
";
label variable altime12 "AHS.311_01.000: Duration of cancer: Number of units";
label variable alunit12 "AHS.311_02.000: Duration of cancer: Time unit";
label variable aldura12 "AHS.311_02.000: Duration of cancer (in years)";
label variable aldurb12 "AHS.311_02.000: Duration of cancer recode 2";
label variable alchrc12 "AHS.311_02.000: Cancer condition status";
label variable altime13 "
AHS.312_01.000: Duration of birth defect: Number of units";
label variable alunit13 "AHS.312_02.000: Duration of birth defect: Time unit";
label variable aldura13 "AHS.312_02.000: Duration of birth defect (in years)";
label variable aldurb13 "AHS.312_02.000: Duration of birth defect recode 2";
label variable alchrc13 "AHS.312_02.000: Birth defect condition status";
label variable altime14 "
AHS.313_01.000: Duration of mental retardation: Number of units";
label variable alunit14 "
AHS.313_02.000: Duration of mental retardation: Time unit";
label variable aldura14 "
AHS.313_02.000: Duration of mental retardation (in years)";
label variable aldurb14 "AHS.313_02.000: Duration of mental retardation recode 2
";
label variable alchrc14 "AHS.313_02.000: Mental retardation condition status";
label variable altime15 "
AHS.314_01.000: Duration of other developmental problem: Number of units";
label variable alunit15 "
AHS.314_02.000: Duration of other developmental problem: Time unit";
label variable aldura15 "
AHS.314_02.000: Duration of other developmental problem (in years)";
label variable aldurb15 "
AHS.314_02.000: Duration of other developmental problem  recode 2";
label variable alchrc15 "
AHS.314_02.000: Other developmental problem condition status";
label variable altime16 "AHS.315_01.000: Duration of senility: Number of units";
label variable alunit16 "AHS.315_02.000: Duration of senility: Time unit";
label variable aldura16 "AHS.315_02.000: Duration of senility (in years)";
label variable aldurb16 "AHS.315_02.000: Duration of senility recode 2";
label variable alchrc16 "AHS.315_02.000: Senility condition status";
label variable altime17 "
AHS.316_01.000: Duration of depression/anxiety/emotional problem: Number of unit
s";
label variable alunit17 "
AHS.316_02.000: Duration of depression/anxiety/emotional problem: Time unit";
label variable aldura17 "
AHS.316_02.000: Duration of depression/anxiety/emotional problem (in years)";
label variable aldurb17 "
AHS.316_02.000: Duration of depression/anxiety/emotional problem recode 2";
label variable alchrc17 "
AHS.316_02.000: Depression/anxiety/emotional problem condition status";
label variable altime18 "
AHS.317_01.000: Duration of weight problem: Number of units";
label variable alunit18 "AHS.317_02.000: Duration of weight problem: Time unit";
label variable aldura18 "AHS.317_02.000: Duration of weight problem (in years)";
label variable aldurb18 "AHS.317_02.000: Duration of weight problem recode 2";
label variable alchrc18 "AHS.317_02.000: Weight problem condition status";
label variable altime19 "
AHS.318_01.000 RECOD: Duration of missing limb: Number of units";
label variable alunit19 "
AHS.318_02.000 RECOD: Duration of missing limb: Time unit";
label variable aldura19 "AHS.318_02.000: Duration of missing limb (in years)";
label variable aldurb19 "AHS.318_02.000: Duration of missing limb recode 2";
label variable alchrc19 "AHS.318_02.000: Missing limb condition status";
label variable altime20 "
AHS.319_01.000 RECOD: Duration of musculoskeletal problem: Number of units";
label variable alunit20 "
AHS.319_02.000 RECOD: Duration of musculoskeletal problem: Time unit";
label variable aldura20 "
AHS.319_02.000: Duration of musculoskeletal problem (in years)";
label variable aldurb20 "
AHS.319_02.000: Duration of musculoskeletal problem recode 2";
label variable alchrc20 "
AHS.319_02.000: Musculoskeletal problem condition status";
label variable altime21 "
AHS.320_01.000 RECOD: Duration of circulation problem: Number of units";
label variable alunit21 "
AHS.320_02.000 RECOD: Duration of circulation problem: Time unit";
label variable aldura21 "
AHS.320_02.000: Duration of circulation problem (in years)";
label variable aldurb21 "
AHS.320_02.000: Duration of circulation problem recode 2";
label variable alchrc21 "AHS.320_02.000: Circulation problem condition status";
label variable altime22 "
AHS.321_01.000 RECOD: Duration of endocrine problem: Number of units";
label variable alunit22 "
AHS.321_02.000 RECOD: Duration of endocrine problem: Time unit";
label variable aldura22 "
AHS.321_02.000: Duration of endocrine problem (in years)";
label variable aldurb22 "AHS.321_02.000: Duration of endocrine problem recode 2
";
label variable alchrc22 "AHS.321_02.000: Endocrine problem condition status";
label variable altime23 "
AHS.322_01.000 RECOD: Duration of nervous system condition: Number of units";
label variable alunit23 "
AHS.322_02.000 RECOD: Duration of nervous system condition: Time unit";
label variable aldura23 "
AHS.322_02.000: Duration of nervous system condition (in years)";
label variable aldurb23 "
AHS.322_02.000: Duration of nervous system condition recode 2";
label variable alchrc23 "AHS.322_02.000: Nervous system condition status";
label variable altime24 "
AHS.323_01.000 RECOD: Duration of digestive problems: Number of units";
label variable alunit24 "
AHS.323_02.000 RECOD: Duration of digestive problems: Number of units";
label variable aldura24 "
AHS.323_02.000: Duration of digestive problems (in years)";
label variable aldurb24 "AHS.323_02.000: Duration of digestive problems recode 2
";
label variable alchrc24 "AHS.323_02.000: Digestive problems condition status";
label variable altime25 "
AHS.324_01.000 RECOD: Duration of genitourinary problem: Number of units";
label variable alunit25 "
AHS.324_02.000 RECOD: Duration of genitourinary problem: Time unit";
label variable aldura25 "
AHS.324_02.000: Duration of genitourinary problem (in years)";
label variable aldurb25 "
AHS.324_02.000: Duration of genitourinary problem recode 2";
label variable alchrc25 "AHS.324_02.000: Genitourinary problem condition status
";
label variable altime26 "
AHS.325_01.000 RECOD: Duration of skin problems: Number of units";
label variable alunit26 "
AHS.325_02.000 RECOD: Duration of skin problems: Time unit";
label variable aldura26 "AHS.325_02.000: Duration of skin problems (in years)";
label variable aldurb26 "AHS.325_02.000: Duration of skin problems recode 2";
label variable alchrc26 "AHS.325_02.000: Skin problems condition status";
label variable altime27 "
AHS.326_01.000 RECOD: Duration of blood problem: Number of units";
label variable alunit27 "
AHS.326_02.000 RECOD: Duration of blood problem: Time unit";
label variable aldura27 "AHS.326_02.000: Duration of blood problem (in years)";
label variable aldurb27 "AHS.326_02.000: Duration of blood problem recode 2";
label variable alchrc27 "AHS.326_02.000: Blood problem condition status";
label variable altime28 "
AHS.327_01.000 RECOD: Duration of benign tumor: Number of units";
label variable alunit28 "
AHS.327_02.000 RECOD: Duration of benign tumor: Time unit";
label variable aldura28 "AHS.327_02.000: Duration of benign tumor (in years)";
label variable aldurb28 "AHS.327_02.000: Duration of benign tumor recode 2";
label variable alchrc28 "AHS.327_02.000: Benign tumor condition status";
label variable altime29 "
AHS.328_01.000 RECOD: Duration of alcohol or drug problem: Number of units";
label variable alunit29 "
AHS.328_02.000 RECOD: Duration of alcohol or drug problem: Time unit";
label variable aldura29 "
AHS.328_02.000: Duration of alcohol or drug problem (in years)";
label variable aldurb29 "
AHS.328_02.000: Duration of alcohol or drug problem recode 2";
label variable alchrc29 "
AHS.328_02.000: Alcohol or drug problem condition status";
label variable altime30 "
AHS.329_01.000 RECOD: Duration of other mental problem: Number of units";
label variable alunit30 "
AHS.329_02.000 RECOD: Duration of other mental problem: Time unit";
label variable aldura30 "
AHS.329_02.000: Duration of other mental problem (in years)";
label variable aldurb30 "
AHS.329_02.000: Duration of other mental problem recode 2";
label variable alchrc30 "AHS.329_02.000: Other mental problem condition status";
label variable altime31 "
AHS.330_01.000 RECOD: Duration of surgical after-effects: Number of units";
label variable alunit31 "
AHS.330_02.000 RECOD: Duration of surgical after-effects: Time unit";
label variable aldura31 "
AHS.330_02.000: Duration of surgical after-effects (in years)";
label variable aldurb31 "
AHS.330_02.000: Duration of surgical after-effects recode 2";
label variable alchrc31 "AHS.330_02.000: Surgical after-effects condition status
";
label variable altime32 "
AHS.331_01.000 RECOD: Duration of 'old age'-related problems: Number of units";
label variable alunit32 "
AHS.331_02.000 RECOD: Duration of 'old age'-related problems: Number of units";
label variable aldura32 "
AHS.331_02.000: Duration of 'old age'-related problems (in years)";
label variable aldurb32 "
AHS.331_02.000: Duration of 'old age'-related problems, recode 2";
label variable alchrc32 "
AHS.331_02.000: 'Old age'-related problems condition status";
label variable altime33 "
AHS.332_01.000 RECOD: Duration of fatigue problem: Number of units";
label variable alunit33 "
AHS.332_02.000 RECOD: Duration of fatigue problem: Time unit";
label variable aldura33 "AHS.332_02.000: Duration of fatigue problem (in years)
";
label variable aldurb33 "AHS.332_02.000: Duration of fatigue problem recode 2";
label variable alchrc33 "AHS.332_02.000: Fatigue problem condition status";
label variable altime34 "
AHS.333_01.000 RECOD: Duration of pregnancy-related problem: Number of units";
label variable alunit34 "
AHS.333_02.000 RECOD: Duration of pregnancy-related problem: Time unit";
label variable aldura34 "
AHS.333_02.000: Duration of pregnancy-related problem (in years)";
label variable aldurb34 "
AHS.333_02.000: Duration of pregnancy-related problem recode 2";
label variable alchrc34 "AHS.333_02.000: Pregnancy-related condition status";
label variable altime90 "
AHS.335_01.000: Duration of other N.E.C. problem (1): Number of units";
label variable alunit90 "
AHS.335_02.000: Duration of other N.E.C. problem (1): Time unit";
label variable aldura90 "
AHS.335_02.000: Duration of other N.E.C. problem (1) (in years)";
label variable aldurb90 "
AHS.335_02.000: Duration of other N.E.C. problem (1) recode 2";
label variable alchrc90 "
AHS.335_02.000: Other N.E.C. problem (1) condition status";
label variable altime91 "
AHS.336_01.000: Duration of other N.E.C. problem (2): Number of units";
label variable alunit91 "
AHS.336_02.000: Duration of other N.E.C. problem (2): Time unit";
label variable aldura91 "
AHS.336_02.000: Duration of other N.E.C. problem (2) (in years)";
label variable aldurb91 "
AHS.336_02.000: Duration of other N.E.C. problem (2) recode 2";
label variable alchrc91 "
AHS.336_02.000: Other N.E.C. problem (2) condition status";
label variable alcndrt  "
AHS.336_02.000: Chronic condition recode for individual w/ functional limitation
";
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
AAU.111_01.000: Can't afford prescription medicine, past 12 m";
label variable ahcafyr2 "
AAU.111_02.000: Can't afford mental health care/counseling, 12 m";
label variable ahcafyr3 "AAU.111_03.000: Can't afford dental care, past 12 m";
label variable ahcafyr4 "AAU.111_04.000: Can't afford eyeglasses, past 12 m";
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
label variable shtfluyr "AAU.310_00.000: Flu shot past 12 m";
label variable ashflu_m "AAU.312_01.000: Month of most recent flu shot";
label variable ashflu_y "AAU.312_02.000: Year of most recent flu shot";
label variable sprfluyr "AAU.315_00.000: Flu spray past 12 m";
label variable aspflu_m "AAU.318_01.000: Month of most recent flu nasal vaccine
";
label variable aspflu_y "AAU.318_02.000: Year of most recent flu nasal vaccine";
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
AAU.450_00.010: Had any kind of chronic/long-term liver condition";
label variable travel   "
AAU.460_00.010: Ever traveled outside USA since 1995 (Excluding Europe, Japan, A
ustralia, New Zealand, and Canada)";

label variable ocond    "AOH.010_00.000: Describe condition of your mouth";
label variable obtws    "
AOH.020_00.000: Condition of mouth compared to others your age";
label variable oemb     "
AOH.030_00.000: Self-conscious or embarrassed by teeth, mouth, dentures";
label variable oreas_1  "
AOH.040_01.000: Hours work/school missed for emergency dental care, past 6 m.";
label variable oreas_2  "
AOH.040_02.000: Hours work/school missed for routine dental/orthodontic care, pa
st 6 m.";
label variable oreas_3  "
AOH.040_03.000: Hours work/school missed for tooth whitening/cosmetic procedures
, past 6 m.";
label variable oreas_4  "
AOH.040_04.000: Hours work/school missed for taking someone else for dental care
, past 6 m.";
label variable oprob_01 "
AOH.050_01.000: Problem with toothache or sensitive teeth, past 6 m.";
label variable oprob_02 "AOH.050_02.000: Problem with bleeding gums, past 6 m.";
label variable oprob_03 "AOH.050_03.000: Problem with crooked teeth, past 6 m.";
label variable oprob_04 "
AOH.050_04.000: Problem with broken/missing teeth, past 6 m.";
label variable oprob_05 "
AOH.050_05.000: Problem with stained/discolored teeth, past 6 m.";
label variable oprob_06 "
AOH.050_06.000: Problem with loose teeth not injury related, past 6 m.";
label variable oprob_07 "
AOH.050_07.000: Problem with broken/missing fillings, past 6 m.";
label variable oprob_08 "
AOH.055_01.000: Problem with pain in your jaw joint, past 6 m.";
label variable oprob_09 "
AOH.055_02.000: Problem with sores in your mouth, past 6 m.";
label variable oprob_10 "
AOH.055_03.000: Problem with difficulty eating or chewing, past 6 m.";
label variable oprob_11 "AOH.055_04.000: Problem with bad breath, past 6 m.";
label variable oprob_12 "AOH.055_05.000: Problem with dry mouth, past 6 m.";
label variable odent1   "
AOH.060_00.000: Saw either dentist or medical doctor for dental problem, past 6 
m.";
label variable odent2   "
AOH.070_00.000: Which one seen, a dentist or a medical doctor, past 6 m.";
label variable onoden_1 "
AOH.080_01.000: Not important to see dentist for problem, past 6 m.";
label variable onoden_2 "AOH.080_02.000: Dental problem went away, past 6 m.";
label variable onoden_3 "
AOH.080_03.000: Couldn't afford treatment/ no insurance for dental problem, past
 6 m.";
label variable onoden_4 "AOH.080_04.000: No transportation to dentist, past 6 m.
";
label variable onoden_5 "
AOH.080_05.000: Afraid to see dentist for problems, past 6 m.";
label variable onoden_6 "
AOH.080_06.000: Waiting for dental appointment, past 6 m.";
label variable onoden_7 "
AOH.080_07.000: Didn't think dentist could fix problem, past 6 m.";
label variable oint_1   "
AOH.090_01.000: Dental problem interfere with work or school";
label variable oint_2   "AOH.090_02.000: Dental problem interfere with sleeping
";
label variable oint_3   "
AOH.090_03.000: Dental problem interfere with social activities";
label variable oint_4   "
AOH.090_04.000: Dental problem interfere with usual activities at home";
label variable ocexam   "AOH.100_00.000: Heard of exam for oral or mouth cancer
";
label variable octong   "
AOH.110_00.000: Had exam for oral cancer checking tongue/cheeks";
label variable ocneck   "AOH.120_00.000: Had exam for oral cancer checking neck
";
label variable ocexwhen "AOH.130_00.000: Most recent oral cancer exam";
label variable oexcheck "
AOH.140_00.000: Oral cancer exam routine or because of specific problem";
label variable ocexprof "
AOH.150_00.000: Type of health care professional performed most recent oral canc
er exam";

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

label variable sun1_sha "NAF.020_00.000: Stay in shade on warm sunny day";
label variable sun1_cap "
NAF.022_00.000: Wear baseball cap/visor on warm sunny day";
label variable sun1_hat "NAF.023_00.000: Wear wide-brimmed hat on warm sunny day
";
label variable sun2_lgs "
NAF.024_00.000: Wear long sleeved shirt on warm sunny day";
label variable sun2_lgp "
NAF.025_00.000: Wear long clothing to ankles on warm sunny day";
label variable sun2_scr "NAF.026_00.000: Use sunscreen on warm sunny day";
label variable spf      "NAF.027_00.000: SPF of sunscreen used most often";
label variable spfscale "NAF.028_00.000: SPF number of usual sunscreen";
label variable snnum    "
NAF.033_00.000: Number of times used tanning device in past year";
label variable paphad   "NAF.130_00.000: Ever had Pap smear test";
label variable pap6yr   "NAF.140_00.000: Number of Pap smears, last 6 years";
label variable rpap1_mt "NAF.150_01.000: Month of most recent Pap smear test";
label variable rpap1_yr "NAF.150_02.000: Year of most recent Pap smear test";
label variable rpap1n   "
NAF.160_01.000: Time ago date of Pap smear exam: # of units";
label variable rpap1t   "NAF.160_02.000: Time ago date of Pap smear:  Time unit
";
label variable rpap2ca  "NAF.165_00.000: Most recent Pap smear, time categories
";
label variable papreas  "NAF.170_00.000: Reason for most recent Pap smear";
label variable papabn   "NAF.180_00.000: Ever had abnormal Pap smear results";
label variable papnot   "NAF.210_00.000: Reason why no Pap smear";
label variable mdrecpap "
NAF.215_00.000: MD recommended Pap smear in the last year";
label variable papwhen  "NAF.216_00.000: When next Pap smear/test will be done";
label variable hyst     "NAF.220_00.000: Ever had a hysterectomy";
label variable hpvhrd   "NAF.221_00.000: Ever heard of HPV";
label variable hpvcaus  "NAF.222_00.000: Can HPV cause cervical cancer";
label variable hpvsexcn "NAF.223_00.000: Is HPV spread through sexual contact";
label variable hpvtret  "NAF.224_00.000: Does HPV go away without treatment";
label variable hpvhad   "NAF.224_00.010: Ever had HPV";
label variable shhpvhrd "NAF.225_00.000: Heard about HPV vaccine or shot";
label variable shthpv   "NAF.226_00.000: Ever received the HPV vaccine or shot";
label variable shhpvdos "NAF.227_00.000: Number of shots";
label variable hpvint   "NAF.228_00.000: Interested in HPV vaccine";
label variable hpvnot   "NAF.229_00.000: Main reason why no HPV vaccine";
label variable hpvcost  "NAF.229_00.010: Get HPV vaccine if cost was $360-$500";
label variable hpvlocst "NAF.229_00.020: Get HPV vaccine if free/at a lower cost
";
label variable mamhad   "NAF.230_00.000: Ever had mammogram";
label variable mam6yr   "NAF.250_00.000: Number of mammograms, last 6 years";
label variable rmam1_mt "NAF.260_01.000: Month of most recent mammogram";
label variable rmam1_yr "NAF.260_02.000: Year of most recent mammogram";
label variable rmam1n   "NAF.270_01.000: Time ago date of mammogram: # of units
";
label variable rmam1t   "NAF.270_02.000: Time ago date of mammogram: Time unit";
label variable rmam2ca  "NAF.275_00.000: Most recent mammogram, time categories
";
label variable mamreas  "NAF.310_00.000: Reason for most recent mammogram";
label variable mdrecmam "NAF.370_00.000: MD recommended mammogram in past year";
label variable maminfo  "
NAF.371_00.000: Read conflicting information about mammograms";
label variable mamdelay "
NAF.372_00.000: Conflicting information caused delay/no mammogram";
label variable hrtever  "NAF.373_00.000: Ever took hormone replacement therapy";
label variable hrtnow   "NAF.374_00.000: Now taking hormone replacement therapy
";
label variable hrtlong  "
NAF.375_00.000: Length of time taking hormone replacement therapy";
label variable psahad   "NAF.430_00.000: Ever had PSA test";
label variable rpsa1_mt "NAF.460_01.000: Month of most recent PSA test";
label variable rpsa1_yr "NAF.460_02.000: Year of most recent PSA test";
label variable rpsa1n   "NAF.470_01.000: Time ago date of PSA test: # of units";
label variable rpsa1t   "NAF.470_02.000: Time ago date of PSA test: Time unit";
label variable rpsa2    "NAF.475_00.000: Most recent PSA test, time categories";
label variable psareas  "NAF.480_00.000: Reason for most recent PSA";
label variable mdrecpsa "NAF.485_00.000: MD recommended PSA test in past year";
label variable crehad   "NAF.540_00.000: Ever had colorectal screening exam";
label variable rcre1_mt "NAF.560_01.000: Month of most recent colorectal exam";
label variable rcre1_yr "NAF.560_02.000: Year of most recent colorectal exam";
label variable rcre1n   "
NAF.570_01.000: Time ago date of colorectal exam: # of units";
label variable rcre1t   "
NAF.570_02.000: Time ago date of colorectal exam: Time unit";
label variable rcre2    "
NAF.575_00.000: Most recent colorectal exam, time categories";
label variable crenam   "NAF.580_00.000: Type of recent colorectal exam";
label variable crereas  "NAF.590_00.000: Reason for most recent colorectal exam
";
label variable crerec   "
NAF.610_00.000: MD recommended colorectal screening exam";
label variable hfobhad  "
NAF.620_00.000: Had blood stool test using home test kit";
label variable rhfo1_mt "
NAF.640_01.000: Month of most recent home blood stool test";
label variable rhfo1_yr "
NAF.640_02.000: Year of most recent home blood stool test";
label variable rhfo1n   "
NAF.650_01.000: Time ago date of home blood stool test: # of units";
label variable rhfo1t   "
NAF.650_02.000: Time ago date of home blood stool test: Time unit";
label variable rhfo2    "
NAF.655_00.000: Most recent home blood stool test, time categories";
label variable mdhfob   "
NAF.700_00.000: MD recommended home blood stool test, past year";

label variable hyppreg  "
PAF.010_00.000: Was your high blood pressure only during pregnancy";
label variable hloswgt  "
PAF.020_00.000: Ever advised to change diet to lower high blood pressure";
label variable wgtadev  "
PAF.030_00.000: Ever follow advice to change diet for high blood pressure";
label variable wgtadnow "
PAF.040_00.000: Now following advice to change diet for high blood pressure";
label variable lowslt   "
PAF.050_00.000: Ever told to reduce salt for high blood pressure";
label variable lowsltev "
PAF.060_00.000: Ever follow advice to reduce salt for high blood pressure";
label variable lowsltnw "
PAF.070_00.000: Now following advice to reduce salt for high blood pressure";
label variable exerc    "
PAF.080_00.000: Ever told to exercise for high blood pressure";
label variable exercev  "
PAF.090_00.000: Ever follow advice to exercise for high blood pressure";
label variable exercnw  "
PAF.100_00.000: Now following advice to exercise for high blood pressure";
label variable hbpalc   "
PAF.110_00.000: Ever told to reduce alcohol due to high blood pressure";
label variable hbpalcev "
PAF.120_00.000: Ever follow advice to reduce alcohol use for high blood pressure
";
label variable hbpalcnw "PAF.130_00.000: Now following advice to reduce alcohol
";
label variable hypmedev "
PAF.140_00.000: Ever prescribed medicine for high blood pressure";
label variable hypmed   "
PAF.150_00.000: NOW taking medicine prescribed for high blood pressure";
label variable hymdmed  "
PAF.160_00.000: Advised to stop taking medicine for high blood pressure";

label variable baid_01  "BAL.010_01.000: Use a cane to help get around";
label variable baid_02  "BAL.010_02.000: Use crutches to help get around";
label variable baid_03  "BAL.010_03.000: Use a walker to help get around";
label variable baid_04  "BAL.010_04.000: Use a wheelchair to help get around";
label variable baid_05  "BAL.010_05.000: Use a scooter to help get around";
label variable baid_06  "BAL.010_06.000: Use a brace to help get around";
label variable baid_07  "
BAL.010_07.000: Use artificial or replacement limbs or joints to help get around
";
label variable baid_08  "
BAL.010_08.000: Use medically prescribed shoes or orthotics to help get around";
label variable bbrac1   "BAL.020_01.000: Type of brace used: Ankle";
label variable bbrac2   "BAL.020_02.000: Type of brace used: Arm";
label variable bbrac3   "BAL.020_03.000: Type of brace used: Back";
label variable bbrac4   "BAL.020_04.000: Type of brace used: Knee";
label variable bbrac5   "BAL.020_05.000: Type of brace used: Leg";
label variable bbrac6   "BAL.020_06.000: Type of brace used: Neck";
label variable bbrac7   "BAL.020_07.000: Type of brace used: Wrist";
label variable bart1    "BAL.030_01.000: Part that is artificial: Arm";
label variable bart2    "BAL.030_02.000: Part that is artificial: Leg";
label variable bart3    "BAL.030_03.000: Part that is artificial: Hip";
label variable bart4    "BAL.030_04.000: Part that is artificial: Knee";
label variable bart5    "BAL.030_05.000: Part that is artificial: Other";
label variable bdizz    "
BAL.040_00.000: Had problem with dizziness or balance, past 12 months";
label variable bbal_01  "
BAL.050_01.000: Had muscle weakness that affects walking, past 12 months";
label variable bbal_02  "BAL.050_02.000: Had severe fatigue, past 12 months";
label variable bbal_03  "
BAL.050_03.000: Had problems with drifting to the side when trying to walk strai
ght, past 12 months";
label variable bbal_04  "
BAL.050_04.000: Had problems walking through a doorway without bumping into one 
side, past 12 months";
label variable bbal_05  "
BAL.050_05.000: Had difficulty walking in the dark, past 12 months";
label variable bbal_06  "
BAL.050_06.000: Had difficulty walking on uneven ground or surfaces, past 12 mon
ths";
label variable bbal_07  "
BAL.050_07.000: Had difficulty walking with bi- or tri-focal or progressive lens
es or contacts, past 12 months";
label variable bbal_08  "
BAL.050_08.000: Had blurred or fuzzy vision when moving head, past 12 months";
label variable bbal_09  "BAL.050_09.000: Had fear of heights, past 12 months";
label variable bbal_10  "
BAL.050_10.000: Had fear of large open spaces, past 12 months";
label variable bbal_11  "
BAL.050_11.000: Had difficulty walking up a flight of stairs, past 12 months";
label variable bbal_12  "
BAL.050_12.000: Had difficulty walking down a flight of stairs, past 12 months";
label variable bbal_13  "
BAL.050_13.000: Had difficulty riding an escalator or moving walkway, past 12 mo
nths";
label variable bbal_14  "
BAL.050_14.000: Had difficulty going through tunnels, past 12 months";
label variable bbal_15  "
BAL.050_15.000: Had difficulty going over bridges, past 12 months";
label variable bbalct   "BAL.055_00.000: Count of balance problems";
label variable btype_01 "
BAL.060_01.000: Had a spinning or vertigo sensation, past 12 months";
label variable btype_02 "
BAL.060_02.000: Had a floating, spacey, or tilting sensation, past 12 months";
label variable btype_03 "
BAL.060_03.000: Felt lightheaded, without a sense of motion, past 12 months";
label variable btype_04 "
BAL.060_04.000: Had feeling as if passing out or fainting, past 12 months";
label variable btype_05 "
BAL.060_05.000: Had blurring of vision when moved head, past 12 months";
label variable btype_06 "
BAL.060_06.000: Felt off-balance or unsteady, past 12 months";
label variable btypect  "
BAL.065-00.000: Count of symptoms of dizziness or balance problems";
label variable bboth    "
BAL.070_00.000: Most bothersome feeling of dizziness or balance problem, past 12
 months";
label variable bage     "BAL.080_00.000: Age when feeling first happened";
label variable blong    "
BAL.090_00.000: Length of time had dizziness or balance problem";
label variable boften   "
BAL.100_00.000: How often had dizziness or balance problem, past 12 months";
label variable blast    "
BAL.110_00.000: How long each spell or bout of dizziness or balance problem last
s";
label variable btrig_01 "
BAL.120_01.000: Dizziness or balance problem triggered by turning head side to s
ide";
label variable btrig_02 "
BAL.120_02.000: Dizziness or balance problem triggered by looking up or down";
label variable btrig_03 "
BAL.120_03.000: Dizziness or balance problem triggered by rolling over in bed";
label variable btrig_04 "
BAL.120_04.000: Dizziness or balance problem triggered by getting up after sitti
ng or lying down";
label variable btrig_05 "
BAL.120_05.000: Dizziness or balance problem triggered by standing or being on y
our feet for a long time";
label variable btrig_06 "
BAL.120_06.000: Dizziness or balance problem triggered by riding in a car, bus, 
airplane, boat, or train";
label variable btrig_07 "
BAL.120_07.000: Dizziness or balance problem triggered by walking down a grocery
 store aisle";
label variable btrig_08 "
BAL.120_08.000: Dizziness or balance problem triggered by hearing loud sounds";
label variable btrig_09 "
BAL.120_09.000: Dizziness or balance problem triggered by blowing nose";
label variable btrig_10 "
BAL.120_10.000: Dizziness or balance problem triggered by prescription medicine 
or drugs";
label variable btrig_11 "
BAL.120_11.000: Dizziness or balance problem triggered by over-the-counter medic
ine";
label variable btrig_12 "
BAL.120_12.000: Dizziness or balance problem triggered by eating too much salt";
label variable btrig_13 "
BAL.120_13.000: Dizziness or balance problem triggered by certain foods or drink
s";
label variable bsame_01 "
BAL.130_01.000: Nausea or vomiting happens around same time as dizziness or bala
nce problem";
label variable bsame_02 "
BAL.130_02.000: Motion sickness or discomfort happens around same time as dizzin
ess or balance problem";
label variable bsame_03 "
BAL.130_03.000: Difficulty rolling over in bed happens around same time as dizzi
ness or balance problem";
label variable bsame_04 "
BAL.130_04.000: Hearing loss in one or both ears happens around same time as diz
ziness or balance problem";
label variable bsame_05 "
BAL.130_05.000: Tinnitus happens around same time as dizziness or balance proble
m";
label variable bsame_06 "
BAL.130_06.000: Earache or pain happens around same time as dizziness or balance
 problem";
label variable bsame_07 "
BAL.130_07.000: Fullness or pressure in ear without pain happens around same tim
e as dizziness or balance problem";
label variable bsame_08 "
BAL.130_08.000: Sinus congestion happens around same time as dizziness or balanc
e problem";
label variable bsame_09 "
BAL.130_09.000: Migraine headache happens around same time as dizziness or balan
ce problem";
label variable bsame_10 "
BAL.130_10.000: Headache, other than migraine happens around same time as dizzin
ess or balance problem";
label variable bsame_11 "
BAL.130_11.000: Neck pain happens around same time as dizziness or balance probl
em";
label variable bsame_12 "
BAL.130_12.000: Blurred or double vision happens around same time as dizziness o
r balance problem";
label variable bsame_13 "
BAL.130_13.000: Loss of vision or blacking out happens around same time as dizzi
ness or balance problem";
label variable bsame_14 "
BAL.130_14.000: Sweats or sweating happens around same time as dizziness or bala
nce problem";
label variable bsame_15 "
BAL.130_15.000: Shortness of breath or trouble breathing happens around same tim
e as dizziness or balance problem";
label variable bsame_16 "
BAL.130_16.000: Difficulty speaking or slurred speech happens around same time a
s dizziness or balance problem";
label variable bsame_17 "
BAL.130_17.000: Difficulty swallowing happens around same time as dizziness or b
alance problem";
label variable bsame_18 "
BAL.130_18.000: Numbness in face, hands, or feet happens around same time as diz
ziness or balance problem";
label variable bsame_19 "
BAL.130_19.000: Weak or clumsy arms or legs happens around same time as dizzines
s or balance problem";
label variable bsame_20 "
BAL.130_20.000: High level of stress happens around same time as dizziness or ba
lance problem";
label variable bsame_21 "
BAL.130_21.000: Anxiety happens around same time as dizziness or balance problem
";
label variable bsame_22 "
BAL.130_22.000: Depression happens around same time as dizziness or balance prob
lem";
label variable bonly_01 "
BAL.140_01.000: Have nausea or vomiting only or regardless when having dizziness
 or balance problem";
label variable bonly_02 "
BAL.140_02.000: Have motion sickness or discomfort only or regardless when havin
g dizziness or balance problem";
label variable bonly_03 "
BAL.140_03.000: Have difficulty rolling over in bed only or regardless when havi
ng dizziness or balance problem";
label variable bonly_04 "
BAL.140_04.000: Have hearing loss in one or both ears only or regardless when ha
ving dizziness or balance problem";
label variable bonly_05 "
BAL.140_05.000: Have tinnitus only or regardless when having dizziness or balanc
e problem";
label variable bonly_06 "
BAL.140_06.000: Have earache or pain only or regardless when having dizziness or
 balance problem";
label variable bonly_07 "
BAL.140_07.000: Have fullness or pressure in ear only or regardless when having 
dizziness or balance problem";
label variable bonly_08 "
BAL.140_08.000: Have sinus congestion only or regardless when having dizziness o
r balance problem";
label variable bonly_09 "
BAL.140_09.000: Have migraine headache only or regardless when having dizziness 
or balance problem";
label variable bonly_10 "
BAL.140_10.000: Have headache other than migraine only or regardless when having
 dizziness or balance problem";
label variable bonly_11 "
BAL.140_11.000: Have neck pain only or regardless when having dizziness or balan
ce problem";
label variable bonly_12 "
BAL.140_12.000: Have blurred or double vision only or regardless when having diz
ziness or balance problem";
label variable bonly_13 "
BAL.140_13.000: Have loss of vision or blacking out only or regardless when havi
ng dizziness or balance problem";
label variable bonly_14 "
BAL.140_14.000: Have sweats or sweating only or regardless when having dizziness
 or balance problem";
label variable bonly_15 "
BAL.140_15.000: Have shortness of breath or trouble breathing only or regardless
 when having dizziness or balance problem";
label variable bonly_16 "
BAL.140_16.000: Have difficulty speaking or slurred speech only or regardless wh
en having dizziness or balance problem";
label variable bonly_17 "
BAL.140_17.000: Have difficulty swallowing only or regardless when having dizzin
ess or balance problem";
label variable bonly_18 "
BAL.140_18.000: Have numbness in face, hands, or feet only or regardless when ha
ving dizziness or balance problem";
label variable bonly_19 "
BAL.140_19.000: Have weak or clumsy arms or legs only or regardless when having 
dizziness or balance problem";
label variable bonly_20 "
BAL.140_20.000: Have high level of stress only or regardless when having dizzine
ss or balance problem";
label variable bonly_21 "
BAL.140_21.000: Have anxiety only or regardless when having dizziness or balance
 problem";
label variable bonly_22 "
BAL.140_22.000: Have depression only or regardless when having dizziness or bala
nce problem";
label variable bhosp    "
BAL.150_00.000: Ever gone to hospital or ER about dizziness or balance problem";
label variable bhospno  "
BAL.160_00.000: Number of times gone to ER about dizziness or balance problem, p
ast 5 years";
label variable bhp      "
BAL.170_00.000: Ever see a doctor or other health professional, except for in ER
, about dizziness or balance problem";
label variable bhp_01   "
BAL.180_01.000: Saw a family doctor or general practitioner for dizziness or bal
ance problem";
label variable bhp_02   "
BAL.180_02.000: Saw a cardiologist or doctor of internal medicine about dizzines
s or balance problem";
label variable bhp_03   "
BAL.180_03.000: Saw an ear, nose, and throat doctor about dizziness or balance p
roblem";
label variable bhp_04   "
BAL.180_04.000: Saw a neurologist about dizziness or balance problem";
label variable bhp_05   "
BAL.180_05.000: Saw an eye doctor, optometrist, or an ophthalmologist about dizz
iness or balance problem";
label variable bhp_06   "
BAL.180_06.000: Saw a dentist, orthodontist, or oral surgeon about dizziness or 
balance problem";
label variable bhp_07   "
BAL.180_07.000: Saw a gynecologist or OB/GYN about dizziness or balance problem
";
label variable bhp_08   "
BAL.180_08.000: Saw a psychiatrist, psychologist, or social worker about dizzine
ss or balance problem";
label variable bhp_09   "
BAL.180_09.000: Saw a chiropractor about dizziness or balance problem";
label variable bhp_10   "
BAL.180_10.000: Saw an osteopath or doctor of osteopathy about dizziness or bala
nce problem";
label variable bhp_11   "
BAL.180_11.000: Saw an occupational therapist, physical therapist, or rehabilita
tion specialist about dizziness or balance problem";
label variable bhp_12   "
BAL.180_12.000: Saw a nurse or nurse practitioner about dizziness or balance pro
blem";
label variable bhp_13   "
BAL.180_13.000: Saw a nutritionist or dietician about dizziness or balance probl
em";
label variable bhp_14   "
BAL.180_14.000: Saw a foot doctor about dizziness or balance problem";
label variable bhp_15   "
BAL.180_15.000: Saw a radiologist or technician for MRI, CAT scan, or ultrasound
 about dizziness or balance problem";
label variable bhp_16   "
BAL.180_16.000: Saw some other health professional about dizziness or balance pr
oblem";
label variable b5yrs    "
BAL.190_00.000: Number of times seen a health professional about dizziness or ba
lance problem, past 5 years";
label variable bfirst   "
BAL.200_00.000: Time since first saw health professional about dizziness or bala
nce problem";
label variable bdiff    "
BAL.210_00.000: Total number of different health professionals seen about dizzin
ess or balance problem";
label variable bhelp    "
BAL.220_00.000: Health professionals helped with dizziness or balance problem";
label variable bthlp_no "
BAL.230_01.000: Time between first time saw health professional about dizziness 
or balance problem and felt helped: #of units";
label variable bthlp_tp "
BAL.230_02.000: Time between first time saw health professional about dizziness 
or balance problem and felt helped: time period";
label variable bdiag    "
BAL.240_00.000: Health professional gave cause or diagnosis for dizziness or bal
ance problem";
label variable bcaus_01 "
BAL.250_01.000: Cause of dizziness or balance problem: Antibiotics given I.V.";
label variable bcaus_02 "
BAL.250_02.000: Cause of dizziness or balance problem: Arthritis";
label variable bcaus_03 "
BAL.250_03.000: Cause of dizziness or balance problem: Brain tumor";
label variable bcaus_04 "
BAL.250_04.000: Cause of dizziness or balance problem: Cogan's syndrome or Sjogr
en's syndrome";
label variable bcaus_05 "
BAL.250_05.000: Cause of dizziness or balance problem: Loose or dislodged crysta
ls in ear or BPPV";
label variable bcaus_06 "
BAL.250_06.000: Cause of dizziness or balance problem: Diabetes";
label variable bcaus_07 "
BAL.250_07.000: Cause of dizziness or balance problem: Head or neck trauma or co
ncussion";
label variable bcaus_08 "
BAL.250_08.000: Cause of dizziness or balance problem: Heart disease";
label variable bcaus_09 "
BAL.250_09.000: Cause of dizziness or balance problem: Inner ear infection";
label variable bcaus_10 "
BAL.250_10.000: Cause of dizziness or balance problem: Meniere's disease";
label variable bcaus_11 "
BAL.250_11.000: Cause of dizziness or balance problem: Migraine headaches";
label variable bcaus_12 "
BAL.250_12.000: Cause of dizziness or balance problem: Neurological or muscular 
conditions";
label variable bcaus_13 "
BAL.250_13.000: Cause of dizziness or balance problem: Side effect of medicines 
or drugs";
label variable bcaus_14 "
BAL.250_14.000: Cause of dizziness or balance problem: Stroke";
label variable bcaus_15 "
BAL.250_15.000: Cause of dizziness or balance problem: TMJ";
label variable bcaus_16 "
BAL.250_16.000: Cause of dizziness or balance problem: Other health problem(s)";
label variable btret    "
BAL.260_00.000: Taken or tried anything to treat dizziness or balance problem";
label variable btret_01 "
BAL.270_01.000: Treatments tried: Exercises or physical therapy";
label variable btret_02 "
BAL.270_02.000: Treatments tried: Head rolling maneuver by a doctor or therapist
";
label variable btret_03 "
BAL.270_03.000: Treatments tried: Steroid injections into ear";
label variable btret_04 "
BAL.270_04.000: Treatments tried: Gentamicin injection into ear";
label variable btret_05 "BAL.270_05.000: Treatments tried: Ear surgery";
label variable btret_06 "BAL.270_06.000: Treatments tried: Head or neck surgery
";
label variable btret_07 "
BAL.270_07.000: Treatments tried: Bed rest for several hours or days";
label variable btret_08 "BAL.270_08.000: Treatments tried: Psychiatric treatment
";
label variable btret_09 "
BAL.270_09.000: Treatments tried: Chiropractic treatment or manipulation";
label variable btret_10 "BAL.270_10.000: Treatments tried: Acupuncture";
label variable btret_11 "BAL.270_11.000: Treatments tried: Massage therapy";
label variable btret_12 "
BAL.270_12.000: Treatments tried: Tai Chi, Yoga, or Qi Gong";
label variable btret_13 "BAL.270_13.000: Treatments tried: Hypnosis";
label variable btret_14 "BAL.270_14.000: Treatments tried: Low salt diet";
label variable btret_15 "
BAL.270_15.000: Treatments tried: Avoiding or cutting back on certain foods or d
rinks";
label variable btret_16 "
BAL.270_16.000: Treatments tried: Quitting or reducing use of tobacco or cigaret
tes";
label variable btret_17 "
BAL.270_17.000: Treatments tried: Prescription medicine or drugs";
label variable btret_18 "
BAL.270_18.000: Treatments tried: Over-the-counter medicine";
label variable btret_19 "BAL.270_19.000: Treatments tried: Herbal remedy";
label variable btret_20 "
BAL.270_20.000: Treatments tried: Meniette device, air pressure pulses in ear";
label variable btret_21 "
BAL.270_21.000: Treatments tried: Wearing acupressure wristband or Sea-Band";
label variable btret_22 "BAL.270_22.000: Treatments tried: Wearing magnets";
label variable btret_23 "BAL.270_23.000: Treatments tried: Mouth guard";
label variable bstat    "
BAL.280_00.000: Dizziness or balance problem worse, same, or improved, past 12 m
onths";
label variable bmedic   "
BAL.290_00.000: Take medicine on a regular basis for any health problem(s)";
label variable bbett    "
BAL.300_00.000: Medicine causes dizziness or balance problem to get worse";
label variable bchng    "
BAL.310_00.000: Dizziness or balance problems prevent you from doing things";
label variable bchng_01 "
BAL.320_01.000: Dizziness or balance problems caused change in activities: Work 
or school";
label variable bchng_02 "
BAL.320_02.000: Dizziness or balance problems caused change in activities: Drivi
ng a motor vehicle";
label variable bchng_03 "
BAL.320_03.000: Dizziness or balance problems caused change in activities: Ridin
g in a car, bus, airplane, boat, or train";
label variable bchng_04 "
BAL.320_04.000: Dizziness or balance problems caused change in activities: Exerc
ising or taking walks";
label variable bchng_05 "
BAL.320_05.000: Dizziness or balance problems caused change in activities: Stand
ing or being on feet for 30 minutes or longer";
label variable bchng_06 "
BAL.320_06.000: Dizziness or balance problems caused change in activities: Walki
ng down a flight of stairs";
label variable bchng_07 "
BAL.320_07.000: Dizziness or balance problems caused change in activities: Walki
ng or climbing up 10 steps without resting";
label variable bchng_08 "
BAL.320_08.000: Dizziness or balance problems caused change in activities: Going
 outside home for shopping, movies, sporting or other events";
label variable bchng_09 "
BAL.320_09.000: Dizziness or balance problems caused change in activities: Parti
cipating in social activities";
label variable bchng_10 "
BAL.320_10.000: Dizziness or balance problems caused change in activities: Bathi
ng, dressing, feeding yourself, or going to the toilet";
label variable bmisswk  "
BAL.330_00.000: Ever missed work or school because of dizziness or balance probl
em";
label variable blms_no  "
BAL.340_01.000: Time missed from school or work during entire life because of di
zziness or balance problem: # of units";
label variable blms_tp  "
BAL.340_02.000: Time missed from school or work during entire life because of di
zziness or balance problem: time period";
label variable bm12_no  "
BAL.350_01.000: Time missed from school or work, past 12 months because of dizzi
ness or balance problem: # of units";
label variable bm12_tp  "
BAL.350_02.000: Time missed from school or work, past 12 months because of dizzi
ness or balance problem: time period";
label variable bprob    "
BAL.360_00.000: How much of a problem was dizziness or balance condition, past 1
2 months";
label variable bmed_01  "
BAL.370_01.000: Taken or had any of the following for any health condition: Anti
biotics given I.V.";
label variable bmed_02  "
BAL.370_02.000: Taken or had any of the following for any health condition: Anti
biotics injected into ear";
label variable bmed_03  "
BAL.370_03.000: Taken or had any of the following for any health condition: Diur
etics";
label variable bmed_04  "
BAL.370_04.000: Taken or had any of the following for any health condition: Anti
vert (Meclizine)";
label variable bmed_05  "
BAL.370_05.000: Taken or had any of the following for any health condition: Medi
cine or patches for motion sickness, nausea, or vomiting";
label variable bmed_06  "
BAL.370_06.000: Taken or had any of the following for any health condition: Medi
cines for anxiety";
label variable bmed_07  "
BAL.370_07.000: Taken or had any of the following for any health condition: Chem
otherapy drugs";
label variable bmed_08  "
BAL.370_08.000: Taken or had any of the following for any health condition: X-ra
y, MRI, or CAT scan of the head";
label variable bbio     "
BAL.380_00.000: Any biological relatives have trouble with dizziness, balance, o
r falling";
label variable bfall5   "BAL.390_00.000: Fell at least one time, past 5 years";
label variable bfl_01   "
BAL.400_01.000: Fall occurred just before or around time felt sense of spinning,
 past 5 years";
label variable bfl_02   "
BAL.400_02.000: Fall occurred just before or around time had floating or spacey 
feeling, past 5 years";
label variable bfl_03   "
BAL.400_03.000: Fall occurred just before or around time felt lightheaded, past 
5 years";
label variable bfl_04   "
BAL.400_04.000: Fall occurred just before or around time felt about to pass out,
 past 5 years";
label variable bfl_05   "
BAL.400_05.000: Fall occurred just before or around time had blurred vision, pas
t 5 years";
label variable bfl_06   "
BAL.400_06.000: Fall occurred just before or around time had unsteadiness, past 
5 years";
label variable bfall12  "
BAL.410_00.000: Fell once a month on average, past 12 months";
label variable bf12_no  "BAL.420_01.000: Times fell, past 12 months: #of units";
label variable bf12_tp  "BAL.420_02.000: Times fell, past 12 months: time period
";
label variable bftime   "BAL.430_00.000: Number of time fell, past 12 months";
label variable binj     "
BAL.440_00.000: Had an injury resulting from a fall, past 12 months";
label variable bijms_no "
BAL.450_01.000: Time missed from work or school due to injury from fall, past 12
 months: # of units";
label variable bijms_tp "
BAL.450_02.000: Time missed from work or school due to injury from fall, past 12
 months: time period";
label variable bfwhy_01 "
BAL.460_01.000: Reason fell, past 12 months: Tripped or stumbled";
label variable bfwhy_02 "BAL.460_02.000: Reason fell, past 12 months: Slipped";
label variable bfwhy_03 "
BAL.460_03.000: Reason fell, past 12 months: Hurried too much";
label variable bfwhy_04 "
BAL.460_04.000: Reason fell, past 12 months: Not paying attention";
label variable bfwhy_05 "
BAL.460_05.000: Reason fell, past 12 months: Had nothing to hold onto";
label variable bfwhy_06 "
BAL.460_06.000: Reason fell, past 12 months: Blacked out or fainted";
label variable bfwhy_07 "
BAL.460_07.000: Reason fell, past 12 months: Lost balance";
label variable bfwhy_08 "
BAL.460_08.000: Reason fell, past 12 months: Knocked over by someone or somethin
g";
label variable bfwhy_09 "
BAL.460_09.000: Reason fell, past 12 months: Playing sports or exercising";
label variable bfwhy_10 "
BAL.460_10.000: Reason fell, past 12 months: Had a problem with hearing";
label variable bfwhy_11 "
BAL.460_11.000: Reason fell, past 12 months: Had a problem with vision";
label variable bfwhy_12 "
BAL.460_12.000: Reason fell, past 12 months: Getting up after sitting or lying d
own";
label variable bfwhy_13 "
BAL.460_13.000: Reason fell, past 12 months: Walking up or down stairs";
label variable bfwhy_14 "
BAL.460_14.000: Reason fell, past 12 months: Has slow reactions or reflexes";
label variable bfwhy_15 "
BAL.460_15.000: Reason fell, past 12 months: Had weakness or numbness in one or 
both legs";
label variable bfwhy_16 "
BAL.460_16.000: Reason fell, past 12 months: Had not eaten recently or had low b
lood sugar";
label variable bfwhy_17 "
BAL.460_17.000: Reason fell, past 12 months: Had a problem with medicine";
label variable bfwhy_18 "
BAL.460_18.000: Reason fell, past 12 months: Drank too much alcohol";
label variable bfwhy_19 "
BAL.460_19.000: Reason fell, past 12 months: Had problem using a walker, cane, o
r other aid";
label variable bfwhy_20 "
BAL.460_20.000: Reason fell, past 12 months: Had problem with shoes, sandals, or
 socks";
label variable bfwhy_21 "
BAL.460_21.000: Reason fell, past 12 months: Had a health condition";
label variable bfwhy_22 "
BAL.460_22.000: Reason fell, past 12 months: Some other reason";

* DEFINE VALUE LABELS FOR REPORTS;

label define sap001x
   10       "10 Household"
   20       "20 Person"
   30       "30 Sample Adult"
   31       "31 Sample Adult Cancer"
   40       "40 Sample Child"
   60       "60 Family"
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
   1        "1 Working for pay at a job or business"
   2        "2 With a job or business but not at work"
   3        "3 Looking for work"
   4        "4 Working, but not for pay, at a family-owned job or business"
   5        "5 Not working at a job or business and not looking for work"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap024x
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
label define sap025x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap030x
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
label define sap032x
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
label define sap033x
   00       "00 Less than 1 year"
   35       "35 35 or more years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap041x
   00       "00 Never"
   95       "95 95 or more"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap042x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap043x
   1        "1 Not told"
   2        "2 High"
   3        "3 Normal"
   4        "4 Low"
   5        "5 Borderline"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap058x
   1        "1 Advise them to drive to the hospital"
   2        "2 Advise them to call their physician"
   3        "3 Call 9-1-1 (or another emergency number)"
   4        "4 Call spouse or family member"
   5        "5 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap060x
   1        "1 1 year or less"
   2        "2 More than 1 year, but no more than 2 years"
   3        "3 More than 2 years, but no more than 5 years"
   4        "4 More than 5 years"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap066x
   1        "1 Yes"
   2        "2 No"
   3        "3 Still in the hospital"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap067x
   996      "996 Unable to do this activity"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap079x
   1        "1 Yes"
   2        "2 No"
   3        "3 Was told no changes needed"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap080x
   0        "0 None"
   1        "1 A little"
   2        "2 Some"
   3        "3 Most"
   4        "4 All"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap096x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap127x
   85       "85 85+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap157x
   1        "1 Yes"
   2        "2 No"
   3        "3 Borderline"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap160x
   00       "00 Within past year"
   85       "85 85+ years"
   96       "96 1+ year(s) with diabetes and age is 85+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap206x
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
label define sap208x
   1        "1 The right ear"
   2        "2 The left ear"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap212x
   01       "01 Less than 3 months"
   02       "02 3 to 11 months"
   03       "03 1 to 2 years"
   04       "04 3 to 4 years"
   05       "05 5 to 9 years"
   06       "06 10 to 14 years"
   07       "07 15 years or more"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap213x
   1        "1 Almost always"
   2        "2 At least once a day"
   3        "3 At least once a week"
   4        "4 At least once a month"
   5        "5 Less frequently than once a month"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap216x
   1        "1 No problem"
   2        "2 A small problem"
   3        "3 A moderate problem"
   4        "4 A big problem"
   5        "5 A very big problem"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap233x
   0        "0 Not at all difficult"
   1        "1 Only a little difficult"
   2        "2 Somewhat difficult"
   3        "3 Very difficult"
   4        "4 Can't do at all because of eyesight"
   6        "6 Do not do this activity for other reasons"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap239x
   1        "1 Less than one month"
   2        "2 1-12 months"
   3        "3 13-24 months"
   4        "4 More than 2 years"
   5        "5 Never"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap241x
   1        "1 Always"
   2        "2 Most of the time"
   3        "3 Some of the time"
   4        "4 None of the time"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap243x
   1        "1 ALL of the time"
   2        "2 MOST of the time"
   3        "3 SOME of the time"
   4        "4 A LITTLE of the time"
   5        "5 NONE of the time"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap249x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap253x
   0        "0 Had job last week"
   1        "1 No job last week, had job past 12 m"
   2        "2 No job last week, no job past 12 m"
   3        "3 Never worked"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap254x
   000      "000 None"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap256x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap258x
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
label define sap270x
   1        "1 Limited in any way"
   2        "2 Not limited in any way"
   3        "3 Unknown if limited"
;
label define sap307x
   95       "95 95+"
   96       "96 Since birth"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap308x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   6        "6 Since birth"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap309x
   00       "00 Less than 1 year"
   85       "85 85+ years"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap310x
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap311x
   1        "1 Chronic"
   2        "2 Not chronic"
   9        "9 Unknown if chronic"
;
label define sap487x
   1        "1 At least one chronic condition causes functional limitation"
   2        "2 No chronic condition causes functional limitation"
   9        "9 Unknown if any chronic condition causes functional limitation"
;
label define sap488x
   0        "0 Not limited in any way (including unknown if limited)"
   1        "1 Limited; caused by at least one chronic condition"
   2        "2 Limited; not caused by chronic condition"
   3        "3 Limited; unknown if condition is chronic"
;
label define sap490x
   85       "85 85 years or older"
   96       "96 Never smoked regularly"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap491x
   1        "1 Every day"
   2        "2 Some days"
   3        "3 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap492x
   1        "1 Current every day smoker"
   2        "2 Current some day smoker"
   3        "3 Former smoker"
   4        "4 Never smoker"
   5        "5 Smoker, current status unknown"
   9        "9 Unknown if ever smoked"
;
label define sap493x
   95       "95 95+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap495x
   00       "00 Less than 1 year"
   70       "70 70+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap496x
   95       "95 95+ cigarettes"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap497x
   00       "00 None"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap501x
   000      "000 Never"
   996      "996 Unable to do this type activity"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap502x
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
label define sap503x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do vigorous activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap504x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap505x
   1        "1 Minutes"
   2        "2 Hours"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap509x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do light or moderate activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap515x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do strength activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap518x
   000      "000 Never"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap519x
   0        "0 Never/None"
   1        "1 Week"
   2        "2 Month"
   3        "3 Year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap520x
   00       "00 Less than one day per week"
   95       "95 Did not drink in past year"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap521x
   000      "000 Never/none"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap522x
   95       "95 95+ drinks"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap523x
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
label define sap525x
   0        "0 Never/None"
   1        "1 Per week"
   2        "2 Per month"
   3        "3 Per year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap527x
   96       "96 Not available"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap528x
   996      "996 Not available"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap530x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap531x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap532x
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
label define sap534x
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
label define sap546x
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
label define sap557x
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
label define sap560x
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
label define sap563x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
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
label define sap577x
   1        "1 Received at least 3 doses"
   2        "2 Received less than 3 doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap579x
   96       "96 Received all shots"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap583x
   1        "1 Yes-included pertussis"
   2        "2 No-did not include pertussis"
   3        "3 Doctor did not say"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap586x
   1        "1 Very good"
   2        "2 Good"
   3        "3 Fair"
   4        "4 Poor"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap587x
   1        "1 Better"
   2        "2 Same"
   3        "3 Not as good"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap588x
   1        "1 Often"
   2        "2 Sometimes"
   3        "3 Rarely"
   4        "4 Never"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap589x
   01       "01 None or less than 1 hour"
   02       "02 1 hour, less than 3 hours"
   03       "03 3 hours, less than 5 hours"
   04       "04 5 hours, less than 7 hours"
   05       "05 7 or more hours"
   06       "06 Doesn't go to work or school"
   07       "07 Did not have this type of dental care"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap591x
   01       "01 None to less than 1 hour"
   02       "02 1 hour, less than 3 hours"
   03       "03 3 hours, less than 5 hours"
   04       "04 5 hours, less than 7 hours"
   05       "05 7 or more hours"
   06       "06 Doesn't go to work or school"
   07       "07 Did not have this type of dental care"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap606x
   1        "1 Dentist"
   2        "2 Doctor"
   3        "3 Both"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap614x
   1        "1 Yes"
   2        "2 No"
   3        "3 Doesn't go to work or school"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap621x
   1        "1 Within past year"
   2        "2 Between 1 and 3 years ago"
   3        "3 Over 3 years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap622x
   1        "1 Part of routine check-up"
   2        "2 For a specific problem"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap623x
   1        "1 Doctor/Physician"
   2        "2 Nurse/nurse practitioner"
   3        "3 Dentists (include oral surgeons orthodontists)"
   4        "4 Dental hygienist"
   5        "5 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap627x
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
label define sap630x
   1        "1 6 months or less"
   2        "2 More than 6 months but not more than 1 year ago"
   3        "3 More than 1 year, but not more than 2 years ago"
   4        "4 More than 2 years, but not more than 5 years ago"
   5        "5 More than 5 years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap631x
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
label define sap632x
   1        "1 Doctor, nurse or other health care professional"
   2        "2 Sex partner"
   3        "3 Someone at health department"
   4        "4 Family member or friend"
   5        "5 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap633x
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
label define sap634x
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
label define sap635x
   1        "1 Nurse or health worker"
   2        "2 Self-sampling kit"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap638x
   1        "1 High/Already have HIV/AIDS"
   2        "2 Medium"
   3        "3 Low"
   4        "4 None"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap639x
   1        "1 Yes, at least one statement is true"
   2        "2 No, none of these statements are true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap642x
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
label define sap645x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Nothing"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap653x
   1        "1 High"
   2        "2 Medium"
   3        "3 Low"
   4        "4 None"
   5        "5 Already have TB"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap656x
   1        "1 Always"
   2        "2 Most of the time"
   3        "3 Sometimes"
   4        "4 Rarely"
   5        "5 Never"
   6        "6 Don't go out in the sun"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap662x
   96       "96 More than one, different ones, other"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap663x
   1        "1-14"
   2        "2 15-50"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap666x
   00       "00 None"
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap670x
   1        "1 Days ago"
   2        "2 Weeks ago"
   3        "3 Months ago"
   4        "4 Years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap671x
   1        "1 A year ago or less"
   2        "2 More than 1 year but not more than 2 years"
   3        "3 More than 2 years but not more than 3 years"
   4        "4 More than 3 years but not more than 5 years"
   5        "5 Over 5 years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap672x
   1        "1 Part of a routine exam"
   2        "2 Because of a problem"
   3        "3 Other reason"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap674x
   01       "01 No reason/never thought about it"
   02       "02 Didn't need/Didn't know I needed this type of test"
   03       "03 Doctor didn't order it/didn't say I needed it"
   04       "04 Haven't had any problems"
   05       "05 Put if off/Didn't get around to it"
   06       "06 Too expensive/No insurance/Cost"
   07       "07 Too painful, unpleasant, or embarrassing"
   08       "08 Had hysterectomy"
   09       "09 Don't have doctor"
   10       "10 Had an HPV DNA test"
   11       "11 Other"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap675x
   1        "1 Yes"
   2        "2 No"
   3        "3 Did not see a doctor in the past 12 months"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap676x
   01       "01 A year or less from now"
   02       "02 1-3 years from now"
   03       "03 3-5 years from now"
   04       "04 More than 5 years from now"
   05       "05 When doctor recommends it"
   06       "06 Never, had HPV DNA test"
   07       "07 Never, had HPV vaccine"
   08       "08 Never, other reason"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap684x
   1        "1 Yes"
   2        "2 No"
   3        "3 Doctor refused when asked"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap685x
   96       "96 All shots"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap687x
   01       "01 Does not need vaccine"
   02       "02 Not sexually active"
   03       "03 Too expensive"
   04       "04 Too old for vaccine"
   05       "05 Doctor didn't recommend it"
   06       "06 Worried about safety of vaccine"
   07       "07 Don't know where to get vaccine"
   08       "08 My spouse/family member is against it"
   09       "09 Don't know enough about vaccine"
   10       "10 Already have HPV"
   11       "11 Other"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap691x
   00       "00 None"
   95       "95 95+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap693x
   9996     "9996 Time period format"
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don’t know"
;
label define sap703x
   1        "1 A year or less"
   2        "2 More than 1 up to 2 years"
   3        "3 More than 2 up to 4 years"
   4        "4 More than 4 up to 8 years"
   5        "5 More than 8 years"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap717x
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
label define sap718x
   1        "1 Sigmoidoscopy"
   2        "2 Colonoscopy"
   3        "3 Proctoscopy"
   4        "4 Something else"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap749x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t Know"
;
label define sap787x
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap788x
   1        "1 Feeling a sense of spinning"
   2        "2 A floating or spacey feeling"
   3        "3 Feeling lightheaded"
   4        "4 Feeling like you are about to pass out"
   5        "5 Blurred vision"
   6        "6 Unsteadiness"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap789x
   996      "996 Since birth"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap790x
   01       "01 Less then 3 months"
   02       "02 3 months to less than 12 months"
   03       "03 12 months to less than 3 years"
   04       "04 3 years to less than 5 years"
   05       "05 5 years to less than 10 years"
   06       "06 10 years to less than 15 years"
   07       "07 15 years or more"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap791x
   01       "01 Almost always"
   02       "02 3 or more times a day"
   03       "03 Once or twice a day"
   04       "04 Several times a week"
   05       "05 Once a week"
   06       "06 Several times a month"
   07       "07 Once a month"
   08       "08 Less than once a month"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap792x
   01       "01 Momentary, or less than one minute"
   02       "02 One minute to less than 20 minutes"
   03       "03 20 minutes to less than 4 hours"
   04       "04 4 hours to less than 24 hours"
   05       "05 1 day to less than 14 days"
   06       "06 2 weeks to less than 3 months"
   07       "07 3 months or longer"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap828x
   1        "1 Only"
   2        "2 Regardless"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap851x
   0        "0 None"
   1        "1 1 time"
   2        "2 2 times"
   3        "3 3-4 times"
   4        "4 5-9 times"
   5        "5 10-14 times"
   6        "6 15 or more times"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap870x
   1        "1 Less than 12 months"
   2        "2 12 months to less than 3 years"
   3        "3 3 years to less than 5 years"
   4        "4 5 years to less than 10 years"
   5        "5 10 years to less than 15 years"
   6        "6 15 years or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap871x
   1        "1 1"
   2        "2 2"
   3        "3 3 to 4"
   4        "4 5 to 9"
   5        "5 10 to 14"
   6        "6 15 or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap874x
   1        "1 Days"
   2        "2 Weeks"
   3        "3 Months"
   4        "4 Years"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap916x
   1        "1 Gotten worse"
   2        "2 Stayed the same"
   3        "3 Improved somewhat"
   4        "4 Improved greatly"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap920x
   1        "1 Yes"
   2        "2 No"
   3        "3 Doesn't Work or Go to School"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap934x
   1        "1 Days"
   2        "2 Weeks"
   3        "3 Months"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap954x
   1        "1 Day"
   2        "2 Week"
   3        "3 Month"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap955x
   0        "0 None"
   1        "1 1 time"
   2        "2 2 times"
   3        "3 3-4 times"
   4        "4 5-7 times"
   5        "5 8 or more times"
   7        "7 Refused"
   8        "8 Not Ascertained"
   9        "9 Don't know"
;
label define sap957x
   996      "996 Doesn't work or go to school"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
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

label values doinglwa  sap023x;   label values whynowka  sap024x;
label values everwrk   sap025x;   label values wrkcata   sap030x;
label values businc1a  sap025x;   label values locall1a  sap032x;
label values yrswrkpa  sap033x;   label values wrklongh  sap025x;
label values hourpda   sap025x;   label values pdsicka   sap025x;
label values onejob    sap025x;

label values hypev     sap025x;   label values hypdifv   sap025x;
label values hyplow    sap025x;   label values hybpckno  sap041x;
label values hybpcktp  sap042x;   label values hybplev   sap043x;
label values clckno    sap041x;   label values clcktp    sap042x;
label values clhi      sap025x;   label values chdev     sap025x;
label values angev     sap025x;   label values miev      sap025x;
label values hrtev     sap025x;   label values strev     sap025x;
label values ephev     sap025x;   label values jawp      sap025x;
label values wea       sap025x;   label values che       sap025x;
label values arm       sap025x;   label values brth      sap025x;
label values ahado     sap058x;   label values acpr      sap025x;
label values acprlo    sap060x;   label values aasmev    sap025x;
label values aasstill  sap025x;   label values aasmyr    sap025x;
label values aasmeryr  sap025x;   label values aasmhsp   sap025x;
label values aasmmc    sap066x;   label values awzmswk   sap067x;
label values awzpin    sap025x;   label values aasminst  sap025x;
label values aasmpmed  sap025x;   label values aasmcan   sap025x;
label values aasmed    sap025x;   label values aasmdtp   sap025x;
label values aaswmp    sap025x;   label values aasclass  sap025x;
label values aas_rec   sap025x;   label values aas_res   sap025x;
label values aas_mon   sap025x;   label values aapenvln  sap079x;
label values aapenvdo  sap080x;   label values chrfatig  sap025x;
label values thylow    sap025x;   label values chrinfct  sap025x;
label values muldyst   sap025x;   label values epilepsy  sap025x;
label values cerebrlp  sap025x;   label values spineinj  sap025x;
label values headinj   sap025x;   label values movedis   sap025x;
label values migraine  sap025x;   label values rhdache   sap025x;
label values mulscler  sap025x;   label values ulcev     sap025x;
label values ulcyr     sap025x;   label values canev     sap025x;
label values cnkind1   sap096x;   label values cnkind2   sap096x;
label values cnkind3   sap096x;   label values cnkind4   sap096x;
label values cnkind5   sap096x;   label values cnkind6   sap096x;
label values cnkind7   sap096x;   label values cnkind8   sap096x;
label values cnkind9   sap096x;   label values cnkind10  sap096x;
label values cnkind11  sap096x;   label values cnkind12  sap096x;
label values cnkind13  sap096x;   label values cnkind14  sap096x;
label values cnkind15  sap096x;   label values cnkind16  sap096x;
label values cnkind17  sap096x;   label values cnkind18  sap096x;
label values cnkind19  sap096x;   label values cnkind20  sap096x;
label values cnkind21  sap096x;   label values cnkind22  sap096x;
label values cnkind23  sap096x;   label values cnkind24  sap096x;
label values cnkind25  sap096x;   label values cnkind26  sap096x;
label values cnkind27  sap096x;   label values cnkind28  sap096x;
label values cnkind29  sap096x;   label values cnkind30  sap096x;
label values cnkind31  sap096x;   label values canage1   sap127x;
label values canage2   sap127x;   label values canage3   sap127x;
label values canage4   sap127x;   label values canage5   sap127x;
label values canage6   sap127x;   label values canage7   sap127x;
label values canage8   sap127x;   label values canage9   sap127x;
label values canage10  sap127x;   label values canage11  sap127x;
label values canage12  sap127x;   label values canage13  sap127x;
label values canage14  sap127x;   label values canage15  sap127x;
label values canage16  sap127x;   label values canage17  sap127x;
label values canage18  sap127x;   label values canage19  sap127x;
label values canage20  sap127x;   label values canage21  sap127x;
label values canage22  sap127x;   label values canage23  sap127x;
label values canage24  sap127x;   label values canage25  sap127x;
label values canage26  sap127x;   label values canage27  sap127x;
label values canage28  sap127x;   label values canage29  sap127x;
label values canage30  sap127x;   label values dibev     sap157x;
label values dibpre1   sap025x;   label values dibage    sap127x;
label values difage2   sap160x;   label values insln     sap025x;
label values dibpill   sap025x;   label values ahayfyr   sap025x;
label values sinyr     sap025x;   label values cbrchyr   sap025x;
label values kidwkyr   sap025x;   label values livyr     sap025x;
label values jntsymp   sap025x;   label values jmthp1    sap096x;
label values jmthp2    sap096x;   label values jmthp3    sap096x;
label values jmthp4    sap096x;   label values jmthp5    sap096x;
label values jmthp6    sap096x;   label values jmthp7    sap096x;
label values jmthp8    sap096x;   label values jmthp9    sap096x;
label values jmthp10   sap096x;   label values jmthp11   sap096x;
label values jmthp12   sap096x;   label values jmthp13   sap096x;
label values jmthp14   sap096x;   label values jmthp15   sap096x;
label values jmthp16   sap096x;   label values jmthp17   sap096x;
label values jntchr    sap025x;   label values jnthp     sap025x;
label values arth1     sap025x;   label values arthlmt   sap025x;
label values arthtyp1  sap096x;   label values arthtyp2  sap096x;
label values arthtyp3  sap096x;   label values arthtyp4  sap096x;
label values arthtyp5  sap096x;   label values arthtyp6  sap096x;
label values paineck   sap025x;   label values painlb    sap025x;
label values painleg   sap025x;   label values painface  sap025x;
label values amigr     sap025x;   label values acold2w   sap025x;
label values aintil2w  sap025x;   label values pregnow   sap025x;
label values hraidnow  sap025x;   label values hraidev   sap025x;
label values ahearst1  sap206x;   label values hrwors    sap025x;
label values hrwhich   sap208x;   label values hrright   sap206x;
label values hrleft    sap206x;   label values hrtin     sap025x;
label values hrtinlng  sap212x;   label values hrtinoft  sap213x;
label values hrtinmus  sap025x;   label values hrtinslp  sap025x;
label values hrtnprob  sap216x;   label values avision   sap025x;
label values ablind    sap025x;   label values vim_drev  sap025x;
label values vimls_dr  sap025x;   label values vim_caev  sap025x;
label values vimls_ca  sap025x;   label values vimcsurg  sap025x;
label values vim_glev  sap025x;   label values vimls_gl  sap025x;
label values vim_mdev  sap025x;   label values vimls_md  sap025x;
label values vimglass  sap025x;   label values vimread   sap025x;
label values vimdrive  sap025x;   label values avisreh   sap025x;
label values avisdev   sap025x;   label values avdf_nws  sap233x;
label values avdf_cls  sap233x;   label values avdf_nit  sap233x;
label values avdf_drv  sap233x;   label values avdf_per  sap233x;
label values avdf_crd  sap233x;   label values avisexam  sap239x;
label values avisact   sap025x;   label values avisprot  sap241x;
label values lupprt    sap025x;   label values sad       sap243x;
label values nervous   sap243x;   label values restless  sap243x;
label values hopeless  sap243x;   label values effort    sap243x;
label values worthls   sap243x;   label values mhamtmo   sap249x;
label values depress   sap025x;   label values ganxiety  sap025x;
label values panicd    sap025x;

label values wrklyr3   sap253x;   label values wkdayr    sap254x;
label values beddayr   sap254x;   label values ahstatyr  sap256x;
label values speceq    sap025x;   label values flwalk    sap258x;
label values flclimb   sap258x;   label values flstand   sap258x;
label values flsit     sap258x;   label values flstoop   sap258x;
label values flreach   sap258x;   label values flgrasp   sap258x;
label values flcarry   sap258x;   label values flpush    sap258x;
label values flshop    sap258x;   label values flsocl    sap258x;
label values flrelax   sap258x;   label values fla1ar    sap270x;
label values aflhca1   sap096x;   label values aflhca2   sap096x;
label values aflhca3   sap096x;   label values aflhca4   sap096x;
label values aflhca5   sap096x;   label values aflhca6   sap096x;
label values aflhca7   sap096x;   label values aflhca8   sap096x;
label values aflhca9   sap096x;   label values aflhca10  sap096x;
label values aflhca11  sap096x;   label values aflhca12  sap096x;
label values aflhca13  sap096x;   label values aflhca14  sap096x;
label values aflhca15  sap096x;   label values aflhca16  sap096x;
label values aflhca17  sap096x;   label values aflhca18  sap096x;
label values aflhc19_  sap096x;   label values aflhc20_  sap096x;
label values aflhc21_  sap096x;   label values aflhc22_  sap096x;
label values aflhc23_  sap096x;   label values aflhc24_  sap096x;
label values aflhc25_  sap096x;   label values aflhc26_  sap096x;
label values aflhc27_  sap096x;   label values aflhc28_  sap096x;
label values aflhc29_  sap096x;   label values aflhc30_  sap096x;
label values aflhc31_  sap096x;   label values aflhc32_  sap096x;
label values aflhc33_  sap096x;   label values aflhc34_  sap096x;
label values aflhca90  sap096x;   label values aflhca91  sap096x;
label values altime1   sap307x;   label values alunit1   sap308x;
label values aldura1   sap309x;   label values aldurb1   sap310x;
label values alchrc1   sap311x;   label values altime2   sap307x;
label values alunit2   sap308x;   label values aldura2   sap309x;
label values aldurb2   sap310x;   label values alchrc2   sap311x;
label values altime3   sap307x;   label values alunit3   sap308x;
label values aldura3   sap309x;   label values aldurb3   sap310x;
label values alchrc3   sap311x;   label values altime4   sap307x;
label values alunit4   sap308x;   label values aldura4   sap309x;
label values aldurb4   sap310x;   label values alchrc4   sap311x;
label values altime5   sap307x;   label values alunit5   sap308x;
label values aldura5   sap309x;   label values aldurb5   sap310x;
label values alchrc5   sap311x;   label values altime6   sap307x;
label values alunit6   sap308x;   label values aldura6   sap309x;
label values aldurb6   sap310x;   label values alchrc6   sap311x;
label values altime7   sap307x;   label values alunit7   sap308x;
label values aldura7   sap309x;   label values aldurb7   sap310x;
label values alchrc7   sap311x;   label values altime8   sap307x;
label values alunit8   sap308x;   label values aldura8   sap309x;
label values aldurb8   sap310x;   label values alchrc8   sap311x;
label values altime9   sap307x;   label values alunit9   sap308x;
label values aldura9   sap309x;   label values aldurb9   sap310x;
label values alchrc9   sap311x;   label values altime10  sap307x;
label values alunit10  sap308x;   label values aldura10  sap309x;
label values aldurb10  sap310x;   label values alchrc10  sap311x;
label values altime11  sap307x;   label values alunit11  sap308x;
label values aldura11  sap309x;   label values aldurb11  sap310x;
label values alchrc11  sap311x;   label values altime12  sap307x;
label values alunit12  sap308x;   label values aldura12  sap309x;
label values aldurb12  sap310x;   label values alchrc12  sap311x;
label values altime13  sap307x;   label values alunit13  sap308x;
label values aldura13  sap309x;   label values aldurb13  sap310x;
label values alchrc13  sap311x;   label values altime14  sap307x;
label values alunit14  sap308x;   label values aldura14  sap309x;
label values aldurb14  sap310x;   label values alchrc14  sap311x;
label values altime15  sap307x;   label values alunit15  sap308x;
label values aldura15  sap309x;   label values aldurb15  sap310x;
label values alchrc15  sap311x;   label values altime16  sap307x;
label values alunit16  sap308x;   label values aldura16  sap309x;
label values aldurb16  sap310x;   label values alchrc16  sap311x;
label values altime17  sap307x;   label values alunit17  sap308x;
label values aldura17  sap309x;   label values aldurb17  sap310x;
label values alchrc17  sap311x;   label values altime18  sap307x;
label values alunit18  sap308x;   label values aldura18  sap309x;
label values aldurb18  sap310x;   label values alchrc18  sap311x;
label values altime19  sap307x;   label values alunit19  sap308x;
label values aldura19  sap309x;   label values aldurb19  sap310x;
label values alchrc19  sap311x;   label values altime20  sap307x;
label values alunit20  sap308x;   label values aldura20  sap309x;
label values aldurb20  sap310x;   label values alchrc20  sap311x;
label values altime21  sap307x;   label values alunit21  sap308x;
label values aldura21  sap309x;   label values aldurb21  sap310x;
label values alchrc21  sap311x;   label values altime22  sap307x;
label values alunit22  sap308x;   label values aldura22  sap309x;
label values aldurb22  sap310x;   label values alchrc22  sap311x;
label values altime23  sap307x;   label values alunit23  sap308x;
label values aldura23  sap309x;   label values aldurb23  sap310x;
label values alchrc23  sap311x;   label values altime24  sap307x;
label values alunit24  sap308x;   label values aldura24  sap309x;
label values aldurb24  sap310x;   label values alchrc24  sap311x;
label values altime25  sap307x;   label values alunit25  sap308x;
label values aldura25  sap309x;   label values aldurb25  sap310x;
label values alchrc25  sap311x;   label values altime26  sap307x;
label values alunit26  sap308x;   label values aldura26  sap309x;
label values aldurb26  sap310x;   label values alchrc26  sap311x;
label values altime27  sap307x;   label values alunit27  sap308x;
label values aldura27  sap309x;   label values aldurb27  sap310x;
label values alchrc27  sap311x;   label values altime28  sap307x;
label values alunit28  sap308x;   label values aldura28  sap309x;
label values aldurb28  sap310x;   label values alchrc28  sap311x;
label values altime29  sap307x;   label values alunit29  sap308x;
label values aldura29  sap309x;   label values aldurb29  sap310x;
label values alchrc29  sap311x;   label values altime30  sap307x;
label values alunit30  sap308x;   label values aldura30  sap309x;
label values aldurb30  sap310x;   label values alchrc30  sap311x;
label values altime31  sap307x;   label values alunit31  sap308x;
label values aldura31  sap309x;   label values aldurb31  sap310x;
label values alchrc31  sap311x;   label values altime32  sap307x;
label values alunit32  sap308x;   label values aldura32  sap309x;
label values aldurb32  sap310x;   label values alchrc32  sap311x;
label values altime33  sap307x;   label values alunit33  sap308x;
label values aldura33  sap309x;   label values aldurb33  sap310x;
label values alchrc33  sap311x;   label values altime34  sap307x;
label values alunit34  sap308x;   label values aldura34  sap309x;
label values aldurb34  sap310x;   label values alchrc34  sap311x;
label values altime90  sap307x;   label values alunit90  sap308x;
label values aldura90  sap309x;   label values aldurb90  sap310x;
label values alchrc90  sap311x;   label values altime91  sap307x;
label values alunit91  sap308x;   label values aldura91  sap309x;
label values aldurb91  sap310x;   label values alchrc91  sap311x;
label values alcndrt   sap487x;   label values alchronr  sap488x;

label values smkev     sap025x;   label values smkreg    sap490x;
label values smknow    sap491x;   label values smkstat2  sap492x;
label values smkqtno   sap493x;   label values smkqttp   sap042x;
label values smkqty    sap495x;   label values cigsda1   sap496x;
label values cigdamo   sap497x;   label values cigsda2   sap496x;
label values cigsday   sap496x;   label values cigqtyr   sap025x;
label values vigno     sap501x;   label values vigtp     sap502x;
label values vigfreqw  sap503x;   label values viglngno  sap504x;
label values viglngtp  sap505x;   label values vigmin    sap504x;
label values modno     sap501x;   label values modtp     sap502x;
label values modfreqw  sap509x;   label values modlngno  sap504x;
label values modlngtp  sap505x;   label values modmin    sap504x;
label values strngno   sap501x;   label values strngtp   sap502x;
label values strfreqw  sap515x;   label values alc1yr    sap025x;
label values alclife   sap025x;   label values alc12mno  sap518x;
label values alc12mtp  sap519x;   label values alc12mwk  sap520x;
label values alc12myr  sap521x;   label values alcamt    sap522x;
label values alcstat   sap523x;   label values alc5upno  sap521x;
label values alc5uptp  sap525x;   label values alc5upyr  sap521x;
label values aheight   sap527x;   label values aweightp  sap528x;
label values sleep     sap530x;

label values ausualpl  sap531x;   label values aplkind   sap532x;
label values ahcplrou  sap025x;   label values ahcplknd  sap534x;
label values ahcchgyr  sap025x;   label values ahcchghi  sap025x;
label values ahcdlyr1  sap025x;   label values ahcdlyr2  sap025x;
label values ahcdlyr3  sap025x;   label values ahcdlyr4  sap025x;
label values ahcdlyr5  sap025x;   label values ahcafyr1  sap025x;
label values ahcafyr2  sap025x;   label values ahcafyr3  sap025x;
label values ahcafyr4  sap025x;   label values adnlong2  sap546x;
label values ahcsyr1   sap025x;   label values ahcsyr2   sap025x;
label values ahcsyr3   sap025x;   label values ahcsyr4   sap025x;
label values ahcsyr5   sap025x;   label values ahcsyr6   sap025x;
label values ahcsyr7   sap025x;   label values ahcsyr8   sap025x;
label values ahcsyr9   sap025x;   label values ahcsyr10  sap025x;
label values ahernoy2  sap557x;   label values ahchyr    sap025x;
label values ahchmoyr  sap530x;   label values ahchnoy2  sap560x;
label values ahcnoyr2  sap557x;   label values asrgyr    sap025x;
label values asrgnoyr  sap563x;   label values amdlongr  sap546x;
label values shtfluyr  sap025x;   label values ashflu_m  sap566x;
label values ashflu_y  sap567x;   label values sprfluyr  sap025x;
label values aspflu_m  sap566x;   label values aspflu_y  sap567x;
label values shtpnuyr  sap025x;   label values apox      sap025x;
label values apox12mo  sap025x;   label values ahep      sap025x;
label values ahepliv   sap025x;   label values shthepb   sap025x;
label values shepdos   sap577x;   label values shthepa   sap025x;
label values shepanum  sap579x;   label values shingles  sap025x;
label values shttd     sap025x;   label values shttd05   sap025x;
label values shttdap   sap583x;   label values livev     sap025x;
label values travel    sap025x;

label values ocond     sap586x;   label values obtws     sap587x;
label values oemb      sap588x;   label values oreas_1   sap589x;
label values oreas_2   sap589x;   label values oreas_3   sap591x;
label values oreas_4   sap591x;   label values oprob_01  sap025x;
label values oprob_02  sap025x;   label values oprob_03  sap025x;
label values oprob_04  sap025x;   label values oprob_05  sap025x;
label values oprob_06  sap025x;   label values oprob_07  sap025x;
label values oprob_08  sap025x;   label values oprob_09  sap025x;
label values oprob_10  sap025x;   label values oprob_11  sap025x;
label values oprob_12  sap025x;   label values odent1    sap025x;
label values odent2    sap606x;   label values onoden_1  sap025x;
label values onoden_2  sap025x;   label values onoden_3  sap025x;
label values onoden_4  sap025x;   label values onoden_5  sap025x;
label values onoden_6  sap025x;   label values onoden_7  sap025x;
label values oint_1    sap614x;   label values oint_2    sap025x;
label values oint_3    sap025x;   label values oint_4    sap025x;
label values ocexam    sap025x;   label values octong    sap025x;
label values ocneck    sap025x;   label values ocexwhen  sap621x;
label values oexcheck  sap622x;   label values ocexprof  sap623x;

label values bldgv     sap025x;   label values bldg12m   sap025x;
label values hivtst    sap025x;   label values whytst_r  sap627x;
label values tst12m_m  sap628x;   label values tst12m_y  sap629x;
label values timetst   sap630x;   label values reatst_c  sap631x;
label values reaswhor  sap632x;   label values lastst_c  sap633x;
label values clntyp_c  sap634x;   label values whoadm    sap635x;
label values givnam    sap025x;   label values extst12m  sap025x;
label values chnsadsp  sap638x;   label values stmtru    sap639x;
label values std       sap025x;   label values stddoc    sap025x;
label values stdwher   sap642x;   label values tbhrd     sap025x;
label values tbknow    sap025x;   label values tb        sap645x;
label values tbsprd1   sap096x;   label values tbsprd2   sap096x;
label values tbsprd3   sap096x;   label values tbsprd4   sap096x;
label values tbsprd5   sap096x;   label values tbsprd6   sap096x;
label values tbcured   sap025x;   label values tbchanc   sap653x;
label values tbshame   sap025x;   label values homeless  sap025x;

label values sun1_sha  sap656x;   label values sun1_cap  sap656x;
label values sun1_hat  sap656x;   label values sun2_lgs  sap656x;
label values sun2_lgp  sap656x;   label values sun2_scr  sap656x;
label values spf       sap662x;   label values spfscale  sap663x;
label values snnum     sap254x;   label values paphad    sap025x;
label values pap6yr    sap666x;   label values rpap1_mt  sap628x;
label values rpap1_yr  sap629x;   label values rpap1n    sap493x;
label values rpap1t    sap670x;   label values rpap2ca   sap671x;
label values papreas   sap672x;   label values papabn    sap025x;
label values papnot    sap674x;   label values mdrecpap  sap675x;
label values papwhen   sap676x;   label values hyst      sap025x;
label values hpvhrd    sap025x;   label values hpvcaus   sap025x;
label values hpvsexcn  sap025x;   label values hpvtret   sap025x;
label values hpvhad    sap025x;   label values shhpvhrd  sap025x;
label values shthpv    sap684x;   label values shhpvdos  sap685x;
label values hpvint    sap025x;   label values hpvnot    sap687x;
label values hpvcost   sap025x;   label values hpvlocst  sap025x;
label values mamhad    sap025x;   label values mam6yr    sap691x;
label values rmam1_mt  sap628x;   label values rmam1_yr  sap693x;
label values rmam1n    sap493x;   label values rmam1t    sap670x;
label values rmam2ca   sap671x;   label values mamreas   sap672x;
label values mdrecmam  sap675x;   label values maminfo   sap025x;
label values mamdelay  sap025x;   label values hrtever   sap025x;
label values hrtnow    sap025x;   label values hrtlong   sap703x;
label values psahad    sap025x;   label values rpsa1_mt  sap628x;
label values rpsa1_yr  sap693x;   label values rpsa1n    sap493x;
label values rpsa1t    sap670x;   label values rpsa2     sap671x;
label values psareas   sap672x;   label values mdrecpsa  sap675x;
label values crehad    sap025x;   label values rcre1_mt  sap628x;
label values rcre1_yr  sap693x;   label values rcre1n    sap493x;
label values rcre1t    sap670x;   label values rcre2     sap717x;
label values crenam    sap718x;   label values crereas   sap672x;
label values crerec    sap675x;   label values hfobhad   sap025x;
label values rhfo1_mt  sap628x;   label values rhfo1_yr  sap693x;
label values rhfo1n    sap493x;   label values rhfo1t    sap670x;
label values rhfo2     sap717x;   label values mdhfob    sap675x;

label values hyppreg   sap025x;   label values hloswgt   sap025x;
label values wgtadev   sap025x;   label values wgtadnow  sap025x;
label values lowslt    sap025x;   label values lowsltev  sap025x;
label values lowsltnw  sap025x;   label values exerc     sap025x;
label values exercev   sap025x;   label values exercnw   sap025x;
label values hbpalc    sap025x;   label values hbpalcev  sap025x;
label values hbpalcnw  sap025x;   label values hypmedev  sap025x;
label values hypmed    sap025x;   label values hymdmed   sap025x;

label values baid_01   sap025x;   label values baid_02   sap025x;
label values baid_03   sap025x;   label values baid_04   sap025x;
label values baid_05   sap025x;   label values baid_06   sap749x;
label values baid_07   sap025x;   label values baid_08   sap025x;
label values bbrac1    sap096x;   label values bbrac2    sap096x;
label values bbrac3    sap096x;   label values bbrac4    sap096x;
label values bbrac5    sap096x;   label values bbrac6    sap096x;
label values bbrac7    sap096x;   label values bart1     sap096x;
label values bart2     sap096x;   label values bart3     sap096x;
label values bart4     sap096x;   label values bart5     sap096x;
label values bdizz     sap025x;   label values bbal_01   sap025x;
label values bbal_02   sap025x;   label values bbal_03   sap025x;
label values bbal_04   sap025x;   label values bbal_05   sap025x;
label values bbal_06   sap025x;   label values bbal_07   sap025x;
label values bbal_08   sap025x;   label values bbal_09   sap025x;
label values bbal_10   sap025x;   label values bbal_11   sap025x;
label values bbal_12   sap025x;   label values bbal_13   sap025x;
label values bbal_14   sap025x;   label values bbal_15   sap025x;
label values bbalct    sap530x;   label values btype_01  sap025x;
label values btype_02  sap025x;   label values btype_03  sap025x;
label values btype_04  sap025x;   label values btype_05  sap025x;
label values btype_06  sap025x;   label values btypect   sap787x;
label values bboth     sap788x;   label values bage      sap789x;
label values blong     sap790x;   label values boften    sap791x;
label values blast     sap792x;   label values btrig_01  sap025x;
label values btrig_02  sap025x;   label values btrig_03  sap025x;
label values btrig_04  sap025x;   label values btrig_05  sap025x;
label values btrig_06  sap025x;   label values btrig_07  sap025x;
label values btrig_08  sap025x;   label values btrig_09  sap025x;
label values btrig_10  sap025x;   label values btrig_11  sap025x;
label values btrig_12  sap025x;   label values btrig_13  sap025x;
label values bsame_01  sap025x;   label values bsame_02  sap025x;
label values bsame_03  sap025x;   label values bsame_04  sap025x;
label values bsame_05  sap025x;   label values bsame_06  sap025x;
label values bsame_07  sap025x;   label values bsame_08  sap025x;
label values bsame_09  sap025x;   label values bsame_10  sap025x;
label values bsame_11  sap025x;   label values bsame_12  sap025x;
label values bsame_13  sap025x;   label values bsame_14  sap025x;
label values bsame_15  sap025x;   label values bsame_16  sap025x;
label values bsame_17  sap025x;   label values bsame_18  sap025x;
label values bsame_19  sap025x;   label values bsame_20  sap025x;
label values bsame_21  sap025x;   label values bsame_22  sap025x;
label values bonly_01  sap828x;   label values bonly_02  sap828x;
label values bonly_03  sap828x;   label values bonly_04  sap828x;
label values bonly_05  sap828x;   label values bonly_06  sap828x;
label values bonly_07  sap828x;   label values bonly_08  sap828x;
label values bonly_09  sap828x;   label values bonly_10  sap828x;
label values bonly_11  sap828x;   label values bonly_12  sap828x;
label values bonly_13  sap828x;   label values bonly_14  sap828x;
label values bonly_15  sap828x;   label values bonly_16  sap828x;
label values bonly_17  sap828x;   label values bonly_18  sap828x;
label values bonly_19  sap828x;   label values bonly_20  sap828x;
label values bonly_21  sap828x;   label values bonly_22  sap828x;
label values bhosp     sap025x;   label values bhospno   sap851x;
label values bhp       sap025x;   label values bhp_01    sap025x;
label values bhp_02    sap025x;   label values bhp_03    sap025x;
label values bhp_04    sap025x;   label values bhp_05    sap025x;
label values bhp_06    sap025x;   label values bhp_07    sap025x;
label values bhp_08    sap025x;   label values bhp_09    sap025x;
label values bhp_10    sap025x;   label values bhp_11    sap025x;
label values bhp_12    sap025x;   label values bhp_13    sap025x;
label values bhp_14    sap025x;   label values bhp_15    sap025x;
label values bhp_16    sap025x;   label values b5yrs     sap851x;
label values bfirst    sap870x;   label values bdiff     sap871x;
label values bhelp     sap025x;   label values bthlp_no  sap504x;
label values bthlp_tp  sap874x;   label values bdiag     sap025x;
label values bcaus_01  sap096x;   label values bcaus_02  sap096x;
label values bcaus_03  sap096x;   label values bcaus_04  sap096x;
label values bcaus_05  sap096x;   label values bcaus_06  sap096x;
label values bcaus_07  sap096x;   label values bcaus_08  sap096x;
label values bcaus_09  sap096x;   label values bcaus_10  sap096x;
label values bcaus_11  sap096x;   label values bcaus_12  sap096x;
label values bcaus_13  sap096x;   label values bcaus_14  sap096x;
label values bcaus_15  sap096x;   label values bcaus_16  sap096x;
label values btret     sap025x;   label values btret_01  sap025x;
label values btret_02  sap025x;   label values btret_03  sap025x;
label values btret_04  sap025x;   label values btret_05  sap025x;
label values btret_06  sap025x;   label values btret_07  sap025x;
label values btret_08  sap025x;   label values btret_09  sap025x;
label values btret_10  sap025x;   label values btret_11  sap025x;
label values btret_12  sap025x;   label values btret_13  sap025x;
label values btret_14  sap025x;   label values btret_15  sap025x;
label values btret_16  sap025x;   label values btret_17  sap025x;
label values btret_18  sap025x;   label values btret_19  sap025x;
label values btret_20  sap025x;   label values btret_21  sap025x;
label values btret_22  sap025x;   label values btret_23  sap025x;
label values bstat     sap916x;   label values bmedic    sap025x;
label values bbett     sap025x;   label values bchng     sap025x;
label values bchng_01  sap920x;   label values bchng_02  sap025x;
label values bchng_03  sap025x;   label values bchng_04  sap025x;
label values bchng_05  sap025x;   label values bchng_06  sap025x;
label values bchng_07  sap025x;   label values bchng_08  sap025x;
label values bchng_09  sap025x;   label values bchng_10  sap025x;
label values bmisswk   sap920x;   label values blms_no   sap504x;
label values blms_tp   sap874x;   label values bm12_no   sap504x;
label values bm12_tp   sap934x;   label values bprob     sap216x;
label values bmed_01   sap025x;   label values bmed_02   sap025x;
label values bmed_03   sap025x;   label values bmed_04   sap025x;
label values bmed_05   sap025x;   label values bmed_06   sap025x;
label values bmed_07   sap025x;   label values bmed_08   sap025x;
label values bbio      sap025x;   label values bfall5    sap025x;
label values bfl_01    sap025x;   label values bfl_02    sap025x;
label values bfl_03    sap025x;   label values bfl_04    sap025x;
label values bfl_05    sap025x;   label values bfl_06    sap025x;
label values bfall12   sap025x;   label values bf12_no   sap504x;
label values bf12_tp   sap954x;   label values bftime    sap955x;
label values binj      sap025x;   label values bijms_no  sap957x;
label values bijms_tp  sap934x;   label values bfwhy_01  sap025x;
label values bfwhy_02  sap025x;   label values bfwhy_03  sap025x;
label values bfwhy_04  sap025x;   label values bfwhy_05  sap025x;
label values bfwhy_06  sap025x;   label values bfwhy_07  sap025x;
label values bfwhy_08  sap025x;   label values bfwhy_09  sap025x;
label values bfwhy_10  sap025x;   label values bfwhy_11  sap025x;
label values bfwhy_12  sap025x;   label values bfwhy_13  sap025x;
label values bfwhy_14  sap025x;   label values bfwhy_15  sap025x;
label values bfwhy_16  sap025x;   label values bfwhy_17  sap025x;
label values bfwhy_18  sap025x;   label values bfwhy_19  sap025x;
label values bfwhy_20  sap025x;   label values bfwhy_21  sap025x;
label values bfwhy_22  sap025x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sa];
save "$OUT/samadult", replace;

#delimit cr

* data file is stored in samadult.dta
* log  file is stored in samadult.log

log close
