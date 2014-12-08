log using "$LOG/samadult.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 MAY 31, 2007  9:28 AM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2006 NHIS Public Use Sample Adult ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE samadult.dta AND samadult.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2006\

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
      chdev        78 -  78      angev        79 -  79
      miev         80 -  80      hrtev        81 -  81
      strev        82 -  82      ephev        83 -  83
      astdo        84 -  84      aasmev       85 -  85
      aasstill     86 -  86      aasmyr       87 -  87
      aasmeryr     88 -  88      ulcev        89 -  89
      ulcyr        90 -  90      canev        91 -  91
      cnkind1      92 -  92      cnkind2      93 -  93
      cnkind3      94 -  94      cnkind4      95 -  95
      cnkind5      96 -  96      cnkind6      97 -  97
      cnkind7      98 -  98      cnkind8      99 -  99
      cnkind9     100 - 100      cnkind10    101 - 101
      cnkind11    102 - 102      cnkind12    103 - 103
      cnkind13    104 - 104      cnkind14    105 - 105
      cnkind15    106 - 106      cnkind16    107 - 107
      cnkind17    108 - 108      cnkind18    109 - 109
      cnkind19    110 - 110      cnkind20    111 - 111
      cnkind21    112 - 112      cnkind22    113 - 113
      cnkind23    114 - 114      cnkind24    115 - 115
      cnkind25    116 - 116      cnkind26    117 - 117
      cnkind27    118 - 118      cnkind28    119 - 119
      cnkind29    120 - 120      cnkind30    121 - 121
      cnkind31    122 - 122      canage1     123 - 124
      canage2     125 - 126      canage3     127 - 128
      canage4     129 - 130      canage5     131 - 132
      canage6     133 - 134      canage7     135 - 136
      canage8     137 - 138      canage9     139 - 140
      canage10    141 - 142      canage11    143 - 144
      canage12    145 - 146      canage13    147 - 148
      canage14    149 - 150      canage15    151 - 152
      canage16    153 - 154      canage17    155 - 156
      canage18    157 - 158      canage19    159 - 160
      canage20    161 - 162      canage21    163 - 164
      canage22    165 - 166      canage23    167 - 168
      canage24    169 - 170      canage25    171 - 172
      canage26    173 - 174      canage27    175 - 176
      canage28    177 - 178      canage29    179 - 180
      canage30    181 - 182      dibev       183 - 183
      dibage      184 - 185      difage2     186 - 187
      dibpre      188 - 188      dibifg      189 - 189
      dibigt      190 - 190      dibbord     191 - 191
      dibhbs      192 - 192      insln       193 - 193
      dibpill     194 - 194      gdm         195 - 195
      gdmage      196 - 198      gdm_o       199 - 199
      gdm_oage    200 - 202      dibbtst     203 - 203
      dibrisk     204 - 204      ahayfyr     205 - 205
      sinyr       206 - 206      cbrchyr     207 - 207
      kidwkyr     208 - 208      livyr       209 - 209
      jntsymp     210 - 210      jmthp1      211 - 211
      jmthp2      212 - 212      jmthp3      213 - 213
      jmthp4      214 - 214      jmthp5      215 - 215
      jmthp6      216 - 216      jmthp7      217 - 217
      jmthp8      218 - 218      jmthp9      219 - 219
      jmthp10     220 - 220      jmthp11     221 - 221
      jmthp12     222 - 222      jmthp13     223 - 223
      jmthp14     224 - 224      jmthp15     225 - 225
      jmthp16     226 - 226      jmthp17     227 - 227
      jntpn       228 - 229      jntchr      230 - 230
      jnthp       231 - 231      arth1       232 - 232
      arthwt      233 - 233      arthph      234 - 234
      arthcls     235 - 235      arthlmt     236 - 236
      arthwrk     237 - 237      paineck     238 - 238
      painlb      239 - 239      painleg     240 - 240
      painface    241 - 241      amigr       242 - 242
      acold2w     243 - 243      aintil2w    244 - 244
      pregnow     245 - 245      hearaid     246 - 246
      ahearst     247 - 247      avision     248 - 248
      ablind      249 - 249      lupprt      250 - 250
      sad         251 - 251      nervous     252 - 252
      restless    253 - 253      hopeless    254 - 254
      effort      255 - 255      worthls     256 - 256
      mhamtmo     257 - 257      hpwtyr      258 - 258
      hppayr      259 - 259      hpdietyr    260 - 260
      smwtyr      261 - 261      smpayr      262 - 262
      smdietyr    263 - 263

      wrklyr3     264 - 264      wkdayr      265 - 267
      beddayr     268 - 270      ahstatyr    271 - 271
      speceq      272 - 272      flwalk      273 - 273
      flclimb     274 - 274      flstand     275 - 275
      flsit       276 - 276      flstoop     277 - 277
      flreach     278 - 278      flgrasp     279 - 279
      flcarry     280 - 280      flpush      281 - 281
      flshop      282 - 282      flsocl      283 - 283
      flrelax     284 - 284      fla1ar      285 - 285
      aflhca1     286 - 286      aflhca2     287 - 287
      aflhca3     288 - 288      aflhca4     289 - 289
      aflhca5     290 - 290      aflhca6     291 - 291
      aflhca7     292 - 292      aflhca8     293 - 293
      aflhca9     294 - 294      aflhca10    295 - 295
      aflhca11    296 - 296      aflhca12    297 - 297
      aflhca13    298 - 298      aflhca14    299 - 299
      aflhca15    300 - 300      aflhca16    301 - 301
      aflhca17    302 - 302      aflhca18    303 - 303
      aflhc19_    304 - 304      aflhc20_    305 - 305
      aflhc21_    306 - 306      aflhc22_    307 - 307
      aflhc23_    308 - 308      aflhc24_    309 - 309
      aflhc25_    310 - 310      aflhc26_    311 - 311
      aflhc27_    312 - 312      aflhc28_    313 - 313
      aflhc29_    314 - 314      aflhc30_    315 - 315
      aflhc31_    316 - 316      aflhc32_    317 - 317
      aflhc33_    318 - 318      aflhc34_    319 - 319
      aflhca90    320 - 320      aflhca91    321 - 321
      altime1     322 - 323      alunit1     324 - 324
      aldura1     325 - 326      aldurb1     327 - 327
      alchrc1     328 - 328      altime2     329 - 330
      alunit2     331 - 331      aldura2     332 - 333
      aldurb2     334 - 334      alchrc2     335 - 335
      altime3     336 - 337      alunit3     338 - 338
      aldura3     339 - 340      aldurb3     341 - 341
      alchrc3     342 - 342      altime4     343 - 344
      alunit4     345 - 345      aldura4     346 - 347
      aldurb4     348 - 348      alchrc4     349 - 349
      altime5     350 - 351      alunit5     352 - 352
      aldura5     353 - 354      aldurb5     355 - 355
      alchrc5     356 - 356      altime6     357 - 358
      alunit6     359 - 359      aldura6     360 - 361
      aldurb6     362 - 362      alchrc6     363 - 363
      altime7     364 - 365      alunit7     366 - 366
      aldura7     367 - 368      aldurb7     369 - 369
      alchrc7     370 - 370      altime8     371 - 372
      alunit8     373 - 373      aldura8     374 - 375
      aldurb8     376 - 376      alchrc8     377 - 377
      altime9     378 - 379      alunit9     380 - 380
      aldura9     381 - 382      aldurb9     383 - 383
      alchrc9     384 - 384      altime10    385 - 386
      alunit10    387 - 387      aldura10    388 - 389
      aldurb10    390 - 390      alchrc10    391 - 391
      altime11    392 - 393      alunit11    394 - 394
      aldura11    395 - 396      aldurb11    397 - 397
      alchrc11    398 - 398      altime12    399 - 400
      alunit12    401 - 401      aldura12    402 - 403
      aldurb12    404 - 404      alchrc12    405 - 405
      altime13    406 - 407      alunit13    408 - 408
      aldura13    409 - 410      aldurb13    411 - 411
      alchrc13    412 - 412      altime14    413 - 414
      alunit14    415 - 415      aldura14    416 - 417
      aldurb14    418 - 418      alchrc14    419 - 419
      altime15    420 - 421      alunit15    422 - 422
      aldura15    423 - 424      aldurb15    425 - 425
      alchrc15    426 - 426      altime16    427 - 428
      alunit16    429 - 429      aldura16    430 - 431
      aldurb16    432 - 432      alchrc16    433 - 433
      altime17    434 - 435      alunit17    436 - 436
      aldura17    437 - 438      aldurb17    439 - 439
      alchrc17    440 - 440      altime18    441 - 442
      alunit18    443 - 443      aldura18    444 - 445
      aldurb18    446 - 446      alchrc18    447 - 447
      altime19    448 - 449      alunit19    450 - 450
      aldura19    451 - 452      aldurb19    453 - 453
      alchrc19    454 - 454      altime20    455 - 456
      alunit20    457 - 457      aldura20    458 - 459
      aldurb20    460 - 460      alchrc20    461 - 461
      altime21    462 - 463      alunit21    464 - 464
      aldura21    465 - 466      aldurb21    467 - 467
      alchrc21    468 - 468      altime22    469 - 470
      alunit22    471 - 471      aldura22    472 - 473
      aldurb22    474 - 474      alchrc22    475 - 475
      altime23    476 - 477      alunit23    478 - 478
      aldura23    479 - 480      aldurb23    481 - 481
      alchrc23    482 - 482      altime24    483 - 484
      alunit24    485 - 485      aldura24    486 - 487
      aldurb24    488 - 488      alchrc24    489 - 489
      altime25    490 - 491      alunit25    492 - 492
      aldura25    493 - 494      aldurb25    495 - 495
      alchrc25    496 - 496      altime26    497 - 498
      alunit26    499 - 499      aldura26    500 - 501
      aldurb26    502 - 502      alchrc26    503 - 503
      altime27    504 - 505      alunit27    506 - 506
      aldura27    507 - 508      aldurb27    509 - 509
      alchrc27    510 - 510      altime28    511 - 512
      alunit28    513 - 513      aldura28    514 - 515
      aldurb28    516 - 516      alchrc28    517 - 517
      altime29    518 - 519      alunit29    520 - 520
      aldura29    521 - 522      aldurb29    523 - 523
      alchrc29    524 - 524      altime30    525 - 526
      alunit30    527 - 527      aldura30    528 - 529
      aldurb30    530 - 530      alchrc30    531 - 531
      altime31    532 - 533      alunit31    534 - 534
      aldura31    535 - 536      aldurb31    537 - 537
      alchrc31    538 - 538      altime32    539 - 540
      alunit32    541 - 541      aldura32    542 - 543
      aldurb32    544 - 544      alchrc32    545 - 545
      altime33    546 - 547      alunit33    548 - 548
      aldura33    549 - 550      aldurb33    551 - 551
      alchrc33    552 - 552      altime34    553 - 554
      alunit34    555 - 555      aldura34    556 - 557
      aldurb34    558 - 558      alchrc34    559 - 559
      altime90    560 - 561      alunit90    562 - 562
      aldura90    563 - 564      aldurb90    565 - 565
      alchrc90    566 - 566      altime91    567 - 568
      alunit91    569 - 569      aldura91    570 - 571
      aldurb91    572 - 572      alchrc91    573 - 573
      alcndrt     574 - 574      alchronr    575 - 575

      smkev       576 - 576      smkreg      577 - 578
      smknow      579 - 579      smkstat2    580 - 580
      smkqtno     581 - 582      smkqttp     583 - 583
      smkqty      584 - 585      cigsda1     586 - 587
      cigdamo     588 - 589      cigsda2     590 - 591
      cigsday     592 - 593      cigqtyr     594 - 594
      vigno       595 - 597      vigtp       598 - 598
      vigfreqw    599 - 600      viglngno    601 - 603
      viglngtp    604 - 604      vigmin      605 - 607
      modno       608 - 610      modtp       611 - 611
      modfreqw    612 - 613      modlngno    614 - 616
      modlngtp    617 - 617      modmin      618 - 620
      strngno     621 - 623      strngtp     624 - 624
      strfreqw    625 - 626      alc1yr      627 - 627
      alclife     628 - 628      alc12mno    629 - 631
      alc12mtp    632 - 632      alc12mwk    633 - 634
      alc12myr    635 - 637      alcamt      638 - 639
      alcstat     640 - 641      alc5upno    642 - 644
      alc5uptp    645 - 645      alc5upyr    646 - 648
      aheight     649 - 650      aweightp    651 - 653
      bmi         654 - 657      sleep       658 - 659

      ausualpl    660 - 660      aplkind     661 - 661
      ahcplrou    662 - 662      ahcplknd    663 - 663
      ahcchgyr    664 - 664      ahcchghi    665 - 665
      ahcdlyr1    666 - 666      ahcdlyr2    667 - 667
      ahcdlyr3    668 - 668      ahcdlyr4    669 - 669
      ahcdlyr5    670 - 670      ahcafyr1    671 - 671
      ahcafyr2    672 - 672      ahcafyr3    673 - 673
      ahcafyr4    674 - 674      adnlong2    675 - 675
      ahcsyr1     676 - 676      ahcsyr2     677 - 677
      ahcsyr3     678 - 678      ahcsyr4     679 - 679
      ahcsyr5     680 - 680      ahcsyr6     681 - 681
      ahcsyr7     682 - 682      ahcsyr8     683 - 683
      ahcsyr9     684 - 684      ahcsyr10    685 - 685
      ahernoy2    686 - 687      ahchyr      688 - 688
      ahchmoyr    689 - 690      ahchnoy2    691 - 692
      ahcnoyr2    693 - 694      asrgyr      695 - 695
      asrgnoyr    696 - 697      amdlongr    698 - 698
      shtfluyr    699 - 699      ashflu_m    700 - 701
      ashflu_y    702 - 705      sprfluyr    706 - 706
      aspflu_m    707 - 708      aspflu_y    709 - 712
      shtpnuyr    713 - 713      apox        714 - 714
      apox12mo    715 - 715      ahep        716 - 716
      ahepliv     717 - 717      shthepb     718 - 718
      shepdos     719 - 719

      bldgv       720 - 720      bldg12m     721 - 721
      hivtst      722 - 722      whytst_r    723 - 724
      tst12m_m    725 - 726      tst12m_y    727 - 730
      timetst     731 - 731      reatst_c    732 - 733
      reaswhor    734 - 734      lastst_c    735 - 736
      clntyp_c    737 - 738      whoadm      739 - 739
      givnam      740 - 740      extst12m    741 - 741
      chnsadsp    742 - 742      stmtru      743 - 743
      std         744 - 744      stddoc      745 - 745
      stdwher     746 - 746      tbhrd       747 - 747
      tbknow      748 - 748      tb          749 - 749
      tbsprd1     750 - 750      tbsprd2     751 - 751
      tbsprd3     752 - 752      tbsprd4     753 - 753
      tbsprd5     754 - 754      tbsprd6     755 - 755
      tbcured     756 - 756      tbchanc     757 - 757
      tbshame     758 - 758      homeless    759 - 759

