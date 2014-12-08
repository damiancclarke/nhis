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
 str  hhx           7 -  12 str  fmx          13 -  14
 str  px           15 -  16      intv_qrt     17 -  17
      sex          18 -  18      age_p        19 -  20
      origin_i     21 -  21      origimpt     22 -  22
      hispan_i     23 -  24      hispimpt     25 -  25
      rcdt1p_i     26 -  27      rc_smp_i     28 -  29
      racerp_i     30 -  31      raceimpt     32 -  32
      mracrp_i     33 -  34      mracbp_i     35 -  36
      racrec_i     37 -  37      hiscod_i     38 -  38
      erimpflg     39 -  39      educ         40 -  41
      ab_bl20k     42 -  42      rat_cat      43 -  44
      r_maritl     45 -  45      fm_size      46 -  47
      region       48 -  48      wtia_sa      49 -  54
      wtfa_sa      55 -  60      stratum      61 -  63
      psu          64 -  64      proxysa      65 -  65

      hypev        66 -  66      hypdifv      67 -  67
      hypyr        68 -  68      chdev        69 -  69
      angev        70 -  70      miev         71 -  71
      hrtev        72 -  72      strev        73 -  73
      ephev        74 -  74      chdyr        75 -  75
      angyr        76 -  76      miyr         77 -  77
      hrtyr        78 -  78      stryr        79 -  79
      ephyr        80 -  80      hchlev       81 -  81
      pcircev      82 -  82      irrhbev      83 -  83
      conhfev      84 -  84      hchlyr       85 -  85
      pcircyr      86 -  86      irrhbyr      87 -  87
      conhfyr      88 -  88      aasmev       89 -  89
      aasstill     90 -  90      aasmyr       91 -  91
      aasmeryr     92 -  92      awzmswk      93 -  95
      aasmed       96 -  96      aaswmp       97 -  97
      aapenvln     98 -  98      ulcev        99 -  99
      ulcyr       100 - 100      bowlev      101 - 101
      bowlyr      102 - 102      thyrev      103 - 103
      urinpev     104 - 104      allrfev     105 - 105
      allrmev     106 - 106      thyryr      107 - 107
      urinpyr     108 - 108      allrfyr     109 - 109
      allrmyr     110 - 110      msev        111 - 111
      parkev      112 - 112      neuropev    113 - 113
      seizev      114 - 114      insomyr     115 - 115
      fatigyr     116 - 116      painyr      117 - 117
      anxdepyr    118 - 118      sprainyr    119 - 119
      dentlpyr    120 - 120      skinpyr     121 - 121
      canev       122 - 122      cnkind1     123 - 123
      canage1     124 - 125      cnkind2     126 - 126
      canage2     127 - 128      cnkind3     129 - 129
      canage3     130 - 131      cnkind4     132 - 132
      canage4     133 - 134      cnkind5     135 - 135
      canage5     136 - 137      cnkind6     138 - 138
      canage6     139 - 140      cnkind7     141 - 141
      canage7     142 - 143      cnkind8     144 - 144
      canage8     145 - 146      cnkind9     147 - 147
      canage9     148 - 149      cnkind10    150 - 150
      canage10    151 - 152      cnkind11    153 - 153
      canage11    154 - 155      cnkind12    156 - 156
      canage12    157 - 158      cnkind13    159 - 159
      canage13    160 - 161      cnkind14    162 - 162
      canage14    163 - 164      cnkind15    165 - 165
      canage15    166 - 167      cnkind16    168 - 168
      canage16    169 - 170      cnkind17    171 - 171
      canage17    172 - 173      cnkind18    174 - 174
      canage18    175 - 176      cnkind19    177 - 177
      canage19    178 - 179      cnkind20    180 - 180
      canage20    181 - 182      cnkind21    183 - 183
      canage21    184 - 185      cnkind22    186 - 186
      canage22    187 - 188      cnkind23    189 - 189
      canage23    190 - 191      cnkind24    192 - 192
      canage24    193 - 194      cnkind25    195 - 195
      canage25    196 - 197      cnkind26    198 - 198
      canage26    199 - 200      cnkind27    201 - 201
      canage27    202 - 203      cnkind28    204 - 204
      canage28    205 - 206      cnkind29    207 - 207
      canage29    208 - 209      cnkind30    210 - 210
      canage30    211 - 212      cnkind31    213 - 213
      dibev       214 - 214      dibage      215 - 216
      difage2     217 - 218      insln       219 - 219
      dibpill     220 - 220      ahayfyr     221 - 221
      sinyr       222 - 222      cbrchyr     223 - 223
      kidwkyr     224 - 224      livyr       225 - 225
      jntsymp     226 - 226
      jmthp1  -jmthp17       227 - 243
      jntpn       244 - 245      jntchr      246 - 246
      jnthp       247 - 247      arth1       248 - 248
      arthwt      249 - 249      arthph      250 - 250
      arthcls     251 - 251      arthlmt     252 - 252
      arthwrk     253 - 253      paineck     254 - 254
      painlb      255 - 255      painleg     256 - 256
      painface    257 - 257      amigr       258 - 258
      acold2w     259 - 259      aintil2w    260 - 260
      pregnow     261 - 261      mensyr      262 - 262
      menoyr      263 - 263      gynyr       264 - 264
      prostyr     265 - 265      hearaid     266 - 266
      hearfreq    267 - 267      ahearst     268 - 268
      hearage     269 - 270      hearcaus    271 - 272
      avision     273 - 273      ablind      274 - 274
      dibrev      275 - 275      catarev     276 - 276
      glaucev     277 - 277      macdev      278 - 278
      dibryr      279 - 279      cataryr     280 - 280
      glaucyr     281 - 281      macdyr      282 - 282
      avisreh     283 - 283      avisdev     284 - 284
      avdfnws     285 - 285      avdfcls     286 - 286
      avdfnit     287 - 287      avdfdrv     288 - 288
      avdfper     289 - 289      avdfcrd     290 - 290
      aviswrin    291 - 291      avisexam    292 - 292
      avisact     293 - 293      avisprot    294 - 294
      lupprt      295 - 295      sad         296 - 296
      nervous     297 - 297      restless    298 - 298
      hopeless    299 - 299      effort      300 - 300
      worthls     301 - 301      mhamtmo     302 - 302

      wrklyr3     303 - 303      wkdayr      304 - 306
      beddayr     307 - 309      ahstatyr    310 - 310
      speceq      311 - 311      flwalk      312 - 312
      flclimb     313 - 313      flstand     314 - 314
      flsit       315 - 315      flstoop     316 - 316
      flreach     317 - 317      flgrasp     318 - 318
      flcarry     319 - 319      flpush      320 - 320
      flshop      321 - 321      flsocl      322 - 322
      flrelax     323 - 323      fla1ar      324 - 324
      aflhca1 -aflhca34      325 - 358
      aflhca90    359 - 359      aflhca91    360 - 360
      altime1     361 - 362      alunit1     363 - 363
      aldura1     364 - 365      aldurb1     366 - 366
      alchrc1     367 - 367      altime2     368 - 369
      alunit2     370 - 370      aldura2     371 - 372
      aldurb2     373 - 373      alchrc2     374 - 374
      altime3     375 - 376      alunit3     377 - 377
      aldura3     378 - 379      aldurb3     380 - 380
      alchrc3     381 - 381      altime4     382 - 383
      alunit4     384 - 384      aldura4     385 - 386
      aldurb4     387 - 387      alchrc4     388 - 388
      altime5     389 - 390      alunit5     391 - 391
      aldura5     392 - 393      aldurb5     394 - 394
      alchrc5     395 - 395      altime6     396 - 397
      alunit6     398 - 398      aldura6     399 - 400
      aldurb6     401 - 401      alchrc6     402 - 402
      altime7     403 - 404      alunit7     405 - 405
      aldura7     406 - 407      aldurb7     408 - 408
      alchrc7     409 - 409      altime8     410 - 411
      alunit8     412 - 412      aldura8     413 - 414
      aldurb8     415 - 415      alchrc8     416 - 416
      altime9     417 - 418      alunit9     419 - 419
      aldura9     420 - 421      aldurb9     422 - 422
      alchrc9     423 - 423      altime10    424 - 425
      alunit10    426 - 426      aldura10    427 - 428
      aldurb10    429 - 429      alchrc10    430 - 430
      altime11    431 - 432      alunit11    433 - 433
      aldura11    434 - 435      aldurb11    436 - 436
      alchrc11    437 - 437      altime12    438 - 439
      alunit12    440 - 440      aldura12    441 - 442
      aldurb12    443 - 443      alchrc12    444 - 444
      altime13    445 - 446      alunit13    447 - 447
      aldura13    448 - 449      aldurb13    450 - 450
      alchrc13    451 - 451      altime14    452 - 453
      alunit14    454 - 454      aldura14    455 - 456
      aldurb14    457 - 457      alchrc14    458 - 458
      altime15    459 - 460      alunit15    461 - 461
      aldura15    462 - 463      aldurb15    464 - 464
      alchrc15    465 - 465      altime16    466 - 467
      alunit16    468 - 468      aldura16    469 - 470
      aldurb16    471 - 471      alchrc16    472 - 472
      altime17    473 - 474      alunit17    475 - 475
      aldura17    476 - 477      aldurb17    478 - 478
      alchrc17    479 - 479      altime18    480 - 481
      alunit18    482 - 482      aldura18    483 - 484
      aldurb18    485 - 485      alchrc18    486 - 486
      altime19    487 - 488      alunit19    489 - 489
      aldura19    490 - 491      aldurb19    492 - 492
      alchrc19    493 - 493      altime20    494 - 495
      alunit20    496 - 496      aldura20    497 - 498
      aldurb20    499 - 499      alchrc20    500 - 500
      altime21    501 - 502      alunit21    503 - 503
      aldura21    504 - 505      aldurb21    506 - 506
      alchrc21    507 - 507      altime22    508 - 509
      alunit22    510 - 510      aldura22    511 - 512
      aldurb22    513 - 513      alchrc22    514 - 514
      altime23    515 - 516      alunit23    517 - 517
      aldura23    518 - 519      aldurb23    520 - 520
      alchrc23    521 - 521      altime24    522 - 523
      alunit24    524 - 524      aldura24    525 - 526
      aldurb24    527 - 527      alchrc24    528 - 528
      altime25    529 - 530      alunit25    531 - 531
      aldura25    532 - 533      aldurb25    534 - 534
      alchrc25    535 - 535      altime26    536 - 537
      alunit26    538 - 538      aldura26    539 - 540
      aldurb26    541 - 541      alchrc26    542 - 542
      altime27    543 - 544      alunit27    545 - 545
      aldura27    546 - 547      aldurb27    548 - 548
      alchrc27    549 - 549      altime28    550 - 551
      alunit28    552 - 552      aldura28    553 - 554
      aldurb28    555 - 555      alchrc28    556 - 556
      altime29    557 - 558      alunit29    559 - 559
      aldura29    560 - 561      aldurb29    562 - 562
      alchrc29    563 - 563      altime30    564 - 565
      alunit30    566 - 566      aldura30    567 - 568
      aldurb30    569 - 569      alchrc30    570 - 570
      altime31    571 - 572      alunit31    573 - 573
      aldura31    574 - 575      aldurb31    576 - 576
      alchrc31    577 - 577      altime32    578 - 579
      alunit32    580 - 580      aldura32    581 - 582
      aldurb32    583 - 583      alchrc32    584 - 584
      altime33    585 - 586      alunit33    587 - 587
      aldura33    588 - 589      aldurb33    590 - 590
      alchrc33    591 - 591      altime34    592 - 593
      alunit34    594 - 594      aldura34    595 - 596
      aldurb34    597 - 597      alchrc34    598 - 598
      altime90    599 - 600      alunit90    601 - 601
      aldura90    602 - 603      aldurb90    604 - 604
      alchrc90    605 - 605      altime91    606 - 607
      alunit91    608 - 608      aldura91    609 - 610
      aldurb91    611 - 611      alchrc91    612 - 612
      alcndrt     613 - 613      alchronr    614 - 614

      smkev       615 - 615      smkreg      616 - 617
      smknow      618 - 618      smkqtno     619 - 620
      smkqttp     621 - 621      smkqty      622 - 623
      smkqtd      624 - 624      cigsda1     625 - 626
      cigdamo     627 - 628      cigsda2     629 - 630
      cigsday     631 - 632      smkstat1    633 - 633
      smkstat2    634 - 634      smkstat3    635 - 635
      cigqtyr     636 - 636      vigno       637 - 639
      vigtp       640 - 640      vigfreqw    641 - 642
      viglngno    643 - 645      viglngtp    646 - 646
      vigmin      647 - 649      viglongd    650 - 650
      modno       651 - 653      modtp       654 - 654
      modfreqw    655 - 656      modlngno    657 - 659
      modlngtp    660 - 660      modmin      661 - 663
      modlongd    664 - 664      strngno     665 - 667
      strngtp     668 - 668      strfreqw    669 - 670
      alc1yr      671 - 671      alclife     672 - 672
      alc12mno    673 - 675      alc12mtp    676 - 676
      alc12mmo    677 - 678      alc12mwk    679 - 680
      alc12myr    681 - 683      alcamt      684 - 685
      alc5upno    686 - 688      alc5uptp    689 - 689
      alc5upyr    690 - 692      alcstat1    693 - 693
      alc7stat    694 - 694      met_flg1    695 - 695
      met_flg2    696 - 696      aheight     697 - 698
      aweightp    699 - 701      desirewt    702 - 702
      bmi         703 - 706

      ausualpl    707 - 707      aplkind     708 - 708
      ahcplrou    709 - 709      ahcplknd    710 - 710
      sourcela    711 - 712      ahcchgyr    713 - 713
      ahcchghi    714 - 714      ahcdlyr1    715 - 715
      ahcdlyr2    716 - 716      ahcdlyr3    717 - 717
      ahcdlyr4    718 - 718      ahcdlyr5    719 - 719
      ahcafyr1    720 - 720      ahcafyr2    721 - 721
      ahcafyr3    722 - 722      ahcafyr4    723 - 723
      adnlong2    724 - 724      ahcsyr1     725 - 725
      ahcsyr2     726 - 726      ahcsyr3     727 - 727
      ahcsyr4     728 - 728      ahcsyr5     729 - 729
      ahcsyr6     730 - 730      ahcsyr7     731 - 731
      ahcsyr8     732 - 732      ahcsyr9     733 - 733
      ahcsyr10    734 - 734      ahernoy2    735 - 736
      ahchyr      737 - 737      ahchmoyr    738 - 739
      ahchnoy2    740 - 741      ahcnoyr2    742 - 743
      asrgyr      744 - 744      asrgnoyr    745 - 746
      amdlongr    747 - 747      shtfluyr    748 - 748
      shtpnuyr    749 - 749      apox        750 - 750
      apox12mo    751 - 751      ahep        752 - 752
      ahepliv     753 - 753      shthepb     754 - 754
      shepdos     755 - 755

      all_sa      756 - 756      everwrk     757 - 757
      indstry1    758 - 759      indstry2    760 - 761
      indstr1a    762 - 763      indstr2a    764 - 765
      occup1      766 - 767      occup2      768 - 769
      occup1a     770 - 771      occup2a     772 - 773
      wrkcat      774 - 774      wrkcata     775 - 775
      businc1     776 - 776      businc1a    777 - 777
      locall1     778 - 779      locall1a    780 - 781
      yrswrk_p    782 - 783      yrswrkpa    784 - 785
      hourpd      786 - 786      hourpda     787 - 787
      pdsick      788 - 788      pdsicka     789 - 789
      onejob      790 - 790      home50      791 - 791
      leadpnt     792 - 792

      bldgv       793 - 793      bldg12m     794 - 794
      hivtst      795 - 795      whytst_r    796 - 797
      tst12m_m    798 - 799      tst12m_y    800 - 803
      timetst     804 - 804      tsttyr      805 - 807
      reatst_c    808 - 809      reaswhor    810 - 810
      lastst_c    811 - 812      clntyp_c    813 - 814
      whoadm      815 - 815      givnam      816 - 816
      extst12m    817 - 817      chnsadsp    818 - 818
      stmtru      819 - 819      std         820 - 820
      stddoc      821 - 821      stdwher     822 - 822
      tbhrd       823 - 823      tbknow      824 - 824
      tb          825 - 825      tbsprd1     826 - 826
      tbsprd2     827 - 827      tbsprd3     828 - 828
      tbsprd4     829 - 829      tbsprd5     830 - 830
      tbsprd6     831 - 831      tbcured     832 - 832
      tbchanc     833 - 833      tbshame     834 - 834
      homeless    835 - 835

      disuseq     836 - 836      disaid      837 - 837
      diseqdif    838 - 838      dishome     839 - 839
      dihm01      840 - 840      dihm02      841 - 841
      dihm03      842 - 842      dihm04      843 - 843
      dihm05      844 - 844      dihm06      845 - 845
      dihm07      846 - 846      dihm08      847 - 847
      dihm09      848 - 848      dihm10      849 - 849
      dishmoft    850 - 850      dissch      851 - 851
      disc01      852 - 852      disc02      853 - 853
      disc03      854 - 854      disc04      855 - 855
      disc05      856 - 856      disc06      857 - 857
      disc07      858 - 858      disc08      859 - 859
      disc09      860 - 860      disc10      861 - 861
      dischoft    862 - 862      diswrk      863 - 863
      diwk01      864 - 864      diwk02      865 - 865
      diwk03      866 - 866      diwk04      867 - 867
      diwk05      868 - 868      diwk06      869 - 869
      diwk07      870 - 870      diwk08      871 - 871
      diwk09      872 - 872      diwk10      873 - 873
      diswkoft    874 - 874      disca       875 - 875
      dica01      876 - 876      dica02      877 - 877
      dica03      878 - 878      dica04      879 - 879
      dica05      880 - 880      dica06      881 - 881
      dica07      882 - 882      dica08      883 - 883
      dica09      884 - 884      dica10      885 - 885
      discaoft    886 - 886      dishfac     887 - 887
      dishfl01    888 - 888      dishfl02    889 - 889
      dishfl03    890 - 890      dishfl04    891 - 891
      dishfl05    892 - 892      dishfl06    893 - 893
      dishfl07    894 - 894      dishfuse    895 - 895
