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
 str  hhx           7 -  12 str  fmx          13 -  14
 str  px           15 -  16 str  csrespno     17 -  18
      csreltiv     19 -  20      intv_qrt     21 -  21
      sex          22 -  22      age_p        23 -  24
      r_age1       25 -  25      r_age2       26 -  26
      origin_i     27 -  27      origimpt     28 -  28
      hispan_i     29 -  30      hispimpt     31 -  31
      racerpi2     32 -  33      raceimp2     34 -  34
      mracrpi2     35 -  36      mracbpi2     37 -  38
      racreci2     39 -  39      hiscodi2     40 -  40
      erimpflg     41 -  41      rrp          42 -  43
 str  hh_ref       44 -  45      frrp         46 -  47
 str  fm_ref       48 -  49 str  mother       50 -  51
      mom_deg      52 -  52 str  father       53 -  54
      dad_deg      55 -  55      parents      56 -  56
 str  guard        57 -  58      fm_size      59 -  60
      fm_type      61 -  61      fm_strcp     62 -  63
      fm_strp      64 -  65      educ         66 -  67
      mom_ed       68 -  69      dad_ed       70 -  71
      ab_bl20k     72 -  72      rat_cat      73 -  74
      region       75 -  75      wtia_sc      76 -  81
      wtfa_sc      82 -  87      stratum      88 -  90
      psu          91 -  91

      bwgtlb       92 -  93      bwgtoz       94 -  95
      bwgtmgr      96 -  99      amr1        100 - 100
      aodd1       101 - 101      add2        102 - 102
      amr2        103 - 103      aodd2       104 - 104
      condl1      105 - 105      condl2      106 - 106
      condl3      107 - 107      condl4      108 - 108
      condl5      109 - 109      condl6      110 - 110
      condl7      111 - 111      condl8      112 - 112
      condl9      113 - 113      condl10     114 - 114
      cpox        115 - 115      cpox12mo    116 - 116
      cashmev     117 - 117      casstill    118 - 118
      cashyr      119 - 119      casmeryr    120 - 120
      casmhsp     121 - 121      casmmc      122 - 122
      cwzmswk     123 - 125      cwzpin      126 - 126
      casminst    127 - 127      casmpmed    128 - 128
      casmcan     129 - 129      casmed      130 - 130
      casmdtp     131 - 131      caswmp      132 - 132
      casclass    133 - 133      casrec      134 - 134
      casres      135 - 135      casmon      136 - 136
      capenvln    137 - 137      capenvdo    138 - 138
      hayf1       139 - 139      rallg1      140 - 140
      dallg1      141 - 141      sallg1      142 - 142
      diarh1      143 - 143      anemia1     144 - 144
      earinf1     145 - 145      seize1      146 - 146
      hayf2       147 - 147      rallg2      148 - 148
      dallg2      149 - 149      sallg2      150 - 150
      diarh2      151 - 151      anemia2     152 - 152
      fhead       153 - 153      earinf2     154 - 154
      seize2      155 - 155      stutter     156 - 156
      chstatyr    157 - 157      schdayr1    158 - 160
      ccold2w     161 - 161      cintil2w    162 - 162
      chearst     163 - 163      cvision     164 - 164
      cblind      165 - 165      ihspeq      166 - 166
      ihmob       167 - 167      ihmobyr     168 - 168
      probrx      169 - 169      learnd      170 - 170
      cmhagm15    171 - 171      cmhagf15    172 - 172
      mhiboy2     173 - 174      mhigrl2     175 - 176

      cusualpl    177 - 177      cplkind     178 - 178
      chcplrou    179 - 179      chcplknd    180 - 180
      sourcelc    181 - 182      chcchgyr    183 - 183
      chcchghi    184 - 184      chcdlyr1    185 - 185
      chcdlyr2    186 - 186      chcdlyr3    187 - 187
      chcdlyr4    188 - 188      chcdlyr5    189 - 189
      chcafyr     190 - 190      chcafyr1    191 - 191
      chcafyr2    192 - 192      chcafyr3    193 - 193
      chcafyr4    194 - 194      cdnlongr    195 - 195
      chcsyr11    196 - 196      chcsyr12    197 - 197
      chcsyr13    198 - 198      chcsyr14    199 - 199
      chcsyr1     200 - 200      chcsyr2     201 - 201
      chcsyr3     202 - 202      chcsyr4     203 - 203
      chcsyr5     204 - 204      chcsyr6     205 - 205
      chcsyr7     206 - 206      chcsyr81    207 - 207
      chcsyr82    208 - 208      chcsyr10    209 - 209
      chcsyrem    210 - 210      chpxyr_c    211 - 211
      chernoy2    212 - 213      chchyr      214 - 214
      chchmoyr    215 - 216      chchnoy2    217 - 218
      chcnoyr2    219 - 220      csrgyr      221 - 221
      csrgnoyr    222 - 223      cmdlongr    224 - 224
      cscl1_s1    225 - 225      cscl1_h1    226 - 226
      cscl1_e1    227 - 227      cscl1_s2    228 - 228
      cscl1_c1    229 - 229      cscl2_p1    230 - 230
      cscl2_c2    231 - 231      cscl2_e2    232 - 232
      cscl2_s3    233 - 233      cscl2_h2    234 - 234
      cscl3_p2    235 - 235      cscl3_c3    236 - 236
      cscl3_e3    237 - 237      cscl3_p3    238 - 238
      cscl3_h3    239 - 239      cscl4_e4    240 - 240
      cscl4_s4    241 - 241      cscl4_c4    242 - 242
      cscl4_p4    243 - 243      cscl4_s5    244 - 244
      cscl5_h4    245 - 245      cscl5_c5    246 - 246
      cscl5_p5    247 - 247      cscl5_e5    248 - 248
      cscl5_h5    249 - 249      cscl6       250 - 250
      cscl7       251 - 251      cscl8       252 - 252
      cscl9_hl    253 - 253      cscl9_fr    254 - 254
      cscl9_cl    255 - 255      cscl9_la    256 - 256
      cscl10      257 - 257