using "$DAT/2006/samadult.dat";
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
label variable whynowka "ASD.065_00.000:  Main reason for not working last week
";
label variable everwrk  "ASD.066_00.000: Ever worked";
label variable indstrn1 "
ASD.080_00.000: Detailed industry classification (2002 NAICS)";
label variable indstrn2 "
ASD.080_00.000: Simple industry classification (2002 NAICS)";
label variable occupn1  "
ASD.090_00.000: Detailed occupation classification (2000 SOC)";
label variable occupn2  "
ASD.090_00.000: Simple occupation classification (2000 SOC)";
label variable wrkcata  "ASD.110_00.000: Class of worker";
label variable businc1a "ASD.112_00.000: Current job an incorporated business";
label variable locall1a "ASD.120_00.000: Number of employees at work";
label variable yrswrkpa "ASD.140_02.000: Years on the job";
label variable wrklongh "
ASD.146_00.000: Current/most recent job also longest held job";
label variable hourpda  "
ASD.150_00.000: Paid by the hour at current/most recent job";
label variable pdsicka  "
ASD.160_00.000: Paid sick leave at current/most recent job";
label variable onejob   "ASD.170_00.000: Have more than one job";

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
label variable astdo    "ACN.032_00.010: BEST thing to do for stroke victim";
label variable aasmev   "ACN.080_00.000: Ever been told you had asthma";
label variable aasstill "ACN.085_00.000: Still have asthma";
label variable aasmyr   "ACN.090_00.000: Had an asthma episode/attack past 12 m
";
label variable aasmeryr "ACN.100_00.000: Had visit to ER due to asthma past 12 m
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
label variable dibage   "ACN.170_00.000: Age first diagnosed w/diabetes";
label variable difage2  "ACN.170_00.000: Years since first diagnosed w/diabetes
";
label variable dibpre   "
ACN.175_01.010: Ever been told that you have prediabetes";
label variable dibifg   "
ACN.175_02.020: Ever been told that you have impaired fasting glucose";
label variable dibigt   "
ACN.175_03.030: Ever been told that you have impaired glucose tolerance";
label variable dibbord  "
ACN.175_04.040: Ever been told that you have borderline diabetes";
label variable dibhbs   "
ACN.175_05.050: Ever been told that you have high blood sugar";
label variable insln    "ACN.180_00.000: NOW taking insulin";
label variable dibpill  "ACN.190_00.000: NOW taking diabetic pills";
label variable gdm      "
ACN.192_00.010: Ever been told that you had gestational diabetes";
label variable gdmage   "
ACN.192_00.020: Age first diagnosed w/gestational diabetes";
label variable gdm_o    "
ACN.194_00.010: Ever been told that you had gestational diabetes";
label variable gdm_oage "
ACN.194_00.020: Age first diagnosed w/gestational diabetes";
label variable dibbtst  "
ACN.196_00.010: Tested for high blood sugar/diabetes, past 3 years";
label variable dibrisk  "
ACN.196_00.020: Ever been told that you have risk for diabetes";
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
label variable jntpn    "ACN.260_00.010: Rate your joint pain, past 30 days";
label variable jntchr   "ACN.270_00.000: Symptoms begin more than 3 m ago";
label variable jnthp    "
ACN.280_00.000: Ever seen doctor or hlth prof for joint symptoms";
label variable arth1    "ACN.290_00.000: Ever been told you had arthritis";
label variable arthwt   "
ACN.290_00.010: Ever told to lose weight to help arthritis";
label variable arthph   "ACN.290_00.020: Ever told to exercise to help arthritis
";
label variable arthcls  "ACN.290_00.030: Ever taken a class to help arthritis";
label variable arthlmt  "
ACN.295_00.000: Limited due to arthritis or joint symptoms";
label variable arthwrk  "ACN.295_00.010: Limited in work due to arthritis";
label variable paineck  "ACN.300_00.000: Had neck pain, past 3 m";
label variable painlb   "ACN.310_00.000: Had low back pain, past 3 m";
label variable painleg  "ACN.320_00.000: Pain spread down leg/below knees";
label variable painface "ACN.331_01.000: Had pain in jaw/front of ear, past 3 m
";
label variable amigr    "ACN.331_02.000: Had severe headache/migraine, past 3 m
";
label variable acold2w  "ACN.350_00.000: Had a head/chest cold past 2 w";
label variable aintil2w "ACN.360_00.000: Had stomach prob w/vomit/diarrhea, 2 w
";
label variable pregnow  "ACN.370_00.000: Currently pregnant";
label variable hearaid  "ACN.410_00.000: Have ever worn a hearing aid";
label variable ahearst  "ACN.420_00.000: Description of hearing w/o hearing aid
";
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
label variable hpwtyr   "ACN.535_00.010: Advised to lose weight, past 12 m";
label variable hppayr   "ACN.535_00.020: Advised to increase exercise, past 12 m
";
label variable hpdietyr "ACN.535_00.030: Advised to change diet, past 12 m";
label variable smwtyr   "ACN.540_00.010: Lost weight, past 12 m";
label variable smpayr   "ACN.540_00.020: Increased exercise, past 12 m";
label variable smdietyr "ACN.540_00.030: Changed diet, past 12 m";

