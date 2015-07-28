log using "$LOG/samadult.log", replace

/*******************************************************************************
These processing files were provided in their original format by the CDC/NCHS or
by Jean Roth of NBER. Updates have been written by Damian Clarke and Yu-Kuan Ch-
en to:
    (1) Provide a full series of Stata input files for 1997-2013
    (2) Fix a number of processing errors in scripts
    (3) Completely automate the process through one do file

This entire process can be automated with the Python script provided at:
    https://github.com/damiancclarke/nhis, or
    https://sites.google.com/site/damiancclarke/computation

Links to original data which is downloaded by the Python script are here:
    http://www.cdc.gov/nchs/nhis.htm

The original processing scripts which were altered to provide these routines are
available at the above address, or in the case of Jean Roth's NBER files, at:
    http://www.nber.org/data/national-health-interview-survey-programs.html

Any further questions can be directed to damian.clarke@economics.ox.ac.uk
*******************************************************************************/
    
#delimit ;
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
      hypyr1       81 -  81      hybpckno     82 -  83
      hybpcktp     84 -  84      hybplev      85 -  85
      hypmdev2     86 -  86      hypmed2      87 -  87
      chlev        88 -  88      chlyr        89 -  89
      clckno       90 -  91      clcktp       92 -  92
      chlmdev2     93 -  93      chlmdnw2     94 -  94
      chdev        95 -  95      angev        96 -  96
      miev         97 -  97      hrtev        98 -  98
      strev        99 -  99      ephev       100 - 100
      jawp        101 - 101      wea         102 - 102
      che         103 - 103      arm         104 - 104
      brth        105 - 105      ahado       106 - 106
      face        107 - 107      speaking    108 - 108
      eye         109 - 109      walking     110 - 110
      headache    111 - 111      astdo       112 - 112
      copdev      113 - 113      aspmedev    114 - 114
      aspmedad    115 - 115      aspmdmed    116 - 116
      asponown    117 - 117      aasmev      118 - 118
      aasstill    119 - 119      aasmyr      120 - 120
      aaseryr1    121 - 121      ulcev       122 - 122
      ulcyr       123 - 123      canev       124 - 124
      cnkind1     125 - 125      cnkind2     126 - 126
      cnkind3     127 - 127      cnkind4     128 - 128
      cnkind5     129 - 129      cnkind6     130 - 130
      cnkind7     131 - 131      cnkind8     132 - 132
      cnkind9     133 - 133      cnkind10    134 - 134
      cnkind11    135 - 135      cnkind12    136 - 136
      cnkind13    137 - 137      cnkind14    138 - 138
      cnkind15    139 - 139      cnkind16    140 - 140
      cnkind17    141 - 141      cnkind18    142 - 142
      cnkind19    143 - 143      cnkind20    144 - 144
      cnkind21    145 - 145      cnkind22    146 - 146
      cnkind23    147 - 147      cnkind24    148 - 148
      cnkind25    149 - 149      cnkind26    150 - 150
      cnkind27    151 - 151      cnkind28    152 - 152
      cnkind29    153 - 153      cnkind30    154 - 154
      cnkind31    155 - 155      canage1     156 - 158
      canage2     159 - 161      canage3     162 - 164
      canage4     165 - 167      canage5     168 - 170
      canage6     171 - 173      canage7     174 - 176
      canage8     177 - 179      canage9     180 - 182
      canage10    183 - 185      canage11    186 - 188
      canage12    189 - 191      canage13    192 - 194
      canage14    195 - 197      canage15    198 - 200
      canage16    201 - 203      canage17    204 - 206
      canage18    207 - 209      canage19    210 - 212
      canage20    213 - 215      canage21    216 - 218
      canage22    219 - 221      canage23    222 - 224
      canage24    225 - 227      canage25    228 - 230
      canage26    231 - 233      canage27    234 - 236
      canage28    237 - 239      canage29    240 - 242
      canage30    243 - 245      dibev       246 - 246
      dibpre1     247 - 247      dibage      248 - 249
      difage2     250 - 251      insln       252 - 252
      dibpill     253 - 253      ahayfyr     254 - 254
      sinyr       255 - 255      cbrchyr     256 - 256
      kidwkyr     257 - 257      livyr       258 - 258
      jntsymp     259 - 259      jmthp1      260 - 260
      jmthp2      261 - 261      jmthp3      262 - 262
      jmthp4      263 - 263      jmthp5      264 - 264
      jmthp6      265 - 265      jmthp7      266 - 266
      jmthp8      267 - 267      jmthp9      268 - 268
      jmthp10     269 - 269      jmthp11     270 - 270
      jmthp12     271 - 271      jmthp13     272 - 272
      jmthp14     273 - 273      jmthp15     274 - 274
      jmthp16     275 - 275      jmthp17     276 - 276
      jntpn       277 - 278      jntchr      279 - 279
      jnthp       280 - 280      arth1       281 - 281
      arthwt      282 - 282      arthph      283 - 283
      arthcls     284 - 284      arthlmt     285 - 285
      arthwrk     286 - 286      paineck     287 - 287
      painlb      288 - 288      painleg     289 - 289
      painface    290 - 290      amigr       291 - 291
      acold2w     292 - 292      aintil2w    293 - 293
      pregnow     294 - 294      pregflyr    295 - 295
      ahearst2    296 - 296      hrwors      297 - 297
      hrwhich     298 - 298      hrright     299 - 299
      hrleft      300 - 300      hrwhisp1    301 - 301
      hrtalk1     302 - 302      hrshout1    303 - 303
      hrspeak1    304 - 304      hrcocre1    305 - 305
      hrcocim1    306 - 306      hrfam       307 - 307
      hrback      308 - 308      hrfrust     309 - 309
      hrsafety    310 - 310      hearage1    311 - 312
      hrcaus1     313 - 314      hrprobhp    315 - 315
      hrent       316 - 316      hraud       317 - 317
      hrtest      318 - 318      hraidnow    319 - 319
      hraidlng    320 - 321      hraid2wk    322 - 322
      hraidhlp    323 - 323      hraidev     324 - 324
      hraidrec    325 - 325      hraidlgp    326 - 327
      hraidof2    328 - 328      hraidn01    329 - 329
      hraidn02    330 - 330      hraidn03    331 - 331
      hraidn04    332 - 332      hraidn05    333 - 333
      hraidn06    334 - 334      hraidn07    335 - 335
      hraidn08    336 - 336      hraidn09    337 - 337
      hraidn10    338 - 338      hraidn11    339 - 339
      hraudtrn    340 - 340      hralds      341 - 341
      hraldt01    342 - 342      hraldt02    343 - 343
      hraldt03    344 - 344      hraldt04    345 - 345
      hraldt05    346 - 346      hraldt06    347 - 347
      hraldt07    348 - 348      hraldt08    349 - 349
      hraldt09    350 - 350      hraldt10    351 - 351
      hraldt11    352 - 352      hrbdizz     353 - 353
      hrtin       354 - 354      hrtinoft    355 - 355
      hrtinlng    356 - 357      hrtinmus    358 - 358
      hrtinslp    359 - 359      hrtinpro    360 - 360
      hrtindis    361 - 361      hrtindoc    362 - 362
      hrtinrm     363 - 363      hremty01    364 - 364
      hremty02    365 - 365      hremty03    366 - 366
      hremty04    367 - 367      hremty05    368 - 368
      hremty06    369 - 369      hremty07    370 - 370
      hremty08    371 - 371      hremty09    372 - 372
      hremty10    373 - 373      hremty11    374 - 374
      hremty12    375 - 375      hrtnrmhp    376 - 376
      hrhcusis    377 - 377      hrhcprob    378 - 378
      hrfire      379 - 379      hrfirtyp    380 - 380
      hrfrtim     381 - 381      hr12mr      382 - 382
      hrfrprot    383 - 383      hrtotr      384 - 384
      hrfrprt2    385 - 385      hrwkvlns    386 - 386
      hrwklns     387 - 387      hrwkvlnt    388 - 389
      hrwkvlex    390 - 390      hrwkvlp1    391 - 391
      hrwkvlp2    392 - 392      hrwrlns     393 - 394
      hrwklex     395 - 395      hrwklp1     396 - 396
      hrwklp2     397 - 397      hrlsvlns    398 - 398
      hrvltp01    399 - 399      hrvltp02    400 - 400
      hrvltp03    401 - 401      hrvltp04    402 - 402
      hrvltp05    403 - 403      hrvltp06    404 - 404
      hrvltp07    405 - 405      hrvltp08    406 - 406
      hrvltp09    407 - 407      hrvltp10    408 - 408
      hrlnos      409 - 409      hrltp01     410 - 410
      hrltp02     411 - 411      hrltp03     412 - 412
      hrltp04     413 - 413      hrltp05     414 - 414
      hrltp06     415 - 415      hrltp07     416 - 416
      hrltp08     417 - 417      hrltp09     418 - 418
      hrltp10     419 - 419      hrnosexp    420 - 420
      hrlsp1      421 - 421      hrlsp2      422 - 422
      hrintnet    423 - 423      hrinthl     424 - 424
      hrintha     425 - 425      hrinttn     426 - 426
      hrintdz     427 - 427      hrinthp     428 - 428
      hrinthpr    429 - 429      avision     430 - 430
      ablind      431 - 431      lupprt      432 - 432

      wkdayr      433 - 435      beddayr     436 - 438
      ahstatyr    439 - 439      speceq      440 - 440
      flwalk      441 - 441      flclimb     442 - 442
      flstand     443 - 443      flsit       444 - 444
      flstoop     445 - 445      flreach     446 - 446
      flgrasp     447 - 447      flcarry     448 - 448
      flpush      449 - 449      flshop      450 - 450
      flsocl      451 - 451      flrelax     452 - 452
      fla1ar      453 - 453      aflhca1     454 - 454
      aflhca2     455 - 455      aflhca3     456 - 456
      aflhca4     457 - 457      aflhca5     458 - 458
      aflhca6     459 - 459      aflhca7     460 - 460
      aflhca8     461 - 461      aflhca9     462 - 462
      aflhca10    463 - 463      aflhca11    464 - 464
      aflhca12    465 - 465      aflhca13    466 - 466
      alhca14a    467 - 467      aflhca15    468 - 468
      aflhca16    469 - 469      aflhca17    470 - 470
      aflhca18    471 - 471      aflhc19_    472 - 472
      aflhc20_    473 - 473      aflhc21_    474 - 474
      aflhc22_    475 - 475      aflhc23_    476 - 476
      aflhc24_    477 - 477      aflhc25_    478 - 478
      aflhc26_    479 - 479      aflhc27_    480 - 480
      aflhc28_    481 - 481      aflhc29_    482 - 482
      aflhc30_    483 - 483      aflhc31_    484 - 484
      aflhc32_    485 - 485      aflhc33_    486 - 486
      aflhc34_    487 - 487      aflhca90    488 - 488
      aflhca91    489 - 489      altime1     490 - 491
      alunit1     492 - 492      aldura1     493 - 494
      aldurb1     495 - 495      alchrc1     496 - 496
      altime2     497 - 498      alunit2     499 - 499
      aldura2     500 - 501      aldurb2     502 - 502
      alchrc2     503 - 503      altime3     504 - 505
      alunit3     506 - 506      aldura3     507 - 508
      aldurb3     509 - 509      alchrc3     510 - 510
      altime4     511 - 512      alunit4     513 - 513
      aldura4     514 - 515      aldurb4     516 - 516
      alchrc4     517 - 517      altime5     518 - 519
      alunit5     520 - 520      aldura5     521 - 522
      aldurb5     523 - 523      alchrc5     524 - 524
      altime6     525 - 526      alunit6     527 - 527
      aldura6     528 - 529      aldurb6     530 - 530
      alchrc6     531 - 531      altime7     532 - 533
      alunit7     534 - 534      aldura7     535 - 536
      aldurb7     537 - 537      alchrc7     538 - 538
      altime8     539 - 540      alunit8     541 - 541
      aldura8     542 - 543      aldurb8     544 - 544
      alchrc8     545 - 545      altime9     546 - 547
      alunit9     548 - 548      aldura9     549 - 550
      aldurb9     551 - 551      alchrc9     552 - 552
      altime10    553 - 554      alunit10    555 - 555
      aldura10    556 - 557      aldurb10    558 - 558
      alchrc10    559 - 559      altime11    560 - 561
      alunit11    562 - 562      aldura11    563 - 564
      aldurb11    565 - 565      alchrc11    566 - 566
      altime12    567 - 568      alunit12    569 - 569
      aldura12    570 - 571      aldurb12    572 - 572
      alchrc12    573 - 573      altime13    574 - 575
      alunit13    576 - 576      aldura13    577 - 578
      aldurb13    579 - 579      alchrc13    580 - 580
      atime14a    581 - 582      aunit14a    583 - 583
      adura14a    584 - 585      adurb14a    586 - 586
      achrc14a    587 - 587      altime15    588 - 589
      alunit15    590 - 590      aldura15    591 - 592
      aldurb15    593 - 593      alchrc15    594 - 594
      altime16    595 - 596      alunit16    597 - 597
      aldura16    598 - 599      aldurb16    600 - 600
      alchrc16    601 - 601      altime17    602 - 603
      alunit17    604 - 604      aldura17    605 - 606
      aldurb17    607 - 607      alchrc17    608 - 608
      altime18    609 - 610      alunit18    611 - 611
      aldura18    612 - 613      aldurb18    614 - 614
      alchrc18    615 - 615      altime19    616 - 617
      alunit19    618 - 618      aldura19    619 - 620
      aldurb19    621 - 621      alchrc19    622 - 622
      altime20    623 - 624      alunit20    625 - 625
      aldura20    626 - 627      aldurb20    628 - 628
      alchrc20    629 - 629      altime21    630 - 631
      alunit21    632 - 632      aldura21    633 - 634
      aldurb21    635 - 635      alchrc21    636 - 636
      altime22    637 - 638      alunit22    639 - 639
      aldura22    640 - 641      aldurb22    642 - 642
      alchrc22    643 - 643      altime23    644 - 645
      alunit23    646 - 646      aldura23    647 - 648
      aldurb23    649 - 649      alchrc23    650 - 650
      altime24    651 - 652      alunit24    653 - 653
      aldura24    654 - 655      aldurb24    656 - 656
      alchrc24    657 - 657      altime25    658 - 659
      alunit25    660 - 660      aldura25    661 - 662
      aldurb25    663 - 663      alchrc25    664 - 664
      altime26    665 - 666      alunit26    667 - 667
      aldura26    668 - 669      aldurb26    670 - 670
      alchrc26    671 - 671      altime27    672 - 673
      alunit27    674 - 674      aldura27    675 - 676
      aldurb27    677 - 677      alchrc27    678 - 678
      altime28    679 - 680      alunit28    681 - 681
      aldura28    682 - 683      aldurb28    684 - 684
      alchrc28    685 - 685      altime29    686 - 687
      alunit29    688 - 688      aldura29    689 - 690
      aldurb29    691 - 691      alchrc29    692 - 692
      altime30    693 - 694      alunit30    695 - 695
      aldura30    696 - 697      aldurb30    698 - 698
      alchrc30    699 - 699      altime31    700 - 701
      alunit31    702 - 702      aldura31    703 - 704
      aldurb31    705 - 705      alchrc31    706 - 706
      altime32    707 - 708      alunit32    709 - 709
      aldura32    710 - 711      aldurb32    712 - 712
      alchrc32    713 - 713      altime33    714 - 715
      alunit33    716 - 716      aldura33    717 - 718
      aldurb33    719 - 719      alchrc33    720 - 720
      altime34    721 - 722      alunit34    723 - 723
      aldura34    724 - 725      aldurb34    726 - 726
      alchrc34    727 - 727      altime90    728 - 729
      alunit90    730 - 730      aldura90    731 - 732
      aldurb90    733 - 733      alchrc90    734 - 734
      altime91    735 - 736      alunit91    737 - 737
      aldura91    738 - 739      aldurb91    740 - 740
      alchrc91    741 - 741      alcndrt     742 - 742
      alchronr    743 - 743

      smkev       744 - 744      smkreg      745 - 746
      smknow      747 - 747      smkstat2    748 - 748
      smkqtno     749 - 750      smkqttp     751 - 751
      smkqty      752 - 753      cigsda1     754 - 755
      cigdamo     756 - 757      cigsda2     758 - 759
      cigsday     760 - 761      cigqtyr     762 - 762
      othcigev    763 - 763      othciged    764 - 764
      smklesev    765 - 765      smklesed    766 - 766
      toblasyr    767 - 767      tobqtyr     768 - 768
      ecigev      769 - 769      eciged      770 - 770
      vigno       771 - 773      vigtp       774 - 774
      vigfreqw    775 - 776      viglngno    777 - 779
      viglngtp    780 - 780      vigmin      781 - 783
      modno       784 - 786      modtp       787 - 787
      modfreqw    788 - 789      modlngno    790 - 792
      modlngtp    793 - 793      modmin      794 - 796
      strngno     797 - 799      strngtp     800 - 800
      strfreqw    801 - 802      alc1yr      803 - 803
      alclife     804 - 804      alc12mno    805 - 807
      alc12mtp    808 - 808      alc12mwk    809 - 810
      alc12myr    811 - 813      alcamt      814 - 815
      alcstat     816 - 817      alc5upn1    818 - 820
      alc5upt1    821 - 821      alc5upy1    822 - 824
      aheight     825 - 826      aweightp    827 - 829
      bmi         830 - 833

      ausualpl    834 - 834      aplkind     835 - 835
      ahcplrou    836 - 836      ahcplknd    837 - 837
      ahcchgyr    838 - 838      ahcchghi    839 - 839
      anouspl1    840 - 840      anouspl2    841 - 841
      anouspl3    842 - 842      anouspl4    843 - 843
      anouspl5    844 - 844      anouspl6    845 - 845
      anouspl7    846 - 846      anouspl8    847 - 847
      anouspl9    848 - 848      aprvtryr    849 - 849
      aprvtrfd    850 - 850      adrnanp     851 - 851
      adrnai      852 - 852      ahcdlyr1    853 - 853
      ahcdlyr2    854 - 854      ahcdlyr3    855 - 855
      ahcdlyr4    856 - 856      ahcdlyr5    857 - 857
      ahcafyr1    858 - 858      ahcafyr2    859 - 859
      ahcafyr3    860 - 860      ahcafyr4    861 - 861
      ahcafyr5    862 - 862      ahcafyr6    863 - 863
      aworpay     864 - 864      ahicomp     865 - 865
      arx12mo     866 - 866      arx12_1     867 - 867
      arx12_2     868 - 868      arx12_3     869 - 869
      arx12_4     870 - 870      arx12_5     871 - 871
      arx12_6     872 - 872      adnlong2    873 - 873
      ahcsyr1     874 - 874      ahcsyr2     875 - 875
      ahcsyr3     876 - 876      ahcsyr4     877 - 877
      ahcsyr5     878 - 878      ahcsyr6     879 - 879
      ahcsyr7     880 - 880      ahcsyr8     881 - 881
      ahcsyr9     882 - 882      ahcsyr10    883 - 883
      ahernoy2    884 - 885      aervisnd    886 - 886
      aerhos      887 - 887      aerrea1r    888 - 888
      aerrea2r    889 - 889      aerrea3r    890 - 890
      aerrea4r    891 - 891      aerrea5r    892 - 892
      aerrea6r    893 - 893      aerrea7r    894 - 894
      aerrea8r    895 - 895      ahchyr      896 - 896
      ahchmoyr    897 - 898      ahchnoy2    899 - 900
      ahcnoyr2    901 - 902      asrgyr      903 - 903
      asrgnoyr    904 - 905      amdlongr    906 - 906
      avislast    907 - 907      alastyp1    908 - 908
      alastyp2    909 - 909      alastyp3    910 - 910
      alastyp4    911 - 911  str alastvrb    912 - 956
      avisapn2    957 - 958      avisapt2    959 - 959
      awaitrmn    960 - 961      awaitrmt    962 - 962
      hit1a       963 - 963      hit2a       964 - 964
      hit3a       965 - 965      hit4a       966 - 966
      hit5a       967 - 967      shtflu2     968 - 968
      ashflum2    969 - 970      ashfluy2    971 - 974
      flushpg1    975 - 975      flushpg2    976 - 976
      sprflu2     977 - 977      aspflum2    978 - 979
      aspfluy2    980 - 983      shtpnuyr    984 - 984
      apox        985 - 985      apox12mo    986 - 986
      ahep        987 - 987      ahepliv     988 - 988
      ahepbtst    989 - 989      shthepb     990 - 990
      shepdos     991 - 991      shthepa     992 - 992
      shepanum    993 - 994      ahepctst    995 - 995
      ahepcres    996 - 996      shingles    997 - 997
      shttd       998 - 998      shttd05     999 - 999
      shttdap2   1000 -1000      shthpv2    1001 -1001
      shhpvdos   1002 -1003      ahpvage    1004 -1006
      livev      1007 -1007      travel     1008 -1008
      wrkhlth2   1009 -1009      wrkdir     1010 -1010
      apsbpch1   1011 -1011      apschch1   1012 -1012
      apsbsch1   1013 -1013      apspap     1014 -1014
      apsmam     1015 -1015      apscol     1016 -1016
      apsdiet    1017 -1017      apssmkc    1018 -1018
      ltcfam     1019 -1019      ltchelp    1020 -1020
      ltcwho1    1021 -1021      ltcwho2    1022 -1022
      ltcwho3    1023 -1023      ltcwho4    1024 -1024
      ltcwho5    1025 -1025      aindins    1026 -1026
      aindprch   1027 -1027      aindwho    1028 -1028
      ainddif1   1029 -1029      ainddif2   1030 -1030
      aindeny1   1031 -1031      aindeny2   1032 -1032
      aindeny3   1033 -1033      aindnot1   1034 -1034
      aindnot2   1035 -1035      aindnot3   1036 -1036
      aindnot4   1037 -1037      aindnot5   1038 -1038
      aexchng    1039 -1039

      asicpuse   1040 -1040      asisathc   1041 -1041
      asitenur   1042 -1042      asinhelp   1043 -1043
      asincnto   1044 -1044      asintru    1045 -1045
      asinknt    1046 -1046      asisim     1047 -1047
      asisif     1048 -1048      asiretr    1049 -1049
      asimedc    1050 -1050      asistlv    1051 -1051
      asicnhc    1052 -1052      asiccoll   1053 -1053
      asinbill   1054 -1054      asihcst    1055 -1055
      asiccmp    1056 -1056      asisleep   1057 -1058
      asislpfl   1059 -1060      asislpst   1061 -1062
      asislpmd   1063 -1064      asirest    1065 -1066
      asisad     1067 -1067      asinerv    1068 -1068
      asirstls   1069 -1069      asihopls   1070 -1070
      asieffrt   1071 -1071      asiwthls   1072 -1072
      asimuch    1073 -1073      asihivt    1074 -1074
      asihivwn   1075 -1076

      awebuse    1077 -1077      awebofno   1078 -1080
      aweboftp   1081 -1081      aweborp    1082 -1082
      awebeml    1083 -1083      awebmno    1084 -1086
      awebmtp    1087 -1087

