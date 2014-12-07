global DAT "~/database/NHIS/Data/raw/2002"
global OUT "~/database/NHIS/Data/dta/2002"
global LOG "~/database/NHIS/Log"

log using "$LOG/samchild.log", replace

version 6.0

* THE FOLLOWING COMMAND TEMPORARILY CHANGES THE COMMAND-ENDING
* DELIMITER FROM A CARRIAGE RETURN TO A SEMICOLON

#delimit ;

*********************************************************************
 NOVEMBER 20, 2003
 
 THIS IS AN EXAMPLE OF A STATA DO PROGRAM THAT CREATES A STATA
 FILE FROM THE 2002 NHIS PUBLIC USE SAMCHILD.DAT ASCII FILE

 NOTES:

EXECUTING THIS PROGRAM WILL REPLACE SAMCHILD.DTA AND SAMCHILD.LOG
IF THOSE FILES ALREADY EXIST IN THE DEFAULT DIRECTORY

THIS PROGRAM ASSUMES THAT THE ASCII DATA FILE IS IN STATA'S WORKING
DIRECTORY.  AN EXAMPLE OF HOW TO CHANGE THE WORKING DIRECTORY 
WITHIN STATA IS THE FOLLOWING COMMAND: cd \nhis2002\

THIS PROGRAM OPENS A LOG FILE.  IF THE PROGRAM ENDS PREMATURELY, THE
LOG FILE WILL REMAIN OPEN.  BEFORE RUNNING THIS PROGRAM AGAIN, THE
USER SHOULD ENTER THE FOLLOWING STATA COMMAND:  log close
 
 THIS IS STORED IN SAMCHILD.DO