using "$DAT/2003/samchild.dat";
replace wtia_sc = wtia_sc / 10;

* DEFINE VARIABLE LABELS;

label variable rectype  "Record Type";
label variable srvy_yr  "Survey Year";
label variable hhx      "Household Serial Number";
label variable fmx      "Family Serial Number";
label variable px       "Person Number";
label variable csrespno "Sample child respondent's person number";
label variable csreltiv "Person's relationship to child";
label variable intv_qrt "Interview Quarter";
label variable sex      "Sex";
label variable age_p    "Age";
label variable r_age1   "Age Recode #1";
label variable r_age2   "Age Recode #2";
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
label variable rrp      "Relationship to HH reference person";
label variable hh_ref   "Person # of HH reference person";
label variable frrp     "Rel to family ref person";
label variable fm_ref   "Person # of family reference person";
label variable mother   "Mother's person number";
label variable mom_deg  "Type of relationship with Mother";
label variable father   "Father's person number";
label variable dad_deg  "Type of relationship with Father";
label variable parents  "Parent(s) present in the family";
label variable guard    "Person number of guardian";
label variable fm_size  "Number of persons in family";
label variable fm_type  "Family Type (on the person-level)";
label variable fm_strcp "Family Structure (at the person-level)";
label variable fm_strp  "Family Structure (on the person-level)";
label variable educ     "Highest level of school completed";
label variable mom_ed   "Education of Mother";
label variable dad_ed   "Education of Father";
label variable ab_bl20k "Fam inc at/above vs. below $20,000";
label variable rat_cat  "Ratio of fam inc to poverty threshold";
label variable region   "Region";
label variable wtia_sc  "Weight - Interim Annual";
label variable wtfa_sc  "Weight - Final Annual";
label variable stratum  "Stratum for variance estimation";
label variable psu      "PSU for variance estimation";
 
