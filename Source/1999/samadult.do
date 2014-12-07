clear all

global DAT "~/database/NHIS/Data/raw/1999"
global OUT "~/database/NHIS/Data/dta/1999"
global LOG "~/database/NHIS/Log"
global COD "~/database/NHIS/Source/1999"

log using "$LOG/samadult.log", replace
set mem 1000m

/*------------------------------------------------
  This program reads the 1999 National Health Interview Survey 1999 samadult  Data File
  by Jean Roth Mon Jul  2 15:43:32 EDT 2007
  Please report errors to jroth@nber.org 
  NOTE:  This program is distributed under the GNU GPL.
  See end of this file and http://www.gnu.org/licenses/ for details.
  Run with do nhis1999_samadult
----------------------------------------------- */

/* The following line should contain
   the complete path and name of the raw data file.
   On a PC, use backslashes in paths as in C:\  */

local dat_name "~/database/NHIS/Data/raw/1999/samadult.dat"

/* The following line should contain the path to your output '.dta' file */

local dta_name "~/database/NHIS/Data/dta/1999/samadult"

/* The following line should contain the path to the data dictionary file */

local dct_name "$COD/nhis1999_samadult.dct"

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
	1999        "1999"                          
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
label values origin   origin; 
label define origin  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hispancr hispancr;
label define hispancr
	00          "Multiple Hispanic"             
	01          "Puerto Rican"                  
	02          "Mexican"                       
	03          "Mexican-American"              
	04          "Cuban/Cuban American"          
	05          "Dominican (Republic)"          
	06          "Central or South American"     
	07          "Other Latin American, type not specified"
	08          "Other spanish"                 
	09          "Hispanic/Latino/Spanish, non-specific type"
	10          "Hispanic/Latino/Spanish, type refused"
	11          "Hispanic/Latino/Spanish, type not ascertained"
	12          "Not Hispanic/Spanish origin"   
;
label values racdet_p racdet_p;
label define racdet_p
	01          "White only"                    
	02          "Black/African American only"   
	03          "AIAN only"                     
	09          "Asian Indian only"             
	10          "Chinese only"                  
	11          "Filipino only"                 
	15          "Other Asian only"              
	16          "Other race only"               
	17          "Multiple detailed race*"       
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rc_sum_p rc_sum_p;
label define rc_sum_p
	01          "White only"                    
	02          "Black/African American only"   
	03          "AIAN only*"                    
	04          "Asian only"                    
	05          "Other race only"               
	06          "Multiple detailed race only"   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values racer_p  racer_p;
label define racer_p 
	01          "White only"                    
	02          "Black/African American only"   
	03          "AIAN* only"                    
	04          "Asian only"                    
	05          "Other race only"               
	06          "Multiple race"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rcimpfgr rcimpfgr;
label define rcimpfgr
	1           "Race imputed"                  
	2           "Race given by respondent/proxy"
;
label values mracer_p mracer_p;
label define mracer_p
	01          "White"                         
	02          "Black/African American"        
	03          "Indian (American), Alaska Native"
	09          "Asian Indian"                  
	10          "Chinese"                       
	11          "Filipino"                      
	15          "Other Asian*"                  
	16          "Other Race*"                   
	17          "Multiple Race*"                
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mracbr_p mracbr_p;
label define mracbr_p
	01          "White"                         
	02          "Black/African American"        
	03          "Indian (American) (includes Eskimo, Aleut)"
	06          "Chinese"                       
	07          "Filipino"                      
	12          "Asian Indian"                  
	16          "Other race"                    
	17          "Multiple race"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values racerecr racerecr;
label define racerecr
	1           "White"                         
	2           "Black"                         
	3           "Other"                         
;
label values hispcodr hispcodr;
label define hispcodr
	1           "Hispanic"                      
	2           "Non-Hispanic White"            
	3           "Non-Hispanic Black"            
	4           "Non-Hispanic Other"            
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
label values hypmedev hypmedev;
label define hypmedev
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hypmed   hypmed; 
label define hypmed  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hybpckno hybpckno;
label define hybpckno
	00          "Never"                         
	95          "95+"                           
	97          "Refused *"                     
	98          "Not ascertained"               
	99          "Don't know *"                  