using "$DAT/2002/samadult.dat";
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
label variable rcdt1p_i "Race coded to single/multiple race group";
label variable rc_smp_i "Race summary detail for single/multiple";
label variable racerp_i "OMB groups w/multiple race";
label variable raceimpt "Race Imputation Flag";
label variable mracrp_i "Race coded to a single race group";
label variable mracbp_i "Race coded to a single race group";
label variable racrec_i "Race Recode";
label variable hiscod_i "Combined race/ethnicity recode";
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
label variable hypyr    "Had hypertension, past 12 months";
label variable chdev    "Ever told you had coronary heart disease";
label variable angev    "Ever been told you had angina pectoris";
label variable miev     "Ever been told you had a heart attack";
label variable hrtev    "Ever told you had a heart cond/disease";
label variable strev    "Ever been told you had a stroke";
label variable ephev    "Ever been told you had emphysema";
label variable chdyr    "Had coronary heart disease, past 12 mths";
label variable angyr    "Had angina pectoris, past 12 months";
label variable miyr     "Had a heart attack, past 12 months";
label variable hrtyr    "Had a heart cond/disease, past 12 months";
label variable stryr    "Had a stroke, past 12 months";
label variable ephyr    "Had emphysema, past 12 months";
label variable hchlev   "Ever told you had high cholesterol";
label variable pcircev  "Ever told you had poor circulation";
label variable irrhbev  "Ever told you had irregular heartbeats";
label variable conhfev  "Ever told you had heart failure";
label variable hchlyr   "Had high cholesterol, past 12 months";
label variable pcircyr  "Had poor circulation, past 12 months";
label variable irrhbyr  "Had irregular heartbeats, past 12 months";
label variable conhfyr  "Had heart failure, past 12 months";
label variable aasmev   "Ever been told you had asthma";
label variable aasstill "Still have asthma";
label variable aasmyr   "Had an asthma episode/attack, past 12 m";
label variable aasmeryr "Had visit to ER due to asthma, past 12 m";
label variable awzmswk  "# days missed due to asthma, past 12 mo.";
label variable aasmed   "Ever taken preventive asthma meds";
label variable aaswmp   "Given an asthma management plan";
label variable aapenvln "Ever advised to change environment";
label variable ulcev    "Ever been told you had an ulcer";
label variable ulcyr    "Had an ulcer in past 12 months";
label variable bowlev   "Ever been told you had irritable bowel";
label variable bowlyr   "Had irritable bowel, past 12 months";
label variable thyrev   "Ever been told you had a thyroid prob";
label variable urinpev  "Ever been told you had urinary prob";
label variable allrfev  "Ever told you had food/odor allergies";
label variable allrmev  "Ever told you had medication allergies";
label variable thyryr   "Had thyroid problems, past 12 months";
label variable urinpyr  "Had urinary problems, past 12 months";
label variable allrfyr  "Had food/odor allergies, past 12 months";
label variable allrmyr  "Had medication allergies, past 12 months";
label variable msev     "Ever told you had Multiple sclerosis";
label variable parkev   "Ever told you had Parkinson's disease";
label variable neuropev "Ever told you had Neuropathy";
label variable seizev   "Ever told you had Seizures";
label variable insomyr  "Had insomnia, past 12 months";
label variable fatigyr  "Had excessive sleepiness, past 12 months";
label variable painyr   "Had recurring pain, past 12 months";
label variable anxdepyr "Frequently depressed, past 12 months";
label variable sprainyr "Had severe sprains, past 12 months";
label variable dentlpyr "Had dental pain, past 12 months";
label variable skinpyr  "Had skin problems, past 12 months";
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
label variable dibev    "Ever been told that you have diabetes";
label variable dibage   "Age first diagnosed w/diabetes";
label variable difage2  "Years since first diagnosed w/diabetes";
label variable insln    "NOW taking insulin";
label variable dibpill  "NOW taking diabetic pills";
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
label variable mensyr   "Had menstrual prob, past 12 months";
label variable menoyr   "Had menopausal prob, past 12 months";
label variable gynyr    "Had gynecologic prob, past 12 months";
label variable prostyr  "Had prostate prob, past 12 months";
label variable hearaid  "Had ever worn a hearing aid";
label variable hearfreq "How often do you wear hearing aid";
label variable ahearst  "Description of hearing w/o hearing aid";
label variable hearage  "Age of hearing loss";
label variable hearcaus "Cause of hearing loss*";
label variable avision  "Trouble seeing even w/glasses/lenses";
label variable ablind   "Blind or unable to see at all";
label variable dibrev   "Ever told you had diabetic retinopathy";
label variable catarev  "Ever told you had cataracts";
label variable glaucev  "Ever told you had Glaucoma";
label variable macdev   "Ever told you had Macular degeneration";
label variable dibryr   "Had diabetic retinopathy, past 12 months";
label variable cataryr  "Had cataracts, past 12 months";
label variable glaucyr  "Had glaucoma, past 12 months";
label variable macdyr   "Had macular degeneration, past 12 months";
label variable avisreh  "Use any vision rehab services";
label variable avisdev  "Use any adaptive devices";
label variable avdfnws  "How difficult to read due to eyesight";
label variable avdfcls  "How diff seeing up close b/c of eyesight";
label variable avdfnit  "How diff to step down at night b/c sight";
label variable avdfdrv  "How diff daytime driving b/c sight";
label variable avdfper  "How diff noticing objects b/c of sight";
label variable avdfcrd  "How diff to find shelved obj b/c of sigh";
label variable aviswrin "Ever had eye injury at work";
label variable avisexam "Last eye exam w/ pupils dilated";
label variable avisact  "Engage in acts that can cause eye injury";
label variable avisprot "How often do you wear eye protection";
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
label variable alchrc2  "hearing problem condition status";
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
label variable smknow   "Smoke freq: every day/some days/not at a";
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
label variable modlongd "Dur of lite/mod activity: <20 or 20+ min";
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
label variable hourpd   "Paid by the hour at current job";
label variable hourpda  "Paid by hr at current/most recent job";
label variable pdsick   "Paid sick leave at current job";
label variable pdsicka  "Paid sick leave current/most recent job";
label variable onejob   "Have more than one job";
label variable home50   "Home built before 1950?";
label variable leadpnt  "Paint tested for lead";
 
