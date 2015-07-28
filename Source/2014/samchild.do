log using "$LOG/samchild.log", replace

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
  str fpx          18 -  19      wtia_sc      20 -  26
      wtfa_sc      27 -  32

      region       33 -  33      strat_p      34 -  36
      psu_p        37 -  38

      sex          39 -  39      hispan_i     40 -  41
      racerpi2     42 -  43      mracrpi2     44 -  45
      mracbpi2     46 -  47      age_p        48 -  49

  str csrespno     50 -  51      csreltvp     52 -  52
      lateintc     53 -  53

      fdrn_flg     54 -  54

      totoz_p      55 -  57      bwtgrm_p     58 -  61
      chght_tc     62 -  63      cwght_tc     64 -  66
      bmi_sc       67 -  70      amr1r        71 -  71
      aodd1        72 -  72      add2         73 -  73
      amr2r        74 -  74      autism       75 -  75
      aodd2        76 -  76      ccondrr1     77 -  77
      ccondrr2     78 -  78      ccondrr3     79 -  79
      ccondrr4     80 -  80      ccondrr5     81 -  81
      ccondrr6     82 -  82      ccondrr7     83 -  83
      ccondrr8     84 -  84      ccondrr9     85 -  85
      cpox         86 -  86      cpox12mo     87 -  87
      cashmev      88 -  88      casstill     89 -  89
      cashyr       90 -  90      caseryr1     91 -  91
      hayf1        92 -  92      rallg1       93 -  93
      dallg1       94 -  94      sallg1       95 -  95
      diarh1       96 -  96      anemia1      97 -  97
      earinf1      98 -  98      seize1       99 -  99
      hayf2       100 - 100      rallg2      101 - 101
      dallg2      102 - 102      sallg2      103 - 103
      diarh2      104 - 104      anemia2     105 - 105
      fhead       106 - 106      earinf2     107 - 107
      seize2      108 - 108      stutter     109 - 109
      chstatyr    110 - 110      schdayr1    111 - 113
      ccold2w     114 - 114      cintil2w    115 - 115
      chearst2    116 - 116      chrwors     117 - 117
      chrworse    118 - 118      chrwhis1    119 - 119
      chrtalk1    120 - 120      chrshou1    121 - 121
      chrspea1    122 - 122      chrcocr1    123 - 123
      chrcoci1    124 - 124      chrfam      125 - 125
      chrmis      126 - 126      chrundst    127 - 127
      chrundns    128 - 128      chearag1    129 - 130
      chrcaus1    131 - 132      chrprbhp    133 - 133
      chrent      134 - 134      chrehdi     135 - 135
      chreiage    136 - 137      chrtube     138 - 138
      chrtbage    139 - 140      chrtsch     141 - 141
      chrtschm    142 - 142      chrtschr    143 - 143
      chrtest     144 - 144      chraidnw    145 - 145
      chraidlg    146 - 147      chraidyr    148 - 148
      chraidev    149 - 149      chraidrc    150 - 150
      chraidlp    151 - 152      chraidof    153 - 153
      chraid01    154 - 154      chraid02    155 - 155
      chraid03    156 - 156      chraid04    157 - 157
      chraid05    158 - 158      chraid06    159 - 159
      chraid07    160 - 160      chraid08    161 - 161
      chraid09    162 - 162      chraid10    163 - 163
      chraid11    164 - 164      chraud      165 - 165
      chralds     166 - 166      chrald01    167 - 167
      chrald02    168 - 168      chrald03    169 - 169
      chrald04    170 - 170      chrald05    171 - 171
      chrald06    172 - 172      chrald07    173 - 173
      chrald08    174 - 174      chrald09    175 - 175
      chrald10    176 - 176      chrald11    177 - 177
      chrald12    178 - 178      chrfire     179 - 179
      chrfrcrk    180 - 180      chrtotr     181 - 181
      chrfrprt    182 - 182      chrwkvln    183 - 183
      chrwkvlt    184 - 185      chrwkprt    186 - 186
      chrlesns    187 - 187      chrlst01    188 - 188
      chrlst02    189 - 189      chrlst03    190 - 190
      chrlst04    191 - 191      chrlst05    192 - 192
      chrlst06    193 - 193      chrlst07    194 - 194
      chrlst08    195 - 195      chrlst09    196 - 196
      chrlst10    197 - 197      chrlst11    198 - 198
      chrlst12    199 - 199      chrlsprt    200 - 200
      chrint      201 - 201      chrinthl    202 - 202
      chrintha    203 - 203      chrinthp    204 - 204
      chrinhpr    205 - 205      cvision     206 - 206
      cblind      207 - 207      ihspeq      208 - 208
      ihmob       209 - 209      ihmobyr     210 - 210
      probrx      211 - 211      learnd      212 - 212
      mhiboy2     213 - 214      cmhagm15    215 - 215
      mhigrl2     216 - 217      cmhagf15    218 - 218

      cusualpl    219 - 219      cplkind     220 - 220
      chcplrou    221 - 221      chcplknd    222 - 222
      chcchgyr    223 - 223      chcchghi    224 - 224
      cnouspl1    225 - 225      cnouspl2    226 - 226
      cnouspl3    227 - 227      cnouspl4    228 - 228
      cnouspl5    229 - 229      cnouspl6    230 - 230
      cnouspl7    231 - 231      cnouspl8    232 - 232
      cnouspl9    233 - 233      cprvtryr    234 - 234
      cprvtrfd    235 - 235      cdrnanp     236 - 236
      cdrnai      237 - 237      chcdlyr1    238 - 238
      chcdlyr2    239 - 239      chcdlyr3    240 - 240
      chcdlyr4    241 - 241      chcdlyr5    242 - 242
      chcafyr     243 - 243      chcafyrn    244 - 244
      chcafyrf    245 - 245      chcafyr1    246 - 246
      chcafyr2    247 - 247      chcafyr3    248 - 248
      chcafyr4    249 - 249      chcafyr5    250 - 250
      chcafyr6    251 - 251      cdnlongr    252 - 252
      chcsyr11    253 - 253      chcsyr12    254 - 254
      chcsyr13    255 - 255      chcsyr14    256 - 256
      chcsyr1     257 - 257      chcsyr2     258 - 258
      chcsyr3     259 - 259      chcsyr4     260 - 260
      chcsyr5     261 - 261      chcsyr6     262 - 262
      chcsyr7     263 - 263      chcsyr81    264 - 264
      chcsyr82    265 - 265      chcsyr10    266 - 266
      chcsyrem    267 - 267      chpxyr_c    268 - 268
      chernoy2    269 - 270      cervisnd    271 - 271
      cerhos      272 - 272      cerrea1r    273 - 273
      cerrea2r    274 - 274      cerrea3r    275 - 275
      cerrea4r    276 - 276      cerrea5r    277 - 277
      cerrea6r    278 - 278      cerrea7r    279 - 279
      cerrea8r    280 - 280      chchyr      281 - 281
      chchmoyr    282 - 283      chchnoy2    284 - 285
      chcnoyr2    286 - 287      csrgyr      288 - 288
      rsrgnoyr    289 - 290      cmdlongr    291 - 291

      rscl2_c2    292 - 292      rscl2_e2    293 - 293
      rscl3_e3    294 - 294      rscl5_p5    295 - 295
      rscl5_h5    296 - 296      rscl6       297 - 297

      cshflu12    298 - 298      cshflunm    299 - 299
      cshflum1    300 - 301      cshfluy1    302 - 305
      cshspfl1    306 - 306      cshflum2    307 - 308
      cshfluy2    309 - 312      cshspfl2    313 - 313