*********************************************************************;
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
      rcdt1p_i     32 -  33      rc_smp_i     34 -  35
      racerp_i     36 -  37      raceimpt     38 -  38
      mracrp_i     39 -  40      mracbp_i     41 -  42
      racrec_i     43 -  43      hiscod_i     44 -  44
      erimpflg     45 -  45      rrp          46 -  47
 str  hh_ref       48 -  49      frrp         50 -  51
 str  fm_ref       52 -  53 str  mother       54 -  55
      mom_deg      56 -  56 str  father       57 -  58
      dad_deg      59 -  59      parents      60 -  60
 str  guard        61 -  62      fm_size      63 -  64
      fm_type      65 -  65      fm_strcp     66 -  67
      fm_strp      68 -  69      educ         70 -  71
      mom_ed       72 -  73      dad_ed       74 -  75
      ab_bl20k     76 -  76      rat_cat      77 -  78
      region       79 -  79      wtia_sc      80 -  85
      wtfa_sc      86 -  91      stratum      92 -  94
      psu          95 -  95

      bwgtlb       96 -  97      bwgtoz       98 -  99
      bwgtmgr     100 - 103      amr1        104 - 104
      aodd1       105 - 105      add2        106 - 106
      amr2        107 - 107      aodd2       108 - 108
      condl1      109 - 109      condl2      110 - 110
      condl3      111 - 111      condl4      112 - 112
      condl5      113 - 113      condl6      114 - 114
      condl7      115 - 115      condl8      116 - 116
      condl9      117 - 117      condl10     118 - 118
      cpox        119 - 119      cpox12mo    120 - 120
      cashmev     121 - 121      casstill    122 - 122
      cashyr      123 - 123      casmeryr    124 - 124
      cwzmswk     125 - 127      casmed      128 - 128
      caswmp      129 - 129      capenvln    130 - 130
      hayf1       131 - 131      rallg1      132 - 132
      dallg1      133 - 133      sallg1      134 - 134
      diarh1      135 - 135      anemia1     136 - 136
      earinf1     137 - 137      seize1      138 - 138
      hayf2       139 - 139      rallg2      140 - 140
      dallg2      141 - 141      sallg2      142 - 142
      diarh2      143 - 143      anemia2     144 - 144
      fhead       145 - 145      earinf2     146 - 146
      seize2      147 - 147      stutter     148 - 148
      chstatyr    149 - 149      schdayr1    150 - 152
      ccold2w     153 - 153      cintil2w    154 - 154
      chaid       155 - 155      chfreq      156 - 156
      chearst     157 - 157      cvision     158 - 158
      cblind      159 - 159      cvistst     160 - 160
      cvislt      161 - 161      cvisrd      162 - 162
      cvisact     163 - 163      cvisprot    164 - 164
      ihspeq      165 - 165      ihmob       166 - 166
      ihmobyr     167 - 167      probrx      168 - 168
      learnd      169 - 169      cmhagm15    170 - 170
      cmhagf15    171 - 171      cmhmf12     172 - 172
      cmhmf13     173 - 173      cmhmf14     174 - 174
      cmhmf15     175 - 175      cmhmf16     176 - 176
      cmhdiff     177 - 177      mhiboy2     178 - 179
      mhigrl2     180 - 181

      cusualpl    182 - 182      cplkind     183 - 183
      chcplrou    184 - 184      chcplknd    185 - 185
      sourcelc    186 - 187      chcchgyr    188 - 188
      chcchghi    189 - 189      chcdlyr1    190 - 190
      chcdlyr2    191 - 191      chcdlyr3    192 - 192
      chcdlyr4    193 - 193      chcdlyr5    194 - 194
      chcafyr     195 - 195      chcafyr1    196 - 196
      chcafyr2    197 - 197      chcafyr3    198 - 198
      chcafyr4    199 - 199      cdnlongr    200 - 200
      chcsyr11    201 - 201      chcsyr12    202 - 202
      chcsyr13    203 - 203      chcsyr14    204 - 204
      chcsyr1     205 - 205      chcsyr2     206 - 206
      chcsyr3     207 - 207      chcsyr4     208 - 208
      chcsyr5     209 - 209      chcsyr6     210 - 210
      chcsyr7     211 - 211      chcsyr81    212 - 212
      chcsyr82    213 - 213      chcsyr10    214 - 214
      chcsyrem    215 - 215      chpxyr_c    216 - 216
      chernoy2    217 - 218      chchyr      219 - 219
      chchmoyr    220 - 221      chchnoy2    222 - 223
      chcnoyr2    224 - 225      csrgyr      226 - 226
      csrgnoyr    227 - 228      cmdlongr    229 - 229
      facct1      230 - 230      facct1_a    231 - 231
      facct1_b    232 - 232      facct2      233 - 233
      facct2_a    234 - 234      facct2_b    235 - 235
      facct3      236 - 236      facct3_a    237 - 237
      facct3_b    238 - 238      facct4      239 - 239
      facct4_a    240 - 240      facct4_b    241 - 241
      facct5      242 - 242      facct5_a    243 - 243
using $DAT/samchild.dat;
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
label variable rcdt1p_i "Race coded to single/multiple race group";
label variable rc_smp_i "Summary for single/multiple race groups";
label variable racerp_i "OMB groups w/multiple race";
label variable raceimpt "Race Imputation Flag";
label variable mracrp_i "Race coded to a single race group";
label variable mracbp_i "Race coded to a single race group";
label variable racrec_i "Race Recode";
label variable hiscod_i "Combined race/ethnicity recode";
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
label variable cwzmswk  "# days school/work missed";
label variable casmed   "Ever taken preventive asthma med";
label variable caswmp   "Ever given an asthma management plan";
label variable capenvln "Ever advised to change environment";
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
label variable chaid    "Ever worn a hearing aid";
label variable chfreq   "How often wore hearing aid, past 12m";
label variable chearst  "Hearing w/o hearing aid";
label variable cvision  "Does - - have trouble seeing";
label variable cblind   "Is - - blind/unable to see at all";
label variable cvistst  "Ever had vision tested";
label variable cvislt   "How long since vision last tested";
label variable cvisrd   "Reads from back of classroom";
label variable cvisact  "Participate in eye injury-causing acts";
label variable cvisprot "Wears eye protection for activities";
label variable ihspeq   "Need spec equip due to impair/hlth prob";
label variable ihmob    "Impair/hlth prob lmt crawl/walk/run/play";
label variable ihmobyr  "Impair/hlth prob lasted/will last 12+ m";
label variable probrx   "Taken RX medication for 3+ m";
label variable learnd   "Ever told - - had a learning disability";
label variable cmhagm15 "Has - - been unhappy/depressed past 2 m";
label variable cmhagf15 "Has - - been unhappy/depressed past 2 m";
label variable cmhmf12  "Is - - generally well behaved, past 6m";
label variable cmhmf13  "Has - - had worries, past 6m";
label variable cmhmf14  "Is - - often unhappy, past 6m";
label variable cmhmf15  "Gets along better w/ adults, past 6m";
label variable cmhmf16  "Has good attention span";
label variable cmhdiff  "Difficulties with emotions";
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
label variable facct1   "Need/Use prescription medicine";
label variable facct1_a "Need/Use prescription med b/c med cond";
label variable facct1_b "Cond for prescribed med at least 12m";
label variable facct2   "Need/Use more care/services than usual";
label variable facct2_a "More care/services due to health cond";
label variable facct2_b "Cond for more care/services at least 12m";
label variable facct3   "Limited in things other children do";
label variable facct3_a "Limitations due to health condition";
label variable facct3_b "Limitations at least 12 months";
label variable facct4   "Get special therapy";
label variable facct4_a "Special therapy due to health condition";
label variable facct4_b "Cond for special therapy at least 12m";
label variable facct5   "Need/get treatment due to cond";
label variable facct5_a "Cond for treatment at least 12m";