label variable wrklyr3  "AHS.030_00.000: Work status: last week, past 12 m";
label variable wkdayr   "AHS.040_00.000: Number of work loss days, past 12 m";
label variable beddayr  "AHS.050_00.000: Number of bed days, past 12 m";
label variable ahstatyr "
AHS.060_00.000: Health better/worse/same, compared w/ 12 m ago";
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
AHS.141_02.000: How difficult lift/carry 10 lbs w/o special equipment";
label variable flpush   "
AHS.141_03.000: How difficult to push large objects w/o special equipment";
label variable flshop   "
AHS.171_01.000: How difficult to go out to events w/o special equipment";
label variable flsocl   "
AHS.171_02.000: How difficult to participate in social activities w/o sp eq";
label variable flrelax  "
AHS.171_03.000: How difficult to relax at home w/o special equipment";
label variable fla1ar   "AHS.171_00.000: Any functional limitation, all conds";
label variable aflhca1  "
AHS.200_01.000: Vision problem causes difficulty with activity";
label variable aflhca2  "
AHS.200_02.000: Hearing problem causes difficulty with activity";
label variable aflhca3  "
AHS.200_03.000: Arthritis/rheumatism causes difficulty with activity";
label variable aflhca4  "
AHS.200_04.000: Back/neck prob causes difficulty with activity";
label variable aflhca5  "
AHS.200_05.000: Fract/bone/joint inj causes difficulty with activity";
label variable aflhca6  "
AHS.200_06.000: Other injury causes difficulty with activity";
label variable aflhca7  "
AHS.200_07.000: Heart prob causes difficulty with activity";
label variable aflhca8  "AHS.200_08.000: Stroke causes difficulty with activity
";
label variable aflhca9  "
AHS.200_09.000: Hypertension causes difficulty with activity";
label variable aflhca10 "
AHS.200_10.000: Diabetes causes difficulty with activity";
label variable aflhca11 "
AHS.200_11.000: Lung/breath prob causes difficulty with activity";
label variable aflhca12 "AHS.200_12.000: Cancer causes difficulty with activity
";
label variable aflhca13 "
AHS.200_13.000: Birth defect causes difficulty with activity";
label variable aflhca14 "
AHS.200_14.000: Mental retardation causes difficulty with activity";
label variable aflhca15 "
AHS.200_15.000: Otr dev prob causes difficulty with activity";
label variable aflhca16 "
AHS.200_16.000: Senility/dementia/alzheimers causes difficulty with activity";
label variable aflhca17 "
AHS.200_17.000: Dep/anx/emot prob causes difficulty with activity";
label variable aflhca18 "
AHS.200_18.000: Weight prob causes difficulty with activity";
label variable aflhc19_ "AHS.200_00.000: Missing or amputated limb/finger/digit
";
label variable aflhc20_ "AHS.200_00.000: Musculoskeletal/connective tissue prob
";
label variable aflhc21_ "AHS.200_00.000: Circulation problem";
label variable aflhc22_ "AHS.200_00.000: Endocrine/nutritional/metabolic prob";
label variable aflhc23_ "AHS.200_00.000: Nervous system/sensory organ condition
";
label variable aflhc24_ "AHS.200_00.000: Digestive system problem";
label variable aflhc25_ "AHS.200_00.000: Genitourinary system problem";
label variable aflhc26_ "AHS.200_00.000: Skin/subcutaneous system problem";
label variable aflhc27_ "AHS.200_00.000: Blood or blood-forming organ problem";
label variable aflhc28_ "AHS.200_00.000: Benign tumor/cyst";
label variable aflhc29_ "AHS.200_00.000: Alcohol/drug/substance abuse problem";
label variable aflhc30_ "
AHS.200_00.000: Otr mental prob/ADD/Bipolar/Schizophrenic";
label variable aflhc31_ "
AHS.200_00.000: Surgical after-effects/medical treatment";
label variable aflhc32_ "AHS.200_00.000: 'Old age'/elderly/aging-related problem
";
label variable aflhc33_ "AHS.200_00.000: Fatigue/tiredness/weakness";
label variable aflhc34_ "AHS.200_00.000: Pregnancy related problem";
label variable aflhca90 "
AHS.200_90.000: Other impair/prob(1) causes difficulty with activity";
label variable aflhca91 "
AHS.200_91.000: Other impair/prob(2) causes difficulty with activity";
label variable altime1  "
AHS.300_01.000: Duration of vision prob: Number of units";
label variable alunit1  "AHS.300_02.000: Duration of vision prob: Time unit";
label variable aldura1  "AHS.300_02.000: Duration of vision prob (in years)";
label variable aldurb1  "AHS.300_02.000: Duration of vision prob recode 2";
label variable alchrc1  "AHS.300_02.000: Vision problem condition status";
label variable altime2  "
AHS.301_01.000: Duration of hearing prob: Number of units";
label variable alunit2  "AHS.301_02.000: Duration of hearing prob: Time unit";
label variable aldura2  "AHS.301_02.000: Duration of hearing prob (in years)";
label variable aldurb2  "AHS.301_02.000: Duration of hearing prob recode 2";
label variable alchrc2  "AHS.301_02.000: Hearing problem condition status";
label variable altime3  "
AHS.302_01.000: Duration of arthritis/rheumatism: Number of units";
label variable alunit3  "
AHS.302_02.000: Duration of arthritis/rheumatism: Time unit";
label variable aldura3  "
AHS.302_02.000: Duration of arthritis or rheumatism prob (in years)";
label variable aldurb3  "
AHS.302_02.000: Duration of arthritis or rheumatism prob recode 2";
label variable alchrc3  "
AHS.302_02.000: Arthritis or rheumatism problem condition status";
label variable altime4  "
AHS.303_01.000: Duration of back or neck problem: Number of units";
label variable alunit4  "
AHS.303_02.000: Duration of back or neck problem: Time unit";
label variable aldura4  "
AHS.303_02.000: Duration of back or neck prob (in years)";
label variable aldurb4  "AHS.303_02.000: Duration of back or neck prob recode 2
";
label variable alchrc4  "AHS.303_02.000: Back or neck condition status";
label variable altime5  "
AHS.304_01.000: Duration of fracture, bone/joint injury: Number of units";
label variable alunit5  "
AHS.304_02.000: Duration of fracture, bone/joint injury: Time unit";
label variable aldura5  "
AHS.304_02.000: Duration of fracture, bone/joint injury prob (in years)";
label variable aldurb5  "
AHS.304_02.000: Duration of fracture, bone/joint injury prob recode 2";
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
label variable aldurb10 "AHS.309_02.000: Duration of diabetes prob recode 2";
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
label variable aldura12 "AHS.311_02.000: Duration of cancer problem (in years)";
label variable aldurb12 "AHS.311_02.000: Duration of cancer problem recode 2";
label variable alchrc12 "AHS.311_02.000: Cancer problem condition status";
label variable altime13 "
AHS.312_01.000: Duration of birth defect: Number of units";
label variable alunit13 "AHS.312_02.000: Duration of birth defect: Time unit";
label variable aldura13 "
AHS.312_02.000: Duration of birth defect problem (in years)";
label variable aldurb13 "
AHS.312_02.000: Duration of birth defect problem prob recode 2";
label variable alchrc13 "AHS.312_02.000: Birth defect problem condition status";
label variable altime14 "
AHS.313_01.000: Duration of mental retardation: Number of units";
label variable alunit14 "
AHS.313_02.000: Duration of mental retardation: Time unit";
label variable aldura14 "
AHS.313_02.000: Duration of mental retardation problem (in years)";
label variable aldurb14 "
AHS.313_02.000: Duration of mental retardation problem prob recode 2";
label variable alchrc14 "
AHS.313_02.000: Mental retardation problem condition status";
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
label variable aldura16 "AHS.315_02.000: Duration of senility problem (in years)
";
label variable aldurb16 "AHS.315_02.000: Duration of senility problem recode 2";
label variable alchrc16 "AHS.315_02.000: Senility problem condition status";
label variable altime17 "
AHS.316_01.000: Duration of depression/anxiety/emotional prob: Number of units";
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
AHS.318_01.000 RECOD: Duration of missing limbs: Number of units";
label variable alunit19 "
AHS.318_02.000 RECOD: Duration of missing limbs: Time unit";
label variable aldura19 "
AHS.318_02.000: Duration of missing limbs problem (in years)";
label variable aldurb19 "
AHS.318_02.000: Duration of missing limbs problem recode 2";
label variable alchrc19 "AHS.318_02.000: Missing limbs problem condition status
";
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
AHS.320_01.000 RECOD: Duration of circulatory problem: Number of units";
label variable alunit21 "
AHS.320_02.000 RECOD: Duration of circulatory problem: Time unit";
label variable aldura21 "
AHS.320_02.000: Duration of circulatory problem (in years)";
label variable aldurb21 "
AHS.320_02.000: Duration of circulatory problem recode 2";
label variable alchrc21 "AHS.320_02.000: Circulatory problem condition status";
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
AHS.323_02.000: Duration of digestive problem (in years)";
label variable aldurb24 "AHS.323_02.000: Duration of digestive problem recode 2
";
label variable alchrc24 "AHS.323_02.000: Digestive problem condition status";
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
label variable aldura26 "AHS.325_02.000: Duration of skin problem (in years)";
label variable aldurb26 "AHS.325_02.000: Duration of skin problem recode 2";
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
AHS.331_01.000 RECOD: Duration of 'old age': Number of units";
label variable alunit32 "
AHS.331_02.000 RECOD: Duration of 'old age': Number of units";
label variable aldura32 "AHS.331_02.000: Duration of 'old age' (in years)";
label variable aldurb32 "AHS.331_02.000: Duration of 'old age', recode 2";
label variable alchrc32 "AHS.331_02.000: 'Old age' condition status";
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
label variable alcndrt  "AHS.336_02.000: Chronic cond rec for ind w/functl lim";
label variable alchronr "
AHS.336_02.000: Overall functl lim recode by cond status";

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
   30       "30 Sample Adult"
   31       "31 Sample Adult Cancer"
   40       "40 Sample Child"
   60       "60 Family"
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
   4        "4 Working, but not for pay, at a job or business"
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
label define sap046x
   1        "1 Advise them to drive to the hospital"
   2        "2 Advise them to call their physician"
   3        "3 Call 9-1-1 (or another emergency number)"
   4        "4 Call spouse or family member"
   5        "5 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap054x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap085x
   85       "85 85+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap115x
   1        "1 Yes"
   2        "2 No"
   3        "3 Borderline"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap117x
   00       "00 Within past year"
   85       "85 85+ years"
   96       "96 1+ year(s) with diabetes and age is 85+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap125x
   1        "1 Yes"
   2        "2 No"
   3        "3 Never been pregnant"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap126x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap154x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap172x
   1        "1 Good"
   2        "2 A little trouble"
   3        "3 A lot of trouble"
   4        "4 Deaf"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap176x
   1        "1 ALL of the time"
   2        "2 MOST of the time"
   3        "3 SOME of the time"
   4        "4 A LITTLE of the time"
   5        "5 NONE of the time"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap182x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap189x
   0        "0 Had job last week"
   1        "1 No job last week, had job past 12 m"
   2        "2 No job last week, no job past 12 m"
   3        "3 Never worked"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap190x
   000      "000 None"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap192x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap194x
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
label define sap206x
   1        "1 Limited in any way"
   2        "2 Not limited in any way"
   3        "3 Unknown if limited"