;
label values hybpcktp hybpcktp;
label define hybpcktp
	0           "Never"                         
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hybpckyr hybpckyr;
label define hybpckyr
	00          "Less than 1 year"              
	85          "85+ years"                     
	96          "Never"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values hybplev  hybplev;
label define hybplev 
	1           "Not told"                      
	2           "High"                          
	3           "Normal"                        
	4           "Low"                           
	5           "Borderline"                    
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
label values miage    miage;  
label define miage   
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values hrtev    hrtev;  
label define hrtev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values con      con;    
label define con     
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
label values ost      ost;    
label define ost     
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values par      par;    
label define par     
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
label values aasmhos  aasmhos;
label define aasmhos 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aashont  aashont;
label define aashont 
	1           "1"                             
	2           "2-3"                           
	3           "4-9"                           
	4           "10-12"                         
	5           "13+"                           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aasmotc  aasmotc;
label define aasmotc 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aasmpmed aasmpmed;
label define aasmpmed
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aasmcan  aasmcan;
label define aasmcan 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values aasclass aasclass;
label define aasclass
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values awz      awz;    
label define awz     
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values awznum   awznum; 
label define awznum  
	95          "95+ attacks"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values awzslp   awzslp; 
label define awzslp  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values awzspl   awzspl; 
label define awzspl  
	1           "Less than one time per week"   
	2           "One time per week"             
	3           "More than one time per week"   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values awzex    awzex;  
label define awzex   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values awzspc   awzspc; 
label define awzspc  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values awzeryr  awzeryr;
label define awzeryr 
	000         "None"                          
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values awzla    awzla;  
label define awzla   
	1           "Not at all"                    
	2           "A little"                      
	3           "A fair amount"                 
	4           "A moderate amount"             
	5           "A lot"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values awzmswk  awzmswk;
label define awzmswk 
	0           "None"                          
	1           "1-7"                           
	2           "8-30"                          
	3           "31+"                           
	4           "Does not work/go to school"    
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
label values ulcerage ulcerage;
label define ulcerage
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values ulcyr    ulcyr;  
label define ulcyr   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ulccolev ulccolev;
label define ulccolev
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chronage chronage;
label define chronage
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values ulccolyr ulccolyr;
label define ulccolyr
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
	83          "83+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values difage   difage; 
label define difage  
	00          "Within past year"              
	85          "85+ years"                     
	96          "1+ year(s) with diabetes and age is 85+"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values dib12mo  dib12mo;
label define dib12mo 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values dib3mo   dib3mo; 
label define dib3mo  
	1           "3 months ago or less"          
	2           "More than 3 months ago, but not more than 6 m"
	3           "More than 6 months ago, but not more than 9 m"
	4           "More than 9 months ago, but not more than 12 m"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
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
label values dibclass dibclass;
label define dibclass
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values diba1ckn diba1ckn;
label define diba1ckn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values diba1cck diba1cck;
label define diba1cck
	00          "None"                          
	53          "53+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values dibftck  dibftck;
label define dibftck 
	00          "None"                          
	53          "53+ times"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values dibeyckl dibeyckl;
label define dibeyckl
	1           "Less than 1 month"             
	2           "1 to 12 months"                
	3           "13 to 24 months"               
	4           "More than 2 years"             
	5           "Never"                         
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
label values kstyr    kstyr;  
label define kstyr   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ctsyr    ctsyr;  
label define ctsyr   
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
label values jnt_rh   jnt_rh; 
label define jnt_rh  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jnt_ost  jnt_ost;
label define jnt_ost 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jnt_oa   jnt_oa; 
label define jnt_oa  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jnt_gout jnt_gout;
label define jnt_gout
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jnt_burs jnt_burs;
label define jnt_burs
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jnt_oc   jnt_oc; 
label define jnt_oc  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jtsteryr jtsteryr;
label define jtsteryr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values jtstermo jtstermo;
label define jtstermo
	1           "Yes"                           
	2           "No"                            
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
label values acld2wmd acld2wmd;
label define acld2wmd
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
label values aintilmd aintilmd;
label define aintilmd
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
label values mnyr     mnyr;   
label define mnyr    
	1           "Yes"                           
	2           "No"                            
	3           "Never had a menstrual period"  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mn3mo    mn3mo;  
