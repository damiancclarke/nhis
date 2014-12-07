clear all

global DAT "~/database/NHIS/Data/raw/2000"
global OUT "~/database/NHIS/Data/dta/2000"
global LOG "~/database/NHIS/Log"
global COD "~/database/NHIS/Source/2000"

log using "$LOG/samadult.log", replace
set mem 1000m

/*------------------------------------------------
  This program reads the 2000 National Health Interview Survey 2000 samadult  Data File
  by Jean Roth Mon Jul  2 15:44:01 EDT 2007
  Please report errors to jroth@nber.org 
  NOTE:  This program is distributed under the GNU GPL.
  See end of this file and http://www.gnu.org/licenses/ for details.
  Run with do nhis2000_samadult
----------------------------------------------- */

/* The following line should contain
   the complete path and name of the raw data file.
   On a PC, use backslashes in paths as in C:\  */

local dat_name "~/database/NHIS/Data/raw/2000/samadult.dat"

/* The following line should contain the path to your output '.dta' file */

local dta_name "~/database/NHIS/Data/dta/2000/samadult"

/* The following line should contain the path to the data dictionary file */

local dct_name "$COD/nhis2000_samadult.dct"

infile using "`dct_name'", using("`dat_name'") clear


*Everything below this point are value labels

#delimit ;

;
label values rectype  rectype;
label define rectype 
	30          "Sample Adult"                  
;
label values srvy_yr  srvy_yr;
label define srvy_yr 
	2000        "2000"                          
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
	85          "85+ years"                     
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
label values r_maritl r_maritl;
label define r_maritl
	0           "Under 14 years"                
	1           "Married - spouse in household" 
	2           "Married - spouse not in household"
	3           "Married - spouse in household unknown"
	4           "Widowed"                       
	5           "Divorced"                      
	6           "Separated"                     
	7           "Never married"                 
	8           "Living with partner"           
	9           "Unknown marital status"        
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
label values dummy_ca dummy_ca;
label define dummy_ca
	1           "Dummy record"                  
	0           "Not a dummy record"            
;
label values hypev    hypev;  
label define hypev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hypdifv  hypdifv;
label define hypdifv 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chdev    chdev;  
label define chdev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values angev    angev;  
label define angev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values miev     miev;   
label define miev    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hrtev    hrtev;  
label define hrtev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values strev    strev;  
label define strev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ephev    ephev;  
label define ephev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aasmev   aasmev; 
label define aasmev  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aasmyr   aasmyr; 
label define aasmyr  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aasmeryr aasmeryr;
label define aasmeryr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ulcev    ulcev;  
label define ulcev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ulcyr    ulcyr;  
label define ulcyr   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canev    canev;  
label define canev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind1  cnkind1l;
label define cnkind1l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage1  canage1l;
label define canage1l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind2  cnkind2l;
label define cnkind2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage2  canage2l;
label define canage2l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind3  cnkind3l;
label define cnkind3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage3  canage3l;
label define canage3l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind4  cnkind4l;
label define cnkind4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage4  canage4l;
label define canage4l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind5  cnkind5l;
label define cnkind5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage5  canage5l;
label define canage5l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind6  cnkind6l;
label define cnkind6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage6  canage6l;
label define canage6l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind7  cnkind7l;
label define cnkind7l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage7  canage7l;
label define canage7l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind8  cnkind8l;
label define cnkind8l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage8  canage8l;
label define canage8l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind9  cnkind9l;
label define cnkind9l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage9  canage9l;
label define canage9l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind10 cnkind1j;
label define cnkind1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage10 canage1j;
label define canage1j
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind11 cnkind1a;
label define cnkind1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage11 canage1a;
label define canage1a
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind12 cnkind1b;
label define cnkind1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage12 canage1b;
label define canage1b
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind13 cnkind1c;
label define cnkind1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage13 canage1c;
label define canage1c
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind14 cnkind1d;
label define cnkind1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage14 canage1d;
label define canage1d
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind15 cnkind1e;
label define cnkind1e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage15 canage1e;
label define canage1e
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind16 cnkind1f;
label define cnkind1f
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage16 canage1f;
label define canage1f
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind17 cnkind1g;
label define cnkind1g
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage17 canage1g;
label define canage1g
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind18 cnkind1h;
label define cnkind1h
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage18 canage1h;
label define canage1h
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind19 cnkind1i;
label define cnkind1i
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage19 canage1i;
label define canage1i
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind20 cnkind2j;
label define cnkind2j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage20 canage2j;
label define canage2j
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind21 cnkind2a;
label define cnkind2a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage21 canage2a;
label define canage2a
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind22 cnkind2b;
label define cnkind2b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage22 canage2b;
label define canage2b
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind23 cnkind2c;
label define cnkind2c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage23 canage2c;
label define canage2c
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind24 cnkind2d;
label define cnkind2d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage24 canage2d;
label define canage2d
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind25 cnkind2e;
label define cnkind2e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage25 canage2e;
label define canage2e
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind26 cnkind2f;
label define cnkind2f
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage26 canage2f;
label define canage2f
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind27 cnkind2g;
label define cnkind2g
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage27 canage2g;
label define canage2g
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind28 cnkind2h;
label define cnkind2h
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage28 canage2h;
label define canage2h
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind29 cnkind2i;
label define cnkind2i
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage29 canage2i;
label define canage2i
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind30 cnkind3j;
label define cnkind3j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values canage30 canage3j;
label define canage3j
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cnkind31 cnkind3a;
label define cnkind3a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values dibev    dibev;  
label define dibev   
	1           "Yes"                           
	2           "No"                            
	3           "Borderline"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values dibage   dibage; 
label define dibage  
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values difage2  difage2l;
label define difage2l
	00          "Within past year"              
	85          "85+ years"                     
	96          "1+ year(s) with diabetes and age is 85+"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values insln    insln;  
label define insln   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values dibpill  dibpill;
label define dibpill 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahayfyr  ahayfyr;
label define ahayfyr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sinyr    sinyr;  
label define sinyr   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cbrchyr  cbrchyr;
label define cbrchyr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values kidwkyr  kidwkyr;
label define kidwkyr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values livyr    livyr;  
label define livyr   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr    jntyr;  
label define jntyr   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntmo    jntmo;  
label define jntmo   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntij    jntij;  
label define jntij   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntijln  jntijln;
label define jntijln 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values jntijlt  jntijlt;
label define jntijlt 
	1           "Week(s)"                       
	2           "Month(s)"                      
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntijlm  jntijlm;
label define jntijlm 
	00          "Less than 1 month"             
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values jntyr1   jntyr1l;
label define jntyr1l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr2   jntyr2l;
label define jntyr2l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr3   jntyr3l;
label define jntyr3l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr4   jntyr4l;
label define jntyr4l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr5   jntyr5l;
label define jntyr5l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr6   jntyr6l;
label define jntyr6l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr7   jntyr7l;
label define jntyr7l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr8   jntyr8l;
label define jntyr8l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr9   jntyr9l;
label define jntyr9l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr10  jntyr10l;
label define jntyr10l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr11  jntyr11l;
label define jntyr11l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr12  jntyr12l;
label define jntyr12l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr13  jntyr13l;
label define jntyr13l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr14  jntyr14l;
label define jntyr14l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr15  jntyr15l;
label define jntyr15l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr16  jntyr16l;
label define jntyr16l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jntyr17  jntyr17l;
label define jntyr17l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values paineck  paineck;
label define paineck 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values painlb   painlb; 
label define painlb  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values painleg  painleg;
label define painleg 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values painface painface;
label define painface
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values amigr    amigr;  
label define amigr   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values acold2w  acold2w;
label define acold2w 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aintil2w aintil2w;
label define aintil2w
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pregnow  pregnow;
label define pregnow 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hearaid  hearaid;
label define hearaid 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahearst  ahearst;
label define ahearst 
	1           "Good"                          
	2           "Little trouble"                
	3           "Lot of trouble"                
	4           "Deaf"                          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values avision  avision;
label define avision 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ablind   ablind; 
label define ablind  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lupprt   lupprt; 
label define lupprt  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sad      sad;    
label define sad     
	1           "ALL of the time"               
	2           "MOST of the time"              
	3           "SOME of the time"              
	4           "A LITTLE of the time"          
	5           "NONE of the time"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values nervous  nervous;
label define nervous 
	1           "ALL of the time"               
	2           "MOST of the time"              
	3           "SOME of the time"              
	4           "A LITTLE of the time"          
	5           "NONE of the time"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values restless restless;
label define restless
	1           "ALL of the time"               
	2           "MOST of the time"              
	3           "SOME of the time"              
	4           "A LITTLE of the time"          
	5           "NONE of the time"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hopeless hopeless;
label define hopeless
	1           "ALL of the time"               
	2           "MOST of the time"              
	3           "SOME of the time"              
	4           "A LITTLE of the time"          
	5           "NONE of the time"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values effort   effort; 
label define effort  
	1           "ALL of the time"               
	2           "MOST of the time"              
	3           "SOME of the time"              
	4           "A LITTLE of the time"          
	5           "NONE of the time"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values worthls  worthls;
label define worthls 
	1           "ALL of the time"               
	2           "MOST of the time"              
	3           "SOME of the time"              
	4           "A LITTLE of the time"          
	5           "NONE of the time"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhamtmo  mhamtmo;
label define mhamtmo 
	1           "A lot"                         
	2           "Some"                          
	3           "A little"                      
	4           "Not at all"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values wrklyr2  wrklyr2l;
label define wrklyr2l
	0           "Had job last week"             
	1           "No job last week, had job past 12 m"
	2           "No job last week, no job past 12 m"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values wkdayr   wkdayr; 
label define wkdayr  
	000         "None"                          
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values beddayr  beddayr;
label define beddayr 
	000         "None"                          
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values ahstatyr ahstatyr;
label define ahstatyr
	1           "Better"                        
	2           "Worse"                         
	3           "About the same"                
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values speceq   speceq; 
label define speceq  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flwalk   flwalk; 
label define flwalk  
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flclimb  flclimb;
label define flclimb 
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flstand  flstand;
label define flstand 
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flsit    flsit;  
label define flsit   
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flstoop  flstoop;
label define flstoop 
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flreach  flreach;
label define flreach 
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flgrasp  flgrasp;
label define flgrasp 
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flcarry  flcarry;
label define flcarry 
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flpush   flpush; 
label define flpush  
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flshop   flshop; 
label define flshop  
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flsocl   flsocl; 
label define flsocl  
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flrelax  flrelax;
label define flrelax 
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	6           "Do not do this activity"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fla1ar   fla1ar; 
label define fla1ar  
	1           "Limited in any way"            
	2           "Not limited in any way"        
	3           "Unknown if limited"            
