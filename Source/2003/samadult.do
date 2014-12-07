log using "$LOG/samadult.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 DECEMBER 1, 2004
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2003 NHIS PUBLIC USE SAMADULT.DAT ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE SAMADULT.DTA AND SAMADULT.LOG
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2003\

 THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
 LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
 USER SHOULD ENTER THE FOLLOWING STATA COMMAND: log close
 
 THIS IS STORED IN SAMADULT.DO
*********************************************************************;
clear;
set mem 200m;

* INPUT ALL VARIABLES;
infix
      rectype       1 -   2      srvy_yr       3 -   6
 str  hhx           7 -  12 str  fmx          13 -  14
 str  px           15 -  16      intv_qrt     17 -  17
      sex          18 -  18      age_p        19 -  20
      origin_i     21 -  21      origimpt     22 -  22
      hispan_i     23 -  24      hispimpt     25 -  25
      racerpi2     26 -  27      raceimp2     28 -  28
      mracrpi2     29 -  30      mracbpi2     31 -  32
      racreci2     33 -  33      hiscodi2     34 -  34
      erimpflg     35 -  35      educ         36 -  37
      ab_bl20k     38 -  38      rat_cat      39 -  40
      r_maritl     41 -  41      fm_size      42 -  43
      region       44 -  44      wtia_sa      45 -  50
      wtfa_sa      51 -  56      stratum      57 -  59
      psu          60 -  60      proxysa      61 -  61

      hypev        62 -  62      hypdifv      63 -  63
      hybpckno     64 -  65      hybpcktp     66 -  66
      hybpcky      67 -  68      hybplev      69 -  69
      clckno       70 -  71      clcktp       72 -  72
      clcky        73 -  74      clhi         75 -  75
      chdev        76 -  76      angev        77 -  77
      miev         78 -  78      hrtev        79 -  79
      strev        80 -  80      ephev        81 -  81
      aasmev       82 -  82      aasstill     83 -  83
      aasmyr       84 -  84      aasmeryr     85 -  85
      aasmhsp      86 -  86      aasmmc       87 -  87
      awzmswk      88 -  90      awzpin       91 -  91
      aasminst     92 -  92      aasmpmed     93 -  93
      aasmcan      94 -  94      aasmed       95 -  95
      aasmdtp      96 -  96      aaswmp       97 -  97
      aasclass     98 -  98      aas_rec      99 -  99
      aas_res     100 - 100      aas_mon     101 - 101
      aapenvln    102 - 102      aapenvdo    103 - 103
      ulcev       104 - 104      ulcyr       105 - 105
      canev       106 - 106      cnkind1     107 - 107
      canage1     108 - 109      cnkind2     110 - 110
      canage2     111 - 112      cnkind3     113 - 113
      canage3     114 - 115      cnkind4     116 - 116
      canage4     117 - 118      cnkind5     119 - 119
      canage5     120 - 121      cnkind6     122 - 122
      canage6     123 - 124      cnkind7     125 - 125
      canage7     126 - 127      cnkind8     128 - 128
      canage8     129 - 130      cnkind9     131 - 131
      canage9     132 - 133      cnkind10    134 - 134
      canage10    135 - 136      cnkind11    137 - 137
      canage11    138 - 139      cnkind12    140 - 140
      canage12    141 - 142      cnkind13    143 - 143
      canage13    144 - 145      cnkind14    146 - 146
      canage14    147 - 148      cnkind15    149 - 149
      canage15    150 - 151      cnkind16    152 - 152
      canage16    153 - 154      cnkind17    155 - 155
      canage17    156 - 157      cnkind18    158 - 158
      canage18    159 - 160      cnkind19    161 - 161
      canage19    162 - 163      cnkind20    164 - 164
      canage20    165 - 166      cnkind21    167 - 167
      canage21    168 - 169      cnkind22    170 - 170
      canage22    171 - 172      cnkind23    173 - 173
      canage23    174 - 175      cnkind24    176 - 176
      canage24    177 - 178      cnkind25    179 - 179
      canage25    180 - 181      cnkind26    182 - 182
      canage26    183 - 184      cnkind27    185 - 185
      canage27    186 - 187      cnkind28    188 - 188
      canage28    189 - 190      cnkind29    191 - 191
      canage29    192 - 193      cnkind30    194 - 194
      canage30    195 - 196      cnkind31    197 - 197
      brcandig    198 - 198      dibev       199 - 199
      dibage      200 - 201      difage2     202 - 203
      insln       204 - 204      dibpill     205 - 205
      dibhp       206 - 206      dibhpyr     207 - 209
      dibndyr     210 - 212      dibglno     213 - 215
      dibgltp     216 - 216      dglfreqw    217 - 218
      diba1ckn    219 - 219      diba1cck    220 - 221
      diba1cll    222 - 222      diba1csl    223 - 223
      dibftck     224 - 225      dibckno     226 - 228
      dibcktp     229 - 229      dckfreqw    230 - 231
      dibeyckl    232 - 232      ahayfyr     233 - 233
      sinyr       234 - 234      cbrchyr     235 - 235
      kidwkyr     236 - 236      livyr       237 - 237
      jntsymp     238 - 238
      jmthp1  -jmthp17       239 - 255
      jntpn       256 - 257      jntchr      258 - 258
      jnthp       259 - 259      arth1       260 - 260
      arthwt      261 - 261      arthph      262 - 262
      arthcls     263 - 263      arthlmt     264 - 264
      arthwrk     265 - 265      paineck     266 - 266
      painlb      267 - 267      painleg     268 - 268
      painface    269 - 269      amigr       270 - 270
      acold2w     271 - 271      aintil2w    272 - 272
      pregnow     273 - 273      hearaid     274 - 274
      ahearst     275 - 275      avision     276 - 276
      ablind      277 - 277      lupprt      278 - 278
      sad         279 - 279      nervous     280 - 280
      restless    281 - 281      hopeless    282 - 282
      effort      283 - 283      worthls     284 - 284
      mhamtmo     285 - 285

      wrklyr3     286 - 286      wkdayr      287 - 289
      beddayr     290 - 292      ahstatyr    293 - 293
      speceq      294 - 294      flwalk      295 - 295
      flclimb     296 - 296      flstand     297 - 297
      flsit       298 - 298      flstoop     299 - 299
      flreach     300 - 300      flgrasp     301 - 301
      flcarry     302 - 302      flpush      303 - 303
      flshop      304 - 304      flsocl      305 - 305
      flrelax     306 - 306      fla1ar      307 - 307
      aflhca1 -aflhca34      308 - 341
      aflhca90    342 - 342      aflhca91    343 - 343
      altime1     344 - 345      alunit1     346 - 346
      aldura1     347 - 348      aldurb1     349 - 349
      alchrc1     350 - 350      altime2     351 - 352
      alunit2     353 - 353      aldura2     354 - 355
      aldurb2     356 - 356      alchrc2     357 - 357
      altime3     358 - 359      alunit3     360 - 360
      aldura3     361 - 362      aldurb3     363 - 363
      alchrc3     364 - 364      altime4     365 - 366
      alunit4     367 - 367      aldura4     368 - 369
      aldurb4     370 - 370      alchrc4     371 - 371
      altime5     372 - 373      alunit5     374 - 374
      aldura5     375 - 376      aldurb5     377 - 377
      alchrc5     378 - 378      altime6     379 - 380
      alunit6     381 - 381      aldura6     382 - 383
      aldurb6     384 - 384      alchrc6     385 - 385
      altime7     386 - 387      alunit7     388 - 388
      aldura7     389 - 390      aldurb7     391 - 391
      alchrc7     392 - 392      altime8     393 - 394
      alunit8     395 - 395      aldura8     396 - 397
      aldurb8     398 - 398      alchrc8     399 - 399
      altime9     400 - 401      alunit9     402 - 402
      aldura9     403 - 404      aldurb9     405 - 405
      alchrc9     406 - 406      altime10    407 - 408
      alunit10    409 - 409      aldura10    410 - 411
      aldurb10    412 - 412      alchrc10    413 - 413
      altime11    414 - 415      alunit11    416 - 416
      aldura11    417 - 418      aldurb11    419 - 419
      alchrc11    420 - 420      altime12    421 - 422
      alunit12    423 - 423      aldura12    424 - 425
      aldurb12    426 - 426      alchrc12    427 - 427
      altime13    428 - 429      alunit13    430 - 430
      aldura13    431 - 432      aldurb13    433 - 433
      alchrc13    434 - 434      altime14    435 - 436
      alunit14    437 - 437      aldura14    438 - 439
      aldurb14    440 - 440      alchrc14    441 - 441
      altime15    442 - 443      alunit15    444 - 444
      aldura15    445 - 446      aldurb15    447 - 447
      alchrc15    448 - 448      altime16    449 - 450
      alunit16    451 - 451      aldura16    452 - 453
      aldurb16    454 - 454      alchrc16    455 - 455
      altime17    456 - 457      alunit17    458 - 458
      aldura17    459 - 460      aldurb17    461 - 461
      alchrc17    462 - 462      altime18    463 - 464
      alunit18    465 - 465      aldura18    466 - 467
      aldurb18    468 - 468      alchrc18    469 - 469
      altime19    470 - 471      alunit19    472 - 472
      aldura19    473 - 474      aldurb19    475 - 475
      alchrc19    476 - 476      altime20    477 - 478
      alunit20    479 - 479      aldura20    480 - 481
      aldurb20    482 - 482      alchrc20    483 - 483
      altime21    484 - 485      alunit21    486 - 486
      aldura21    487 - 488      aldurb21    489 - 489
      alchrc21    490 - 490      altime22    491 - 492
      alunit22    493 - 493      aldura22    494 - 495
      aldurb22    496 - 496      alchrc22    497 - 497
      altime23    498 - 499      alunit23    500 - 500
      aldura23    501 - 502      aldurb23    503 - 503
      alchrc23    504 - 504      altime24    505 - 506
      alunit24    507 - 507      aldura24    508 - 509
      aldurb24    510 - 510      alchrc24    511 - 511
      altime25    512 - 513      alunit25    514 - 514
      aldura25    515 - 516      aldurb25    517 - 517
      alchrc25    518 - 518      altime26    519 - 520
      alunit26    521 - 521      aldura26    522 - 523
      aldurb26    524 - 524      alchrc26    525 - 525
      altime27    526 - 527      alunit27    528 - 528
      aldura27    529 - 530      aldurb27    531 - 531
      alchrc27    532 - 532      altime28    533 - 534
      alunit28    535 - 535      aldura28    536 - 537
      aldurb28    538 - 538      alchrc28    539 - 539
      altime29    540 - 541      alunit29    542 - 542
      aldura29    543 - 544      aldurb29    545 - 545
      alchrc29    546 - 546      altime30    547 - 548
      alunit30    549 - 549      aldura30    550 - 551
      aldurb30    552 - 552      alchrc30    553 - 553
      altime31    554 - 555      alunit31    556 - 556
      aldura31    557 - 558      aldurb31    559 - 559
      alchrc31    560 - 560      altime32    561 - 562
      alunit32    563 - 563      aldura32    564 - 565
      aldurb32    566 - 566      alchrc32    567 - 567
      altime33    568 - 569      alunit33    570 - 570
      aldura33    571 - 572      aldurb33    573 - 573
      alchrc33    574 - 574      altime34    575 - 576
      alunit34    577 - 577      aldura34    578 - 579
      aldurb34    580 - 580      alchrc34    581 - 581
      altime90    582 - 583      alunit90    584 - 584
      aldura90    585 - 586      aldurb90    587 - 587
      alchrc90    588 - 588      altime91    589 - 590
      alunit91    591 - 591      aldura91    592 - 593
      aldurb91    594 - 594      alchrc91    595 - 595
      alcndrt     596 - 596      alchronr    597 - 597

      smkev       598 - 598      smkreg      599 - 600
      smknow      601 - 601      smkqtno     602 - 603
      smkqttp     604 - 604      smkqty      605 - 606
      smkqtd      607 - 607      cigsda1     608 - 609
      cigdamo     610 - 611      cigsda2     612 - 613
      cigsday     614 - 615      smkstat1    616 - 616
      smkstat2    617 - 617      smkstat3    618 - 618
      cigqtyr     619 - 619      vigno       620 - 622
      vigtp       623 - 623      vigfreqw    624 - 625
      viglngno    626 - 628      viglngtp    629 - 629
      vigmin      630 - 632      viglongd    633 - 633
      modno       634 - 636      modtp       637 - 637
      modfreqw    638 - 639      modlngno    640 - 642
      modlngtp    643 - 643      modmin      644 - 646
      modlongd    647 - 647      strngno     648 - 650
      strngtp     651 - 651      strfreqw    652 - 653
      alc1yr      654 - 654      alclife     655 - 655
      alc12mno    656 - 658      alc12mtp    659 - 659
      alc12mmo    660 - 661      alc12mwk    662 - 663
      alc12myr    664 - 666      alcamt      667 - 668
      alc5upno    669 - 671      alc5uptp    672 - 672
      alc5upyr    673 - 675      alcstat1    676 - 676
      alc7stat    677 - 677      met_flg1    678 - 678
      met_flg2    679 - 679      aheight     680 - 681
      aweightp    682 - 684      desirewt    685 - 685
      bmi         686 - 689

      ausualpl    690 - 690      aplkind     691 - 691
      ahcplrou    692 - 692      ahcplknd    693 - 693
      sourcela    694 - 695      ahcchgyr    696 - 696
      ahcchghi    697 - 697      ahcdlyr1    698 - 698
      ahcdlyr2    699 - 699      ahcdlyr3    700 - 700
      ahcdlyr4    701 - 701      ahcdlyr5    702 - 702
      ahcafyr1    703 - 703      ahcafyr2    704 - 704
      ahcafyr3    705 - 705      ahcafyr4    706 - 706
      adnlong2    707 - 707      ahcsyr1     708 - 708
      ahcsyr2     709 - 709      ahcsyr3     710 - 710
      ahcsyr4     711 - 711      ahcsyr5     712 - 712
      ahcsyr6     713 - 713      ahcsyr7     714 - 714
      ahcsyr8     715 - 715      ahcsyr9     716 - 716
      ahcsyr10    717 - 717      ahernoy2    718 - 719
      ahchyr      720 - 720      ahchmoyr    721 - 722
      ahchnoy2    723 - 724      ahcnoyr2    725 - 726
      asrgyr      727 - 727      asrgnoyr    728 - 729
      amdlongr    730 - 730      shtfluyr    731 - 731
      shtpnuyr    732 - 732      apox        733 - 733
      apox12mo    734 - 734      ahep        735 - 735
      ahepliv     736 - 736      shthepb     737 - 737
      shepdos     738 - 738

      all_sa      739 - 739      everwrk     740 - 740
      indstry1    741 - 742      indstry2    743 - 744
      indstr1a    745 - 746      indstr2a    747 - 748
      occup1      749 - 750      occup2      751 - 752
      occup1a     753 - 754      occup2a     755 - 756
      wrkcat      757 - 757      wrkcata     758 - 758
      businc1     759 - 759      businc1a    760 - 760
      locall1     761 - 762      locall1a    763 - 764
      yrswrk_p    765 - 766      yrswrkpa    767 - 768
      wrklongh    769 - 769      hourpd      770 - 770
      hourpda     771 - 771      pdsick      772 - 772
      pdsicka     773 - 773      onejob      774 - 774
      smokd1      775 - 775

      bldgv       776 - 776      bldg12m     777 - 777
      hivtst      778 - 778      whytst_r    779 - 780
      tst12m_m    781 - 782      tst12m_y    783 - 786
      timetst     787 - 787      reatst_c    788 - 789
      reaswhor    790 - 790      lastst_c    791 - 792
      clntyp_c    793 - 794      whoadm      795 - 795
      givnam      796 - 796      extst12m    797 - 797
      chnsadsp    798 - 798      stmtru      799 - 799
      std         800 - 800      stddoc      801 - 801
      stdwher     802 - 802      tbhrd       803 - 803
      tbknow      804 - 804      tb          805 - 805
      tbsprd1     806 - 806      tbsprd2     807 - 807
      tbsprd3     808 - 808      tbsprd4     809 - 809
      tbsprd5     810 - 810      tbsprd6     811 - 811
      tbcured     812 - 812      tbchanc     813 - 813
      tbshame     814 - 814      homeless    815 - 815

      sun1_sha    816 - 816      sun1_hat    817 - 817
      sun2_lgs    818 - 818      sun2_scr    819 - 819
      spf         820 - 821      paphad      822 - 822
 str  rpap1_mt    823 - 824      rpap1_yr    825 - 828
      rpap1_no    829 - 830      rpap1_tp    831 - 831
      rpap2ca     832 - 832      rpap_mo2    833 - 835
      rpap3       836 - 836      papreas     837 - 837
      mamhad      838 - 838 str  rmam1_mt    839 - 840
      rmam1_yr    841 - 844      rmam1_no    845 - 846
      rmam1_tp    847 - 847      rmam2ca     848 - 848
      rmam_mo2    849 - 851      rmam3       852 - 852
      mamreas     853 - 853      psahrd      854 - 854
      psahad      855 - 855 str  rpsa1_mt    856 - 857
      rpsa1_yr    858 - 861      rpsa1_no    862 - 863
      rpsa1_tp    864 - 864      rpsa2       865 - 865
      rpsa_mo2    866 - 868      rpsa3       869 - 869
      psareas     870 - 870      crehad      871 - 871
 str  rcre1_mt    872 - 873      rcre1_yr    874 - 877
      rcre1_no    878 - 879      rcre1_tp    880 - 880
      rcre2       881 - 881      rcre_mo2    882 - 884
      rcre3       885 - 885      crenam      886 - 886
      crereas     887 - 887      hfobhad     888 - 888
 str  rhfob1_m    889 - 890      rhfob1_y    891 - 894
      rhfob1_n    895 - 896      rhfob1_t    897 - 897
      rhfob2      898 - 898      rhfo_mo2    899 - 901
      rhfob3      902 - 902      hfobreas    903 - 903

      hyppreg     904 - 904      hloswgt     905 - 905
      wgtadev     906 - 906      wgtadnow    907 - 907
      lowslt      908 - 908      lowsltev    909 - 909
      lowsltnw    910 - 910      exerc       911 - 911
      exercev     912 - 912      exercnw     913 - 913
      hbpalc      914 - 914      hbpalcev    915 - 915
      hbpalcnw    916 - 916      hypmedev    917 - 917
      hypmed      918 - 918      hymdmed     919 - 919