label variable bldgv    "Donated blood since March 1985";
label variable bldg12m  "Donated blood past 12 m";
label variable hivtst   "Ever been tested for HIV?";
label variable whytst_r "Reason why you have not been tested?";
label variable tst12m_m "Month of last test for HIV";
label variable tst12m_y "Year of last test for HIV";
label variable timetst  "Was it:";
label variable tsttyr   "# times tested for HIV, past 12m";
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
 
label variable disuseq  "NOW use spec equip or assistive devices?";
label variable disaid   "Know of any spec equip/assistive devices";
label variable diseqdif "Have diff w/o spec equip/assist dev?";
label variable dishome  "Barriers limit home act or hh resp?";
label variable dihm01   "Building design";
label variable dihm02   "Lighting";
label variable dihm03   "Sound";
label variable dihm04   "HH/Workplace equip hard to use";
label variable dihm05   "Crowds";
label variable dihm06   "Sidewalks and curbs";
label variable dihm07   "Transportation";
label variable dihm08   "Attitudes of other people";
label variable dihm09   "Policies";
label variable dihm10   "Other barriers";
label variable dishmoft "How often things limit/prevent home act?";
label variable dissch   "Barriers NOW limit/prevent school";
label variable disc01   "Building design";
label variable disc02   "Lighting";
label variable disc03   "Sound";
label variable disc04   "HH/Workplace equip hard to use";
label variable disc05   "Crowds";
label variable disc06   "Sidewalks and curbs";
label variable disc07   "Transportation";
label variable disc08   "Attitudes of other people";
label variable disc09   "Policies";
label variable disc10   "Other barriers";
label variable dischoft "How often things limit/prevent training?";
label variable diswrk   "Barriers NOW limit you from working?";
label variable diwk01   "Building design";
label variable diwk02   "Lighting";
label variable diwk03   "Sound";
label variable diwk04   "HH/Workplace equip hard to use";
label variable diwk05   "Crowds";
label variable diwk06   "Sidewalks and curbs";
label variable diwk07   "Transportation";
label variable diwk08   "Attitudes of other people";
label variable diwk09   "Policies";
label variable diwk10   "Other barriers";
label variable diswkoft "How often things limit/prevent working?";
label variable disca    "Barriers NOW limit/prevent comm act";
label variable dica01   "Building design";
label variable dica02   "Lighting";
label variable dica03   "Sound";
label variable dica04   "HH/Workplace equip hard to use";
label variable dica05   "Crowds";
label variable dica06   "Sidewalks and curbs";
label variable dica07   "Transportation";
label variable dica08   "Attitudes of other people";
label variable dica09   "Policies";
label variable dica10   "Other barriers";
label variable discaoft "How often things limit/prevent comm act?";
label variable dishfac  "Access to hlth club/fitness facility";
label variable dishfl01 "None; no reason given";
label variable dishfl02 "Cost too high for budget";
label variable dishfl03 "Lack of transportation";
label variable dishfl04 "Access into/within the building";
label variable dishfl05 "Lack of exercise equip that meets needs";
label variable dishfl06 "No instructor to demonstrate equip";
label variable dishfl07 "Other";
label variable dishfuse "Used health club 10+ times";