;
label values aflhca1  aflhca1l;
label define aflhca1l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln1  alhcln1l;
label define alhcln1l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt1  alhclt1l;
label define alhclt1l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly1  alhcly1l;
label define alhcly1l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr1  alantr1l;
label define alantr1l
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca2  aflhca2l;
label define aflhca2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln2  alhcln2l;
label define alhcln2l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt2  alhclt2l;
label define alhclt2l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly2  alhcly2l;
label define alhcly2l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr2  alantr2l;
label define alantr2l
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca3  aflhca3l;
label define aflhca3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln3  alhcln3l;
label define alhcln3l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt3  alhclt3l;
label define alhclt3l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly3  alhcly3l;
label define alhcly3l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr3  alantr3l;
label define alantr3l
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca4  aflhca4l;
label define aflhca4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln4  alhcln4l;
label define alhcln4l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt4  alhclt4l;
label define alhclt4l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly4  alhcly4l;
label define alhcly4l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr4  alantr4l;
label define alantr4l
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca5  aflhca5l;
label define aflhca5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln5  alhcln5l;
label define alhcln5l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt5  alhclt5l;
label define alhclt5l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly5  alhcly5l;
label define alhcly5l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr5  alantr5l;
label define alantr5l
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca6  aflhca6l;
label define aflhca6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln6  alhcln6l;
label define alhcln6l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt6  alhclt6l;
label define alhclt6l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly6  alhcly6l;
label define alhcly6l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr6  alantr6l;
label define alantr6l
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca7  aflhca7l;
label define aflhca7l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln7  alhcln7l;
label define alhcln7l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt7  alhclt7l;
label define alhclt7l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly7  alhcly7l;
label define alhcly7l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr7  alantr7l;
label define alantr7l
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca8  aflhca8l;
label define aflhca8l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln8  alhcln8l;
label define alhcln8l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt8  alhclt8l;
label define alhclt8l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly8  alhcly8l;
label define alhcly8l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr8  alantr8l;
label define alantr8l
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca9  aflhca9l;
label define aflhca9l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln9  alhcln9l;
label define alhcln9l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt9  alhclt9l;
label define alhclt9l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly9  alhcly9l;
label define alhcly9l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr9  alantr9l;
label define alantr9l
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca10 aflhca1j;
label define aflhca1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln10 alhcln1j;
label define alhcln1j
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt10 alhclt1j;
label define alhclt1j
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly10 alhcly1j;
label define alhcly1j
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr10 alantr1j;
label define alantr1j
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca11 aflhca1a;
label define aflhca1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln11 alhcln1a;
label define alhcln1a
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt11 alhclt1a;
label define alhclt1a
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly11 alhcly1a;
label define alhcly1a
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr11 alantr1a;
label define alantr1a
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca12 aflhca1b;
label define aflhca1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln12 alhcln1b;
label define alhcln1b
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt12 alhclt1b;
label define alhclt1b
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly12 alhcly1b;
label define alhcly1b
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr12 alantr1b;
label define alantr1b
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca13 aflhca1c;
label define aflhca1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln13 alhcln1c;
label define alhcln1c
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alhclt13 alhclt1c;
label define alhclt1c
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly13 alhcly1c;
label define alhcly1c
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr13 alantr1c;
label define alantr1c
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca14 aflhca1d;
label define aflhca1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln14 alhcln1d;
label define alhcln1d
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt14 alhclt1d;
label define alhclt1d
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly14 alhcly1d;
label define alhcly1d
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr14 alantr1d;
label define alantr1d
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca15 aflhca1e;
label define aflhca1e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln15 alhcln1e;
label define alhcln1e
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt15 alhclt1e;
label define alhclt1e
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly15 alhcly1e;
label define alhcly1e
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr15 alantr1e;
label define alantr1e
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca16 aflhca1f;
label define aflhca1f
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln16 alhcln1f;
label define alhcln1f
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt16 alhclt1f;
label define alhclt1f
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly16 alhcly1f;
label define alhcly1f
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr16 alantr1f;
label define alantr1f
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca17 aflhca1g;
label define aflhca1g
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln17 alhcln1g;
label define alhcln1g
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt17 alhclt1g;
label define alhclt1g
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly17 alhcly1g;
label define alhcly1g
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr17 alantr1g;
label define alantr1g
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca18 aflhca1h;
label define aflhca1h
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln18 alhcln1h;
label define alhcln1h
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt18 alhclt1h;
label define alhclt1h
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly18 alhcly1h;
label define alhcly1h
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr18 alantr1h;
label define alantr1h
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca19 aflhca1i;
label define aflhca1i
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln19 alhcln1i;
label define alhcln1i
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt19 alhclt1i;
label define alhclt1i
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly19 alhcly1i;
label define alhcly1i
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr19 alantr1i;
label define alantr1i
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca20 aflhca2j;
label define aflhca2j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln20 alhcln2j;
label define alhcln2j
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt20 alhclt2j;
label define alhclt2j
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly20 alhcly2j;
label define alhcly2j
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr20 alantr2j;
label define alantr2j
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca21 aflhca2a;
label define aflhca2a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln21 alhcln2a;
label define alhcln2a
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt21 alhclt2a;
label define alhclt2a
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly21 alhcly2a;
label define alhcly2a
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr21 alantr2a;
label define alantr2a
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca22 aflhca2b;
label define aflhca2b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln22 alhcln2b;
label define alhcln2b
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt22 alhclt2b;
label define alhclt2b
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly22 alhcly2b;
label define alhcly2b
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr22 alantr2b;
label define alantr2b
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca23 aflhca2c;
label define aflhca2c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln23 alhcln2c;
label define alhcln2c
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt23 alhclt2c;
label define alhclt2c
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly23 alhcly2c;
label define alhcly2c
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr23 alantr2c;
label define alantr2c
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca24 aflhca2d;
label define aflhca2d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln24 alhcln2d;
label define alhcln2d
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt24 alhclt2d;
label define alhclt2d
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly24 alhcly2d;
label define alhcly2d
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr24 alantr2d;
label define alantr2d
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca25 aflhca2e;
label define aflhca2e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln25 alhcln2e;
label define alhcln2e
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt25 alhclt2e;
label define alhclt2e
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly25 alhcly2e;
label define alhcly2e
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr25 alantr2e;
label define alantr2e
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca26 aflhca2f;
label define aflhca2f
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln26 alhcln2f;
label define alhcln2f
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt26 alhclt2f;
label define alhclt2f
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly26 alhcly2f;
label define alhcly2f
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr26 alantr2f;
label define alantr2f
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca27 aflhca2g;
label define aflhca2g
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln27 alhcln2g;
label define alhcln2g
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt27 alhclt2g;
label define alhclt2g
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly27 alhcly2g;
label define alhcly2g
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr27 alantr2g;
label define alantr2g
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca28 aflhca2h;
label define aflhca2h
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln28 alhcln2h;
label define alhcln2h
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt28 alhclt2h;
label define alhclt2h
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly28 alhcly2h;
label define alhcly2h
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr28 alantr2h;
label define alantr2h
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca29 aflhca2i;
label define aflhca2i
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln29 alhcln2i;
label define alhcln2i
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt29 alhclt2i;
label define alhclt2i
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly29 alhcly2i;
label define alhcly2i
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr29 alantr2i;
label define alantr2i
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca30 aflhca3j;
label define aflhca3j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln30 alhcln3j;
label define alhcln3j
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt30 alhclt3j;
label define alhclt3j
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly30 alhcly3j;
label define alhcly3j
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr30 alantr3j;
label define alantr3j
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca31 aflhca3a;
label define aflhca3a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln31 alhcln3a;
label define alhcln3a
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt31 alhclt3a;
label define alhclt3a
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly31 alhcly3a;
label define alhcly3a
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr31 alantr3a;
label define alantr3a
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca32 aflhca3b;
label define aflhca3b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln32 alhcln3b;
label define alhcln3b
	95          "95+"                           
	96          "Since birth **"                
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt32 alhclt3b;
label define alhclt3b
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth *"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly32 alhcly3b;
label define alhcly3b
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr32 alantr3b;
label define alantr3b
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca33 aflhca3c;
label define aflhca3c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln33 alhcln3c;
label define alhcln3c
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt33 alhclt3c;
label define alhclt3c
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly33 alhcly3c;
label define alhcly3c
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr33 alantr3c;
label define alantr3c
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca34 aflhca3d;
label define aflhca3d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln34 alhcln3d;
label define alhcln3d
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt34 alhclt3d;
label define alhclt3d
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly34 alhcly3d;
label define alhcly3d
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr34 alantr3d;
label define alantr3d
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca90 aflhca9j;
label define aflhca9j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln90 alhcln9j;
label define alhcln9j
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt90 alhclt9j;
label define alhclt9j
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly90 alhcly9j;
label define alhcly9j
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr90 alantr9j;
label define alantr9j
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values aflhca91 aflhca9a;
label define aflhca9a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcln91 alhcln9a;
label define alhcln9a
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values alhclt91 alhclt9a;
label define alhclt9a
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alhcly91 alhcly9a;
label define alhcly9a
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alantr91 alantr9a;
label define alantr9a
	01          "Less than 3 months"            
	02          "3 - 5 months"                  
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values alcndr1  alcndr1l;
label define alcndr1l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr2  alcndr2l;
label define alcndr2l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr3  alcndr3l;
label define alcndr3l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr4  alcndr4l;
label define alcndr4l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr5  alcndr5l;
label define alcndr5l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr6  alcndr6l;
label define alcndr6l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr7  alcndr7l;
label define alcndr7l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr8  alcndr8l;
label define alcndr8l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr9  alcndr9l;
label define alcndr9l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr10 alcndr1j;
label define alcndr1j
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr11 alcndr1a;
label define alcndr1a
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr12 alcndr1b;
label define alcndr1b
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr13 alcndr1c;
label define alcndr1c
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr14 alcndr1d;
label define alcndr1d
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr15 alcndr1e;
label define alcndr1e
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr16 alcndr1f;
label define alcndr1f
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr17 alcndr1g;
label define alcndr1g
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr18 alcndr1h;
label define alcndr1h
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr19 alcndr1i;
label define alcndr1i
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr20 alcndr2j;
label define alcndr2j
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr21 alcndr2a;
label define alcndr2a
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr22 alcndr2b;
label define alcndr2b
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr23 alcndr2c;
label define alcndr2c
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr24 alcndr2d;
label define alcndr2d
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr25 alcndr2e;
label define alcndr2e
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr26 alcndr2f;
label define alcndr2f
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr27 alcndr2g;
label define alcndr2g
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr28 alcndr2h;
label define alcndr2h
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr29 alcndr2i;
label define alcndr2i
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr30 alcndr3j;
label define alcndr3j
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr31 alcndr3a;
label define alcndr3a
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr32 alcndr3b;
label define alcndr3b
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr33 alcndr3c;
label define alcndr3c
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr34 alcndr3d;
label define alcndr3d
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr90 alcndr9j;
label define alcndr9j
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndr91 alcndr9a;
label define alcndr9a
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values alcndrt  alcndrt;
label define alcndrt 
	1           "At least one chronic cond causes functl lim"
	2           "No chronic condition causes functl lim"
	9           "Unknown if any chronic cond causes functl lim"
;
label values alchronr alchronr;
label define alchronr
	0           "Not limited in any way (incl unk if limited)"
	1           "Limited, caused by at least one chronic cond"
	2           "Limited, not caused by chronic cond"
	3           "Limited, unk if cond causing LA is chronic"
;
label values smkev    smkev;  
label define smkev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values smkreg   smkreg; 
label define smkreg  
	85          "85 years or older"             
	96          "Never smoked regularly"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values smknow   smknow; 
label define smknow  
	1           "Every day"                     
	2           "Some days"                     
	3           "Not at all"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values smkqtno  smkqtno;
label define smkqtno 
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values smkqttp  smkqttp;
label define smkqttp 
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values smkqty   smkqty; 
label define smkqty  
	00          "Less than 1 year"              
	70          "70+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values smkqtd   smkqtd; 
label define smkqtd  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cigsda1  cigsda1l;
label define cigsda1l
	95          "95+ cigarettes"                
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values cigdamo  cigdamo;
label define cigdamo 
	00          "None"                          
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values cigsda2  cigsda2l;
label define cigsda2l
	95          "95+ cigarettes"                
	97          "Refused"                       
	98          "Not Ascertained"               
	99          "Don't know"                    
;
label values cigsday  cigsday;
label define cigsday 
	95          "95+ cigarettes"                
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values smkstat1 smkstata;
label define smkstata
	1           "Current"                       
	2           "Former"                        
	3           "Never"                         
	4           "Smoker, current status unknown"
	9           "Unknown if ever smoked"        
;
label values smkstat2 smkstatb;
label define smkstatb
	1           "Current every day smoker"      
	2           "Current some day smoker"       
	3           "Former smoker"                 
	4           "Never  smoker"                 
	5           "Smoker, current status unknown"
	9           "Unknown if ever smoked"        
;
label values smkstat3 smkstatc;
label define smkstatc
	1           "Current  every day smoker"     
	2           "Current some day smoker (1+ days past mo)"
	3           "Current some day smoker (0 days past mo)"
	4           "Current some day smoker (unknown days past mo)"
	5           "Former smoker"                 
	6           "Never smoker"                  
	7           "Smoker, current status unknown"
	9           "Unknown if ever smoked"        
;
label values cigqtyr  cigqtyr;
label define cigqtyr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values vigno    vigno;  
label define vigno   
	000         "Never"                         
	996         "Unable to do this type activity"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values vigtp    vigtp;  
label define vigtp   
	0           "Never"                         
	1           "Day"                           
	2           "Week"                          
	3           "Month"                         
	4           "Year"                          
	6           "Unable to do this activity"    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values vigfreqw vigfreqw;
label define vigfreqw
	00          "Less than once per week"       
	95          "Never"                         
	96          "Unable to do vig activity"     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values viglngno viglngno;
label define viglngno
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values viglngtp viglngtp;
label define viglngtp
	1           "Minutes"                       
	2           "Hours"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values vigmin   vigmin; 
label define vigmin  
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values viglongd viglongd;
label define viglongd
	1           "Less than 20 minutes"          
	2           "20 minutes or more"            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values modno    modno;  
label define modno   
	000         "Never"                         
	996         "Unable to do this type activity"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values modtp    modtp;  
label define modtp   
	0           "Never"                         
	1           "Day"                           
	2           "Week"                          
	3           "Month"                         
	4           "Year"                          
	6           "Unable to do this activity"    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values modfreqw modfreqw;
label define modfreqw
	00          "Less than once per week"       
	95          "Never"                         
	96          "Unable to do moderate activity"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values modlngno modlngno;
label define modlngno
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values modlngtp modlngtp;
label define modlngtp
	1           "Minutes"                       
	2           "Hours"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values modmin   modmin; 
label define modmin  
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values modlongd modlongd;
label define modlongd
	1           "Less than 20 minutes"          
	2           "20 minutes or more"            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values strngno  strngno;
label define strngno 
	000         "Never"                         
	996         "Unable to do this type activity"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values strngtp  strngtp;
label define strngtp 
	0           "Never"                         
	1           "Day"                           
	2           "Week"                          
	3           "Month"                         
	4           "Year"                          
	6           "Unable to do this activity"    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values strfreqw strfreqw;
label define strfreqw
	00          "Less than once per week"       
	95          "Never"                         
	96          "Unable to do strength activity"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alc1yr   alc1yr; 