using "$DAT/2003/samadult.dat";
replace wtia_sa = wtia_sa / 10;
replace bmi     = bmi     / 100;

* DEFINE VARIABLE LABELS;

label variable rectype  "Record Type";
label variable srvy_yr  "Survey Year";
label variable hhx      "Household Serial Number";
label variable fmx      "Family Serial Number";
label variable px       "Person Number";
label variable intv_qrt "Interview Quarter";
label variable sex      "Sex";
label variable age_p    "Age";
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
label variable educ     "Highest level of school completed";
label variable ab_bl20k "Fam inc at/above vs. below $20,000";
label variable rat_cat  "Ratio of fam inc to poverty threshold";
label variable r_maritl "Marital status";
label variable fm_size  "Number of persons in family";
label variable region   "Region";
label variable wtia_sa  "Weight - Interim Annual";
label variable wtfa_sa  "Weight - Final Annual";
label variable stratum  "Stratum for variance estimation";
label variable psu      "PSU for variance estimation";
label variable proxysa  "Response status is ......";
 
label variable hypev    "Ever been told you had hypertension";
label variable hypdifv  "Ever told had hypertension on 2+ visits";
label variable hybpckno "Duration since last BP check: # of units";
label variable hybpcktp "Duration since last BP check: Time units";
label variable hybpcky  "Dur since last BP check (in years)";
label variable hybplev  "Told blood pressure was high/normal/low";
label variable clckno   "Dur since cholesterol checked: # units";
label variable clcktp   "Dur since cholesterol checked: Time unit";
label variable clcky    "Dur since last cholesterol check (years)";
label variable clhi     "Told blood cholesterol level was high";
label variable chdev    "Ever told you had coronary heart disease";
label variable angev    "Ever been told you had angina pectoris";
label variable miev     "Ever been told you had a heart attack";
label variable hrtev    "Ever told you had a heart cond/disease";
label variable strev    "Ever been told you had a stroke";
label variable ephev    "Ever been told you had emphysema";
label variable aasmev   "Ever been told you had asthma";
label variable aasstill "Still have asthma";
label variable aasmyr   "Had an asthma episode/attack, past 12 m";
label variable aasmeryr "Had visit to ER due to asthma, past 12 m";
label variable aasmhsp  "Had stayed overnight in hospital due to";
label variable aasmmc   "Talk with health prof about asthma care";
label variable awzmswk  "# days missed due to asthma, past 12 mo.";
label variable awzpin   "Ever used prescription inhaler";
label variable aasminst "Shown how to use inhaler";
label variable aasmpmed "Used oral inhaler, past 3 mo";
label variable aasmcan  "Used more than 3 canisters of mouth inha";
label variable aasmed   "Ever taken preventive asthma meds";
label variable aasmdtp  "Now taking asthma meds";
label variable aaswmp   "Given an asthma management plan";
label variable aasclass "Ever taken asthma mgmt. class";
label variable aas_rec  "Taught to recognize asthma episode";
label variable aas_res  "Taught how to respond to asthma episode";
label variable aas_mon  "Taught how to monitor peak flow for dail";
label variable aapenvln "Ever advised to change environment";
label variable aapenvdo "Follow advice";
label variable ulcev    "Ever been told you had an ulcer";
label variable ulcyr    "Had an ulcer in past 12 months";
label variable canev    "Ever told by a doctor you had cancer";
label variable cnkind1  "What kind of cancer...bladder";
label variable canage1  "Age first diagnosed w/bladder cancer";
label variable cnkind2  "What kind of cancer...blood";
label variable canage2  "Age first diagnosed w/cancer of blood";
label variable cnkind3  "What kind of cancer...bone";
label variable canage3  "Age first diagnosed w/bone cancer";
label variable cnkind4  "What kind of cancer...brain";
label variable canage4  "Age first diagnosed w/ brain cancer";
label variable cnkind5  "What kind of cancer...breast";
label variable canage5  "Age first diagnosed w/breast cancer";
label variable cnkind6  "What kind of cancer...cervix";
label variable canage6  "Age first diagnosed w/cervical cancer";
label variable cnkind7  "What kind of cancer...colon";
label variable canage7  "Age first diagnosed w/colon cancer";
label variable cnkind8  "What kind of cancer...esophagus";
label variable canage8  "Age first diagnosed w/esophageal cancer";
label variable cnkind9  "What kind of cancer...gallbladder";
label variable canage9  "Age first diagnosed w/gallbladder cancer";
label variable cnkind10 "What kind of cancer...kidney";
label variable canage10 "Age first diagnosed w/kidney cancer";
label variable cnkind11 "What kind of cancer...larynx-windpipe";
label variable canage11 "Age first diag w/cancer: larynx-windpipe";
label variable cnkind12 "What kind of cancer...leukemia";
label variable canage12 "Age first diagnosed w/leukemia";
label variable cnkind13 "What kind of cancer...liver";
label variable canage13 "Age first diagnosed w/liver cancer";
label variable cnkind14 "What kind of cancer...lung";
label variable canage14 "Age first diagnosed w/lung cancer";
label variable cnkind15 "What kind of cancer...lymphoma";
label variable canage15 "Age first diagnosed w/lymphoma";
label variable cnkind16 "What kind of cancer...melanoma";
label variable canage16 "Age first diagnosed w/melanoma";
label variable cnkind17 "What kind of cancer...mouth/tongue/lip";
label variable canage17 "Age first diag w/mouth/tongue/lip cancer";
label variable cnkind18 "What kind of cancer...ovarian";
label variable canage18 "Age first diagnosed w/ovarian cancer";
label variable cnkind19 "What kind of cancer...pancreatic";
label variable canage19 "Age first diagnosed w/pancreatic cancer";
label variable cnkind20 "What kind of cancer...prostate";
label variable canage20 "Age first diagnosed w/prostate cancer";
label variable cnkind21 "What kind of cancer...rectum";
label variable canage21 "Age first diagnosed w/cancer of rectum";
label variable cnkind22 "What kind of cancer..skin (non-melanoma)";
label variable canage22 "Age first diag:skin cancer, non-melanoma";
label variable cnkind23 "What kind of cancer...skin (DK kind)";
label variable canage23 "Age first diag w/skin cancer, DK kind";
label variable cnkind24 "Type of cancer..soft tissue (muscle)";
label variable canage24 "Age first diagnosed w/soft tissue cancer";
label variable cnkind25 "What kind of cancer...stomach";
label variable canage25 "Age first diagnosed w/stomach cancer";
label variable cnkind26 "What kind of cancer ... testicular";
label variable canage26 "Age first diagnosed w/testicular cancer";
label variable cnkind27 "What kind of cancer...throat-pharynx";
label variable canage27 "Age first diag w/throat-pharynx cancer";
label variable cnkind28 "What kind of cancer...thyroid";
label variable canage28 "Age first diagnosed w/thyroid cancer";
label variable cnkind29 "What kind of cancer...uterine";
label variable canage29 "Age first diagnosed w/uterine cancer";
label variable cnkind30 "What kind of cancer...other";
label variable canage30 "Age first diagnosed w/other cancer";
label variable cnkind31 "What kind of cancer...more than 3 kinds";
label variable brcandig "How breast cancer was found";
label variable dibev    "Ever been told that you have diabetes";
label variable dibage   "Age first diagnosed w/diabetes";
label variable difage2  "Years since first diagnosed w/diabetes";
label variable insln    "NOW taking insulin";
label variable dibpill  "NOW taking diabetic pills";
label variable dibhp    "Seeing ONE doctor for diabetes";
label variable dibhpyr  "# times seen medical doctor for diabetes";
label variable dibndyr  "# times seen nurse/dietician for diabete";
label variable dibglno  "How often blood glucose/sugar checked";
label variable dibgltp  "How often blood glucose/sugar checked";
label variable dglfreqw "How often blood glucose/sugar checked";
label variable diba1ckn "Heard of glycosylated hemoglobin/hemoglo";
label variable diba1cck "# times checked for glycosylated hemoglo";
label variable diba1cll "Hemoglobin 'A one C' level , past 12 mo.";
label variable diba1csl "Safe hemoglobin 'A one C' level , past 1";
label variable dibftck  "# times checked feet for irritations, pa";
label variable dibckno  "How often feet checked for sores";
label variable dibcktp  "How often feet checked for sores";
label variable dckfreqw "How often feet checked for sores";
label variable dibeyckl "Eye exam";
label variable ahayfyr  "Told that you had hay fever, past 12 m";
label variable sinyr    "Told that you had sinusitis, past 12 m";
label variable cbrchyr  "Told you had chronic bronchitis, 12 m";
label variable kidwkyr  "Told you had weak/failing kidneys, 12 m";
label variable livyr    "Told you had liver condition, past 12 m";
label variable jntsymp  "Had pain/aching at joints, past 30 d";
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
label variable jmthp15  "Which jnt affected..fingers/thumb-right";
label variable jmthp16  "Which jnt affected..fingers/thumb-left";
label variable jmthp17  "Which joint affected...other, not listed";
label variable jntpn    "Rate your joint pain, past 30 days";
label variable jntchr   "Joint symp began 3+ months ago";
label variable jnthp    "Ever seen a dr. for joint symptoms";
label variable arth1    "Ever told you had arthritis, gout, lupus";
label variable arthwt   "Ever told to lose weight to help arth";
label variable arthph   "Ever told to exercise to help arthritis";
label variable arthcls  "Ever taken a class to help arthritis";
label variable arthlmt  "Limited in activities due to arthritis";
label variable arthwrk  "Limited in work due to arthritis";
label variable paineck  "Had neck pain, past 3 months";
label variable painlb   "Had low back pain, past 3 months";
label variable painleg  "Pain spread down leg/below knees";
label variable painface "Had pain in jaw/front of ear, past 3 m";
label variable amigr    "Had severe headache/migraine, past 3 m";
label variable acold2w  "Had a head/chest cold past 2 weeks";
label variable aintil2w "Had stomach prob w/vomit/diarrhea, 2 w";
label variable pregnow  "Currently pregnant";
label variable hearaid  "Had ever worn a hearing aid";
label variable ahearst  "Description of hearing w/o hearing aid";
label variable avision  "Trouble seeing even w/glasses/lenses";
label variable ablind   "Blind or unable to see at all";
label variable lupprt   "Lost all upper & lower natural teeth";
label variable sad      "So sad nothing cheers you up, past 30 d";
label variable nervous  "How often felt nervous, past 30 days";
label variable restless "How often restless/fidgety, past 30 days";
label variable hopeless "How often felt hopeless, past 30 days";
label variable effort   "Felt everything was an effort, past 30 d";
label variable worthls  "How often felt worthless, past 30 days";
label variable mhamtmo  "Feelings interfered w/life, past 30 days";
 
