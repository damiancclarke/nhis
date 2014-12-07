clear all

log using $LOG/samchild.log, text replace
set mem 1000m
set more off

/*
This is an improved version of the Stata do file provided by the NBER at
http://www.nber.org/data/national-health-interview-survey-programs.html
Changes made include replacing semicolons within labels with commas,
correcting erroneous quotation marks, and fixing the variables "father" and "mother."
*/

/*------------------------------------------------
  This program reads the 2000 National Health Interview Survey 2000 samchild  Data File
  by Jean Roth Mon Jul  2 15:42:28 EDT 2007
  Please report errors to jroth@nber.org 
  NOTE:  This program is distributed under the GNU GPL.
  See end of this file and http://www.gnu.org/licenses/ for details.
  Run with do nhis1997_samchild
----------------------------------------------- */

/* The following line should contain
   the complete path and name of the raw data file.
   On a PC, use backslashes in paths as in C:\  */

local dat_name "$DAT/2000/samchild.dat"

/* The following line should contain the path to your output '.dta' file */

local dta_name "$OUT/2000/samchild"

/* The following line should contain the path to the data dictionary file */

local dct_name "$COD/2000/nhis2000_samchild.dct"

infile using "`dct_name'", using("`dat_name'") clear


*Everything below this point are value labels

#delimit ;

;
destring mother father guard, replace
;
label values rectype  rectype;
label define rectype 
	40          "Sample Child (SC)"             
;
label values srvy_yr  srvy_yr;
label define srvy_yr 
	2000        "2000"                          
;
label values csreltiv csreltiv;
label define csreltiv
	01          "Parent (Biological, adoptive, or step)"
	02          "Grandparent"                   
	03          "Aunt/Uncle"                    
	04          "Brother/Sister"                
	05          "Other relative"                
	06          "Legal guardian"                
	07          "Foster parent"                 
	08          "Other non-relative"            
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values intv_qrt intv_qrt;
label define intv_qrt
	1           "Quarter 1"                     
	2           "Quarter 2"                     
	3           "Quarter 3"                     
	4           "Quarter 4"                     
;
label values sex      sex;    
label define sex     
	1           "Male"                          
	2           "Female"                        
;
label values age_p    age_p;  
label define age_p   
	00          "Under 1 year"                  
;
label values r_age1   r_age1l;
label define r_age1l 
	1           "Under 5 years"                 
	2           "5-17 years"                    
;
label values r_age2   r_age2l;
label define r_age2l 
	1           "Under 6 years"                 
	2           "6-16 years"                    
	3           "17 years"                      
;
label values origin_i origin_i;
label define origin_i
	1           "Yes"                           
	2           "No"                            
;
label values origimpt origimpt;
label define origimpt
	1           "Imputed 'refused' Hispanic Origin response"
	2           "Imputed 'not ascertained' Hispanic Origin"
	3           "Imputed 'does not know' Hispanic Origin"
	4           "Hispanic origin given by respondent/proxy"
;
label values hispan_i hispan_i;
label define hispan_i
	00          "Multiple Hispanic"             
	01          "Puerto Rican"                  
	02          "Mexican"                       
	03          "Mexican-American"              
	04          "Cuban/Cuban American"          
	05          "Dominican (Republic)"          
	06          "Central or South American"     
	07          "Other Latin American, type not specified"
	08          "Other Spanish"                 
	09          "Hispanic/Latino/Spanish, non-specific type"
	10          "Hispanic/Latino/Spanish, type refused"
	11          "Hispanic/Latino/Spanish, type not ascertained"
	12          "Not Hispanic/Spanish origin"   
;
label values hispimpt hispimpt;
label define hispimpt
	1           "Imputed 'refused' Hispanic Origin type"
	2           "Imputed 'not ascertained' Hispanic Origin type"
	3           "Imputed 'does not know' Hispanic Origin type"
	4           "Hispanic Origin type given by respondent/proxy"
;
label values rcdt1p_i rcdt1p_i;
label define rcdt1p_i
	01          "White only"                    
	02          "Black/African American only"   
	03          "AIAN only"                     
	09          "Asian Indian only"             
	10          "Chinese only"                  
	11          "Filipino only"                 
	15          "Other Asian only"              
	16          "Other race only"               
	17          "Multiple detailed race*"       