label define alc1yr  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alclife  alclife;
label define alclife 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alc12mno alc12mno;
label define alc12mno
	000         "Never"                         
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values alc12mtp alc12mtp;
label define alc12mtp
	0           "Never/None"                    
	1           "Week"                          
	2           "Month"                         
	3           "Year"                          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alc12mmo alc12mmo;
label define alc12mmo
	00          "Less than once a month"        
	95          "Did not drink in past year"    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alc12mwk alc12mwk;
label define alc12mwk
	00          "Less than one day per week"    
	95          "Did not drink in past year"    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alc12myr alc12myr;
label define alc12myr
	000         "Never/none"                    
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values alcamt   alcamt; 
label define alcamt  
	95          "95+ drinks"                    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values alc5upno alc5upno;
label define alc5upno
	000         "Never/None"                    
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values alc5uptp alc5uptp;
label define alc5uptp
	0           "Never/None"                    
	1           "Week"                          
	2           "Month"                         
	3           "Year"                          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values alc5upyr alc5upyr;
label define alc5upyr
	000         "Never/None"                    
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values alcstat1 alcstata;
label define alcstata
	1           "Lifetime abstainer [<12 drinks in lifetime]"
	2           "Former drinker [No drinks in past year]"
	3           "Current drinker [1+ drinks in past year]"
	9           "Drinking status unknown"       
;
label values met_flg1 met_flga;
label define met_flga
	1           "Metric height measurement volunteered"
	2           "Not reported in metric units"  
;
label values met_flg2 met_flgb;
label define met_flgb
	1           "Metric weight measurement volunteered"
	2           "Not reported in metric units"  
;
label values aheight  aheight;
label define aheight 
	96          "Not available"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values aweightp aweightp;
label define aweightp
	996         "Not available"                 
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values desirewt desirewt;
label define desirewt
	1           "10% or more below desirable weight"
	2           "5-9% below desirable weight"   
	3           "4.9% (+/-) of desirable body weight"
	4           "5-9.9% above desirable body weight"
	5           "10-19.9% above desirable body weight"
	6           "20-29.9 % above desirable body weight"
	7           "30% + above desirable body weight"
	9           "Unknown"                       
;
label values bmi      bmi;    
label define bmi     
	9995        "99.95+"                        
	9999        "Unknown"                       
;
label values ausualpl ausualpl;
label define ausualpl
	1           "Yes"                           
	2           "There is NO place"             
	3           "There is MORE THAN ONE place"  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aplkind  aplkind;
label define aplkind 
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
label values ahcplrou ahcplrou;
label define ahcplrou
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcplknd ahcplknd;
label define ahcplknd
	0           "Doesn't get preventive care anywhere"
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
label values sourcela sourcela;
label define sourcela
	01          "Same sorc sk care & rout care" 
	02          "Sorc sk care, no sorc rout care"
	03          "Sorc sk & rout care, no/unk same sorc"
	04          "Sorc sk care, unk sorc rout care *"
	05          "GE2 sorc sk care, 1 is sorc rout care"
	06          "GE2 sorc sk care, no sorc rout care"
	07          "GE2 sorc sk & rout care, no/unk if same"
	08          "GE2 sorc sk care, unk sorc rout care *"
	09          "No sorc sk care or rout care"  
	10          "No sorc sk care, has sorc rout care"
	11          "No sorc sk care, unk sorc rout care *"
	12          "Unk sorc sk care, no sorc rout care"
	13          "Unk sorc sk care, has sorc rout care"
	14          "Unk sorc sk care or sorc rout care *"
	99          "Unknown other"                 
;
label values ahcchgyr ahcchgyr;
label define ahcchgyr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcchghi ahcchghi;
label define ahcchghi
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	9           "Don't know"                    
;
label values ahcdlyr1 ahcdlyra;
label define ahcdlyra
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcdlyr2 ahcdlyrb;
label define ahcdlyrb
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcdlyr3 ahcdlyrc;
label define ahcdlyrc
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcdlyr4 ahcdlyrd;
label define ahcdlyrd
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcdlyr5 ahcdlyre;
label define ahcdlyre
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcafyr1 ahcafyra;
label define ahcafyra
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcafyr2 ahcafyrb;
label define ahcafyrb
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcafyr3 ahcafyrc;
label define ahcafyrc
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcafyr4 ahcafyrd;
label define ahcafyrd
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adnlongr adnlongr;
label define adnlongr
	0           "Never"                         
	1           "6 Months or less"              
	2           "More than 6 mos, but not more than 1 yr ago"
	3           "More than 1 yr, but not more than 2 yrs ago"
	4           "More than 2 yrs, but not more than 5 yrs ago"
	5           "More than 5 years ago"         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcsyr1  ahcsyr1l;
label define ahcsyr1l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcsyr2  ahcsyr2l;
label define ahcsyr2l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcsyr3  ahcsyr3l;
label define ahcsyr3l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcsyr4  ahcsyr4l;
label define ahcsyr4l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcsyr5  ahcsyr5l;
label define ahcsyr5l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcsyr6  ahcsyr6l;
label define ahcsyr6l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcsyr7  ahcsyr7l;
label define ahcsyr7l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcsyr8  ahcsyr8l;
label define ahcsyr8l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcsyr9  ahcsyr9l;
label define ahcsyr9l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcsyr10 ahcsyr1j;
label define ahcsyr1j
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahernoy2 ahernoyb;
label define ahernoyb
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
label values ahchyr   ahchyr; 
label define ahchyr  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahchmoyr ahchmoyr;
label define ahchmoyr
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values ahchnoy2 ahchnoyb;
label define ahchnoyb
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
label values ahcnoyr2 ahcnoyrb;
label define ahcnoyrb
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
label values asrgyr   asrgyr; 
label define asrgyr  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values asrgnoyr asrgnoyr;
label define asrgnoyr
	95          "95+ Times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values amdlongr amdlongr;
label define amdlongr
	0           "Never"                         
	1           "6 months or less"              
	2           "More than 6 mos, but not more than 1 yr ago"
	3           "More than 1 yr, but not more than 2 yrs ago"
	4           "More than 2 yrs, but not more than 5 yrs ago"
	5           "More than 5 years ago"         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values shtfluyr shtfluyr;
label define shtfluyr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values shtpnuyr shtpnuyr;
label define shtpnuyr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values apox     apox;   
label define apox    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values apox12mo apox12mo;
label define apox12mo
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahep     ahep;   
label define ahep    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahepliv  ahepliv;
label define ahepliv 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values shthepb  shthepb;
label define shthepb 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values shepdos  shepdos;
label define shepdos 
	1           "Received at least 3 doses"     
	2           "Received less than 3 doses"    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values wrkcat   wrkcat; 
label define wrkcat  
	1           "Employee of a PRIVATE company for wages"
	2           "A FEDERAL government employee" 
	3           "A STATE government employee"   
	4           "A LOCAL government employee"   
	5           "Self-emp in OWN business/prof practice/farm"
	6           "Working WITHOUT PAY in fam business/farm"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values locallno locallno;
label define locallno
	01          "1-9 employees"                 
	02          "10-24 employees"               
	03          "25-49 employees"               
	04          "50-99 employees"               
	05          "100-249 employees"             
	06          "250-499 employees"             
	07          "500-999 employees"             
	08          "1000 employees or more"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values locprtno locprtno;
label define locprtno
	01          "1-9 employees"                 
	02          "10-24 employees"               
	03          "25-49 employees"               
	04          "50-99 employees"               
	05          "100-249 employees"             
	06          "250-499 employees"             
	07          "500-999 employees"             
	08          "1000 employees or more"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values yrswrk_p yrswrk_p;
label define yrswrk_p
	00          "Less than 1 year"              
	35          "35 or more years"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values wrklongd wrklongd;
label define wrklongd
	1           "One year or less"              
	2           "More than one year"            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hourpd   hourpd; 
label define hourpd  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pdsick   pdsick; 
label define pdsick  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values onejob   onejob; 
label define onejob  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values wrkcatot wrkcatot;
label define wrkcatot
	1           "Employee only"                 
	2           "Self-employed only"            
	3           "Both"                          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values businc   businc; 
label define businc  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values bldgv    bldgv;  
label define bldgv   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values bldg12m  bldg12m;
label define bldg12m 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hivtst   hivtst; 
label define hivtst  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytst_c whytst_c;
label define whytst_c
	01          "Unlikely have been exposed to HIV"
	02          "Afraid to find out if HIV positive"
	03          "Didn't want to think about HIV/HIV pos."
	04          "Worried name reported to Govt. if pos."
	05          "Didn't know where to get tested"
	06          "Some other reason"             
	07          "No particular reason"          
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values tst12m_m tst12m_m;
label define tst12m_m
	01          "January"                       
	02          "February"                      
	03          "March"                         
	04          "April"                         
	05          "May"                           
	06          "June"                          
	07          "July"                          
	08          "August"                        
	09          "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
	96          "Used time period format"       
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values tst12m_y tst12m_y;
label define tst12m_y
	9996        "Used time period format"       
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values timetst  timetst;
label define timetst 
	1           "6 Months or less"              
	2           "More than 6 months but not more than 1 year ago"
	3           "More than 1 year, but not more than 2 years ago"
	4           "More than 2 years, but not more than 5 yrs ago"
	5           "More than 5 years ago"         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatst_r reatst_r;
label define reatst_r
	01          "Someone suggested you should be tested"
	02          "Might have been exposed thru sex/drug use"
	03          "Wanted to find out if infected or not"
	04          "Concerned could give HIV to someone"
	05          "Wanted medical care/new treatment if pos"
	06          "You were pregnant"             
	07          "It was part of a routine medical check-up"
	08          "It was required"               
	10          "No particular reason"          
	11          "Insurance"                     
	12          "Military"                      
	13          "Medical procedures/hospitalization"
	14          "Illness or had a medical problem"
	15          "Work/employment"               
	16          "Immigration"                   
	17          "Marriage"                      
	18          "Exposed at work"               
	97          "Refused"                       
	98          "Not ascertained (incl. 'some other reason'*)"
	99          "Don't know"                    
;
label values reaswho  reaswho;
label define reaswho 
	1           "Doctor"                        
	2           "Sex partner"                   
	3           "Someone at health department"  
	4           "Someone else"                  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whyreq_c whyreq_c;
label define whyreq_c
	01          "Insurance"                     
	02          "Military"                      
	03          "Jail"                          
	04          "Hospitalization"               
	05          "Employment"                    
	06          "Immigration"                   
	07          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lastst_c lastst_c;
label define lastst_c
	01          "Doctor/HMO"                    
	02          "AIDS clinic/counseling/testing site"
	03          "Hospital/emergency room/outpatient clinic"
	04          "Other type of clinic"          
	05          "Public health department"      
	06          "At home"                       
	07          "Drug treatment facility"       
	08          "Military induction or military service site"
	09          "Immigration site"              
	10          "In a correctional facility (jail or prison)"
	11          "Other location"                
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values clntyp_c clntyp_c;
label define clntyp_c
	01          "Family planning"               
	02          "Prenatal clinic"               
	03          "Tuberculosis clinic"           
	04          "STD clinic"                    
	05          "Community health clinic"       
	06          "Clinic run by employer or ins co"
	07          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values whoadm   whoadm; 
label define whoadm  
	1           "Nurse or health worker"        
	2           "Self-sampling kit"             
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values givnam   givnam; 
label define givnam  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values extst12m extst12m;
label define extst12m
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chnsadsp chnsadsp;
label define chnsadsp
	1           "High/Already have AIDS/AIDS virus"
	2           "Medium"                        
	3           "Low"                           
	4           "None"                          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values stmtru   stmtru; 
label define stmtru  
	1           "Yes, at least one statement is true"
	2           "No, none of these statements are true"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values std      std;    
label define std     
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values stddoc   stddoc; 
label define stddoc  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values stdwher  stdwher;
label define stdwher 
	1           "Private doctor"                
	2           "Family planning clinic"        
	3           "STD clinic"                    
	4           "Emergency room"                
	5           "Health department"             
	6           "Some other place"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbhrd    tbhrd;  
label define tbhrd   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbknow   tbknow; 
label define tbknow  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tb       tb;     
label define tb      
	1           "A lot"                         
	2           "Some"                          
	3           "A little"                      
	4           "Nothing"                       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbsprd1  tbsprd1l;
label define tbsprd1l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbsprd2  tbsprd2l;
label define tbsprd2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbsprd3  tbsprd3l;
label define tbsprd3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbsprd4  tbsprd4l;
label define tbsprd4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbsprd5  tbsprd5l;
label define tbsprd5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbsprd6  tbsprd6l;
label define tbsprd6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbcured  tbcured;
label define tbcured 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbchanc  tbchanc;
label define tbchanc 
	1           "High"                          
	2           "Medium"                        
	3           "Low"                           
	4           "None"                          
	5           "Already have TB"               
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values homeless homeless;
label define homeless
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tbshame  tbshame;
label define tbshame 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values spspeak  spspeak;
label define spspeak 
	1           "Only Spanish"                  
	2           "Mostly Spanish"                
	3           "Spanish and English about the same"
	4           "Mostly English"                
	5           "Only English"                  
	6           "Other Language"                
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values spchild  spchild;
label define spchild 
	1           "Only Spanish"                  
	2           "Mostly Spanish"                
	3           "Spanish and English about the same"
	4           "Mostly English"                
	5           "Only English"                  
	6           "Other Language"                
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values spread   spread; 
label define spread  
	1           "Only Spanish"                  
	2           "Spanish better than English"   
	3           "Spanish and English about the same"
	4           "English better than Spanish"   
	5           "Only English"                  
	6           "Don't read"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values sp1_home sp1_home;
