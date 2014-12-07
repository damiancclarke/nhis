global DAT "~/database/NHIS/Data/raw/2007"
global OUT "~/database/NHIS/Data/dta/2007"
global LOG "~/database/NHIS/Log"

log using "$LOG/samadult.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-
* ENDING DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 MAY 22, 2008  1:34 PM
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2007 NHIS Public Use Sample Adult ASCII FILE

 NOTES:

 EXECUTING THIS PROGRAM WILL REPLACE samadult.dta AND samadult.log
 IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

 THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN THE STATA WORKING
 DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY
 WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2007\

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
      hypyr        78 -  78      chdev        79 -  79
      chdyr        80 -  80      angev        81 -  81
      angyr        82 -  82      miev         83 -  83
      mievyr       84 -  84      hrtev        85 -  85
      hrtyr        86 -  86      strev        87 -  87
      stryr        88 -  88      ephev        89 -  89
      ephyr        90 -  90      aasmev       91 -  91
      aasstill     92 -  92      aasmyr       93 -  93
      aasmeryr     94 -  94      ulcev        95 -  95
      ulcyr        96 -  96      chlev        97 -  97
      chlyr        98 -  98      gumdisev     99 -  99
      gumdisyr    100 - 100      phobiaev    101 - 101
      phobiayr    102 - 102      aflupnev    103 - 103
      aflupnyr    104 - 104      prcirev     105 - 105
      prciryr     106 - 106      urev        107 - 107
      uryr        108 - 108      addhyp      109 - 109
      autism      110 - 110      bipdis      111 - 111
      dementia    112 - 112      maniapsy    113 - 113
      schizphn    114 - 114      seizures    115 - 115
      bowlev      116 - 116      bowlyr      117 - 117
      bowltyp1    118 - 118      bowltyp2    119 - 119
      bowltyp3    120 - 120      acidryr     121 - 121
      hacheyr     122 - 122      memlosyr    123 - 123
      spnyr       124 - 124      denyr       125 - 125
      alctobyr    126 - 126      subabyr     127 - 127
      sknyr       128 - 128      insyr       129 - 129
      fatyr       130 - 130      depyr       131 - 131
      anxyr       132 - 132      canev       133 - 133
      cnkind1     134 - 134      cnkind2     135 - 135
      cnkind3     136 - 136      cnkind4     137 - 137
      cnkind5     138 - 138      cnkind6     139 - 139
      cnkind7     140 - 140      cnkind8     141 - 141
      cnkind9     142 - 142      cnkind10    143 - 143
      cnkind11    144 - 144      cnkind12    145 - 145
      cnkind13    146 - 146      cnkind14    147 - 147
      cnkind15    148 - 148      cnkind16    149 - 149
      cnkind17    150 - 150      cnkind18    151 - 151
      cnkind19    152 - 152      cnkind20    153 - 153
      cnkind21    154 - 154      cnkind22    155 - 155
      cnkind23    156 - 156      cnkind24    157 - 157
      cnkind25    158 - 158      cnkind26    159 - 159
      cnkind27    160 - 160      cnkind28    161 - 161
      cnkind29    162 - 162      cnkind30    163 - 163
      cnkind31    164 - 164      canage1     165 - 166
      canage2     167 - 168      canage3     169 - 170
      canage4     171 - 172      canage5     173 - 174
      canage6     175 - 176      canage7     177 - 178
      canage8     179 - 180      canage9     181 - 182
      canage10    183 - 184      canage11    185 - 186
      canage12    187 - 188      canage13    189 - 190
      canage14    191 - 192      canage15    193 - 194
      canage16    195 - 196      canage17    197 - 198
      canage18    199 - 200      canage19    201 - 202
      canage20    203 - 204      canage21    205 - 206
      canage22    207 - 208      canage23    209 - 210
      canage24    211 - 212      canage25    213 - 214
      canage26    215 - 216      canage27    217 - 218
      canage28    219 - 220      canage29    221 - 222
      canage30    223 - 224      dibev       225 - 225
      dibpre1     226 - 226      dibage      227 - 228
      difage2     229 - 230      insln       231 - 231
      dibpill     232 - 232      ahayfyr     233 - 233
      sinyr       234 - 234      cbrchyr     235 - 235
      kidwkyr     236 - 236      livyr       237 - 237
      jntsymp     238 - 238      jmthp1      239 - 239
      jmthp2      240 - 240      jmthp3      241 - 241
      jmthp4      242 - 242      jmthp5      243 - 243
      jmthp6      244 - 244      jmthp7      245 - 245
      jmthp8      246 - 246      jmthp9      247 - 247
      jmthp10     248 - 248      jmthp11     249 - 249
      jmthp12     250 - 250      jmthp13     251 - 251
      jmthp14     252 - 252      jmthp15     253 - 253
      jmthp16     254 - 254      jmthp17     255 - 255
      jntchr      256 - 256      jnthp       257 - 257
      arth1       258 - 258      arthlmt     259 - 259
      arthtyp1    260 - 260      arthtyp2    261 - 261
      arthtyp3    262 - 262      arthtyp4    263 - 263
      arthtyp5    264 - 264      arthtyp6    265 - 265
      paineck     266 - 266      painlb      267 - 267
      painleg     268 - 268      painface    269 - 269
      amigr       270 - 270      acold2w     271 - 271
      aintil2w    272 - 272      pregnow     273 - 273
      mensyr      274 - 274      menoyr      275 - 275
      gynyr       276 - 276      prostyr     277 - 277
      ahearst1    278 - 278      hrwors      279 - 279
      hrwhich     280 - 280      hrright     281 - 281
      hrleft      282 - 282      hrwhisp     283 - 283
      hrtalk      284 - 284      hrshout     285 - 285
      hrspeak     286 - 286      hrback      287 - 287
      hrfrust     288 - 288      hrsafety    289 - 289
      hearage1    290 - 291      hrsudden    292 - 292
      hrcaus1     293 - 294      hrfam       295 - 295
      hrprobhp    296 - 296      hrent       297 - 297
      hraud       298 - 298      hrtest      299 - 299
      hrcocrec    300 - 300      hrcocnow    301 - 301
      hraidnow    302 - 302      hraidlng    303 - 304
      hraidyr     305 - 305      hraidev     306 - 306
      hraidrec    307 - 307      hraidlgp    308 - 309
      hraidoft    310 - 310      hraidnt1    311 - 311
      hraidnt2    312 - 312      hraidnt3    313 - 313
      hraidnt4    314 - 314      hraidnt5    315 - 315
      hraidnt6    316 - 316      hraidnt7    317 - 317
      hraidnt8    318 - 318      hraidnt9    319 - 319
      hralds      320 - 320      hraldtp1    321 - 321
      hraldtp2    322 - 322      hraldtp3    323 - 323
      hraldtp4    324 - 324      hraldtp5    325 - 325
      hraldtp6    326 - 326      hraldtp7    327 - 327
      hraldtp8    328 - 328      hraldtp9    329 - 329
      hrtin       330 - 330      hrtinlng    331 - 332
      hrtinoft    333 - 333      hrtinmus    334 - 334
      hrtinslp    335 - 335      hrtnprob    336 - 336
      hrtindis    337 - 337      hrtinrm     338 - 338
      hremtp01    339 - 339      hremtp02    340 - 340
      hremtp03    341 - 341      hremtp04    342 - 342
      hremtp05    343 - 343      hremtp06    344 - 344
      hremtp07    345 - 345      hremtp08    346 - 346
      hremtp09    347 - 347      hremtp10    348 - 348
      hremtp11    349 - 349      hremtp12    350 - 350
      hremtp13    351 - 351      hremtp14    352 - 352
      hremtp15    353 - 353      hrfire      354 - 354
      hrfirtyp    355 - 355      hrtotr      356 - 356
      hr12mr      357 - 357      hrfrprot    358 - 358
      hrwrknos    359 - 359      hrwrktot    360 - 361
      hrwrkyr     362 - 362      hrwkprot    363 - 363
      hrlesnos    364 - 364      hrlesyr     365 - 365
      hrlsprot    366 - 366      hrlstp01    367 - 367
      hrlstp02    368 - 368      hrlstp03    369 - 369
      hrlstp04    370 - 370      hrlstp05    371 - 371
      hrlstp06    372 - 372      hrlstp07    373 - 373
      hrlstp08    374 - 374      hrlstp09    375 - 375
      hrlstp10    376 - 376      avision     377 - 377
      ablind      378 - 378      lupprt      379 - 379
      sad         380 - 380      nervous     381 - 381
      restless    382 - 382      hopeless    383 - 383
      effort      384 - 384      worthls     385 - 385
      mhamtmo     386 - 386

      wrklyr3     387 - 387      wkdayr      388 - 390
      beddayr     391 - 393      ahstatyr    394 - 394
      speceq      395 - 395      flwalk      396 - 396
      flclimb     397 - 397      flstand     398 - 398
      flsit       399 - 399      flstoop     400 - 400
      flreach     401 - 401      flgrasp     402 - 402
      flcarry     403 - 403      flpush      404 - 404
      flshop      405 - 405      flsocl      406 - 406
      flrelax     407 - 407      fla1ar      408 - 408
      aflhca1     409 - 409      aflhca2     410 - 410
      aflhca3     411 - 411      aflhca4     412 - 412
      aflhca5     413 - 413      aflhca6     414 - 414
      aflhca7     415 - 415      aflhca8     416 - 416
      aflhca9     417 - 417      aflhca10    418 - 418
      aflhca11    419 - 419      aflhca12    420 - 420
      aflhca13    421 - 421      aflhca14    422 - 422
      aflhca15    423 - 423      aflhca16    424 - 424
      aflhca17    425 - 425      aflhca18    426 - 426
      aflhc19_    427 - 427      aflhc20_    428 - 428
      aflhc21_    429 - 429      aflhc22_    430 - 430
      aflhc23_    431 - 431      aflhc24_    432 - 432
      aflhc25_    433 - 433      aflhc26_    434 - 434
      aflhc27_    435 - 435      aflhc28_    436 - 436
      aflhc29_    437 - 437      aflhc30_    438 - 438
      aflhc31_    439 - 439      aflhc32_    440 - 440
      aflhc33_    441 - 441      aflhc34_    442 - 442
      aflhca90    443 - 443      aflhca91    444 - 444
      altime1     445 - 446      alunit1     447 - 447
      aldura1     448 - 449      aldurb1     450 - 450
      alchrc1     451 - 451      altime2     452 - 453
      alunit2     454 - 454      aldura2     455 - 456
      aldurb2     457 - 457      alchrc2     458 - 458
      altime3     459 - 460      alunit3     461 - 461
      aldura3     462 - 463      aldurb3     464 - 464
      alchrc3     465 - 465      altime4     466 - 467
      alunit4     468 - 468      aldura4     469 - 470
      aldurb4     471 - 471      alchrc4     472 - 472
      altime5     473 - 474      alunit5     475 - 475
      aldura5     476 - 477      aldurb5     478 - 478
      alchrc5     479 - 479      altime6     480 - 481
      alunit6     482 - 482      aldura6     483 - 484
      aldurb6     485 - 485      alchrc6     486 - 486
      altime7     487 - 488      alunit7     489 - 489
      aldura7     490 - 491      aldurb7     492 - 492
      alchrc7     493 - 493      altime8     494 - 495
      alunit8     496 - 496      aldura8     497 - 498
      aldurb8     499 - 499      alchrc8     500 - 500
      altime9     501 - 502      alunit9     503 - 503
      aldura9     504 - 505      aldurb9     506 - 506
      alchrc9     507 - 507      altime10    508 - 509
      alunit10    510 - 510      aldura10    511 - 512
      aldurb10    513 - 513      alchrc10    514 - 514
      altime11    515 - 516      alunit11    517 - 517
      aldura11    518 - 519      aldurb11    520 - 520
      alchrc11    521 - 521      altime12    522 - 523
      alunit12    524 - 524      aldura12    525 - 526
      aldurb12    527 - 527      alchrc12    528 - 528
      altime13    529 - 530      alunit13    531 - 531
      aldura13    532 - 533      aldurb13    534 - 534
      alchrc13    535 - 535      altime14    536 - 537
      alunit14    538 - 538      aldura14    539 - 540
      aldurb14    541 - 541      alchrc14    542 - 542
      altime15    543 - 544      alunit15    545 - 545
      aldura15    546 - 547      aldurb15    548 - 548
      alchrc15    549 - 549      altime16    550 - 551
      alunit16    552 - 552      aldura16    553 - 554
      aldurb16    555 - 555      alchrc16    556 - 556
      altime17    557 - 558      alunit17    559 - 559
      aldura17    560 - 561      aldurb17    562 - 562
      alchrc17    563 - 563      altime18    564 - 565
      alunit18    566 - 566      aldura18    567 - 568
      aldurb18    569 - 569      alchrc18    570 - 570
      altime19    571 - 572      alunit19    573 - 573
      aldura19    574 - 575      aldurb19    576 - 576
      alchrc19    577 - 577      altime20    578 - 579
      alunit20    580 - 580      aldura20    581 - 582
      aldurb20    583 - 583      alchrc20    584 - 584
      altime21    585 - 586      alunit21    587 - 587
      aldura21    588 - 589      aldurb21    590 - 590
      alchrc21    591 - 591      altime22    592 - 593
      alunit22    594 - 594      aldura22    595 - 596
      aldurb22    597 - 597      alchrc22    598 - 598
      altime23    599 - 600      alunit23    601 - 601
      aldura23    602 - 603      aldurb23    604 - 604
      alchrc23    605 - 605      altime24    606 - 607
      alunit24    608 - 608      aldura24    609 - 610
      aldurb24    611 - 611      alchrc24    612 - 612
      altime25    613 - 614      alunit25    615 - 615
      aldura25    616 - 617      aldurb25    618 - 618
      alchrc25    619 - 619      altime26    620 - 621
      alunit26    622 - 622      aldura26    623 - 624
      aldurb26    625 - 625      alchrc26    626 - 626
      altime27    627 - 628      alunit27    629 - 629
      aldura27    630 - 631      aldurb27    632 - 632
      alchrc27    633 - 633      altime28    634 - 635
      alunit28    636 - 636      aldura28    637 - 638
      aldurb28    639 - 639      alchrc28    640 - 640
      altime29    641 - 642      alunit29    643 - 643
      aldura29    644 - 645      aldurb29    646 - 646
      alchrc29    647 - 647      altime30    648 - 649
      alunit30    650 - 650      aldura30    651 - 652
      aldurb30    653 - 653      alchrc30    654 - 654
      altime31    655 - 656      alunit31    657 - 657
      aldura31    658 - 659      aldurb31    660 - 660
      alchrc31    661 - 661      altime32    662 - 663
      alunit32    664 - 664      aldura32    665 - 666
      aldurb32    667 - 667      alchrc32    668 - 668
      altime33    669 - 670      alunit33    671 - 671
      aldura33    672 - 673      aldurb33    674 - 674
      alchrc33    675 - 675      altime34    676 - 677
      alunit34    678 - 678      aldura34    679 - 680
      aldurb34    681 - 681      alchrc34    682 - 682
      altime90    683 - 684      alunit90    685 - 685
      aldura90    686 - 687      aldurb90    688 - 688
      alchrc90    689 - 689      altime91    690 - 691
      alunit91    692 - 692      aldura91    693 - 694
      aldurb91    695 - 695      alchrc91    696 - 696
      alcndrt     697 - 697      alchronr    698 - 698

      smkev       699 - 699      smkreg      700 - 701
      smknow      702 - 702      smkstat2    703 - 703
      smkqtno     704 - 705      smkqttp     706 - 706
      smkqty      707 - 708      cigsda1     709 - 710
      cigdamo     711 - 712      cigsda2     713 - 714
      cigsday     715 - 716      cigqtyr     717 - 717
      vigno       718 - 720      vigtp       721 - 721
      vigfreqw    722 - 723      viglngno    724 - 726
      viglngtp    727 - 727      vigmin      728 - 730
      modno       731 - 733      modtp       734 - 734
      modfreqw    735 - 736      modlngno    737 - 739
      modlngtp    740 - 740      modmin      741 - 743
      strngno     744 - 746      strngtp     747 - 747
      strfreqw    748 - 749      alc1yr      750 - 750
      alclife     751 - 751      alc12mno    752 - 754
      alc12mtp    755 - 755      alc12mwk    756 - 757
      alc12myr    758 - 760      alcamt      761 - 762
      alcstat     763 - 764      alc5upno    765 - 767
      alc5uptp    768 - 768      alc5upyr    769 - 771
      aheight     772 - 773      aweightp    774 - 776
      bmi         777 - 780      sleep       781 - 782

      ausualpl    783 - 783      aplkind     784 - 784
      ahcplrou    785 - 785      ahcplknd    786 - 786
      ahcchgyr    787 - 787      ahcchghi    788 - 788
      ahcdlyr1    789 - 789      ahcdlyr2    790 - 790
      ahcdlyr3    791 - 791      ahcdlyr4    792 - 792
      ahcdlyr5    793 - 793      ahcafyr1    794 - 794
      ahcafyr2    795 - 795      ahcafyr3    796 - 796
      ahcafyr4    797 - 797      adnlong2    798 - 798
      ahcsyr1     799 - 799      ahcsyr2     800 - 800
      ahcsyr3     801 - 801      ahcsyr4     802 - 802
      ahcsyr5     803 - 803      ahcsyr6     804 - 804
      ahcsyr7     805 - 805      ahcsyr8     806 - 806
      ahcsyr9     807 - 807      ahcsyr10    808 - 808
      ahernoy2    809 - 810      ahchyr      811 - 811
      ahchmoyr    812 - 813      ahchnoy2    814 - 815
      ahcnoyr2    816 - 817      asrgyr      818 - 818
      asrgnoyr    819 - 820      amdlongr    821 - 821
      shtfluyr    822 - 822      ashflu_m    823 - 824
      ashflu_y    825 - 828      sprfluyr    829 - 829
      aspflu_m    830 - 831      aspflu_y    832 - 835
      shtpnuyr    836 - 836      apox        837 - 837
      apox12mo    838 - 838      ahep        839 - 839
      ahepliv     840 - 840      shthepb     841 - 841
      shepdos     842 - 842

      bldgv       843 - 843      bldg12m     844 - 844
      hivtst      845 - 845      whytst_r    846 - 847
      tst12m_m    848 - 849      tst12m_y    850 - 853
      timetst     854 - 854      reatst_c    855 - 856
      reaswhor    857 - 857      lastst_c    858 - 859
      clntyp_c    860 - 861      whoadm      862 - 862
      givnam      863 - 863      extst12m    864 - 864
      chnsadsp    865 - 865      stmtru      866 - 866
      std         867 - 867      stddoc      868 - 868
      stdwher     869 - 869      tbhrd       870 - 870
      tbknow      871 - 871      tb          872 - 872
      tbsprd1     873 - 873      tbsprd2     874 - 874
      tbsprd3     875 - 875      tbsprd4     876 - 876
      tbsprd5     877 - 877      tbsprd6     878 - 878
      tbcured     879 - 879      tbchanc     880 - 880
      tbshame     881 - 881      homeless    882 - 882

