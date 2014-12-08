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
      chdev        81 -  81      angev        82 -  82
      miev         83 -  83      hrtev        84 -  84
      strev        85 -  85      ephev        86 -  86
      aasmev       87 -  87      aasstill     88 -  88
      aasmyr       89 -  89      aaseryr1     90 -  90
      ulcev        91 -  91      ulcyr        92 -  92
      canev        93 -  93      cnkind1      94 -  94
      cnkind2      95 -  95      cnkind3      96 -  96
      cnkind4      97 -  97      cnkind5      98 -  98
      cnkind6      99 -  99      cnkind7     100 - 100
      cnkind8     101 - 101      cnkind9     102 - 102
      cnkind10    103 - 103      cnkind11    104 - 104
      cnkind12    105 - 105      cnkind13    106 - 106
      cnkind14    107 - 107      cnkind15    108 - 108
      cnkind16    109 - 109      cnkind17    110 - 110
      cnkind18    111 - 111      cnkind19    112 - 112
      cnkind20    113 - 113      cnkind21    114 - 114
      cnkind22    115 - 115      cnkind23    116 - 116
      cnkind24    117 - 117      cnkind25    118 - 118
      cnkind26    119 - 119      cnkind27    120 - 120
      cnkind28    121 - 121      cnkind29    122 - 122
      cnkind30    123 - 123      cnkind31    124 - 124
      canage1     125 - 127      canage2     128 - 130
      canage3     131 - 133      canage4     134 - 136
      canage5     137 - 139      canage6     140 - 142
      canage7     143 - 145      canage8     146 - 148
      canage9     149 - 151      canage10    152 - 154
      canage11    155 - 157      canage12    158 - 160
      canage13    161 - 163      canage14    164 - 166
      canage15    167 - 169      canage16    170 - 172
      canage17    173 - 175      canage18    176 - 178
      canage19    179 - 181      canage20    182 - 184
      canage21    185 - 187      canage22    188 - 190
      canage23    191 - 193      canage24    194 - 196
      canage25    197 - 199      canage26    200 - 202
      canage27    203 - 205      canage28    206 - 208
      canage29    209 - 211      canage30    212 - 214
      dibev       215 - 215      dibpre1     216 - 216
      dibage      217 - 218      difage2     219 - 220
      insln       221 - 221      dibpill     222 - 222
      ahayfyr     223 - 223      sinyr       224 - 224
      cbrchyr     225 - 225      kidwkyr     226 - 226
      livyr       227 - 227      jntsymp     228 - 228
      jmthp1      229 - 229      jmthp2      230 - 230
      jmthp3      231 - 231      jmthp4      232 - 232
      jmthp5      233 - 233      jmthp6      234 - 234
      jmthp7      235 - 235      jmthp8      236 - 236
      jmthp9      237 - 237      jmthp10     238 - 238
      jmthp11     239 - 239      jmthp12     240 - 240
      jmthp13     241 - 241      jmthp14     242 - 242
      jmthp15     243 - 243      jmthp16     244 - 244
      jmthp17     245 - 245      jntchr      246 - 246
      jnthp       247 - 247      arth1       248 - 248
      arthlmt     249 - 249      paineck     250 - 250
      painlb      251 - 251      painleg     252 - 252
      painface    253 - 253      amigr       254 - 254
      acold2w     255 - 255      aintil2w    256 - 256
      pregnow     257 - 257      hraidnow    258 - 258
      hraidev     259 - 259      ahearst1    260 - 260
      avision     261 - 261      ablind      262 - 262
      lupprt      263 - 263      sad         264 - 264
      nervous     265 - 265      restless    266 - 266
      hopeless    267 - 267      effort      268 - 268
      worthls     269 - 269      mhamtmo     270 - 270

      wkdayr      271 - 273      beddayr     274 - 276
      ahstatyr    277 - 277      speceq      278 - 278
      flwalk      279 - 279      flclimb     280 - 280
      flstand     281 - 281      flsit       282 - 282
      flstoop     283 - 283      flreach     284 - 284
      flgrasp     285 - 285      flcarry     286 - 286
      flpush      287 - 287      flshop      288 - 288
      flsocl      289 - 289      flrelax     290 - 290
      fla1ar      291 - 291      aflhca1     292 - 292
      aflhca2     293 - 293      aflhca3     294 - 294
      aflhca4     295 - 295      aflhca5     296 - 296
      aflhca6     297 - 297      aflhca7     298 - 298
      aflhca8     299 - 299      aflhca9     300 - 300
      aflhca10    301 - 301      aflhca11    302 - 302
      aflhca12    303 - 303      aflhca13    304 - 304
      alhca14a    305 - 305      aflhca15    306 - 306
      aflhca16    307 - 307      aflhca17    308 - 308
      aflhca18    309 - 309      aflhc19_    310 - 310
      aflhc20_    311 - 311      aflhc21_    312 - 312
      aflhc22_    313 - 313      aflhc23_    314 - 314
      aflhc24_    315 - 315      aflhc25_    316 - 316
      aflhc26_    317 - 317      aflhc27_    318 - 318
      aflhc28_    319 - 319      aflhc29_    320 - 320
      aflhc30_    321 - 321      aflhc31_    322 - 322
      aflhc32_    323 - 323      aflhc33_    324 - 324
      aflhc34_    325 - 325      aflhca90    326 - 326
      aflhca91    327 - 327      altime1     328 - 329
      alunit1     330 - 330      aldura1     331 - 332
      aldurb1     333 - 333      alchrc1     334 - 334
      altime2     335 - 336      alunit2     337 - 337
      aldura2     338 - 339      aldurb2     340 - 340
      alchrc2     341 - 341      altime3     342 - 343
      alunit3     344 - 344      aldura3     345 - 346
      aldurb3     347 - 347      alchrc3     348 - 348
      altime4     349 - 350      alunit4     351 - 351
      aldura4     352 - 353      aldurb4     354 - 354
      alchrc4     355 - 355      altime5     356 - 357
      alunit5     358 - 358      aldura5     359 - 360
      aldurb5     361 - 361      alchrc5     362 - 362
      altime6     363 - 364      alunit6     365 - 365
      aldura6     366 - 367      aldurb6     368 - 368
      alchrc6     369 - 369      altime7     370 - 371
      alunit7     372 - 372      aldura7     373 - 374
      aldurb7     375 - 375      alchrc7     376 - 376
      altime8     377 - 378      alunit8     379 - 379
      aldura8     380 - 381      aldurb8     382 - 382
      alchrc8     383 - 383      altime9     384 - 385
      alunit9     386 - 386      aldura9     387 - 388
      aldurb9     389 - 389      alchrc9     390 - 390
      altime10    391 - 392      alunit10    393 - 393
      aldura10    394 - 395      aldurb10    396 - 396
      alchrc10    397 - 397      altime11    398 - 399
      alunit11    400 - 400      aldura11    401 - 402
      aldurb11    403 - 403      alchrc11    404 - 404
      altime12    405 - 406      alunit12    407 - 407
      aldura12    408 - 409      aldurb12    410 - 410
      alchrc12    411 - 411      altime13    412 - 413
      alunit13    414 - 414      aldura13    415 - 416
      aldurb13    417 - 417      alchrc13    418 - 418
      atime14a    419 - 420      aunit14a    421 - 421
      adura14a    422 - 423      adurb14a    424 - 424
      achrc14a    425 - 425      altime15    426 - 427
      alunit15    428 - 428      aldura15    429 - 430
      aldurb15    431 - 431      alchrc15    432 - 432
      altime16    433 - 434      alunit16    435 - 435
      aldura16    436 - 437      aldurb16    438 - 438
      alchrc16    439 - 439      altime17    440 - 441
      alunit17    442 - 442      aldura17    443 - 444
      aldurb17    445 - 445      alchrc17    446 - 446
      altime18    447 - 448      alunit18    449 - 449
      aldura18    450 - 451      aldurb18    452 - 452
      alchrc18    453 - 453      altime19    454 - 455
      alunit19    456 - 456      aldura19    457 - 458
      aldurb19    459 - 459      alchrc19    460 - 460
      altime20    461 - 462      alunit20    463 - 463
      aldura20    464 - 465      aldurb20    466 - 466
      alchrc20    467 - 467      altime21    468 - 469
      alunit21    470 - 470      aldura21    471 - 472
      aldurb21    473 - 473      alchrc21    474 - 474
      altime22    475 - 476      alunit22    477 - 477
      aldura22    478 - 479      aldurb22    480 - 480
      alchrc22    481 - 481      altime23    482 - 483
      alunit23    484 - 484      aldura23    485 - 486
      aldurb23    487 - 487      alchrc23    488 - 488
      altime24    489 - 490      alunit24    491 - 491
      aldura24    492 - 493      aldurb24    494 - 494
      alchrc24    495 - 495      altime25    496 - 497
      alunit25    498 - 498      aldura25    499 - 500
      aldurb25    501 - 501      alchrc25    502 - 502
      altime26    503 - 504      alunit26    505 - 505
      aldura26    506 - 507      aldurb26    508 - 508
      alchrc26    509 - 509      altime27    510 - 511
      alunit27    512 - 512      aldura27    513 - 514
      aldurb27    515 - 515      alchrc27    516 - 516
      altime28    517 - 518      alunit28    519 - 519
      aldura28    520 - 521      aldurb28    522 - 522
      alchrc28    523 - 523      altime29    524 - 525
      alunit29    526 - 526      aldura29    527 - 528
      aldurb29    529 - 529      alchrc29    530 - 530
      altime30    531 - 532      alunit30    533 - 533
      aldura30    534 - 535      aldurb30    536 - 536
      alchrc30    537 - 537      altime31    538 - 539
      alunit31    540 - 540      aldura31    541 - 542
      aldurb31    543 - 543      alchrc31    544 - 544
      altime32    545 - 546      alunit32    547 - 547
      aldura32    548 - 549      aldurb32    550 - 550
      alchrc32    551 - 551      altime33    552 - 553
      alunit33    554 - 554      aldura33    555 - 556
      aldurb33    557 - 557      alchrc33    558 - 558
      altime34    559 - 560      alunit34    561 - 561
      aldura34    562 - 563      aldurb34    564 - 564
      alchrc34    565 - 565      altime90    566 - 567
      alunit90    568 - 568      aldura90    569 - 570
      aldurb90    571 - 571      alchrc90    572 - 572
      altime91    573 - 574      alunit91    575 - 575
      aldura91    576 - 577      aldurb91    578 - 578
      alchrc91    579 - 579      alcndrt     580 - 580
      alchronr    581 - 581

      smkev       582 - 582      smkreg      583 - 584
      smknow      585 - 585      smkstat2    586 - 586
      smkqtno     587 - 588      smkqttp     589 - 589
      smkqty      590 - 591      cigsda1     592 - 593
      cigdamo     594 - 595      cigsda2     596 - 597
      cigsday     598 - 599      cigqtyr     600 - 600
      vigno       601 - 603      vigtp       604 - 604
      vigfreqw    605 - 606      viglngno    607 - 609
      viglngtp    610 - 610      vigmin      611 - 613
      modno       614 - 616      modtp       617 - 617
      modfreqw    618 - 619      modlngno    620 - 622
      modlngtp    623 - 623      modmin      624 - 626
      strngno     627 - 629      strngtp     630 - 630
      strfreqw    631 - 632      dishfac     633 - 633
      dishfl02    634 - 634      dishfl03    635 - 635
      dishfl04    636 - 636      dishfl05    637 - 637
      dishfl06    638 - 638      dishfl07    639 - 639
      alc1yr      640 - 640      alclife     641 - 641
      alc12mno    642 - 644      alc12mtp    645 - 645
      alc12mwk    646 - 647      alc12myr    648 - 650
      alcamt      651 - 652      alcstat     653 - 654
      alc5upno    655 - 657      alc5uptp    658 - 658
      alc5upyr    659 - 661      aheight     662 - 663
      aweightp    664 - 666      bmi         667 - 670
      sleep       671 - 672

      ausualpl    673 - 673      aplkind     674 - 674
      ahcplrou    675 - 675      ahcplknd    676 - 676
      ahcchgyr    677 - 677      ahcchghi    678 - 678
      anouspl1    679 - 679      anouspl2    680 - 680
      anouspl3    681 - 681      anouspl4    682 - 682
      anouspl5    683 - 683      anouspl6    684 - 684
      anouspl7    685 - 685      anouspl8    686 - 686
      anouspl9    687 - 687      aprvtryr    688 - 688
      aprvtrfd    689 - 689      adrnanp     690 - 690
      adrnai      691 - 691      ahcdlyr1    692 - 692
      ahcdlyr2    693 - 693      ahcdlyr3    694 - 694
      ahcdlyr4    695 - 695      ahcdlyr5    696 - 696
      ahcafyr1    697 - 697      ahcafyr2    698 - 698
      ahcafyr3    699 - 699      ahcafyr4    700 - 700
      ahcafyr5    701 - 701      ahcafyr6    702 - 702
      aworpay     703 - 703      ahicomp     704 - 704
      arxpr_1     705 - 705      arxpr_2     706 - 706
      arxpr_3     707 - 707      arxpr_4     708 - 708
      arxpr_5     709 - 709      arxpr_6     710 - 710
      adnlong2    711 - 711      ahcsyr1     712 - 712
      ahcsyr2     713 - 713      ahcsyr3     714 - 714
      ahcsyr4     715 - 715      ahcsyr5     716 - 716
      ahcsyr6     717 - 717      ahcsyr7     718 - 718
      ahcsyr8     719 - 719      ahcsyr9     720 - 720
      ahcsyr10    721 - 721      ahernoy2    722 - 723
      aervisnd    724 - 724      aerhos      725 - 725
      aerreas1    726 - 726      aerreas2    727 - 727
      aerreas3    728 - 728      aerreas4    729 - 729
      aerreas5    730 - 730      aerreas6    731 - 731
      aerreas7    732 - 732      aerreas8    733 - 733
      ahchyr      734 - 734      ahchmoyr    735 - 736
      ahchnoy2    737 - 738      ahcnoyr2    739 - 740
      asrgyr      741 - 741      asrgnoyr    742 - 743
      amdlongr    744 - 744      avislast    745 - 745
      alasttyp    746 - 746      avisaptn    747 - 748
      avisaptt    749 - 749      awaitrmn    750 - 751
      awaitrmt    752 - 752      hit1a       753 - 753
      hit2a       754 - 754      hit3a       755 - 755
      hit4a       756 - 756      hit5a       757 - 757
      shtflu2     758 - 758      ashflum2    759 - 760
      ashfluy2    761 - 764      sprflu2     765 - 765
      aspflum2    766 - 767      aspfluy2    768 - 771
      shtpnuyr    772 - 772      apox        773 - 773
      apox12mo    774 - 774      ahep        775 - 775
      ahepliv     776 - 776      shthepb     777 - 777
      shepdos     778 - 778      shthepa     779 - 779
      shepanum    780 - 781      shingles    782 - 782
      shttd       783 - 783      shttd05     784 - 784
      shttdap     785 - 785      hpvhrd      786 - 786
      shhpvhd1    787 - 787      shthpv1     788 - 788
      shhpvdos    789 - 790      livev       791 - 791
      travel      792 - 792      wrkhlth     793 - 793
      wrkdir      794 - 794      apsbpchk    795 - 795
      apschchk    796 - 796      apsbschk    797 - 797
      apspap      798 - 798      apsmam      799 - 799
      apscol      800 - 800      apsdiet     801 - 801
      apssmkc     802 - 802      ltcfam      803 - 803
      ltchelp     804 - 804      ltcwho1     805 - 805
      ltcwho2     806 - 806      ltcwho3     807 - 807
      ltcwho4     808 - 808      ltcwho5     809 - 809
      ltcprch     810 - 810      ltcpay      811 - 812
      ltc100m     813 - 813      aindins     814 - 814
      aindprch    815 - 815      aindwho     816 - 816
      ainddif1    817 - 817      ainddif2    818 - 818
      aindeny1    819 - 819      aindeny2    820 - 820
      aindeny3    821 - 821      aindnot1    822 - 822
      aindnot2    823 - 823      aindnot3    824 - 824
      aindnot4    825 - 825      aindnot5    826 - 826
      hivtst1     827 - 827