label define sp1_home
	1           "Only Spanish"                  
	2           "More Spanish than English"     
	3           "Spanish and English about the same"
	4           "More English than Spanish"     
	5           "Only English"                  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values sp1_frnd sp1_frnd;
label define sp1_frnd
	1           "Only Spanish"                  
	2           "More Spanish than English"     
	3           "Spanish and English about the same"
	4           "More English than Spanish"     
	5           "Only English"                  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values sp2_thnk sp2_thnk;
label define sp2_thnk
	1           "Only Spanish"                  
	2           "More Spanish than English"     
	3           "Spanish and English about the same"
	4           "More English than Spanish"     
	5           "Only English"                  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values sp2_tv   sp2_tv; 
label define sp2_tv  
	1           "Only Spanish"                  
	2           "More Spanish than English"     
	3           "Spanish and English about the same"
	4           "More English than Spanish"     
	5           "Only English"                  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values sp2_rdio sp2_rdio;
label define sp2_rdio
	1           "Only Spanish"                  
	2           "More Spanish than English"     
	3           "Spanish and English about the same"
	4           "More English than Spanish"     
	5           "Only English"                  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values coldcno  coldcno;
label define coldcno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values coldctp  coldctp;
label define coldctp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values coldcy   coldcy; 
label define coldcy  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values coldcw   coldcw; 
label define coldcw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values milkno   milkno; 
label define milkno  
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values milktp   milktp; 
label define milktp  
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values milky    milky;  
label define milky   
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values milkw    milkw;  
label define milkw   
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values milkknd  milkknd;
label define milkknd 
	1           "Whole milk"                    
	2           "2% fat"                        
	3           "1% fat"                        
	4           "1/2% milk"                     
	5           "Non-fat or skim milk"          
	6           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values baconno  baconno;
label define baconno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values bacontp  bacontp;
label define bacontp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values bacony   bacony; 
label define bacony  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values baconw   baconw; 
label define baconw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values htdogno  htdogno;
label define htdogno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values htdogtp  htdogtp;
label define htdogtp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values htdogy   htdogy; 
label define htdogy  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values htdogw   htdogw; 
label define htdogw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values breadno  breadno;
label define breadno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values breadtp  breadtp;
label define breadtp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values bready   bready; 
label define bready  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values breadw   breadw; 
label define breadw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values juiceno  juiceno;
label define juiceno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values juicetp  juicetp;
label define juicetp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values juicey   juicey; 
label define juicey  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values juicew   juicew; 
label define juicew  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values fruitno  fruitno;
label define fruitno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fruittp  fruittp;
label define fruittp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fruity   fruity; 
label define fruity  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values fruitw   fruitw; 
label define fruitw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values dressno  dressno;
label define dressno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values dresstp  dresstp;
label define dresstp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values dressy   dressy; 
label define dressy  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values dressw   dressw; 
label define dressw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values saladno  saladno;
label define saladno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values saladtp  saladtp;
label define saladtp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values salady   salady; 
label define salady  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values saladw   saladw; 
label define saladw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values friesno  friesno;
label define friesno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values friestp  friestp;
label define friestp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values friesy   friesy; 
label define friesy  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values friesw   friesw; 
label define friesw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values potatno  potatno;
label define potatno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values potattp  potattp;
label define potattp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values potaty   potaty; 
label define potaty  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values potatw   potatw; 
label define potatw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values beansno  beansno;
label define beansno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values beanstp  beanstp;
label define beanstp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values beansy   beansy; 
label define beansy  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values beansw   beansw; 
label define beansw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values ovegno   ovegno; 
label define ovegno  
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values ovegtp   ovegtp; 
label define ovegtp  
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ovegy    ovegy;  
label define ovegy   
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values ovegw    ovegw;  
label define ovegw   
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values pastano  pastano;
label define pastano 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values pastatp  pastatp;
label define pastatp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pastay   pastay; 
label define pastay  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values pastaw   pastaw; 
label define pastaw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values pnutno   pnutno; 
label define pnutno  
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values pnuttp   pnuttp; 
label define pnuttp  
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pnuty    pnuty;  
label define pnuty   
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values pnutw    pnutw;  
label define pnutw   
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values chipsno  chipsno;
label define chipsno 
	00          "Never"                         
	95          "95+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values chipstp  chipstp;
label define chipstp 
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chipsy   chipsy; 
label define chipsy  
	0000        "Never"                         
	9996        "9996+ times"                   
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values chipsw   chipsw; 
label define chipsw  
	000         "Never or less than once per week"
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values vitany   vitany; 
label define vitany  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values vitmul   vitmul; 
label define vitmul  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values vitmulm  vitmulm;
label define vitmulm 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values vitmuld1 vitmulda;
label define vitmulda
	96          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vitmuld2 vitmuldb;
label define vitmuldb
	1           "Days per week"                 
	2           "Days per month"                
	6           "Other"                         
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't know"                    
;
label values vitmuldm vitmuldm;
label define vitmuldm
	00          "Less than once a month"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vitmuldw vitmuldw;
label define vitmuldw
	00          "Less than one day per week"    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vita     vita;   
label define vita    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values vitam    vitam;  
label define vitam   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values vitadno  vitadno;
label define vitadno 
	96          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vitadtp  vitadtp;
label define vitadtp 
	1           "Days per week"                 
	2           "Days per month"                
	6           "Other"                         
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't know"                    
;
label values vitadm   vitadm; 
label define vitadm  
	00          "Less than once a month"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vitadw   vitadw; 
label define vitadw  
	00          "Less than one day per week"    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vitc     vitc;   
label define vitc    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values vitcm    vitcm;  
label define vitcm   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values vitcdno  vitcdno;
label define vitcdno 
	96          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vitcdtp  vitcdtp;
label define vitcdtp 
	1           "Days per week"                 
	2           "Days per month"                
	6           "Other"                         
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't know"                    
;
label values vitcdm   vitcdm; 
label define vitcdm  
	00          "Less than once a month"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vitcdw   vitcdw; 
label define vitcdw  
	00          "Less than one day per week"    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vite     vite;   
label define vite    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values vitem    vitem;  
label define vitem   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values vitedno  vitedno;
label define vitedno 
	96          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vitedtp  vitedtp;
label define vitedtp 
	1           "Days per week"                 
	2           "Days per month"                
	6           "Other"                         
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't know"                    
;
label values vitedm   vitedm; 
label define vitedm  
	00          "Less than once a month"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values vitedw   vitedw; 
label define vitedw  
	00          "Less than one day per week"    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values calc     calc;   
label define calc    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values calcm    calcm;  
label define calcm   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values calcdno  calcdno;
label define calcdno 
	96          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values calcdtp  calcdtp;
label define calcdtp 
	1           "Days per week"                 
	2           "Days per month"                
	6           "Other"                         
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't know"                    
;
label values calcdm   calcdm; 
label define calcdm  
	00          "Less than once a month"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values calcdw   calcdw; 
label define calcdw  
	00          "Less than one day per week"    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values herbsupp herbsupp;
label define herbsupp
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values herb_alo herb_alo;
label define herb_alo
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_ast herb_ast;
label define herb_ast
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_bil herb_bil;
label define herb_bil
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_cas herb_cas;
label define herb_cas
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_cat herb_cat;
label define herb_cat
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_cay herb_cay;
label define herb_cay
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_cra herb_cra;
label define herb_cra
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_don herb_don;
label define herb_don
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_ech herb_ech;
label define herb_ech
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_eve herb_eve;
label define herb_eve
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_fev herb_fev;
label define herb_fev
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_gar herb_gar;
label define herb_gar
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_gig herb_gig;
label define herb_gig
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_gik herb_gik;
label define herb_gik
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_gia herb_gia;
label define herb_gia
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_gis herb_gis;
label define herb_gis
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_gol herb_gol;
label define herb_gol
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_gra herb_gra;
label define herb_gra
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_kav herb_kav;
label define herb_kav
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_lec herb_lec;
label define herb_lec
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_mel herb_mel;
label define herb_mel
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_mil herb_mil;
label define herb_mil
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_saw herb_saw;
label define herb_saw
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_joh herb_joh;
label define herb_joh
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_val herb_val;
label define herb_val
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herb_oth herb_oth;
label define herb_oth
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values herbm    herbm;  
label define herbm   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values herbdno  herbdno;
label define herbdno 
	96          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values herbdtp  herbdtp;
label define herbdtp 
	1           "Days per week"                 
	2           "Days per month"                
	6           "Other"                         
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't know"                    
;
label values herbdm   herbdm; 
label define herbdm  
	00          "Less than once a month"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values herbdw   herbdw; 
label define herbdw  
	00          "Less than one day per  week"   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mdtalk   mdtalk; 
label define mdtalk  
	1           "Yes"                           
	2           "No"                            
	3           "Did not see a doctor in the PAST 12 MONTHS"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values walk     walk;   
label define walk    
	1           "Yes"                           
	2           "No"                            
	3           "Unable to walk or bike"        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values move1    move1l; 
label define move1l  
	1           "SIT during MOST of the day"    
	2           "STAND during MOST of the day"  
	3           "WALK AROUND MOST of the day"   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values lift     lift;   
label define lift    
	1           "NOT lift or carry things very often"
	2           "LIFT or carry LIGHT loads"     
	3           "LIFT or carry MODERATE loads"  
	4           "LIFT or carry HEAVY loads"     
	5           "Unable to lift or carry loads" 
	6           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values sitwday  sitwday;
label define sitwday 
	00          "None"                          
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values sitwend  sitwend;
label define sitwend 
	00          "None"                          
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values mdexer   mdexer; 
label define mdexer  
	1           "Yes"                           
	2           "No"                            
	3           "Did not see a doctor in the PAST 12 MONTHS"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values fsswitc  fsswitc;
label define fsswitc 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqstop  fsqstop;
label define fsqstop 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqdecr  fsqdecr;
label define fsqdecr 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqbook  fsqbook;
label define fsqbook 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqcoun  fsqcoun;
label define fsqcoun 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqclin  fsqclin;
label define fsqclin 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqpatc  fsqpatc;
label define fsqpatc 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqgum   fsqgum; 
label define fsqgum  
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqspry  fsqspry;
label define fsqspry 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqinha  fsqinha;
label define fsqinha 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqzyb   fsqzyb; 
label define fsqzyb  
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqswit  fsqswit;
label define fsqswit 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsqoth   fsqoth; 
label define fsqoth  
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsquitn  fsquitn;
label define fsquitn 
	995         "995+ times"                    
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values csswitc  csswitc;
label define csswitc 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqev    csqev;  
label define csqev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csq12    csq12l; 
label define csq12l  
	995         "995+ times"                    
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values csqstop  csqstop;
label define csqstop 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqdecr  csqdecr;
label define csqdecr 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqbook  csqbook;
label define csqbook 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqcoun  csqcoun;
label define csqcoun 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqclin  csqclin;
label define csqclin 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqpatc  csqpatc;
label define csqpatc 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqgum   csqgum; 
label define csqgum  
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqspry  csqspry;
label define csqspry 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqinha  csqinha;
label define csqinha 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqzyb   csqzyb; 
label define csqzyb  
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqswit  csqswit;
label define csqswit 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csqoth   csqoth; 
label define csqoth  
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values qwant    qwant;  
label define qwant   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csq6m    csq6m;  
label define csq6m   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values csq30d   csq30d; 
label define csq30d  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mdtob1   mdtob1l;
label define mdtob1l 
	1           "Yes"                           
	2           "No"                            
	3           "Doctor doesn't ask - knows I smoke/use tobacco"
	4           "Doctor doesn't ask - knows I don't use tobacco"
	5           "Did not see doctor in past 12 months"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mdtob2   mdtob2l;
label define mdtob2l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values evpipe   evpipe; 
label define evpipe  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values evcigar  evcigar;
label define evcigar 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values evbidi   evbidi; 
label define evbidi  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values evsnuff  evsnuff;
label define evsnuff 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values evchew   evchew; 
label define evchew  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pipe50   pipe50l;
label define pipe50l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pipeed   pipeed; 
label define pipeed  
	1           "Every day"                     
	2           "Some days"                     
	3           "Not at all"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cigar50  cigar50l;
label define cigar50l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cigared  cigared;
label define cigared 
	1           "Every day"                     
	2           "Some days"                     
	3           "Not at all"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cig30d   cig30d; 
label define cig30d  
	00          "None"                          
	97          "Refused"                       
	99          "Don't know"                    
;
label values bidi20   bidi20l;
label define bidi20l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values bidied   bidied; 
label define bidied  
	1           "Every day"                     
	2           "Some days"                     
	3           "Not at all"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values snuff20  snuff20l;
label define snuff20l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values snuffed  snuffed;
label define snuffed 
	1           "Every day"                     
	2           "Some days"                     
	3           "Not at all"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chew20   chew20l;
label define chew20l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chewed   chewed; 
label define chewed  
	1           "Every day"                     
	2           "Some days"                     
	3           "Not at all"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values smhome   smhome; 
label define smhome  
	00          "Less than 1 day per week/Rarely/None"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values areawrk  areawrk;