label variable bwgtlb   "Birth weight (lb)";
label variable bwgtoz   "Birth weight (oz)";
label variable bwgtmgr  "Birth weight (grams)";
label variable amr1     "Told - - had mental retardation";
label variable aodd1    "Told - - had otr dev delay";
label variable add2     "Ever told - - had ADHD/ADD";
label variable amr2     "Ever told - - had mental retardation";
label variable aodd2    "Ever told - - had otr dev delay";
label variable condl1   "Ever told - - had Down's Syndrome";
label variable condl2   "Ever told - - had Cerebral Palsy";
label variable condl3   "Ever told - - had Muscular Dystrophy";
label variable condl4   "Ever told - - had Cystic Fibrosis";
label variable condl5   "Ever told - - had Sickle cell anemia";
label variable condl6   "Ever told - - had Autism";
label variable condl7   "Ever told - - had Diabetes";
label variable condl8   "Ever told - - had Arthritis";
label variable condl9   "Ever told - - had Congentl heart disease";
label variable condl10  "Ever told - - had otr heart cond";
label variable cpox     "Has - - EVER had chickenpox?";
label variable cpox12mo "Had chickenpox, PAST 12 MOS?";
label variable cashmev  "Ever been told that - - had asthma";
label variable casstill "Still have asthma";
label variable cashyr   "Has - - had an asthma episode past 12 m";
label variable casmeryr "Did - - visit ER due to asthma";
label variable casmhsp  "Overnight in hospital because of asthma";
label variable casmmc   "Hlth prof talk about asthma mgmt";
label variable cwzmswk  "# days school/work missed";
label variable cwzpin   "EVER used a PRESCRIPTION inhaler";
label variable casminst "Hlth prof show - - how to use inhaler?";
label variable casmpmed "Used inhaler by mouth, past 3 mos?";
label variable casmcan  "Used 3+ canister type inhaler, past 3 m";
label variable casmed   "Ever taken preventive asthma med";
label variable casmdtp  "Use medicine daily/almost daily";
label variable caswmp   "Ever given an asthma management plan";
label variable casclass "Taken course/class on asthma mgmt";
label variable casrec   "Recognize early signs of asthma episode";
label variable casres   "Taught how to respond to asthma episode";
label variable casmon   "Taught to monitor peak flow.";
label variable capenvln "Ever advised to change environment";
label variable capenvdo "How much advice did you follow?";
label variable hayf1    "Has - - had hay fever, past 12 m";
label variable rallg1   "Had respiratory allergy, past 12 m";
label variable dallg1   "Had food/digestive allergy, past 12 m";
label variable sallg1   "Had eczema/skin allergy, past 12 m";
label variable diarh1   "Had freq diarrhea/colitis, past 12 m";
label variable anemia1  "Had anemia, past 12 m";
label variable earinf1  "Had 3+ ear infections, past 12 m";
label variable seize1   "Had seizures, past 12 m";
label variable hayf2    "Had hay fever, past 12 m";
label variable rallg2   "Had respiratory allergy, past 12 m";
label variable dallg2   "Had food/digestive allergy, past 12 m";
label variable sallg2   "Had eczema/skin allergy, past 12 m";
label variable diarh2   "Had freq diarrhea/colitis, past 12 m";
label variable anemia2  "Had anemia, past 12 m";
label variable fhead    "Had freq headaches/migraines, past 12 m";
label variable earinf2  "Had 3+ ear infections, past 12 m";
label variable seize2   "Had seizures, past 12 m";
label variable stutter  "Stuttered/stammered, past 12 m";
label variable chstatyr "Health better, worse, or about the same";
label variable schdayr1 "Days missed due to ill/inj, past 12 m";
label variable ccold2w  "Have a head/chest cold those 2 wks";
label variable cintil2w "Stomach ill w/vomiting/diarrhea, 2 w";
label variable chearst  "Hearing w/o hearing aid";
label variable cvision  "Does - - have trouble seeing";
label variable cblind   "Is - - blind/unable to see at all";
label variable ihspeq   "Need spec equip due to impair/hlth prob";
label variable ihmob    "Impair/hlth prob lmt crawl/walk/run/play";
label variable ihmobyr  "Impair/hlth prob lasted/will last 12+ m";
label variable probrx   "Taken RX medication for 3+ m";
label variable learnd   "Ever told - - had a learning disability";
label variable cmhagm15 "Has - - been unhappy/depressed past 2 m";
label variable cmhagf15 "Has - - been unhappy/depressed past 2 m";
label variable mhiboy2  "Mental hlth indicator (MHI) scale score";
label variable mhigrl2  "Mental hlth indicator (MHI) scale score";
 