using "$DAT/2011/samadult.dat";
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
ASD.150_00.000: Paid by the hour at current/most recent job";
label variable pdsicka  "
ASD.160_00.000: Paid sick leave at current/most recent job";
label variable onejob   "ASD.170_00.000: Have more than one job";
label variable wrklyr4  "ASD.210_00.000: Work status: last week, past 12 months
";

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
label variable dishfac  "AHB.135_00.010: Access to hlth club/fitness facility";
label variable dishfl02 "AHB.136_01.010: Cost too high";
label variable dishfl03 "AHB.136_02.020: Lack of staff who understand needs";
label variable dishfl04 "AHB.136_03.030: Lack of exercise equip that meets needs
";
label variable dishfl05 "AHB.136_04.040: Access into/within the building";
label variable dishfl06 "AHB.136_05.050: Inadequate transportation";
label variable dishfl07 "AHB.136_06.060: Some other barrier";
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
label variable ahcafyr5 "AAU.111_05.010: Couldn't afford a specialist, past 12 m
";
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
label variable aerreas1 "AAU.248_01.010: Didn't have another place to go";
label variable aerreas2 "AAU.248_02.020: Doctor's office or clinic not open";
label variable aerreas3 "AAU.248_03.030: Advised by health provider to go to ER
";
label variable aerreas4 "
AAU.248_04.040: Problem too serious for doctor's office/clinic";
label variable aerreas5 "AAU.248_05.050: Only hospital could help";
label variable aerreas6 "AAU.248_06.060: ER is closest provider";
label variable aerreas7 "AAU.248_07.070: ER is usual place to get care";
label variable aerreas8 "
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
label variable alasttyp "
AAU.306_00.020: Doctor/specialist/someone else seen on last visit";
label variable avisaptn "AAU.307_01.010: Appointment wait time-number";
label variable avisaptt "AAU.307_02.020: Appointment wait time-time period";
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
label variable shttdap  "
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
label variable wrkhlth  "
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
label variable ltcprch  "
AAU.586_00.010: Interested in purchasing government insurance for ADL help";
label variable ltcpay   "
AAU.588_00.010: Amount willing to pay for government insurance for ADL help";
label variable ltc100m  "
AAU.590_00.010: Willing to pay $100 mo for government insurance for ADL help";
label variable aindins  "
AAU.600_00.010: Tried to purchase health insurance directly, past 3 yrs";
label variable aindprch "
AAU.600_00.020: Purchased health insurance directly, past 3 yrs";
label variable aindwho  "
AAU.600_00.030: For whom was health insurance purchased, past 3 yrs";
label variable ainddif1 "
AAU.600_00.040: How difficult to find health insurance for coverage needed";
label variable ainddif2 "
AAU.600_00.050: How difficult to find affordable health insurance";
label variable aindeny1 "AAU.600_01.060: Turned down for coverage";
label variable aindeny2 "
AAU.600_02.060: Charged higher price for coverage because of health";
label variable aindeny3 "
AAU.600_03.060: Specific health problem excluded from coverage";
label variable aindnot1 "AAU.601_01.070: Didn’t buy plan because turned down";
label variable aindnot2 "AAU.601_02.070: Didn’t buy plan because of cost";
label variable aindnot3 "
AAU.601_03.070: Didn’t buy plan because of pre-existing condition";
label variable aindnot4 "
AAU.601_04.070: Didn’t buy plan because got health insurance from other source";
label variable aindnot5 "AAU.601_05.070: Other reason didn't buy plan";
label variable hivtst1  "AAU.700_00.000: Ever been tested for HIV";