label variable wrklyr3  "Work status: last week, past 12 m";
label variable wkdayr   "Number of work loss days, past 12 months";
label variable beddayr  "Number of bed days, past 12 months";
label variable ahstatyr "Hlth better/worse/same, comp w/12m ago";
label variable speceq   "Have hlth prob that requires spec equip";
label variable flwalk   "How dif walk 1/4 mile w/o spec equip";
label variable flclimb  "How dif walk up 10 steps w/o spec equip";
label variable flstand  "How dif stand for 2 hrs w/o spec equip";
label variable flsit    "How dif sit for 2 hrs w/o spec equip";
label variable flstoop  "How dif stoop/bend/kneel w/o spec equip";
label variable flreach  "How dif reach over head w/o spec equip";
label variable flgrasp  "How dif grasp objects w/o spec equip";
label variable flcarry  "How dif lift/carry 10 lbs w/o spec equip";
label variable flpush   "How dif push large object w/o spec equip";
label variable flshop   "How dif go out to events w/o spec equip";
label variable flsocl   "How dif social activities w/o spec equip";
label variable flrelax  "How dif do acts to relax w/o spec equip";
label variable fla1ar   "Any functional limitation, all conds";
label variable aflhca1  "Vision problem";
label variable aflhca2  "Hearing problem";
label variable aflhca3  "Arthritis/rheumatism";
label variable aflhca4  "Back/neck problem";
label variable aflhca5  "Fracture/bone/joint injury";
label variable aflhca6  "Other injury";
label variable aflhca7  "Heart problem";
label variable aflhca8  "Stroke problem";
label variable aflhca9  "Hypertension/high blood pressure";
label variable aflhca10 "Diabetes";
label variable aflhca11 "Lung/breathing prob/asthma/emphysema";
label variable aflhca12 "Cancer";
label variable aflhca13 "Birth defect";
label variable aflhca14 "Mental retardation";
label variable aflhca15 "Otr developmental prob/cerebral palsy";
label variable aflhca16 "Senility/dementia/alzheimers";
label variable aflhca17 "Depression/anxiety/emotional problem";
label variable aflhca18 "Weight problem/overweight/obesity";
label variable aflhca19 "Missing or amputated limb/finger/digit";
label variable aflhca20 "Musculoskeletal/connective tissue prob";
label variable aflhca21 "Circulation problem";
label variable aflhca22 "Endocrine/nutritional/metabolic prob";
label variable aflhca23 "Nervous system/sensory organ condition";
label variable aflhca24 "Digestive system problem";
label variable aflhca25 "Genitourinary system problem";
label variable aflhca26 "Skin/subcutaneous system problem";
label variable aflhca27 "Blood or blood-forming organ problem";
label variable aflhca28 "Benign tumor/cyst";
label variable aflhca29 "Alcohol/drug/substance abuse problem";
label variable aflhca30 "Otr mental prob/ADD/bipolar/schizophreni";
label variable aflhca31 "Surgical after-effects/medical treatment";
label variable aflhca32 "'Old age'/elderly/aging-related problem";
label variable aflhca33 "Fatigue/tiredness/weakness";
label variable aflhca34 "Pregnancy-related problem";
label variable aflhca90 "Other prob 1, not elsewhere classified";
label variable aflhca91 "Other prob 2, not elsewhere classified";
label variable altime1  "Duration of vision prob: # of units";
label variable alunit1  "Duration of vision prob: Time unit";
label variable aldura1  "Duration of vision prob (in years)";
label variable aldurb1  "Duration of vision prob recode 2";
label variable alchrc1  "Vision problem condition status";
label variable altime2  "Duration of hearing prob: # of units";
label variable alunit2  "Duration of hearing prob: Time unit";
label variable aldura2  "Duration of hearing prob (in years)";
label variable aldurb2  "Duration of hearing prob recode 2";
label variable alchrc2  "Hearing problem condition status";
label variable altime3  "Duration of arthritis/rheum: # of units";
label variable alunit3  "Duration of arthritis/rheum: Time unit";
label variable aldura3  "Duration of arthritis/rheum (in years)";
label variable aldurb3  "Duration of arthritis/rheum recode 2";
label variable alchrc3  "Arthritis/rheum condition status";
label variable altime4  "Duration of back/neck prob: # of units";
label variable alunit4  "Duration of back/neck prob: Time unit";
label variable aldura4  "Duration of back/neck prob (in years)";
label variable aldurb4  "Duration of back/neck prob recode 2";
label variable alchrc4  "Back/neck problem condition status";
label variable altime5  "Dur of fract/bone/joint inj: # of units";
label variable alunit5  "Dur of fract/bone/joint inj: Time unit";
label variable aldura5  "Dur of fract/bone/joint inj (in years)";
label variable aldurb5  "Dur of fract/bone/joint inj recode 2";
label variable alchrc5  "Fract/bone/joint inj condition status";
label variable altime6  "Duration of other injury: # of units";
label variable alunit6  "Duration of other injury: Time unit";
label variable aldura6  "Duration of other injury (in years)";
label variable aldurb6  "Duration of other injury recode 2";
label variable alchrc6  "Other injury condition status";
label variable altime7  "Duration of heart prob: # of units";
label variable alunit7  "Duration of heart prob: Time unit";
label variable aldura7  "Duration of heart prob (in years)";
label variable aldurb7  "Duration of heart prob recode 2";
label variable alchrc7  "Heart problem condition status";
label variable altime8  "Duration of stroke: # of units";
label variable alunit8  "Duration of stroke: Time unit";
label variable aldura8  "Duration of stroke (in years)";
label variable aldurb8  "Duration of stroke recode 2";
label variable alchrc8  "Stroke condition status";
label variable altime9  "Duration of hypertension: # of units";
label variable alunit9  "Duration of hypertension: Time unit";
label variable aldura9  "Duration of hypertension (in years)";
label variable aldurb9  "Duration of hypertension recode 2";
label variable alchrc9  "Hypertension condition status";
label variable altime10 "Duration of diabetes: # of units";
label variable alunit10 "Duration of diabetes: Time unit";
label variable aldura10 "Duration of diabetes (in years)";
label variable aldurb10 "Duration of diabetes recode 2";
label variable alchrc10 "Diabetes condition status";
label variable altime11 "Duration of lung/breath prob: # of units";
label variable alunit11 "Duration of lung/breath prob: Time unit";
label variable aldura11 "Duration of lung/breath prob (in years)";
label variable aldurb11 "Duration of lung/breath prob recode 2";
label variable alchrc11 "Lung/breath prob condition status";
label variable altime12 "Duration of cancer: # of units";
label variable alunit12 "Duration of cancer: Time unit";
label variable aldura12 "Duration of cancer (in years)";
label variable aldurb12 "Duration of cancer recode 2";
label variable alchrc12 "Cancer condition status";
label variable altime13 "Duration of birth defect: # of units";
label variable alunit13 "Duration of birth defect: Time unit";
label variable aldura13 "Duration of birth defect (in years)";
label variable aldurb13 "Duration of birth defect recode 2";
label variable alchrc13 "Birth defect condition status";
label variable altime14 "Dur of mental retardation: # of units";
label variable alunit14 "Dur of mental retardation: Time unit";
label variable aldura14 "Dur of mental retardation (in years)";
label variable aldurb14 "Duration of mental retardation recode 2";
label variable alchrc14 "Mental retardation condition status";
label variable altime15 "Duration of otr dev prob: # of units";
label variable alunit15 "Duration of otr dev prob: Time unit";
label variable aldura15 "Duration of otr dev prob (in years)";
label variable aldurb15 "Duration of otr dev prob recode 2";
label variable alchrc15 "Otr dev problem condition status";
label variable altime16 "Duration of senility: # of units";
label variable alunit16 "Duration of senility: Time unit";
label variable aldura16 "Duration of senility (in years)";
label variable aldurb16 "Duration of senility recode 2";
label variable alchrc16 "Senility condition status";
label variable altime17 "Dur of dep/anx/emot prob: # of units";
label variable alunit17 "Duration of dep/anx/emot prob: Time unit";
label variable aldura17 "Duration of dep/anx/emot prob (in years)";
label variable aldurb17 "Duration of dep/anx/emot prob recode 2";
label variable alchrc17 "Dep/anx/emot problem condition status";
label variable altime18 "Duration of weight prob: # of units";
label variable alunit18 "Duration of weight prob: Time unit";
label variable aldura18 "Duration of weight prob (in years)";
label variable aldurb18 "Duration of weight prob recode 2";
label variable alchrc18 "Weight problem condition status";
label variable altime19 "Dur of miss limb/amputation: # of units";
label variable alunit19 "Dur of miss limb/amputation: Time unit";
label variable aldura19 "Dur of miss limb/amputation (in years)";
label variable aldurb19 "Dur of miss limb/amputation recode 2";
label variable alchrc19 "Missing limb/amputation condition status";
label variable altime20 "Dur of musculoskeletal prob: # of units";
label variable alunit20 "Dur of musculoskeletal prob: Time unit";
label variable aldura20 "Dur of musculoskeletal prob: (in years)";
label variable aldurb20 "Dur of musculoskeletal prob recode 2";
label variable alchrc20 "Musculoskeletal problem condition status";
label variable altime21 "Duration of circulatory prob: # of units";
label variable alunit21 "Duration of circulatory prob: Time unit";
label variable aldura21 "Duration of circulatory prob (in years)";
label variable aldurb21 "Duration of circulatory prob recode 2";
label variable alchrc21 "Circulatory problem condition status";
label variable altime22 "Duration of endocrine prob: # of units";
label variable alunit22 "Duration of endocrine problem: Time unit";
label variable aldura22 "Duration of endocrine problem (in years)";
label variable aldurb22 "Duration of endocrine problem recode 2";
label variable alchrc22 "Endocrine problem condition status";
label variable altime23 "Duration of nervous sys cond: # of units";
label variable alunit23 "Duration of nervous sys cond: Time unit";
label variable aldura23 "Duration of nervous sys cond (in years)";
label variable aldurb23 "Duration of nervous sys cond recode 2";
label variable alchrc23 "Nervous sys condition status";
label variable altime24 "Duration of digestive prob: # of units";
label variable alunit24 "Duration of digestive prob: Time unit";
label variable aldura24 "Duration of digestive prob (in years)";
label variable aldurb24 "Duration of digestive problem recode 2";
label variable alchrc24 "Digestive problem condition status";
label variable altime25 "Dur of genitourinary prob: # of units";
label variable alunit25 "Dur of genitourinary prob: Time unit";
label variable aldura25 "Dur of genitourinary prob (in years)";
label variable aldurb25 "Duration of genitourinary prob recode 2";
label variable alchrc25 "Genitourinary prob condition status";
label variable altime26 "Duration of skin problem: # of units";
label variable alunit26 "Duration of skin problem: Time unit";
label variable aldura26 "Duration of skin problem (in years)";
label variable aldurb26 "Duration of skin problem recode 2";
label variable alchrc26 "Skin problem condition status";
label variable altime27 "Duration of blood problem: # of units";
label variable alunit27 "Duration of blood problem: Time unit";
label variable aldura27 "Duration of blood problem (in years)";
label variable aldurb27 "Duration of blood problem recode 2";
label variable alchrc27 "Blood problem condition status";
label variable altime28 "Duration of benign tumor: # of units";
label variable alunit28 "Duration of benign tumor: Time unit";
label variable aldura28 "Duration of benign tumor (in years)";
label variable aldurb28 "Duration of benign tumor recode 2";
label variable alchrc28 "Benign tumor condition status";
label variable altime29 "Dur of alcohol/drug prob: # of units";
label variable alunit29 "Duration of alcohol/drug prob: Time unit";
label variable aldura29 "Duration of alcohol/drug prob (in years)";
label variable aldurb29 "Duration of alcohol/drug prob recode 2";
label variable alchrc29 "Alcohol or drug prob condition status";
label variable altime30 "Duration of oth mental prob: # of units";
label variable alunit30 "Duration of oth mental prob: Time unit";
label variable aldura30 "Duration of oth mental prob (in years)";
label variable aldurb30 "Duration of oth mental prob recode 2";
label variable alchrc30 "Oth mental prob condition status";
label variable altime31 "Dur of surg after-effects: # of units";
label variable alunit31 "Dur of surg after-effects: Time unit";
label variable aldura31 "Dur of surg after-effects (in years)";
label variable aldurb31 "Duration of surg after-effects recode 2";
label variable alchrc31 "Surgical after-effects condition status";
label variable altime32 "Duration of 'old age': # of units";
label variable alunit32 "Duration of 'old age': Time unit";
label variable aldura32 "Duration of 'old age' (in years)";
label variable aldurb32 "Duration of 'old age' recode 2";
label variable alchrc32 "'Old age' condition status";
label variable altime33 "Duration of fatigue prob: # of units";
label variable alunit33 "Duration of fatigue prob: Time unit";
label variable aldura33 "Duration of fatigue prob (in years)";
label variable aldurb33 "Duration of fatigue prob recode 2";
label variable alchrc33 "Fatigue problem condition status";
label variable altime34 "Dur of preg-related prob: # of units";
label variable alunit34 "Duration of preg-related prob: Time unit";
label variable aldura34 "Duration of preg-related prob (in years)";
label variable aldurb34 "Duration of preg-related prob recode 2";
label variable alchrc34 "Pregnancy-related prob condition status";
label variable altime90 "Dur of oth N.E.C. prob (1): # of units";
label variable alunit90 "Dur of oth N.E.C. prob (1): Time unit";
label variable aldura90 "Dur of oth N.E.C. prob (1) (in years)";
label variable aldurb90 "Dur of oth N.E.C. prob (1) recode 2";
label variable alchrc90 "Other N.E.C. prob (1) condition status";
label variable altime91 "Dur of oth N.E.C. prob (2): # of units";
label variable alunit91 "Dur of oth N.E.C. prob (2): Time unit";
label variable aldura91 "Dur of oth N.E.C. prob (2) (in years)";
label variable aldurb91 "Dur of oth N.E.C. prob (2) recode 2";
label variable alchrc91 "Other N.E.C. prob (2) condition status";
label variable alcndrt  "Chronic cond rec for ind w/functl lim";
label variable alchronr "Overall functl lim recode by cond status";
 