label variable cusualpl "Place usually taken when sick";
label variable cplkind  "Place to go when sick (most often)";
label variable chcplrou "Usually go{CPLKIND}for routine/prev care";
label variable chcplknd "Place goes for routine prev care";
label variable sourcelc "Source of medical care recode";
label variable chcchgyr "Change hlth care provider in past 12 m";
label variable chcchghi "Change related to hlth insurance";
label variable chcdlyr1 "Couldn't get through on phone";
label variable chcdlyr2 "Couldn't get appt. soon enough";
label variable chcdlyr3 "Wait too long in doctor's office";
label variable chcdlyr4 "Not open when you could go";
label variable chcdlyr5 "No transportation";
label variable chcafyr  "Can't afford presc medicine";
label variable chcafyr1 "Can't afford presc medicine";
label variable chcafyr2 "Can't afford mental hlth care/counseling";
label variable chcafyr3 "Can't afford dental care";
label variable chcafyr4 "Can't afford eyeglasses";
label variable cdnlongr "When did - - last see/talk to dentist";
label variable chcsyr11 "Has - - seen/talk to eye doctor";
label variable chcsyr12 "Has - - seen/talk to foot doctor";
label variable chcsyr13 "Has- -seen/talk to therapist (PT/OT/etc)";
label variable chcsyr14 "Has - - seen/talk to a RN or PA";
label variable chcsyr1  "Has - - seen/talk to mental hlth prof";
label variable chcsyr2  "Has - - seen/talk to eye doctor";
label variable chcsyr3  "Has - - seen/talk to foot doctor";
label variable chcsyr4  "Has - - seen/talk to chiropractor";
label variable chcsyr5  "Has- -seen/talk to therapst (PT/OT/etc)";
label variable chcsyr6  "Has - - seen/talk to RN or PA";
label variable chcsyr7  "Has - - seen/talk OB/GYN past 12 m";
label variable chcsyr81 "Has - - seen a med specialist, past 12 m";
label variable chcsyr82 "Has - - seen a general doctor, past 12 m";
label variable chcsyr10 "Does that Dr treat both kids and adults";
label variable chcsyrem "Seen/talk Dr for  - -'s emot/behav prob";
label variable chpxyr_c "Has - - had check-up past 12 m";
label variable chernoy2 "# times in ER/ED past 12 m";
label variable chchyr   "Got home care from hlth prof, past 12 m";
label variable chchmoyr "How many months of home care";
label variable chchnoy2 "Total number of home visits";
label variable chcnoyr2 "Total number of office vst";
label variable csrgyr   "Has - - had surgery in the past 12 m";
label variable csrgnoyr "Times had outpatient surgery past 12 m";
label variable cmdlongr "Last time - - saw/spoke to hlth prof";
label variable cscl1_s1 "Considerate of others feelings";
label variable cscl1_h1 "Restless/overactive";
label variable cscl1_e1 "Often complains headaches/stomach aches";
label variable cscl1_s2 "Shares treats/toys";
label variable cscl1_c1 "Often loses temper";
label variable cscl2_p1 "Solitary/alone";
label variable cscl2_c2 "Well-behaved";
label variable cscl2_e2 "Worries/often worried";
label variable cscl2_s3 "Helpful if someone upset/ill";
label variable cscl2_h2 "Fidgeting/squirming";
label variable cscl3_p2 "At least one good friend";
label variable cscl3_c3 "Often fights(child)/bullies (youth)";
label variable cscl3_e3 "Often unhappy/tearful";
label variable cscl3_p3 "Liked by children/youth";
label variable cscl3_h3 "Easily distracted/wanders";
label variable cscl4_e4 "Clingy (child)/loses confidence (youth)";
label variable cscl4_s4 "Kind to younger children";
label variable cscl4_c4 "Often lies/cheats";
label variable cscl4_p4 "Picked on/bullied";
label variable cscl4_s5 "Often helps others";
label variable cscl5_h4 "Thinks before acting";
label variable cscl5_c5 "Steals from home/school";
label variable cscl5_p5 "Gets along best w/adults";
label variable cscl5_e5 "Many fears/easily scared";
label variable cscl5_h5 "Good attention/finish tasks";
label variable cscl6    "Diff w/emotions/behavior";
label variable cscl7    "Length of time have difficulties";
label variable cscl8    "Difficulties upset or distress child";
label variable cscl9_hl "Difficulties interfere with home life";
label variable cscl9_fr "Difficulties interfere with friendships";
label variable cscl9_cl "Difficulties interfere with learning";
label variable cscl9_la "Difficulties interfere w/ leisure";
label variable cscl10   "Difficulties put burden on you or family";