label define mn3mo   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mnreg    mnreg;  
label define mnreg   
	1           "More regular"                  
	2           "Less regular"                  
	3           "About the same"                
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mnflow   mnflow; 
label define mnflow  
	1           "Lighter"                       
	2           "About the same"                
	3           "Heavier"                       
	4           "More variable"                 
	5           "Has stopped"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values menage   menage; 
label define menage  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values mnage2   mnage2l;
label define mnage2l 
	01          "Younger than 20"               
	02          "20-29"                         
	03          "30-39"                         
	04          "40-44"                         
	05          "45-49"                         
	06          "50-54"                         
	07          "55 or older"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mnhyst   mnhyst; 
label define mnhyst  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hystage  hystage;
label define hystage 
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values mnovar   mnovar; 
label define mnovar  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ovaryage ovaryage;
label define ovaryage
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values mnhtflsh mnhtflsh;
label define mnhtflsh
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mnhmrpmd mnhmrpmd;
label define mnhmrpmd
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mnestev  mnestev;
label define mnestev 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mnestnow mnestnow;
label define mnestnow
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mnestlno mnestlno;
label define mnestlno
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained*"              
	99          "Don't know"                    
;
label values mnestltp mnestltp;
label define mnestltp
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mnestlyr mnestlyr;
label define mnestlyr
	00          "00 Less than 1 year"           
	71          "71+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values estroage estroage;
label define estroage
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values estflg   estflg; 
label define estflg  
	0           "No age/time period inconsistency"
	1           "ESTROAGE acceptable, time period = NA"
	2           "Time period acceptable, ESTROAGE = NA"
;
label values mnpgsev  mnpgsev;
label define mnpgsev 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mnpgsnow mnpgsnow;
label define mnpgsnow
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mnpgslno mnpgslno;
label define mnpgslno
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained*"              
	99          "Don't know"                    
;
label values mnpgsltp mnpgsltp;
label define mnpgsltp
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mnpgslyr mnpgslyr;
label define mnpgslyr
	00          "00 Less than 1 year"           
	71          "71+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values progeage progeage;
label define progeage
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values progflg  progflg;
label define progflg 
	0           "No age/time period inconsistency"
	1           "PROGEAGE acceptable, time period = NA"
	2           "Time period acceptable, PROGEAGE = NA"
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
label values hearlft  hearlft;
label define hearlft 
	1           "Good"                          
	2           "Little trouble"                
	3           "Lot of trouble"                
	4           "Deaf"                          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hearlage hearlage;
label define hearlage
	1           "At birth"                      
	2           "Less than 3 years old"         
	3           "Over three but less than 19 years old"
	4           "19 and over but less than 45 years old"
	5           "45 and over but less than 65 years old"
	6           "65 and over"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hearrgt  hearrgt;
label define hearrgt 
	1           "Good"                          
	2           "Little trouble"                
	3           "Lot of trouble"                
	4           "Deaf"                          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hearrage hearrage;
label define hearrage
	1           "At birth"                      
	2           "Less than 3 years old"         
	3           "Over three but less than 19 years old"
	4           "19 and over but less than 45 years old"
	5           "45 and over but less than 65 years old"
	6           "65 and over"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values heardage heardage;
label define heardage
	1           "At birth"                      
	2           "Less than 3 years old"         
	3           "Over three but less than 19 years old"
	4           "19 and over but less than 45 years old"
	5           "45 and over but less than 65 years old"
	6           "65 and over"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hearwhis hearwhis;