label define areawrk 
	1           "Work mainly indoors"           
	2           "Work mainly outdoors"          
	3           "Travel to different buildings/sites"
	4           "In a motor vehicle"            
	5           "Some other area"               
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values smarea   smarea; 
label define smarea  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values smpol    smpol;  
label define smpol   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values smpolp   smpolp; 
label define smpolp  
	1           "Not allowed in ANY indoor public areas"
	2           "Allowed in SOME indoor public areas"
	3           "Allowed in ALL indoor public areas"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values smpolw   smpolw; 
label define smpolw  
	1           "Not allowed in ANY work areas" 
	2           "Allowed in SOME work areas"    
	3           "Allowed in ALL work areas"     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values nosmok   nosmok; 
label define nosmok  
	1           "Not allowed in ANY indoor public places"
	2           "Allowed in SOME indoor public places"
	3           "Allowed in ALL indoor public places"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values smharm   smharm; 
label define smharm  
	1           "Agree"                         
	2           "Disagree"                      
	3           "Have no opinion"               
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values incr150  incr150l;
label define incr150l
	1           "Agree"                         
	2           "Disagree"                      
	3           "Have no opinion"               
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sun1hr   sun1hr; 
label define sun1hr  
	01          "Get a severe sunburn with blisters"
	02          "Have severe sunburn for few days w/peeling"
	03          "Burn mildly with some or no tanning"
	04          "Turn darker without sunburn"   
	05          "Say that nothing would happen" 
	06          "Do not go out in the sun"      
	07          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values suntan   suntan; 
label define suntan  
	01          "Get very dark and deeply tanned"
	02          "Moderately tanned"             
	03          "Mildly tanned"                 
	04          "Only freckled or no suntan at all"
	05          "Repeated sunburns"             
	06          "Don't go out in the sun"       
	07          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values sun1_sha sun1_sha;
label define sun1_sha
	1           "Always"                        
	2           "Most of the time"              
	3           "Sometimes"                     
	4           "Rarely"                        
	5           "Never"                         
	6           "Don't go out in sun"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values sun1_hat sun1_hat;
label define sun1_hat
	1           "Always"                        
	2           "Most of the time"              
	3           "Sometimes"                     
	4           "Rarely"                        
	5           "Never"                         
	6           "Don't go out in sun"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values sun2_lgs sun2_lgs;
label define sun2_lgs
	1           "Always"                        
	2           "Most of the time"              
	3           "Sometimes"                     
	4           "Rarely"                        
	5           "Never"                         
	6           "Don't go out in sun"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values sun2_scr sun2_scr;
label define sun2_scr
	1           "Always"                        
	2           "Most of the time"              
	3           "Sometimes"                     
	4           "Rarely"                        
	5           "Never"                         
	6           "Don't go out in sun"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values spf      spf;    
label define spf     
	96          "More than one, Different ones, Other"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values nburn    nburn;  
label define nburn   
	000         "None"                          
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't Know"                    
;
label values sknx     sknx;   
label define sknx    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rskx1_mt rskx1_mt;
label define rskx1_mt
	01        "January"                       
	02        "February"                      
	03        "March"                         
	04        "April"                         
	05        "May"                           
	06        "June"                          
	07        "July"                          
	08        "August"                        
	09        "September"                     
	10        "October"                       
	11        "November"                      
	12        "December"                      
	96        "Time period format"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't Know"                    
;
label values rskx1_yr rskx1_yr;
label define rskx1_yr
	9996        "Time period format"            
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values rskx1_no rskx1_no;
label define rskx1_no
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rskx1_tp rskx1_tp;
label define rskx1_tp
	1           "Days ago"                      
	2           "Weeks ago"                     
	3           "Months ago"                    
	4           "Years ago"                     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rskx2    rskx2l; 
label define rskx2l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rskx_mo2 rskx_mob;
label define rskx_mob
	012         "12 months"                     
	024         "24 months"                     
	036         "36 months"                     
	060         "60 months"                     
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't Know"                    
;
label values rskx3    rskx3l; 
label define rskx3l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values sknxreas sknxreas;
label define sknxreas
	1           "Part of a routine physical exam/screening test"
	2           "Because of a specific skin problem"
	3           "Followup to a previous skin problem"
	4           "Family history"                
	5           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values menstage menstage;
label define menstage
	00          "Haven't started"               
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values bcevuse  bcevuse;
label define bcevuse 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values bc_no    bc_no;  
label define bc_no   
	95          "95+"                           
	96          "Duration not determined (times/week)"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values bc_tp    bc_tp;  
label define bc_tp   
	3           "Months"                        
	4           "Years"                         
	6           "Duration not determined (times/week)"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values birthev  birthev;
label define birthev 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values birthnum birthnum;
label define birthnum
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values birthage birthage;
label define birthage
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values birthag2 birthagb;
label define birthagb
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't Know"                    
;
label values paphad   paphad; 
label define paphad  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values pap6yr_p pap6yr_p;
label define pap6yr_p
	00          "None"                          
	13          "13+ Times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values rpap1_mt rpap1_mt;
label define rpap1_mt
	01        "January"                       
	02        "February"                      
	03        "March"                         
	04        "April"                         
	05        "May"                           
	06        "June"                          
	07        "July"                          
	08        "August"                        
	09        "September"                     
	10        "October"                       
	11        "November"                      
	12        "December"                      
	96        "Time period format"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't Know"                    
;
label values rpap1_yr rpap1_yr;
label define rpap1_yr
	9996        "Time period format"            
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values rpap1_no rpap1_no;
label define rpap1_no
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rpap1_tp rpap1_tp;
label define rpap1_tp
	1           "Days ago"                      
	2           "Weeks ago"                     
	3           "Months ago"                    
	4           "Years ago"                     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rpap2ca  rpap2ca;
label define rpap2ca 
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rpap_mo2 rpap_mob;
label define rpap_mob
	012         "12 months"                     
	024         "24 months"                     
	036         "36 months"                     
	060         "60 months"                     
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't Know"                    
;
label values rpap3    rpap3l; 
label define rpap3l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values papreas  papreas;
label define papreas 
	1           "Part of a routine physical or pregnancy exam"
	2           "Because of a specific gynecological problem"
	3           "Followup to a previous gynecological exam"
	4           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values papabn   papabn; 
label define papabn  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values papadde  papadde;
label define papadde 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values paptrt   paptrt; 
label define paptrt  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values papnot   papnot; 
label define papnot  
	01          "No reason/never thought about it"
	02          "Didn't need/know I needed this type of test"
	03          "Doctor didn't order it/didn't say I needed it"
	04          "Haven't had any problems"      
	05          "Put it off/didn't get around to it"
	06          "Too expensive/no insurance/cost"
	07          "Too painful, unpleasant, or embarrassing"
	08          "Had hysterectomy"              
	09          "Don't have doctor"             
	10          "Other"                         
	97          "Refused"                       
	98          "Not Ascertained"               
	99          "Don't Know"                    
;
label values mdrecpap mdrecpap;
label define mdrecpap
	1           "Yes"                           
	2           "No"                            
	3           "No doctor visits in last 12 months"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values hyst     hyst;   
label define hyst    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rhyst1_m rhyst1_m;
label define rhyst1_m
	01        "January"                       
	02        "February"                      
	03        "March"                         
	04        "April"                         
	05        "May"                           
	06        "June"                          
	07        "July"                          
	08        "August"                        
	09        "September"                     
	10        "October"                       
	11        "November"                      
	12        "December"                      
	96        "Time period format"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't Know"                    
;
label values rhyst1_y rhyst1_y;
label define rhyst1_y
	9996        "Time period format"            
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values rhyst1_n rhyst1_n;
label define rhyst1_n
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rhyst1_t rhyst1_t;
label define rhyst1_t
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rhyst2   rhyst2l;
label define rhyst2l 
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rhys_mo2 rhys_mob;
label define rhys_mob
	012         "12 months"                     
	024         "24 months"                     
	036         "36 months"                     
	060         "60 months"                     
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't Know"                    
;
label values rhyst3   rhyst3l;
label define rhyst3l 
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values mamhad   mamhad; 
label define mamhad  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values mamage   mamage; 
label define mamage  
	1           "Under 30 years"                
	2           "30 to 39"                      
	3           "40 to 49 years"                
	4           "50 to 59 years"                
	5           "60 years or older"             
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "DK"                            
;
label values mam6yr_p mam6yr_p;
label define mam6yr_p
	00          "None"                          
	13          "13+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values rmam1_mt rmam1_mt;
label define rmam1_mt
	01        "January"                       
	02        "February"                      
	03        "March"                         
	04        "April"                         
	05        "May"                           
	06        "June"                          
	07        "July"                          
	08        "August"                        
	09        "September"                     
	10        "October"                       
	11        "November"                      
	12        "December"                      
	96        "Time period format"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't Know"                    
;
label values rmam1_yr rmam1_yr;
label define rmam1_yr
	9996        "Time period format"            
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values rmam1_no rmam1_no;
label define rmam1_no
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rmam1_tp rmam1_tp;
label define rmam1_tp
	1           "Days ago"                      
	2           "Weeks ago"                     
	3           "Months ago"                    
	4           "Years ago"                     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rmam2ca  rmam2ca;
label define rmam2ca 
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rmam_mo2 rmam_mob;
label define rmam_mob
	012         "12 months"                     
	024         "24 months"                     
	036         "36 months"                     
	060         "60 months"                     
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't Know"                    
;
label values rmam3    rmam3l; 
label define rmam3l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values mamwher  mamwher;
label define mamwher 
	1           "Mammogram van"                 
	2           "Independent X-ray or radiology center"
	3           "Clinic/health center, not in a hospital"
	4           "Private doctor's office"       
	5           "Hospital"                      
	6           "Other place"                   
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values mampay   mampay; 
label define mampay  
	1           "I paid NONE of the cost"       
	2           "I paid PART of the cost"       
	3           "I paid ALL of the cost"        
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values mamp_pri mamp_pri;
label define mamp_pri
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamp_car mamp_car;
label define mamp_car
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamp_aid mamp_aid;
label define mamp_aid
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamp_fre mamp_fre;
label define mamp_fre
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamp_oth mamp_oth;
label define mamp_oth
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamlocst mamlocst;
label define mamlocst
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values mamreas  mamreas;
label define mamreas 
	1           "Part of a routine physical exam/screening test"
	2           "Because of a specific breast problem"
	3           "Followup to prev. identified breast problem"
	4           "Baseline or initial mammogram" 
	5           "Family history"                
	6           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values mamabn   mamabn; 
label define mamabn  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values mamt_non mamt_non;
label define mamt_non
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamt_oth mamt_oth;
label define mamt_oth
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamt_ult mamt_ult;
label define mamt_ult
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamt_cbe mamt_cbe;
label define mamt_cbe
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamt_bio mamt_bio;
label define mamt_bio
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamt_tum mamt_tum;
label define mamt_tum
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamt_bre mamt_bre;
label define mamt_bre
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mamcan   mamcan; 
label define mamcan  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values lumpev   lumpev; 
label define lumpev  
	1           "Yes"                           
	2           "No"                            
	3           "Lump removed was cancerous"    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values lumpnum  lumpnum;
label define lumpnum 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values mamnot   mamnot; 
label define mamnot  
	01          "No reason/never thought about it"
	02          "Didn't need/know I needed this type of test"
	03          "Doctor didn't order it/didn't say I needed it"
	04          "Haven't had any problems"      
	05          "Put it off/didn't get around to it"
	06          "Too expensive/no insurance/cost"
	07          "Too painful, unpleasant, or embarrassing"
	08          "I'm too young"                 
	09          "Don't have doctor"             
	10          "Other reason"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values mdrecmam mdrecmam;
label define mdrecmam
	1           "Yes"                           
	2           "No"                            
	3           "No doctor visit in past year"  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values med_hrt  med_hrt;
label define med_hrt 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values med_tamx med_tamx;
label define med_tamx
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values med_ralx med_ralx;
label define med_ralx
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values med_bc   med_bc; 
label define med_bc  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values cbehad   cbehad; 
label define cbehad  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rcbe1_mt rcbe1_mt;
label define rcbe1_mt
	01        "January"                       
	02        "February"                      
	03        "March"                         
	04        "April"                         
	05        "May"                           
	06        "June"                          
	07        "July"                          
	08        "August"                        
	09        "September"                     
	10        "October"                       
	11        "November"                      
	12        "December"                      
	96        "Time period format"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't Know"                    
;
label values rcbe1_yr rcbe1_yr;
label define rcbe1_yr
	9996        "Time period format"            
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values rcbe1_no rcbe1_no;
label define rcbe1_no
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rcbe1_tp rcbe1_tp;
label define rcbe1_tp
	1           "Days ago"                      
	2           "Weeks ago"                     
	3           "Months ago"                    
	4           "Years ago"                     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rcbe2    rcbe2l; 
label define rcbe2l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rcbe_mo2 rcbe_mob;
label define rcbe_mob
	012         "12 months"                     
	024         "24 months"                     
	036         "36 months"                     
	060         "60 months"                     
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't Know"                    
;
label values rcbe3    rcbe3l; 
label define rcbe3l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values psahrd   psahrd; 
label define psahrd  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values psahad   psahad; 
label define psahad  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values psaage1  psaage1l;
label define psaage1l
	01          "Under 40 years"                
	02          "40 - 44"                       
	03          "45 - 49"                       
	04          "50 - 54"                       
	05          "55 - 59"                       
	06          "60 - 64"                       
	07          "65 - 69"                       
	08          "70 years or older"             
	97          "Refused"                       
	98          "Not Ascertained"               
	99          "DK"                            