using "$DAT/2014/samadult.dat";
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
Detailed industry classification (from 2012 Census codes based on NAICS)";
label variable indstrn2 "
Simple industry classification (from 2012 Census codes based on NAICS)";
label variable occupn1  "
Detailed occupation classification (from 2010 Census Codes based on SOC)";
label variable occupn2  "
Simple occupation classification (from 2010 Census codes based on SOC)";
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
label variable hybpckno "Time since blood pressure checked: # of units";
label variable hybpcktp "Time since blood pressure checked: Time units";
label variable hybplev  "Blood pressure level";
label variable hypmdev2 "Ever prescribed medicine for high blood pressure";
label variable hypmed2  "Now taking prescribed medicine for high blood pressure
";
label variable chlev    "Ever told you had high cholesterol";
label variable chlyr    "Had high cholesterol, past 12 months";
label variable clckno   "Time since cholesterol checked: # of units";
label variable clcktp   "Time since cholesterol checked: Time units";
label variable chlmdev2 "Ever prescribed medicine to lower cholesterol";
label variable chlmdnw2 "Now taking prescribed medicine to lower cholesterol";
label variable chdev    "Ever been told you had coronary heart disease";
label variable angev    "Ever been told you had angina pectoris";
label variable miev     "Ever been told you had a heart attack";
label variable hrtev    "Ever been told you had a heart condition/disease";
label variable strev    "Ever been told you had a stroke";
label variable ephev    "Ever been told you had emphysema";
label variable jawp     "
Knowledge of heart attack symptoms�pain in jaw/neck/back";
label variable wea      "Knowledge of heart attack symptoms�feeling weak";
label variable che      "Knowledge of heart attack symptoms�chest pain";
label variable arm      "
Knowledge of heart attack symptoms�pain in arms/shoulder";
label variable brth     "Knowledge of heart attack symptoms�shortness of breath
";
label variable ahado    "Best thing to do when someone is having a heart attack
";
label variable face     "Knowledge of stroke symptoms�numbness/weakness";
label variable speaking "
Knowledge of stroke symptoms�sudden confusion/trouble speaking";
label variable eye      "Knowledge of stroke symptoms�sudden trouble seeing";
label variable walking  "Knowledge of stroke symptoms�sudden trouble walking";
label variable headache "Knowledge of stroke symptoms�sudden severe headache";
label variable astdo    "Best thing to do when someone is having a stroke";
label variable copdev   "Ever been told you had COPD";
label variable aspmedev "Ever been told to take low-dose aspirin";
label variable aspmedad "Following low-dose aspirin advice";
label variable aspmdmed "Advised to stop taking low-dose aspirin";
label variable asponown "Taking low-dose aspirin on own";
label variable aasmev   "Ever been told you had asthma";
label variable aasstill "Still have asthma";
label variable aasmyr   "Had an asthma episode/attack past 12 m";
label variable aaseryr1 "Had visit to ER due to asthma past 12 m";
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
label variable jntpn    "Severity of joint pain on average, past 30 d";
label variable jntchr   "Joint symptoms begin more than 3 months ago";
label variable jnthp    "
Ever seen doctor or health professional for joint symptoms";
label variable arth1    "Ever been told you had arthritis";
label variable arthwt   "Ever told to lose weight to help arthritis";
label variable arthph   "Ever told to exercise to help arthritis";
label variable arthcls  "
Ever told to take a course on managing problems related to arthritis";
label variable arthlmt  "Limited due to arthritis or joint symptoms";
label variable arthwrk  "Arthritis affect your work";
label variable paineck  "Had neck pain, past 3 months";
label variable painlb   "Had low back pain, past 3 months";
label variable painleg  "Pain spread down leg/below knees";
label variable painface "Had pain in jaw/front of ear, past 3 months";
label variable amigr    "Had severe headache/migraine, past 3 m";
label variable acold2w  "Had a head/chest cold past 2 w";
label variable aintil2w "Had stomach prob w/vomit/diarrhea, 2 w";
label variable pregnow  "Currently pregnant";
label variable pregflyr "Recently pregnant";
label variable ahearst2 "Hearing w/o hearing aid";
label variable hrwors   "Hearing worse in one ear";
label variable hrwhich  "Which ear is worse";
label variable hrright  "Hearing in right ear";
label variable hrleft   "Hearing in left ear";
label variable hrwhisp1 "Hear whispers across room";
label variable hrtalk1  "Hear normal voice across room";
label variable hrshout1 "Hear shouting voice across room";
label variable hrspeak1 "Hear voice in better ear";
label variable hrcocre1 "Cochlear implant recommended";
label variable hrcocim1 "Had cochlear implant surgery";
label variable hrfam    "Ever told by friends/relatives you had hearing problem
";
label variable hrback   "Trouble with background noise";
label variable hrfrust  "Frustrated with hearing when talking";
label variable hrsafety "Hearing causes worry about safety";
label variable hearage1 "Age at first hearing loss";
label variable hrcaus1  "Main cause of hearing loss";
label variable hrprobhp "Last saw doctor/hp about hearing problems";
label variable hrent    "Referred to hearing specialist, past 5 years";
label variable hraud    "Referred to audiologist, past 5 years";
label variable hrtest   "Last time hearing tested";
label variable hraidnow "Now use a hearing aid";
label variable hraidlng "How long used hearing aid";
label variable hraid2wk "Hours using hearing aid, on average day";
label variable hraidhlp "Hearing aid helped, past 2 weeks";
label variable hraidev  "Ever used a hearing aid if not now using";
label variable hraidrec "Hearing aid ever recommended";
label variable hraidlgp "How long hearing aid used in past";
label variable hraidof2 "How often used hearing aid in the past";
label variable hraidn01 "HA not used - it didn't help";
label variable hraidn02 "HA not used - too loud";
label variable hraidn03 "HA not used - didn't like way it sounded";
label variable hraidn04 "HA not used - didn't like way I sounded";
label variable hraidn05 "HA not used - uncomfortable";
label variable hraidn06 "HA not used - frequent breakdowns";
label variable hraidn07 "HA not used - didn't like look";
label variable hraidn08 "HA not used - cost too much";
label variable hraidn09 "HA not used - don't need";
label variable hraidn10 "HA not used - misplaced/lost";
label variable hraidn11 "HA not used - other";
label variable hraudtrn "Ever receive instruction to improve hearing";
label variable hralds   "Use assistive-listening devices";
label variable hraldt01 "ALD - FM system pocket talker";
label variable hraldt02 "ALD - instant/text messages";
label variable hraldt03 "ALD - amplified telephone";
label variable hraldt04 "ALD - amplified/vibrating alarm clock";
label variable hraldt05 "ALD - notification/signaling alarm";
label variable hraldt06 "ALD - headset with TV/close-captioned TV";
label variable hraldt07 "ALD - TTY/TDD";
label variable hraldt08 "ALD - video relay service";
label variable hraldt09 "ALD - live video streaming using sign language";
label variable hraldt10 "ALD - sign language interpreter";
label variable hraldt11 "ALD - other";
label variable hrbdizz  "Problems with dizziness, past 12 m";
label variable hrtin    "Had ringing in ears, past 12 months";
label variable hrtinoft "How often had ringing in ears, past 12 months";
label variable hrtinlng "How long bothered by ringing in ears";
label variable hrtinmus "Ringing in ears only after loud sounds/music";
label variable hrtinslp "Ringing in ears when going to sleep";
label variable hrtinpro "How much a problem, ringing in ears";
label variable hrtindis "Discuss ringing in ears with doctor/HP";
label variable hrtindoc "Ever evaluated for ringing in ears, past 5 yrs";
label variable hrtinrm  "Tried remedies for ringing in ears";
label variable hremty01 "Remedies tried for ringing�drugs/medication";
label variable hremty02 "
Remedies tried for ringing�stop/reduced drugs/medication";
label variable hremty03 "Remedies tried for ringing�hearing aids";
label variable hremty04 "Remedies tried for ringing�masking devices";
label variable hremty05 "Remedies tried for ringing�surgical procedures";
label variable hremty06 "Remedies tried for ringing�relaxation therapy";
label variable hremty07 "Remedies tried for ringing�TRT";
label variable hremty08 "Remedies tried for ringing�music therapy";
label variable hremty09 "Remedies tried for ringing�avoided irritants";
label variable hremty10 "Remedies tried for ringing�nutritional supplements";
label variable hremty11 "Remedies tried for ringing�alternative methods";
label variable hremty12 "Remedies tried for ringing�other";
label variable hrtnrmhp "How much have remedies helped with ringing in ears";
label variable hrhcusis "Annoyed by everyday sounds";
label variable hrhcprob "How much of a problem are evryday sounds, past 12 m";
label variable hrfire   "Ever used firearms";
label variable hrfirtyp "Used firearms for work/leisure";
label variable hrfrtim  "When did you use guns/firearms";
label variable hr12mr   "Number of rounds fired, past 12 months";
label variable hrfrprot "Wear hearing protection at leisure, past 12 months";
label variable hrtotr   "Number of total rounds fired";
label variable hrfrprt2 "
How often worn hearing protection when shooting, before past 12 m";
label variable hrwkvlns "Ever had job where exposed to very loud sounds/noise";
label variable hrwklns  "Ever had job where exposed to loud sounds/noise";
label variable hrwkvlnt "Months/years exposed to very loud sounds/noise at work
";
label variable hrwkvlex "When exposed to very loud sounds/noise at work";
label variable hrwkvlp1 "
Hearing protection for very loud noise at work, past 12 m";
label variable hrwkvlp2 "
Hearing protection for very loud noise at work, before past 12 m";
label variable hrwrlns  "Months/years exposed to loud sounds/noise at work";
label variable hrwklex  "When exposed to loud sounds/noise at work";
label variable hrwklp1  "Hearing protection for loud noise at work, past 12 m";
label variable hrwklp2  "
Hearing protection for loud noise at work, before past 12 m";
label variable hrlsvlns "
Ever exposed to very loud noise 10+ times/yr, outside work";
label variable hrvltp01 "Exposed to very loud activity�lawn mower";
label variable hrvltp02 "Exposed to very loud activity�power tools";
label variable hrvltp03 "Exposed to very loud activity�household appliances";
label variable hrvltp04 "Exposed to very loud activity�recreational vehicles";
label variable hrvltp05 "Exposed to very loud activity�rock concerts";
label variable hrvltp06 "
Exposed to very loud activity�very loud music from CD player";
label variable hrvltp07 "Exposed to very loud activity�very loud sporting event
";
label variable hrvltp08 "Exposed to very loud activity�guns/firearms";
label variable hrvltp09 "Exposed to very loud activity�video/computer games";
label variable hrvltp10 "Exposed to very loud activity�other";
label variable hrlnos   "Ever exposed to loud noise 10+ times/yr, outside work";
label variable hrltp01  "Exposed to loud activity�lawn mower";
label variable hrltp02  "Exposed to loud activity�power tools";
label variable hrltp03  "Exposed to loud activity�household appliances";
label variable hrltp04  "Exposed to loud activity�recreational vehicles";
label variable hrltp05  "Exposed to loud activity�rock concerts";
label variable hrltp06  "Exposed to loud activity�very loud music from CD player
";
label variable hrltp07  "Exposed to loud activity�very loud sporting event";
label variable hrltp08  "Exposed to loud activity�guns/firearms";
label variable hrltp09  "Exposed to loud activity�video/computer games";
label variable hrltp10  "Exposed to loud activity�other";
label variable hrnosexp "When exposed to loud/very loud sounds/noise at work";
label variable hrlsp1   "
Hearing protection for loud/very loud noise outside work, past 12 m";
label variable hrlsp2   "
Hearing protection for loud/very loud noise outside work, before past 12 m";
label variable hrintnet "Get info from Internet about health, past 12 m";
label variable hrinthl  "Past 12 m, get info from Internet on�hearing loss";
label variable hrintha  "Past 12 m, get info from Internet on�hearing aids";
label variable hrinttn  "Past 12 m, get info from Internet on�ringing in ears";
label variable hrintdz  "
Past 12 m, get info from Internet on�dizziness/balance problems";
label variable hrinthp  "Past 12 m, get info from Internet on�hearing protection
";
label variable hrinthpr "Any Internet info written by a doc/health pro";
label variable avision  "Trouble seeing even w/glasses/lenses";
label variable ablind   "Blind or unable to see at all";
label variable lupprt   "Lost all upper & lower natural teeth";

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
Lung/breathing problem (e.g., asthma) causes difficulty with activity";
label variable aflhca12 "Cancer causes difficulty with activity";
label variable aflhca13 "Birth defect causes difficulty with activity";
label variable alhca14a "
Intellectual disability, AKA mental retardation causes difficulty with activity
";
label variable aflhca15 "
Other developmental problem (eg, cerebral palsy) causes difficulty with activity
";
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
Duration (in years) of lung/breathing problem (e.g., asthma), recode 1";
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
Duration of intellectual disability, AKA mental retardation: Number of units";
label variable aunit14a "
Duration of intellectual disability, also know as mental retardation: Time unit
";
label variable adura14a "
Duration (in years) of intellectual disability, AKA mental retardation, recode 1
";
label variable adurb14a "
Duration of intellectual disability, also known as mental retardation, recode 2
";
label variable achrc14a "
Intellectual disability, AKA mental retardation condition status recode";
label variable altime15 "
Duration of other developmental problem (e.g., cerebral palsy): Number of units
";
label variable alunit15 "
Duration of other developmental problem (e.g., cerebral palsy): Time unit";
label variable aldura15 "
Duration (in years) of other developmental problem (eg cerebral palsy), recode 1
";
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
Duration of missing limbs (fingers, toes); amputation: Number of units";
label variable alunit19 "
Duration of missing limbs (fingers, toes, or digits); amputation: Time unit";
label variable aldura19 "
Duration (in years) of missing limbs (fingers, toes); amputation, recode 1";
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
Duration (in years) of surgical after-effects/medical treatment prob, recode 1";
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
label variable ecigev   "Ever used electronic cigarettes (e-cig)";
label variable eciged   "E-cig freq: everyday/some days/not at all";
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
label variable alc5upn1 "Days 5+/4+ drinks, past yr: # days";
label variable alc5upt1 "Days 5+/4+ drinks, past yr: Time unit";
label variable alc5upy1 "Number of days had 5+/4+ drinks past year";
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
Flu shot before/during current pregnancy, interviewed Jan-Mar or Aug-Dec, 2014";
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
Ever traveled outside USA since 1995 (Excluding EUR, JPN, AUS, NZL, and CAN)";
label variable wrkhlth2 "Work or volunteer in a health care setting";
label variable wrkdir   "Direct contact with patients";
label variable apsbpch1 "
Blood pressure checked by doctor/nurse/health professional, past 12 m";
label variable apschch1 "
Cholesterol checked by doctor/nurse/health professional, past 12 m";
label variable apsbsch1 "Fasting test for high blood sugar/diabetes, past 12 m";
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
label variable aindnot1 "Didn�t buy plan because turned down, past 3 yrs";
label variable aindnot2 "Didn�t buy plan because of cost, past 3 yrs";
label variable aindnot3 "
Didn�t buy plan because of pre-existing condition, past 3 yrs";
label variable aindnot4 "
Didn�t buy plan because got health insurance from other source, past 3 yrs";
label variable aindnot5 "Other reason didn't buy plan, past 3 yrs";
label variable aexchng  "
Looked into purchasing health insurance through Healthcare.gov or Marketplace";