using $DAT/samadult.dat;
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
ASD.150_00.000: Paid by the hour at current/most recent/longest held job";
label variable pdsicka  "
ASD.160_00.000: Paid sick leave at current/most recent/longest held job";
label variable onejob   "ASD.170_00.000: Have more than one job";

label variable hypev    "ACN.010_00.000: Ever been told you have hypertension";
label variable hypdifv  "ACN.020_00.000: Ever had hypertension on 2+ visits";
label variable hypyr    "ACN.020_00.010: Had hypertension, past 12 months";
label variable chdev    "
ACN.031_01.000: Ever been told you had coronary heart disease";
label variable chdyr    "
ACN.031_01.010: Had coronary heart disease, past 12 months";
label variable angev    "ACN.031_02.000: Ever been told you had angina pectoris
";
label variable angyr    "ACN.031_02.020: Had angina, past 12 months";
label variable miev     "ACN.031_03.000: Ever been told you had a heart attack";
label variable mievyr   "ACN.031_03.030: Had a heart attack, past 12 months";
label variable hrtev    "
ACN.031_04.000: Ever been told you had a heart condition/disease";
label variable hrtyr    "
ACN.031_04.040: Had other heart condition, past 12 months";
label variable strev    "ACN.031_05.000: Ever been told you had a stroke";
label variable stryr    "ACN.031_05.050: Had stroke, past 12 months";
label variable ephev    "ACN.031_06.000: Ever been told you had emphysema";
label variable ephyr    "ACN.031_06.060: Had emphysema, past 12 months";
label variable aasmev   "ACN.080_00.000: Ever been told you had asthma";
label variable aasstill "ACN.085_00.000: Still have asthma";
label variable aasmyr   "ACN.090_00.000: Had an asthma episode/attack past 12 m
";
label variable aasmeryr "ACN.100_00.000: Had visit to ER due to asthma past 12 m
";
label variable ulcev    "ACN.110_00.000: Ever been told you have an ulcer";
label variable ulcyr    "ACN.120_00.000: Had ulcer in past 12 m";
label variable chlev    "ACN.121_01.010: Ever told you had high cholesterol";
label variable chlyr    "ACN.121_01.015: Had high cholesterol, past 12 months";
label variable gumdisev "ACN.121_02.020: Ever told you had gum disease";
label variable gumdisyr "ACN.121_02.025: Had gum disease, past 12 months";
label variable phobiaev "ACN.121_03.030: Ever told you had phobia or fears";
label variable phobiayr "ACN.121_03.035: Had phobia or fears, past 12 months";
label variable aflupnev "ACN.121_04.040: Ever told you had influenza/pneumonia";
label variable aflupnyr "ACN.121_04.045: Had influenza/pneumonia, past 12 months
";
label variable prcirev  "ACN.121_05.050: Ever told you had poor circulation";
label variable prciryr  "ACN.121_05.055: Had poor circulation, past 12 months";
label variable urev     "ACN.121_06.060: Ever told you had urinary problems";
label variable uryr     "ACN.121_06.065: Had urinary problems, past 12 months";
label variable addhyp   "ACN.123_01.010: Ever told you had ADD/Hyperactivity";
label variable autism   "ACN.123_02.020: Ever told you had Autism";
label variable bipdis   "ACN.123_03.030: Ever told you had Bipolar Disorder";
label variable dementia "ACN.123_04.040: Ever told you had Dementia";
label variable maniapsy "ACN.123_05.050: Ever told you had Mania/Psychosis";
label variable schizphn "ACN.123_06.060: Ever told you had Schizophrenia";
label variable seizures "ACN.123_07.070: Ever told you had Seizures";
label variable bowlev   "ACN.125_00.010: Ever told you had bowel problems";
label variable bowlyr   "ACN.125_00.020: Had bowel problems, past 12 months";
label variable bowltyp1 "ACN.125_01.030: Had inflammatory bowel, past 12 months
";
label variable bowltyp2 "ACN.125_02.030: Had irritable bowel, past 12 months";
label variable bowltyp3 "ACN.125_03.030: Had severe constipation, past 12 months
";
label variable acidryr  "
ACN.126_00.010: Had acid reflux/heartburn, past 12 months";
label variable hacheyr  "ACN.126_00.020: Had regular headaches, past 12 months";
label variable memlosyr "ACN.126_00.030: Had memory loss, past 12 months";
label variable spnyr    "ACN.126_00.040: Had sprains/strains, past 12 months";
label variable denyr    "ACN.126_00.050: Had dental pain, past 12 months";
label variable alctobyr "
ACN.126_00.060: Excessive alcohol/tobacco, past 12 months";
label variable subabyr  "ACN.126_00.070: Substance abuse, past 12 months";
label variable sknyr    "ACN.126_00.080: Skin problems, past 12 months";
label variable insyr    "ACN.128_00.010: Insomnia, past 12 months";
label variable fatyr    "ACN.128_00.020: Excessive sleepiness, past 12 months";
label variable depyr    "ACN.128_00.030: Frequently depressed, past 12 months";
label variable anxyr    "ACN.128_00.040: Frequently anxious, past 12 months";
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
label variable jntchr   "ACN.270_00.000: Symptoms begin more than 3 m ago";
label variable jnthp    "
ACN.280_00.000: Ever seen doctor or hlth prof for joint symptoms";
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
label variable mensyr   "ACN.372_00.010: Menstrual problems, past 12 months";
label variable menoyr   "ACN.372_00.020: Menopausal problems, past 12 months";
label variable gynyr    "ACN.372_00.030: Gynecologic problems, past 12 months";
label variable prostyr  "ACN.372_00.040: Prostate problems, past 12 months";
label variable ahearst1 "ACN.400_00.010: Description of hearing w/o aids";
label variable hrwors   "ACN.400_00.020: Hearing worse in one ear";
label variable hrwhich  "ACN.400_00.030: Which ear is worse";
label variable hrright  "ACN.400_00.040: Hearing in right ear";
label variable hrleft   "ACN.400_00.050: Hearing in left ear";
label variable hrwhisp  "ACN.400_00.060: Hear whispers across room";
label variable hrtalk   "ACN.400_00.070: Hear normal voice across room";
label variable hrshout  "ACN.400_00.080: Hear shouting voice across room";
label variable hrspeak  "ACN.400_00.090: Hear voice in better ear";
label variable hrback   "ACN.400_00.100: Trouble with background noise";
label variable hrfrust  "ACN.400_00.110: Frustrated with hearing when talking";
label variable hrsafety "ACN.400_00.120: Hearing causes worry about safety";
label variable hearage1 "ACN.400_00.130: Age at first hearing loss";
label variable hrsudden "ACN.400_00.140: Hearing loss sudden/gradual";
label variable hrcaus1  "ACN.400_00.150: Main cause of hearing loss";
label variable hrfam    "ACN.400_00.160: Told of hearing problem by others";
label variable hrprobhp "
ACN.400_00.170: Last saw doctor/hp about hearing problem";
label variable hrent    "
ACN.405_01.010: Referred to hearing specialist, past 5 years";
label variable hraud    "ACN.405_02.020: Referred to audiologist, past 5 years";
label variable hrtest   "ACN.410_00.010: Last time hearing tested";
label variable hrcocrec "ACN.410_00.020: Cochlear implant recommended";
label variable hrcocnow "ACN.410_00.030: Now use cochlear implant";
label variable hraidnow "ACN.410_00.040: Now use hearing aid";
label variable hraidlng "ACN.410_00.050: How long used hearing aid";
label variable hraidyr  "
ACN.410_00.060: How often used hearing aid, past 12 months";
label variable hraidev  "ACN.410_00.070: Ever used a hearing aid";
label variable hraidrec "ACN.410_00.080: Hearing aid ever recommended";
label variable hraidlgp "ACN.410_00.090: How long hearing aid used in the past";
label variable hraidoft "ACN.410_00.100: How often used hearing aid in the past
";
label variable hraidnt1 "ACN.410_01.110: HA not used - it didn't help";
label variable hraidnt2 "ACN.410_02.110: HA not used - too loud";
label variable hraidnt3 "ACN.410_03.110: HA not used - whistling sounds";
label variable hraidnt4 "ACN.410_04.110: HA not used - uncomfortable";
label variable hraidnt5 "ACN.410_05.110: HA not used - frequent breakdowns";
label variable hraidnt6 "ACN.410_06.110: HA not used - didn't like look";
label variable hraidnt7 "ACN.410_07.110: HA not used - cost too much";
label variable hraidnt8 "ACN.410_08.110: HA not used - don't need";
label variable hraidnt9 "ACN.410_09.110: HA not used - other";
label variable hralds   "ACN.410_00.120: Use assistive-listening devices";
label variable hraldtp1 "ACN.410_01.130: ALD - pocket talker";
label variable hraldtp2 "ACN.410_02.130: ALD - amplified telephone";
label variable hraldtp3 "ACN.410_03.130: ALD - amplified alarm clock";
label variable hraldtp4 "ACN.410_04.130: ALD - signaling system";
label variable hraldtp5 "ACN.410_05.130: ALD - headset or CCTV";
label variable hraldtp6 "ACN.410_06.130: ALD - TTY/TDD";
label variable hraldtp7 "ACN.410_07.130: ALD - video relay service";
label variable hraldtp8 "ACN.410_08.130: ALD - sign language interpreter";
label variable hraldtp9 "ACN.410_09.130: ALD - other";
label variable hrtin    "ACN.412_00.010: Had ringing in ears, past 12 months";
label variable hrtinlng "ACN.412_00.020: How long bothered by ringing in ears";
label variable hrtinoft "
ACN.412_00.030: How often had ringing in ears, past 12 months";
label variable hrtinmus "
ACN.412_00.040: Ringing in ears only after loud sounds/music";
label variable hrtinslp "ACN.412_00.050: Ringing in ears when going to sleep";
label variable hrtnprob "ACN.412_00.060: How much a problem, ringing in ears";
label variable hrtindis "ACN.412_00.070: Discuss ringing in ears with doctor/HP
";
label variable hrtinrm  "ACN.412_00.072: Tried remedies for ringing in ears";
label variable hremtp01 "ACN.412_01.074: Amplification/Hearing aids";
label variable hremtp02 "ACN.412_02.074: Masking wearable device";
label variable hremtp03 "ACN.412_03.074: Masking non-wearable device";
label variable hremtp04 "ACN.412_04.074: Cognitive therapy w/counseling";
label variable hremtp05 "ACN.412_05.074: Stress reduction/relaxation methods";
label variable hremtp06 "ACN.412_06.074: Biofeedback";
label variable hremtp07 "ACN.412_07.074: Tinnitus Retraining Therapy";
label variable hremtp08 "ACN.412_08.074: Psychiatric treatment";
label variable hremtp09 "ACN.412_09.074: Surgery to cut hearing nerve";
label variable hremtp10 "ACN.412_10.074: Drugs or medications";
label variable hremtp11 "ACN.412_11.074: Nutritional supplements";
label variable hremtp12 "ACN.412_12.074: Music therapy";
label variable hremtp13 "ACN.412_13.074: TMJ treatment";
label variable hremtp14 "ACN.412_14.074: Alternative medicine";
label variable hremtp15 "ACN.412_15.074: Other remedy or treatment";
label variable hrfire   "ACN.413_00.010: Ever used firearms";
label variable hrfirtyp "ACN.413_00.020: Used firearms for work/leisure";
label variable hrtotr   "ACN.413_00.030: Number of total rounds fired";
label variable hr12mr   "ACN.413_00.040: Number of rounds fired, past 12 months
";
label variable hrfrprot "
ACN.413_00.050: Wear ear protection for firearms, past 12 months";
label variable hrwrknos "ACN.414_00.010: Ever exposed to loud noise at job";
label variable hrwrktot "ACN.414_00.020: Time exposed to loud noise at job";
label variable hrwrkyr  "ACN.414_00.030: Noise exposure in past 12 months";
label variable hrwkprot "
ACN.414_00.040: Wear ear protection at job, past 12 months";
label variable hrlesnos "ACN.415_00.010: Exposed to leisure-time loud noise";
label variable hrlesyr  "ACN.415_00.030: Leisure-time noise, past 12 months";
label variable hrlsprot "
ACN.415_00.040: Wear ear protection at leisure, past 12 months";
label variable hrlstp01 "ACN.415_01.020: Motocycles/Auto racing";
label variable hrlstp02 "ACN.415_02.020: Operating farm machinery";
label variable hrlstp03 "ACN.415_03.020: Wood cutting/Power tools";
label variable hrlstp04 "ACN.415_04.020: Lawn mower/snow blower";
label variable hrlstp05 "ACN.415_05.020: Firearms";
label variable hrlstp06 "ACN.415_06.020: Household applicances";
label variable hrlstp07 "ACN.415_07.020: MP3 Player/iPod";
label variable hrlstp08 "ACN.415_08.020: Playing in a music group";
label variable hrlstp09 "ACN.415_09.020: Other music-related activities";
label variable hrlstp10 "ACN.415_10.020: Other noisy, non-work activities";
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