;
label values rc_smp_i rc_smp_i;
label define rc_smp_i
	01          "White only"                    
	02          "Black/African American only"   
	03          "AIAN only*"                    
	04          "Asian only"                    
	05          "Other race only"               
	06          "Multiple detailed race only"   
;
label values racerp_i racerp_i;
label define racerp_i
	01          "White only"                    
	02          "Black/African American only"   
	03          "AIAN* only"                    
	04          "Asian only"                    
	05          "Other race only"               
	06          "Multiple race"                 
;
label values raceimpt raceimpt;
label define raceimpt
	1           "Imputed 'refused' race response"
	2           "Imputed 'not ascertained' race response"
	3           "Imputed 'does not know' race response"
	4           "Race given by respondent/proxy"
;
label values mracrp_i mracrp_i;
label define mracrp_i
	01          "White"                         
	02          "Black/African American"        
	03          "Indian (American), Alaska Native"
	09          "Asian Indian"                  
	10          "Chinese"                       
	11          "Filipino"                      
	15          "Other Asian*"                  
	16          "Other Race*"                   
	17          "Multiple Race*"                
;
label values mracbp_i mracbp_i;
label define mracbp_i
	01          "White"                         
	02          "Black/African American"        
	03          "Indian (American) (includes Eskimo, Aleut)"
	06          "Chinese"                       
	07          "Filipino"                      
	12          "Asian Indian"                  
	16          "Other race"                    
	17          "Multiple race"                 
;
label values racrec_i racrec_i;
label define racrec_i
	1           "White"                         
	2           "Black"                         
	3           "Other"                         
;
label values hiscod_i hiscod_i;
label define hiscod_i
	1           "Hispanic"                      
	2           "Non-Hispanic White"            
	3           "Non-Hispanic Black"            
	4           "Non-Hispanic Other"            
;
label values erimpflg erimpflg;
label define erimpflg
	1           "Ethnicity/race imputed"        
	2           "Ethnicity/race given by respondent/proxy"
;
label values rrp      rrp;    
label define rrp     
	01          "Household reference person"    
	02          "Spouse (husband/wife)"         
	03          "Unmarried Partner"             
	04          "Child (biological/adoptive/in-law/step/foster)"
	05          "Child of partner"              
	06          "Grandchild"                    
	07          "Parent (bio./adoptive/in-law/step/foster)"
	08          "Brother/sister (bio./adop./in-law/step/foster)"
	09          "Grandparent (Grandmother/Grandfather)"
	10          "Aunt/Uncle"                    
	11          "Niece/Nephew"                  
	12          "Other relative"                
	13          "Housemate/roommate"            
	14          "Roomer/Boarder"                
	15          "Other nonrelative"             
	16          "Legal guardian"                
	17          "Ward"                          
	97          "Refused"                       
	99          "Don't know"                    
;
label values frrp     frrp;   
label define frrp    
	01          "Family reference person"       
	02          "Spouse (husband/wife)"         
	03          "Unmarried Partner"             
	04          "Child (biological/adoptive/in-law/step/foster)"
	05          "Child of partner"              
	06          "Grandchild"                    
	07          "Parent (bio./adoptive/in-law/step/foster)"
	08          "Brother/sister (bio./adop./in-law/step/foster)"
	09          "Grandparent (Grandmother/Grandfather)"
	10          "Aunt/Uncle"                    
	11          "Niece/Nephew"                  
	12          "Other relative"                
	16          "Legal guardian"                
	17          "Ward"                          
	97          "Refused"                       
	99          "Don't know"
;
label values mother mother;
label define mother
	00			"No mother in household"
	96        "Has legal guardian"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't know"                    
;
label values mom_deg  mom_deg;
label define mom_deg 
	1           "Biological"                    
	2           "Step"                          
	3           "Adoptive"                      
	4           "Foster"                        
	5           "In-law"                        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"
;
label values father father;
label define father
	00			"No father in household"
	96        "Has legal guardian"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't know"                    
;
label values dad_deg  dad_deg;
label define dad_deg 
	1           "Biological"                    
	2           "Step"                          
	3           "Adoptive"                      
	4           "Foster"                        
	5           "In-law"                        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values parents  parents;
label define parents 
	1           "Mother, no father"             
	2           "Father, no mother"             
	3           "Mother and father"             
	4           "Neither mother nor father"     
	9           "Unknown"