* DEFINE VALUE LABELS FOR REPORTS;

label define sap001x
   30               "30 Sample Adult"
;
label define sap002x
   2002             "2002"
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
   1                "1 Imputed 'refused' Hispanic Origin response"
   2                "2 Imputed 'not ascertained' Hispanic Origin"
   3                "3 Imputed 'does not know' Hispanic Origin"
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
   1                "1 Imputed 'refused' Hispanic Origin type"
   2                "2 Imputed 'not ascertained' Hispanic Origin type"
   3                "3 Imputed 'does not know' Hispanic Origin type"
   4                "4 Hispanic Origin type given by respondent/proxy"
;
label define sap013x
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
label define sap014x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN only*"
   04               "04 Asian only"
   05               "05 Other race only"
   06               "06 Multiple detailed race only"
;
label define sap015x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN* only"
   04               "04 Asian only"
   05               "05 Other race only"
   06               "06 Multiple race"
;
label define sap016x
   1                "1 Imputed 'refused' race response"
   2                "2 Imputed 'not ascertained' race response"
   3                "3 Imputed 'does not know' race response"
   4                "4 Race given by respondent/proxy"
;
label define sap017x
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
label define sap018x
   01               "01 White"
   02               "02 Black/African American"
   03               "03 Indian (American) (includes Eskimo, Aleut)"
   06               "06 Chinese"
   07               "07 Filipino"
   12               "12 Asian Indian"
   16               "16 Other race"
   17               "17 Multiple race"
;
label define sap019x
   1                "1 White"
   2                "2 Black"
   3                "3 Other"
;
label define sap020x
   1                "1 Hispanic"
   2                "2 Non-Hispanic White"
   3                "3 Non-Hispanic Black"
   4                "4 Non-Hispanic Other"
;
label define sap021x
   1                "1 Ethnicity/race imputed"
   2                "2 Ethnicity/race given by respondent/proxy"
;
label define sap022x
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
label define sap023x
   1                "1 $20,000 or more"
   2                "2 Less than $20,000"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap024x
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
label define sap025x
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
label define sap027x
   1                "1 Northeast"
   2                "2 Midwest"
   3                "3 South"
   4                "4 West"
;
label define sap032x
   1                "1 Proxy"
   2                "2 Not proxy"
;
label define sap033x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap034x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap060x
   000              "000 None"
   996              "996 Unable to do this activity"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap063x
   1                "1 Yes"
   2                "2 No"
   3                "3 Was told no changes needed"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap088x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap089x
   85               "85 85+ years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't Know"
;
label define sap149x
   1                "1 Yes"
   2                "2 No"
   3                "3 Borderline"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap151x
   00               "00 Within past year"
   85               "85 85+ years"
   96               "96 1+ year(s) with diabetes and age is 85+"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't Know"