;
label define sap243x
   95       "95 95+"
   96       "96 Since birth"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap244x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   6        "6 Since birth"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap245x
   00       "00 Less than 1 year"
   85       "85 85+ years"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap246x
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap247x
   1        "1 Chronic"
   2        "2 Not chronic"
   9        "9 Unknown if chronic"
;
label define sap423x
   1        "1 At least one chronic cond causes functl lim"
   2        "2 No chronic cond causes functl lim"
   9        "9 Unk if any chronic cond causes functl lim"
;
label define sap424x
   0        "0 Not limited in any way (incl unk if limited)"
   1        "1 Limited; caused by at least one chronic cond"
   2        "2 Limited; not caused by chronic cond"
   3        "3 Limited; unk if cond is chronic"
;
label define sap426x
   85       "85 85 years or older"
   96       "96 Never smoked regularly"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap427x
   1        "1 Every day"
   2        "2 Some days"
   3        "3 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap428x
   1        "1 Current every day smoker"
   2        "2 Current some day smoker"
   3        "3 Former smoker"
   4        "4 Never smoker"
   5        "5 Smoker, current status unknown"
   9        "9 Unknown if ever smoked"
;
label define sap429x
   95       "95 95+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap430x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap431x
   00       "00 Less than 1 year"
   70       "70 70+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap432x
   95       "95 95+ cigarettes"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap433x
   00       "00 None"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap437x
   000      "000 Never"
   996      "996 Unable to do this type activity"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap438x
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
label define sap439x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do vigorous activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap441x
   1        "1 Minutes"
   2        "2 Hours"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap445x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do light or moderate activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap451x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do strength activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap454x
   000      "000 Never"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap455x
   0        "0 Never/None"
   1        "1 Week"
   2        "2 Month"
   3        "3 Year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap456x
   00       "00 Less than one day per week"
   95       "95 Did not drink in past year"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap457x
   000      "000 Never/none"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap458x
   95       "95 95+ drinks"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap459x
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
label define sap461x
   0        "0 Never/None"
   1        "1 Per week"
   2        "2 Per month"
   3        "3 Per year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap463x
   96       "96 Not available"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap464x
   996      "996 Not available"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap467x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap468x
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
label define sap470x
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
label define sap482x
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
label define sap493x
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
label define sap496x
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
label define sap499x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap502x
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
label define sap503x
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define sap513x
   1        "1 Received at least 3 doses"
   2        "2 Received less than 3 doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap517x
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
label define sap518x
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
label define sap519x
   9996     "9996 Time period format"
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define sap520x
   1        "1 6 months or less"
   2        "2 More than 6 months but not more than 1 year ago"
   3        "3 More than 1 year, but not more than 2 years ago"
   4        "4 More than 2 years, but not more than 5 years ago"
   5        "5 More than 5 years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap521x
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
label define sap522x
   1        "1 Doctor, nurse or other health care professional"
   2        "2 Sex partner"
   3        "3 Someone at health department"
   4        "4 Family member or friend"
   5        "5 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap523x
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
label define sap524x
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
label define sap525x
   1        "1 Nurse or health worker"
   2        "2 Self-sampling kit"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap528x
   1        "1 High/Already have HIV/AIDS"
   2        "2 Medium"
   3        "3 Low"
   4        "4 None"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap529x
   1        "1 Yes, at least one statement is true"
   2        "2 No, none of these statements are true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap532x
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
label define sap535x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Nothing"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap543x
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