* DEFINE VALUE LABELS FOR REPORTS;

label define scp001x
   40               "40 Sample Child (SC)"
;
label define scp002x
   2003             "2003"
;
label define scp007x
   01               "01 Parent (Biological, adoptive, or step)"
   02               "02 Grandparent"
   03               "03 Aunt/Uncle"
   04               "04 Brother/Sister"
   05               "05 Other relative"
   06               "06 Legal guardian"
   07               "07 Foster parent"
   08               "08 Other non-relative"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp008x
   1                "1 Quarter 1"
   2                "2 Quarter 2"
   3                "3 Quarter 3"
   4                "4 Quarter 4"
;
label define scp009x
   1                "1 Male"
   2                "2 Female"
;
label define scp010x
   00               "00 Under 1 year"
;
label define scp011x
   1                "1 Under 5 years"
   2                "2 5-17 years"
;
label define scp012x
   1                "1 Under 6 years"
   2                "2 6-16 years"
   3                "3 17 years"
;
label define scp013x
   1                "1 Yes"
   2                "2 No"
;
label define scp014x
   1                "1 Imputed: was 'refused' Hispanic Origin"
   2                "2 Imputed: was 'not ascertained' Hispanic Origin"
   3                "3 Imputed: was 'does not know' Hispanic Origin"
   4                "4 Hispanic origin given by respondent/proxy"
;
label define scp015x
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
label define scp016x
   1                "1 Imputed: was 'refused' Hispanic Origin"
   2                "2 Imputed: was 'not ascertained' Hispanic Origin"
   3                "3 Imputed: was 'does not know' Hispanic Origin"
   4                "4 Hispanic Origin type given by respondent/proxy"
;
label define scp017x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN only"
   04               "04 Asian only"
   05               "05 Race group not releasable*"
   06               "06 Multiple race"
;
label define scp018x
   1                "1 Imputed: was 'refused'"
   2                "2 Imputed: was 'not ascertained'"
   3                "3 Imputed: was 'does not know'"
   4                "4 Imputed: was 'other race'"
   5                "5 Imputed: was 'unspecified multiple race'"
   6                "6 Race given by respondent/proxy"
;
label define scp019x
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
label define scp020x
   01               "01 White"
   02               "02 Black/African American"
   03               "03 Indian (American) (includes Eskimo, Aleut)"
   06               "06 Chinese"
   07               "07 Filipino"
   12               "12 Asian Indian"
   16               "16 Other race*"
   17               "17 Multiple race, no primary race selected"
;
label define scp021x
   1                "1 White"
   2                "2 Black"
   3                "3 All other race groups*"
;
label define scp022x
   1                "1 Hispanic"
   2                "2 Non-Hispanic White"
   3                "3 Non-Hispanic Black"
   4                "4 Non-Hispanic All other race groups"
;
label define scp023x
   1                "1 Ethnicity/race imputed"
   2                "2 Ethnicity/race given by respondent/proxy"
;
label define scp024x
   01               "01 Household reference person"
   02               "02 Spouse (husband/wife)"
   03               "03 Unmarried Partner"
   04               "04 Child (biological/adoptive/in-law/step/foster)"
   05               "05 Child of partner"
   06               "06 Grandchild"
   07               "07 Parent (bio./adoptive/in-law/step/foster)"
   08               "08 Brother/sister (bio./adop./in-law/step/foster)"
   09               "09 Grandparent (Grandmother/Grandfather)"
   10               "10 Aunt/Uncle"
   11               "11 Niece/Nephew"
   12               "12 Other relative"
   13               "13 Housemate/roommate"
   14               "14 Roomer/Boarder"
   15               "15 Other nonrelative"
   16               "16 Legal guardian"
   17               "17 Ward"
   97               "97 Refused"
   99               "99 Don't know"