* DEFINE VALUE LABELS FOR REPORTS;

label define scp001x
   40               "40 Sample Child (SC)"
;
label define scp002x
   2002             "2002"
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
   1                "1 Imputed 'refused' Hispanic Origin response"
   2                "2 Imputed 'not ascertained' Hispanic Origin"
   3                "3 Imputed 'does not know' Hispanic Origin"
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
   1                "1 Imputed 'refused' Hispanic Origin type"
   2                "2 Imputed 'not ascertained' Hispanic Origin type"
   3                "3 Imputed 'does not know' Hispanic Origin type"
   4                "4 Hispanic Origin type given by respondent/proxy"
;
label define scp017x
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
label define scp018x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN only*"
   04               "04 Asian only"
   05               "05 Other race only"
   06               "06 Multiple detailed race only"
;
label define scp019x
   01               "01 White only"
   02               "02 Black/African American only"
   03               "03 AIAN* only"
   04               "04 Asian only"
   05               "05 Other race only"
   06               "06 Multiple race"
;
label define scp020x
   1                "1 Imputed 'refused' race response"
   2                "2 Imputed 'not ascertained' race response"
   3                "3 Imputed 'does not know' race response"
   4                "4 Race given by respondent/proxy"
;
label define scp021x
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
label define scp022x
   01               "01 White"
   02               "02 Black/African American"
   03               "03 Indian (American) (includes Eskimo, Aleut)"
   06               "06 Chinese"
   07               "07 Filipino"
   12               "12 Asian Indian"
   16               "16 Other race"
   17               "17 Multiple race"
;
label define scp023x
   1                "1 White"
   2                "2 Black"
   3                "3 Other"
;
label define scp024x
   1                "1 Hispanic"
   2                "2 Non-Hispanic White"
   3                "3 Non-Hispanic Black"
   4                "4 Non-Hispanic Other"
;
label define scp025x
   1                "1 Ethnicity/race imputed"
   2                "2 Ethnicity/race given by respondent/proxy"
;
label define scp026x
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
label define scp028x
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
label define scp031x
   1                "1 Biological"
   2                "2 Step"
   3                "3 Adoptive"
   4                "4 Foster"
   5                "5 In-law"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp034x
   1                "1 Mother, no father"
   2                "2 Father, no mother"
   3                "3 Mother and father"
   4                "4 Neither mother nor father"
   9                "9 Unknown"
;
label define scp037x
   1                "1 One adult, no child(ren) under 18"
   2                "2 Multiple adults, no child(ren) under 18"
   3                "3 One adult, 1+ child(ren) under 18"
   4                "4 Multiple adults, 1+ child(ren) under 18"
   9                "9 Unknown"
;
label define scp040x
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
label define scp041x
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
label define scp043x
   1                "1 $20,000 or more"
   2                "2 Less than $20,000"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp044x
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
label define scp045x
   1                "1 Northeast"
   2                "2 Midwest"
   3                "3 South"
   4                "4 West"
