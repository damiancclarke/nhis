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
      assignwk     14 -  15  str fmx          16 -  17
  str fpx          18 -  19      wtia_sa      20 -  25
      wtfa_sa      26 -  31

      region       32 -  32      stratum      33 -  35
      psu          36 -  36

      sex          37 -  37      hispan_i     38 -  39
      racerpi2     40 -  41      mracrpi2     42 -  43
      mracbpi2     44 -  45      age_p        46 -  47

      r_maritl     48 -  48

      proxysa      49 -  49      prox1        50 -  50
      prox2        51 -  51

      doinglwa     52 -  52      whynowka     53 -  54
      everwrk      55 -  55      indstrn1     56 -  57
      indstrn2     58 -  59      occupn1      60 -  61
      occupn2      62 -  63      wrkcata      64 -  64
      businc1a     65 -  65      locall1a     66 -  67
      yrswrkpa     68 -  69      wrklongh     70 -  70
      hourpda      71 -  71      pdsicka      72 -  72
      onejob       73 -  73

      hypev        74 -  74      hypdifv      75 -  75
      chdev        76 -  76      angev        77 -  77
      miev         78 -  78      hrtev        79 -  79
      strev        80 -  80      ephev        81 -  81
      aasmev       82 -  82      aasstill     83 -  83
      aasmyr       84 -  84      aasmeryr     85 -  85
      ulcev        86 -  86      ulcyr        87 -  87
      canev        88 -  88      cnkind1      89 -  89
      cnkind2      90 -  90      cnkind3      91 -  91
      cnkind4      92 -  92      cnkind5      93 -  93
      cnkind6      94 -  94      cnkind7      95 -  95
      cnkind8      96 -  96      cnkind9      97 -  97
      cnkind10     98 -  98      cnkind11     99 -  99
      cnkind12    100 - 100      cnkind13    101 - 101
      cnkind14    102 - 102      cnkind15    103 - 103
      cnkind16    104 - 104      cnkind17    105 - 105
      cnkind18    106 - 106      cnkind19    107 - 107
      cnkind20    108 - 108      cnkind21    109 - 109
      cnkind22    110 - 110      cnkind23    111 - 111
      cnkind24    112 - 112      cnkind25    113 - 113
      cnkind26    114 - 114      cnkind27    115 - 115
      cnkind28    116 - 116      cnkind29    117 - 117
      cnkind30    118 - 118      cnkind31    119 - 119
      canage1     120 - 121      canage2     122 - 123
      canage3     124 - 125      canage4     126 - 127
      canage5     128 - 129      canage6     130 - 131
      canage7     132 - 133      canage8     134 - 135
      canage9     136 - 137      canage10    138 - 139
      canage11    140 - 141      canage12    142 - 143
      canage13    144 - 145      canage14    146 - 147
      canage15    148 - 149      canage16    150 - 151
      canage17    152 - 153      canage18    154 - 155
      canage19    156 - 157      canage20    158 - 159
      canage21    160 - 161      canage22    162 - 163
      canage23    164 - 165      canage24    166 - 167
      canage25    168 - 169      canage26    170 - 171
      canage27    172 - 173      canage28    174 - 175
      canage29    176 - 177      canage30    178 - 179
      dibev       180 - 180      dibage      181 - 182
      difage2     183 - 184      insln       185 - 185
      dibpill     186 - 186      ahayfyr     187 - 187
      sinyr       188 - 188      cbrchyr     189 - 189
      kidwkyr     190 - 190      livyr       191 - 191
      jntsymp     192 - 192      jmthp1      193 - 193
      jmthp2      194 - 194      jmthp3      195 - 195
      jmthp4      196 - 196      jmthp5      197 - 197
      jmthp6      198 - 198      jmthp7      199 - 199
      jmthp8      200 - 200      jmthp9      201 - 201
      jmthp10     202 - 202      jmthp11     203 - 203
      jmthp12     204 - 204      jmthp13     205 - 205
      jmthp14     206 - 206      jmthp15     207 - 207
      jmthp16     208 - 208      jmthp17     209 - 209
      jntchr      210 - 210      jnthp       211 - 211
      arth1       212 - 212      arthlmt     213 - 213
      paineck     214 - 214      painlb      215 - 215
      painleg     216 - 216      painface    217 - 217
      amigr       218 - 218      acold2w     219 - 219
      aintil2w    220 - 220      pregnow     221 - 221
      hearaid     222 - 222      ahearst     223 - 223
      avision     224 - 224      ablind      225 - 225
      lupprt      226 - 226      sad         227 - 227
      nervous     228 - 228      restless    229 - 229
      hopeless    230 - 230      effort      231 - 231
      worthls     232 - 232      mhamtmo     233 - 233

      wrklyr3     234 - 234      wkdayr      235 - 237
      beddayr     238 - 240      ahstatyr    241 - 241
      speceq      242 - 242      flwalk      243 - 243
      flclimb     244 - 244      flstand     245 - 245
      flsit       246 - 246      flstoop     247 - 247
      flreach     248 - 248      flgrasp     249 - 249
      flcarry     250 - 250      flpush      251 - 251
      flshop      252 - 252      flsocl      253 - 253
      flrelax     254 - 254      fla1ar      255 - 255
      aflhca1     256 - 256      aflhca2     257 - 257
      aflhca3     258 - 258      aflhca4     259 - 259
      aflhca5     260 - 260      aflhca6     261 - 261
      aflhca7     262 - 262      aflhca8     263 - 263
      aflhca9     264 - 264      aflhca10    265 - 265
      aflhca11    266 - 266      aflhca12    267 - 267
      aflhca13    268 - 268      aflhca14    269 - 269
      aflhca15    270 - 270      aflhca16    271 - 271
      aflhca17    272 - 272      aflhca18    273 - 273
      aflhc19_    274 - 274      aflhc20_    275 - 275
      aflhc21_    276 - 276      aflhc22_    277 - 277
      aflhc23_    278 - 278      aflhc24_    279 - 279
      aflhc25_    280 - 280      aflhc26_    281 - 281
      aflhc27_    282 - 282      aflhc28_    283 - 283
      aflhc29_    284 - 284      aflhc30_    285 - 285
      aflhc31_    286 - 286      aflhc32_    287 - 287
      aflhc33_    288 - 288      aflhc34_    289 - 289
      aflhca90    290 - 290      aflhca91    291 - 291
      altime1     292 - 293      alunit1     294 - 294
      aldura1     295 - 296      aldurb1     297 - 297
      alchrc1     298 - 298      altime2     299 - 300
      alunit2     301 - 301      aldura2     302 - 303
      aldurb2     304 - 304      alchrc2     305 - 305
      altime3     306 - 307      alunit3     308 - 308
      aldura3     309 - 310      aldurb3     311 - 311
      alchrc3     312 - 312      altime4     313 - 314
      alunit4     315 - 315      aldura4     316 - 317
      aldurb4     318 - 318      alchrc4     319 - 319
      altime5     320 - 321      alunit5     322 - 322
      aldura5     323 - 324      aldurb5     325 - 325
      alchrc5     326 - 326      altime6     327 - 328
      alunit6     329 - 329      aldura6     330 - 331
      aldurb6     332 - 332      alchrc6     333 - 333
      altime7     334 - 335      alunit7     336 - 336
      aldura7     337 - 338      aldurb7     339 - 339
      alchrc7     340 - 340      altime8     341 - 342
      alunit8     343 - 343      aldura8     344 - 345
      aldurb8     346 - 346      alchrc8     347 - 347
      altime9     348 - 349      alunit9     350 - 350
      aldura9     351 - 352      aldurb9     353 - 353
      alchrc9     354 - 354      altime10    355 - 356
      alunit10    357 - 357      aldura10    358 - 359
      aldurb10    360 - 360      alchrc10    361 - 361
      altime11    362 - 363      alunit11    364 - 364
      aldura11    365 - 366      aldurb11    367 - 367
      alchrc11    368 - 368      altime12    369 - 370
      alunit12    371 - 371      aldura12    372 - 373
      aldurb12    374 - 374      alchrc12    375 - 375
      altime13    376 - 377      alunit13    378 - 378
      aldura13    379 - 380      aldurb13    381 - 381
      alchrc13    382 - 382      altime14    383 - 384
      alunit14    385 - 385      aldura14    386 - 387
      aldurb14    388 - 388      alchrc14    389 - 389
      altime15    390 - 391      alunit15    392 - 392
      aldura15    393 - 394      aldurb15    395 - 395
      alchrc15    396 - 396      altime16    397 - 398
      alunit16    399 - 399      aldura16    400 - 401
      aldurb16    402 - 402      alchrc16    403 - 403
      altime17    404 - 405      alunit17    406 - 406
      aldura17    407 - 408      aldurb17    409 - 409
      alchrc17    410 - 410      altime18    411 - 412
      alunit18    413 - 413      aldura18    414 - 415
      aldurb18    416 - 416      alchrc18    417 - 417
      altime19    418 - 419      alunit19    420 - 420
      aldura19    421 - 422      aldurb19    423 - 423
      alchrc19    424 - 424      altime20    425 - 426
      alunit20    427 - 427      aldura20    428 - 429
      aldurb20    430 - 430      alchrc20    431 - 431
      altime21    432 - 433      alunit21    434 - 434
      aldura21    435 - 436      aldurb21    437 - 437
      alchrc21    438 - 438      altime22    439 - 440
      alunit22    441 - 441      aldura22    442 - 443
      aldurb22    444 - 444      alchrc22    445 - 445
      altime23    446 - 447      alunit23    448 - 448
      aldura23    449 - 450      aldurb23    451 - 451
      alchrc23    452 - 452      altime24    453 - 454
      alunit24    455 - 455      aldura24    456 - 457
      aldurb24    458 - 458      alchrc24    459 - 459
      altime25    460 - 461      alunit25    462 - 462
      aldura25    463 - 464      aldurb25    465 - 465
      alchrc25    466 - 466      altime26    467 - 468
      alunit26    469 - 469      aldura26    470 - 471
      aldurb26    472 - 472      alchrc26    473 - 473
      altime27    474 - 475      alunit27    476 - 476
      aldura27    477 - 478      aldurb27    479 - 479
      alchrc27    480 - 480      altime28    481 - 482
      alunit28    483 - 483      aldura28    484 - 485
      aldurb28    486 - 486      alchrc28    487 - 487
      altime29    488 - 489      alunit29    490 - 490
      aldura29    491 - 492      aldurb29    493 - 493
      alchrc29    494 - 494      altime30    495 - 496
      alunit30    497 - 497      aldura30    498 - 499
      aldurb30    500 - 500      alchrc30    501 - 501
      altime31    502 - 503      alunit31    504 - 504
      aldura31    505 - 506      aldurb31    507 - 507
      alchrc31    508 - 508      altime32    509 - 510
      alunit32    511 - 511      aldura32    512 - 513
      aldurb32    514 - 514      alchrc32    515 - 515
      altime33    516 - 517      alunit33    518 - 518
      aldura33    519 - 520      aldurb33    521 - 521
      alchrc33    522 - 522      altime34    523 - 524
      alunit34    525 - 525      aldura34    526 - 527
      aldurb34    528 - 528      alchrc34    529 - 529
      altime90    530 - 531      alunit90    532 - 532
      aldura90    533 - 534      aldurb90    535 - 535
      alchrc90    536 - 536      altime91    537 - 538
      alunit91    539 - 539      aldura91    540 - 541
      aldurb91    542 - 542      alchrc91    543 - 543
      alcndrt     544 - 544      alchronr    545 - 545

      smkev       546 - 546      smkreg      547 - 548
      smknow      549 - 549      smkstat2    550 - 550
      smkqtno     551 - 552      smkqttp     553 - 553
      smkqty      554 - 555      cigsda1     556 - 557
      cigdamo     558 - 559      cigsda2     560 - 561
      cigsday     562 - 563      cigqtyr     564 - 564
      vigno       565 - 567      vigtp       568 - 568
      vigfreqw    569 - 570      viglngno    571 - 573
      viglngtp    574 - 574      vigmin      575 - 577
      modno       578 - 580      modtp       581 - 581
      modfreqw    582 - 583      modlngno    584 - 586
      modlngtp    587 - 587      modmin      588 - 590
      strngno     591 - 593      strngtp     594 - 594
      strfreqw    595 - 596      alc1yr      597 - 597
      alclife     598 - 598      alc12mno    599 - 601
      alc12mtp    602 - 602      alc12mwk    603 - 604
      alc12myr    605 - 607      alcamt      608 - 609
      alcstat     610 - 611      alc5upno    612 - 614
      alc5uptp    615 - 615      alc5upyr    616 - 618
      aheight     619 - 620      aweightp    621 - 623
      bmi         624 - 627      sleep       628 - 629

      ausualpl    630 - 630      aplkind     631 - 631
      ahcplrou    632 - 632      ahcplknd    633 - 633
      ahcchgyr    634 - 634      ahcchghi    635 - 635
      ahcdlyr1    636 - 636      ahcdlyr2    637 - 637
      ahcdlyr3    638 - 638      ahcdlyr4    639 - 639
      ahcdlyr5    640 - 640      ahcafyr1    641 - 641
      ahcafyr2    642 - 642      ahcafyr3    643 - 643
      ahcafyr4    644 - 644      adnlong2    645 - 645
      ahcsyr1     646 - 646      ahcsyr2     647 - 647
      ahcsyr3     648 - 648      ahcsyr4     649 - 649
      ahcsyr5     650 - 650      ahcsyr6     651 - 651
      ahcsyr7     652 - 652      ahcsyr8     653 - 653
      ahcsyr9     654 - 654      ahcsyr10    655 - 655
      ahernoy2    656 - 657      ahchyr      658 - 658
      ahchmoyr    659 - 660      ahchnoy2    661 - 662
      ahcnoyr2    663 - 664      asrgyr      665 - 665
      asrgnoyr    666 - 667      amdlongr    668 - 668
      shtfluyr    669 - 669      ashflu_m    670 - 671
      ashflu_y    672 - 675      sprfluyr    676 - 676
      aspflu_m    677 - 678      aspflu_y    679 - 682
      shtpnuyr    683 - 683      apox        684 - 684
      apox12mo    685 - 685      ahep        686 - 686
      ahepliv     687 - 687      shthepb     688 - 688
      shepdos     689 - 689

      bldgv       690 - 690      bldg12m     691 - 691
      hivtst      692 - 692      whytst_r    693 - 694
      tst12m_m    695 - 696      tst12m_y    697 - 700
      timetst     701 - 701      reatst_c    702 - 703
      reaswhor    704 - 704      lastst_c    705 - 706
      clntyp_c    707 - 708      whoadm      709 - 709
      givnam      710 - 710      extst12m    711 - 711
      chnsadsp    712 - 712      stmtru      713 - 713
      std         714 - 714      stddoc      715 - 715
      stdwher     716 - 716      tbhrd       717 - 717
      tbknow      718 - 718      tb          719 - 719
      tbsprd1     720 - 720      tbsprd2     721 - 721
      tbsprd3     722 - 722      tbsprd4     723 - 723
      tbsprd5     724 - 724      tbsprd6     725 - 725
      tbcured     726 - 726      tbchanc     727 - 727
      tbshame     728 - 728      homeless    729 - 729