;
label values psa5yr_p psa5yr_p;
label define psa5yr_p
	00          "None"                          
	11          "11+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values rpsa1_mt rpsa1_mt;
label define rpsa1_mt
	01        "January"                       
	02        "February"                      
	03        "March"                         
	04        "April"                         
	05        "May"                           
	06        "June"                          
	07        "July"                          
	08        "August"                        
	09        "September"                     
	10        "October"                       
	11        "November"                      
	12        "December"                      
	96        "Time period format"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't Know"                    
;
label values rpsa1_yr rpsa1_yr;
label define rpsa1_yr
	9996        "Time period format"            
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values rpsa1_no rpsa1_no;
label define rpsa1_no
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rpsa1_tp rpsa1_tp;
label define rpsa1_tp
	1           "Days ago"                      
	2           "Weeks ago"                     
	3           "Months ago"                    
	4           "Years ago"                     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rpsa2    rpsa2l; 
label define rpsa2l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rpsa_mo2 rpsa_mob;
label define rpsa_mob
	012         "12 months"                     
	024         "24 months"                     
	036         "36 months"                     
	060         "60 months"                     
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't Know"                    
;
label values rpsa3    rpsa3l; 
label define rpsa3l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values psareas  psareas;
label define psareas 
	1           "Part of a routine physical exam/screening test"
	2           "Because of a specific problem" 
	3           "Followup test for an earlier exam"
	4           "Family history"                
	5           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values psasugg  psasugg;
label define psasugg 
	1           "I did"                         
	2           "My doctor"                     
	3           "Someone else"                  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values psadisc  psadisc;
label define psadisc 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values psaabn   psaabn; 
label define psaabn  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values psat_non psat_non;
label define psat_non
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values psat_oth psat_oth;
label define psat_oth
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values psat_bio psat_bio;
label define psat_bio
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values psat_ult psat_ult;
label define psat_ult
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values psat_mri psat_mri;
label define psat_mri
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values psacan   psacan; 
label define psacan  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values crehad   crehad; 
label define crehad  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values cre10y_p cre10y_p;
label define cre10y_p
	00          "None"                          
	21          "21+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values rcre1_mt rcre1_mt;
label define rcre1_mt
	01        "January"                       
	02        "February"                      
	03        "March"                         
	04        "April"                         
	05        "May"                           
	06        "June"                          
	07        "July"                          
	08        "August"                        
	09        "September"                     
	10        "October"                       
	11        "November"                      
	12        "December"                      
	96        "Time period format"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't Know"                    
;
label values rcre1_yr rcre1_yr;
label define rcre1_yr
	9996        "Time period format"            
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values rcre1_no rcre1_no;
label define rcre1_no
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rcre1_tp rcre1_tp;
label define rcre1_tp
	1           "Days ago"                      
	2           "Weeks ago"                     
	3           "Months ago"                    
	4           "Years ago"                     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rcre2    rcre2l; 
label define rcre2l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "More than 5 years but not more that 10 years"
	6           "More than 10 years ago"        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rcre_mo2 rcre_mob;
label define rcre_mob
	012         "12 months"                     
	024         "24 months"                     
	036         "36 months"                     
	060         "60 months"                     
	120         "120 months"                    
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't Know"                    
;
label values rcre3    rcre3l; 
label define rcre3l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "More than 5 years but not more than 10 years"
	6           "Over 10 years ago"             
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values crenam   crenam; 
label define crenam  
	1           "Sigmoidoscopy"                 
	2           "Colonoscopy"                   
	3           "Proctoscopy"                   
	4           "Something else"                
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values crereas  crereas;
label define crereas 
	1           "Part of a routine physical exam/screening test"
	2           "Because of a specific problem" 
	3           "Followup test of an earlier test/exam"
	4           "Family history"                
	5           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values crenot   crenot; 
label define crenot  
	01          "No reason/never thought about it"
	02          "Didn't need/know I needed this type of test"
	03          "Doctor didn't order it/didn't say I needed it"
	04          "Haven't had any problems"      
	05          "Put it off/didn't get around to it"
	06          "Too expensive/no insurance/cost"
	07          "Too painful, unpleasant, or embarrassing"
	08          "Had another type of colorectal exam"
	09          "Don't have doctor"             
	10          "Other"                         
	97          "Refused"                       
	98          "Not Ascertained"               
	99          "Don't Know"                    
;
label values crerec   crerec; 
label define crerec  
	1           "Yes"                           
	2           "No"                            
	3           "No doctor visit in past 12 months"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values hfobhad  hfobhad;
label define hfobhad 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values hfob3y_p hfob3y_p;
label define hfob3y_p
	00          "None"                          
	07          "7+"                            
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values rhfob1_m rhfob1_m;
label define rhfob1_m
	01        "January"                       
	02        "February"                      
	03        "March"                         
	04        "April"                         
	05        "May"                           
	06        "June"                          
	07        "July"                          
	08        "August"                        
	09        "September"                     
	10        "October"                       
	11        "November"                      
	12        "December"                      
	96        "Time period format"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't Know"                    
;
label values rhfob1_y rhfob1_y;
label define rhfob1_y
	9996        "Time period format"            
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values rhfob1_n rhfob1_n;
label define rhfob1_n
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rhfob1_t rhfob1_t;
label define rhfob1_t
	1           "Days ago"                      
	2           "Weeks ago"                     
	3           "Months ago"                    
	4           "Years ago"                     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rhfob2   rhfob2l;
label define rhfob2l 
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "More than 5 years but not more that 10 years"
	6           "More than 10 years ago"        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rhfo_mo2 rhfo_mob;
label define rhfo_mob
	012         "12 months"                     
	024         "24 months"                     
	036         "36 months"                     
	060         "60 months"                     
	120         "120 months"                    
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't Know"                    
;
label values rhfob3   rhfob3l;
label define rhfob3l 
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "More than 5 years but not more than 10 years"
	6           "Over 10 years ago"             
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values hfobreas hfobreas;
label define hfobreas
	1           "Part of a routine physical exam/screening test"
	2           "Because of a specific problem" 
	3           "Followup test of an earlier test/screening exam"
	4           "Family history"                
	5           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values hfobabn  hfobabn;
label define hfobabn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values hfob_non hfob_non;
label define hfob_non
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hfob_oth hfob_oth;
label define hfob_oth
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hfob_sig hfob_sig;
label define hfob_sig
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hfob_col hfob_col;
label define hfob_col
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hfob_bar hfob_bar;
label define hfob_bar
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hfob_sur hfob_sur;
label define hfob_sur
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hfobnot  hfobnot;
label define hfobnot 
	01          "No reason/never thought about it"
	02          "Didn't need/know I needed this type of test"
	03          "Doctor didn't order it/didn't say I needed it"
	04          "Haven't had any problems"      
	05          "Put it off/didn't get around to it"
	06          "Too expensive/no insurance/cost"
	07          "Too painful, unpleasant, or embarrassing"
	08          "Had another type of colorectal exam"
	09          "Don't have doctor"             
	10          "Other"                         
	97          "Refused"                       
	98          "Not Ascertained"               
	99          "Don't Know"                    
;
label values mdhfob   mdhfob; 
label define mdhfob  
	1           "Yes"                           
	2           "No"                            
	3           "Did not go to doctor in past 12 months"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values fobhad   fobhad; 
label define fobhad  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rfob1_mt rfob1_mt;
label define rfob1_mt
	01        "January"                       
	02        "February"                      
	03        "March"                         
	04        "April"                         
	05        "May"                           
	06        "June"                          
	07        "July"                          
	08        "August"                        
	09	      "September"                     
	10        "October"                       
	11        "November"                      
	12        "December"                      
	96        "Time period format"            
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't Know"                    
;
label values rfob1_yr rfob1_yr;
label define rfob1_yr
	9996        "Time period format"            
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values rfob1_no rfob1_no;
label define rfob1_no
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rfob1_tp rfob1_tp;
label define rfob1_tp
	1           "Days ago"                      
	2           "Weeks ago"                     
	3           "Months ago"                    
	4           "Years ago"                     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rfob2    rfob2l; 
label define rfob2l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "More than 5 years but not more that 10 years"
	6           "More than 10 years ago"        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values rfob_mo2 rfob_mob;
label define rfob_mob
	012         "12 months"                     
	024         "24 months"                     
	036         "36 months"                     
	060         "60 months"                     
	120         "120 months"                    
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't Know"                    
;
label values rfob3    rfob3l; 
label define rfob3l  
	1           "A year ago or less"            
	2           "More than 1 year but not more than 2 years"
	3           "More than 2 years but not more than 3 years"
	4           "More than 3 years but not more than 5 years"
	5           "More than 5 years but not more than 10 years"
	6           "Over 10 years ago"             
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values gtheard  gtheard;
label define gtheard 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtposs   gtposs; 
label define gtposs  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtadvise gtadvise;
label define gtadvise
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtgrisk  gtgrisk;
label define gtgrisk 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gt_bre   gt_bre; 
label define gt_bre  
	1           "Yes"                           
	2           "No"                            
	3           "Male, not applicable"          
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gt_ova   gt_ova; 
label define gt_ova  
	1           "Yes"                           
	2           "No"                            
	3           "Male, not applicable"          
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gt_col   gt_col; 
label define gt_col  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gt_oth   gt_oth; 
label define gt_oth  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtcount  gtcount;
label define gtcount 
	0           "No  test specified"            
;
label values gtrsk_mt gtrsk_mt;
label define gtrsk_mt
	01          "January"                       
	02          "February"                      
	03          "March"                         
	04          "April"                         
	05          "May"                           
	06          "June"                          
	07          "July"                          
	08          "August"                        
	09          "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
	96          "Used time period format"       
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values gtrsk_yr gtrsk_yr;
label define gtrsk_yr
	9996        "Used time period format"       
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values gtrskbno gtrskbno;
label define gtrskbno
	96          "96+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values gtrskbtp gtrskbtp;
label define gtrskbtp
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values gtconsnt gtconsnt;
label define gtconsnt
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtrsrch  gtrsrch;
label define gtrsrch 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtdoct   gtdoct; 
label define gtdoct  
	01          "Surgeon"                       
	02          "Gastroenterologist"            
	03          "Gynecologist"                  
	04          "Dermatologist"                 
	05          "Medical Geneticist"            
	06          "Internal medicine or family practice physician"
	07          "Genetic counselor"             
	08          "Oncologist"                    
	09          "Pediatrician"                  
	10          "Some other doctor"             
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know kind of doctor"     
;
label values gtconf   gtconf; 
label define gtconf  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtresult gtresult;
label define gtresult
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtreshow gtreshow;
label define gtreshow
	1           "By telephone"                  
	2           "In person"                     
	3           "By mail"                       
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtaccura gtaccura;
label define gtaccura
	1           "Very confident"                
	2           "Somewhat confident"            
	3           "Not very confident"            
	4           "Not confident at all"          
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtcounc  gtcounc;
label define gtcounc 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtcwhen  gtcwhen;
label define gtcwhen 
	1           "Before or on the day you took the test"
	2           "After the day you took the test"
	3           "Both before and after you took the test"
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtinsure gtinsure;
label define gtinsure
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtcrisk  gtcrisk;
label define gtcrisk 
	1           "Low"                           
	2           "Medium"                        
	3           "High"                          
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values gtfrisk  gtfrisk;
label define gtfrisk 
	1           "Low"                           
	2           "Medium"                        
	3           "High"                          
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't Know"                    
;
label values fhfcan   fhfcan; 
label define fhfcan  
	1           "Yes"                           
	2           "No"                            
	3           "Adopted or don't know biological father"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp1  fhftyp1l;