* DEFINE VALUE LABELS FOR REPORTS;

label define sap001x
   10       "10 Household"
   20       "20 Person"
   25       "25 Income Imputation"
   30       "30 Sample Adult"
   31       "31 Sample Adult Cancer"
   38       "38 Functioning and Disability"
   39       "39 Adult Disability Questions Test"
   40       "40 Sample Child"
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
   1        "
1 Families selected to receive ADB (sample adults) and CDB (sample children 1-17
 years) sections"
   2        "
2 Families selected to receive FDB (all persons 1 year and older) and AFD (sampl
e adults) sections"
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
label define sap056x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap087x
   85       "85 85+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap117x
   1        "1 Yes"
   2        "2 No"
   3        "3 Borderline"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap120x
   00       "00 Within past year"
   85       "85 85+ years"
   96       "96 1+ year(s) with diabetes and age is 85+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap160x
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
label define sap164x
   1        "1 ALL of the time"
   2        "2 MOST of the time"
   3        "3 SOME of the time"
   4        "4 A LITTLE of the time"
   5        "5 NONE of the time"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap170x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap171x
   000      "000 None"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap173x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap175x
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
label define sap187x
   1        "1 Limited in any way"
   2        "2 Not limited in any way"
   3        "3 Unknown if limited"