using "$DAT/2005/samadult.dat";
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
label variable stratum  "UCF.000_00.000: Stratum for variance estimation";
label variable psu      "UCF.000_00.000: PSU for variance estimation";

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
label variable yrswrkpa "ASD Recode: Years on the job";
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
label variable jntchr   "ACN.270_00.000: Symptoms begin more than 3 m ago";
label variable jnthp    "
ACN.280_00.000: Ever seen doctor or hlth prof for joint symptoms";
label variable arth1    "ACN.290_00.000: Ever been told you had arthritis";
label variable arthlmt  "
ACN.295_00.000: Limited due to arthritis or joint symptoms";
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
label variable aflhc32_ "'Old age'/elderly/aging-related problem";
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
AHS.308_01.000: Duration of hypertension/hgh blood pressure problem: Number of u
nits";
label variable alunit9  "
AHS.308_02.000: Duration of hypertension/hgh blood pressure problem: Time unit";
label variable aldura9  "
AHS.308_02.000: Duration of hypertension/hgh blood pressure problem (in years)";
label variable aldurb9  "
AHS.308_02.000: Duration of hypertension/hgh  problem  recode 2";
label variable alchrc9  "
AHS.308_02.000: Hypertension/hgh blood pressure problem condition status";
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
AHS.316_01.000: Duration of depression/anxiety/emotnl prob: Number of units";
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
AHS.318_01.000: Duration of missing limbs: Number of units";
label variable alunit19 "AHS.318_02.000: Duration of missing limbs: Time unit";
label variable aldura19 "
AHS.318_02.000: Duration of missing limbs problem (in years)";
label variable aldurb19 "
AHS.318_02.000: Duration of missing limbs problem recode 2";
label variable alchrc19 "AHS.318_02.000: Missing limbs problem condition status
";
label variable altime20 "
AHS.319_01.000: Duration of musculoskeletal problem: Number of units";
label variable alunit20 "
AHS.319_02.000: Duration of musculoskeletal problem: Time unit";
label variable aldura20 "
AHS.319_02.000: Duration of musculoskeletal problem (in years)";
label variable aldurb20 "
AHS.319_02.000: Duration of musculoskeletal problem recode 2";
label variable alchrc20 "
AHS.319_02.000: Musculoskeletal problem condition status";
label variable altime21 "
AHS.320_01.000: Duration of circulatory problem: Number of units";
label variable alunit21 "
AHS.320_02.000: Duration of circulatory problem: Time unit";
label variable aldura21 "
AHS.320_02.000: Duration of circulatory problem (in years)";
label variable aldurb21 "
AHS.320_02.000: Duration of circulatory problem recode 2";
label variable alchrc21 "AHS.320_02.000: Circulatory problem condition status";
label variable altime22 "
AHS.321_01.000: Duration of endocrine problem: Number of units";
label variable alunit22 "
AHS.321_02.000: Duration of endocrine problem: Time unit";
label variable aldura22 "
AHS.321_02.000: Duration of endocrine problem (in years)";
label variable aldurb22 "AHS.321_02.000: Duration of endocrine problem recode 2
";
label variable alchrc22 "AHS.321_02.000: Endocrine problem condition status";
label variable altime23 "
AHS.322_01.000: Duration of nervous system condition: Number of units";
label variable alunit23 "
AHS.322_02.000: Duration of nervous system condition: Time unit";
label variable aldura23 "
AHS.322_02.000: Duration of nervous system condition (in years)";
label variable aldurb23 "
AHS.322_02.000: Duration of nervous system condition recode 2";
label variable alchrc23 "AHS.322_02.000: Nervous system condition status";
label variable altime24 "
AHS.323_01.000: Duration of digestive problems: Number of units";
label variable alunit24 "
AHS.323_02.000: Duration of digestive problems: Number of units";
label variable aldura24 "
AHS.323_02.000: Duration of digestive problem (in years)";
label variable aldurb24 "AHS.323_02.000: Duration of digestive problem recode 2
";
label variable alchrc24 "AHS.323_02.000: Digestive problem condition status";
label variable altime25 "
AHS.324_01.000: Duration of genitourinary problem: Number of units";
label variable alunit25 "
AHS.324_02.000: Duration of genitourinary problem: Time unit";
label variable aldura25 "
AHS.324_02.000: Duration of genitourinary problem (in years)";
label variable aldurb25 "
AHS.324_02.000: Duration of genitourinary problem recode 2";
label variable alchrc25 "AHS.324_02.000: Genitourinary problem condition status
";
label variable altime26 "
AHS.325_01.000: Duration of skin problems: Number of units";
label variable alunit26 "AHS.325_02.000: Duration of skin problems: Time unit";
label variable aldura26 "AHS.325_02.000: Duration of skin problem (in years)";
label variable aldurb26 "AHS.325_02.000: Duration of skin problem recode 2";
label variable alchrc26 "AHS.325_02.000: Skin problems condition status";
label variable altime27 "
AHS.326_01.000: Duration of blood problem: Number of units";
label variable alunit27 "AHS.326_02.000: Duration of blood problem: Time unit";
label variable aldura27 "AHS.326_02.000: Duration of blood problem (in years)";
label variable aldurb27 "AHS.326_02.000: Duration of blood problem recode 2";
label variable alchrc27 "AHS.326_02.000: Blood problem condition status";
label variable altime28 "
AHS.327_01.000: Duration of benign tumor: Number of units";
label variable alunit28 "AHS.327_02.000: Duration of benign tumor: Time unit";
label variable aldura28 "AHS.327_02.000: Duration of benign tumor (in years)";
label variable aldurb28 "AHS.327_02.000: Duration of benign tumor recode 2";
label variable alchrc28 "AHS.327_02.000: Benign tumor condition status";
label variable altime29 "
AHS.328_01.000: Duration of alcohol or drug problem: Number of units";
label variable alunit29 "
AHS.328_02.000: Duration of alcohol or drug problem: Time unit";
label variable aldura29 "
AHS.328_02.000: Duration of alcohol or drug problem (in years)";
label variable aldurb29 "
AHS.328_02.000: Duration of alcohol or drug problem recode 2";
label variable alchrc29 "
AHS.328_02.000: Alcohol or drug problem condition status";
label variable altime30 "
AHS.329_01.000: Duration of other mental problem: Number of units";
label variable alunit30 "
AHS.329_02.000: Duration of other mental problem: Time unit";
label variable aldura30 "
AHS.329_02.000: Duration of other mental problem (in years)";
label variable aldurb30 "
AHS.329_02.000: Duration of other mental problem recode 2";
label variable alchrc30 "AHS.329_02.000: Other mental problem condition status";
label variable altime31 "
AHS.330_01.000: Duration of surgical after-effects: Number of units";
label variable alunit31 "
AHS.330_02.000: Duration of surgical after-effects: Time unit";
label variable aldura31 "
AHS.330_02.000: Duration of surgical after-effects (in years)";
label variable aldurb31 "
AHS.330_02.000: Duration of surgical after-effects recode 2";
label variable alchrc31 "AHS.330_02.000: Surgical after-effects condition status
";
label variable altime32 "Duration of 'old age': Number of units";
label variable alunit32 "Duration of 'old age': Number of units";
label variable aldura32 "Duration of 'old age' (in years)";
label variable aldurb32 "Duration of 'old age', recode 2";
label variable alchrc32 "'Old age' condition status";
label variable altime33 "
AHS.332_01.000: Duration of fatigue problem: Number of units";
label variable alunit33 "AHS.332_02.000: Duration of fatigue problem: Time unit
";
label variable aldura33 "AHS.332_02.000: Duration of fatigue problem (in years)
";
label variable aldurb33 "AHS.332_02.000: Duration of fatigue problem recode 2";
label variable alchrc33 "AHS.332_02.000: Fatigue problem condition status";
label variable altime34 "
AHS.333_01.000: Duration of pregnancy-related problem: Number of units";
label variable alunit34 "
AHS.333_02.000: Duration of pregnancy-related problem: Time unit";
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
AHS.336_02.000: Duration of other N.E.C. problem (2) recode2";
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
   10               "Household"
   20               "Person"
   30               "Sample Adult"
   31               "Sample Adult Cancer"
   40               "Sample Child"
   60               "Family"
   70               "Injury/Poisoning Episode"
   75               "Injury/Poisoning Verbatim"