label values doinglwa  sap023x;   label values whynowka  sap024x;
label values everwrk   sap025x;   label values wrkcata   sap030x;
label values businc1a  sap025x;   label values locall1a  sap032x;
label values yrswrkpa  sap033x;   label values wrklongh  sap025x;
label values hourpda   sap025x;   label values pdsicka   sap025x;
label values onejob    sap025x;

label values hypev     sap025x;   label values hypdifv   sap025x;
label values chdev     sap025x;   label values angev     sap025x;
label values miev      sap025x;   label values hrtev     sap025x;
label values strev     sap025x;   label values ephev     sap025x;
label values astdo     sap046x;   label values aasmev    sap025x;
label values aasstill  sap025x;   label values aasmyr    sap025x;
label values aasmeryr  sap025x;   label values ulcev     sap025x;
label values ulcyr     sap025x;   label values canev     sap025x;
label values cnkind1   sap054x;   label values cnkind2   sap054x;
label values cnkind3   sap054x;   label values cnkind4   sap054x;
label values cnkind5   sap054x;   label values cnkind6   sap054x;
label values cnkind7   sap054x;   label values cnkind8   sap054x;
label values cnkind9   sap054x;   label values cnkind10  sap054x;
label values cnkind11  sap054x;   label values cnkind12  sap054x;
label values cnkind13  sap054x;   label values cnkind14  sap054x;
label values cnkind15  sap054x;   label values cnkind16  sap054x;
label values cnkind17  sap054x;   label values cnkind18  sap054x;
label values cnkind19  sap054x;   label values cnkind20  sap054x;
label values cnkind21  sap054x;   label values cnkind22  sap054x;
label values cnkind23  sap054x;   label values cnkind24  sap054x;
label values cnkind25  sap054x;   label values cnkind26  sap054x;
label values cnkind27  sap054x;   label values cnkind28  sap054x;
label values cnkind29  sap054x;   label values cnkind30  sap054x;
label values cnkind31  sap054x;   label values canage1   sap085x;
label values canage2   sap085x;   label values canage3   sap085x;
label values canage4   sap085x;   label values canage5   sap085x;
label values canage6   sap085x;   label values canage7   sap085x;
label values canage8   sap085x;   label values canage9   sap085x;
label values canage10  sap085x;   label values canage11  sap085x;
label values canage12  sap085x;   label values canage13  sap085x;
label values canage14  sap085x;   label values canage15  sap085x;
label values canage16  sap085x;   label values canage17  sap085x;
label values canage18  sap085x;   label values canage19  sap085x;
label values canage20  sap085x;   label values canage21  sap085x;
label values canage22  sap085x;   label values canage23  sap085x;
label values canage24  sap085x;   label values canage25  sap085x;
label values canage26  sap085x;   label values canage27  sap085x;
label values canage28  sap085x;   label values canage29  sap085x;
label values canage30  sap085x;   label values dibev     sap115x;
label values dibage    sap085x;   label values difage2   sap117x;
label values dibpre    sap025x;   label values dibifg    sap025x;
label values dibigt    sap025x;   label values dibbord   sap025x;
label values dibhbs    sap025x;   label values insln     sap025x;
label values dibpill   sap025x;   label values gdm       sap125x;
label values gdmage    sap126x;   label values gdm_o     sap125x;
label values gdm_oage  sap126x;   label values dibbtst   sap025x;
label values dibrisk   sap025x;   label values ahayfyr   sap025x;
label values sinyr     sap025x;   label values cbrchyr   sap025x;
label values kidwkyr   sap025x;   label values livyr     sap025x;
label values jntsymp   sap025x;   label values jmthp1    sap054x;
label values jmthp2    sap054x;   label values jmthp3    sap054x;
label values jmthp4    sap054x;   label values jmthp5    sap054x;
label values jmthp6    sap054x;   label values jmthp7    sap054x;
label values jmthp8    sap054x;   label values jmthp9    sap054x;
label values jmthp10   sap054x;   label values jmthp11   sap054x;
label values jmthp12   sap054x;   label values jmthp13   sap054x;
label values jmthp14   sap054x;   label values jmthp15   sap054x;
label values jmthp16   sap054x;   label values jmthp17   sap054x;
label values jntpn     sap154x;   label values jntchr    sap025x;
label values jnthp     sap025x;   label values arth1     sap025x;
label values arthwt    sap025x;   label values arthph    sap025x;
label values arthcls   sap025x;   label values arthlmt   sap025x;
label values arthwrk   sap025x;   label values paineck   sap025x;
label values painlb    sap025x;   label values painleg   sap025x;
label values painface  sap025x;   label values amigr     sap025x;
label values acold2w   sap025x;   label values aintil2w  sap025x;
label values pregnow   sap025x;   label values hearaid   sap025x;
label values ahearst   sap172x;   label values avision   sap025x;
label values ablind    sap025x;   label values lupprt    sap025x;
label values sad       sap176x;   label values nervous   sap176x;
label values restless  sap176x;   label values hopeless  sap176x;
label values effort    sap176x;   label values worthls   sap176x;
label values mhamtmo   sap182x;   label values hpwtyr    sap025x;
label values hppayr    sap025x;   label values hpdietyr  sap025x;
label values smwtyr    sap025x;   label values smpayr    sap025x;
label values smdietyr  sap025x;