label variable smkev    "Ever smoked 100 cigarettes";
label variable smkreg   "Age first smoked fairly regularly";
label variable smknow   "Smoke freq:every day/some day/not at all";
label variable smkqtno  "Time since quit smoking: # of units";
label variable smkqttp  "Time since quit smoking: Time unit";
label variable smkqty   "Time since quit smoking (in years)";
label variable smkqtd   "Quit smoking since {month, 1 year ago}";
label variable cigsda1  "Number cigs per day (daily smokers)";
label variable cigdamo  "Number days smoked in past 30 days";
label variable cigsda2  "Number cigs in a day (some day smokers)";
label variable cigsday  "Number cigs a day (all smokers)";
label variable smkstat1 "Smoking Status: Recode 1";
label variable smkstat2 "Smoking Status: Recode 2";
label variable smkstat3 "Smoking Status: Recode 3";
label variable cigqtyr  "Tried quit smoking 1+ days, past 12 m";
label variable vigno    "Freq vigorous activity: # of units";
label variable vigtp    "Freq vigorous activity: Time units";
label variable vigfreqw "Freq vigorous activity (times per wk)";
label variable viglngno "Duration vig activity: # of units";
label variable viglngtp "Duration vigorous activity: Time unit";
label variable vigmin   "Duration vigorous activity (in minutes)";
label variable viglongd "Dur of vigorous activity: <20 or 20+ min";
label variable modno    "Freq light/mod activity: # of units";
label variable modtp    "Freq light/mod activity: Time units";
label variable modfreqw "Freq light/mod activity (times per wk)";
label variable modlngno "Duration light/mod activity: # of units";
label variable modlngtp "Duration light/mod activity: Time unit";
label variable modmin   "Duration light/mod activity (in minutes)";
label variable modlongd "Dur light/mod activity: <20 or 20+ min";
label variable strngno  "Freq strengthening activity: # of units";
label variable strngtp  "Freq strengthening activity: Time unit";
label variable strfreqw "Freq strength activity (times per wk)";
label variable alc1yr   "Ever had 12+ drinks in any one year";
label variable alclife  "Had 12+ drinks in ENTIRE LIFE";
label variable alc12mno "Freq drank alcohol past year: # of units";
label variable alc12mtp "Freq drank alcohol past year: Time unit";
label variable alc12mmo "Freq drank alcohol: Days per month";
label variable alc12mwk "Freq drank alcohol: Days per week";
label variable alc12myr "Freq drank alcohol: Days in past year";
label variable alcamt   "Average # drinks on days drank";
label variable alc5upno "Days had 5+ drinks, past year: # of days";
label variable alc5uptp "Days had 5+ drinks past year: Time unit";
label variable alc5upyr "Number of days had 5+ drinks past year";
label variable alcstat1 "Alcohol Drinking Status: Recode";
label variable alc7stat "Current alcohol drinking status: Recode";
label variable met_flg1 "Flag: Metric units reported for height";
label variable met_flg2 "Flag: Metric units reported for weight";
label variable aheight  "Total height in inches";
label variable aweightp "Weight w/o shoes (pounds)";
label variable desirewt "Desirable Body Weight";
label variable bmi      "Body Mass Index (BMI)";
 
label variable ausualpl "Place USUALLY go when sick";
label variable aplkind  "Place to go when sick (most often)";
label variable ahcplrou "USUALLY go there for routine/prev care";
label variable ahcplknd "Place usually go for routine prev care";
label variable sourcela "Source of medical care recode";
label variable ahcchgyr "Change health care place, past 12 mo";
label variable ahcchghi "Change due to hlth insurance";
label variable ahcdlyr1 "Couldn't get through on phone, past 12 m";
label variable ahcdlyr2 "Couldn't get appt soon enough, past 12 m";
label variable ahcdlyr3 "Wait too long in dr's office, past 12 mo";
label variable ahcdlyr4 "Not open when you could go, past 12 mo";
label variable ahcdlyr5 "No transportation, past 12 mo";
label variable ahcafyr1 "Can't afford presc medicine, past 12 mo";
label variable ahcafyr2 "Can't afford mental care/counsel, 12 mo";
label variable ahcafyr3 "Can't afford dental care, past 12 mo";
label variable ahcafyr4 "Can't afford eyeglasses, past 12 mo";
label variable adnlong2 "Time since last saw a dentist";
label variable ahcsyr1  "Seen/talk to mental hlth prof, past 12 m";
label variable ahcsyr2  "Seen/talk to eye doctor, past 12 mo";
label variable ahcsyr3  "Seen/talk to foot doctor, past 12 mo";
label variable ahcsyr4  "Seen/talk to a chiropractor, past 12 mo";
label variable ahcsyr5  "Seen/talk to therapist (PT/OT) past 12 m";
label variable ahcsyr6  "Seen/talk to a NP/PA/midwife, past 12 mo";
label variable ahcsyr7  "Seen/talk to OB/GYN, past 12 mo";
label variable ahcsyr8  "Seen/talk to a med specialist, past 12 m";
label variable ahcsyr9  "Seen/talk to a general doctor, past 12 m";
label variable ahcsyr10 "Does that Dr treat both kids and adults";
label variable ahernoy2 "# times in ER/ED, past 12 mo";
label variable ahchyr   "Get home care from hlth prof, past 12 mo";
label variable ahchmoyr "How many months of home care, past 12 mo";
label variable ahchnoy2 "Total number of home visits";
label variable ahcnoyr2 "Total number of office visits, past 12 m";
label variable asrgyr   "Had surgery in the past 12 mo";
label variable asrgnoyr "Total # of surgeries in the past 12 mo";
label variable amdlongr "Time since last saw/talked to hlth prof";
label variable shtfluyr "Had flu shot past 12 mo";
label variable shtpnuyr "Ever had pneumonia shot";
label variable apox     "Ever had chickenpox";
label variable apox12mo "Had chickenpox, past 12 mo";
label variable ahep     "Ever had hepatitis";
label variable ahepliv  "Ever lived w/ someone w/ hepatitis";
label variable shthepb  "Ever received hepatitis B vaccine";
label variable shepdos  "# doses of hepatitis B vaccine received";
 