label variable wrklyr3  "AHS: Work status: last week, past 12 m";
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
AHS.171_02.000: How difficult to participate in social activities w/o special eq
uipment";
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
AHS.200_05.000: Fracture/bone/joint injury causes difficulty with activity";
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
AHS.200_16.000: Senility/dementia/alzheimers causes difficulty with activity";
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
AHS.200_00.000: Pregnancy related problem causes difficulty with activity";
label variable aflhca90 "
AHS.200_90.000: Other impairment/problem (1) causes difficulty with activity";
label variable aflhca91 "
AHS.200_91.000: Other impairment/problem (2) causes difficulty with activity";
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
label variable altime32 "AHS.331_01.000: Duration of 'old age': Number of units
";
label variable alunit32 "AHS.331_02.000: Duration of 'old age': Number of units
";
label variable aldura32 "AHS.331_02.000: Duration of 'old age' (in years)";
label variable aldurb32 "AHS.331_02.000: Duration of 'old age', recode 2";
label variable alchrc32 "AHS.331_02.000: 'Old age' condition status";
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
AHS.336_02.000: Duration of other N.E.C. problem (2) recode 2";
label variable alchrc91 "
AHS.336_02.000: Other N.E.C. problem (2) condition status";
label variable alcndrt  "
AHS.336_02.000: Chronic condition recode for individual w/functional limitation
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
   34       "34 Adult Alternative Medicine"
   40       "40 Sample Child"
   44       "44 Child Alternative Medicine"
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
label define sap080x
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
label define sap208x
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
label define sap210x
   1        "1 The right ear"
   2        "2 The left ear"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap217x
   1        "1 Always"
   2        "2 Usually"
   3        "3 About half the time"
   4        "4 Seldom"
   5        "5 Never"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap220x
   01       "01 At birth"
   02       "02 0 to 2 years of age"
   03       "03 3 to 5 years of age"
   04       "04 6 to 11 years of age"
   05       "05 12 to 19 years of age"
   06       "06 20 to 39 years of age"
   07       "07 40 to 59 years of age"
   08       "08 60 to 69 years of age"
   09       "09 70 or more years of age"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap221x
   1        "1 Sudden"
   2        "2 Gradual"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap222x
   01       "