;
label values guard guard;
label define guard
	00			"Guardian is not a household member"
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't know"                    
;
label values fm_type  fm_type;
label define fm_type 
	1           "One adult, no child(ren) under 18"
	2           "Multiple adults, no child(ren) under 18"
	3           "One adult, 1+ child(ren) under 18"
	4           "Multiple adults, 1+ child(ren) under 18"
	9           "Unknown"                       
;
label values educ     educ;   
label define educ    
	00          "Never attended/ kindergarten only"
	12          "12th grade, no diploma"        
	13          "HIGH SCHOOL GRADUATE"          
	14          "GED or equivalent"             
	15          "Some college, no degree"       
	16          "AA degree: technical or vocational"
	17          "AA degree: academic program"   
	18          "Bachelor's degree (BA, AB, BS, BBA)"
	19          "Master's degree (MA, MS, MEng, MEd, MBA)"
	20          "Professional degree (MD, DDS, DVM, JD)"
	21          "Doctoral degree (PhD, EdD)"    
	96          "Child under 5 years old"       
	97          "Refused"                       
	98          "Not Ascertained"               
	99          "Don't know"                    
;
label values mom_ed   mom_ed; 
label define mom_ed  
	01          "Less/equal to 8th grade"       
	02          "9-12th grade, no high school diploma"
	03          "High school graduate/GED recipient"
	04          "Some college, no degree"       
	05          "AA degree, technical or vocational"
	06          "AA degree, academic program"   
	07          "Bachelor's degree"             
	08          "Master's, professional, or doctoral degree"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values dad_ed   dad_ed; 
label define dad_ed  
	01          "Less/equal to 8th grade"       
	02          "9-12th grade, no high school diploma"
	03          "High school graduate/GED recipient"
	04          "Some college, no degree"       
	05          "AA degree, technical or vocational"
	06          "AA degree, academic program"   
	07          "Bachelor's degree"             
	08          "Master's, professional, or doctoral degree"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values ab_bl20k ab_bl20k;
label define ab_bl20k
	1           "$20,000 or more"               
	2           "Less than $20,000"             
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rat_cat  rat_cat;
label define rat_cat 
	01          "Under .50"                     
	02          ".50 to .74"                    
	03          ".75 to .99"                    
	04          "1.00 to 1.24"                  
	05          "1.25 to 1.49"                  
	06          "1.50 to 1.74"                  
	07          "1.75 to 1.99"                  
	08          "2.00 to 2.49"                  
	09          "2.50 to 2.99"                  
	10          "3.00 to 3.49"                  
	11          "3.50 to 3.99"                  
	12          "4.00 to 4.49"                  
	13          "4.50 to 4.99"                  
	14          "5.00 and over"                 
	96          "Undefinable"                   
	99          "Unknown"                       
;
label values region   region; 
label define region  
	1           "Northeast"                     
	2           "Midwest"                       
	3           "South"                         
	4           "West"                          
;
label values msasizep msasizep;
label define msasizep
	1           "5,000,000 or more"             
	2           "2,500,000 - 4,999,999"         
	3           "1,000,000 - 2,499,999"         
	4           "500,000 - 999,999"             
	5           "250,000 - 499,999"             
	6           "Under 250,000"                 
	7           "Non-MSA"                       
;
label values bwgtlb   bwgtlb; 
label define bwgtlb  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values bwgtoz   bwgtoz; 
label define bwgtoz  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values bwgtmgr  bwgtmgr;
label define bwgtmgr 
	0500        "500 grams or less"             
	5485        "5485+ grams"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values amr1     amr1l;  