label variable all_sa   "Employment status";
label variable everwrk  "Ever worked";
label variable indstry1 "Detailed industry classification";
label variable indstry2 "Simple industry classification";
label variable indstr1a "Detailed industry classification";
label variable indstr2a "Simple industry classification";
label variable occup1   "Detailed occupation classification";
label variable occup2   "Simple occupation classification";
label variable occup1a  "Detailed occupation classification";
label variable occup2a  "Simple occupation classification";
label variable wrkcat   "Class of worker";
label variable wrkcata  "Class of worker";
label variable businc1  "Current job an incorporated business";
label variable businc1a "Current/last/longest-held job inc bus";
label variable locall1  "Number of employees at work";
label variable locall1a "Number of employees at work";
label variable yrswrk_p "Years on the job";
label variable yrswrkpa "Years on the job";
label variable wrklongh "Duration of current/most recent job";
label variable hourpd   "Paid by the hour at current job";
label variable hourpda  "Paid by hr at current/most recent job";
label variable pdsick   "Paid sick leave at current job";
label variable pdsicka  "Paid sick leave current/most recent job";
label variable onejob   "Have more than one job";
label variable smokd1   "Smoke alarm";
 
label variable bldgv    "Donated blood since March 1985";
label variable bldg12m  "Donated blood past 12 m";
label variable hivtst   "Ever been tested for HIV?";
label variable whytst_r "Reason why you have not been tested?";
label variable tst12m_m "Month of last test for HIV";
label variable tst12m_y "Year of last test for HIV";
label variable timetst  "Was it:";
label variable reatst_c "Main reason for last HIV test";
label variable reaswhor "Who suggested you should be tested";
label variable lastst_c "Location of last HIV test";
label variable clntyp_c "Type of clinic for last HIV test";
label variable whoadm   "Who administered the test?";
label variable givnam   "Gave your first and last names?";
label variable extst12m "HIV test in the next 12 m";
label variable chnsadsp "Chances of getting AIDS virus";
label variable stmtru   "Are any of these statements true";
label variable std      "Had an STD otr than HIV/AIDS, past 5 yrs";
label variable stddoc   "Saw a doctor or health professional";
label variable stdwher  "Place where checked";
label variable tbhrd    "Ever heard of tuberculosis";
label variable tbknow   "Ever personally known anyone who had TB";
label variable tb       "How much do you know about TB?";
label variable tbsprd1  "Breathing air around person sick with TB";
label variable tbsprd2  "Sharing eating/drinking utensils";
label variable tbsprd3  "Thru semen/vaginal secretions (sex)";
label variable tbsprd4  "From smoking";
label variable tbsprd5  "From mosquito or other insect bites";
label variable tbsprd6  "Other";
label variable tbcured  "Can TB be cured?";
label variable tbchanc  "Chances of getting TB";
label variable tbshame  "Ashamed if you/family diagnosed with TB";
label variable homeless "Spent 24+ hrs living in st., shltr, jail";
 
label variable sun1_sha "Stay in shade on sunny day";
label variable sun1_hat "Wear wide-brimmed hat on sunny day";
label variable sun2_lgs "Wear long sleeved shirt on sunny day";
label variable sun2_scr "Use sunscreen on sunny day";
label variable spf      "SPF number of sunscreen used most often";
label variable paphad   "Ever had Pap smear test";
label variable rpap1_mt "Month of most recent Pap smear";
label variable rpap1_yr "Year of most recent Pap smear";
label variable rpap1_no "Time ago date of pap smear: # of units";
label variable rpap1_tp "Time ago date of pap smear: Time unit";
label variable rpap2ca  "Most recent Pap smear time categories";
label variable rpap_mo2 "Months since last pap smear exam";
label variable rpap3    "Most recent pap smear exam, time categor";
label variable papreas  "Reason for most recent Pap smear";
label variable mamhad   "Ever had mammogram";
label variable rmam1_mt "Month of most recent mammogram";
label variable rmam1_yr "Year of most recent mammogram";
label variable rmam1_no "Time ago date of mammogram: # of units";
label variable rmam1_tp "Time ago date of mammogram: time unit";
label variable rmam2ca  "Most recent mammogram, time categories";
label variable rmam_mo2 "Months since last mammogram";
label variable rmam3    "Most recent mammogram, time categories";
label variable mamreas  "Reason for most recent mammogram";
label variable psahrd   "Ever heard of PSA test";
label variable psahad   "Ever had PSA test";
label variable rpsa1_mt "Month of most recent PSA test";
label variable rpsa1_yr "Year of most recent PSA test";
label variable rpsa1_no "Time ago date of PSA test: # of units";
label variable rpsa1_tp "Time ago date of PSA test: time unit";
label variable rpsa2    "Most recent PSA test, time categories";
label variable rpsa_mo2 "Months since last PSA test";
label variable rpsa3    "Most recent PSA test, time categories";
label variable psareas  "Reason for most recent PSA test";
label variable crehad   "Ever had colorectal screening exam";
label variable rcre1_mt "Month of most recent colorectal exam";
label variable rcre1_yr "Year of most recent colorectal exam";
label variable rcre1_no "Time ago date of exam: # of units";
label variable rcre1_tp "Time ago date of exam: time unit";
label variable rcre2    "Most recent colorectal exam, time catego";
label variable rcre_mo2 "Months since last colorectal exam";
label variable rcre3    "Most recent colorectal exam, time catego";
label variable crenam   "Type of recent colorectal exam";
label variable crereas  "Reason for most recent colorectal exam";
label variable hfobhad  "Had blood stool test using home test kit";
label variable rhfob1_m "Month of most recent home blood stool te";
label variable rhfob1_y "Year of most recent home blood stool tes";
label variable rhfob1_n "Time ago date of exam: # of units";
label variable rhfob1_t "Time ago date of exam: time unit";
label variable rhfob2   "Home blood stool test, time categories";
label variable rhfo_mo2 "Months since last home fecal occult bloo";
label variable rhfob3   "Most recent home fecal occult blood test";
label variable hfobreas "Reas for recent home blood stool test";
 
label variable hyppreg  "Was your HBP only during pregnancy";
label variable hloswgt  "Ever advised to change diet to lower HBP";
label variable wgtadev  "Ever follow advice to change diet (HBP)";
label variable wgtadnow "Now following advice to change diet";
label variable lowslt   "Ever told to reduce salt due to your HBP";
label variable lowsltev "Ever follow advice to reduce salt (HBP)";
label variable lowsltnw "Now following advice to reduce salt";
label variable exerc    "Ever told to exercise due to HBP";
label variable exercev  "Ever follow advice to exercise (HBP)";
label variable exercnw  "Now following advice to exercise (HBP)";
label variable hbpalc   "Ever told to reduce alcohol due to HBP";
label variable hbpalcev "Ever follow advice to reduce alcohol use";
label variable hbpalcnw "Now following advice to reduce alcohol";
label variable hypmedev "Ever prescribed medicine for HBP";
label variable hypmed   "NOW taking medicine prescribed for HBP";
label variable hymdmed  "Advised to stop taking medicine for HBP";

* DEFINE VALUE LABELS FOR REPORTS;

label define sap001x
   30               "30 Sample Adult"
;
label define sap002x
   2003             "2003"
;
label define sap006x
   1                "1 Quarter 1"
   2                "2 Quarter 2"
   3                "3 Quarter 3"
   4                "4 Quarter 4"
;
label define sap007x
   1                "1 Male"
   2                "2 Female"
;
label define sap008x
   85               "85 85+ years"
;
label define sap009x
   1                "1 Yes"
   2                "2 No"
;
label define sap010x
   1                "1 Imputed: was 'refused' Hispanic Origin"
   2                "2 Imputed: was 'not ascertained' Hispanic Origin"
   3                "3 Imputed: was 'does not know' Hispanic Origin"
   4                "4 Hispanic origin given by respondent/proxy"
;
label define sap011x
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
label define sap012x
   1                "1 Imputed: was 'refused' Hispanic Origin"
   2                "2 Imputed: was 'not ascertained' Hispanic Origin"
   3                "3 Imputed: was 'does not know' Hispanic Origin"
   4                "4 Hispanic Origin type given by respondent/proxy"
;
label define sap013x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN only"
   04               "04 Asian only"
   05               "05 Race group not releasable*"
   06               "06 Multiple race"
;
label define sap014x
   1                "1 Imputed: was 'refused'"
   2                "2 Imputed: was 'not ascertained'"
   3                "3 Imputed: was 'does not know'"
   4                "4 Imputed: was 'other race'"
   5                "5 Imputed: was 'unspecified multiple race'"
   6                "6 Race given by respondent/proxy"
;
label define sap015x
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
label define sap016x
   01               "01 White"
   02               "02 Black/African American"
   03               "03 Indian (American) (includes Eskimo, Aleut)"
   06               "06 Chinese"
   07               "07 Filipino"
   12               "12 Asian Indian"
   16               "16 Other race*"
   17               "17 Multiple race, no primary race selected"
;
label define sap017x
   1                "1 White"
   2                "2 Black"
   3                "3 All other race groups*"
;
label define sap018x
   1                "1 Hispanic"
   2                "2 Non-Hispanic White"
   3                "3 Non-Hispanic Black"
   4                "4 Non-Hispanic All other race groups"
;
label define sap019x
   1                "1 Ethnicity/race imputed"
   2                "2 Ethnicity/race given by respondent/proxy"
;
label define sap020x
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
label define sap021x
   1                "1 $20,000 or more"
   2                "2 Less than $20,000"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap022x
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
label define sap023x
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
label define sap025x
   1                "1 Northeast"
   2                "2 Midwest"
   3                "3 South"
   4                "4 West"
;
label define sap030x
   1                "1 Proxy"
   2                "2 Not proxy"
   3                "3 Unknown"
;
label define sap031x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap032x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap033x
   00               "00 Never"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap034x
   0                "0 Never"
   1                "1 Day(s)"
   2                "2 Week(s)"
   3                "3 Month(s)"
   4                "4 Year(s)"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap035x
   00               "00 Less than 1 year"
   85               "85 85+ years"
   96               "96 Never"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap036x
   1                "1 Not told"
   2                "2 High"
   3                "3 Normal"
   4                "4 Low"
   5                "5 Borderline"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap052x
   1                "1 Yes"
   2                "2 No"
   3                "3 Still in hospital"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap053x
   000              "000 None"
   996              "996 Unable to do this activity"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap065x
   1                "1 Yes"
   2                "2 No"
   3                "3 Was told no changes needed"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap066x
   0                "0 None"
   1                "1 A little"
   2                "2 Some"
   3                "3 Most"
   4                "4 All"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap070x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap071x
   85               "85 85+ years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't Know"
;
label define sap131x
   1                "1 Found by myself by accident"
   2                "2 Found by myself during a self breast examinatio"
   3                "3 Found by my spouse or partner"
   4                "4 Found by a physician during a routine breast ex"
   5                "5 Found by a mammogram"
   6                "6 Other - specify"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap132x
   1                "1 Yes"
   2                "2 No"
   3                "3 Borderline"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap134x
   00               "00 Within past year"
   85               "85 85+ years"
   96               "96 1+ year(s) with diabetes and age is 85+"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't Know"
;
label define sap138x
   000              "000 None"
   365              "365 365 or more times"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap140x
   000              "000 Never"
   996              "996 Unable to do this activity"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap141x
   0                "0 Never"
   1                "1 Day"
   2                "2 Week"
   3                "3 Month"
   4                "4 Year"
   6                "6 Unable to do this activity"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap142x
   00               "00 Less than one time per day"
   95               "95 Never"
   96               "96 Unable to do this activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap144x
   00               "00 Zero"
   53               "53 53 or more times"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap145x
   1                "1 Less than 7"
   2                "2 7 or more, but not more than 8"
   3                "3 More than 8, but not more than 9"
   4                "4 More than 9, but not more than 10"
   5                "5 More than 10"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap146x
   1                "1 Less than 7"
   2                "2 8 or less"
   3                "3 9 or less"
   4                "4 10 or less"
   5                "5 More than 10"
   6                "6 No goal specified"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap148x
   000              "000 Never"
   996              "996 Unable to do this type activity"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap149x
   0                "0 Never"
   1                "1 Day"
   2                "2 Week"
   3                "3 Month"
   4                "4 Year"
   6                "6 Unable to do this type activity"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap150x
   00               "00 Less than once per week"
   95               "95 Never"
   96               "96 Unable to do this type activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap151x
   1                "1 Less than 1 month"
   2                "2 1 to 12 months"
   3                "3 13 to 24 months"
   4                "4 More than 2 years"
   5                "5 Never"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap175x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap193x
   1                "1 Good"
   2                "2 Little trouble"
   3                "3 Lot of trouble"
   4                "4 Deaf"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap197x
   1                "1 ALL of the time"
   2                "2 MOST of the time"
   3                "3 SOME of the time"
   4                "4 A LITTLE of the time"
   5                "5 NONE of the time"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap203x
   1                "1 A lot"
   2                "2 Some"
   3                "3 A little"
   4                "4 Not at all"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap204x
   0                "0 Had job last week"
   1                "1 No job last week, had job past 12 m"
   2                "2 No job last week, no job past 12 m"
   3                "3 Never worked"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap205x
   000              "000 None"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap206x
   000              "000 None"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap207x
   1                "1 Better"
   2                "2 Worse"
   3                "3 About the same"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap209x
   0                "0 Not at all difficult"
   1                "1 Only a little difficult"
   2                "2 Somewhat difficult"
   3                "3 Very difficult"
   4                "4 Can't do at all"
   6                "6 Do not do this activity"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap221x
   1                "1 Limited in any way"
   2                "2 Not limited in any way"
   3                "3 Unknown if limited"