;
label define sap002x
   2005             "2005"
;
label define sap004x
   1                "Quarter 1"
   2                "Quarter 2"
   3                "Quarter 3"
   4                "Quarter 4"
;
label define sap005x
   01               "Week 1"
   02               "Week 2"
   03               "Week 3"
   04               "Week 4"
   05               "Week 5"
   06               "Week 6"
   07               "Week 7"
   08               "Week 8"
   09               "Week 9"
   10               "Week 10"
   11               "Week 11"
   12               "Week 12"
   13               "Week 13"
;
label define sap010x
   1                "Northeast"
   2                "Midwest"
   3                "South"
   4                "West"
;
label define sap013x
   1                "Male"
   2                "Female"
;
label define sap014x
   00               "Multiple Hispanic"
   01               "Puerto Rico"
   02               "Mexican"
   03               "Mexican-American"
   04               "Cuban/Cuban American"
   05               "Dominican (Republic)"
   06               "Central or South American"
   07               "Other Latin American, type not specified"
   08               "Other Spanish"
   09               "Hispanic/Latino/Spanish, non-specific type"
   10               "Hispanic/Latino/Spanish, type refused"
   11               "Hispanic/Latino/Spanish, type not ascertained"
   12               "Not Hispanic/Spanish origin"
;
label define sap015x
   01               "White only"
   02               "Black/African American only"
   03               "AIAN only"
   04               "Asian only"
   05               "Race group not releasable (See file layout)"
   06               "Multiple race"