;
label define scp050x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp051x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp052x
   0500             "0500 500 grams or less"
   5485             "5485 5485+ grams"
   9997             "9997 Refused"
   9998             "9998 Not ascertained"
   9999             "9999 Don't know"
;
label define scp053x
   1                "1 Yes"
   2                "2 No"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp058x
   1                "1 Mentioned"
   2                "2 Not mentioned"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp068x
   1                "1 Yes"
   2                "2 No"
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
label define scp077x
   1                "1 Yes"
   2                "2 No"
   3                "3 Was told no changes needed"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp096x
   1                "1 Better"
   2                "2 Worse"
   3                "3 About the same"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp097x
   000              "000 None"
   996              "996 Did not go to school"
   997              "997 Refused"
   998              "998 Not ascertained"
   999              "999 Don't know"
;
label define scp101x
   1                "1 Always"
   2                "2 Most of the time"
   3                "3 Some of the time"
   4                "4 None of the time"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp102x
   1                "1 Good"
   2                "2 Little trouble"
   3                "3 Lot of trouble"
   4                "4 Deaf"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp106x
   1                "1 In the last 12 months"
   2                "2 In the last 13-24 months"
   3                "3 Over 24 months"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp107x
   1                "1 Yes"
   2                "2 No"
   3                "3 Child does not go to school/Home schooled"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp115x
   0                "0 Not True"
   1                "1 Sometimes True"
   2                "2 Often True"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp117x
   1                "1 Not True"
   2                "2 Somewhat True"
   3                "3 Certainly True"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp122x
   1                "1 No"
   2                "2 Yes, minor difficulties"
   3                "3 Yes, definite difficulties"
   4                "4 Yes, severe difficulties"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp123x
   99               "99 Unknown"
;
label define scp125x
   1                "1 Yes"
   2                "2 There is NO place"
   3                "3 There is MORE THAN ONE place"
   7                "7 Refused"
   8                "8 Not ascertained"
   9                "9 Don't know"
;
label define scp126x
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
label define scp128x
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
label define scp129x
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
label define scp142x
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
label define scp159x
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
label define scp161x
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp162x
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
label define scp165x
   95               "95 95+ times"
   97               "97 Refused"
   98               "98 Not ascertained"
   99               "99 Don't know"
;
label define scp166x
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

* ASSOCIATE VARIABLES WITH LABEL DEFINITIONS;

label values rectype   scp001x;   label values srvy_yr   scp002x;
label values csreltiv  scp007x;   label values intv_qrt  scp008x;
label values sex       scp009x;   label values age_p     scp010x;
label values r_age1    scp011x;   label values r_age2    scp012x;
label values origin_i  scp013x;   label values origimpt  scp014x;
label values hispan_i  scp015x;   label values hispimpt  scp016x;
label values rcdt1p_i  scp017x;   label values rc_smp_i  scp018x;
label values racerp_i  scp019x;   label values raceimpt  scp020x;
label values mracrp_i  scp021x;   label values mracbp_i  scp022x;
label values racrec_i  scp023x;   label values hiscod_i  scp024x;
label values erimpflg  scp025x;   label values rrp       scp026x;
label values frrp      scp028x;   label values mom_deg   scp031x;
label values dad_deg   scp031x;   label values parents   scp034x;
label values fm_type   scp037x;   label values educ      scp040x;
label values mom_ed    scp041x;   label values dad_ed    scp041x;
label values ab_bl20k  scp043x;   label values rat_cat   scp044x;
label values region    scp045x;