;
label define sap222x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   6                "6 No condition at all"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap258x
   95               "95 95+"
   96               "96 Since birth"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap259x
   1                "1 Day(s)"
   2                "2 Week(s)"
   3                "3 Month(s)"
   4                "4 Year(s)"
   6                "6 Since birth"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap260x
   00               "00 Less than 1 year"
   85               "85 85+ years"
   96               "96 Unknown number of years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap261x
   1                "1 Less than 3 months"
   2                "2 3 - 5 months"
   3                "3 6 - 12 months"
   4                "4 More than 1 year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap262x
   1                "1 Chronic"
   2                "2 Not chronic"
   9                "9 Unknown if chronic"
;
label define sap438x
   1                "1 At least one chronic cond causes functl lim"
   2                "2 No chronic cond causes functl lim"
   9                "9 Unk if any chronic cond causes functl lim"
;
label define sap439x
   0                "0 Not limited in any way (incl unk if limited)"
   1                "1 Limited; caused by at least one chronic cond"
   2                "2 Limited; not caused by chronic cond"
   3                "3 Limited; unk if cond is chronic"
;
label define sap441x
   85               "85 85 years or older"
   96               "96 Never smoked regularly"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap442x
   1                "1 Every day"
   2                "2 Some days"
   3                "3 Not at all"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap443x
   95               "95 95+"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap444x
   1                "1 Days"
   2                "2 Weeks"
   3                "3 Months"
   4                "4 Years"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap445x
   00               "00 Less than 1 year"
   70               "70 70+ years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap447x
   95               "95 95+ cigarettes"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't Know"
;
label define sap448x
   00               "00 None"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap451x
   1                "1 Current"
   2                "2 Former"
   3                "3 Never"
   4                "4 Smoker, current status unknown"
   9                "9 Unknown if ever smoked"
;
label define sap452x
   1                "1 Current every day smoker"
   2                "2 Current some day smoker"
   3                "3 Former smoker"
   4                "4 Never  smoker"
   5                "5 Smoker, current status unknown"
   9                "9 Unknown if ever smoked"
;
label define sap453x
   1                "1 Current  every day smoker"
   2                "2 Current some day smoker (1+ days past mo)"
   3                "3 Current some day smoker (0 days past mo)"
   4                "4 Current some day smoker (unknown days past mo)"
   5                "5 Former smoker"
   6                "6 Never smoker"
   7                "7 Smoker, current status unknown"
   9                "9 Unknown if ever smoked"
;
label define sap455x
   000              "000 Never"
   996              "996 Unable to do this type activity"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap456x
   0                "0 Never"
   1                "1 Day"
   2                "2 Week"
   3                "3 Month"
   4                "4 Year"
   6                "6 Unable to do this type activity"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap457x
   00               "00 Less than once per week"
   95               "95 Never"
   96               "96 Unable to do vig activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap458x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap459x
   1                "1 Minutes"
   2                "2 Hours"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap460x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap461x
   1                "1 Less than 20 minutes"
   2                "2 20 minutes or more"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap462x
   000              "000 Never"
   996              "996 Unable to do this type activity"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap464x
   00               "00 Less than once per week"
   95               "95 Never"
   96               "96 Unable to do light or moderate activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap471x
   00               "00 Less than once per week"
   95               "95 Never"
   96               "96 Unable to do strength activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap474x
   000              "000 Never"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap475x
   0                "0 Never/None"
   1                "1 Week"
   2                "2 Month"
   3                "3 Year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap476x
   00               "00 Less than once a month"
   95               "95 Did not drink in past year"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap477x
   00               "00 Less than one day per week"
   95               "95 Did not drink in past year"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap478x
   000              "000 Never/none"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap479x
   95               "95 95+ drinks"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap480x
   000              "000 Never/None"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap483x
   1                "1 Lifetime abstainer [<12 drinks in lifetime]"
   2                "2 Former drinker [No drinks in past year]"
   3                "3 Current drinker [1+ drinks in past year]"
   9                "9 Drinking status unknown"
;
label define sap484x
   1                "1 Lifetime abstainer"
   2                "2 Former infrequent"
   3                "3 Former regular"
   4                "4 Current infrequent"
   5                "5 Current light"
   6                "6 Current moderate"
   7                "7 Current heavier"
   8                "8 Current drinker, level unknown"
   9                "9 Drinking status unknown"
;
label define sap485x
   1                "1 Metric height measurement volunteered"
   2                "2 Not reported in metric units"
;
label define sap486x
   1                "1 Metric weight measurement volunteered"
   2                "2 Not reported in metric units"
;
label define sap487x
   96               "96 Not available"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap488x
   996              "996 Not available"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap489x
   1                "1 10% or more below desirable weight"
   2                "2 5-9% below desirable weight"
   3                "3 4.9% (+/-) of desirable body weight"
   4                "4 5-9.9% above desirable body weight"
   5                "5 10-19.9% above desirable body weight"
   6                "6 20-29.9 % above desirable body weight"
   7                "7 30% + above desirable body weight"
   9                "9 Unknown"
;
label define sap491x
   1                "1 Yes"
   2                "2 There is NO place"
   3                "3 There is MORE THAN ONE place"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap492x
   1                "1 Clinic or health center"
   2                "2 Doctor's office or HMO"
   3                "3 Hospital emergency room"
   4                "4 Hospital outpatient department"
   5                "5 Some other place"
   6                "6 Doesn't go to one place most often"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap494x
   0                "0 Doesn't get preventive care anywhere"
   1                "1 Clinic or health center"
   2                "2 Doctor's office or HMO"
   3                "3 Hospital emergency room"
   4                "4 Hospital outpatient department"
   5                "5 Some other place"
   6                "6 Doesn't go to one place most often"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap495x
   01               "01 Same sorc sk care & rout care"
   02               "02 Sorc sk care, no sorc rout care"
   03               "03 Sorc sk & rout care, no/unk same sorc"
   04               "04 Sorc sk care, unk sorc rout care *"
   05               "05 GE2 sorc sk care, 1 is sorc rout care"
   06               "06 GE2 sorc sk care, no sorc rout care"
   07               "07 GE2 sorc sk & rout care, no/unk if same"
   08               "08 GE2 sorc sk care, unk sorc rout care *"
   09               "09 No sorc sk care or rout care"
   10               "10 No sorc sk care, has sorc rout care"
   11               "11 No sorc sk care, unk sorc rout care *"
   12               "12 Unk sorc sk care, no sorc rout care"
   13               "13 Unk sorc sk care, has sorc rout care"
   14               "14 Unk sorc sk care or sorc rout care *"
   99               "99 Unknown other"
;
label define sap507x
   0                "0 Never"
   1                "1 6 Months or less"
   2                "2 More than 6 mos, but not more than 1 yr ago"
   3                "3 More than 1 yr, but not more than 2 yrs ago"
   4                "4 More than 2 yrs, but not more than 5 yrs ago"
   5                "5 More than 5 years ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap518x
   00               "00 None"
   01               "01 1"
   02               "02 2-3"
   03               "03 4-5"
   04               "04 6-7"
   05               "05 8-9"
   06               "06 10-12"
   07               "07 13-15"
   08               "08 16 or more"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap520x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap521x
   01               "01 1"
   02               "02 2-3"
   03               "03 4-5"
   04               "04 6-7"
   05               "05 8-9"
   06               "06 10-12"
   07               "07 13-15"
   08               "08 16 or more"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap524x
   95               "95 95+ Times"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap533x
   1                "1 Received at least 3 doses"
   2                "2 Received less than 3 doses"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap534x
   1                "1 Currently working"
   2                "2 Retired"
   3                "3 Not currently working but has worked previously"
   4                "4 Has never worked"
   9                "9 Unknown"
;
label define sap544x
   1                "1 Employee of a PRIVATE company for wages"
   2                "2 A FEDERAL government employee"
   3                "3 A STATE government employee"
   4                "4 A LOCAL government employee"
   5                "5 Self-emp in OWN business/prof practice/farm"
   6                "6 Working WITHOUT PAY in fam business/farm"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap548x
   01               "01 1-9 employees"
   02               "02 10-24 employees"
   03               "03 25-49 employees"
   04               "04 50-99 employees"
   05               "05 100-249 employees"
   06               "06 250-499 employees"
   07               "07 500-999 employees"
   08               "08 1000 employees or more"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap550x
   00               "00 Less than 1 year"
   35               "35 35 or more years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap562x
   01               "01 Unlikely have been exposed to HIV"
   02               "02 Afraid to find out if HIV positive"
   03               "03 Didn't want to think about HIV/HIV pos."
   04               "04 Worried name reported to Govt. if pos."
   05               "05 Didn't know where to get tested"
   06               "06 Don't like needles"
   07               "07 Afraid of losing job if pos. for AIDS"
   08               "08 Some other reason"
   09               "09 No particular reason"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap563x
   01               "01 January"
   02               "02 February"
   03               "03 March"
   04               "04 April"
   05               "05 May"
   06               "06 June"
   07               "07 July"
   08               "08 August"
   09               "09 September"
   10               "10 October"
   11               "11 November"
   12               "12 December"
   96               "96 Used time period format"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap564x
   9996             "9996 Used time period format"
   9997             "9997 Refused"
   9998             "9998 Not ascertained"
   9999             "9999 Don't know"
;
label define sap565x
   1                "1 6 Months or less"
   2                "2 More than 6 months but not more than 1 yr ago"
   3                "3 More than 1 yr, but not more than 2 yrs ago"
   4                "4 More than 2 yrs, but not more than 5 yrs ago"
   5                "5 More than 5 yrs ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap566x
   01               "01 Someone suggested you should be tested"
   02               "02 Might have been exposed thru sex/drug use"
   03               "03 Might have been exposed thru work/at work"
   04               "04 Wanted to find out if infected or not"
   05               "05 Part of a routine medical check-up/surg proc"
   06               "06 You were sick or had a medical problem"
   07               "07 You were pregnant or delivered a baby"
   08               "08 For health or life insurance coverage"
   09               "09 Military induction or military service"
   10               "10 For Immigration"
   11               "11 For marriage license or to get married"
   12               "12 Concerned could give HIV to someone"
   13               "13 Wanted medical care/new treatment if pos"
   14               "14 Some other reason"
   15               "15 No particular reason"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap567x
   1                "1 Doctor, nurse, or otr hlth care prof"
   2                "2 Sex partner"
   3                "3 Someone at health department"
   4                "4 Family member or friend"
   5                "5 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap568x
   01               "01 Doctor/HMO"
   02               "02 AIDS clinic/counseling/testing site"
   03               "03 Hospital/emergency room/outpatient clinic"
   04               "04 Other type of clinic"
   05               "05 Public health department"
   06               "06 At home"
   07               "07 Drug treatment facility"
   08               "08 Military induction or military service site"
   09               "09 Immigration site"
   10               "10 In a correctional facility (jail or prison)"
   11               "11 Other location"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap569x
   01               "01 Family planning clinic"
   02               "02 Prenatal clinic"
   03               "03 Tuberculosis clinic"
   04               "04 STD clinic"
   05               "05 Community health clinic"
   06               "06 Clinic run by employer or ins co"
   07               "07 Other"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap570x
   1                "1 Nurse or health worker"
   2                "2 Self-sampling kit"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap573x
   1                "1 High/Already have HIV/AIDS"
   2                "2 Medium"
   3                "3 Low"
   4                "4 None"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap574x
   1                "1 Yes, at least one statement is true"
   2                "2 No, none of these statements are true"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap577x
   1                "1 Private doctor"
   2                "2 Family planning clinic"
   3                "3 STD clinic"
   4                "4 Emergency room"
   5                "5 Health department"
   6                "6 Some other place"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap580x
   1                "1 A lot"
   2                "2 Some"
   3                "3 A little"
   4                "4 Nothing"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap588x
   1                "1 High"
   2                "2 Medium"
   3                "3 Low"
   4                "4 None"
   5                "5 Already have TB"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap591x
   1                "1 Always"
   2                "2 Most of the time"
   3                "3 Sometimes"
   4                "4 Rarely"
   5                "5 Never"
   6                "6 Don't go out in sun"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define sap595x
   96               "96 More than one, Different ones, Other"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't Know"