label define hearwhis
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hearvoic hearvoic;
label define hearvoic
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hearsht  hearsht;
label define hearsht 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hearskld hearskld;
label define hearskld
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aviscat  aviscat;
label define aviscat 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values avisglau avisglau;
label define avisglau
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values avismacd avismacd;
label define avismacd
	1           "Yes"                           
	2           "No"                            
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
label values nws      nws;    
label define nws     
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cls      cls;    
label define cls     
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values nit      nit;    
label define nit     
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values drv      drv;    
label define drv     
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values per      per;    
label define per     
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values crd      crd;    
label define crd     
	0           "Not at all difficult"          
	1           "Only a little difficult"       
	2           "Somewhat difficult"            
	3           "Very difficult"                
	4           "Can't do at all"               
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
label values mhfemo   mhfemo; 
label define mhfemo  
	1           "More often"                    
	2           "Less often"                    
	3           "About the same"                
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhfemomr mhfemomr;
label define mhfemomr
	1           "A lot more"                    
	2           "Somewhat more"                 
	3           "A little more"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhfemols mhfemols;
label define mhfemols
	1           "A lot less"                    
	2           "Somewhat less"                 
	3           "A little less"                 
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
label values mhfenwk  mhfenwk;
label define mhfenwk 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhfecda  mhfecda;
label define mhfecda 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhdsad2w mhdsad2w;
label define mhdsad2w
	1           "Yes"                           
	2           "No"                            
	3           "Volunteered: 'I was on medication...'"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsaddy mhdsaddy;
label define mhdsaddy
	1           "All day long"                  
	2           "Most of the day"               
	3           "About half of the day"         
	4           "Less than half of the day"     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadlo mhdsadlo;
label define mhdsadlo
	1           "Every day"                     
	2           "Almost every day"              
	3           "Less often"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadli mhdsadli;
label define mhdsadli
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadtd mhdsadtd;
label define mhdsadtd
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadwt mhdsadwt;
label define mhdsadwt
	1           "Gain"                          
	2           "Lose"                          
	3           "Volunteered: 'both gained and lost weight'"
	4           "Stay about the same"           
	5           "Volunteered: 'was on a diet'"  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadwc mhdsadwc;
label define mhdsadwc
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values mhdsadlb mhdsadlb;
label define mhdsadlb
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadsp mhdsadsp;
label define mhdsadsp
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadnt mhdsadnt;
label define mhdsadnt
	1           "Every night"                   
	2           "Nearly every night"            
	3           "Less often"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadcn mhdsadcn;
label define mhdsadcn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadwr mhdsadwr;
label define mhdsadwr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadde mhdsadde;
label define mhdsadde
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadwy mhdsadwy;
label define mhdsadwy
	96          "Entire year"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhdsad_m mhdsad_m;
label define mhdsad_m
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
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhdsad_y mhdsad_y;
label define mhdsad_y
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values mhdsadmd mhdsadmd;
label define mhdsadmd
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadhp mhdsadhp;
label define mhdsadhp
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadac mhdsadac;
label define mhdsadac
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdsadia mhdsadia;
label define mhdsadia
	1           "A lot"                         
	2           "Some"                          
	3           "A little"                      
	4           "Not at all"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdint2w mhdint2w;
label define mhdint2w
	1           "Yes"                           
	2           "No"                            
	3           "Volunteered:'I was on medication...'"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintdy mhdintdy;
label define mhdintdy
	1           "All day long"                  
	2           "Most of the day"               
	3           "About half of the day"         
	4           "Less than half of the day"     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintlo mhdintlo;
label define mhdintlo
	1           "Every day"                     
	2           "Almost every day"              
	3           "Less often"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdinttd mhdinttd;
label define mhdinttd
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintwt mhdintwt;
label define mhdintwt
	1           "Gain"                          
	2           "Lose"                          
	3           "Volunteered: 'both gained and lost weight'"
	4           "Stay about the same"           
	5           "Volunteered: 'was on a diet'"  
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintwc mhdintwc;
label define mhdintwc
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values mhdintlb mhdintlb;
label define mhdintlb
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintsp mhdintsp;
label define mhdintsp
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintnt mhdintnt;
label define mhdintnt
	1           "Every night"                   
	2           "Nearly every night"            
	3           "Less often"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintcn mhdintcn;
label define mhdintcn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintwr mhdintwr;
label define mhdintwr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintde mhdintde;
label define mhdintde
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintwy mhdintwy;
label define mhdintwy
	96          "Entire year"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhdint_m mhdint_m;