label define fhftyp1l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage1  fhfage1l;
label define fhfage1l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp2  fhftyp2l;
label define fhftyp2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage2  fhfage2l;
label define fhfage2l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp3  fhftyp3l;
label define fhftyp3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage3  fhfage3l;
label define fhfage3l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp4  fhftyp4l;
label define fhftyp4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage4  fhfage4l;
label define fhfage4l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp5  fhftyp5l;
label define fhftyp5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage5  fhfage5l;
label define fhfage5l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp6  fhftyp6l;
label define fhftyp6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage6  fhfage6l;
label define fhfage6l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp7  fhftyp7l;
label define fhftyp7l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage7  fhfage7l;
label define fhfage7l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp8  fhftyp8l;
label define fhftyp8l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage8  fhfage8l;
label define fhfage8l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp9  fhftyp9l;
label define fhftyp9l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage9  fhfage9l;
label define fhfage9l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp10 fhftyp1j;
label define fhftyp1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage10 fhfage1j;
label define fhfage1j
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp11 fhftyp1a;
label define fhftyp1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage11 fhfage1a;
label define fhfage1a
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp12 fhftyp1b;
label define fhftyp1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage12 fhfage1b;
label define fhfage1b
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp13 fhftyp1c;
label define fhftyp1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage13 fhfage1c;
label define fhfage1c
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp14 fhftyp1d;
label define fhftyp1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage14 fhfage1d;
label define fhfage1d
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp15 fhftyp1e;
label define fhftyp1e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage15 fhfage1e;
label define fhfage1e
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp16 fhftyp1f;
label define fhftyp1f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage16 fhfage1f;
label define fhfage1f
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp17 fhftyp1g;
label define fhftyp1g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage17 fhfage1g;
label define fhfage1g
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp18 fhftyp1h;
label define fhftyp1h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage18 fhfage1h;
label define fhfage1h
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp19 fhftyp1i;
label define fhftyp1i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage19 fhfage1i;
label define fhfage1i
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp20 fhftyp2j;
label define fhftyp2j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage20 fhfage2j;
label define fhfage2j
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp21 fhftyp2a;
label define fhftyp2a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage21 fhfage2a;
label define fhfage2a
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp22 fhftyp2b;
label define fhftyp2b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage22 fhfage2b;
label define fhfage2b
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp23 fhftyp2c;
label define fhftyp2c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage23 fhfage2c;
label define fhfage2c
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp24 fhftyp2d;
label define fhftyp2d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage24 fhfage2d;
label define fhfage2d
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp25 fhftyp2e;
label define fhftyp2e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage25 fhfage2e;
label define fhfage2e
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp26 fhftyp2f;
label define fhftyp2f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage26 fhfage2f;
label define fhfage2f
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp27 fhftyp2g;
label define fhftyp2g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage27 fhfage2g;
label define fhfage2g
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp28 fhftyp2h;
label define fhftyp2h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage28 fhfage2h;
label define fhfage2h
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp29 fhftyp2i;
label define fhftyp2i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage29 fhfage2i;
label define fhfage2i
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp30 fhftyp3j;
label define fhftyp3j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage30 fhfage3j;
label define fhfage3j
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp31 fhftyp3a;
label define fhftyp3a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhfage31 fhfage3a;
label define fhfage3a
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhftyp32 fhftyp3b;
label define fhftyp3b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmcan   fhmcan; 
label define fhmcan  
	1           "Yes"                           
	2           "No"                            
	3           "Adopted or don't know biological mother"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp1  fhmtyp1l;
label define fhmtyp1l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage1  fhmage1l;
label define fhmage1l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp2  fhmtyp2l;
label define fhmtyp2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage2  fhmage2l;
label define fhmage2l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp3  fhmtyp3l;
label define fhmtyp3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage3  fhmage3l;
label define fhmage3l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp4  fhmtyp4l;
label define fhmtyp4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage4  fhmage4l;
label define fhmage4l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp5  fhmtyp5l;
label define fhmtyp5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage5  fhmage5l;
label define fhmage5l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp6  fhmtyp6l;
label define fhmtyp6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage6  fhmage6l;
label define fhmage6l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp7  fhmtyp7l;
label define fhmtyp7l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage7  fhmage7l;
label define fhmage7l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp8  fhmtyp8l;
label define fhmtyp8l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage8  fhmage8l;
label define fhmage8l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp9  fhmtyp9l;
label define fhmtyp9l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage9  fhmage9l;
label define fhmage9l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp10 fhmtyp1j;
label define fhmtyp1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage10 fhmage1j;
label define fhmage1j
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp11 fhmtyp1a;
label define fhmtyp1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage11 fhmage1a;
label define fhmage1a
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp12 fhmtyp1b;
label define fhmtyp1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage12 fhmage1b;
label define fhmage1b
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp13 fhmtyp1c;
label define fhmtyp1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage13 fhmage1c;
label define fhmage1c
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp14 fhmtyp1d;
label define fhmtyp1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage14 fhmage1d;
label define fhmage1d
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp15 fhmtyp1e;
label define fhmtyp1e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage15 fhmage1e;
label define fhmage1e
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp16 fhmtyp1f;
label define fhmtyp1f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage16 fhmage1f;
label define fhmage1f
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp17 fhmtyp1g;
label define fhmtyp1g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage17 fhmage1g;
label define fhmage1g
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp18 fhmtyp1h;
label define fhmtyp1h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage18 fhmage1h;
label define fhmage1h
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp19 fhmtyp1i;
label define fhmtyp1i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage19 fhmage1i;
label define fhmage1i
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp20 fhmtyp2j;
label define fhmtyp2j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage20 fhmage2j;
label define fhmage2j
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp21 fhmtyp2a;
label define fhmtyp2a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage21 fhmage2a;
label define fhmage2a
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp22 fhmtyp2b;
label define fhmtyp2b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage22 fhmage2b;
label define fhmage2b
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp23 fhmtyp2c;
label define fhmtyp2c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage23 fhmage2c;
label define fhmage2c
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp24 fhmtyp2d;
label define fhmtyp2d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage24 fhmage2d;
label define fhmage2d
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp25 fhmtyp2e;
label define fhmtyp2e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage25 fhmage2e;
label define fhmage2e
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp26 fhmtyp2f;
label define fhmtyp2f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage26 fhmage2f;
label define fhmage2f
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp27 fhmtyp2g;
label define fhmtyp2g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage27 fhmage2g;
label define fhmage2g
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp28 fhmtyp2h;
label define fhmtyp2h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage28 fhmage2h;
label define fhmage2h
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp29 fhmtyp2i;
label define fhmtyp2i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage29 fhmage2i;
label define fhmage2i
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp30 fhmtyp3j;
label define fhmtyp3j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage30 fhmage3j;
label define fhmage3j
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp31 fhmtyp3a;
label define fhmtyp3a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhmage31 fhmage3a;
label define fhmage3a
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhmtyp32 fhmtyp3b;
label define fhmtyp3b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbnum   fhbnum; 
label define fhbnum  
	00          "None"                          
	21          "21+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbcan   fhbcan; 
label define fhbcan  
	00          "None"                          
	21          "21+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp1  fhbtyp1l;
label define fhbtyp1l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman1  fhbman1l;
label define fhbman1l
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage1  fhbage1l;
label define fhbage1l
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp2  fhbtyp2l;
label define fhbtyp2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman2  fhbman2l;
label define fhbman2l
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage2  fhbage2l;
label define fhbage2l
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp3  fhbtyp3l;
label define fhbtyp3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman3  fhbman3l;
label define fhbman3l
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage3  fhbage3l;
label define fhbage3l
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp4  fhbtyp4l;
label define fhbtyp4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman4  fhbman4l;
label define fhbman4l
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage4  fhbage4l;
label define fhbage4l
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp5  fhbtyp5l;
label define fhbtyp5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman5  fhbman5l;
label define fhbman5l
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage5  fhbage5l;
label define fhbage5l
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp6  fhbtyp6l;
label define fhbtyp6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman6  fhbman6l;
label define fhbman6l
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage6  fhbage6l;
label define fhbage6l
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp7  fhbtyp7l;
label define fhbtyp7l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman7  fhbman7l;
label define fhbman7l
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage7  fhbage7l;
label define fhbage7l
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp8  fhbtyp8l;
label define fhbtyp8l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman8  fhbman8l;
label define fhbman8l
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage8  fhbage8l;
label define fhbage8l
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp9  fhbtyp9l;
label define fhbtyp9l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman9  fhbman9l;
label define fhbman9l
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage9  fhbage9l;
label define fhbage9l
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp10 fhbtyp1j;
label define fhbtyp1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman10 fhbman1j;
label define fhbman1j
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage10 fhbage1j;
label define fhbage1j
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp11 fhbtyp1a;
label define fhbtyp1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman11 fhbman1a;
label define fhbman1a
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage11 fhbage1a;
label define fhbage1a
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp12 fhbtyp1b;
label define fhbtyp1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman12 fhbman1b;
label define fhbman1b
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage12 fhbage1b;
label define fhbage1b
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp13 fhbtyp1c;
label define fhbtyp1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman13 fhbman1c;
label define fhbman1c
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage13 fhbage1c;
label define fhbage1c
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp14 fhbtyp1d;
label define fhbtyp1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman14 fhbman1d;
label define fhbman1d
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage14 fhbage1d;
label define fhbage1d
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp15 fhbtyp1e;
label define fhbtyp1e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman15 fhbman1e;
label define fhbman1e
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage15 fhbage1e;
label define fhbage1e
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp16 fhbtyp1f;
label define fhbtyp1f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman16 fhbman1f;
label define fhbman1f
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage16 fhbage1f;
label define fhbage1f
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp17 fhbtyp1g;
label define fhbtyp1g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman17 fhbman1g;
label define fhbman1g
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage17 fhbage1g;
label define fhbage1g
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp18 fhbtyp1h;
label define fhbtyp1h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman18 fhbman1h;
label define fhbman1h
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage18 fhbage1h;
label define fhbage1h
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp19 fhbtyp1i;
label define fhbtyp1i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman19 fhbman1i;
label define fhbman1i
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage19 fhbage1i;
label define fhbage1i
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp20 fhbtyp2j;
label define fhbtyp2j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman20 fhbman2j;
label define fhbman2j
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage20 fhbage2j;
label define fhbage2j
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp21 fhbtyp2a;
label define fhbtyp2a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman21 fhbman2a;
label define fhbman2a
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage21 fhbage2a;
label define fhbage2a
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp22 fhbtyp2b;
label define fhbtyp2b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman22 fhbman2b;
label define fhbman2b
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage22 fhbage2b;
label define fhbage2b
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp23 fhbtyp2c;
label define fhbtyp2c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman23 fhbman2c;
label define fhbman2c
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage23 fhbage2c;
label define fhbage2c
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp24 fhbtyp2d;
label define fhbtyp2d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman24 fhbman2d;
label define fhbman2d
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage24 fhbage2d;
label define fhbage2d
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp25 fhbtyp2e;
label define fhbtyp2e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman25 fhbman2e;
label define fhbman2e
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage25 fhbage2e;
label define fhbage2e
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp26 fhbtyp2f;
label define fhbtyp2f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman26 fhbman2f;
label define fhbman2f
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage26 fhbage2f;
label define fhbage2f
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp27 fhbtyp2g;
label define fhbtyp2g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman27 fhbman2g;
label define fhbman2g
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage27 fhbage2g;
label define fhbage2g
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp28 fhbtyp2h;
label define fhbtyp2h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman28 fhbman2h;
label define fhbman2h
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage28 fhbage2h;
label define fhbage2h
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp29 fhbtyp2i;
label define fhbtyp2i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman29 fhbman2i;
label define fhbman2i
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage29 fhbage2i;
label define fhbage2i
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp30 fhbtyp3j;
label define fhbtyp3j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman30 fhbman3j;
label define fhbman3j
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage30 fhbage3j;
label define fhbage3j
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp31 fhbtyp3a;
label define fhbtyp3a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhbman31 fhbman3a;
label define fhbman3a
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbage31 fhbage3a;
label define fhbage3a
	00          "None"                          
	21          "21+ brothers"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhbtyp32 fhbtyp3b;
label define fhbtyp3b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsnum   fhsnum; 
label define fhsnum  
	00          "None"                          
	21          "21+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhscan   fhscan; 
label define fhscan  
	00          "None"                          
	21          "21+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp1  fhstyp1l;