;
label define sap598x
   9996             "9996 Time period format"
   9997             "9997 Refused"
   9998             "9998 Not ascertained"
   9999             "9999 Don't know"
;
label define sap599x
   95               "95 95+"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap600x
   1                "1 Days ago"
   2                "2 Weeks ago"
   3                "3 Months ago"
   4                "4 Years ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap601x
   1                "1 A year ago or less"
   2                "2 More than 1 year but not more than 2 years"
   3                "3 More than 2 years but not more than 3 years"
   4                "4 More than 3 years but not more than 5 years"
   5                "5 Over 5 years ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define sap602x
   012              "012 12 months"
   024              "024 24 months"
   036              "036 36 months"
   060              "060 60 months"
   997              "997 Refused"
   998              "998 Not Ascertained"
   999              "999 Don't Know"
;
label define sap604x
   1                "1 Part of a routine physical or pregnancy exam"
   2                "2 Because of a specific gynecological problem"
   3                "3 Followup to a previous gynecological exam"
   4                "4 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define sap613x
   1                "1 Part of a routine physical exam/screen test"
   2                "2 Because of a specific breast problem"
   3                "3 Followup to prev identified breast prob"
   4                "4 Baseline or initial mammogram"
   5                "5 Family history"
   6                "6 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define sap623x
   1                "1 Part of a routine physical exam/screen test"
   2                "2 Because of a specific problem"
   3                "3 Followup test for an earlier exam"
   4                "4 Family history"
   5                "5 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define sap629x
   1                "1 A year ago or less"
   2                "2 More than 1 year but not more than 2 years"
   3                "3 More than 2 years but not more than 3 years"
   4                "4 More than 3 years but not more than 5 years"
   5                "5 More than 5 years but not more that 10 years"
   6                "6 More than 10 years ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define sap630x
   012              "012 12 months"
   024              "024 24 months"
   036              "036 36 months"
   060              "060 60 months"
   120              "120 120 months"
   997              "997 Refused"
   998              "998 Not Ascertained"
   999              "999 Don't Know"
;
label define sap631x
   1                "1 A year ago or less"
   2                "2 More than 1 year but not more than 2 years"
   3                "3 More than 2 years but not more than 3 years"
   4                "4 More than 3 years but not more than 5 years"
   5                "5 More than 5 years but not more than 10 years"
   6                "6 Over 10 years ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define sap632x
   1                "1 Sigmoidoscopy"
   2                "2 Colonoscopy"
   3                "3 Proctoscopy"
   4                "4 Something else"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define sap633x
   1                "1 Part of a routine physical exam/screen test"
   2                "2 Because of a specific problem"
   3                "3 Followup of an earlier test or screen exam"
   4                "4 Family history"
   5                "5 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;
label define sap642x
   1                "1 Part of a routine physical exam/screening test"
   2                "2 Because of a specific problem"
   3                "3 Followup test of an earlier test/screening exam"
   4                "4 Family history"
   5                "5 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't Know"
;

* ASSOCIATE VARIABLES WITH LABEL DEFINITIONS;

label values rectype   sap001x;   label values srvy_yr   sap002x;
label values intv_qrt  sap006x;   label values sex       sap007x;
label values age_p     sap008x;   label values origin_i  sap009x;
label values origimpt  sap010x;   label values hispan_i  sap011x;
label values hispimpt  sap012x;   label values racerpi2  sap013x;
label values raceimp2  sap014x;   label values mracrpi2  sap015x;
label values mracbpi2  sap016x;   label values racreci2  sap017x;
label values hiscodi2  sap018x;   label values erimpflg  sap019x;
label values educ      sap020x;   label values ab_bl20k  sap021x;
label values rat_cat   sap022x;   label values r_maritl  sap023x;
label values region    sap025x;   label values proxysa   sap030x;

label values hypev     sap031x;   label values hypdifv   sap032x;
label values hybpckno  sap033x;   label values hybpcktp  sap034x;
label values hybpcky   sap035x;   label values hybplev   sap036x;
label values clckno    sap033x;   label values clcktp    sap034x;
label values clcky     sap035x;   label values clhi      sap032x;
label values chdev     sap031x;   label values angev     sap031x;
label values miev      sap031x;   label values hrtev     sap031x;
label values strev     sap031x;   label values ephev     sap031x;
label values aasmev    sap031x;   label values aasstill  sap032x;
label values aasmyr    sap032x;   label values aasmeryr  sap032x;
label values aasmhsp   sap032x;   label values aasmmc    sap052x;
label values awzmswk   sap053x;   label values awzpin    sap032x;
label values aasminst  sap032x;   label values aasmpmed  sap032x;
label values aasmcan   sap032x;   label values aasmed    sap032x;
label values aasmdtp   sap032x;   label values aaswmp    sap032x;
label values aasclass  sap032x;   label values aas_rec   sap032x;
label values aas_res   sap032x;   label values aas_mon   sap032x;
label values aapenvln  sap065x;   label values aapenvdo  sap066x;
label values ulcev     sap031x;   label values ulcyr     sap032x;
label values canev     sap031x;   label values cnkind1   sap070x;
label values canage1   sap071x;   label values cnkind2   sap070x;
label values canage2   sap071x;   label values cnkind3   sap070x;
label values canage3   sap071x;   label values cnkind4   sap070x;
label values canage4   sap071x;   label values cnkind5   sap070x;
label values canage5   sap071x;   label values cnkind6   sap070x;
label values canage6   sap071x;   label values cnkind7   sap070x;
label values canage7   sap071x;   label values cnkind8   sap070x;
label values canage8   sap071x;   label values cnkind9   sap070x;
label values canage9   sap071x;   label values cnkind10  sap070x;
label values canage10  sap071x;   label values cnkind11  sap070x;
label values canage11  sap071x;   label values cnkind12  sap070x;
label values canage12  sap071x;   label values cnkind13  sap070x;
label values canage13  sap071x;   label values cnkind14  sap070x;
label values canage14  sap071x;   label values cnkind15  sap070x;
label values canage15  sap071x;   label values cnkind16  sap070x;
label values canage16  sap071x;   label values cnkind17  sap070x;
label values canage17  sap071x;   label values cnkind18  sap070x;
label values canage18  sap071x;   label values cnkind19  sap070x;
label values canage19  sap071x;   label values cnkind20  sap070x;
label values canage20  sap071x;   label values cnkind21  sap070x;
label values canage21  sap071x;   label values cnkind22  sap070x;
label values canage22  sap071x;   label values cnkind23  sap070x;
label values canage23  sap071x;   label values cnkind24  sap070x;
label values canage24  sap071x;   label values cnkind25  sap070x;
label values canage25  sap071x;   label values cnkind26  sap070x;
label values canage26  sap071x;   label values cnkind27  sap070x;
label values canage27  sap071x;   label values cnkind28  sap070x;
label values canage28  sap071x;   label values cnkind29  sap070x;
label values canage29  sap071x;   label values cnkind30  sap070x;
label values canage30  sap071x;   label values cnkind31  sap070x;
label values brcandig  sap131x;   label values dibev     sap132x;
label values dibage    sap071x;   label values difage2   sap134x;
label values insln     sap032x;   label values dibpill   sap032x;
label values dibhp     sap032x;   label values dibhpyr   sap138x;
label values dibndyr   sap138x;   label values dibglno   sap140x;
label values dibgltp   sap141x;   label values dglfreqw  sap142x;
label values diba1ckn  sap032x;   label values diba1cck  sap144x;
label values diba1cll  sap145x;   label values diba1csl  sap146x;
label values dibftck   sap144x;   label values dibckno   sap148x;
label values dibcktp   sap149x;   label values dckfreqw  sap150x;
label values dibeyckl  sap151x;   label values ahayfyr   sap031x;
label values sinyr     sap031x;   label values cbrchyr   sap031x;
label values kidwkyr   sap031x;   label values livyr     sap031x;
label values jntsymp   sap031x;   label values jmthp1    sap070x;
label values jmthp2    sap070x;   label values jmthp3    sap070x;
label values jmthp4    sap070x;   label values jmthp5    sap070x;
label values jmthp6    sap070x;   label values jmthp7    sap070x;
label values jmthp8    sap070x;   label values jmthp9    sap070x;
label values jmthp10   sap070x;   label values jmthp11   sap070x;
label values jmthp12   sap070x;   label values jmthp13   sap070x;
label values jmthp14   sap070x;   label values jmthp15   sap070x;
label values jmthp16   sap070x;   label values jmthp17   sap070x;
label values jntpn     sap175x;   label values jntchr    sap032x;
label values jnthp     sap032x;   label values arth1     sap031x;
label values arthwt    sap032x;   label values arthph    sap032x;
label values arthcls   sap032x;   label values arthlmt   sap032x;
label values arthwrk   sap032x;   label values paineck   sap031x;
label values painlb    sap031x;   label values painleg   sap032x;
label values painface  sap031x;   label values amigr     sap031x;
label values acold2w   sap031x;   label values aintil2w  sap031x;
label values pregnow   sap032x;   label values hearaid   sap031x;
label values ahearst   sap193x;   label values avision   sap031x;
label values ablind    sap032x;   label values lupprt    sap031x;
label values sad       sap197x;   label values nervous   sap197x;
label values restless  sap197x;   label values hopeless  sap197x;
label values effort    sap197x;   label values worthls   sap197x;
label values mhamtmo   sap203x;