label define mhdint_m
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
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhdint_y mhdint_y;
label define mhdint_y
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values mhdintmd mhdintmd;
label define mhdintmd
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdinthp mhdinthp;
label define mhdinthp
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintac mhdintac;
label define mhdintac
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhdintia mhdintia;
label define mhdintia
	1           "A lot"                         
	2           "Some"                          
	3           "A little"                      
	4           "Not at all"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxevyr mhaxevyr;
label define mhaxevyr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxmo   mhaxmo; 
label define mhaxmo  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxl    mhaxl;  
label define mhaxl   
	1           "Ended"                         
	2           "Still going on"                
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxenno mhaxenno;
label define mhaxenno
	95          "95+"                           
	96          "Volunteered:  'All my life...'"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhaxentp mhaxentp;
label define mhaxentp
	1           "Months"                        
	2           "Years"                         
	6           "Volunteered:  'All my life...'"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxenyr mhaxenyr;
label define mhaxenyr
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhaxlnno mhaxlnno;
label define mhaxlnno
	95          "95+"                           
	96          "Volunteered:  'All my life...'"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhaxlntp mhaxlntp;
label define mhaxlntp
	1           "Months"                        
	2           "Years"                         
	6           "Volunteered:  'All my life...'"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxlnyr mhaxlnyr;
label define mhaxlnyr
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhax6mo  mhax6mo;
label define mhax6mo 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxwst  mhaxwst;
label define mhaxwst 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxwdys mhaxwdys;
label define mhaxwdys
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxwi   mhaxwi; 
label define mhaxwi  
	1           "One thing"                     
	2           "More than one thing"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxdst  mhaxdst;
label define mhaxdst 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxw2   mhaxw2l;
label define mhaxw2l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxwstr mhaxwstr;
label define mhaxwstr
	1           "Often"                         
	2           "Sometimes"                     
	3           "Rarely"                        
	4           "Never"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxwcnt mhaxwcnt;
label define mhaxwcnt
	1           "Often"                         
	2           "Sometimes"                     
	3           "Rarely"                        
	4           "Never"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhax_rst mhax_rst;
label define mhax_rst
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhax_edg mhax_edg;
label define mhax_edg
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhax_irr mhax_irr;
label define mhax_irr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhax_htp mhax_htp;
label define mhax_htp
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhax_wtd mhax_wtd;
label define mhax_wtd
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhax_wsp mhax_wsp;
label define mhax_wsp
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhax_wlh mhax_wlh;
label define mhax_wlh
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxwmd  mhaxwmd;
label define mhaxwmd 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxwhp  mhaxwhp;
label define mhaxwhp 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxwac  mhaxwac;
label define mhaxwac 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhaxwitf mhaxwitf;
label define mhaxwitf
	1           "A lot"                         
	2           "Some"                          
	3           "A little"                      
	4           "Not at all"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhpevyr  mhpevyr;
label define mhpevyr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhplfth  mhplfth;
label define mhplfth 
	1           "Yes"                           
	2           "No"                            
	3           "Volunteered: 'was not in life-threatening sit'"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhpnlfth mhpnlfth;
label define mhpnlfth
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhpanyr  mhpanyr;
label define mhpanyr 
	995         "995+ attacks"                  
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values mhpandtm mhpandtm;
label define mhpandtm
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
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mhpandty mhpandty;
label define mhpandty
	9997        "Refused"                       
	9998        "Not ascertained"               
	9999        "Don't know"                    
;
label values mhpnodan mhpnodan;
label define mhpnodan
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhpa_ahp mhpa_ahp;
label define mhpa_ahp
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhpa_cst mhpa_cst;
label define mhpa_cst
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhpa_swt mhpa_swt;
label define mhpa_swt
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhpa_shk mhpa_shk;
label define mhpa_shk
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhpa_fla mhpa_fla;
label define mhpa_fla
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mhpa_unr mhpa_unr;
label define mhpa_unr
	1           "Yes"                           
	2           "No"                            
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
label values aqusl    aqusl;  
label define aqusl   
	1           "1 year or less"                
	2           "More than 1 yr but not more than 3 yrs"
	3           "More than 3 years"             
	4           "Hasn't been there yet"         
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
label values aqhp     aqhp;   
label define aqhp    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aqhpkind aqhpkind;
label define aqhpkind
	1           "Doctor"                        
	2           "Nurse"                         
	3           "Nurse Practitioner"            
	4           "Physician's assistant"         
	5           "Chiropractor"                  
	6           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aqmdgyn  aqmdgyn;