label variable asicpuse "How often do you use a computer";
label variable asisathc "How satisfied with health care, past 12 mo";
label variable asitenur "Length of time living in neighborhood";
label variable asinhelp "Agree/disagree�people in neighborhood help each other";
label variable asincnto "Agree/disagree�people I count on in neighborhood";
label variable asintru  "Agree/disagree�people in neighborhood can be trusted";
label variable asinknt  "Agree/disagree�close-knit neighborhood";
label variable asisim   "How you think of yourself (sexual orientation; male)";
label variable asisif   "
How do you think of yourself (sexual orientation; female)";
label variable asiretr  "How worried are you about�money for retirement";
label variable asimedc  "
How worried are you about�medical costs of illness/accident";
label variable asistlv  "
How worried are you about�maintaining standard of living";
label variable asicnhc  "How worried are you about�medical costs of healthcare";
label variable asiccoll "How worried are you about�paying for children's college
";
label variable asinbill "How worried are you about�paying monthly bills";
label variable asihcst  "
How worried are you about�paying rent/mortgage/housing costs";
label variable asiccmp  "How worried are you about�credit card payments";
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
label variable aweborp  "Online research panel membership";
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
label define sap044x
   00       "00 Never"
   95       "95 95 or more"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap045x
   0        "0 Never"
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap046x
   1        "1 Not told"
   2        "2 High"
   3        "3 Normal"
   4        "4 Low"
   5        "5 Borderline"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap066x
   1        "1 Advise them to drive to the hospital"
   2        "2 Advise them to call their physician"
   3        "3 Call 9-1-1 (or another emergency number)"
   4        "4 Call spouse or family member"
   5        "5 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap085x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap116x
   85       "85 85+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap146x
   1        "1 Yes"
   2        "2 No"
   3        "3 Borderline"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap149x
   00       "00 Within past year"
   85       "85 85+ years"
   96       "96 1+ year(s) with diabetes and age is 85+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap175x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap193x
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
label define sap195x
   1        "1 The right ear"
   2        "2 The left ear"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap205x
   1        "1 Always"
   2        "2 Usually"
   3        "3 About half the time"
   4        "4 Seldom"
   5        "5 Never"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap208x
   01       "01 At birth"
   02       "02 0 to 2 years of age"
   03       "03 3 to 5 years of age"
   04       "04 6 to 11 years of age"
   05       "05 12 to 19 years of age"
   06       "06 20 to 29 years of age"
   07       "07 30 to 39 years of age"
   08       "08 40 to 49 years of age"
   09       "09 50 to 59 years of age"
   10       "10 60 to 69 years of age"
   11       "11 70 to 79 years of age"
   12       "12 80 or more years of age"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap209x
   01       "