;
label define sap177x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap199x
   1                "1 Always"
   2                "2 Most of the time"
   3                "3 Some of the time"
   4                "4 None of the time"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap200x
   1                "1 Good"
   2                "2 Little trouble"
   3                "3 Lot of trouble"
   4                "4 Deaf"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap201x
   01               "01 At birth"
   02               "02 0 through 2 years of age"
   03               "03 3 through 5 years of age"
   04               "04 6 through 18 years of age"
   05               "05 19 through 44 years of age"
   06               "06 45 through 64 years of age"
   07               "07 65 or more years of age"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap202x
   01               "01 Mother /w German measles during preg"
   02               "02 At birth for genetic reason"
   03               "03 At birth - oth reason, not infectious dis"
   04               "04 Infectious dis like measles or meningitis"
   05               "05 An ear infection/multiple ear infections"
   06               "06 An ear injury"
   07               "07 Ear surgery"
   08               "08 Loud, brief noise: gunfire, blasts/explosions"
   09               "09 Oth noise: machine, aircraft, etc."
   10               "10 Getting older"
   11               "11 Some other cause"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap215x
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
label define sap222x
   1                "1 Less than 1 month"
   2                "2 01 to 12 months"
   3                "3 13 to 24 months"
   4                "4 More than two years"
   5                "5 Never"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap226x
   1                "1 ALL of the time"
   2                "2 MOST of the time"
   3                "3 SOME of the time"
   4                "4 A LITTLE of the time"
   5                "5 NONE of the time"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap232x
   1                "1 A lot"
   2                "2 Some"
   3                "3 A little"
   4                "4 Not at all"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap233x
   0                "0 Had job last week"
   1                "1 No job last week, had job past 12 m"
   2                "2 No job last week, no job past 12 m"
   3                "3 Never worked"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap234x
   000              "000 None"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap235x
   000              "000 None"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap236x
   1                "1 Better"
   2                "2 Worse"
   3                "3 About the same"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap238x
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
label define sap250x
   1                "1 Limited in any way"
   2                "2 Not limited in any way"
   3                "3 Unknown if limited"
;
label define sap251x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   6                "6 No condition at all"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap287x
   95               "95 95+"
   96               "96 Since birth"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap288x
   1                "1 Day(s)"
   2                "2 Week(s)"
   3                "3 Month(s)"
   4                "4 Year(s)"
   6                "6 Since birth"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap289x
   00               "00 Less than 1 year"
   85               "85 85+ years"
   96               "96 Unknown number of years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap290x
   1                "1 Less than 3 months"
   2                "2 3 - 5 months"
   3                "3 6 - 12 months"
   4                "4 More than 1 year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap291x
   1                "1 Chronic"
   2                "2 Not chronic"
   9                "9 Unknown if chronic"
;
label define sap467x
   1                "1 At least one chronic cond causes functl lim"
   2                "2 No chronic cond causes functl lim"
   9                "9 Unk if any chronic cond causes functl lim"
;
label define sap468x
   0                "0 Not limited in any way (incl unk if limited)"
   1                "1 Limited; caused by at least one chronic cond"
   2                "2 Limited; not caused by chronic cond"
   3                "3 Limited; unk if cond is chronic"
;
label define sap470x
   85               "85 85 years or older"
   96               "96 Never smoked regularly"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap471x
   1                "1 Every day"
   2                "2 Some days"
   3                "3 Not at all"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap472x
   95               "95 95+"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap473x
   1                "1 Days"
   2                "2 Weeks"
   3                "3 Months"
   4                "4 Years"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap474x
   00               "00 Less than 1 year"
   70               "70 70+ years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap476x
   95               "95 95+ cigarettes"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't Know"
;
label define sap477x
   00               "00 None"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap480x
   1                "1 Current"
   2                "2 Former"
   3                "3 Never"
   4                "4 Smoker, current status unknown"
   9                "9 Unknown if ever smoked"
;
label define sap481x
   1                "1 Current every day smoker"
   2                "2 Current some day smoker"
   3                "3 Former smoker"
   4                "4 Never  smoker"
   5                "5 Smoker, current status unknown"
   9                "9 Unknown if ever smoked"
;
label define sap482x
   1                "1 Current  every day smoker"
   2                "2 Current some day smoker (1+ days past mo)"
   3                "3 Current some day smoker (0 days past mo)"
   4                "4 Current some day smoker (unknown days past mo)"
   5                "5 Former smoker"
   6                "6 Never smoker"
   7                "7 Smoker, current status unknown"
   9                "9 Unknown if ever smoked"
;
label define sap484x
   000              "000 Never"
   996              "996 Unable to do this type activity"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap485x
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
label define sap486x
   00               "00 Less than once per week"
   95               "95 Never"
   96               "96 Unable to do vig activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap487x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap488x
   1                "1 Minutes"
   2                "2 Hours"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap489x
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap490x
   1                "1 Less than 20 minutes"
   2                "2 20 minutes or more"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap491x
   000              "000 Never"
   996              "996 Unable to do this type activity"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap493x
   00               "00 Less than once per week"
   95               "95 Never"
   96               "96 Unable to do light or moderate activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap500x
   00               "00 Less than once per week"
   95               "95 Never"
   96               "96 Unable to do strength activity"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap503x
   000              "000 Never"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap504x
   0                "0 Never/None"
   1                "1 Week"
   2                "2 Month"
   3                "3 Year"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap505x
   00               "00 Less than once a month"
   95               "95 Did not drink in past year"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap506x
   00               "00 Less than one day per week"
   95               "95 Did not drink in past year"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap507x
   000              "000 Never/none"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap508x
   95               "95 95+ drinks"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap509x
   000              "000 Never/None"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap512x
   1                "1 Lifetime abstainer [<12 drinks in lifetime]"
   2                "2 Former drinker [No drinks in past year]"
   3                "3 Current drinker [1+ drinks in past year]"
   9                "9 Drinking status unknown"
;
label define sap513x
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
label define sap514x
   1                "1 Metric height measurement volunteered"
   2                "2 Not reported in metric units"
;
label define sap515x
   1                "1 Metric weight measurement volunteered"
   2                "2 Not reported in metric units"
;
label define sap516x
   96               "96 Not available"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap517x
   996              "996 Not available"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap518x
   1                "1 10% or more below desirable weight"
   2                "2 5-9% below desirable weight"
   3                "3 4.9% (+/-) of desirable body weight"
   4                "4 5-9.9% above desirable body weight"
   5                "5 10-19.9% above desirable body weight"
   6                "6 20-29.9 % above desirable body weight"
   7                "7 30% + above desirable body weight"
   9                "9 Unknown"
;
label define sap520x
   1                "1 Yes"
   2                "2 There is NO place"
   3                "3 There is MORE THAN ONE place"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap521x
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
label define sap523x
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
label define sap524x
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
label define sap536x
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
label define sap547x
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
label define sap549x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap550x
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
label define sap553x
   95               "95 95+ Times"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap562x
   1                "1 Received at least 3 doses"
   2                "2 Received less than 3 doses"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap563x
   1                "1 Currently working"
   2                "2 Retired"
   3                "3 Not currently working but has worked previously"
   4                "4 Has never worked"
   9                "9 Unknown"
;
label define sap573x
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
label define sap577x
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
label define sap579x
   00               "00 Less than 1 year"
   35               "35 35 or more years"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define sap591x
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
label define sap592x
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
label define sap593x
   9996             "9996 Used time period format"
   9997             "9997 Refused"
   9998             "9998 Not ascertained"
   9999             "9999 Don't know"