;
label define sap224x
   95       "95 95+"
   96       "96 Since birth"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap225x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   6        "6 Since birth"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap226x
   00       "00 Less than 1 year"
   85       "85 85+ years"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap227x
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap228x
   1        "1 Chronic"
   2        "2 Not chronic"
   9        "9 Unknown if chronic"
;
label define sap404x
   1        "1 At least one condition causing functional limitation is chronic"
   2        "2 No condition causing functional limitation"
   9        "9 Unknown if any condition causing functional limitation is chronic
"
;
label define sap405x
   0        "0 Not limited in any way (including unknown if limited)"
   1        "1 Limited; caused by at least one chronic condition"
   2        "2 Limited; not caused by chronic condition"
   3        "3 Limited; unknown if condition is chronic"
;
label define sap407x
   85       "85 85 years or older"
   96       "96 Never smoked regularly"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap408x
   1        "1 Every day"
   2        "2 Some days"
   3        "3 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap409x
   1        "1 Current every day smoker"
   2        "2 Current some day smoker"
   3        "3 Former smoker"
   4        "4 Never smoker"
   5        "5 Smoker, current status unknown"
   9        "9 Unknown if ever smoked"
;
label define sap410x
   95       "95 95+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap411x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap412x
   00       "00 Less than 1 year"
   70       "70 70+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap413x
   95       "95 95+ cigarettes"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap414x
   00       "00 None"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap418x
   000      "000 Never"
   996      "996 Unable to do this type activity"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap419x
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
label define sap420x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do vigorous activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap421x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap422x
   1        "1 Minutes"
   2        "2 Hours"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap426x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do light or moderate activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap432x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do strength activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap442x
   000      "000 Never"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap443x
   0        "0 Never/None"
   1        "1 Week"
   2        "2 Month"
   3        "3 Year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap444x
   00       "00 Less than one day per week"
   95       "95 Did not drink in past year"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap445x
   000      "000 Never/none"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap446x
   95       "95 95+ drinks"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap447x
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
label define sap449x
   0        "0 Never/None"
   1        "1 Per week"
   2        "2 Per month"
   3        "3 Per year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap451x
   96       "96 Not available"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap452x
   996      "996 Not available"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap454x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap455x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap456x
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
label define sap458x
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
label define sap461x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap471x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap473x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t' know"
;
label define sap485x
   1        "1 Very worried"
   2        "2 Somewhat worried"
   3        "3 Not at all worried"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap493x
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
label define sap504x
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
label define sap517x
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
label define sap520x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap522x
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
label define sap523x
   1        "1 General doctor"
   2        "2 Specialist"
   3        "3 Someone else"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap524x
   00       "00 Same day"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don’t know"