label values wrklyr3   sap189x;   label values wkdayr    sap190x;
label values beddayr   sap190x;   label values ahstatyr  sap192x;
label values speceq    sap025x;   label values flwalk    sap194x;
label values flclimb   sap194x;   label values flstand   sap194x;
label values flsit     sap194x;   label values flstoop   sap194x;
label values flreach   sap194x;   label values flgrasp   sap194x;
label values flcarry   sap194x;   label values flpush    sap194x;
label values flshop    sap194x;   label values flsocl    sap194x;
label values flrelax   sap194x;   label values fla1ar    sap206x;
label values aflhca1   sap054x;   label values aflhca2   sap054x;
label values aflhca3   sap054x;   label values aflhca4   sap054x;
label values aflhca5   sap054x;   label values aflhca6   sap054x;
label values aflhca7   sap054x;   label values aflhca8   sap054x;
label values aflhca9   sap054x;   label values aflhca10  sap054x;
label values aflhca11  sap054x;   label values aflhca12  sap054x;
label values aflhca13  sap054x;   label values aflhca14  sap054x;
label values aflhca15  sap054x;   label values aflhca16  sap054x;
label values aflhca17  sap054x;   label values aflhca18  sap054x;
label values aflhc19_  sap054x;   label values aflhc20_  sap054x;
label values aflhc21_  sap054x;   label values aflhc22_  sap054x;
label values aflhc23_  sap054x;   label values aflhc24_  sap054x;
label values aflhc25_  sap054x;   label values aflhc26_  sap054x;
label values aflhc27_  sap054x;   label values aflhc28_  sap054x;
label values aflhc29_  sap054x;   label values aflhc30_  sap054x;
label values aflhc31_  sap054x;   label values aflhc32_  sap054x;
label values aflhc33_  sap054x;   label values aflhc34_  sap054x;
label values aflhca90  sap054x;   label values aflhca91  sap054x;
label values altime1   sap243x;   label values alunit1   sap244x;
label values aldura1   sap245x;   label values aldurb1   sap246x;
label values alchrc1   sap247x;   label values altime2   sap243x;
label values alunit2   sap244x;   label values aldura2   sap245x;
label values aldurb2   sap246x;   label values alchrc2   sap247x;
label values altime3   sap243x;   label values alunit3   sap244x;
label values aldura3   sap245x;   label values aldurb3   sap246x;
label values alchrc3   sap247x;   label values altime4   sap243x;
label values alunit4   sap244x;   label values aldura4   sap245x;
label values aldurb4   sap246x;   label values alchrc4   sap247x;
label values altime5   sap243x;   label values alunit5   sap244x;
label values aldura5   sap245x;   label values aldurb5   sap246x;
label values alchrc5   sap247x;   label values altime6   sap243x;
label values alunit6   sap244x;   label values aldura6   sap245x;
label values aldurb6   sap246x;   label values alchrc6   sap247x;
label values altime7   sap243x;   label values alunit7   sap244x;
label values aldura7   sap245x;   label values aldurb7   sap246x;
label values alchrc7   sap247x;   label values altime8   sap243x;
label values alunit8   sap244x;   label values aldura8   sap245x;
label values aldurb8   sap246x;   label values alchrc8   sap247x;
label values altime9   sap243x;   label values alunit9   sap244x;
label values aldura9   sap245x;   label values aldurb9   sap246x;
label values alchrc9   sap247x;   label values altime10  sap243x;
label values alunit10  sap244x;   label values aldura10  sap245x;
label values aldurb10  sap246x;   label values alchrc10  sap247x;
label values altime11  sap243x;   label values alunit11  sap244x;
label values aldura11  sap245x;   label values aldurb11  sap246x;
label values alchrc11  sap247x;   label values altime12  sap243x;
label values alunit12  sap244x;   label values aldura12  sap245x;
label values aldurb12  sap246x;   label values alchrc12  sap247x;
label values altime13  sap243x;   label values alunit13  sap244x;
label values aldura13  sap245x;   label values aldurb13  sap246x;
label values alchrc13  sap247x;   label values altime14  sap243x;
label values alunit14  sap244x;   label values aldura14  sap245x;
label values aldurb14  sap246x;   label values alchrc14  sap247x;
label values altime15  sap243x;   label values alunit15  sap244x;
label values aldura15  sap245x;   label values aldurb15  sap246x;
label values alchrc15  sap247x;   label values altime16  sap243x;
label values alunit16  sap244x;   label values aldura16  sap245x;
label values aldurb16  sap246x;   label values alchrc16  sap247x;
label values altime17  sap243x;   label values alunit17  sap244x;
label values aldura17  sap245x;   label values aldurb17  sap246x;
label values alchrc17  sap247x;   label values altime18  sap243x;
label values alunit18  sap244x;   label values aldura18  sap245x;
label values aldurb18  sap246x;   label values alchrc18  sap247x;
label values altime19  sap243x;   label values alunit19  sap244x;
label values aldura19  sap245x;   label values aldurb19  sap246x;
label values alchrc19  sap247x;   label values altime20  sap243x;
label values alunit20  sap244x;   label values aldura20  sap245x;
label values aldurb20  sap246x;   label values alchrc20  sap247x;
label values altime21  sap243x;   label values alunit21  sap244x;
label values aldura21  sap245x;   label values aldurb21  sap246x;
label values alchrc21  sap247x;   label values altime22  sap243x;
label values alunit22  sap244x;   label values aldura22  sap245x;
label values aldurb22  sap246x;   label values alchrc22  sap247x;
label values altime23  sap243x;   label values alunit23  sap244x;
label values aldura23  sap245x;   label values aldurb23  sap246x;
label values alchrc23  sap247x;   label values altime24  sap243x;
label values alunit24  sap244x;   label values aldura24  sap245x;
label values aldurb24  sap246x;   label values alchrc24  sap247x;
label values altime25  sap243x;   label values alunit25  sap244x;
label values aldura25  sap245x;   label values aldurb25  sap246x;
label values alchrc25  sap247x;   label values altime26  sap243x;
label values alunit26  sap244x;   label values aldura26  sap245x;
label values aldurb26  sap246x;   label values alchrc26  sap247x;
label values altime27  sap243x;   label values alunit27  sap244x;
label values aldura27  sap245x;   label values aldurb27  sap246x;
label values alchrc27  sap247x;   label values altime28  sap243x;
label values alunit28  sap244x;   label values aldura28  sap245x;
label values aldurb28  sap246x;   label values alchrc28  sap247x;
label values altime29  sap243x;   label values alunit29  sap244x;
label values aldura29  sap245x;   label values aldurb29  sap246x;
label values alchrc29  sap247x;   label values altime30  sap243x;
label values alunit30  sap244x;   label values aldura30  sap245x;
label values aldurb30  sap246x;   label values alchrc30  sap247x;
label values altime31  sap243x;   label values alunit31  sap244x;
label values aldura31  sap245x;   label values aldurb31  sap246x;
label values alchrc31  sap247x;   label values altime32  sap243x;
label values alunit32  sap244x;   label values aldura32  sap245x;
label values aldurb32  sap246x;   label values alchrc32  sap247x;
label values altime33  sap243x;   label values alunit33  sap244x;
label values aldura33  sap245x;   label values aldurb33  sap246x;
label values alchrc33  sap247x;   label values altime34  sap243x;
label values alunit34  sap244x;   label values aldura34  sap245x;
label values aldurb34  sap246x;   label values alchrc34  sap247x;
label values altime90  sap243x;   label values alunit90  sap244x;
label values aldura90  sap245x;   label values aldurb90  sap246x;
label values alchrc90  sap247x;   label values altime91  sap243x;
label values alunit91  sap244x;   label values aldura91  sap245x;
label values aldurb91  sap246x;   label values alchrc91  sap247x;
label values alcndrt   sap423x;   label values alchronr  sap424x;