label define amr1l   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aodd1    aodd1l; 
label define aodd1l  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values add2     add2l;  
label define add2l   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values amr2     amr2l;  
label define amr2l   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aodd2    aodd2l; 
label define aodd2l  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values condl1   condl1l;
label define condl1l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values condl2   condl2l;
label define condl2l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values condl3   condl3l;
label define condl3l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values condl4   condl4l;
label define condl4l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values condl5   condl5l;
label define condl5l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values condl6   condl6l;
label define condl6l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values condl7   condl7l;
label define condl7l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values condl8   condl8l;
label define condl8l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values condl9   condl9l;
label define condl9l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values condl10  condl10l;
label define condl10l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cpox     cpox;   
label define cpox    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cpox12mo cpox12mo;
label define cpox12mo
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cashmev  cashmev;
label define cashmev 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cashyr   cashyr; 
label define cashyr  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values casmeryr casmeryr;
label define casmeryr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hayf1    hayf1l; 
label define hayf1l  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rallg1   rallg1l;
label define rallg1l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values dallg1   dallg1l;
label define dallg1l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sallg1   sallg1l;
label define sallg1l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values diarh1   diarh1l;
label define diarh1l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values anemia1  anemia1l;
label define anemia1l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values earinf1  earinf1l;
label define earinf1l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values seize1   seize1l;
label define seize1l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hayf2    hayf2l; 
label define hayf2l  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rallg2   rallg2l;
label define rallg2l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values dallg2   dallg2l;
label define dallg2l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sallg2   sallg2l;
label define sallg2l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values diarh2   diarh2l;
label define diarh2l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values anemia2  anemia2l;
label define anemia2l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhead    fhead;  
label define fhead   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values earinf2  earinf2l;
label define earinf2l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values seize2   seize2l;
label define seize2l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values stutter  stutter;
label define stutter 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chstatyr chstatyr;
label define chstatyr
	1           "Better"                        
	2           "Worse"                         
	3           "About the same"                
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values schdayr1 schdayra;
label define schdayra
	000         "None"                          
	996         "Did not go to school"          
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values ccold2w  ccold2w;
label define ccold2w 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cintil2w cintil2w;
label define cintil2w
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chearst  chearst;
label define chearst 
	1           "Good"                          
	2           "Little trouble"                
	3           "Lot of trouble"                
	4           "Deaf"                          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cvision  cvision;
label define cvision 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cblind   cblind; 
label define cblind  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ihspeq   ihspeq; 
label define ihspeq  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ihmob    ihmob;  
label define ihmob   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ihmobyr  ihmobyr;
label define ihmobyr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values probrx   probrx; 
label define probrx  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values learnd   learnd; 
label define learnd  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cmhagm15 cmhagm1e;
label define cmhagm1e
	0           "Not True"                      
	1           "Sometimes True"                
	2           "Often True"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cmhagf15 cmhagf1e;
label define cmhagf1e
	0           "Not True"                      
	1           "Sometimes True"                
	2           "Often True"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cmhagm25 cmhagm2e;
label define cmhagm2e
	0           "Not True"                      
	1           "Sometimes True"                
	2           "Often True"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cmhagf25 cmhagf2e;
label define cmhagf2e
	0           "Not True"                      
	1           "Sometimes True"                
	2           "Often True"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cmhagm35 cmhagm3e;
label define cmhagm3e
	0           "Not True"                      
	1           "Sometimes True"                
	2           "Often True"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cmhagf35 cmhagf3e;
label define cmhagf3e
	0           "Not True"                      
	1           "Sometimes True"                
	2           "Often True"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhiboy2  mhiboy2l;
label define mhiboy2l
	99          "Unknown"                       
;
label values mhigrl2  mhigrl2l;
label define mhigrl2l
	99          "Unknown"                       
;
label values mhiboy4  mhiboy4l;
label define mhiboy4l
	99          "Unknown"                       
;
label values mhigrl4  mhigrl4l;
label define mhigrl4l
	99          "Unknown"                       
;
label values mhiboy12 mhiboy1b;
label define mhiboy1b
	99          "Unknown"                       
;
label values mhigrl12 mhigrl1b;
label define mhigrl1b
	99          "Unknown"                       
;
label values cusualpl cusualpl;
label define cusualpl
	1           "Yes"                           
	2           "There is NO place"             
	3           "There is MORE THAN ONE place"  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cplkind  cplkind;
label define cplkind 
	1           "Clinic or health center"       
	2           "Doctor's office or HMO"        
	3           "Hospital emergency room"       
	4           "Hospital outpatient department"
	5           "Some other place"              
	6           "Doesn't go to one place most often"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcplrou chcplrou;
label define chcplrou
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcplknd chcplknd;
label define chcplknd
	0           "Doesn't get preventive care anywhere"
	1           "Clinic or health center"       
	2           "Doctor's office of HMO"        
	3           "Hospital emergency room"       
	4           "Hospital outpatient department"
	5           "Some other place"              
	6           "Doesn't go to one place most often"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sourcelc sourcelc;