;
label define sap525x
   1        "1 Days"
   2        "2 Weeks"
   3        "3 Months"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap526x
   00       "00 No time"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don’t know"
;
label define sap527x
   1        "1 Minutes"
   2        "2 Hours"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap534x
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
label define sap535x
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define sap545x
   1        "1 Received at least 3 doses"
   2        "2 Received less than 3 doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap547x
   96       "96 Received all shots"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap551x
   1        "1 Yes-included pertussis"
   2        "2 No-did not include pertussis"
   3        "3 Doctor did not say"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap554x
   1        "1 Yes"
   2        "2 No"
   3        "3 Doctor refused when asked"
   7        "7 Refused"
   8        "8 Not Ascertained"
   9        "9 Don't know"
;
label define sap555x
   50       "50 50+ shots"
   96       "96 All shots"
   97       "97 Refused"
   98       "98 Not Ascertained"
   99       "99 Don't know"
;
label define sap569x
   1        "1 Very likely"
   2        "2 Somewhat likely"
   3        "3 Somewhat unlikely"
   4        "4 Very unlikely"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap576x
   01       "01 $1-$24 per month"
   02       "02 $25-$49 per month"
   03       "03 $50-$74 per month"
   04       "04 $75-$99 per month"
   05       "05 $100-$124 per month"
   06       "06 $125 per month or more"
   07       "07 Nothing/Not interested in the program"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don’t know"
;
label define sap580x
   1        "1 Self"
   2        "2 Someone else in family"
   3        "3 Both"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