;
label define sap016x
   01               "White"
   02               "Black/African American"
   03               "Indian (American), Alaska Native"
   09               "Asian Indian"
   10               "Chinese"
   11               "Filipino"
   15               "Other Asian (See file layout)"
   16               "Primary race not releasable (See file layout)"
   17               "Multiple race, no primary race selected"
;
label define sap017x
   01               "White"
   02               "Black/African American"
   03               "Indian (American) (includes Eskimo, Aleut)"
   06               "Chinese"
   07               "Filipino"
   12               "Asian Indian"
   16               "Other race (See file layout)"
   17               "Multiple race, no primary race selected"
;
label define sap018x
   00               "Under 1 year"
   85               "85+ years"
;
label define sap019x
   0                "Under 14 years"
   1                "Married - spouse in household"
   2                "Married - spouse not in household"
   3                "Married - spouse in household unknown"
   4                "Widowed"
   5                "Divorced"
   6                "Separated"
   7                "Never married"
   8                "Living with partner"
   9                "Unknown marital status"
;
label define sap020x
   1                "Physical or mental condition prohibits responding"
   2                "Sample adult is able to respond"
   3                "Unknown"
;
label define sap021x
   1                "Yes"
   2                "No"
;
label define sap022x
   1                "Relative who lives in household"
   2                "Relative who doesn't live in household"
   3                "Other caregiver"
   4                "Other"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap023x
   1                "Working for pay at a job or business"
   2                "With a job or business but not at work"
   3                "Looking for work"
   4                "Working, but not for pay, at a job or business"
   5                "Not working at a job or business and not looking for work"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap024x
   01               "Taking care of house or family"
   02               "Going to school"
   03               "Retired"
   04               "On a planned vacation from work"
   05               "On family or maternity leave"
   06               "Temporarily unable to work for health reasons"
   07               "Have job/contract and off-season"
   08               "On layoff"
   09               "Disabled"
   10               "Other"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap025x
   1                "Yes"
   2                "No"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap030x
   1                "Employee of a PRIVATE company for wages"
   2                "A FEDERAL government employee"
   3                "A STATE government employee"
   4                "A LOCAL government employee"
   5                "