label define fhstyp1l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman1  fhsman1l;
label define fhsman1l
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage1  fhsage1l;
label define fhsage1l
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp2  fhstyp2l;
label define fhstyp2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman2  fhsman2l;
label define fhsman2l
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage2  fhsage2l;
label define fhsage2l
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp3  fhstyp3l;
label define fhstyp3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman3  fhsman3l;
label define fhsman3l
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage3  fhsage3l;
label define fhsage3l
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp4  fhstyp4l;
label define fhstyp4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman4  fhsman4l;
label define fhsman4l
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage4  fhsage4l;
label define fhsage4l
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp5  fhstyp5l;
label define fhstyp5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman5  fhsman5l;
label define fhsman5l
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage5  fhsage5l;
label define fhsage5l
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp6  fhstyp6l;
label define fhstyp6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman6  fhsman6l;
label define fhsman6l
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage6  fhsage6l;
label define fhsage6l
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp7  fhstyp7l;
label define fhstyp7l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman7  fhsman7l;
label define fhsman7l
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage7  fhsage7l;
label define fhsage7l
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp8  fhstyp8l;
label define fhstyp8l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman8  fhsman8l;
label define fhsman8l
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage8  fhsage8l;
label define fhsage8l
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp9  fhstyp9l;
label define fhstyp9l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman9  fhsman9l;
label define fhsman9l
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage9  fhsage9l;
label define fhsage9l
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp10 fhstyp1j;
label define fhstyp1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman10 fhsman1j;
label define fhsman1j
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage10 fhsage1j;
label define fhsage1j
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp11 fhstyp1a;
label define fhstyp1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman11 fhsman1a;
label define fhsman1a
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage11 fhsage1a;
label define fhsage1a
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp12 fhstyp1b;
label define fhstyp1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman12 fhsman1b;
label define fhsman1b
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage12 fhsage1b;
label define fhsage1b
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp13 fhstyp1c;
label define fhstyp1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman13 fhsman1c;
label define fhsman1c
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage13 fhsage1c;
label define fhsage1c
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp14 fhstyp1d;
label define fhstyp1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman14 fhsman1d;
label define fhsman1d
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage14 fhsage1d;
label define fhsage1d
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp15 fhstyp1e;
label define fhstyp1e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman15 fhsman1e;
label define fhsman1e
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage15 fhsage1e;
label define fhsage1e
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp16 fhstyp1f;
label define fhstyp1f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman16 fhsman1f;
label define fhsman1f
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage16 fhsage1f;
label define fhsage1f
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp17 fhstyp1g;
label define fhstyp1g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman17 fhsman1g;
label define fhsman1g
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage17 fhsage1g;
label define fhsage1g
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp18 fhstyp1h;
label define fhstyp1h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman18 fhsman1h;
label define fhsman1h
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage18 fhsage1h;
label define fhsage1h
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp19 fhstyp1i;
label define fhstyp1i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman19 fhsman1i;
label define fhsman1i
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage19 fhsage1i;
label define fhsage1i
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp20 fhstyp2j;
label define fhstyp2j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman20 fhsman2j;
label define fhsman2j
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage20 fhsage2j;
label define fhsage2j
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp21 fhstyp2a;
label define fhstyp2a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman21 fhsman2a;
label define fhsman2a
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage21 fhsage2a;
label define fhsage2a
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp22 fhstyp2b;
label define fhstyp2b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman22 fhsman2b;
label define fhsman2b
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage22 fhsage2b;
label define fhsage2b
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp23 fhstyp2c;
label define fhstyp2c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman23 fhsman2c;
label define fhsman2c
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage23 fhsage2c;
label define fhsage2c
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp24 fhstyp2d;
label define fhstyp2d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman24 fhsman2d;
label define fhsman2d
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage24 fhsage2d;
label define fhsage2d
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp25 fhstyp2e;
label define fhstyp2e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman25 fhsman2e;
label define fhsman2e
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage25 fhsage2e;
label define fhsage2e
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp26 fhstyp2f;
label define fhstyp2f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman26 fhsman2f;
label define fhsman2f
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage26 fhsage2f;
label define fhsage2f
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp27 fhstyp2g;
label define fhstyp2g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman27 fhsman2g;
label define fhsman2g
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage27 fhsage2g;
label define fhsage2g
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp28 fhstyp2h;
label define fhstyp2h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman28 fhsman2h;
label define fhsman2h
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage28 fhsage2h;
label define fhsage2h
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp29 fhstyp2i;
label define fhstyp2i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman29 fhsman2i;
label define fhsman2i
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage29 fhsage2i;
label define fhsage2i
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp30 fhstyp3j;
label define fhstyp3j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman30 fhsman3j;
label define fhsman3j
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage30 fhsage3j;
label define fhsage3j
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp31 fhstyp3a;
label define fhstyp3a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhsman31 fhsman3a;
label define fhsman3a
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhsage31 fhsage3a;
label define fhsage3a
	00          "None"                          
	21          "21+ sisters"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhstyp32 fhstyp3b;
label define fhstyp3b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnnum   fhnnum; 
label define fhnnum  
	00          "None"                          
	21          "21+ biological sons"           
	96          "No biological children"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhncan   fhncan; 
label define fhncan  
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp1  fhntyp1l;
label define fhntyp1l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman1  fhnman1l;
label define fhnman1l
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage1  fhnage1l;
label define fhnage1l
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp2  fhntyp2l;
label define fhntyp2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman2  fhnman2l;
label define fhnman2l
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage2  fhnage2l;
label define fhnage2l
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp3  fhntyp3l;
label define fhntyp3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman3  fhnman3l;
label define fhnman3l
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage3  fhnage3l;
label define fhnage3l
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp4  fhntyp4l;
label define fhntyp4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman4  fhnman4l;
label define fhnman4l
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage4  fhnage4l;
label define fhnage4l
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp5  fhntyp5l;
label define fhntyp5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman5  fhnman5l;
label define fhnman5l
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage5  fhnage5l;
label define fhnage5l
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp6  fhntyp6l;
label define fhntyp6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman6  fhnman6l;
label define fhnman6l
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage6  fhnage6l;
label define fhnage6l
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp7  fhntyp7l;
label define fhntyp7l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman7  fhnman7l;
label define fhnman7l
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage7  fhnage7l;
label define fhnage7l
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp8  fhntyp8l;
label define fhntyp8l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman8  fhnman8l;
label define fhnman8l
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage8  fhnage8l;
label define fhnage8l
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp9  fhntyp9l;
label define fhntyp9l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman9  fhnman9l;
label define fhnman9l
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage9  fhnage9l;
label define fhnage9l
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp10 fhntyp1j;
label define fhntyp1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman10 fhnman1j;
label define fhnman1j
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage10 fhnage1j;
label define fhnage1j
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp11 fhntyp1a;
label define fhntyp1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman11 fhnman1a;
label define fhnman1a
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage11 fhnage1a;
label define fhnage1a
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp12 fhntyp1b;
label define fhntyp1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman12 fhnman1b;
label define fhnman1b
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage12 fhnage1b;
label define fhnage1b
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp13 fhntyp1c;
label define fhntyp1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman13 fhnman1c;
label define fhnman1c
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage13 fhnage1c;
label define fhnage1c
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp14 fhntyp1d;
label define fhntyp1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman14 fhnman1d;
label define fhnman1d
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage14 fhnage1d;
label define fhnage1d
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp15 fhntyp1e;
label define fhntyp1e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman15 fhnman1e;
label define fhnman1e
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage15 fhnage1e;
label define fhnage1e
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp16 fhntyp1f;
label define fhntyp1f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman16 fhnman1f;
label define fhnman1f
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage16 fhnage1f;
label define fhnage1f
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp17 fhntyp1g;
label define fhntyp1g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman17 fhnman1g;
label define fhnman1g
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage17 fhnage1g;
label define fhnage1g
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp18 fhntyp1h;
label define fhntyp1h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman18 fhnman1h;
label define fhnman1h
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage18 fhnage1h;
label define fhnage1h
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp19 fhntyp1i;
label define fhntyp1i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman19 fhnman1i;
label define fhnman1i
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage19 fhnage1i;
label define fhnage1i
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp20 fhntyp2j;
label define fhntyp2j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman20 fhnman2j;
label define fhnman2j
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage20 fhnage2j;
label define fhnage2j
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp21 fhntyp2a;
label define fhntyp2a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman21 fhnman2a;
label define fhnman2a
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage21 fhnage2a;
label define fhnage2a
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp22 fhntyp2b;
label define fhntyp2b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman22 fhnman2b;
label define fhnman2b
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage22 fhnage2b;
label define fhnage2b
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp23 fhntyp2c;
label define fhntyp2c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman23 fhnman2c;
label define fhnman2c
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage23 fhnage2c;
label define fhnage2c
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp24 fhntyp2d;
label define fhntyp2d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman24 fhnman2d;
label define fhnman2d
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage24 fhnage2d;
label define fhnage2d
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp25 fhntyp2e;
label define fhntyp2e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman25 fhnman2e;
label define fhnman2e
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage25 fhnage2e;
label define fhnage2e
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp26 fhntyp2f;
label define fhntyp2f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman26 fhnman2f;
label define fhnman2f
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage26 fhnage2f;
label define fhnage2f
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp27 fhntyp2g;
label define fhntyp2g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman27 fhnman2g;
label define fhnman2g
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage27 fhnage2g;
label define fhnage2g
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp28 fhntyp2h;
label define fhntyp2h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman28 fhnman2h;
label define fhnman2h
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage28 fhnage2h;
label define fhnage2h
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp29 fhntyp2i;
label define fhntyp2i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman29 fhnman2i;
label define fhnman2i
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage29 fhnage2i;
label define fhnage2i
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp30 fhntyp3j;
label define fhntyp3j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman30 fhnman3j;
label define fhnman3j
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage30 fhnage3j;
label define fhnage3j
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp31 fhntyp3a;
label define fhntyp3a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhnman31 fhnman3a;
label define fhnman3a
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhnage31 fhnage3a;
label define fhnage3a
	00          "None"                          
	21          "21+ sons"                      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhntyp32 fhntyp3b;
label define fhntyp3b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdnum   fhdnum; 
label define fhdnum  
	00          "No daughters"                  
	21          "21+ biological daughters"      
	96          "No biological children"        
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdcan   fhdcan; 
label define fhdcan  
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp1  fhdtyp1l;
label define fhdtyp1l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman1  fhdman1l;
label define fhdman1l
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage1  fhdage1l;
label define fhdage1l
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp2  fhdtyp2l;
label define fhdtyp2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman2  fhdman2l;
label define fhdman2l
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage2  fhdage2l;
label define fhdage2l
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp3  fhdtyp3l;
label define fhdtyp3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman3  fhdman3l;
label define fhdman3l
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage3  fhdage3l;
label define fhdage3l
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp4  fhdtyp4l;
label define fhdtyp4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman4  fhdman4l;
label define fhdman4l
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage4  fhdage4l;
label define fhdage4l
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp5  fhdtyp5l;
label define fhdtyp5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman5  fhdman5l;
label define fhdman5l
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage5  fhdage5l;
label define fhdage5l
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp6  fhdtyp6l;
label define fhdtyp6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman6  fhdman6l;
label define fhdman6l
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage6  fhdage6l;
label define fhdage6l
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp7  fhdtyp7l;
label define fhdtyp7l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman7  fhdman7l;
label define fhdman7l
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage7  fhdage7l;
label define fhdage7l
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp8  fhdtyp8l;
label define fhdtyp8l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman8  fhdman8l;
label define fhdman8l
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage8  fhdage8l;
label define fhdage8l
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp9  fhdtyp9l;
label define fhdtyp9l
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman9  fhdman9l;
label define fhdman9l
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage9  fhdage9l;
label define fhdage9l
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp10 fhdtyp1j;
label define fhdtyp1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman10 fhdman1j;
label define fhdman1j
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage10 fhdage1j;
label define fhdage1j
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp11 fhdtyp1a;
label define fhdtyp1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman11 fhdman1a;
label define fhdman1a
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage11 fhdage1a;
label define fhdage1a
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp12 fhdtyp1b;
label define fhdtyp1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman12 fhdman1b;
label define fhdman1b
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage12 fhdage1b;
label define fhdage1b
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp13 fhdtyp1c;
label define fhdtyp1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman13 fhdman1c;
label define fhdman1c
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage13 fhdage1c;
label define fhdage1c
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp14 fhdtyp1d;
label define fhdtyp1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman14 fhdman1d;
label define fhdman1d
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage14 fhdage1d;
label define fhdage1d
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp15 fhdtyp1e;
label define fhdtyp1e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman15 fhdman1e;
label define fhdman1e
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage15 fhdage1e;
label define fhdage1e
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp16 fhdtyp1f;
label define fhdtyp1f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman16 fhdman1f;
label define fhdman1f
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage16 fhdage1f;
label define fhdage1f
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp17 fhdtyp1g;
label define fhdtyp1g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman17 fhdman1g;
label define fhdman1g
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage17 fhdage1g;
label define fhdage1g
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp18 fhdtyp1h;
label define fhdtyp1h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman18 fhdman1h;
label define fhdman1h
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage18 fhdage1h;
label define fhdage1h
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp19 fhdtyp1i;
label define fhdtyp1i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman19 fhdman1i;
label define fhdman1i
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage19 fhdage1i;
label define fhdage1i
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp20 fhdtyp2j;
label define fhdtyp2j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman20 fhdman2j;
label define fhdman2j
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage20 fhdage2j;
label define fhdage2j
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp21 fhdtyp2a;
label define fhdtyp2a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman21 fhdman2a;
label define fhdman2a
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage21 fhdage2a;
label define fhdage2a
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp22 fhdtyp2b;
label define fhdtyp2b
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman22 fhdman2b;
label define fhdman2b
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage22 fhdage2b;
label define fhdage2b
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp23 fhdtyp2c;
label define fhdtyp2c
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman23 fhdman2c;
label define fhdman2c
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage23 fhdage2c;
label define fhdage2c
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp24 fhdtyp2d;
label define fhdtyp2d
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman24 fhdman2d;
label define fhdman2d
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage24 fhdage2d;
label define fhdage2d
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp25 fhdtyp2e;
label define fhdtyp2e
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman25 fhdman2e;
label define fhdman2e
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage25 fhdage2e;
label define fhdage2e
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp26 fhdtyp2f;
label define fhdtyp2f
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman26 fhdman2f;
label define fhdman2f
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage26 fhdage2f;
label define fhdage2f
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp27 fhdtyp2g;
label define fhdtyp2g
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman27 fhdman2g;
label define fhdman2g
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage27 fhdage2g;
label define fhdage2g
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp28 fhdtyp2h;
label define fhdtyp2h
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman28 fhdman2h;
label define fhdman2h
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage28 fhdage2h;
label define fhdage2h
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp29 fhdtyp2i;
label define fhdtyp2i
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman29 fhdman2i;
label define fhdman2i
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage29 fhdage2i;
label define fhdage2i
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp30 fhdtyp3j;
label define fhdtyp3j
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman30 fhdman3j;
label define fhdman3j
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage30 fhdage3j;
label define fhdage3j
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp31 fhdtyp3a;
label define fhdtyp3a
	1           "Mentioned"                     
	2           "Not mentioned"                 
;
label values fhdman31 fhdman3a;
label define fhdman3a
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdage31 fhdage3a;
label define fhdage3a
	00          "None"                          
	21          "21+ daughters"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fhdtyp32 fhdtyp3b;
label define fhdtyp3b
	1           "Mentioned"                     
	2           "Not mentioned"                 
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