;
label define sap581x
   1        "1 Very difficult"
   2        "2 Somewhat difficult"
   3        "3 Not at all difficult"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don’t know"
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
label values chdev     sap027x;   label values angev     sap027x;
label values miev      sap027x;   label values hrtev     sap027x;
label values strev     sap027x;   label values ephev     sap027x;
label values aasmev    sap027x;   label values aasstill  sap027x;
label values aasmyr    sap027x;   label values aaseryr1  sap027x;
label values ulcev     sap027x;   label values ulcyr     sap027x;
label values canev     sap027x;   label values cnkind1   sap056x;
label values cnkind2   sap056x;   label values cnkind3   sap056x;
label values cnkind4   sap056x;   label values cnkind5   sap056x;
label values cnkind6   sap056x;   label values cnkind7   sap056x;
label values cnkind8   sap056x;   label values cnkind9   sap056x;
label values cnkind10  sap056x;   label values cnkind11  sap056x;
label values cnkind12  sap056x;   label values cnkind13  sap056x;
label values cnkind14  sap056x;   label values cnkind15  sap056x;
label values cnkind16  sap056x;   label values cnkind17  sap056x;
label values cnkind18  sap056x;   label values cnkind19  sap056x;
label values cnkind20  sap056x;   label values cnkind21  sap056x;
label values cnkind22  sap056x;   label values cnkind23  sap056x;
label values cnkind24  sap056x;   label values cnkind25  sap056x;
label values cnkind26  sap056x;   label values cnkind27  sap056x;
label values cnkind28  sap056x;   label values cnkind29  sap056x;
label values cnkind30  sap056x;   label values cnkind31  sap056x;
label values canage1   sap087x;   label values canage2   sap087x;
label values canage3   sap087x;   label values canage4   sap087x;
label values canage5   sap087x;   label values canage6   sap087x;
label values canage7   sap087x;   label values canage8   sap087x;
label values canage9   sap087x;   label values canage10  sap087x;
label values canage11  sap087x;   label values canage12  sap087x;
label values canage13  sap087x;   label values canage14  sap087x;
label values canage15  sap087x;   label values canage16  sap087x;
label values canage17  sap087x;   label values canage18  sap087x;
label values canage19  sap087x;   label values canage20  sap087x;
label values canage21  sap087x;   label values canage22  sap087x;
label values canage23  sap087x;   label values canage24  sap087x;
label values canage25  sap087x;   label values canage26  sap087x;
label values canage27  sap087x;   label values canage28  sap087x;
label values canage29  sap087x;   label values canage30  sap087x;
label values dibev     sap117x;   label values dibpre1   sap027x;
label values dibage    sap087x;   label values difage2   sap120x;
label values insln     sap027x;   label values dibpill   sap027x;
label values ahayfyr   sap027x;   label values sinyr     sap027x;
label values cbrchyr   sap027x;   label values kidwkyr   sap027x;
label values livyr     sap027x;   label values jntsymp   sap027x;
label values jmthp1    sap056x;   label values jmthp2    sap056x;
label values jmthp3    sap056x;   label values jmthp4    sap056x;
label values jmthp5    sap056x;   label values jmthp6    sap056x;
label values jmthp7    sap056x;   label values jmthp8    sap056x;
label values jmthp9    sap056x;   label values jmthp10   sap056x;
label values jmthp11   sap056x;   label values jmthp12   sap056x;
label values jmthp13   sap056x;   label values jmthp14   sap056x;
label values jmthp15   sap056x;   label values jmthp16   sap056x;
label values jmthp17   sap056x;   label values jntchr    sap027x;
label values jnthp     sap027x;   label values arth1     sap027x;
label values arthlmt   sap027x;   label values paineck   sap027x;
label values painlb    sap027x;   label values painleg   sap027x;
label values painface  sap027x;   label values amigr     sap027x;
label values acold2w   sap027x;   label values aintil2w  sap027x;
label values pregnow   sap027x;   label values hraidnow  sap027x;
label values hraidev   sap027x;   label values ahearst1  sap160x;
label values avision   sap027x;   label values ablind    sap027x;
label values lupprt    sap027x;   label values sad       sap164x;
label values nervous   sap164x;   label values restless  sap164x;
label values hopeless  sap164x;   label values effort    sap164x;
label values worthls   sap164x;   label values mhamtmo   sap170x;