label define aqmdgyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aqmdgs   aqmdgs; 
label define aqmdgs  
	1           "General doctor treats a variety of illnesses"
	2           "Dr specializes med dis/prob (not ob/gyn)"
	3           "Some other kind of doctor"     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aqmdca   aqmdca; 
label define aqmdca  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values onesrcea onesrcea;
label define onesrcea
	1           "Adults with a single source of medical care"
	2           "Adults with no known single source of med care"
	3           "Undefined"                     
;
label values aqhpvi   aqhpvi; 
label define aqhpvi  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aqhprat  aqhprat;
label define aqhprat 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values aqwhynot aqwhynot;
label define aqwhynot
	01          "Seldom or never gets sick"     
	02          "Recently moved into the area"  
	03          "Don't know where to go for care"
	04          "Usual source of care in area not avail"
	05          "Can't find provider who speaks lang"
	06          "Like to go diffnt pls for h/care needs"
	07          "Just changed insurance plans"  
	08          "Don't use doctors/treat myself"
	09          "Cost of medical care"          
	10          "Other reason"                  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values aqhpnhr  aqhpnhr;
label define aqhpnhr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aqhptel  aqhptel;
label define aqhptel 
	1           "Yes"                           
	2           "No"                            
	3           "Provider open 24 hours"        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aqhpsinj aqhpsinj;
label define aqhpsinj
	1           "No appointment necessary"      
	2           "A day or two"                  
	3           "More than 2 days, but not more than 1 wk"
	4           "More than 1 wk, but not more than 2 wks"
	5           "More than 2 wks, but not more than 1 mo"
	6           "More than 1 month"             
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aqhprt   aqhprt; 
label define aqhprt  
	0           "No appointment necessary"      
	1           "Scheduled appointment well in advance"
	2           "A day or two"                  
	3           "More than 2 days, but not more than 1 wk"
	4           "More than 1 wk, but not more than 2 wks"
	5           "More than 2 wks, but not more than 1 mo"
	6           "More than 1 month"             
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aqhpwait aqhpwait;
label define aqhpwait
	1           "30 minutes or less"            
	2           "More than 30 min, but not more than 1 hr"
	3           "More than an hour"             
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aquscsat aquscsat;
label define aquscsat
	96          "No prof staff/provider works alone"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values aqpremed aqpremed;
label define aqpremed
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
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
	8           "Not ascertained"               
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
label values pap      pap;    
label define pap     
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rpap1no  rpap1no;
label define rpap1no 
	00          "Less than one year  *"         
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rpap1tp  rpap1tp;
label define rpap1tp 
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rpap1y   rpap1y; 
label define rpap1y  
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values papflg   papflg; 
label define papflg  
	1           "Time interval given was imputed"
	0           "Time interval not imputed"     
;
label values rpap2    rpap2l; 
label define rpap2l  
	1           "A year ago or less"            
	2           "More than 1 yr but not more than 2 yrs"
	3           "More than 2 yrs but not more than 3 yrs"
	4           "More than 3 yrs but not more than 5 yrs"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values bex      bex;    
label define bex     
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rbex1no  rbex1no;
label define rbex1no 
	00          "Less than one year  *"         
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rbex1tp  rbex1tp;
label define rbex1tp 
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rbex1y   rbex1y; 
label define rbex1y  
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values bexflg   bexflg; 
label define bexflg  
	1           "Time interval given was imputed"
	0           "Time interval not imputed"     
;
label values rbex2    rbex2l; 
label define rbex2l  
	1           "A year ago or less"            
	2           "More than 1 yr but not more than 2 yrs"
	3           "More than 2 yrs but not more than 3 yrs"
	4           "More than 3 yrs but not more than 5 yrs"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mam      mam;    