01 Present at birth because mother had infectious disease, for example, German m
easles (rubella), cytomegalovirus (CMV), toxoplasmosis, etc"
   02       "02 Present at birth for a genetic reason"
   03       "
03 Present at birth for other reason, e.g., preterm birth (NOT genetic or infect
ious disease)"
   04       "
04 After birth due to an infectious disease (measles, meningitis, mumps, etc.)"
   05       "
05 Ear infections or otitis media, fluid in middle ear space, ear drum burst (pe
rforation)"
   06       "06 Ear injury or head/neck trauma"
   07       "07 Ear surgery"
   08       "
08 Medications/drugs, such as gentamicin (aminoglycosides), cisplatin (cancer dr
ugs), antibiotics, anti-inflammatory drugs, diuretic"
   09       "09 Ear disease such as Meniere's disease or otosclerosis"
   10       "10 Brain tumor (acoustic neuroma/vestibular schwannoma, etc)"
   11       "
11 Loud, brief noise from gunfire, hand grenade, IED, other blasts or explosions
"
   12       "
12 Sudden hearing loss, unexplained by loud, brief noise or other known causes"
   13       "
13 Long term noise exposure from machinery, aircraft, power tools, loud music, a
ppliances, personal stereos or MP3 players, hair dryers, etc"
   14       "14 Getting older/aging"
   15       "15 Some other cause"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap210x
   0        "0 Never"
   1        "1 In the past year"
   2        "2 1 to 2 years ago"
   3        "3 to 4 years ago"
   4        "4 5 to 9 years ago"
   5        "5 10 to 14 years ago"
   6        "6 15 or more years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap215x
   01       "01 Less than 6 weeks"
   02       "02 6 weeks to 11 months"
   03       "03 1 to 2 years"
   04       "04 3 to 4 years"
   05       "05 5 to 9 years"
   06       "06 10 to 14 years"
   07       "07 15 years or more"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap216x
   0        "0 None"
   1        "1 Less than 1 hour a day"
   2        "2 1 to 3 hours a day"
   3        "3 4 to 7 hours a day"
   4        "4 8 or more hours per day"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap217x
   1        "1 Helped not at all"
   2        "2 Helped slightly"
   3        "3 Helped moderately"
   4        "4 Helped quite a lot"
   5        "5 Helped very much"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap248x
   1        "1 Almost always"
   2        "2 At least once a day"
   3        "3 At least once a week"
   4        "4 At least once a month"
   5        "5 Less frequently than once a month"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap249x
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
label define sap252x
   1        "1 No problem"
   2        "2 A small problem"
   3        "3 A moderate problem"
   4        "4 A big problem"
   5        "5 A very big problem"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap272x
   1        "1 Work"
   2        "2 Leisure"
   3        "3 Both work and leisure"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap273x
   1        "1 During the last 12 months"
   2        "2 Before the last 12 months"
   3        "3 Both during and before the last 12 months"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap274x
   1        "1 to less than 100 rounds"
   2        "2 100 to less than 1000 rounds"
   3        "3 1000 to less than 10,000 rounds"
   4        "4 10,000 rounds or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap276x
   1        "1 1 to less than 100 rounds"
   2        "2 100 to less than 1000 rounds"
   3        "3 1000 to less than 10,000 rounds"
   4        "4 10,000 to less than 50,000 rounds"
   5        "5 50,000 rounds or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap323x
   000      "000 None"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap325x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap327x
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
label define sap339x
   1        "1 Limited in any way"
   2        "2 Not limited in any way"
   3        "3 Unknown if limited"