label values wkdayr    sap171x;   label values beddayr   sap171x;
label values ahstatyr  sap173x;   label values speceq    sap027x;
label values flwalk    sap175x;   label values flclimb   sap175x;
label values flstand   sap175x;   label values flsit     sap175x;
label values flstoop   sap175x;   label values flreach   sap175x;
label values flgrasp   sap175x;   label values flcarry   sap175x;
label values flpush    sap175x;   label values flshop    sap175x;
label values flsocl    sap175x;   label values flrelax   sap175x;
label values fla1ar    sap187x;   label values aflhca1   sap056x;
label values aflhca2   sap056x;   label values aflhca3   sap056x;
label values aflhca4   sap056x;   label values aflhca5   sap056x;
label values aflhca6   sap056x;   label values aflhca7   sap056x;
label values aflhca8   sap056x;   label values aflhca9   sap056x;
label values aflhca10  sap056x;   label values aflhca11  sap056x;
label values aflhca12  sap056x;   label values aflhca13  sap056x;
label values alhca14a  sap056x;   label values aflhca15  sap056x;
label values aflhca16  sap056x;   label values aflhca17  sap056x;
label values aflhca18  sap056x;   label values aflhc19_  sap056x;
label values aflhc20_  sap056x;   label values aflhc21_  sap056x;
label values aflhc22_  sap056x;   label values aflhc23_  sap056x;
label values aflhc24_  sap056x;   label values aflhc25_  sap056x;
label values aflhc26_  sap056x;   label values aflhc27_  sap056x;
label values aflhc28_  sap056x;   label values aflhc29_  sap056x;
label values aflhc30_  sap056x;   label values aflhc31_  sap056x;
label values aflhc32_  sap056x;   label values aflhc33_  sap056x;
label values aflhc34_  sap056x;   label values aflhca90  sap056x;
label values aflhca91  sap056x;   label values altime1   sap224x;
label values alunit1   sap225x;   label values aldura1   sap226x;
label values aldurb1   sap227x;   label values alchrc1   sap228x;
label values altime2   sap224x;   label values alunit2   sap225x;
label values aldura2   sap226x;   label values aldurb2   sap227x;
label values alchrc2   sap228x;   label values altime3   sap224x;
label values alunit3   sap225x;   label values aldura3   sap226x;
label values aldurb3   sap227x;   label values alchrc3   sap228x;
label values altime4   sap224x;   label values alunit4   sap225x;
label values aldura4   sap226x;   label values aldurb4   sap227x;
label values alchrc4   sap228x;   label values altime5   sap224x;
label values alunit5   sap225x;   label values aldura5   sap226x;
label values aldurb5   sap227x;   label values alchrc5   sap228x;
label values altime6   sap224x;   label values alunit6   sap225x;
label values aldura6   sap226x;   label values aldurb6   sap227x;
label values alchrc6   sap228x;   label values altime7   sap224x;
label values alunit7   sap225x;   label values aldura7   sap226x;
label values aldurb7   sap227x;   label values alchrc7   sap228x;
label values altime8   sap224x;   label values alunit8   sap225x;
label values aldura8   sap226x;   label values aldurb8   sap227x;
label values alchrc8   sap228x;   label values altime9   sap224x;
label values alunit9   sap225x;   label values aldura9   sap226x;
label values aldurb9   sap227x;   label values alchrc9   sap228x;
label values altime10  sap224x;   label values alunit10  sap225x;
label values aldura10  sap226x;   label values aldurb10  sap227x;
label values alchrc10  sap228x;   label values altime11  sap224x;
label values alunit11  sap225x;   label values aldura11  sap226x;
label values aldurb11  sap227x;   label values alchrc11  sap228x;
label values altime12  sap224x;   label values alunit12  sap225x;
label values aldura12  sap226x;   label values aldurb12  sap227x;
label values alchrc12  sap228x;   label values altime13  sap224x;
label values alunit13  sap225x;   label values aldura13  sap226x;
label values aldurb13  sap227x;   label values alchrc13  sap228x;
label values atime14a  sap224x;   label values aunit14a  sap225x;
label values adura14a  sap226x;   label values adurb14a  sap227x;
label values achrc14a  sap228x;   label values altime15  sap224x;
label values alunit15  sap225x;   label values aldura15  sap226x;
label values aldurb15  sap227x;   label values alchrc15  sap228x;
label values altime16  sap224x;   label values alunit16  sap225x;
label values aldura16  sap226x;   label values aldurb16  sap227x;
label values alchrc16  sap228x;   label values altime17  sap224x;
label values alunit17  sap225x;   label values aldura17  sap226x;
label values aldurb17  sap227x;   label values alchrc17  sap228x;
label values altime18  sap224x;   label values alunit18  sap225x;
label values aldura18  sap226x;   label values aldurb18  sap227x;
label values alchrc18  sap228x;   label values altime19  sap224x;
label values alunit19  sap225x;   label values aldura19  sap226x;
label values aldurb19  sap227x;   label values alchrc19  sap228x;
label values altime20  sap224x;   label values alunit20  sap225x;
label values aldura20  sap226x;   label values aldurb20  sap227x;
label values alchrc20  sap228x;   label values altime21  sap224x;
label values alunit21  sap225x;   label values aldura21  sap226x;
label values aldurb21  sap227x;   label values alchrc21  sap228x;
label values altime22  sap224x;   label values alunit22  sap225x;
label values aldura22  sap226x;   label values aldurb22  sap227x;
label values alchrc22  sap228x;   label values altime23  sap224x;
label values alunit23  sap225x;   label values aldura23  sap226x;
label values aldurb23  sap227x;   label values alchrc23  sap228x;
label values altime24  sap224x;   label values alunit24  sap225x;
label values aldura24  sap226x;   label values aldurb24  sap227x;
label values alchrc24  sap228x;   label values altime25  sap224x;
label values alunit25  sap225x;   label values aldura25  sap226x;
label values aldurb25  sap227x;   label values alchrc25  sap228x;
label values altime26  sap224x;   label values alunit26  sap225x;
label values aldura26  sap226x;   label values aldurb26  sap227x;
label values alchrc26  sap228x;   label values altime27  sap224x;
label values alunit27  sap225x;   label values aldura27  sap226x;
label values aldurb27  sap227x;   label values alchrc27  sap228x;
label values altime28  sap224x;   label values alunit28  sap225x;
label values aldura28  sap226x;   label values aldurb28  sap227x;
label values alchrc28  sap228x;   label values altime29  sap224x;
label values alunit29  sap225x;   label values aldura29  sap226x;
label values aldurb29  sap227x;   label values alchrc29  sap228x;
label values altime30  sap224x;   label values alunit30  sap225x;
label values aldura30  sap226x;   label values aldurb30  sap227x;
label values alchrc30  sap228x;   label values altime31  sap224x;
label values alunit31  sap225x;   label values aldura31  sap226x;
label values aldurb31  sap227x;   label values alchrc31  sap228x;
label values altime32  sap224x;   label values alunit32  sap225x;
label values aldura32  sap226x;   label values aldurb32  sap227x;
label values alchrc32  sap228x;   label values altime33  sap224x;
label values alunit33  sap225x;   label values aldura33  sap226x;
label values aldurb33  sap227x;   label values alchrc33  sap228x;
label values altime34  sap224x;   label values alunit34  sap225x;
label values aldura34  sap226x;   label values aldurb34  sap227x;
label values alchrc34  sap228x;   label values altime90  sap224x;
label values alunit90  sap225x;   label values aldura90  sap226x;
label values aldurb90  sap227x;   label values alchrc90  sap228x;
label values altime91  sap224x;   label values alunit91  sap225x;
label values aldura91  sap226x;   label values aldurb91  sap227x;
label values alchrc91  sap228x;   label values alcndrt   sap404x;
label values alchronr  sap405x;

label values smkev     sap027x;   label values smkreg    sap407x;
label values smknow    sap408x;   label values smkstat2  sap409x;
label values smkqtno   sap410x;   label values smkqttp   sap411x;
label values smkqty    sap412x;   label values cigsda1   sap413x;
label values cigdamo   sap414x;   label values cigsda2   sap413x;
label values cigsday   sap413x;   label values cigqtyr   sap027x;
label values vigno     sap418x;   label values vigtp     sap419x;
label values vigfreqw  sap420x;   label values viglngno  sap421x;
label values viglngtp  sap422x;   label values vigmin    sap421x;
label values modno     sap418x;   label values modtp     sap419x;
label values modfreqw  sap426x;   label values modlngno  sap421x;
label values modlngtp  sap422x;   label values modmin    sap421x;
label values strngno   sap418x;   label values strngtp   sap419x;
label values strfreqw  sap432x;   label values dishfac   sap027x;
label values dishfl02  sap027x;   label values dishfl03  sap027x;
label values dishfl04  sap027x;   label values dishfl05  sap027x;
label values dishfl06  sap027x;   label values dishfl07  sap027x;
label values alc1yr    sap027x;   label values alclife   sap027x;
label values alc12mno  sap442x;   label values alc12mtp  sap443x;
label values alc12mwk  sap444x;   label values alc12myr  sap445x;
label values alcamt    sap446x;   label values alcstat   sap447x;
label values alc5upno  sap445x;   label values alc5uptp  sap449x;
label values alc5upyr  sap445x;   label values aheight   sap451x;
label values aweightp  sap452x;   label values sleep     sap454x;