Self-employed in OWN business, professional practice or farm"
   6                "Working WITHOUT PAY in a family-owned business or farm"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap032x
   01               "1-9 employees"
   02               "10-24 employees"
   03               "25-49 employees"
   04               "50-99 employees"
   05               "100-249 employees"
   06               "250-499 employees"
   07               "500-999 employees"
   08               "1000 employees or more"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap033x
   00               "Less than 1 year"
   35               "35 or more years"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap053x
   1                "Mentioned"
   2                "Not mentioned"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap084x
   85               "85+ years"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap114x
   1                "Yes"
   2                "No"
   3                "Borderline"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap116x
   00               "Within past year"
   85               "85+ years"
   96               "1+ year(s) with diabetes and age is 85+"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap155x
   1                "Good"
   2                "A little trouble"
   3                "A lot of trouble"
   4                "Deaf"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap159x
   1                "ALL of the time"
   2                "MOST of the time"
   3                "SOME of the time"
   4                "A LITTLE of the time"
   5                "NONE of the time"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap165x
   1                "A lot"
   2                "Some"
   3                "A little"
   4                "Not at all"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap166x
   0                "Had job last week"
   1                "No job last week, had job past 12 m"
   2                "No job last week, no job past 12 m"
   3                "Never worked"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap167x
   000              "None"
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define sap169x
   1                "Better"
   2                "Worse"
   3                "About the same"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap171x
   0                "Not at all difficult"
   1                "Only a little difficult"
   2                "Somewhat difficult"
   3                "Very difficult"
   4                "Can't do at all"
   6                "Do not do this activity"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap183x
   1                "Limited in any way"
   2                "Not limited in any way"
   3                "Unknown if limited"
;
label define sap220x
   95               "95+"
   96               "Since birth"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap221x
   1                "Day(s)"
   2                "Week(s)"
   3                "Month(s)"
   4                "Year(s)"
   6                "Since birth"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap222x
   00               "Less than 1 year"
   85               "85+ years"
   96               "Unknown number of years"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap223x
   1                "Less than 3 months"
   2                "3-5 months"
   3                "6-12 months"
   4                "More than 1 year"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap224x
   1                "Chronic"
   2                "Not chronic"
   9                "Unknown if chronic"
;
label define sap400x
   1                "At least one chronic cond causes functl lim"
   2                "No chronic cond causes functl lim"
   9                "Unk if any chronic cond causes functl lim"
;
label define sap401x
   0                "Not limited in any way (incl unk if limited)"
   1                "Limited; caused by at least one chronic cond"
   2                "Limited; not caused by chronic cond"
   3                "Limited; unk if cond is chronic"
;
label define sap403x
   85               "85 years or older"
   96               "Never smoked regularly"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap404x
   1                "Every day"
   2                "Some days"
   3                "Not at all"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap405x
   1                "Current every day smoker"
   2                "Current some day smoker"
   3                "Former smoker"
   4                "Never smoker"
   5                "Smoker, current status unknown"
   9                "Unknown if ever smoked"
;
label define sap406x
   95               "95+"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap407x
   1                "Day(s)"
   2                "Week(s)"
   3                "Month(s)"
   4                "Year(s)"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap408x
   00               "Less than 1 year"
   70               "70+ years"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap409x
   95               "95+ cigarettes"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap410x
   00               "None"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap414x
   000              "Never"
   996              "Unable to do this type activity"
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define sap415x
   0                "Never"
   1                "Per day"
   2                "Per week"
   3                "Per month"
   4                "Per year"
   6                "Unable to do this activity"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap416x
   00               "Less than once per week"
   95               "Never"
   96               "Unable to do vigorous activity"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap417x
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define sap418x
   1                "Minutes"
   2                "Hours"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap419x
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define sap422x
   00               "Less than once per week"
   95               "Never"
   96               "Unable to do light or moderate activity"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap428x
   00               "Less than once per week"
   95               "Never"
   96               "Unable to do strength activity"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap431x
   000              "Never"
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define sap432x
   0                "Never/None"
   1                "Week"
   2                "Month"
   3                "Year"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap433x
   00               "Less than one day per week"
   95               "Did not drink in past year"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap434x
   000              "Never/none"
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define sap435x
   95               "95+ drinks"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap436x
   01               "Lifetime abstainer"
   02               "Former infrequent"
   03               "Former regular"
   04               "Former, unknown frequency"
   05               "Current infrequent"
   06               "Current light"
   07               "Current moderate"
   08               "Current heavier"
   09               "Current drinker, frequency/level unknown"
   10               "Drinking status unknown"
;
label define sap437x
   000              "Never/None"
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define sap438x
   0                "Never/None"
   1                "Per week"
   2                "Per month"
   3                "Per year"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap440x
   96               "Not available"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap441x
   996              "Not available"
   997              "Refused"
   998              "Not ascertained"
   999              "Don't know"
;
label define sap443x
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap444x
   1                "Yes"
   2                "There is NO place"
   3                "There is MORE THAN ONE place"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap445x
   1                "Clinic or health center"
   2                "Doctor's office or HMO"
   3                "Hospital emergency room"
   4                "Hospital outpatient department"
   5                "Some other place"
   6                "Doesn't go to one place most often"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap447x
   0                "Doesn't get preventive care anywhere"
   1                "Clinic or health center"
   2                "Doctor's office or HMO"
   3                "Hospital emergency room"
   4                "Hospital outpatient department"
   5                "Some other place"
   6                "Doesn't go to one place most often"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap459x
   0                "Never"
   1                "6 months or less"
   2                "More than 6 mos, but not more than 1 yr ago"
   3                "More than 1 yr, but not more than 2 yrs ago"
   4                "More than 2 yrs, but not more than 5 yrs ago"
   5                "More than 5 years ago"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap470x
   00               "None"
   01               "1"
   02               "2-3"
   03               "4-5"
   04               "6-7"
   05               "8-9"
   06               "10-12"
   07               "13-15"
   08               "16 or more"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap472x
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap473x
   01               "1"
   02               "2-3"
   03               "4-5"
   04               "6-7"
   05               "8-9"
   06               "10-12"
   07               "13-15"
   08               "16 or more"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap476x
   95               "95+ times"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap479x
   01               "January"
   02               "February"
   03               "March"
   04               "April"
   05               "May"
   06               "June"
   07               "July"
   08               "August"
   09               "September"
   10               "October"
   11               "November"
   12               "December"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap480x
   2004             "2004"
   2005             "2005"
   2006             "2006"
   9997             "Refused"
   9998             "Not ascertained"
   9999             "Don't know"