01 Present at birth because mother had German measles (Rubella) or Cytomegalovir
us (CMV)"
   02       "02 Present at birth for a genetic reason"
   03       "
03 Present at birth for some other reason, not including genetic or infectious d
isease"
   04       "04 Infectious disease after birth (measles, meningitis, etc.)"
   05       "05 Ear infections or Otitis Media"
   06       "06 Ear injury (holes in the eardrum, etc.)"
   07       "07 Ear surgery"
   08       "08 Ear disease such as Meniere's Disease or Otosclerosis"
   09       "09 Brain tumor (Acoustic Neuroma, etc)"
   10       "10 Loud, brief noise from gunfire, blasts, or explosions"
   11       "
11 Noise exposure from machinery, aircraft, power tools, loud music, appliances,
 personal stereos or MP3 players, hair dryers, etc"
   12       "12 Getting older/aging"
   13       "13 Some other cause"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap224x
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
label define sap231x
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
label define sap257x
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
label define sap258x
   1        "1 Almost always"
   2        "2 At least once a day"
   3        "3 At least once a week"
   4        "4 At least once a month"
   5        "5 Less frequently than once a month"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap261x
   1        "1 No problem"
   2        "2 A small problem"
   3        "3 A moderate problem"
   4        "4 A big problem"
   5        "5 A very big problem"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap280x
   1        "1 Work"
   2        "2 Leisure"
   3        "3 Both"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap281x
   1        "1 to less than 100 rounds"
   2        "2 100 to less than 1000 rounds"
   3        "3 1000 to less than 10,000 rounds"
   4        "4 10,000 to less than 50,000 rounds"
   5        "5 50,000 rounds or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap282x
   0        "0 None"
   1        "1 to less than 100 rounds"
   2        "2 100 to less than 1000 rounds"
   3        "3 1000 to less than 10,000 rounds"
   4        "4 10,000 rounds or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap285x
   01       "01 Less than 3 months"
   02       "02 3 to 11 months"
   03       "03 1 to 2 years"
   04       "04 3 to 4 years"
   05       "05 5 to 9 years"
   06       "06 10 to 14 years"
   07       "07 15 or more years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap304x
   1        "1 ALL of the time"
   2        "2 MOST of the time"
   3        "3 SOME of the time"
   4        "4 A LITTLE of the time"
   5        "5 NONE of the time"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap310x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap311x
   0        "0 Had job last week"
   1        "1 No job last week, had job past 12 m"
   2        "2 No job last week, no job past 12 m"
   3        "3 Never worked"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap312x
   000      "000 None"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap314x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap316x
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
label define sap328x
   1        "1 Limited in any way"
   2        "2 Not limited in any way"
   3        "3 Unknown if limited"