;
label define sap376x
   95       "95 95+"
   96       "96 Since birth"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap377x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   6        "6 Since birth"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap378x
   00       "00 Less than 1 year"
   85       "85 85+ years"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap379x
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap380x
   1        "1 Chronic"
   2        "2 Not chronic"
   9        "9 Unknown if chronic"
;
label define sap556x
   1        "1 At least one condition causing functional limitation is chronic"
   2        "2 No condition causing functional limitation"
   9        "9 Unknown if any condition causing functional limitation is chronic
"
;
label define sap557x
   0        "0 Not limited in any way (including unknown if limited)"
   1        "1 Limited; caused by at least one chronic condition"
   2        "2 Limited; not caused by chronic condition"
   3        "3 Limited; unknown if condition is chronic"
;
label define sap559x
   85       "85 85 years or older"
   96       "96 Never smoked regularly"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap560x
   1        "1 Every day"
   2        "2 Some days"
   3        "3 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap561x
   1        "1 Current every day smoker"
   2        "2 Current some day smoker"
   3        "3 Former smoker"
   4        "4 Never smoker"
   5        "5 Smoker, current status unknown"
   9        "9 Unknown if ever smoked"
;
label define sap562x
   95       "95 95+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap563x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap564x
   00       "00 Less than 1 year"
   70       "70 70+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap565x
   95       "95 95+ cigarettes"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap566x
   00       "00 None"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap571x
   1        "1 Every day"
   2        "2 Some days"
   3        "3 Rarely"
   4        "4 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap578x
   000      "000 Never"
   996      "996 Unable to do this type activity"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap579x
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
label define sap580x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do vigorous activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap581x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap582x
   1        "1 Minutes"
   2        "2 Hours"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap586x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do light or moderate activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap592x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do strength activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap595x
   000      "000 Never"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap596x
   0        "0 Never/None"
   1        "1 Week"
   2        "2 Month"
   3        "3 Year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap597x
   00       "00 Less than one day per week"
   95       "95 Did not drink in past year"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap598x
   000      "000 Never/none"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap599x
   95       "95 95+ drinks"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap600x
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
label define sap602x
   0        "0 Never/None"
   1        "1 Per week"
   2        "2 Per month"
   3        "3 Per year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap604x
   96       "96 Not available"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap605x
   996      "996 Not available"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap607x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap608x
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
label define sap610x
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
label define sap613x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don�t know"
;
label define sap623x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don�t know"
;
label define sap637x
   1        "1 Very worried"
   2        "2 Somewhat worried"
   3        "3 Not at all worried"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap646x
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
label define sap657x
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
label define sap670x
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
label define sap673x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap675x
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
label define sap681x
   00       "00 Same day/walk-in appt/no appt made"
   96       "
96 Routine appt/appt arranged on previous visit/rec'd appt reminder card"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap682x
   1        "1 Days"
   2        "2 Weeks"
   3        "3 Months"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don�t know"
;
label define sap683x
   00       "00 No time"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don�t know"
;
label define sap684x
   1        "1 Minutes"
   2        "2 Hours"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don�t know"