;
label define sap490x
   1                "Received at least 3 doses"
   2                "Received less than 3 doses"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap494x
   01               "It's unlikely you've been exposed to HIV"
   02               "
You were afraid to find out if you were HIV positive (that you had HIV)"
   03               "
You didn't want to think about HIV or about being HIV positive"
   04               "
You were worried your name would be reported to the government if you tested pos
itive"
   05               "You didn't know where to get tested"
   06               "You don't like needles"
   07               "
You were afraid of losing job, insurance, housing, friends, family, if people kn
ew you were positive for AIDS infection"
   08               "Some other reason"
   09               "No particular reason"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap495x
   01               "January"
   02               "February"
   03               "March"
   04               "April"
   05               "May"
   06               "June"
   07               "July"
   08               "August"
   09               "September"
   10               "October"
   11               "November"
   12               "December"
   96               "Time period format"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap496x
   9996             "Time period format"
   9997             "Refused"
   9998             "Not ascertained"
   9999             "Don't know"
;
label define sap497x
   1                "6 months or less"
   2                "More than 6 months but not more than 1 year ago"
   3                "More than 1 year, but not more than 2 years ago"
   4                "More than 2 years, but not more than 5 years ago"
   5                "More than 5 years ago"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap498x
   01               "Someone suggested you should be tested"
   02               "You might have been exposed through sex or drug use"
   03               "You might have been exposed through your work or at work"
   04               "You just wanted to find out if you were infected or not"
   05               "
For part of a routine medical check-up, or for hospitalization or surgical proce
dure"
   06               "You were sick or had a medical problem"
   07               "You were pregnant or delivered a baby"
   08               "For health or life insurance coverage"
   09               "For military induction, separation, or military service"
   10               "For immigration"
   11               "For marriage license or to get married"
   12               "You were concerned you could give HIV to someone"
   13               "
You wanted medical care or new treatments if you tested positive"
   14               "Some other reason"
   15               "No particular reason"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap499x
   1                "Doctor, nurse or other health care professional"
   2                "Sex partner"
   3                "Someone at health department"
   4                "Family member or friend"
   5                "Other"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap500x
   01               "Private doctor/HMO"
   02               "AIDS clinic/counseling/testing site"
   03               "Hospital, emergency room, outpatient clinic"
   04               "Other type of clinic"
   05               "Public health department"
   06               "At home"
   07               "Drug treatment facility"
   08               "Military induction or military service site"
   09               "Immigration site"
   10               "In a correctional facility (jail or prison)"
   11               "Other location"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap501x
   01               "Family planning clinic"
   02               "Prenatal clinic"
   03               "Tuberculosis clinic"
   04               "STD clinic"
   05               "Community health clinic"
   06               "Clinic run by employer or insurance company"
   07               "Other"
   97               "Refused"
   98               "Not ascertained"
   99               "Don't know"
;
label define sap502x
   1                "Nurse or health worker"
   2                "Self-sampling kit"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap505x
   1                "High/Already have HIV/AIDS"
   2                "Medium"
   3                "Low"
   4                "None"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap506x
   1                "Yes, at least one statement is true"
   2                "No, none of these statements are true"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap509x
   1                "Private doctor"
   2                "Family planning clinic"
   3                "STD clinic"
   4                "Emergency room"
   5                "Health department"
   6                "Some other place"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap512x
   1                "A lot"
   2                "Some"
   3                "A little"
   4                "Nothing"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;
label define sap520x
   1                "High"
   2                "Medium"
   3                "Low"
   4                "None"
   5                "Already have TB"
   7                "Refused"
   8                "Not ascertained"
   9                "Don't know"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   sap001x;   label values srvy_yr   sap002x;
label values intv_qrt  sap004x;   label values assignwk  sap005x;

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
label values aasmev    sap025x;   label values aasstill  sap025x;
label values aasmyr    sap025x;   label values aasmeryr  sap025x;
label values ulcev     sap025x;   label values ulcyr     sap025x;
label values canev     sap025x;   label values cnkind1   sap053x;
label values cnkind2   sap053x;   label values cnkind3   sap053x;
label values cnkind4   sap053x;   label values cnkind5   sap053x;
label values cnkind6   sap053x;   label values cnkind7   sap053x;
label values cnkind8   sap053x;   label values cnkind9   sap053x;
label values cnkind10  sap053x;   label values cnkind11  sap053x;
label values cnkind12  sap053x;   label values cnkind13  sap053x;
label values cnkind14  sap053x;   label values cnkind15  sap053x;
label values cnkind16  sap053x;   label values cnkind17  sap053x;
label values cnkind18  sap053x;   label values cnkind19  sap053x;
label values cnkind20  sap053x;   label values cnkind21  sap053x;
label values cnkind22  sap053x;   label values cnkind23  sap053x;
label values cnkind24  sap053x;   label values cnkind25  sap053x;
label values cnkind26  sap053x;   label values cnkind27  sap053x;
label values cnkind28  sap053x;   label values cnkind29  sap053x;
label values cnkind30  sap053x;   label values cnkind31  sap053x;
label values canage1   sap084x;   label values canage2   sap084x;
label values canage3   sap084x;   label values canage4   sap084x;
label values canage5   sap084x;   label values canage6   sap084x;
label values canage7   sap084x;   label values canage8   sap084x;
label values canage9   sap084x;   label values canage10  sap084x;
label values canage11  sap084x;   label values canage12  sap084x;
label values canage13  sap084x;   label values canage14  sap084x;
label values canage15  sap084x;   label values canage16  sap084x;
label values canage17  sap084x;   label values canage18  sap084x;
label values canage19  sap084x;   label values canage20  sap084x;
label values canage21  sap084x;   label values canage22  sap084x;
label values canage23  sap084x;   label values canage24  sap084x;
label values canage25  sap084x;   label values canage26  sap084x;
label values canage27  sap084x;   label values canage28  sap084x;
label values canage29  sap084x;   label values canage30  sap084x;
label values dibev     sap114x;   label values dibage    sap084x;
label values difage2   sap116x;   label values insln     sap025x;
label values dibpill   sap025x;   label values ahayfyr   sap025x;
label values sinyr     sap025x;   label values cbrchyr   sap025x;
label values kidwkyr   sap025x;   label values livyr     sap025x;
label values jntsymp   sap025x;   label values jmthp1    sap053x;
label values jmthp2    sap053x;   label values jmthp3    sap053x;
label values jmthp4    sap053x;   label values jmthp5    sap053x;
label values jmthp6    sap053x;   label values jmthp7    sap053x;
label values jmthp8    sap053x;   label values jmthp9    sap053x;
label values jmthp10   sap053x;   label values jmthp11   sap053x;
label values jmthp12   sap053x;   label values jmthp13   sap053x;
label values jmthp14   sap053x;   label values jmthp15   sap053x;
label values jmthp16   sap053x;   label values jmthp17   sap053x;
label values jntchr    sap025x;   label values jnthp     sap025x;
label values arth1     sap025x;   label values arthlmt   sap025x;
label values paineck   sap025x;   label values painlb    sap025x;
label values painleg   sap025x;   label values painface  sap025x;
label values amigr     sap025x;   label values acold2w   sap025x;
label values aintil2w  sap025x;   label values pregnow   sap025x;
label values hearaid   sap025x;   label values ahearst   sap155x;
label values avision   sap025x;   label values ablind    sap025x;
label values lupprt    sap025x;   label values sad       sap159x;
label values nervous   sap159x;   label values restless  sap159x;
label values hopeless  sap159x;   label values effort    sap159x;
label values worthls   sap159x;   label values mhamtmo   sap165x;