label values bwgtlb    scp050x;   label values bwgtoz    scp051x;
label values bwgtmgr   scp052x;   label values amr1      scp053x;
label values aodd1     scp053x;   label values add2      scp053x;
label values amr2      scp053x;   label values aodd2     scp053x;
label values condl1    scp058x;   label values condl2    scp058x;
label values condl3    scp058x;   label values condl4    scp058x;
label values condl5    scp058x;   label values condl6    scp058x;
label values condl7    scp058x;   label values condl8    scp058x;
label values condl9    scp058x;   label values condl10   scp058x;
label values cpox      scp068x;   label values cpox12mo  scp053x;
label values cashmev   scp068x;   label values casstill  scp053x;
label values cashyr    scp053x;   label values casmeryr  scp053x;
label values cwzmswk   scp074x;   label values casmed    scp053x;
label values caswmp    scp053x;   label values capenvln  scp077x;
label values hayf1     scp053x;   label values rallg1    scp053x;
label values dallg1    scp053x;   label values sallg1    scp053x;
label values diarh1    scp053x;   label values anemia1   scp053x;
label values earinf1   scp053x;   label values seize1    scp053x;
label values hayf2     scp053x;   label values rallg2    scp053x;
label values dallg2    scp053x;   label values sallg2    scp053x;
label values diarh2    scp053x;   label values anemia2   scp053x;
label values fhead     scp053x;   label values earinf2   scp053x;
label values seize2    scp053x;   label values stutter   scp053x;
label values chstatyr  scp096x;   label values schdayr1  scp097x;
label values ccold2w   scp068x;   label values cintil2w  scp068x;
label values chaid     scp068x;   label values chfreq    scp101x;
label values chearst   scp102x;   label values cvision   scp068x;
label values cblind    scp053x;   label values cvistst   scp053x;
label values cvislt    scp106x;   label values cvisrd    scp107x;
label values cvisact   scp053x;   label values cvisprot  scp101x;
label values ihspeq    scp068x;   label values ihmob     scp068x;
label values ihmobyr   scp053x;   label values probrx    scp068x;
label values learnd    scp053x;   label values cmhagm15  scp115x;
label values cmhagf15  scp115x;   label values cmhmf12   scp117x;
label values cmhmf13   scp117x;   label values cmhmf14   scp117x;
label values cmhmf15   scp117x;   label values cmhmf16   scp117x;
label values cmhdiff   scp122x;   label values mhiboy2   scp123x;
label values mhigrl2   scp123x;

label values cusualpl  scp125x;   label values cplkind   scp126x;
label values chcplrou  scp053x;   label values chcplknd  scp128x;
label values sourcelc  scp129x;   label values chcchgyr  scp053x;
label values chcchghi  scp053x;   label values chcdlyr1  scp068x;
label values chcdlyr2  scp068x;   label values chcdlyr3  scp068x;
label values chcdlyr4  scp068x;   label values chcdlyr5  scp068x;
label values chcafyr   scp053x;   label values chcafyr1  scp053x;
label values chcafyr2  scp053x;   label values chcafyr3  scp053x;
label values chcafyr4  scp053x;   label values cdnlongr  scp142x;
label values chcsyr11  scp053x;   label values chcsyr12  scp053x;
label values chcsyr13  scp053x;   label values chcsyr14  scp053x;
label values chcsyr1   scp053x;   label values chcsyr2   scp053x;
label values chcsyr3   scp053x;   label values chcsyr4   scp053x;
label values chcsyr5   scp053x;   label values chcsyr6   scp053x;
label values chcsyr7   scp053x;   label values chcsyr81  scp068x;
label values chcsyr82  scp068x;   label values chcsyr10  scp053x;
label values chcsyrem  scp053x;   label values chpxyr_c  scp068x;
label values chernoy2  scp159x;   label values chchyr    scp068x;
label values chchmoyr  scp161x;   label values chchnoy2  scp162x;
label values chcnoyr2  scp159x;   label values csrgyr    scp068x;
label values csrgnoyr  scp165x;   label values cmdlongr  scp166x;
label values facct1    scp068x;   label values facct1_a  scp053x;
label values facct1_b  scp053x;   label values facct2    scp068x;
label values facct2_a  scp053x;   label values facct2_b  scp053x;
label values facct3    scp068x;   label values facct3_a  scp053x;
label values facct3_b  scp053x;   label values facct4    scp068x;
label values facct4_a  scp053x;   label values facct4_b  scp053x;
label values facct5    scp068x;   label values facct5_a  scp053x;

* DISPLAY OVERALL DESCRIPTION OF FILE;

describe;

* DISPLAY A TEST TABLE FROM THE FILE;

tabulate educ [fweight=wtfa_sc];
save $OUT/samchild, replace;

#delimit cr
* data file is stored in samchild.dta

* log  file is stored in samchild.log

log close