label define sourcelc
	01          "Same sorc sk care & rout care" 
	02          "Sorc sk care, no sorc rout care"
	03          "Sorc sk & rout care, no/unk same sorc"
	04          "Sorc sk care, unk sorc rout care"
	05          "GE 2 sorc sk care, 1 is sorc rout care"
	06          "GE 2 sorc sk care, no sorc rout care"
	07          "GE 2 sorc sk & rout care, no/unk if same"
	08          "GE 2 sorc sk care, unk sorc rout care"
	09          "No sorc sk care or rout care"  
	10          "No sorc sk care, has sorc rout care"
	11          "No sorc sk care, unk sorc rout care"
	12          "Unk sorc sk care, no sorc rout care"
	13          "Unk sorc sk care, has sorc rout care"
	14          "Unk sorc sk care or sorc rout care"
	99          "Unknown other"                 
;
label values chcchgyr chcchgyr;
label define chcchgyr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcchghi chcchghi;
label define chcchghi
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcdlyr1 chcdlyra;
label define chcdlyra
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcdlyr2 chcdlyrb;
label define chcdlyrb
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcdlyr3 chcdlyrc;
label define chcdlyrc
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcdlyr4 chcdlyrd;
label define chcdlyrd
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcdlyr5 chcdlyre;
label define chcdlyre
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcafyr  chcafyr;
label define chcafyr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcafyr1 chcafyra;
label define chcafyra
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcafyr2 chcafyrb;
label define chcafyrb
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcafyr3 chcafyrc;
label define chcafyrc
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcafyr4 chcafyrd;
label define chcafyrd
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cdnlongr cdnlongr;
label define cdnlongr
	0           "Never"                         
	1           "6 Months or less"              
	2           "More than 6 months but not more than 1 year ago"
	3           "More than 1 year, but not more than 2 years ago"
	4           "More than 2 yrs, but not more than 5 years ago"
	5           "More than 5 years ago"         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr11 chcsyr1a;
label define chcsyr1a
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr12 chcsyr1b;
label define chcsyr1b
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr13 chcsyr1c;
label define chcsyr1c
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr14 chcsyr1d;
label define chcsyr1d
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr1  chcsyr1l;
label define chcsyr1l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr2  chcsyr2l;
label define chcsyr2l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr3  chcsyr3l;
label define chcsyr3l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr4  chcsyr4l;
label define chcsyr4l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr5  chcsyr5l;
label define chcsyr5l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr6  chcsyr6l;
label define chcsyr6l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr7  chcsyr7l;
label define chcsyr7l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr81 chcsyr8a;
label define chcsyr8a
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr82 chcsyr8b;
label define chcsyr8b
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chcsyr10 chcsyr1j;
label define chcsyr1j
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chpxyr_c chpxyr_c;
label define chpxyr_c
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chernoy2 chernoyb;
label define chernoyb
	00          "None"                          
	01          "1"                             
	02          "2-3"                           
	03          "4-5"                           
	04          "6-7"                           
	05          "8-9"                           
	06          "10-12"                         
	07          "13-15"                         
	08          "16 or more"                    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values chchyr   chchyr; 
label define chchyr  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chchmoyr chchmoyr;
label define chchmoyr
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values chchnoy2 chchnoyb;
label define chchnoyb
	01          "1"                             
	02          "2-3"                           
	03          "4-5"                           
	04          "6-7"                           
	05          "8-9"                           
	06          "10-12"                         
	07          "13-15"                         
	08          "16 or more"                    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values chcnoyr2 chcnoyrb;
label define chcnoyrb
	00          "None"                          
	01          "1"                             
	02          "2-3"                           
	03          "4-5"                           
	04          "6-7"                           
	05          "8-9"                           
	06          "10-12"                         
	07          "13-15"                         
	08          "16 or more"                    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values csrgyr   csrgyr; 
label define csrgyr  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csrgnoyr csrgnoyr;
label define csrgnoyr
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values cmdlongr cmdlongr;
label define cmdlongr
	0           "Never"                         
	1           "6 months or less"              
	2           "More than 6 months, but not more than 1 year ag"
	3           "More than 1 year, but not more than 2 years ago"
	4           "More than 2 years, but not more than 5 years ag"
	5           "More than 5 years ago"         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
#delimit cr
save `dta_name', replace

/*
Copyright 2007 shared by the National Bureau of Economic Research and Jean Roth

National Bureau of Economic Research.
1050 Massachusetts Avenue
Cambridge, MA 02138
jroth@nber.org

This program and all programs referenced in it are free software. You
can redistribute the program or modify it under the terms of the GNU
General Public License as published by the Free Software Foundation;
either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
USA.
*/

log close