;
label define sap365x
   95       "95 95+"
   96       "96 Since birth"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap366x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   6        "6 Since birth"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap367x
   00       "00 Less than 1 year"
   85       "85 85+ years"
   96       "96 Unknown number of years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap368x
   1        "1 Less than 3 months"
   2        "2 3-5 months"
   3        "3 6-12 months"
   4        "4 More than 1 year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap369x
   1        "1 Chronic"
   2        "2 Not chronic"
   9        "9 Unknown if chronic"
;
label define sap545x
   1        "1 At least one chronic condition causes functional limitation"
   2        "2 No chronic condition causes functional limitation"
   9        "9 Unknown if any chronic condition causes functional limitation"
;
label define sap546x
   0        "0 Not limited in any way (including unknown if limited)"
   1        "1 Limited; caused by at least one chronic condition"
   2        "2 Limited; not caused by chronic condition"
   3        "3 Limited; unknown if condition is chronic"
;
label define sap548x
   85       "85 85 years or older"
   96       "96 Never smoked regularly"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap549x
   1        "1 Every day"
   2        "2 Some days"
   3        "3 Not at all"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap550x
   1        "1 Current every day smoker"
   2        "2 Current some day smoker"
   3        "3 Former smoker"
   4        "4 Never smoker"
   5        "5 Smoker, current status unknown"
   9        "9 Unknown if ever smoked"