;
label define sap691x
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
label define sap692x
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define sap693x
   1        "1 Before this pregnancy"
   2        "2 During this pregnancy"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap694x
   1        "1 Before this pregnancy"
   2        "2 During this pregnancy"
   3        "3 After this pregnancy"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap705x
   1        "1 Received at least 3 doses"
   2        "2 Received less than 3 doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap707x
   96       "96 Received all shots"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap709x
   1        "
1 You or your doctor thought you were at risk of having hepatitis C because a bl
ood test or symptoms like fatigue, nausea, stomach pain, yellowing of the eyes o
r skin indicated you might have liver disease"
   2        "2 You were born from 1945 through 1965"
   3        "
3 You were at risk of hepatitis C infection due to exposure to blood on your job
, injection drug use or receipt of transfusion before 1992"
   4        "4 Some other reason"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don�t know"
;
label define sap713x
   1        "1 Yes-included pertussis"
   2        "2 No-did not include pertussis"
   3        "3 Doctor did not say"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap714x
   1        "1 Yes"
   2        "2 No"
   3        "3 Doctor refused when asked"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap715x
   96       "96 All shots"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap730x
   1        "1 Very likely"
   2        "2 Somewhat likely"
   3        "3 Somewhat unlikely"
   4        "4 Very unlikely"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap738x
   1        "1 Self"
   2        "2 Someone else in family"
   3        "3 Both"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don�t know"
;
label define sap739x
   1        "1 Very difficult"
   2        "2 Somewhat difficult"
   3        "3 Not at all difficult"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don�t know"
;
label define sap740x
   1        "1 Very difficult"
   2        "2 Somewhat difficult"
   3        "3 Not at all difficult"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap750x
   1        "1 Never or almost never"
   2        "2 Some days"
   3        "3 Most days"
   4        "4 Every day"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap751x
   1        "1 Very satisfied"
   2        "2 Somewhat satisfied"
   3        "3 Somewhat dissatisfied"
   4        "4 Very dissatisfied"
   5        "5 You haven't had health care in the past 12 months"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap752x
   1        "1 Less than 1 year"
   2        "2 1-3 years"
   3        "3 4-10 years"
   4        "4 11-20 years"
   5        "5 More than 20 years"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap753x
   1        "1 Definitely agree"
   2        "2 Somewhat agree"
   3        "3 Somewhat disagree"
   4        "4 Definitely disagree"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap757x
   1        "1 Gay"
   2        "2 Straight, that is, not gay"
   3        "3 Bisexual"
   4        "4 Something else"
   5        "5 I don't know the answer"
   7        "7 Refused"
   8        "8 Not ascertained"
;
label define sap758x
   1        "1 Lesbian or gay"
   2        "2 Straight, that is, not lesbian or gay"
   3        "3 Bisexual"
   4        "4 Something else"
   5        "5 I don't know the answer"
   7        "7 Refused"
   8        "8 Not ascertained"
;
label define sap759x
   1        "1 Very worried"
   2        "2 Moderately worried"
   3        "3 Not too worried"
   4        "4 Not worried at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap763x
   1        "1 Very worried"
   2        "2 Moderately worried"
   3        "3 Not too worried"
   4        "4 Not worried at all"
   5        "5 This does not apply to me"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap766x
   1        "1 Very worried"
   2        "2 Moderately worried"
   3        "3 Not too worried"
   4        "4 Not worried at all"
   5        "5 I don't have credit cards"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap768x
   00       "00 Did not have trouble falling asleep in the past week"
   07       "07 7 or more times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap769x
   00       "00 Did not have trouble staying asleep in the past week"
   07       "07 7 or more times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap770x
   00       "00 Did not take medication to help sleep in the past week"
   07       "07 7 or more times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap771x
   00       "00 Never felt rested in the past week"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap772x
   1        "1 ALL of the time"
   2        "2 MOST of the time"
   3        "3 SOME of the time"
   4        "4 A LITTLE of the time"
   5        "5 NONE of the time"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap778x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap780x
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
label define sap783x
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
label values hypyr1    sap027x;   label values hybpckno  sap044x;
label values hybpcktp  sap045x;   label values hybplev   sap046x;
label values hypmdev2  sap027x;   label values hypmed2   sap027x;
label values chlev     sap027x;   label values chlyr     sap027x;
label values clckno    sap044x;   label values clcktp    sap045x;
label values chlmdev2  sap027x;   label values chlmdnw2  sap027x;
label values chdev     sap027x;   label values angev     sap027x;
label values miev      sap027x;   label values hrtev     sap027x;
label values strev     sap027x;   label values ephev     sap027x;
label values jawp      sap027x;   label values wea       sap027x;
label values che       sap027x;   label values arm       sap027x;
label values brth      sap027x;   label values ahado     sap066x;
label values face      sap027x;   label values speaking  sap027x;
label values eye       sap027x;   label values walking   sap027x;
label values headache  sap027x;   label values astdo     sap066x;
label values copdev    sap027x;   label values aspmedev  sap027x;
label values aspmedad  sap027x;   label values aspmdmed  sap027x;
label values asponown  sap027x;   label values aasmev    sap027x;
label values aasstill  sap027x;   label values aasmyr    sap027x;
label values aaseryr1  sap027x;   label values ulcev     sap027x;
label values ulcyr     sap027x;   label values canev     sap027x;
label values cnkind1   sap085x;   label values cnkind2   sap085x;
label values cnkind3   sap085x;   label values cnkind4   sap085x;
label values cnkind5   sap085x;   label values cnkind6   sap085x;
label values cnkind7   sap085x;   label values cnkind8   sap085x;
label values cnkind9   sap085x;   label values cnkind10  sap085x;
label values cnkind11  sap085x;   label values cnkind12  sap085x;
label values cnkind13  sap085x;   label values cnkind14  sap085x;
label values cnkind15  sap085x;   label values cnkind16  sap085x;
label values cnkind17  sap085x;   label values cnkind18  sap085x;
label values cnkind19  sap085x;   label values cnkind20  sap085x;
label values cnkind21  sap085x;   label values cnkind22  sap085x;
label values cnkind23  sap085x;   label values cnkind24  sap085x;
label values cnkind25  sap085x;   label values cnkind26  sap085x;
label values cnkind27  sap085x;   label values cnkind28  sap085x;
label values cnkind29  sap085x;   label values cnkind30  sap085x;
label values cnkind31  sap085x;   label values canage1   sap116x;
label values canage2   sap116x;   label values canage3   sap116x;
label values canage4   sap116x;   label values canage5   sap116x;
label values canage6   sap116x;   label values canage7   sap116x;
label values canage8   sap116x;   label values canage9   sap116x;
label values canage10  sap116x;   label values canage11  sap116x;
label values canage12  sap116x;   label values canage13  sap116x;
label values canage14  sap116x;   label values canage15  sap116x;
label values canage16  sap116x;   label values canage17  sap116x;
label values canage18  sap116x;   label values canage19  sap116x;
label values canage20  sap116x;   label values canage21  sap116x;
label values canage22  sap116x;   label values canage23  sap116x;
label values canage24  sap116x;   label values canage25  sap116x;
label values canage26  sap116x;   label values canage27  sap116x;
label values canage28  sap116x;   label values canage29  sap116x;
label values canage30  sap116x;   label values dibev     sap146x;
label values dibpre1   sap027x;   label values dibage    sap116x;
label values difage2   sap149x;   label values insln     sap027x;
label values dibpill   sap027x;   label values ahayfyr   sap027x;
label values sinyr     sap027x;   label values cbrchyr   sap027x;
label values kidwkyr   sap027x;   label values livyr     sap027x;
label values jntsymp   sap027x;   label values jmthp1    sap085x;
label values jmthp2    sap085x;   label values jmthp3    sap085x;
label values jmthp4    sap085x;   label values jmthp5    sap085x;
label values jmthp6    sap085x;   label values jmthp7    sap085x;
label values jmthp8    sap085x;   label values jmthp9    sap085x;
label values jmthp10   sap085x;   label values jmthp11   sap085x;
label values jmthp12   sap085x;   label values jmthp13   sap085x;
label values jmthp14   sap085x;   label values jmthp15   sap085x;
label values jmthp16   sap085x;   label values jmthp17   sap085x;
label values jntpn     sap175x;   label values jntchr    sap027x;
label values jnthp     sap027x;   label values arth1     sap027x;
label values arthwt    sap027x;   label values arthph    sap027x;
label values arthcls   sap027x;   label values arthlmt   sap027x;
label values arthwrk   sap027x;   label values paineck   sap027x;
label values painlb    sap027x;   label values painleg   sap027x;
label values painface  sap027x;   label values amigr     sap027x;
label values acold2w   sap027x;   label values aintil2w  sap027x;
label values pregnow   sap027x;   label values pregflyr  sap027x;
label values ahearst2  sap193x;   label values hrwors    sap027x;
label values hrwhich   sap195x;   label values hrright   sap193x;
label values hrleft    sap193x;   label values hrwhisp1  sap027x;
label values hrtalk1   sap027x;   label values hrshout1  sap027x;
label values hrspeak1  sap027x;   label values hrcocre1  sap027x;
label values hrcocim1  sap027x;   label values hrfam     sap027x;
label values hrback    sap205x;   label values hrfrust   sap205x;
label values hrsafety  sap205x;   label values hearage1  sap208x;
label values hrcaus1   sap209x;   label values hrprobhp  sap210x;
label values hrent     sap027x;   label values hraud     sap027x;
label values hrtest    sap210x;   label values hraidnow  sap027x;
label values hraidlng  sap215x;   label values hraid2wk  sap216x;
label values hraidhlp  sap217x;   label values hraidev   sap027x;
label values hraidrec  sap027x;   label values hraidlgp  sap215x;
label values hraidof2  sap216x;   label values hraidn01  sap085x;
label values hraidn02  sap085x;   label values hraidn03  sap085x;
label values hraidn04  sap085x;   label values hraidn05  sap085x;
label values hraidn06  sap085x;   label values hraidn07  sap085x;
label values hraidn08  sap085x;   label values hraidn09  sap085x;
label values hraidn10  sap085x;   label values hraidn11  sap085x;
label values hraudtrn  sap027x;   label values hralds    sap027x;
label values hraldt01  sap085x;   label values hraldt02  sap085x;
label values hraldt03  sap085x;   label values hraldt04  sap085x;
label values hraldt05  sap085x;   label values hraldt06  sap085x;
label values hraldt07  sap085x;   label values hraldt08  sap085x;
label values hraldt09  sap085x;   label values hraldt10  sap085x;
label values hraldt11  sap085x;   label values hrbdizz   sap027x;
label values hrtin     sap027x;   label values hrtinoft  sap248x;
label values hrtinlng  sap249x;   label values hrtinmus  sap027x;
label values hrtinslp  sap027x;   label values hrtinpro  sap252x;
label values hrtindis  sap027x;   label values hrtindoc  sap027x;
label values hrtinrm   sap027x;   label values hremty01  sap085x;
label values hremty02  sap085x;   label values hremty03  sap085x;
label values hremty04  sap085x;   label values hremty05  sap085x;
label values hremty06  sap085x;   label values hremty07  sap085x;
label values hremty08  sap085x;   label values hremty09  sap085x;
label values hremty10  sap085x;   label values hremty11  sap085x;
label values hremty12  sap085x;   label values hrtnrmhp  sap217x;
label values hrhcusis  sap027x;   label values hrhcprob  sap252x;
label values hrfire    sap027x;   label values hrfirtyp  sap272x;
label values hrfrtim   sap273x;   label values hr12mr    sap274x;
label values hrfrprot  sap205x;   label values hrtotr    sap276x;
label values hrfrprt2  sap205x;   label values hrwkvlns  sap027x;
label values hrwklns   sap027x;   label values hrwkvlnt  sap249x;
label values hrwkvlex  sap273x;   label values hrwkvlp1  sap205x;
label values hrwkvlp2  sap205x;   label values hrwrlns   sap249x;
label values hrwklex   sap273x;   label values hrwklp1   sap205x;
label values hrwklp2   sap205x;   label values hrlsvlns  sap027x;
label values hrvltp01  sap085x;   label values hrvltp02  sap085x;
label values hrvltp03  sap085x;   label values hrvltp04  sap085x;
label values hrvltp05  sap085x;   label values hrvltp06  sap085x;
label values hrvltp07  sap085x;   label values hrvltp08  sap085x;
label values hrvltp09  sap085x;   label values hrvltp10  sap085x;
label values hrlnos    sap027x;   label values hrltp01   sap085x;
label values hrltp02   sap085x;   label values hrltp03   sap085x;
label values hrltp04   sap085x;   label values hrltp05   sap085x;
label values hrltp06   sap085x;   label values hrltp07   sap085x;
label values hrltp08   sap085x;   label values hrltp09   sap085x;
label values hrltp10   sap085x;   label values hrnosexp  sap273x;
label values hrlsp1    sap205x;   label values hrlsp2    sap205x;
label values hrintnet  sap027x;   label values hrinthl   sap027x;
label values hrintha   sap027x;   label values hrinttn   sap027x;
label values hrintdz   sap027x;   label values hrinthp   sap027x;
label values hrinthpr  sap027x;   label values avision   sap027x;
label values ablind    sap027x;   label values lupprt    sap027x;