;
label define sap594x
   1                "1 6 Months or less"
   2                "2 More than 6 months but not more than 1 yr ago"
   3                "3 More than 1 yr, but not more than 2 yrs ago"
   4                "4 More than 2 yrs, but not more than 5 yrs ago"
   5                "5 More than 5 yrs ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap595x
   000              "000 None"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define sap596x
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
label define sap597x
   1                "1 Doctor, nurse, or otr hlth care prof"
   2                "2 Sex partner"
   3                "3 Someone at health department"
   4                "4 Family member or friend"
   5                "5 Other"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap598x
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
label define sap599x
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
label define sap600x
   1                "1 Nurse or health worker"
   2                "2 Self-sampling kit"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap603x
   1                "1 High/Already have HIV/AIDS"
   2                "2 Medium"
   3                "3 Low"
   4                "4 None"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap604x
   1                "1 Yes, at least one statement is true"
   2                "2 No, none of these statements are true"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap607x
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
label define sap610x
   1                "1 A lot"
   2                "2 Some"
   3                "3 A little"
   4                "4 Nothing"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap618x
   1                "1 High"
   2                "2 Medium"
   3                "3 Low"
   4                "4 None"
   5                "5 Already have TB"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap623x
   1                "1 Always"
   2                "2 Often"
   3                "3 Sometimes"
   4                "4 Rarely"
   5                "5 Never"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap635x
   1                "1 Always"
   2                "2 Often"
   3                "3 Sometimes"
   4                "4 Rarely"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap636x
   1                "1 Yes"
   2                "2 No"
   3                "3 Do not attend school/training for other reasons"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define sap648x
   1                "1 Yes"
   2                "2 No"
   3                "3 Do not work for other reasons"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;

* ASSOCIATE VARIABLES WITH LABEL DEFINITIONS;

label values rectype   sap001x;   label values srvy_yr   sap002x;
label values intv_qrt  sap006x;   label values sex       sap007x;
label values age_p     sap008x;   label values origin_i  sap009x;
label values origimpt  sap010x;   label values hispan_i  sap011x;
label values hispimpt  sap012x;   label values rcdt1p_i  sap013x;
label values rc_smp_i  sap014x;   label values racerp_i  sap015x;
label values raceimpt  sap016x;   label values mracrp_i  sap017x;
label values mracbp_i  sap018x;   label values racrec_i  sap019x;
label values hiscod_i  sap020x;   label values erimpflg  sap021x;
label values educ      sap022x;   label values ab_bl20k  sap023x;
label values rat_cat   sap024x;   label values r_maritl  sap025x;
label values region    sap027x;   label values proxysa   sap032x;

label values hypev     sap033x;   label values hypdifv   sap034x;
label values hypyr     sap034x;   label values chdev     sap033x;
label values angev     sap033x;   label values miev      sap033x;
label values hrtev     sap033x;   label values strev     sap033x;
label values ephev     sap033x;   label values chdyr     sap034x;
label values angyr     sap034x;   label values miyr      sap034x;
label values hrtyr     sap034x;   label values stryr     sap034x;
label values ephyr     sap034x;   label values hchlev    sap033x;
label values pcircev   sap033x;   label values irrhbev   sap033x;
label values conhfev   sap033x;   label values hchlyr    sap034x;
label values pcircyr   sap034x;   label values irrhbyr   sap034x;
label values conhfyr   sap034x;   label values aasmev    sap033x;
label values aasstill  sap034x;   label values aasmyr    sap034x;
label values aasmeryr  sap034x;   label values awzmswk   sap060x;
label values aasmed    sap034x;   label values aaswmp    sap034x;
label values aapenvln  sap063x;   label values ulcev     sap033x;
label values ulcyr     sap034x;   label values bowlev    sap033x;
label values bowlyr    sap034x;   label values thyrev    sap033x;
label values urinpev   sap033x;   label values allrfev   sap033x;
label values allrmev   sap033x;   label values thyryr    sap034x;
label values urinpyr   sap034x;   label values allrfyr   sap034x;
label values allrmyr   sap034x;   label values msev      sap033x;
label values parkev    sap033x;   label values neuropev  sap033x;
label values seizev    sap033x;   label values insomyr   sap033x;
label values fatigyr   sap033x;   label values painyr    sap033x;
label values anxdepyr  sap033x;   label values sprainyr  sap033x;
label values dentlpyr  sap033x;   label values skinpyr   sap033x;
label values canev     sap033x;   label values cnkind1   sap088x;
label values canage1   sap089x;   label values cnkind2   sap088x;
label values canage2   sap089x;   label values cnkind3   sap088x;
label values canage3   sap089x;   label values cnkind4   sap088x;
label values canage4   sap089x;   label values cnkind5   sap088x;
label values canage5   sap089x;   label values cnkind6   sap088x;
label values canage6   sap089x;   label values cnkind7   sap088x;
label values canage7   sap089x;   label values cnkind8   sap088x;
label values canage8   sap089x;   label values cnkind9   sap088x;
label values canage9   sap089x;   label values cnkind10  sap088x;
label values canage10  sap089x;   label values cnkind11  sap088x;
label values canage11  sap089x;   label values cnkind12  sap088x;
label values canage12  sap089x;   label values cnkind13  sap088x;
label values canage13  sap089x;   label values cnkind14  sap088x;
label values canage14  sap089x;   label values cnkind15  sap088x;
label values canage15  sap089x;   label values cnkind16  sap088x;
label values canage16  sap089x;   label values cnkind17  sap088x;
label values canage17  sap089x;   label values cnkind18  sap088x;
label values canage18  sap089x;   label values cnkind19  sap088x;
label values canage19  sap089x;   label values cnkind20  sap088x;
label values canage20  sap089x;   label values cnkind21  sap088x;
label values canage21  sap089x;   label values cnkind22  sap088x;
label values canage22  sap089x;   label values cnkind23  sap088x;
label values canage23  sap089x;   label values cnkind24  sap088x;
label values canage24  sap089x;   label values cnkind25  sap088x;
label values canage25  sap089x;   label values cnkind26  sap088x;
label values canage26  sap089x;   label values cnkind27  sap088x;
label values canage27  sap089x;   label values cnkind28  sap088x;
label values canage28  sap089x;   label values cnkind29  sap088x;
label values canage29  sap089x;   label values cnkind30  sap088x;
label values canage30  sap089x;   label values cnkind31  sap088x;
label values dibev     sap149x;   label values dibage    sap089x;
label values difage2   sap151x;   label values insln     sap034x;
label values dibpill   sap034x;   label values ahayfyr   sap033x;
label values sinyr     sap033x;   label values cbrchyr   sap033x;
label values kidwkyr   sap033x;   label values livyr     sap033x;
label values jntsymp   sap033x;   label values jmthp1    sap088x;
label values jmthp2    sap088x;   label values jmthp3    sap088x;
label values jmthp4    sap088x;   label values jmthp5    sap088x;
label values jmthp6    sap088x;   label values jmthp7    sap088x;
label values jmthp8    sap088x;   label values jmthp9    sap088x;
label values jmthp10   sap088x;   label values jmthp11   sap088x;
label values jmthp12   sap088x;   label values jmthp13   sap088x;
label values jmthp14   sap088x;   label values jmthp15   sap088x;
label values jmthp16   sap088x;   label values jmthp17   sap088x;
label values jntpn     sap177x;   label values jntchr    sap034x;
label values jnthp     sap034x;   label values arth1     sap033x;
label values arthwt    sap034x;   label values arthph    sap034x;
label values arthcls   sap034x;   label values arthlmt   sap034x;
label values arthwrk   sap034x;   label values paineck   sap033x;
label values painlb    sap033x;   label values painleg   sap034x;
label values painface  sap033x;   label values amigr     sap033x;
label values acold2w   sap033x;   label values aintil2w  sap033x;
label values pregnow   sap034x;   label values mensyr    sap034x;
label values menoyr    sap034x;   label values gynyr     sap034x;
label values prostyr   sap034x;   label values hearaid   sap033x;
label values hearfreq  sap199x;   label values ahearst   sap200x;
label values hearage   sap201x;   label values hearcaus  sap202x;
label values avision   sap033x;   label values ablind    sap034x;
label values dibrev    sap033x;   label values catarev   sap033x;
label values glaucev   sap033x;   label values macdev    sap033x;
label values dibryr    sap034x;   label values cataryr   sap034x;
label values glaucyr   sap034x;   label values macdyr    sap034x;
label values avisreh   sap034x;   label values avisdev   sap034x;
label values avdfnws   sap215x;   label values avdfcls   sap215x;
label values avdfnit   sap215x;   label values avdfdrv   sap215x;
label values avdfper   sap215x;   label values avdfcrd   sap215x;
label values aviswrin  sap034x;   label values avisexam  sap222x;
label values avisact   sap033x;   label values avisprot  sap199x;
label values lupprt    sap033x;   label values sad       sap226x;
label values nervous   sap226x;   label values restless  sap226x;
label values hopeless  sap226x;   label values effort    sap226x;
label values worthls   sap226x;   label values mhamtmo   sap232x;