;
label define sap551x
   95       "95 95+"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap552x
   1        "1 Day(s)"
   2        "2 Week(s)"
   3        "3 Month(s)"
   4        "4 Year(s)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap553x
   00       "00 Less than 1 year"
   70       "70 70+ years"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap554x
   95       "95 95+ cigarettes"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap555x
   00       "00 None"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap559x
   000      "000 Never"
   996      "996 Unable to do this type activity"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap560x
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
label define sap561x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do vigorous activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap562x
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap563x
   1        "1 Minutes"
   2        "2 Hours"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap567x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do light or moderate activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap573x
   00       "00 Less than once per week"
   95       "95 Never"
   96       "96 Unable to do strength activity"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap576x
   000      "000 Never"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap577x
   0        "0 Never/None"
   1        "1 Week"
   2        "2 Month"
   3        "3 Year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap578x
   00       "00 Less than one day per week"
   95       "95 Did not drink in past year"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap579x
   000      "000 Never/none"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap580x
   95       "95 95+ drinks"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap581x
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
label define sap583x
   0        "0 Never/None"
   1        "1 Per week"
   2        "2 Per month"
   3        "3 Per year"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap585x
   96       "96 Not available"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap586x
   996      "996 Not available"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define sap588x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap589x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap590x
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
label define sap592x
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
label define sap604x
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
label define sap615x
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
label define sap618x
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
label define sap621x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define sap624x
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
label define sap625x
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define sap635x
   1        "1 Received at least 3 doses"
   2        "2 Received less than 3 doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap639x
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
label define sap640x
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
label define sap641x
   9996     "9996 Time period format"
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define sap642x
   1        "1 6 months or less"
   2        "2 More than 6 months but not more than 1 year ago"
   3        "3 More than 1 year, but not more than 2 years ago"
   4        "4 More than 2 years, but not more than 5 years ago"
   5        "5 More than 5 years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap643x
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
label define sap644x
   1        "1 Doctor, nurse or other health care professional"
   2        "2 Sex partner"
   3        "3 Someone at health department"
   4        "4 Family member or friend"
   5        "5 Other"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap645x
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
label define sap646x
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
label define sap647x
   1        "1 Nurse or health worker"
   2        "2 Self-sampling kit"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap650x
   1        "1 High/Already have HIV/AIDS"
   2        "2 Medium"
   3        "3 Low"
   4        "4 None"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap651x
   1        "1 Yes, at least one statement is true"
   2        "2 No, none of these statements are true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap654x
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
label define sap657x
   1        "1 A lot"
   2        "2 Some"
   3        "3 A little"
   4        "4 Nothing"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define sap665x
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
label values hypyr     sap025x;   label values chdev     sap025x;
label values chdyr     sap025x;   label values angev     sap025x;
label values angyr     sap025x;   label values miev      sap025x;
label values mievyr    sap025x;   label values hrtev     sap025x;
label values hrtyr     sap025x;   label values strev     sap025x;
label values stryr     sap025x;   label values ephev     sap025x;
label values ephyr     sap025x;   label values aasmev    sap025x;
label values aasstill  sap025x;   label values aasmyr    sap025x;
label values aasmeryr  sap025x;   label values ulcev     sap025x;
label values ulcyr     sap025x;   label values chlev     sap025x;
label values chlyr     sap025x;   label values gumdisev  sap025x;
label values gumdisyr  sap025x;   label values phobiaev  sap025x;
label values phobiayr  sap025x;   label values aflupnev  sap025x;
label values aflupnyr  sap025x;   label values prcirev   sap025x;
label values prciryr   sap025x;   label values urev      sap025x;
label values uryr      sap025x;   label values addhyp    sap025x;
label values autism    sap025x;   label values bipdis    sap025x;
label values dementia  sap025x;   label values maniapsy  sap025x;
label values schizphn  sap025x;   label values seizures  sap025x;
label values bowlev    sap025x;   label values bowlyr    sap025x;
label values bowltyp1  sap080x;   label values bowltyp2  sap080x;
label values bowltyp3  sap080x;   label values acidryr   sap025x;
label values hacheyr   sap025x;   label values memlosyr  sap025x;
label values spnyr     sap025x;   label values denyr     sap025x;
label values alctobyr  sap025x;   label values subabyr   sap025x;
label values sknyr     sap025x;   label values insyr     sap025x;
label values fatyr     sap025x;   label values depyr     sap025x;
label values anxyr     sap025x;   label values canev     sap025x;
label values cnkind1   sap080x;   label values cnkind2   sap080x;
label values cnkind3   sap080x;   label values cnkind4   sap080x;
label values cnkind5   sap080x;   label values cnkind6   sap080x;
label values cnkind7   sap080x;   label values cnkind8   sap080x;
label values cnkind9   sap080x;   label values cnkind10  sap080x;
label values cnkind11  sap080x;   label values cnkind12  sap080x;
label values cnkind13  sap080x;   label values cnkind14  sap080x;
label values cnkind15  sap080x;   label values cnkind16  sap080x;
label values cnkind17  sap080x;   label values cnkind18  sap080x;
label values cnkind19  sap080x;   label values cnkind20  sap080x;
label values cnkind21  sap080x;   label values cnkind22  sap080x;
label values cnkind23  sap080x;   label values cnkind24  sap080x;
label values cnkind25  sap080x;   label values cnkind26  sap080x;
label values cnkind27  sap080x;   label values cnkind28  sap080x;
label values cnkind29  sap080x;   label values cnkind30  sap080x;
label values cnkind31  sap080x;   label values canage1   sap127x;
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
label values jntsymp   sap025x;   label values jmthp1    sap080x;
label values jmthp2    sap080x;   label values jmthp3    sap080x;
label values jmthp4    sap080x;   label values jmthp5    sap080x;
label values jmthp6    sap080x;   label values jmthp7    sap080x;
label values jmthp8    sap080x;   label values jmthp9    sap080x;
label values jmthp10   sap080x;   label values jmthp11   sap080x;
label values jmthp12   sap080x;   label values jmthp13   sap080x;
label values jmthp14   sap080x;   label values jmthp15   sap080x;
label values jmthp16   sap080x;   label values jmthp17   sap080x;
label values jntchr    sap025x;   label values jnthp     sap025x;
label values arth1     sap025x;   label values arthlmt   sap025x;
label values arthtyp1  sap080x;   label values arthtyp2  sap080x;
label values arthtyp3  sap080x;   label values arthtyp4  sap080x;
label values arthtyp5  sap080x;   label values arthtyp6  sap080x;
label values paineck   sap025x;   label values painlb    sap025x;
label values painleg   sap025x;   label values painface  sap025x;
label values amigr     sap025x;   label values acold2w   sap025x;
label values aintil2w  sap025x;   label values pregnow   sap025x;
label values mensyr    sap025x;   label values menoyr    sap025x;
label values gynyr     sap025x;   label values prostyr   sap025x;
label values ahearst1  sap208x;   label values hrwors    sap025x;
label values hrwhich   sap210x;   label values hrright   sap208x;
label values hrleft    sap208x;   label values hrwhisp   sap025x;
label values hrtalk    sap025x;   label values hrshout   sap025x;
label values hrspeak   sap025x;   label values hrback    sap217x;
label values hrfrust   sap217x;   label values hrsafety  sap217x;
label values hearage1  sap220x;   label values hrsudden  sap221x;
label values hrcaus1   sap222x;   label values hrfam     sap025x;
label values hrprobhp  sap224x;   label values hrent     sap025x;
label values hraud     sap025x;   label values hrtest    sap224x;
label values hrcocrec  sap025x;   label values hrcocnow  sap025x;
label values hraidnow  sap025x;   label values hraidlng  sap231x;
label values hraidyr   sap217x;   label values hraidev   sap025x;
label values hraidrec  sap025x;   label values hraidlgp  sap231x;
label values hraidoft  sap217x;   label values hraidnt1  sap080x;
label values hraidnt2  sap080x;   label values hraidnt3  sap080x;
label values hraidnt4  sap080x;   label values hraidnt5  sap080x;
label values hraidnt6  sap080x;   label values hraidnt7  sap080x;
label values hraidnt8  sap080x;   label values hraidnt9  sap080x;
label values hralds    sap025x;   label values hraldtp1  sap080x;
label values hraldtp2  sap080x;   label values hraldtp3  sap080x;
label values hraldtp4  sap080x;   label values hraldtp5  sap080x;
label values hraldtp6  sap080x;   label values hraldtp7  sap080x;
label values hraldtp8  sap080x;   label values hraldtp9  sap080x;
label values hrtin     sap025x;   label values hrtinlng  sap257x;
label values hrtinoft  sap258x;   label values hrtinmus  sap025x;
label values hrtinslp  sap025x;   label values hrtnprob  sap261x;
label values hrtindis  sap025x;   label values hrtinrm   sap025x;
label values hremtp01  sap080x;   label values hremtp02  sap080x;
label values hremtp03  sap080x;   label values hremtp04  sap080x;
label values hremtp05  sap080x;   label values hremtp06  sap080x;
label values hremtp07  sap080x;   label values hremtp08  sap080x;
label values hremtp09  sap080x;   label values hremtp10  sap080x;
label values hremtp11  sap080x;   label values hremtp12  sap080x;
label values hremtp13  sap080x;   label values hremtp14  sap080x;
label values hremtp15  sap080x;   label values hrfire    sap025x;
label values hrfirtyp  sap280x;   label values hrtotr    sap281x;
label values hr12mr    sap282x;   label values hrfrprot  sap217x;
label values hrwrknos  sap025x;   label values hrwrktot  sap285x;
label values hrwrkyr   sap025x;   label values hrwkprot  sap217x;
label values hrlesnos  sap025x;   label values hrlesyr   sap025x;
label values hrlsprot  sap217x;   label values hrlstp01  sap080x;
label values hrlstp02  sap080x;   label values hrlstp03  sap080x;
label values hrlstp04  sap080x;   label values hrlstp05  sap080x;
label values hrlstp06  sap080x;   label values hrlstp07  sap080x;
label values hrlstp08  sap080x;   label values hrlstp09  sap080x;
label values hrlstp10  sap080x;   label values avision   sap025x;
label values ablind    sap025x;   label values lupprt    sap025x;
label values sad       sap304x;   label values nervous   sap304x;
label values restless  sap304x;   label values hopeless  sap304x;
label values effort    sap304x;   label values worthls   sap304x;
label values mhamtmo   sap310x;