label values wrklyr3   sap166x;   label values wkdayr    sap167x;
label values beddayr   sap167x;   label values ahstatyr  sap169x;
label values speceq    sap025x;   label values flwalk    sap171x;
label values flclimb   sap171x;   label values flstand   sap171x;
label values flsit     sap171x;   label values flstoop   sap171x;
label values flreach   sap171x;   label values flgrasp   sap171x;
label values flcarry   sap171x;   label values flpush    sap171x;
label values flshop    sap171x;   label values flsocl    sap171x;
label values flrelax   sap171x;   label values fla1ar    sap183x;
label values aflhca1   sap053x;   label values aflhca2   sap053x;
label values aflhca3   sap053x;   label values aflhca4   sap053x;
label values aflhca5   sap053x;   label values aflhca6   sap053x;
label values aflhca7   sap053x;   label values aflhca8   sap053x;
label values aflhca9   sap053x;   label values aflhca10  sap053x;
label values aflhca11  sap053x;   label values aflhca12  sap053x;
label values aflhca13  sap053x;   label values aflhca14  sap053x;
label values aflhca15  sap053x;   label values aflhca16  sap053x;
label values aflhca17  sap053x;   label values aflhca18  sap053x;
label values aflhc19_  sap053x;   label values aflhc20_  sap053x;
label values aflhc21_  sap053x;   label values aflhc22_  sap053x;
label values aflhc23_  sap053x;   label values aflhc24_  sap053x;
label values aflhc25_  sap053x;   label values aflhc26_  sap053x;
label values aflhc27_  sap053x;   label values aflhc28_  sap053x;
label values aflhc29_  sap053x;   label values aflhc30_  sap053x;
label values aflhc31_  sap053x;   label values aflhc32_  sap053x;
label values aflhc33_  sap053x;   label values aflhc34_  sap053x;
label values aflhca90  sap053x;   label values aflhca91  sap053x;
label values altime1   sap220x;   label values alunit1   sap221x;
label values aldura1   sap222x;   label values aldurb1   sap223x;
label values alchrc1   sap224x;   label values altime2   sap220x;
label values alunit2   sap221x;   label values aldura2   sap222x;
label values aldurb2   sap223x;   label values alchrc2   sap224x;
label values altime3   sap220x;   label values alunit3   sap221x;
label values aldura3   sap222x;   label values aldurb3   sap223x;
label values alchrc3   sap224x;   label values altime4   sap220x;
label values alunit4   sap221x;   label values aldura4   sap222x;
label values aldurb4   sap223x;   label values alchrc4   sap224x;
label values altime5   sap220x;   label values alunit5   sap221x;
label values aldura5   sap222x;   label values aldurb5   sap223x;
label values alchrc5   sap224x;   label values altime6   sap220x;
label values alunit6   sap221x;   label values aldura6   sap222x;
label values aldurb6   sap223x;   label values alchrc6   sap224x;
label values altime7   sap220x;   label values alunit7   sap221x;
label values aldura7   sap222x;   label values aldurb7   sap223x;
label values alchrc7   sap224x;   label values altime8   sap220x;
label values alunit8   sap221x;   label values aldura8   sap222x;
label values aldurb8   sap223x;   label values alchrc8   sap224x;
label values altime9   sap220x;   label values alunit9   sap221x;
label values aldura9   sap222x;   label values aldurb9   sap223x;
label values alchrc9   sap224x;   label values altime10  sap220x;
label values alunit10  sap221x;   label values aldura10  sap222x;
label values aldurb10  sap223x;   label values alchrc10  sap224x;
label values altime11  sap220x;   label values alunit11  sap221x;
label values aldura11  sap222x;   label values aldurb11  sap223x;
label values alchrc11  sap224x;   label values altime12  sap220x;
label values alunit12  sap221x;   label values aldura12  sap222x;
label values aldurb12  sap223x;   label values alchrc12  sap224x;
label values altime13  sap220x;   label values alunit13  sap221x;
label values aldura13  sap222x;   label values aldurb13  sap223x;
label values alchrc13  sap224x;   label values altime14  sap220x;
label values alunit14  sap221x;   label values aldura14  sap222x;
label values aldurb14  sap223x;   label values alchrc14  sap224x;
label values altime15  sap220x;   label values alunit15  sap221x;
label values aldura15  sap222x;   label values aldurb15  sap223x;
label values alchrc15  sap224x;   label values altime16  sap220x;
label values alunit16  sap221x;   label values aldura16  sap222x;
label values aldurb16  sap223x;   label values alchrc16  sap224x;
label values altime17  sap220x;   label values alunit17  sap221x;
label values aldura17  sap222x;   label values aldurb17  sap223x;
label values alchrc17  sap224x;   label values altime18  sap220x;
label values alunit18  sap221x;   label values aldura18  sap222x;
label values aldurb18  sap223x;   label values alchrc18  sap224x;
label values altime19  sap220x;   label values alunit19  sap221x;
label values aldura19  sap222x;   label values aldurb19  sap223x;
label values alchrc19  sap224x;   label values altime20  sap220x;
label values alunit20  sap221x;   label values aldura20  sap222x;
label values aldurb20  sap223x;   label values alchrc20  sap224x;
label values altime21  sap220x;   label values alunit21  sap221x;
label values aldura21  sap222x;   label values aldurb21  sap223x;
label values alchrc21  sap224x;   label values altime22  sap220x;
label values alunit22  sap221x;   label values aldura22  sap222x;
label values aldurb22  sap223x;   label values alchrc22  sap224x;
label values altime23  sap220x;   label values alunit23  sap221x;
label values aldura23  sap222x;   label values aldurb23  sap223x;
label values alchrc23  sap224x;   label values altime24  sap220x;
label values alunit24  sap221x;   label values aldura24  sap222x;
label values aldurb24  sap223x;   label values alchrc24  sap224x;
label values altime25  sap220x;   label values alunit25  sap221x;
label values aldura25  sap222x;   label values aldurb25  sap223x;
label values alchrc25  sap224x;   label values altime26  sap220x;
label values alunit26  sap221x;   label values aldura26  sap222x;
label values aldurb26  sap223x;   label values alchrc26  sap224x;
label values altime27  sap220x;   label values alunit27  sap221x;
label values aldura27  sap222x;   label values aldurb27  sap223x;
label values alchrc27  sap224x;   label values altime28  sap220x;
label values alunit28  sap221x;   label values aldura28  sap222x;
label values aldurb28  sap223x;   label values alchrc28  sap224x;
label values altime29  sap220x;   label values alunit29  sap221x;
label values aldura29  sap222x;   label values aldurb29  sap223x;
label values alchrc29  sap224x;   label values altime30  sap220x;
label values alunit30  sap221x;   label values aldura30  sap222x;
label values aldurb30  sap223x;   label values alchrc30  sap224x;
label values altime31  sap220x;   label values alunit31  sap221x;
label values aldura31  sap222x;   label values aldurb31  sap223x;
label values alchrc31  sap224x;   label values altime32  sap220x;
label values alunit32  sap221x;   label values aldura32  sap222x;
label values aldurb32  sap223x;   label values alchrc32  sap224x;
label values altime33  sap220x;   label values alunit33  sap221x;
label values aldura33  sap222x;   label values aldurb33  sap223x;
label values alchrc33  sap224x;   label values altime34  sap220x;
label values alunit34  sap221x;   label values aldura34  sap222x;
label values aldurb34  sap223x;   label values alchrc34  sap224x;
label values altime90  sap220x;   label values alunit90  sap221x;
label values aldura90  sap222x;   label values aldurb90  sap223x;
label values alchrc90  sap224x;   label values altime91  sap220x;
label values alunit91  sap221x;   label values aldura91  sap222x;
label values aldurb91  sap223x;   label values alchrc91  sap224x;
label values alcndrt   sap400x;   label values alchronr  sap401x;