label values smkev     sap025x;   label values smkreg    sap426x;
label values smknow    sap427x;   label values smkstat2  sap428x;
label values smkqtno   sap429x;   label values smkqttp   sap430x;
label values smkqty    sap431x;   label values cigsda1   sap432x;
label values cigdamo   sap433x;   label values cigsda2   sap432x;
label values cigsday   sap432x;   label values cigqtyr   sap025x;
label values vigno     sap437x;   label values vigtp     sap438x;
label values vigfreqw  sap439x;   label values viglngno  sap126x;
label values viglngtp  sap441x;   label values vigmin    sap126x;
label values modno     sap437x;   label values modtp     sap438x;
label values modfreqw  sap445x;   label values modlngno  sap126x;
label values modlngtp  sap441x;   label values modmin    sap126x;
label values strngno   sap437x;   label values strngtp   sap438x;
label values strfreqw  sap451x;   label values alc1yr    sap025x;
label values alclife   sap025x;   label values alc12mno  sap454x;
label values alc12mtp  sap455x;   label values alc12mwk  sap456x;
label values alc12myr  sap457x;   label values alcamt    sap458x;
label values alcstat   sap459x;   label values alc5upno  sap457x;
label values alc5uptp  sap461x;   label values alc5upyr  sap457x;
label values aheight   sap463x;   label values aweightp  sap464x;
label values sleep     sap154x;