label values wrklyr3   sap311x;   label values wkdayr    sap312x;
label values beddayr   sap312x;   label values ahstatyr  sap314x;
label values speceq    sap025x;   label values flwalk    sap316x;
label values flclimb   sap316x;   label values flstand   sap316x;
label values flsit     sap316x;   label values flstoop   sap316x;
label values flreach   sap316x;   label values flgrasp   sap316x;
label values flcarry   sap316x;   label values flpush    sap316x;
label values flshop    sap316x;   label values flsocl    sap316x;
label values flrelax   sap316x;   label values fla1ar    sap328x;
label values aflhca1   sap080x;   label values aflhca2   sap080x;
label values aflhca3   sap080x;   label values aflhca4   sap080x;
label values aflhca5   sap080x;   label values aflhca6   sap080x;
label values aflhca7   sap080x;   label values aflhca8   sap080x;
label values aflhca9   sap080x;   label values aflhca10  sap080x;
label values aflhca11  sap080x;   label values aflhca12  sap080x;
label values aflhca13  sap080x;   label values aflhca14  sap080x;
label values aflhca15  sap080x;   label values aflhca16  sap080x;
label values aflhca17  sap080x;   label values aflhca18  sap080x;
label values aflhc19_  sap080x;   label values aflhc20_  sap080x;
label values aflhc21_  sap080x;   label values aflhc22_  sap080x;
label values aflhc23_  sap080x;   label values aflhc24_  sap080x;
label values aflhc25_  sap080x;   label values aflhc26_  sap080x;
label values aflhc27_  sap080x;   label values aflhc28_  sap080x;
label values aflhc29_  sap080x;   label values aflhc30_  sap080x;
label values aflhc31_  sap080x;   label values aflhc32_  sap080x;
label values aflhc33_  sap080x;   label values aflhc34_  sap080x;
label values aflhca90  sap080x;   label values aflhca91  sap080x;
label values altime1   sap365x;   label values alunit1   sap366x;
label values aldura1   sap367x;   label values aldurb1   sap368x;
label values alchrc1   sap369x;   label values altime2   sap365x;
label values alunit2   sap366x;   label values aldura2   sap367x;
label values aldurb2   sap368x;   label values alchrc2   sap369x;
label values altime3   sap365x;   label values alunit3   sap366x;
label values aldura3   sap367x;   label values aldurb3   sap368x;
label values alchrc3   sap369x;   label values altime4   sap365x;
label values alunit4   sap366x;   label values aldura4   sap367x;
label values aldurb4   sap368x;   label values alchrc4   sap369x;
label values altime5   sap365x;   label values alunit5   sap366x;
label values aldura5   sap367x;   label values aldurb5   sap368x;
label values alchrc5   sap369x;   label values altime6   sap365x;
label values alunit6   sap366x;   label values aldura6   sap367x;
label values aldurb6   sap368x;   label values alchrc6   sap369x;
label values altime7   sap365x;   label values alunit7   sap366x;
label values aldura7   sap367x;   label values aldurb7   sap368x;
label values alchrc7   sap369x;   label values altime8   sap365x;
label values alunit8   sap366x;   label values aldura8   sap367x;
label values aldurb8   sap368x;   label values alchrc8   sap369x;
label values altime9   sap365x;   label values alunit9   sap366x;
label values aldura9   sap367x;   label values aldurb9   sap368x;
label values alchrc9   sap369x;   label values altime10  sap365x;
label values alunit10  sap366x;   label values aldura10  sap367x;
label values aldurb10  sap368x;   label values alchrc10  sap369x;
label values altime11  sap365x;   label values alunit11  sap366x;
label values aldura11  sap367x;   label values aldurb11  sap368x;
label values alchrc11  sap369x;   label values altime12  sap365x;
label values alunit12  sap366x;   label values aldura12  sap367x;
label values aldurb12  sap368x;   label values alchrc12  sap369x;
label values altime13  sap365x;   label values alunit13  sap366x;
label values aldura13  sap367x;   label values aldurb13  sap368x;
label values alchrc13  sap369x;   label values altime14  sap365x;
label values alunit14  sap366x;   label values aldura14  sap367x;
label values aldurb14  sap368x;   label values alchrc14  sap369x;
label values altime15  sap365x;   label values alunit15  sap366x;
label values aldura15  sap367x;   label values aldurb15  sap368x;
label values alchrc15  sap369x;   label values altime16  sap365x;
label values alunit16  sap366x;   label values aldura16  sap367x;
label values aldurb16  sap368x;   label values alchrc16  sap369x;
label values altime17  sap365x;   label values alunit17  sap366x;
label values aldura17  sap367x;   label values aldurb17  sap368x;
label values alchrc17  sap369x;   label values altime18  sap365x;
label values alunit18  sap366x;   label values aldura18  sap367x;
label values aldurb18  sap368x;   label values alchrc18  sap369x;
label values altime19  sap365x;   label values alunit19  sap366x;
label values aldura19  sap367x;   label values aldurb19  sap368x;
label values alchrc19  sap369x;   label values altime20  sap365x;
label values alunit20  sap366x;   label values aldura20  sap367x;
label values aldurb20  sap368x;   label values alchrc20  sap369x;
label values altime21  sap365x;   label values alunit21  sap366x;
label values aldura21  sap367x;   label values aldurb21  sap368x;
label values alchrc21  sap369x;   label values altime22  sap365x;
label values alunit22  sap366x;   label values aldura22  sap367x;
label values aldurb22  sap368x;   label values alchrc22  sap369x;
label values altime23  sap365x;   label values alunit23  sap366x;
label values aldura23  sap367x;   label values aldurb23  sap368x;
label values alchrc23  sap369x;   label values altime24  sap365x;
label values alunit24  sap366x;   label values aldura24  sap367x;
label values aldurb24  sap368x;   label values alchrc24  sap369x;
label values altime25  sap365x;   label values alunit25  sap366x;
label values aldura25  sap367x;   label values aldurb25  sap368x;
label values alchrc25  sap369x;   label values altime26  sap365x;
label values alunit26  sap366x;   label values aldura26  sap367x;
label values aldurb26  sap368x;   label values alchrc26  sap369x;
label values altime27  sap365x;   label values alunit27  sap366x;
label values aldura27  sap367x;   label values aldurb27  sap368x;
label values alchrc27  sap369x;   label values altime28  sap365x;
label values alunit28  sap366x;   label values aldura28  sap367x;
label values aldurb28  sap368x;   label values alchrc28  sap369x;
label values altime29  sap365x;   label values alunit29  sap366x;
label values aldura29  sap367x;   label values aldurb29  sap368x;
label values alchrc29  sap369x;   label values altime30  sap365x;
label values alunit30  sap366x;   label values aldura30  sap367x;
label values aldurb30  sap368x;   label values alchrc30  sap369x;
label values altime31  sap365x;   label values alunit31  sap366x;
label values aldura31  sap367x;   label values aldurb31  sap368x;
label values alchrc31  sap369x;   label values altime32  sap365x;
label values alunit32  sap366x;   label values aldura32  sap367x;
label values aldurb32  sap368x;   label values alchrc32  sap369x;
label values altime33  sap365x;   label values alunit33  sap366x;
label values aldura33  sap367x;   label values aldurb33  sap368x;
label values alchrc33  sap369x;   label values altime34  sap365x;
label values alunit34  sap366x;   label values aldura34  sap367x;
label values aldurb34  sap368x;   label values alchrc34  sap369x;
label values altime90  sap365x;   label values alunit90  sap366x;
label values aldura90  sap367x;   label values aldurb90  sap368x;
label values alchrc90  sap369x;   label values altime91  sap365x;
label values alunit91  sap366x;   label values aldura91  sap367x;
label values aldurb91  sap368x;   label values alchrc91  sap369x;
label values alcndrt   sap545x;   label values alchronr  sap546x;