;
label define scp026x
   01               "01 Family reference person"
   02               "02 Spouse (husband/wife)"
   03               "03 Unmarried Partner"
   04               "04 Child (biological/adoptive/in-law/step/foster)"
   05               "05 Child of partner"
   06               "06 Grandchild"
   07               "07 Parent (bio./adoptive/in-law/step/foster)"
   08               "08 Brother/sister (bio./adop./in-law/step/foster)"
   09               "09 Grandparent (Grandmother/Grandfather)"
   10               "10 Aunt/Uncle"
   11               "11 Niece/Nephew"
   12               "12 Other relative"
   16               "16 Legal guardian"
   17               "17 Ward"
   97               "97 Refused"
   99               "99 Don't know"
;
label define scp029x
   1                "1 Biological"
   2                "2 Adoptive"
   3                "3 Step"
   4                "4 Foster"
   5                "5 In-law"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp032x
   1                "1 Mother, no father"
   2                "2 Father, no mother"
   3                "3 Mother and father"
   4                "4 Neither mother nor father"
   9                "9 Unknown"
;
label define scp035x
   1                "1 One adult, no child(ren) under 18"
   2                "2 Multiple adults, no child(ren) under 18"
   3                "3 One adult, 1+ child(ren) under 18"
   4                "4 Multiple adults, 1+ child(ren) under 18"
   9                "9 Unknown"
;
label define scp038x
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
label define scp039x
   01               "01 Less/equal to 8th grade"
   02               "02 9-12th grade, no high school diploma"
   03               "03 High school graduate/GED recipient"
   04               "04 Some college, no degree"
   05               "05 AA degree, technical or vocational"
   06               "06 AA degree, academic program"
   07               "07 Bachelor's degree"
   08               "08 Master's, professional, or doctoral degree"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp041x
   1                "1 $20,000 or more"
   2                "2 Less than $20,000"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp042x
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
label define scp043x
   1                "1 Northeast"
   2                "2 Midwest"
   3                "3 South"
   4                "4 West"
;
label define scp048x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp049x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp050x
   0500             "0500 500 grams or less"
   5485             "5485 5485+ grams"
   9997             "9997 Refused"
   9998             "9998 Not ascertained"
   9999             "9999 Don't know"
;
label define scp051x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp056x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp066x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp073x
   1                "1 Yes"
   2                "2 No"
   3                "3 Still in hospital"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp074x
   000              "000 None"
   995              "995 Home schooled"
   996              "996 Child did not go to daycare or preschool/"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define scp082x
   1                "1 Yes"
   2                "2 No"
   3                "3 Adult took class for child's asthma"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp086x
   1                "1 Yes"
   2                "2 No"
   3                "3 Was told no changes needed"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp087x
   0                "0 None"
   1                "1 A little"
   2                "2 Some"
   3                "3 Most"
   4                "4 All"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp106x
   1                "1 Better"
   2                "2 Worse"
   3                "3 About the same"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp107x
   000              "000 None"
   996              "996 Did not go to school"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define scp110x
   1                "1 Good"
   2                "2 Little trouble"
   3                "3 Lot of trouble"
   4                "4 Deaf"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp118x
   0                "0 Not True"
   1                "1 Sometimes True"
   2                "2 Often True"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp120x
   99               "99 Unknown"
;
label define scp122x
   1                "1 Yes"
   2                "2 There is NO place"
   3                "3 There is MORE THAN ONE place"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp123x
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
label define scp125x
   0                "0 Doesn't get preventive care anywhere"
   1                "1 Clinic or health center"
   2                "2 Doctor's office of HMO"
   3                "3 Hospital emergency room"
   4                "4 Hospital outpatient department"
   5                "5 Some other place"
   6                "6 Doesn't go to one place most often"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp126x
   01               "01 Same sorc sk care & rout care"
   02               "02 Sorc sk care, no sorc rout care"
   03               "03 Sorc sk & rout care, no/unk same sorc"
   04               "04 Sorc sk care, unk sorc rout care*"
   05               "05 GE 2 sorc sk care, 1 is sorc rout care"
   06               "06 GE 2 sorc sk care, no sorc rout care"
   07               "07 GE 2 sorc sk & rout care, no/unk if same"
   08               "08 GE 2 sorc sk care, unk sorc rout care*"
   09               "09 No sorc sk care or rout care"
   10               "10 No sorc sk care, has sorc rout care"
   11               "11 No sorc sk care, unk sorc rout care*"
   12               "12 Unk sorc sk care, no sorc rout care"
   13               "13 Unk sorc sk care, has sorc rout care"
   14               "14 Unk sorc sk care or sorc rout care*"
   99               "99 Unknown other"