label values wrklyr3   sap233x;   label values wkdayr    sap234x;
label values beddayr   sap235x;   label values ahstatyr  sap236x;
label values speceq    sap033x;   label values flwalk    sap238x;
label values flclimb   sap238x;   label values flstand   sap238x;
label values flsit     sap238x;   label values flstoop   sap238x;
label values flreach   sap238x;   label values flgrasp   sap238x;
label values flcarry   sap238x;   label values flpush    sap238x;
label values flshop    sap238x;   label values flsocl    sap238x;
label values flrelax   sap238x;   label values fla1ar    sap250x;
label values aflhca1   sap251x;   label values aflhca2   sap251x;
label values aflhca3   sap251x;   label values aflhca4   sap251x;
label values aflhca5   sap251x;   label values aflhca6   sap251x;
label values aflhca7   sap251x;   label values aflhca8   sap251x;
label values aflhca9   sap251x;   label values aflhca10  sap251x;
label values aflhca11  sap251x;   label values aflhca12  sap251x;
label values aflhca13  sap251x;   label values aflhca14  sap251x;
label values aflhca15  sap251x;   label values aflhca16  sap251x;
label values aflhca17  sap251x;   label values aflhca18  sap251x;
label values aflhca19  sap088x;   label values aflhca20  sap088x;
label values aflhca21  sap088x;   label values aflhca22  sap088x;
label values aflhca23  sap088x;   label values aflhca24  sap088x;
label values aflhca25  sap088x;   label values aflhca26  sap088x;
label values aflhca27  sap088x;   label values aflhca28  sap088x;
label values aflhca29  sap088x;   label values aflhca30  sap088x;
label values aflhca31  sap088x;   label values aflhca32  sap088x;
label values aflhca33  sap088x;   label values aflhca34  sap088x;
label values aflhca90  sap088x;   label values aflhca91  sap088x;
label values altime1   sap287x;   label values alunit1   sap288x;
label values aldura1   sap289x;   label values aldurb1   sap290x;
label values alchrc1   sap291x;   label values altime2   sap287x;
label values alunit2   sap288x;   label values aldura2   sap289x;
label values aldurb2   sap290x;   label values alchrc2   sap291x;
label values altime3   sap287x;   label values alunit3   sap288x;
label values aldura3   sap289x;   label values aldurb3   sap290x;
label values alchrc3   sap291x;   label values altime4   sap287x;
label values alunit4   sap288x;   label values aldura4   sap289x;
label values aldurb4   sap290x;   label values alchrc4   sap291x;
label values altime5   sap287x;   label values alunit5   sap288x;
label values aldura5   sap289x;   label values aldurb5   sap290x;
label values alchrc5   sap291x;   label values altime6   sap287x;
label values alunit6   sap288x;   label values aldura6   sap289x;
label values aldurb6   sap290x;   label values alchrc6   sap291x;
label values altime7   sap287x;   label values alunit7   sap288x;
label values aldura7   sap289x;   label values aldurb7   sap290x;
label values alchrc7   sap291x;   label values altime8   sap287x;
label values alunit8   sap288x;   label values aldura8   sap289x;
label values aldurb8   sap290x;   label values alchrc8   sap291x;
label values altime9   sap287x;   label values alunit9   sap288x;
label values aldura9   sap289x;   label values aldurb9   sap290x;
label values alchrc9   sap291x;   label values altime10  sap287x;
label values alunit10  sap288x;   label values aldura10  sap289x;
label values aldurb10  sap290x;   label values alchrc10  sap291x;
label values altime11  sap287x;   label values alunit11  sap288x;
label values aldura11  sap289x;   label values aldurb11  sap290x;
label values alchrc11  sap291x;   label values altime12  sap287x;
label values alunit12  sap288x;   label values aldura12  sap289x;
label values aldurb12  sap290x;   label values alchrc12  sap291x;
label values altime13  sap287x;   label values alunit13  sap288x;
label values aldura13  sap289x;   label values aldurb13  sap290x;
label values alchrc13  sap291x;   label values altime14  sap287x;
label values alunit14  sap288x;   label values aldura14  sap289x;
label values aldurb14  sap290x;   label values alchrc14  sap291x;
label values altime15  sap287x;   label values alunit15  sap288x;
label values aldura15  sap289x;   label values aldurb15  sap290x;
label values alchrc15  sap291x;   label values altime16  sap287x;
label values alunit16  sap288x;   label values aldura16  sap289x;
label values aldurb16  sap290x;   label values alchrc16  sap291x;
label values altime17  sap287x;   label values alunit17  sap288x;
label values aldura17  sap289x;   label values aldurb17  sap290x;
label values alchrc17  sap291x;   label values altime18  sap287x;
label values alunit18  sap288x;   label values aldura18  sap289x;
label values aldurb18  sap290x;   label values alchrc18  sap291x;
label values altime19  sap287x;   label values alunit19  sap288x;
label values aldura19  sap289x;   label values aldurb19  sap290x;
label values alchrc19  sap291x;   label values altime20  sap287x;
label values alunit20  sap288x;   label values aldura20  sap289x;
label values aldurb20  sap290x;   label values alchrc20  sap291x;
label values altime21  sap287x;   label values alunit21  sap288x;
label values aldura21  sap289x;   label values aldurb21  sap290x;
label values alchrc21  sap291x;   label values altime22  sap287x;
label values alunit22  sap288x;   label values aldura22  sap289x;
label values aldurb22  sap290x;   label values alchrc22  sap291x;
label values altime23  sap287x;   label values alunit23  sap288x;
label values aldura23  sap289x;   label values aldurb23  sap290x;
label values alchrc23  sap291x;   label values altime24  sap287x;
label values alunit24  sap288x;   label values aldura24  sap289x;
label values aldurb24  sap290x;   label values alchrc24  sap291x;
label values altime25  sap287x;   label values alunit25  sap288x;
label values aldura25  sap289x;   label values aldurb25  sap290x;
label values alchrc25  sap291x;   label values altime26  sap287x;
label values alunit26  sap288x;   label values aldura26  sap289x;
label values aldurb26  sap290x;   label values alchrc26  sap291x;
label values altime27  sap287x;   label values alunit27  sap288x;
label values aldura27  sap289x;   label values aldurb27  sap290x;
label values alchrc27  sap291x;   label values altime28  sap287x;
label values alunit28  sap288x;   label values aldura28  sap289x;
label values aldurb28  sap290x;   label values alchrc28  sap291x;
label values altime29  sap287x;   label values alunit29  sap288x;
label values aldura29  sap289x;   label values aldurb29  sap290x;
label values alchrc29  sap291x;   label values altime30  sap287x;
label values alunit30  sap288x;   label values aldura30  sap289x;
label values aldurb30  sap290x;   label values alchrc30  sap291x;
label values altime31  sap287x;   label values alunit31  sap288x;
label values aldura31  sap289x;   label values aldurb31  sap290x;
label values alchrc31  sap291x;   label values altime32  sap287x;
label values alunit32  sap288x;   label values aldura32  sap289x;
label values aldurb32  sap290x;   label values alchrc32  sap291x;
label values altime33  sap287x;   label values alunit33  sap288x;
label values aldura33  sap289x;   label values aldurb33  sap290x;
label values alchrc33  sap291x;   label values altime34  sap287x;
label values alunit34  sap288x;   label values aldura34  sap289x;
label values aldurb34  sap290x;   label values alchrc34  sap291x;
label values altime90  sap287x;   label values alunit90  sap288x;
label values aldura90  sap289x;   label values aldurb90  sap290x;
label values alchrc90  sap291x;   label values altime91  sap287x;
label values alunit91  sap288x;   label values aldura91  sap289x;
label values aldurb91  sap290x;   label values alchrc91  sap291x;
label values alcndrt   sap467x;   label values alchronr  sap468x;