label values smkev     sap025x;   label values smkreg    sap548x;
label values smknow    sap549x;   label values smkstat2  sap550x;
label values smkqtno   sap551x;   label values smkqttp   sap552x;
label values smkqty    sap553x;   label values cigsda1   sap554x;
label values cigdamo   sap555x;   label values cigsda2   sap554x;
label values cigsday   sap554x;   label values cigqtyr   sap025x;
label values vigno     sap559x;   label values vigtp     sap560x;
label values vigfreqw  sap561x;   label values viglngno  sap562x;
label values viglngtp  sap563x;   label values vigmin    sap562x;
label values modno     sap559x;   label values modtp     sap560x;
label values modfreqw  sap567x;   label values modlngno  sap562x;
label values modlngtp  sap563x;   label values modmin    sap562x;
label values strngno   sap559x;   label values strngtp   sap560x;
label values strfreqw  sap573x;   label values alc1yr    sap025x;
label values alclife   sap025x;   label values alc12mno  sap576x;
label values alc12mtp  sap577x;   label values alc12mwk  sap578x;
label values alc12myr  sap579x;   label values alcamt    sap580x;
label values alcstat   sap581x;   label values alc5upno  sap579x;
label values alc5uptp  sap583x;   label values alc5upyr  sap579x;
label values aheight   sap585x;   label values aweightp  sap586x;
label values sleep     sap588x;

label values ausualpl  sap589x;   label values aplkind   sap590x;
label values ahcplrou  sap025x;   label values ahcplknd  sap592x;
label values ahcchgyr  sap025x;   label values ahcchghi  sap025x;
label values ahcdlyr1  sap025x;   label values ahcdlyr2  sap025x;
label values ahcdlyr3  sap025x;   label values ahcdlyr4  sap025x;
label values ahcdlyr5  sap025x;   label values ahcafyr1  sap025x;
label values ahcafyr2  sap025x;   label values ahcafyr3  sap025x;
label values ahcafyr4  sap025x;   label values adnlong2  sap604x;
label values ahcsyr1   sap025x;   label values ahcsyr2   sap025x;
label values ahcsyr3   sap025x;   label values ahcsyr4   sap025x;
label values ahcsyr5   sap025x;   label values ahcsyr6   sap025x;
label values ahcsyr7   sap025x;   label values ahcsyr8   sap025x;
label values ahcsyr9   sap025x;   label values ahcsyr10  sap025x;
label values ahernoy2  sap615x;   label values ahchyr    sap025x;
label values ahchmoyr  sap588x;   label values ahchnoy2  sap618x;
label values ahcnoyr2  sap615x;   label values asrgyr    sap025x;
label values asrgnoyr  sap621x;   label values amdlongr  sap604x;
label values shtfluyr  sap025x;   label values ashflu_m  sap624x;
label values ashflu_y  sap625x;   label values sprfluyr  sap025x;
label values aspflu_m  sap624x;   label values aspflu_y  sap625x;
label values shtpnuyr  sap025x;   label values apox      sap025x;
label values apox12mo  sap025x;   label values ahep      sap025x;
label values ahepliv   sap025x;   label values shthepb   sap025x;
label values shepdos   sap635x;

label values bldgv     sap025x;   label values bldg12m   sap025x;
label values hivtst    sap025x;   label values whytst_r  sap639x;
label values tst12m_m  sap640x;   label values tst12m_y  sap641x;
label values timetst   sap642x;   label values reatst_c  sap643x;
label values reaswhor  sap644x;   label values lastst_c  sap645x;
label values clntyp_c  sap646x;   label values whoadm    sap647x;
label values givnam    sap025x;   label values extst12m  sap025x;
label values chnsadsp  sap650x;   label values stmtru    sap651x;
label values std       sap025x;   label values stddoc    sap025x;
label values stdwher   sap654x;   label values tbhrd     sap025x;
label values tbknow    sap025x;   label values tb        sap657x;
label values tbsprd1   sap080x;   label values tbsprd2   sap080x;
label values tbsprd3   sap080x;   label values tbsprd4   sap080x;
label values tbsprd5   sap080x;   label values tbsprd6   sap080x;
label values tbcured   sap025x;   label values tbchanc   sap665x;
label values tbshame   sap025x;   label values homeless  sap025x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate rectype [fweight= wtfa_sa];
save $OUT/samadult, replace;

#delimit cr

* data file is stored in samadult.dta
* log  file is stored in samadult.log

log close