label define mam     
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rmam1no  rmam1no;
label define rmam1no 
	00          "Less than one year *"          
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rmam1tp  rmam1tp;
label define rmam1tp 
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rmam1y   rmam1y; 
label define rmam1y  
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mamflg   mamflg; 
label define mamflg  
	1           "Time interval given was imputed"
	0           "Time interval not imputed"     
;
label values rmam2    rmam2l; 
label define rmam2l  
	1           "A year ago or less"            
	2           "More than 1 yr but not more than 2 yrs"
	3           "More than 2 yrs but not more than 3 yrs"
	4           "More than 3 yrs but not more than 5 yrs"
	5           "Over 5 years ago"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values psahrd   psahrd; 
label define psahrd  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values psaev    psaev;  
label define psaev   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rpsa1no  rpsa1no;
label define rpsa1no 
	00          "Less than one year  *"         
	95          "95+"                           
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values rpsa1tp  rpsa1tp;
label define rpsa1tp 
	1           "Days"                          
	2           "Weeks"                         
	3           "Months"                        
	4           "Years"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rpsa1y   rpsa1y; 
label define rpsa1y  
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values psaflg   psaflg; 
label define psaflg  
	1           "Time interval given was imputed"
	0           "Time interval not imputed"     
;
label values rpsa2    rpsa2l; 
label define rpsa2l  
	1           "A year ago or less"            
	2           "More than 1 yr but not more than 2 yrs"
	3           "More than 2 yrs but not more than 3 yrs"
	4           "More than 3 yrs but not more than 5 yrs"
	5           "Over 5 years ago"              
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
label values adenreas adenreas;
label define adenreas
	1           "Went on own for checkup/exam/cleaning"
	2           "Called by dentist for checkup/exam/cleaning"
	3           "Something wrong/bothering/hurting"
	4           "Treat cond found at prev checkup/exam"
	5           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno01 adenno0a;
label define adenno0a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno02 adenno0b;
label define adenno0b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno03 adenno0c;
label define adenno0c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno04 adenno0d;
label define adenno0d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno05 adenno0e;
label define adenno0e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno06 adenno0f;
label define adenno0f
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno07 adenno0g;
label define adenno0g
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno08 adenno0h;
label define adenno0h
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno09 adenno0i;
label define adenno0i
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno10 adenno1j;
label define adenno1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno11 adenno1a;
label define adenno1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenno12 adenno1b;
label define adenno1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adenvis  adenvis;
label define adenvis 
	95          "95+ visits"                    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values aden2w   aden2w; 
label define aden2w  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aden2wno aden2wno;
label define aden2wno
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values adenins  adenins;
label define adenins 
	1           "Yes"                           
	2           "No"                            
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
label values ahernoyr ahernoyr;
label define ahernoyr
	0           "None"                          
	1           "1"                             
	2           "2-3"                           
	3           "4-9"                           
	4           "10-12"                         
	5           "13 or more"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values aherreas aherreas;
label define aherreas
	01          "You don't need an appointment there"
	02          "Didn't know where else to go"  
	03          "They won't turn anyone away"   
	04          "No other place was open at that time"
	05          "A doctor said to go there"     
	06          "Life or death situation"       
	07          "Other reason"                  
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
label values ahchnoyr ahchnoyr;
label define ahchnoyr
	1           "1"                             
	2           "2-3"                           
	3           "4-9"                           
	4           "10-12"                         
	5           "13 or more"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcnoyr  ahcnoyr;