label values wkdayr    sap323x;   label values beddayr   sap323x;
label values ahstatyr  sap325x;   label values speceq    sap027x;
label values flwalk    sap327x;   label values flclimb   sap327x;
label values flstand   sap327x;   label values flsit     sap327x;
label values flstoop   sap327x;   label values flreach   sap327x;
label values flgrasp   sap327x;   label values flcarry   sap327x;
label values flpush    sap327x;   label values flshop    sap327x;
label values flsocl    sap327x;   label values flrelax   sap327x;
label values fla1ar    sap339x;   label values aflhca1   sap085x;
label values aflhca2   sap085x;   label values aflhca3   sap085x;
label values aflhca4   sap085x;   label values aflhca5   sap085x;
label values aflhca6   sap085x;   label values aflhca7   sap085x;
label values aflhca8   sap085x;   label values aflhca9   sap085x;
label values aflhca10  sap085x;   label values aflhca11  sap085x;
label values aflhca12  sap085x;   label values aflhca13  sap085x;
label values alhca14a  sap085x;   label values aflhca15  sap085x;
label values aflhca16  sap085x;   label values aflhca17  sap085x;
label values aflhca18  sap085x;   label values aflhc19_  sap085x;
label values aflhc20_  sap085x;   label values aflhc21_  sap085x;
label values aflhc22_  sap085x;   label values aflhc23_  sap085x;
label values aflhc24_  sap085x;   label values aflhc25_  sap085x;
label values aflhc26_  sap085x;   label values aflhc27_  sap085x;
label values aflhc28_  sap085x;   label values aflhc29_  sap085x;
label values aflhc30_  sap085x;   label values aflhc31_  sap085x;
label values aflhc32_  sap085x;   label values aflhc33_  sap085x;
label values aflhc34_  sap085x;   label values aflhca90  sap085x;
label values aflhca91  sap085x;   label values altime1   sap376x;
label values alunit1   sap377x;   label values aldura1   sap378x;
label values aldurb1   sap379x;   label values alchrc1   sap380x;
label values altime2   sap376x;   label values alunit2   sap377x;
label values aldura2   sap378x;   label values aldurb2   sap379x;
label values alchrc2   sap380x;   label values altime3   sap376x;
label values alunit3   sap377x;   label values aldura3   sap378x;
label values aldurb3   sap379x;   label values alchrc3   sap380x;
label values altime4   sap376x;   label values alunit4   sap377x;
label values aldura4   sap378x;   label values aldurb4   sap379x;
label values alchrc4   sap380x;   label values altime5   sap376x;
label values alunit5   sap377x;   label values aldura5   sap378x;
label values aldurb5   sap379x;   label values alchrc5   sap380x;
label values altime6   sap376x;   label values alunit6   sap377x;
label values aldura6   sap378x;   label values aldurb6   sap379x;
label values alchrc6   sap380x;   label values altime7   sap376x;
label values alunit7   sap377x;   label values aldura7   sap378x;
label values aldurb7   sap379x;   label values alchrc7   sap380x;
label values altime8   sap376x;   label values alunit8   sap377x;
label values aldura8   sap378x;   label values aldurb8   sap379x;
label values alchrc8   sap380x;   label values altime9   sap376x;
label values alunit9   sap377x;   label values aldura9   sap378x;
label values aldurb9   sap379x;   label values alchrc9   sap380x;
label values altime10  sap376x;   label values alunit10  sap377x;
label values aldura10  sap378x;   label values aldurb10  sap379x;
label values alchrc10  sap380x;   label values altime11  sap376x;
label values alunit11  sap377x;   label values aldura11  sap378x;
label values aldurb11  sap379x;   label values alchrc11  sap380x;
label values altime12  sap376x;   label values alunit12  sap377x;
label values aldura12  sap378x;   label values aldurb12  sap379x;
label values alchrc12  sap380x;   label values altime13  sap376x;
label values alunit13  sap377x;   label values aldura13  sap378x;
label values aldurb13  sap379x;   label values alchrc13  sap380x;
label values atime14a  sap376x;   label values aunit14a  sap377x;
label values adura14a  sap378x;   label values adurb14a  sap379x;
label values achrc14a  sap380x;   label values altime15  sap376x;
label values alunit15  sap377x;   label values aldura15  sap378x;
label values aldurb15  sap379x;   label values alchrc15  sap380x;
label values altime16  sap376x;   label values alunit16  sap377x;
label values aldura16  sap378x;   label values aldurb16  sap379x;
label values alchrc16  sap380x;   label values altime17  sap376x;
label values alunit17  sap377x;   label values aldura17  sap378x;
label values aldurb17  sap379x;   label values alchrc17  sap380x;
label values altime18  sap376x;   label values alunit18  sap377x;
label values aldura18  sap378x;   label values aldurb18  sap379x;
label values alchrc18  sap380x;   label values altime19  sap376x;
label values alunit19  sap377x;   label values aldura19  sap378x;
label values aldurb19  sap379x;   label values alchrc19  sap380x;
label values altime20  sap376x;   label values alunit20  sap377x;
label values aldura20  sap378x;   label values aldurb20  sap379x;
label values alchrc20  sap380x;   label values altime21  sap376x;
label values alunit21  sap377x;   label values aldura21  sap378x;
label values aldurb21  sap379x;   label values alchrc21  sap380x;
label values altime22  sap376x;   label values alunit22  sap377x;
label values aldura22  sap378x;   label values aldurb22  sap379x;
label values alchrc22  sap380x;   label values altime23  sap376x;
label values alunit23  sap377x;   label values aldura23  sap378x;
label values aldurb23  sap379x;   label values alchrc23  sap380x;
label values altime24  sap376x;   label values alunit24  sap377x;
label values aldura24  sap378x;   label values aldurb24  sap379x;
label values alchrc24  sap380x;   label values altime25  sap376x;
label values alunit25  sap377x;   label values aldura25  sap378x;
label values aldurb25  sap379x;   label values alchrc25  sap380x;
label values altime26  sap376x;   label values alunit26  sap377x;
label values aldura26  sap378x;   label values aldurb26  sap379x;
label values alchrc26  sap380x;   label values altime27  sap376x;
label values alunit27  sap377x;   label values aldura27  sap378x;
label values aldurb27  sap379x;   label values alchrc27  sap380x;
label values altime28  sap376x;   label values alunit28  sap377x;
label values aldura28  sap378x;   label values aldurb28  sap379x;
label values alchrc28  sap380x;   label values altime29  sap376x;
label values alunit29  sap377x;   label values aldura29  sap378x;
label values aldurb29  sap379x;   label values alchrc29  sap380x;
label values altime30  sap376x;   label values alunit30  sap377x;
label values aldura30  sap378x;   label values aldurb30  sap379x;
label values alchrc30  sap380x;   label values altime31  sap376x;
label values alunit31  sap377x;   label values aldura31  sap378x;
label values aldurb31  sap379x;   label values alchrc31  sap380x;
label values altime32  sap376x;   label values alunit32  sap377x;
label values aldura32  sap378x;   label values aldurb32  sap379x;
label values alchrc32  sap380x;   label values altime33  sap376x;
label values alunit33  sap377x;   label values aldura33  sap378x;
label values aldurb33  sap379x;   label values alchrc33  sap380x;
label values altime34  sap376x;   label values alunit34  sap377x;
label values aldura34  sap378x;   label values aldurb34  sap379x;
label values alchrc34  sap380x;   label values altime90  sap376x;
label values alunit90  sap377x;   label values aldura90  sap378x;
label values aldurb90  sap379x;   label values alchrc90  sap380x;
label values altime91  sap376x;   label values alunit91  sap377x;
label values aldura91  sap378x;   label values aldurb91  sap379x;
label values alchrc91  sap380x;   label values alcndrt   sap556x;
label values alchronr  sap557x;