label values smkev     sap033x;   label values smkreg    sap470x;
label values smknow    sap471x;   label values smkqtno   sap472x;
label values smkqttp   sap473x;   label values smkqty    sap474x;
label values smkqtd    sap034x;   label values cigsda1   sap476x;
label values cigdamo   sap477x;   label values cigsda2   sap476x;
label values cigsday   sap476x;   label values smkstat1  sap480x;
label values smkstat2  sap481x;   label values smkstat3  sap482x;
label values cigqtyr   sap034x;   label values vigno     sap484x;
label values vigtp     sap485x;   label values vigfreqw  sap486x;
label values viglngno  sap487x;   label values viglngtp  sap488x;
label values vigmin    sap489x;   label values viglongd  sap490x;
label values modno     sap491x;   label values modtp     sap485x;
label values modfreqw  sap493x;   label values modlngno  sap487x;
label values modlngtp  sap488x;   label values modmin    sap489x;
label values modlongd  sap490x;   label values strngno   sap484x;
label values strngtp   sap485x;   label values strfreqw  sap500x;
label values alc1yr    sap033x;   label values alclife   sap034x;
label values alc12mno  sap503x;   label values alc12mtp  sap504x;
label values alc12mmo  sap505x;   label values alc12mwk  sap506x;
label values alc12myr  sap507x;   label values alcamt    sap508x;
label values alc5upno  sap509x;   label values alc5uptp  sap504x;
label values alc5upyr  sap507x;   label values alcstat1  sap512x;
label values alc7stat  sap513x;   label values met_flg1  sap514x;
label values met_flg2  sap515x;   label values aheight   sap516x;
label values aweightp  sap517x;   label values desirewt  sap518x;

label values ausualpl  sap520x;   label values aplkind   sap521x;
label values ahcplrou  sap034x;   label values ahcplknd  sap523x;
label values sourcela  sap524x;   label values ahcchgyr  sap034x;
label values ahcchghi  sap034x;   label values ahcdlyr1  sap033x;
label values ahcdlyr2  sap033x;   label values ahcdlyr3  sap033x;
label values ahcdlyr4  sap033x;   label values ahcdlyr5  sap033x;
label values ahcafyr1  sap033x;   label values ahcafyr2  sap033x;
label values ahcafyr3  sap033x;   label values ahcafyr4  sap033x;
label values adnlong2  sap536x;   label values ahcsyr1   sap033x;
label values ahcsyr2   sap033x;   label values ahcsyr3   sap033x;
label values ahcsyr4   sap033x;   label values ahcsyr5   sap033x;
label values ahcsyr6   sap033x;   label values ahcsyr7   sap034x;
label values ahcsyr8   sap033x;   label values ahcsyr9   sap033x;
label values ahcsyr10  sap034x;   label values ahernoy2  sap547x;
label values ahchyr    sap033x;   label values ahchmoyr  sap549x;
label values ahchnoy2  sap550x;   label values ahcnoyr2  sap547x;
label values asrgyr    sap033x;   label values asrgnoyr  sap553x;
label values amdlongr  sap536x;   label values shtfluyr  sap033x;
label values shtpnuyr  sap033x;   label values apox      sap033x;
label values apox12mo  sap034x;   label values ahep      sap033x;
label values ahepliv   sap034x;   label values shthepb   sap033x;
label values shepdos   sap562x;

label values all_sa    sap563x;   label values everwrk   sap034x;
label values wrkcat    sap573x;   label values wrkcata   sap573x;
label values businc1   sap034x;   label values businc1a  sap034x;
label values locall1   sap577x;   label values locall1a  sap577x;
label values yrswrk_p  sap579x;   label values yrswrkpa  sap579x;
label values hourpd    sap034x;   label values hourpda   sap034x;
label values pdsick    sap034x;   label values pdsicka   sap034x;
label values onejob    sap034x;   label values home50    sap033x;
label values leadpnt   sap034x;

label values bldgv     sap033x;   label values bldg12m   sap034x;
label values hivtst    sap033x;   label values whytst_r  sap591x;
label values tst12m_m  sap592x;   label values tst12m_y  sap593x;
label values timetst   sap594x;   label values tsttyr    sap595x;
label values reatst_c  sap596x;   label values reaswhor  sap597x;
label values lastst_c  sap598x;   label values clntyp_c  sap599x;
label values whoadm    sap600x;   label values givnam    sap034x;
label values extst12m  sap033x;   label values chnsadsp  sap603x;
label values stmtru    sap604x;   label values std       sap034x;
label values stddoc    sap034x;   label values stdwher   sap607x;
label values tbhrd     sap033x;   label values tbknow    sap034x;
label values tb        sap610x;   label values tbsprd1   sap088x;
label values tbsprd2   sap088x;   label values tbsprd3   sap088x;
label values tbsprd4   sap088x;   label values tbsprd5   sap088x;
label values tbsprd6   sap088x;   label values tbcured   sap034x;
label values tbchanc   sap618x;   label values tbshame   sap034x;
label values homeless  sap033x;

label values disuseq   sap033x;   label values disaid    sap033x;
label values diseqdif  sap623x;   label values dishome   sap033x;
label values dihm01    sap088x;   label values dihm02    sap088x;
label values dihm03    sap088x;   label values dihm04    sap088x;
label values dihm05    sap088x;   label values dihm06    sap088x;
label values dihm07    sap088x;   label values dihm08    sap088x;
label values dihm09    sap088x;   label values dihm10    sap088x;
label values dishmoft  sap635x;   label values dissch    sap636x;
label values disc01    sap088x;   label values disc02    sap088x;
label values disc03    sap088x;   label values disc04    sap088x;
label values disc05    sap088x;   label values disc06    sap088x;
label values disc07    sap088x;   label values disc08    sap088x;
label values disc09    sap088x;   label values disc10    sap088x;
label values dischoft  sap635x;   label values diswrk    sap648x;
label values diwk01    sap088x;   label values diwk02    sap088x;
label values diwk03    sap088x;   label values diwk04    sap088x;
label values diwk05    sap088x;   label values diwk06    sap088x;
label values diwk07    sap088x;   label values diwk08    sap088x;
label values diwk09    sap088x;   label values diwk10    sap088x;
label values diswkoft  sap635x;   label values disca     sap034x;
label values dica01    sap088x;   label values dica02    sap088x;
label values dica03    sap088x;   label values dica04    sap088x;
label values dica05    sap088x;   label values dica06    sap088x;
label values dica07    sap088x;   label values dica08    sap088x;
label values dica09    sap088x;   label values dica10    sap088x;
label values discaoft  sap635x;   label values dishfac   sap033x;
label values dishfl01  sap088x;   label values dishfl02  sap088x;
label values dishfl03  sap088x;   label values dishfl04  sap088x;
label values dishfl05  sap088x;   label values dishfl06  sap088x;
label values dishfl07  sap088x;   label values dishfuse  sap034x;

save "$OUT/2002/samadult.dta", replace;

#delimit cr
log close