label values smkev     sap025x;   label values smkreg    sap403x;
label values smknow    sap404x;   label values smkstat2  sap405x;
label values smkqtno   sap406x;   label values smkqttp   sap407x;
label values smkqty    sap408x;   label values cigsda1   sap409x;
label values cigdamo   sap410x;   label values cigsda2   sap409x;
label values cigsday   sap409x;   label values cigqtyr   sap025x;
label values vigno     sap414x;   label values vigtp     sap415x;
label values vigfreqw  sap416x;   label values viglngno  sap417x;
label values viglngtp  sap418x;   label values vigmin    sap419x;
label values modno     sap414x;   label values modtp     sap415x;
label values modfreqw  sap422x;   label values modlngno  sap417x;
label values modlngtp  sap418x;   label values modmin    sap419x;
label values strngno   sap414x;   label values strngtp   sap415x;
label values strfreqw  sap428x;   label values alc1yr    sap025x;
label values alclife   sap025x;   label values alc12mno  sap431x;
label values alc12mtp  sap432x;   label values alc12mwk  sap433x;
label values alc12myr  sap434x;   label values alcamt    sap435x;
label values alcstat   sap436x;   label values alc5upno  sap437x;
label values alc5uptp  sap438x;   label values alc5upyr  sap434x;
label values aheight   sap440x;   label values aweightp  sap441x;
label values sleep     sap443x;

label values ausualpl  sap444x;   label values aplkind   sap445x;
label values ahcplrou  sap025x;   label values ahcplknd  sap447x;
label values ahcchgyr  sap025x;   label values ahcchghi  sap025x;
label values ahcdlyr1  sap025x;   label values ahcdlyr2  sap025x;
label values ahcdlyr3  sap025x;   label values ahcdlyr4  sap025x;
label values ahcdlyr5  sap025x;   label values ahcafyr1  sap025x;
label values ahcafyr2  sap025x;   label values ahcafyr3  sap025x;
label values ahcafyr4  sap025x;   label values adnlong2  sap459x;
label values ahcsyr1   sap025x;   label values ahcsyr2   sap025x;
label values ahcsyr3   sap025x;   label values ahcsyr4   sap025x;
label values ahcsyr5   sap025x;   label values ahcsyr6   sap025x;
label values ahcsyr7   sap025x;   label values ahcsyr8   sap025x;
label values ahcsyr9   sap025x;   label values ahcsyr10  sap025x;
label values ahernoy2  sap470x;   label values ahchyr    sap025x;
label values ahchmoyr  sap472x;   label values ahchnoy2  sap473x;
label values ahcnoyr2  sap470x;   label values asrgyr    sap025x;
label values asrgnoyr  sap476x;   label values amdlongr  sap459x;
label values shtfluyr  sap025x;   label values ashflu_m  sap479x;
label values ashflu_y  sap480x;   label values sprfluyr  sap025x;
label values aspflu_m  sap479x;   label values aspflu_y  sap480x;
label values shtpnuyr  sap025x;   label values apox      sap025x;
label values apox12mo  sap025x;   label values ahep      sap025x;
label values ahepliv   sap025x;   label values shthepb   sap025x;
label values shepdos   sap490x;

label values bldgv     sap025x;   label values bldg12m   sap025x;
label values hivtst    sap025x;   label values whytst_r  sap494x;
label values tst12m_m  sap495x;   label values tst12m_y  sap496x;
label values timetst   sap497x;   label values reatst_c  sap498x;
label values reaswhor  sap499x;   label values lastst_c  sap500x;
label values clntyp_c  sap501x;   label values whoadm    sap502x;
label values givnam    sap025x;   label values extst12m  sap025x;
label values chnsadsp  sap505x;   label values stmtru    sap506x;
label values std       sap025x;   label values stddoc    sap025x;
label values stdwher   sap509x;   label values tbhrd     sap025x;
label values tbknow    sap025x;   label values tb        sap512x;
label values tbsprd1   sap053x;   label values tbsprd2   sap053x;
label values tbsprd3   sap053x;   label values tbsprd4   sap053x;
label values tbsprd5   sap053x;   label values tbsprd6   sap053x;
label values tbcured   sap025x;   label values tbchanc   sap520x;
label values tbshame   sap025x;   label values homeless  sap025x;

save "$OUT/2005/samadult", replace;

#delimit cr
log close