;
label define scp139x
   0                "0 Never"
   1                "1 6 Months or less"
   2                "2 More than 6 months but not more than 1 year ago"
   3                "3 More than 1 year, but not more than 2 years ago"
   4                "4 More than 2 yrs, but not more than 5 years ago"
   5                "5 More than 5 years ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp156x
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
label define scp158x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp159x
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
label define scp162x
   95               "95 95+ times"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp163x
   0                "0 Never"
   1                "1 6 months or less"
   2                "2 More than 6 months, but not more than 1 yr ago"
   3                "3 More than 1 year, but not more than 2 yrs ago"
   4                "4 More than 2 years, but not more than 5 yrs ago"
   5                "5 More than 5 yrs ago"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp164x
   0                "0 Not True"
   1                "1 Somewhat True"
   2                "2 Certainly True"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp189x
   0                "0 No"
   1                "1 Yes, minor difficulties"
   2                "2 Yes, definite difficulties"
   3                "3 Yes, severe difficulties"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp190x
   1                "1 Less than a month"
   2                "2 1 - 5 months"
   3                "3 6 - 12 months"
   4                "4 Over 12 months"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp191x
   0                "0 Not at all"
   1                "1 A little"
   2                "2 A medium amount"
   3                "3 A great deal"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;

* ASSOCIATE VARIABLES WITH LABEL DEFINITIONS;

label values rectype   scp001x;   label values srvy_yr   scp002x;
label values csreltiv  scp007x;   label values intv_qrt  scp008x;
label values sex       scp009x;   label values age_p     scp010x;
label values r_age1    scp011x;   label values r_age2    scp012x;
label values origin_i  scp013x;   label values origimpt  scp014x;
label values hispan_i  scp015x;   label values hispimpt  scp016x;
label values racerpi2  scp017x;   label values raceimp2  scp018x;
label values mracrpi2  scp019x;   label values mracbpi2  scp020x;
label values racreci2  scp021x;   label values hiscodi2  scp022x;
label values erimpflg  scp023x;   label values rrp       scp024x;
label values frrp      scp026x;   label values mom_deg   scp029x;
label values dad_deg   scp029x;   label values parents   scp032x;
label values fm_type   scp035x;   label values educ      scp038x;
label values mom_ed    scp039x;   label values dad_ed    scp039x;
label values ab_bl20k  scp041x;   label values rat_cat   scp042x;
label values region    scp043x;