label define ahcnoyr 
	0           "None"                          
	1           "1"                             
	2           "2-3"                           
	3           "4-9"                           
	4           "10-12"                         
	5           "13 or more"                    
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
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
label values apmed3mo apmed3mo;
label define apmed3mo
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values apmedreg apmedreg;
label define apmedreg
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
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
label values aqovhc   aqovhc; 
label define aqovhc  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
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
label values shttetyr shttetyr;
label define shttetyr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcacu   ahcacu; 
label define ahcacu  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcrel   ahcrel; 
label define ahcrel  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcmt    ahcmt;  
label define ahcmt   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcima   ahcima; 
label define ahcima  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcspi   ahcspi; 
label define ahcspi  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahclsd   ahclsd; 
label define ahclsd  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahchm    ahchm;  
label define ahchm   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahchome  ahchome;
label define ahchome 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcene   ahcene; 
label define ahcene  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcbio   ahcbio; 
label define ahcbio  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahchyp   ahchyp; 
label define ahchyp  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ahcoth   ahcoth; 
label define ahcoth  
	0           "Yes, not specified"            
	1           "Yes"                           
	2           "No"                            
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
label values aidstst  aidstst;
label define aidstst 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytsu01 whytsu0a;
label define whytsu0a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytsu02 whytsu0b;
label define whytsu0b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytsu03 whytsu0c;
label define whytsu0c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytsu04 whytsu0d;
label define whytsu0d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytsu05 whytsu0e;
label define whytsu0e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytsu06 whytsu0f;
label define whytsu0f
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytsu07 whytsu0g;
label define whytsu0g
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytsu08 whytsu0h;
label define whytsu0h
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytsu09 whytsu0i;
label define whytsu0i
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whytsu10 whytsu1j;
label define whytsu1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tst12m   tst12m; 
label define tst12m  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot01 reatot0a;
label define reatot0a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot02 reatot0b;
label define reatot0b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot03 reatot0c;
label define reatot0c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot04 reatot0d;
label define reatot0d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot05 reatot0e;
label define reatot0e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot06 reatot0f;
label define reatot0f
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot07 reatot0g;
label define reatot0g
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot08 reatot0h;
label define reatot0h
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot09 reatot0i;
label define reatot0i
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot10 reatot1j;
label define reatot1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot11 reatot1a;
label define reatot1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot12 reatot1b;
label define reatot1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values reatot13 reatot1c;
label define reatot1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lastst   lastst; 
label define lastst  
	01          "AIDS clinic/counseling/testing site"
	02          "Community health clinic"       
	03          "Clinic run by employer"        
	04          "STD clinic"                    
	05          "Family planning"               
	06          "Prenatal clinic"               
	07          "Other clinic"                  
	08          "Doctor/HMO"                    
	09          "Hospital/emergency room/outpatient clinic"
	10          "Military induction/separation/military site"
	11          "Immigration site"              
	12          "At home/home visits by nurse/health worker"
	13          "At home - self testing kit"    
	14          "Other location - specify"      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values altst    altst;  
label define altst   
	1           "Yes"                           
	2           "No"                            
	3           "Only notified if there was a problem"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values talkhp   talkhp; 
label define talkhp  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values rsgvn    rsgvn;  
label define rsgvn   
	1           "In person"                     
	2           "By telephone"                  
	3           "By mail"                       
	4           "In some other way"             
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
label values why12u01 why12u0a;
label define why12u0a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u02 why12u0b;
label define why12u0b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u03 why12u0c;
label define why12u0c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u04 why12u0d;
label define why12u0d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u05 why12u0e;
label define why12u0e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u06 why12u0f;
label define why12u0f
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u07 why12u0g;
label define why12u0g
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u08 why12u0h;
label define why12u0h
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u09 why12u0i;
label define why12u0i
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u10 why12u1j;
label define why12u1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u11 why12u1a;
label define why12u1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values why12u12 why12u1b;
label define why12u1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whertst  whertst;
label define whertst 
	01          "AIDS clinic/counseling/testing site"
	02          "Community health clinic"       
	03          "Clinic run by employer"        
	04          "STD clinic"                    
	05          "Family planning"               
	06          "Prenatal clinic"               
	07          "Other clinic"                  
	08          "Doctor/HMO"                    
	09          "Hospital/emergency room/outpatient clinic"
	10          "Military induction/separation/military site"
	11          "Red cross/blood bank/blood drive"
	12          "At home/home visit by nurse/hlth practitioner"
	13          "At home - self testing kit"    
	14          "Other location - specify"      
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
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
	1           "Yes to at least one statement" 
	2           "No to all statements"          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
#delimit cr
save `dta_name' ,replace

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