label values ausualpl  sap455x;   label values aplkind   sap456x;
label values ahcplrou  sap027x;   label values ahcplknd  sap458x;
label values ahcchgyr  sap027x;   label values ahcchghi  sap027x;
label values anouspl1  sap461x;   label values anouspl2  sap461x;
label values anouspl3  sap461x;   label values anouspl4  sap461x;
label values anouspl5  sap461x;   label values anouspl6  sap461x;
label values anouspl7  sap461x;   label values anouspl8  sap461x;
label values anouspl9  sap461x;   label values aprvtryr  sap027x;
label values aprvtrfd  sap471x;   label values adrnanp   sap471x;
label values adrnai    sap473x;   label values ahcdlyr1  sap027x;
label values ahcdlyr2  sap027x;   label values ahcdlyr3  sap027x;
label values ahcdlyr4  sap027x;   label values ahcdlyr5  sap027x;
label values ahcafyr1  sap027x;   label values ahcafyr2  sap027x;
label values ahcafyr3  sap027x;   label values ahcafyr4  sap027x;
label values ahcafyr5  sap471x;   label values ahcafyr6  sap471x;
label values aworpay   sap485x;   label values ahicomp   sap173x;
label values arxpr_1   sap027x;   label values arxpr_2   sap471x;
label values arxpr_3   sap027x;   label values arxpr_4   sap027x;
label values arxpr_5   sap027x;   label values arxpr_6   sap027x;
label values adnlong2  sap493x;   label values ahcsyr1   sap027x;
label values ahcsyr2   sap027x;   label values ahcsyr3   sap027x;
label values ahcsyr4   sap027x;   label values ahcsyr5   sap027x;
label values ahcsyr6   sap027x;   label values ahcsyr7   sap027x;
label values ahcsyr8   sap027x;   label values ahcsyr9   sap027x;
label values ahcsyr10  sap027x;   label values ahernoy2  sap504x;
label values aervisnd  sap027x;   label values aerhos    sap027x;
label values aerreas1  sap027x;   label values aerreas2  sap027x;
label values aerreas3  sap027x;   label values aerreas4  sap027x;
label values aerreas5  sap027x;   label values aerreas6  sap027x;
label values aerreas7  sap471x;   label values aerreas8  sap471x;
label values ahchyr    sap027x;   label values ahchmoyr  sap454x;
label values ahchnoy2  sap517x;   label values ahcnoyr2  sap504x;
label values asrgyr    sap027x;   label values asrgnoyr  sap520x;
label values amdlongr  sap493x;   label values avislast  sap522x;
label values alasttyp  sap523x;   label values avisaptn  sap524x;
label values avisaptt  sap525x;   label values awaitrmn  sap526x;
label values awaitrmt  sap527x;   label values hit1a     sap471x;
label values hit2a     sap027x;   label values hit3a     sap027x;
label values hit4a     sap471x;   label values hit5a     sap471x;
label values shtflu2   sap027x;   label values ashflum2  sap534x;
label values ashfluy2  sap535x;   label values sprflu2   sap027x;
label values aspflum2  sap534x;   label values aspfluy2  sap535x;
label values shtpnuyr  sap027x;   label values apox      sap027x;
label values apox12mo  sap027x;   label values ahep      sap027x;
label values ahepliv   sap027x;   label values shthepb   sap027x;
label values shepdos   sap545x;   label values shthepa   sap027x;
label values shepanum  sap547x;   label values shingles  sap027x;
label values shttd     sap027x;   label values shttd05   sap027x;
label values shttdap   sap551x;   label values hpvhrd    sap027x;
label values shhpvhd1  sap027x;   label values shthpv1   sap554x;
label values shhpvdos  sap555x;   label values livev     sap027x;
label values travel    sap027x;   label values wrkhlth   sap027x;
label values wrkdir    sap027x;   label values apsbpchk  sap027x;
label values apschchk  sap027x;   label values apsbschk  sap027x;
label values apspap    sap027x;   label values apsmam    sap027x;
label values apscol    sap471x;   label values apsdiet   sap027x;
label values apssmkc   sap471x;   label values ltcfam    sap471x;
label values ltchelp   sap569x;   label values ltcwho1   sap461x;
label values ltcwho2   sap461x;   label values ltcwho3   sap461x;
label values ltcwho4   sap461x;   label values ltcwho5   sap461x;
label values ltcprch   sap471x;   label values ltcpay    sap576x;
label values ltc100m   sap569x;   label values aindins   sap471x;
label values aindprch  sap471x;   label values aindwho   sap580x;
label values ainddif1  sap581x;   label values ainddif2  sap581x;
label values aindeny1  sap471x;   label values aindeny2  sap471x;
label values aindeny3  sap471x;   label values aindnot1  sap461x;
label values aindnot2  sap461x;   label values aindnot3  sap461x;
label values aindnot4  sap461x;   label values aindnot5  sap461x;
label values hivtst1   sap027x;

save "$OUT/2011/samadult", replace;

#delimit cr
log close