label values bwgtlb    scp048x;   label values bwgtoz    scp049x;
label values bwgtmgr   scp050x;   label values amr1      scp051x;
label values aodd1     scp051x;   label values add2      scp051x;
label values amr2      scp051x;   label values aodd2     scp051x;
label values condl1    scp056x;   label values condl2    scp056x;
label values condl3    scp056x;   label values condl4    scp056x;
label values condl5    scp056x;   label values condl6    scp056x;
label values condl7    scp056x;   label values condl8    scp056x;
label values condl9    scp056x;   label values condl10   scp056x;
label values cpox      scp066x;   label values cpox12mo  scp051x;
label values cashmev   scp066x;   label values casstill  scp051x;
label values cashyr    scp051x;   label values casmeryr  scp051x;
label values casmhsp   scp051x;   label values casmmc    scp073x;
label values cwzmswk   scp074x;   label values cwzpin    scp051x;
label values casminst  scp051x;   label values casmpmed  scp051x;
label values casmcan   scp051x;   label values casmed    scp051x;
label values casmdtp   scp051x;   label values caswmp    scp051x;
label values casclass  scp082x;   label values casrec    scp051x;
label values casres    scp051x;   label values casmon    scp051x;
label values capenvln  scp086x;   label values capenvdo  scp087x;
label values hayf1     scp051x;   label values rallg1    scp051x;
label values dallg1    scp051x;   label values sallg1    scp051x;
label values diarh1    scp051x;   label values anemia1   scp051x;
label values earinf1   scp051x;   label values seize1    scp051x;
label values hayf2     scp051x;   label values rallg2    scp051x;
label values dallg2    scp051x;   label values sallg2    scp051x;
label values diarh2    scp051x;   label values anemia2   scp051x;
label values fhead     scp051x;   label values earinf2   scp051x;
label values seize2    scp051x;   label values stutter   scp051x;
label values chstatyr  scp106x;   label values schdayr1  scp107x;
label values ccold2w   scp066x;   label values cintil2w  scp066x;
label values chearst   scp110x;   label values cvision   scp066x;
label values cblind    scp051x;   label values ihspeq    scp066x;
label values ihmob     scp066x;   label values ihmobyr   scp051x;
label values probrx    scp066x;   label values learnd    scp051x;
label values cmhagm15  scp118x;   label values cmhagf15  scp118x;
label values mhiboy2   scp120x;   label values mhigrl2   scp120x;

label values cusualpl  scp122x;   label values cplkind   scp123x;
label values chcplrou  scp051x;   label values chcplknd  scp125x;
label values sourcelc  scp126x;   label values chcchgyr  scp051x;
label values chcchghi  scp051x;   label values chcdlyr1  scp066x;
label values chcdlyr2  scp066x;   label values chcdlyr3  scp066x;
label values chcdlyr4  scp066x;   label values chcdlyr5  scp066x;
label values chcafyr   scp051x;   label values chcafyr1  scp051x;
label values chcafyr2  scp051x;   label values chcafyr3  scp051x;
label values chcafyr4  scp051x;   label values cdnlongr  scp139x;
label values chcsyr11  scp051x;   label values chcsyr12  scp051x;
label values chcsyr13  scp051x;   label values chcsyr14  scp051x;
label values chcsyr1   scp051x;   label values chcsyr2   scp051x;
label values chcsyr3   scp051x;   label values chcsyr4   scp051x;
label values chcsyr5   scp051x;   label values chcsyr6   scp051x;
label values chcsyr7   scp051x;   label values chcsyr81  scp066x;
label values chcsyr82  scp066x;   label values chcsyr10  scp051x;
label values chcsyrem  scp051x;   label values chpxyr_c  scp066x;
label values chernoy2  scp156x;   label values chchyr    scp066x;
label values chchmoyr  scp158x;   label values chchnoy2  scp159x;
label values chcnoyr2  scp156x;   label values csrgyr    scp066x;
label values csrgnoyr  scp162x;   label values cmdlongr  scp163x;
label values cscl1_s1  scp164x;   label values cscl1_h1  scp164x;
label values cscl1_e1  scp164x;   label values cscl1_s2  scp164x;
label values cscl1_c1  scp164x;   label values cscl2_p1  scp164x;
label values cscl2_c2  scp164x;   label values cscl2_e2  scp164x;
label values cscl2_s3  scp164x;   label values cscl2_h2  scp164x;
label values cscl3_p2  scp164x;   label values cscl3_c3  scp164x;
label values cscl3_e3  scp164x;   label values cscl3_p3  scp164x;
label values cscl3_h3  scp164x;   label values cscl4_e4  scp164x;
label values cscl4_s4  scp164x;   label values cscl4_c4  scp164x;
label values cscl4_p4  scp164x;   label values cscl4_s5  scp164x;
label values cscl5_h4  scp164x;   label values cscl5_c5  scp164x;
label values cscl5_p5  scp164x;   label values cscl5_e5  scp164x;
label values cscl5_h5  scp164x;   label values cscl6     scp189x;
label values cscl7     scp190x;   label values cscl8     scp191x;
label values cscl9_hl  scp191x;   label values cscl9_fr  scp191x;
label values cscl9_cl  scp191x;   label values cscl9_la  scp191x;
label values cscl10    scp191x;

save "$OUT/2003/samchild", replace;

#delimit cr
log close