label values smkev     sap027x;   label values smkreg    sap559x;
label values smknow    sap560x;   label values smkstat2  sap561x;
label values smkqtno   sap562x;   label values smkqttp   sap563x;
label values smkqty    sap564x;   label values cigsda1   sap565x;
label values cigdamo   sap566x;   label values cigsda2   sap565x;
label values cigsday   sap565x;   label values cigqtyr   sap027x;
label values othcigev  sap027x;   label values othciged  sap571x;
label values smklesev  sap027x;   label values smklesed  sap571x;
label values toblasyr  sap027x;   label values tobqtyr   sap027x;
label values ecigev    sap027x;   label values eciged    sap560x;
label values vigno     sap578x;   label values vigtp     sap579x;
label values vigfreqw  sap580x;   label values viglngno  sap581x;
label values viglngtp  sap582x;   label values vigmin    sap581x;
label values modno     sap578x;   label values modtp     sap579x;
label values modfreqw  sap586x;   label values modlngno  sap581x;
label values modlngtp  sap582x;   label values modmin    sap581x;
label values strngno   sap578x;   label values strngtp   sap579x;
label values strfreqw  sap592x;   label values alc1yr    sap027x;
label values alclife   sap027x;   label values alc12mno  sap595x;
label values alc12mtp  sap596x;   label values alc12mwk  sap597x;
label values alc12myr  sap598x;   label values alcamt    sap599x;
label values alcstat   sap600x;   label values alc5upn1  sap598x;
label values alc5upt1  sap602x;   label values alc5upy1  sap598x;
label values aheight   sap604x;   label values aweightp  sap605x;

label values ausualpl  sap607x;   label values aplkind   sap608x;
label values ahcplrou  sap027x;   label values ahcplknd  sap610x;
label values ahcchgyr  sap027x;   label values ahcchghi  sap027x;
label values anouspl1  sap613x;   label values anouspl2  sap613x;
label values anouspl3  sap613x;   label values anouspl4  sap613x;
label values anouspl5  sap613x;   label values anouspl6  sap613x;
label values anouspl7  sap613x;   label values anouspl8  sap613x;
label values anouspl9  sap613x;   label values aprvtryr  sap027x;
label values aprvtrfd  sap623x;   label values adrnanp   sap623x;
label values adrnai    sap623x;   label values ahcdlyr1  sap027x;
label values ahcdlyr2  sap027x;   label values ahcdlyr3  sap027x;
label values ahcdlyr4  sap027x;   label values ahcdlyr5  sap027x;
label values ahcafyr1  sap027x;   label values ahcafyr2  sap027x;
label values ahcafyr3  sap027x;   label values ahcafyr4  sap027x;
label values ahcafyr5  sap623x;   label values ahcafyr6  sap623x;
label values aworpay   sap637x;   label values ahicomp   sap325x;
label values arx12mo   sap027x;   label values arx12_1   sap027x;
label values arx12_2   sap623x;   label values arx12_3   sap027x;
label values arx12_4   sap027x;   label values arx12_5   sap027x;
label values arx12_6   sap027x;   label values adnlong2  sap646x;
label values ahcsyr1   sap027x;   label values ahcsyr2   sap027x;
label values ahcsyr3   sap027x;   label values ahcsyr4   sap027x;
label values ahcsyr5   sap027x;   label values ahcsyr6   sap027x;
label values ahcsyr7   sap027x;   label values ahcsyr8   sap027x;
label values ahcsyr9   sap027x;   label values ahcsyr10  sap027x;
label values ahernoy2  sap657x;   label values aervisnd  sap027x;
label values aerhos    sap027x;   label values aerrea1r  sap027x;
label values aerrea2r  sap027x;   label values aerrea3r  sap027x;
label values aerrea4r  sap027x;   label values aerrea5r  sap027x;
label values aerrea6r  sap027x;   label values aerrea7r  sap623x;
label values aerrea8r  sap623x;   label values ahchyr    sap027x;
label values ahchmoyr  sap175x;   label values ahchnoy2  sap670x;
label values ahcnoyr2  sap657x;   label values asrgyr    sap027x;
label values asrgnoyr  sap673x;   label values amdlongr  sap646x;
label values avislast  sap675x;   label values alastyp1  sap085x;
label values alastyp2  sap085x;   label values alastyp3  sap085x;
label values alastyp4  sap085x;   label values avisapn2  sap681x;
label values avisapt2  sap682x;   label values awaitrmn  sap683x;
label values awaitrmt  sap684x;   label values hit1a     sap623x;
label values hit2a     sap027x;   label values hit3a     sap027x;
label values hit4a     sap623x;   label values hit5a     sap623x;
label values shtflu2   sap027x;   label values ashflum2  sap691x;
label values ashfluy2  sap692x;   label values flushpg1  sap693x;
label values flushpg2  sap694x;   label values sprflu2   sap027x;
label values aspflum2  sap691x;   label values aspfluy2  sap692x;
label values shtpnuyr  sap027x;   label values apox      sap027x;
label values apox12mo  sap027x;   label values ahep      sap027x;
label values ahepliv   sap027x;   label values ahepbtst  sap623x;
label values shthepb   sap027x;   label values shepdos   sap705x;
label values shthepa   sap027x;   label values shepanum  sap707x;
label values ahepctst  sap623x;   label values ahepcres  sap709x;
label values shingles  sap027x;   label values shttd     sap027x;
label values shttd05   sap027x;   label values shttdap2  sap713x;
label values shthpv2   sap714x;   label values shhpvdos  sap715x;
label values ahpvage   sap581x;   label values livev     sap027x;
label values travel    sap027x;   label values wrkhlth2  sap027x;
label values wrkdir    sap027x;   label values apsbpch1  sap027x;
label values apschch1  sap027x;   label values apsbsch1  sap027x;
label values apspap    sap027x;   label values apsmam    sap027x;
label values apscol    sap623x;   label values apsdiet   sap027x;
label values apssmkc   sap623x;   label values ltcfam    sap623x;
label values ltchelp   sap730x;   label values ltcwho1   sap613x;
label values ltcwho2   sap613x;   label values ltcwho3   sap613x;
label values ltcwho4   sap613x;   label values ltcwho5   sap613x;
label values aindins   sap623x;   label values aindprch  sap623x;
label values aindwho   sap738x;   label values ainddif1  sap739x;
label values ainddif2  sap740x;   label values aindeny1  sap623x;
label values aindeny2  sap623x;   label values aindeny3  sap623x;
label values aindnot1  sap613x;   label values aindnot2  sap613x;
label values aindnot3  sap613x;   label values aindnot4  sap613x;
label values aindnot5  sap613x;   label values aexchng   sap027x;

label values asicpuse  sap750x;   label values asisathc  sap751x;
label values asitenur  sap752x;   label values asinhelp  sap753x;
label values asincnto  sap753x;   label values asintru   sap753x;
label values asinknt   sap753x;   label values asisim    sap757x;
label values asisif    sap758x;   label values asiretr   sap759x;
label values asimedc   sap759x;   label values asistlv   sap759x;
label values asicnhc   sap759x;   label values asiccoll  sap763x;
label values asinbill  sap759x;   label values asihcst   sap759x;
label values asiccmp   sap766x;   label values asisleep  sap175x;
label values asislpfl  sap768x;   label values asislpst  sap769x;
label values asislpmd  sap770x;   label values asirest   sap771x;
label values asisad    sap772x;   label values asinerv   sap772x;
label values asirstls  sap772x;   label values asihopls  sap772x;
label values asieffrt  sap772x;   label values asiwthls  sap772x;
label values asimuch   sap778x;   label values asihivt   sap027x;
label values asihivwn  sap780x;

label values awebuse   sap027x;   label values awebofno  sap581x;
label values aweboftp  sap783x;   label values aweborp   sap027x;
label values awebeml   sap027x;   label values awebmno   sap581x;
label values awebmtp   sap783x;


save "$OUT/2014/samadult", replace;
#delimit cr
log close