label values wrklyr3   sap204x;   label values wkdayr    sap205x;
label values beddayr   sap206x;   label values ahstatyr  sap207x;
label values speceq    sap031x;   label values flwalk    sap209x;
label values flclimb   sap209x;   label values flstand   sap209x;
label values flsit     sap209x;   label values flstoop   sap209x;
label values flreach   sap209x;   label values flgrasp   sap209x;
label values flcarry   sap209x;   label values flpush    sap209x;
label values flshop    sap209x;   label values flsocl    sap209x;
label values flrelax   sap209x;   label values fla1ar    sap221x;
label values aflhca1   sap222x;   label values aflhca2   sap222x;
label values aflhca3   sap222x;   label values aflhca4   sap222x;
label values aflhca5   sap222x;   label values aflhca6   sap222x;
label values aflhca7   sap222x;   label values aflhca8   sap222x;
label values aflhca9   sap222x;   label values aflhca10  sap222x;
label values aflhca11  sap222x;   label values aflhca12  sap222x;
label values aflhca13  sap222x;   label values aflhca14  sap222x;
label values aflhca15  sap222x;   label values aflhca16  sap222x;
label values aflhca17  sap222x;   label values aflhca18  sap222x;
label values aflhca19  sap070x;   label values aflhca20  sap070x;
label values aflhca21  sap070x;   label values aflhca22  sap070x;
label values aflhca23  sap070x;   label values aflhca24  sap070x;
label values aflhca25  sap070x;   label values aflhca26  sap070x;
label values aflhca27  sap070x;   label values aflhca28  sap070x;
label values aflhca29  sap070x;   label values aflhca30  sap070x;
label values aflhca31  sap070x;   label values aflhca32  sap070x;
label values aflhca33  sap070x;   label values aflhca34  sap070x;
label values aflhca90  sap070x;   label values aflhca91  sap070x;
label values altime1   sap258x;   label values alunit1   sap259x;
label values aldura1   sap260x;   label values aldurb1   sap261x;
label values alchrc1   sap262x;   label values altime2   sap258x;
label values alunit2   sap259x;   label values aldura2   sap260x;
label values aldurb2   sap261x;   label values alchrc2   sap262x;
label values altime3   sap258x;   label values alunit3   sap259x;
label values aldura3   sap260x;   label values aldurb3   sap261x;
label values alchrc3   sap262x;   label values altime4   sap258x;
label values alunit4   sap259x;   label values aldura4   sap260x;
label values aldurb4   sap261x;   label values alchrc4   sap262x;
label values altime5   sap258x;   label values alunit5   sap259x;
label values aldura5   sap260x;   label values aldurb5   sap261x;
label values alchrc5   sap262x;   label values altime6   sap258x;
label values alunit6   sap259x;   label values aldura6   sap260x;
label values aldurb6   sap261x;   label values alchrc6   sap262x;
label values altime7   sap258x;   label values alunit7   sap259x;
label values aldura7   sap260x;   label values aldurb7   sap261x;
label values alchrc7   sap262x;   label values altime8   sap258x;
label values alunit8   sap259x;   label values aldura8   sap260x;
label values aldurb8   sap261x;   label values alchrc8   sap262x;
label values altime9   sap258x;   label values alunit9   sap259x;
label values aldura9   sap260x;   label values aldurb9   sap261x;
label values alchrc9   sap262x;   label values altime10  sap258x;
label values alunit10  sap259x;   label values aldura10  sap260x;
label values aldurb10  sap261x;   label values alchrc10  sap262x;
label values altime11  sap258x;   label values alunit11  sap259x;
label values aldura11  sap260x;   label values aldurb11  sap261x;
label values alchrc11  sap262x;   label values altime12  sap258x;
label values alunit12  sap259x;   label values aldura12  sap260x;
label values aldurb12  sap261x;   label values alchrc12  sap262x;
label values altime13  sap258x;   label values alunit13  sap259x;
label values aldura13  sap260x;   label values aldurb13  sap261x;
label values alchrc13  sap262x;   label values altime14  sap258x;
label values alunit14  sap259x;   label values aldura14  sap260x;
label values aldurb14  sap261x;   label values alchrc14  sap262x;
label values altime15  sap258x;   label values alunit15  sap259x;
label values aldura15  sap260x;   label values aldurb15  sap261x;
label values alchrc15  sap262x;   label values altime16  sap258x;
label values alunit16  sap259x;   label values aldura16  sap260x;
label values aldurb16  sap261x;   label values alchrc16  sap262x;
label values altime17  sap258x;   label values alunit17  sap259x;
label values aldura17  sap260x;   label values aldurb17  sap261x;
label values alchrc17  sap262x;   label values altime18  sap258x;
label values alunit18  sap259x;   label values aldura18  sap260x;
label values aldurb18  sap261x;   label values alchrc18  sap262x;
label values altime19  sap258x;   label values alunit19  sap259x;
label values aldura19  sap260x;   label values aldurb19  sap261x;
label values alchrc19  sap262x;   label values altime20  sap258x;
label values alunit20  sap259x;   label values aldura20  sap260x;
label values aldurb20  sap261x;   label values alchrc20  sap262x;
label values altime21  sap258x;   label values alunit21  sap259x;
label values aldura21  sap260x;   label values aldurb21  sap261x;
label values alchrc21  sap262x;   label values altime22  sap258x;
label values alunit22  sap259x;   label values aldura22  sap260x;
label values aldurb22  sap261x;   label values alchrc22  sap262x;
label values altime23  sap258x;   label values alunit23  sap259x;
label values aldura23  sap260x;   label values aldurb23  sap261x;
label values alchrc23  sap262x;   label values altime24  sap258x;
label values alunit24  sap259x;   label values aldura24  sap260x;
label values aldurb24  sap261x;   label values alchrc24  sap262x;
label values altime25  sap258x;   label values alunit25  sap259x;
label values aldura25  sap260x;   label values aldurb25  sap261x;
label values alchrc25  sap262x;   label values altime26  sap258x;
label values alunit26  sap259x;   label values aldura26  sap260x;
label values aldurb26  sap261x;   label values alchrc26  sap262x;
label values altime27  sap258x;   label values alunit27  sap259x;
label values aldura27  sap260x;   label values aldurb27  sap261x;
label values alchrc27  sap262x;   label values altime28  sap258x;
label values alunit28  sap259x;   label values aldura28  sap260x;
label values aldurb28  sap261x;   label values alchrc28  sap262x;
label values altime29  sap258x;   label values alunit29  sap259x;
label values aldura29  sap260x;   label values aldurb29  sap261x;
label values alchrc29  sap262x;   label values altime30  sap258x;
label values alunit30  sap259x;   label values aldura30  sap260x;
label values aldurb30  sap261x;   label values alchrc30  sap262x;
label values altime31  sap258x;   label values alunit31  sap259x;
label values aldura31  sap260x;   label values aldurb31  sap261x;
label values alchrc31  sap262x;   label values altime32  sap258x;
label values alunit32  sap259x;   label values aldura32  sap260x;
label values aldurb32  sap261x;   label values alchrc32  sap262x;
label values altime33  sap258x;   label values alunit33  sap259x;
label values aldura33  sap260x;   label values aldurb33  sap261x;
label values alchrc33  sap262x;   label values altime34  sap258x;
label values alunit34  sap259x;   label values aldura34  sap260x;
label values aldurb34  sap261x;   label values alchrc34  sap262x;
label values altime90  sap258x;   label values alunit90  sap259x;
label values aldura90  sap260x;   label values aldurb90  sap261x;
label values alchrc90  sap262x;   label values altime91  sap258x;
label values alunit91  sap259x;   label values aldura91  sap260x;
label values aldurb91  sap261x;   label values alchrc91  sap262x;
label values alcndrt   sap438x;   label values alchronr  sap439x;

label values smkev     sap031x;   label values smkreg    sap441x;
label values smknow    sap442x;   label values smkqtno   sap443x;
label values smkqttp   sap444x;   label values smkqty    sap445x;
label values smkqtd    sap032x;   label values cigsda1   sap447x;
label values cigdamo   sap448x;   label values cigsda2   sap447x;
label values cigsday   sap447x;   label values smkstat1  sap451x;
label values smkstat2  sap452x;   label values smkstat3  sap453x;
label values cigqtyr   sap032x;   label values vigno     sap455x;
label values vigtp     sap456x;   label values vigfreqw  sap457x;
label values viglngno  sap458x;   label values viglngtp  sap459x;
label values vigmin    sap460x;   label values viglongd  sap461x;
label values modno     sap462x;   label values modtp     sap456x;
label values modfreqw  sap464x;   label values modlngno  sap458x;
label values modlngtp  sap459x;   label values modmin    sap460x;
label values modlongd  sap461x;   label values strngno   sap455x;
label values strngtp   sap456x;   label values strfreqw  sap471x;
label values alc1yr    sap031x;   label values alclife   sap032x;
label values alc12mno  sap474x;   label values alc12mtp  sap475x;
label values alc12mmo  sap476x;   label values alc12mwk  sap477x;
label values alc12myr  sap478x;   label values alcamt    sap479x;
label values alc5upno  sap480x;   label values alc5uptp  sap475x;
label values alc5upyr  sap478x;   label values alcstat1  sap483x;
label values alc7stat  sap484x;   label values met_flg1  sap485x;
label values met_flg2  sap486x;   label values aheight   sap487x;
label values aweightp  sap488x;   label values desirewt  sap489x;

label values ausualpl  sap491x;   label values aplkind   sap492x;
label values ahcplrou  sap032x;   label values ahcplknd  sap494x;
label values sourcela  sap495x;   label values ahcchgyr  sap032x;
label values ahcchghi  sap032x;   label values ahcdlyr1  sap031x;
label values ahcdlyr2  sap031x;   label values ahcdlyr3  sap031x;
label values ahcdlyr4  sap031x;   label values ahcdlyr5  sap031x;
label values ahcafyr1  sap031x;   label values ahcafyr2  sap031x;
label values ahcafyr3  sap031x;   label values ahcafyr4  sap031x;
label values adnlong2  sap507x;   label values ahcsyr1   sap031x;
label values ahcsyr2   sap031x;   label values ahcsyr3   sap031x;
label values ahcsyr4   sap031x;   label values ahcsyr5   sap031x;
label values ahcsyr6   sap031x;   label values ahcsyr7   sap032x;
label values ahcsyr8   sap031x;   label values ahcsyr9   sap031x;
label values ahcsyr10  sap032x;   label values ahernoy2  sap518x;
label values ahchyr    sap031x;   label values ahchmoyr  sap520x;
label values ahchnoy2  sap521x;   label values ahcnoyr2  sap518x;
label values asrgyr    sap031x;   label values asrgnoyr  sap524x;
label values amdlongr  sap507x;   label values shtfluyr  sap031x;
label values shtpnuyr  sap031x;   label values apox      sap031x;
label values apox12mo  sap032x;   label values ahep      sap031x;
label values ahepliv   sap032x;   label values shthepb   sap031x;
label values shepdos   sap533x;

label values all_sa    sap534x;   label values everwrk   sap032x;
label values wrkcat    sap544x;   label values wrkcata   sap544x;
label values businc1   sap032x;   label values businc1a  sap032x;
label values locall1   sap548x;   label values locall1a  sap548x;
label values yrswrk_p  sap550x;   label values yrswrkpa  sap550x;
label values wrklongh  sap032x;   label values hourpd    sap032x;
label values hourpda   sap032x;   label values pdsick    sap032x;
label values pdsicka   sap032x;   label values onejob    sap032x;
label values smokd1    sap031x;

label values bldgv     sap031x;   label values bldg12m   sap032x;
label values hivtst    sap031x;   label values whytst_r  sap562x;
label values tst12m_m  sap563x;   label values tst12m_y  sap564x;
label values timetst   sap565x;   label values reatst_c  sap566x;
label values reaswhor  sap567x;   label values lastst_c  sap568x;
label values clntyp_c  sap569x;   label values whoadm    sap570x;
label values givnam    sap032x;   label values extst12m  sap031x;
label values chnsadsp  sap573x;   label values stmtru    sap574x;
label values std       sap032x;   label values stddoc    sap032x;
label values stdwher   sap577x;   label values tbhrd     sap031x;
label values tbknow    sap032x;   label values tb        sap580x;
label values tbsprd1   sap070x;   label values tbsprd2   sap070x;
label values tbsprd3   sap070x;   label values tbsprd4   sap070x;
label values tbsprd5   sap070x;   label values tbsprd6   sap070x;
label values tbcured   sap032x;   label values tbchanc   sap588x;
label values tbshame   sap032x;   label values homeless  sap031x;

label values sun1_sha  sap591x;   label values sun1_hat  sap591x;
label values sun2_lgs  sap591x;   label values sun2_scr  sap591x;
label values spf       sap595x;   label values paphad    sap032x;
label values rpap1_yr  sap598x;   label values rpap1_no  sap599x;
label values rpap1_tp  sap600x;   label values rpap2ca   sap601x;
label values rpap_mo2  sap602x;   label values rpap3     sap601x;
label values papreas   sap604x;   label values mamhad    sap032x;
label values rmam1_yr  sap598x;   label values rmam1_no  sap599x;
label values rmam1_tp  sap600x;   label values rmam2ca   sap601x;
label values rmam_mo2  sap602x;   label values rmam3     sap601x;
label values mamreas   sap613x;   label values psahrd    sap032x;
label values psahad    sap032x;   label values rpsa1_yr  sap598x;
label values rpsa1_no  sap599x;   label values rpsa1_tp  sap600x;
label values rpsa2     sap601x;   label values rpsa_mo2  sap602x;
label values rpsa3     sap601x;   label values psareas   sap623x;
label values crehad    sap032x;   label values rcre1_yr  sap598x;
label values rcre1_no  sap599x;   label values rcre1_tp  sap600x;
label values rcre2     sap629x;   label values rcre_mo2  sap630x;
label values rcre3     sap631x;   label values crenam    sap632x;
label values crereas   sap633x;   label values hfobhad   sap032x;
label values rhfob1_y  sap598x;   label values rhfob1_n  sap599x;
label values rhfob1_t  sap600x;   label values rhfob2    sap629x;
label values rhfo_mo2  sap630x;   label values rhfob3    sap631x;
label values hfobreas  sap642x;

label values hyppreg   sap032x;   label values hloswgt   sap032x;
label values wgtadev   sap032x;   label values wgtadnow  sap032x;
label values lowslt    sap032x;   label values lowsltev  sap032x;
label values lowsltnw  sap032x;   label values exerc     sap032x;
label values exercev   sap032x;   label values exercnw   sap032x;
label values hbpalc    sap032x;   label values hbpalcev  sap032x;
label values hbpalcnw  sap032x;   label values hypmedev  sap032x;
label values hypmed    sap032x;   label values hymdmed   sap032x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate educ [fweight=wtfa_sa];
save "$OUT/2003/samadult", replace;

#delimit cr

* data file is stored in samadult.dta
* log  file is stored in samadult.log

log close