using "$DAT/2014/samchild.dat";
replace wtia_sc = wtia_sc/10;

* DEFINE VARIABLE LABELS;

label variable rectype  "File type identifier";
label variable srvy_yr  "Year of National Health Interview Survey";
label variable hhx      "Household Number";
label variable intv_qrt "Interview Quarter";
label variable intv_mon "Interview Month";
label variable fmx      "Family Number";
label variable fpx      "Person Number (Within family)";
label variable wtia_sc  "Weight - Interim Annual";
label variable wtfa_sc  "Weight - Final Annual";

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

label variable csrespno "Person # of available SC respondent";
label variable csreltvp "Person's relationship to child";
label variable lateintc "Late Sample Child interviews";

label variable fdrn_flg "Disability Questions flag";

label variable totoz_p  "Total birth weight in ounces for public use";
label variable bwtgrm_p "Birth weight in grams for public use";
label variable chght_tc "Total current height in inches (truncated)";
label variable cwght_tc "Current weight in pounds (truncated)";
label variable bmi_sc   "Body Mass Index (BMI)";
label variable amr1r    "
Ever told SC had an intellectual disability also known as mental retardation";
label variable aodd1    "Ever told SC had other developmental delay";
label variable add2     "Ever told SC had ADHD/ADD";
label variable amr2r    "
Ever told SC had an intellectual disability also known as mental retardation";
label variable autism   "
Ever told SC had autism, Asperger's, pervasive devel or autism spectrum disorder
";
label variable aodd2    "Ever told SC had other developmental delay";
label variable ccondrr1 "Ever told SC had Down syndrome";
label variable ccondrr2 "Ever told SC had cerebral palsy";
label variable ccondrr3 "Ever told SC had muscular dystrophy";
label variable ccondrr4 "Ever told SC had cystic fibrosis";
label variable ccondrr5 "Ever told SC had sickle cell anemia";
label variable ccondrr6 "Ever told SC had diabetes";
label variable ccondrr7 "Ever told SC had arthritis";
label variable ccondrr8 "Ever told SC had congenital heart disease";
label variable ccondrr9 "Ever told SC had other heart condition";
label variable cpox     "Ever had chickenpox";
label variable cpox12mo "Chickenpox, past 12 m";
label variable cashmev  "Ever been told SC had asthma";
label variable casstill "Still have asthma";
label variable cashyr   "Had an asthma episode/attack, past 12 m";
label variable caseryr1 "Had visit to ER due to asthma, past 12 m";
label variable hayf1    "Had hay fever, past 12 m";
label variable rallg1   "Had respiratory allergy, past 12 m";
label variable dallg1   "Had food/digestive allergy, past 12 m";
label variable sallg1   "Had eczema/skin allergy, past 12 m";
label variable diarh1   "Had frequent diarrhea/colitis, past 12 m";
label variable anemia1  "Had anemia, past 12 m";
label variable earinf1  "Had 3+ ear infections, past 12 m";
label variable seize1   "Had seizures, past 12 m";
label variable hayf2    "Had hay fever, past 12 m";
label variable rallg2   "Had respiratory allergy, past 12 m";
label variable dallg2   "Had food/digestive allergy, past 12 m";
label variable sallg2   "Had eczema/skin allergy, past 12 m";
label variable diarh2   "Had frequent diarrhea/colitis, past 12 m";
label variable anemia2  "Had anemia, past 12 m";
label variable fhead    "Had frequent headaches/migraines, past 12 m";
label variable earinf2  "Had 3+ ear infections, past 12 m";
label variable seize2   "Had seizures, past 12 m";
label variable stutter  "Stuttered/stammered, past 12 m";
label variable chstatyr "Health better, worse, or about the same";
label variable schdayr1 "Days missed due to illness/injury, past 12 m";
label variable ccold2w  "Had a head/chest cold, 2 week reference period";
label variable cintil2w "
Had stomach illness with vomiting/diarrhea,   2 week reference period";
label variable chearst2 "
Hearing status without hearing aid or other listening device";
label variable chrwors  "Hearing worse in one ear than the other";
label variable chrworse "Hearing status in worse ear";
label variable chrwhis1 "Hear whispering from across quiet room";
label variable chrtalk1 "Hear talking in normal voice from across quiet room";
label variable chrshou1 "Hear shouting from across quiet room";
label variable chrspea1 "Hear loud speaking directly into ear";
label variable chrcocr1 "
Health care professional ever recommend cochlear implant";
label variable chrcoci1 "Had cochlear implant surgery";
label variable chrfam   "Anyone ever said child had hearing problem";
label variable chrmis   "
How often child hears something different from what you said";
label variable chrundst "
How often child has difficulty understanding what others say";
label variable chrundns "
How often child has difficulty understanding conversation if background noise";
label variable chearag1 "Age when began having any hearing loss";
label variable chrcaus1 "Main cause of hearing loss";
label variable chrprbhp "
Last time saw health care professional for any hearing or ear problem";
label variable chrent   "
Referred to hearing specialist by health care professional in past 5 years";
label variable chrehdi  "Screening test for hearing loss at birth";
label variable chreiage "Age when first have earache or ear infection";
label variable chrtube  "Ever have ear tube";
label variable chrtbage "Age have first ear tube";
label variable chrtsch  "Ever had hearing test at school";
label variable chrtschm "Had more than one hearing test at school";
label variable chrtschr "Time since last hearing test at school";
label variable chrtest  "Time since last hearing test by hearing specialist";
label variable chraidnw "Currently use hearing aid";
label variable chraidlg "
How long (weeks, months, or years) child used hearing aid";
label variable chraidyr "Average daily hearing aid use in past two weeks";
label variable chraidev "Ever use hearing aid in past";
label variable chraidrc "Health care professional ever recommend hearing aid";
label variable chraidlp "How long used hearing aid in past (not currently using)
";
label variable chraidof "
Average daily hearing aid use in past (not currently using)";
label variable chraid01 "Reason-Didn't help";
label variable chraid02 "Reason-Made everything too loud";
label variable chraid03 "Reason-Didn't like the way it sounded (unwanted sounds)
";
label variable chraid04 "
Reason-Didn't like own voice sound when wearing hearing aid";
label variable chraid05 "Reason-Uncomfortable";
label variable chraid06 "Reason-Frequently broke";
label variable chraid07 "Reason-Didn't like way it looked";
label variable chraid08 "Reason-Cost too much";
label variable chraid09 "Reason-Didn't think needed it";
label variable chraid10 "Reason-Misplaced or lost";
label variable chraid11 "Reason-Other";
label variable chraud   "Ever trained to improve ability to hear";
label variable chralds  "
Ever use assistive technology for communication due to hearing problem";
label variable chrald01 "
FM system, pocket talker, or other personal listening device";
label variable chrald02 "Instant or text messages";
label variable chrald03 "Classroom amplification systems";
label variable chrald04 "Amplified telephone";
label variable chrald05 "Amplified or vibrating alarm clock";
label variable chrald06 "Notification or signaling alarm system";
label variable chrald07 "Headset with television or closed-caption television";
label variable chrald08 "TTY, TDD or telephone relay service";
label variable chrald09 "Video relay service";
label variable chrald10 "
Live video streaming using sign language or other means of communication";
label variable chrald11 "Sign language interpreter";
label variable chrald12 "Other";
label variable chrfire  "Ever close to gunfire";
label variable chrfrcrk "Ever close to fireworks or other explosive noises";
label variable chrtotr  "Number of total explosive events";
label variable chrfrprt "
How often used hearing protection when explosive noises occurred";
label variable chrwkvln "
Exposed to very loud noises at least 4 hours a day, several days a week";
label variable chrwkvlt "
Time exposed to very loud noises at least 4 hours a day, several days a week";
label variable chrwkprt "
How often used hearing protection when very loud explosive noises occurred";
label variable chrlesns "
Ever exposed to very loud noise 10+ times a year except working or doing chores
";
label variable chrlst01 "
Motorcycles, auto racing, snowmobile, motor boat, or other recreational vehicles
";
label variable chrlst02 "Operating farm machinery";
label variable chrlst03 "Woodworking or other workshop power tools";
label variable chrlst04 "
Lawnmower, electric trimmer, leaf or snow blower, chain saw";
label variable chrlst05 "Guns, firearms";
label variable chrlst06 "Firecrackers or fireworks";
label variable chrlst07 "
Very loud household appliances (vacuum cleaners, hair dryers)";
label variable chrlst08 "CD player, MP3 player, iPod";
label variable chrlst09 "Playing musical instrument";
label variable chrlst10 "Extremely loud toys";
label variable chrlst11 "
Other music-related activity (rock concerts, stereos, clubs, bars";
label variable chrlst12 "
Other activities (video games, home theater, sporting events)";
label variable chrlsprt "
How often used hearing protection when very loud noises occurred outside of work
";
label variable chrint   "
Get internet information about health or medical treatment in past 12 months";
label variable chrinthl "Get internet information about hearing loss, past 12 m
";
label variable chrintha "
Get internet info on cochlear implants or other assistive technology, past 12 m
";
label variable chrinthp "
Get internet information about hearing protection, past 12 m";
label variable chrinhpr "
Information written by health professional or health-related organization";
label variable cvision  "Trouble seeing";
label variable cblind   "Blind/unable to see at all";
label variable ihspeq   "Need special equipment due to impairment/health problem
";
label variable ihmob    "Impairment/health problem limit crawl/walk/run/play";
label variable ihmobyr  "Impairment/health problem lasted/will last 12+ m";
label variable probrx   "Taken RX medication for 3+ m";
label variable learnd   "Ever told SC had a learning disability";
label variable mhiboy2  "Mental health indicator (MHI) scale score";
label variable cmhagm15 "Been unhappy/depressed, past 2 m";
label variable mhigrl2  "Mental health indicator (MHI) scale score";
label variable cmhagf15 "Been unhappy/depressed, past 2 m";

label variable cusualpl "Place USUALLY go when sick";
label variable cplkind  "Type of place to go when sick (most often)";
label variable chcplrou "USUALLY go there for routine/preventive care";
label variable chcplknd "Type of place USUALLY go for routine/preventive care";
label variable chcchgyr "Change health care place, past 12 m";
label variable chcchghi "Change related to health insurance";
label variable cnouspl1 "Doesn't need doctor/No problems";
label variable cnouspl2 "Doesn't like/trust/believe in doctors";
label variable cnouspl3 "Doesn't know where to go";
label variable cnouspl4 "Previous doctor not available/moved";
label variable cnouspl5 "Too expensive/no insurance/cost";
label variable cnouspl6 "Speak a different language";
label variable cnouspl7 "No care available/Care too far away, inconvenient";
label variable cnouspl8 "Put it off/Didn't get around to it";
label variable cnouspl9 "
Other reason child not have usual source of medical care";
label variable cprvtryr "Trouble finding a general doctor to see child";
label variable cprvtrfd "Able to find general doctor to see child";
label variable cdrnanp  "Doctor's office not accept child as new patient";
label variable cdrnai   "Doctor's office not accept child's health insurance";
label variable chcdlyr1 "Couldn't get through on phone, past 12 m";
label variable chcdlyr2 "Couldn't get appointment soon enough, past 12 m";
label variable chcdlyr3 "Wait too long in doctor's office, past 12 m";
label variable chcdlyr4 "Not open when you could go, past 12 m";
label variable chcdlyr5 "No transportation, past 12 m";
label variable chcafyr  "Can't afford prescription medicine, past 12 m";
label variable chcafyrn "Can't afford to see a specialist, past 12 m";
label variable chcafyrf "Can't afford follow-up care, past 12 m";
label variable chcafyr1 "Can't afford prescription medicine, past 12 m";
label variable chcafyr2 "Can't afford mental care/counseling, past 12 m";
label variable chcafyr3 "Can't afford dental care, past 12 m";
label variable chcafyr4 "Can't afford eyeglasses, past 12 m";
label variable chcafyr5 "Can't afford to see a specialist, past 12 m";
label variable chcafyr6 "Can't afford follow-up care, past 12 m";
label variable cdnlongr "Time since last saw dentist";
label variable chcsyr11 "Seen/talked to eye doctor, past 12 m";
label variable chcsyr12 "Seen/talked to foot doctor, past 12 m";
label variable chcsyr13 "Seen/talked to therapist (PT/OT/etc), past 12 m";
label variable chcsyr14 "Seen/talked to a NP/PA, past 12 m";
label variable chcsyr1  "Seen/talked to mental health professional, past 12 m";
label variable chcsyr2  "Seen/talked to eye doctor, past 12 m";
label variable chcsyr3  "Seen/talked to foot doctor, past 12 m";
label variable chcsyr4  "Seen/talked to chiropractor, past 12 m";
label variable chcsyr5  "Seen/talked to therapist (PT/OT/etc), past 12 m";
label variable chcsyr6  "Seen/talked to NP/PA/midwife, past 12 m";
label variable chcsyr7  "Seen/talked to obstetrician/gynecologist, past 12 m";
label variable chcsyr81 "Seen/talked to a medical specialist, past 12 m";
label variable chcsyr82 "Seen/talked to a general doctor, past 12 m";
label variable chcsyr10 "Doctor treats both children and adults";
label variable chcsyrem "Seen/talked to doctor for emotional/behavioral problem
";
label variable chpxyr_c "Had well-child checkup, past 12 m";
label variable chernoy2 "# times in ER/ED, past 12 m";
label variable cervisnd "Most recent ER visit at night or on weekend";
label variable cerhos   "Hospital admission was result of most recent ER visit";
label variable cerrea1r "Didn't have another place to go";
label variable cerrea2r "Doctor's office or clinic was not open";
label variable cerrea3r "Health provider advised ER visit";
label variable cerrea4r "Problem too serious for doctor's office or clinic";
label variable cerrea5r "Only a hospital could help";
label variable cerrea6r "ER is closest provider";
label variable cerrea7r "ER provides most of child's medical care";
label variable cerrea8r "Arrived by ambulance or other emergency vehicle";
label variable chchyr   "Received home care from health professional, past 12 m
";
label variable chchmoyr "# of months of home care, past 12 m";
label variable chchnoy2 "Total number of home visits";
label variable chcnoyr2 "Total number of office visits, past 12 m";
label variable csrgyr   "Had surgery/surgical procedure, past 12 m";
label variable rsrgnoyr "# of outpatient surgeries, past 12 m";
label variable cmdlongr "Time since last seen/talked to health professional";

label variable rscl2_c2 "Well behaved/does what requested, past 6 m";
label variable rscl2_e2 "Many worries/often seems worried, past 6 m";
label variable rscl3_e3 "Unhappy/depressed/tearful, past 6 m";
label variable rscl5_p5 "
Gets along better w/adults than children/youth, past 6 m";
label variable rscl5_h5 "Good attention/completes chores, homework, past 6 m";
label variable rscl6    "
Difficulties w/emotions/concentration/behavior/getting along";

label variable cshflu12 "Flu vaccination, past 12 m";
label variable cshflunm "Number of flu vaccines, past 12 m";
label variable cshflum1 "Month of most recent flu vaccine";
label variable cshfluy1 "Year of most recent flu vaccine";
label variable cshspfl1 "Administration method most recent flu vaccine";
label variable cshflum2 "Month of next most recent flu vaccine";
label variable cshfluy2 "Year of next most recent flu vaccine";
label variable cshspfl2 "Administration method next most recent flu vaccine";

* DEFINE VALUE LABELS FOR REPORTS;

label define scp001x
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
label define scp004x
   1        "1 Quarter 1"
   2        "2 Quarter 2"
   3        "3 Quarter 3"
   4        "4 Quarter 4"
;
label define scp005x
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
label define scp010x
   1        "1 Northeast"
   2        "2 Midwest"
   3        "3 South"
   4        "4 West"
;
label define scp013x
   1        "1 Male"
   2        "2 Female"
;
label define scp014x
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
label define scp015x
   01       "01 White only"
   02       "02 Black/African American only"
   03       "03 AIAN only"
   04       "04 Asian only"
   05       "05 Race group not releasable (See file layout)"
   06       "06 Multiple race"
;
label define scp016x
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
label define scp017x
   01       "01 White"
   02       "02 Black/African American"
   03       "03 Indian (American) (includes Eskimo, Aleut)"
   06       "06 Chinese"
   07       "07 Filipino"
   12       "12 Asian Indian"
   16       "16 Other race (See file layout)"
   17       "17 Multiple race, no primary race selected"
;
label define scp018x
   00       "00 Under 1 year"
   85       "85 85+ years"
;
label define scp020x
   1        "1 Parent (Biological, adoptive, or step)"
   2        "2 Grandparent"
   3        "3 Aunt/Uncle"
   4        "4 Brother"
   5        "5 Other relative or other non-relative"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp021x
   1        "1 Started Sample Child Core 2+ weeks after the initial interview"
   2        "
2 Started Sample Child Core less than 2 weeks after the initial interview"
;
label define scp022x
   1        "1 Families selected to receive AFD (sample adults) section"
   2        "
2 Families selected to receive FDB (all persons 1 year and older) section"
;
label define scp023x
   018      "018 18 ounces or less"
   193      "193 193+ ounces"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp024x
   0500     "0500 500 grams or less"
   5485     "5485 5485+ grams"
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define scp025x
   96       "96 Not available"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Unknown"
;
label define scp026x
   996      "996 Not available"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Unknown"
;
label define scp027x
   9995     "9995 99.95+"
   9999     "9999 Unknown"
;
label define scp028x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp034x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp043x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   9        "9 Don't know"
;
label define scp067x
   1        "1 Better"
   2        "2 Worse"
   3        "3 About the same"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp068x
   000      "000 None"
   996      "996 Did not go to school"
   997      "997 Refused"
   998      "998 Not ascertained"
   999      "999 Don't know"
;
label define scp071x
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
label define scp081x
   1        "1 Always"
   2        "2 Usually"
   3        "3 About half the time"
   4        "4 Seldom"
   5        "5 Never"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp084x
   01       "01 At birth"
   02       "02 0 to 2 years of age"
   03       "03 3 to 5 years of age"
   04       "04 6 to 8 years of age"
   05       "05 9 to 11 years of age"
   06       "06 12 to 14 years of age"
   07       "07 15 to 17 years of age"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp085x
   01       "
01 Mother had infection while pregnant, e.g., cytomegalovirus (CMV), rubella"
   02       "02 Genetic reason(s)"
   03       "03 Born very early, preterm birth or low birth weight"
   04       "
04 Child had infectious disease after birth (measles, meningitis, mumps, etc.)"
   05       "05 Ear infections (fluid in middle ear, otitis, glue ear, etc.)"
   06       "06 Ear injury or head/neck trauma"
   07       "07 Ear disease or surgery"
   08       "
08 Medications/drugs, such as gentamicin (aminoglycosides), cisplatin (cancer dr
ugs), 	antibiotics, anti-inflammatory drugs, diuretics"
   09       "
09 Loud, brief noise from firecrackers, nearby fireworks, gunfire, blasts, or ex
plosions"
   10       "
10 Sudden hearing loss, unexplained by loud, brief noise or other known causes"
   11       "
11 Long term noise exposure from machinery, aircraft, power tools, loud music, l
oud toys, appliances, personal stereos or MP3 players, hair dryers, etc"
   12       "12 Other"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp086x
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
label define scp089x
   00       "00 Never"
   01       "01 Less than 6 months old"
   02       "02 6 to 11 months of age"
   03       "03 12 to 17 months of age"
   04       "04 18 to 23 months of age"
   05       "05 2 to 3 years of age"
   06       "06 4 to 5 years of age"
   07       "07 6 to 8 years of age"
   08       "08 9 years or older"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp091x
   01       "01 Less than 6 months old"
   02       "02 6 to 11 months of age"
   03       "03 12 to 17 months of age"
   04       "04 18 to 23 months of age"
   05       "05 2 to 3 years of age"
   06       "06 4 to 5 years of age"
   07       "07 6 to 8 years of age"
   08       "08 9 years or older"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp092x
   1        "1 Yes"
   2        "2 No"
   3        "3 Home schooled"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp094x
   1        "1 Less than 1 year ago"
   2        "2 1 to 2 years ago"
   3        "3 to 4 years ago"
   4        "4 5 to 9 years ago"
   5        "5 10 or more years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp097x
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
label define scp098x
   0        "0 None"
   1        "1 Less than 1 hour a day"
   2        "2 1 to 3 hours a day"
   3        "3 4 to 7 hours a day"
   4        "4 8 or more hours per day"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp130x
   1        "1 to less than 100 events"
   2        "2 100 to less than 1000 events"
   3        "3 1000 to less than 10,000 events"
   4        "4 10,000 to less than 50,000 events"
   5        "5 50,000 events or more"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp133x
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
label define scp161x
   99       "99 Unknown"
;
label define scp162x
   0        "0 Not true"
   1        "1 Sometimes true"
   2        "2 Often true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp165x
   1        "1 Yes"
   2        "2 There is NO place"
   3        "3 There is MORE THAN ONE place"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp166x
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
label define scp168x
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
label define scp171x
   1        "1 Mentioned"
   2        "2 Not mentioned"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don�t know"
;
label define scp181x
   1        "1 Yes"
   2        "2 No"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don�t know"
;
label define scp198x
   0        "0 Never"
   1        "1 6 months or less"
   2        "2 More than 6 months, but not more than 1 year ago"
   3        "3 More than 1 year, but not more than 2 years ago"
   4        "4 More than 2 years, but not more than 5 years ago"
   5        "5 More than 5 years ago"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp215x
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
label define scp227x
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp228x
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
label define scp231x
   95       "95 95+ times"
   97       "97 Refused"
   98       "98 Not ascertained"
   99       "99 Don't know"
;
label define scp233x
   0        "0 Not true"
   1        "1 Somewhat true"
   2        "2 Certainly true"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp238x
   0        "0 No"
   1        "1 Yes, minor difficulties"
   2        "2 Yes, definite difficulties"
   3        "3 Yes, severe difficulties"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp240x
   1        "1 1 vaccination or dose"
   2        "2 2 or more vaccination doses"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;
label define scp241x
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
label define scp242x
   9997     "9997 Refused"
   9998     "9998 Not ascertained"
   9999     "9999 Don't know"
;
label define scp243x
   1        "1 Flu shot"
   2        "2 Flu nasal spray (spray, mist or drop in nose)"
   7        "7 Refused"
   8        "8 Not ascertained"
   9        "9 Don't know"
;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;

label values rectype   scp001x;   label values intv_qrt  scp004x;
label values intv_mon  scp005x;

label values region    scp010x;

label values sex       scp013x;   label values hispan_i  scp014x;
label values racerpi2  scp015x;   label values mracrpi2  scp016x;
label values mracbpi2  scp017x;   label values age_p     scp018x;

label values csreltvp  scp020x;   label values lateintc  scp021x;

label values fdrn_flg  scp022x;

label values totoz_p   scp023x;   label values bwtgrm_p  scp024x;
label values chght_tc  scp025x;   label values cwght_tc  scp026x;
label values bmi_sc    scp027x;   label values amr1r     scp028x;
label values aodd1     scp028x;   label values add2      scp028x;
label values amr2r     scp028x;   label values autism    scp028x;
label values aodd2     scp028x;   label values ccondrr1  scp034x;
label values ccondrr2  scp034x;   label values ccondrr3  scp034x;
label values ccondrr4  scp034x;   label values ccondrr5  scp034x;
label values ccondrr6  scp034x;   label values ccondrr7  scp034x;
label values ccondrr8  scp034x;   label values ccondrr9  scp034x;
label values cpox      scp043x;   label values cpox12mo  scp028x;
label values cashmev   scp028x;   label values casstill  scp028x;
label values cashyr    scp028x;   label values caseryr1  scp028x;
label values hayf1     scp028x;   label values rallg1    scp028x;
label values dallg1    scp028x;   label values sallg1    scp028x;
label values diarh1    scp028x;   label values anemia1   scp028x;
label values earinf1   scp028x;   label values seize1    scp028x;
label values hayf2     scp028x;   label values rallg2    scp028x;
label values dallg2    scp028x;   label values sallg2    scp028x;
label values diarh2    scp028x;   label values anemia2   scp028x;
label values fhead     scp028x;   label values earinf2   scp028x;
label values seize2    scp028x;   label values stutter   scp028x;
label values chstatyr  scp067x;   label values schdayr1  scp068x;
label values ccold2w   scp028x;   label values cintil2w  scp028x;
label values chearst2  scp071x;   label values chrwors   scp028x;
label values chrworse  scp071x;   label values chrwhis1  scp028x;
label values chrtalk1  scp028x;   label values chrshou1  scp028x;
label values chrspea1  scp028x;   label values chrcocr1  scp028x;
label values chrcoci1  scp028x;   label values chrfam    scp028x;
label values chrmis    scp081x;   label values chrundst  scp081x;
label values chrundns  scp081x;   label values chearag1  scp084x;
label values chrcaus1  scp085x;   label values chrprbhp  scp086x;
label values chrent    scp028x;   label values chrehdi   scp028x;
label values chreiage  scp089x;   label values chrtube   scp028x;
label values chrtbage  scp091x;   label values chrtsch   scp092x;
label values chrtschm  scp028x;   label values chrtschr  scp094x;
label values chrtest   scp086x;   label values chraidnw  scp028x;
label values chraidlg  scp097x;   label values chraidyr  scp098x;
label values chraidev  scp028x;   label values chraidrc  scp028x;
label values chraidlp  scp097x;   label values chraidof  scp098x;
label values chraid01  scp034x;   label values chraid02  scp034x;
label values chraid03  scp034x;   label values chraid04  scp034x;
label values chraid05  scp034x;   label values chraid06  scp034x;
label values chraid07  scp034x;   label values chraid08  scp034x;
label values chraid09  scp034x;   label values chraid10  scp034x;
label values chraid11  scp034x;   label values chraud    scp028x;
label values chralds   scp028x;   label values chrald01  scp034x;
label values chrald02  scp034x;   label values chrald03  scp034x;
label values chrald04  scp034x;   label values chrald05  scp034x;
label values chrald06  scp034x;   label values chrald07  scp034x;
label values chrald08  scp034x;   label values chrald09  scp034x;
label values chrald10  scp034x;   label values chrald11  scp034x;
label values chrald12  scp034x;   label values chrfire   scp028x;
label values chrfrcrk  scp028x;   label values chrtotr   scp130x;
label values chrfrprt  scp081x;   label values chrwkvln  scp028x;
label values chrwkvlt  scp133x;   label values chrwkprt  scp081x;
label values chrlesns  scp028x;   label values chrlst01  scp034x;
label values chrlst02  scp034x;   label values chrlst03  scp034x;
label values chrlst04  scp034x;   label values chrlst05  scp034x;
label values chrlst06  scp034x;   label values chrlst07  scp034x;
label values chrlst08  scp034x;   label values chrlst09  scp034x;
label values chrlst10  scp034x;   label values chrlst11  scp034x;
label values chrlst12  scp034x;   label values chrlsprt  scp081x;
label values chrint    scp028x;   label values chrinthl  scp028x;
label values chrintha  scp028x;   label values chrinthp  scp028x;
label values chrinhpr  scp028x;   label values cvision   scp028x;
label values cblind    scp028x;   label values ihspeq    scp028x;
label values ihmob     scp028x;   label values ihmobyr   scp028x;
label values probrx    scp028x;   label values learnd    scp028x;
label values mhiboy2   scp161x;   label values cmhagm15  scp162x;
label values mhigrl2   scp161x;   label values cmhagf15  scp162x;

label values cusualpl  scp165x;   label values cplkind   scp166x;
label values chcplrou  scp028x;   label values chcplknd  scp168x;
label values chcchgyr  scp028x;   label values chcchghi  scp028x;
label values cnouspl1  scp171x;   label values cnouspl2  scp171x;
label values cnouspl3  scp171x;   label values cnouspl4  scp171x;
label values cnouspl5  scp171x;   label values cnouspl6  scp171x;
label values cnouspl7  scp171x;   label values cnouspl8  scp171x;
label values cnouspl9  scp171x;   label values cprvtryr  scp028x;
label values cprvtrfd  scp181x;   label values cdrnanp   scp028x;
label values cdrnai    scp028x;   label values chcdlyr1  scp028x;
label values chcdlyr2  scp028x;   label values chcdlyr3  scp028x;
label values chcdlyr4  scp028x;   label values chcdlyr5  scp028x;
label values chcafyr   scp028x;   label values chcafyrn  scp028x;
label values chcafyrf  scp028x;   label values chcafyr1  scp028x;
label values chcafyr2  scp028x;   label values chcafyr3  scp028x;
label values chcafyr4  scp028x;   label values chcafyr5  scp028x;
label values chcafyr6  scp028x;   label values cdnlongr  scp198x;
label values chcsyr11  scp028x;   label values chcsyr12  scp028x;
label values chcsyr13  scp028x;   label values chcsyr14  scp028x;
label values chcsyr1   scp028x;   label values chcsyr2   scp028x;
label values chcsyr3   scp028x;   label values chcsyr4   scp028x;
label values chcsyr5   scp028x;   label values chcsyr6   scp028x;
label values chcsyr7   scp028x;   label values chcsyr81  scp028x;
label values chcsyr82  scp028x;   label values chcsyr10  scp028x;
label values chcsyrem  scp028x;   label values chpxyr_c  scp028x;
label values chernoy2  scp215x;   label values cervisnd  scp028x;
label values cerhos    scp028x;   label values cerrea1r  scp181x;
label values cerrea2r  scp181x;   label values cerrea3r  scp028x;
label values cerrea4r  scp181x;   label values cerrea5r  scp028x;
label values cerrea6r  scp181x;   label values cerrea7r  scp181x;
label values cerrea8r  scp181x;   label values chchyr    scp028x;
label values chchmoyr  scp227x;   label values chchnoy2  scp228x;
label values chcnoyr2  scp215x;   label values csrgyr    scp028x;
label values rsrgnoyr  scp231x;   label values cmdlongr  scp198x;

label values rscl2_c2  scp233x;   label values rscl2_e2  scp233x;
label values rscl3_e3  scp233x;   label values rscl5_p5  scp233x;
label values rscl5_h5  scp233x;   label values rscl6     scp238x;

label values cshflu12  scp028x;   label values cshflunm  scp240x;
label values cshflum1  scp241x;   label values cshfluy1  scp242x;
label values cshspfl1  scp243x;   label values cshflum2  scp241x;
label values cshfluy2  scp242x;   label values cshspfl2  scp243x;


save "$OUT/2014/samchild", replace;
#delimit cr
log close