label values ausualpl  sap467x;   label values aplkind   sap468x;
label values ahcplrou  sap025x;   label values ahcplknd  sap470x;
label values ahcchgyr  sap025x;   label values ahcchghi  sap025x;
label values ahcdlyr1  sap025x;   label values ahcdlyr2  sap025x;
label values ahcdlyr3  sap025x;   label values ahcdlyr4  sap025x;
label values ahcdlyr5  sap025x;   label values ahcafyr1  sap025x;
label values ahcafyr2  sap025x;   label values ahcafyr3  sap025x;
label values ahcafyr4  sap025x;   label values adnlong2  sap482x;
label values ahcsyr1   sap025x;   label values ahcsyr2   sap025x;
label values ahcsyr3   sap025x;   label values ahcsyr4   sap025x;
label values ahcsyr5   sap025x;   label values ahcsyr6   sap025x;
label values ahcsyr7   sap025x;   label values ahcsyr8   sap025x;
label values ahcsyr9   sap025x;   label values ahcsyr10  sap025x;
label values ahernoy2  sap493x;   label values ahchyr    sap025x;
label values ahchmoyr  sap154x;   label values ahchnoy2  sap496x;
label values ahcnoyr2  sap493x;   label values asrgyr    sap025x;
label values asrgnoyr  sap499x;   label values amdlongr  sap482x;
label values shtfluyr  sap025x;   label values ashflu_m  sap502x;
label values ashflu_y  sap503x;   label values sprfluyr  sap025x;
label values aspflu_m  sap502x;   label values aspflu_y  sap503x;
label values shtpnuyr  sap025x;   label values apox      sap025x;
label values apox12mo  sap025x;   label values ahep      sap025x;
label values ahepliv   sap025x;   label values shthepb   sap025x;
label values shepdos   sap513x;

label values bldgv     sap025x;   label values bldg12m   sap025x;
label values hivtst    sap025x;   label values whytst_r  sap517x;
label values tst12m_m  sap518x;   label values tst12m_y  sap519x;
label values timetst   sap520x;   label values reatst_c  sap521x;
label values reaswhor  sap522x;   label values lastst_c  sap523x;
label values clntyp_c  sap524x;   label values whoadm    sap525x;
label values givnam    sap025x;   label values extst12m  sap025x;
label values chnsadsp  sap528x;   label values stmtru    sap529x;
label values std       sap025x;   label values stddoc    sap025x;
label values stdwher   sap532x;   label values tbhrd     sap025x;
label values tbknow    sap025x;   label values tb        sap535x;
label values tbsprd1   sap054x;   label values tbsprd2   sap054x;
label values tbsprd3   sap054x;   label values tbsprd4   sap054x;
label values tbsprd5   sap054x;   label values tbsprd6   sap054x;
label values tbcured   sap025x;   label values tbchanc   sap543x;
label values tbshame   sap025x;   label values homeless  sap025x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sa];
save "$OUT/2006/samadult", replace;

#delimit cr

* data file is stored in samadult.dta
* log  file is stored in samadult.log

log close
