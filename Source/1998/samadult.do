clear all

log using "$LOG/samadult.log", replace
set mem 1000m

/*------------------------------------------------
  This program reads the 1998 National Health Interview Survey 1998 samadult  Data File
  by Jean Roth Mon Jul  2 15:43:01 EDT 2007
  Please report errors to jroth@nber.org 
  NOTE:  This program is distributed under the GNU GPL.
  See end of this file and http://www.gnu.org/licenses/ for details.
  Run with do nhis1998_samadult
----------------------------------------------- */

/* The following line should contain
   the complete path and name of the raw data file.
   On a PC, use backslashes in paths as in C:\  */

local dat_name "$DAT/1998/samadult.dat"

/* The following line should contain the path to your output '.dta' file */

local dta_name "$OUT/1998/samadult"

/* The following line should contain the path to the data dictionary file */

local dct_name "$COD/1998/nhis1998_samadult.dct"

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
	1998        "1998"                          
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
label values hispan_p hispan_p;
label define hispan_p
	00          "Multiple Hispanic"             
	01          "Puerto Rican"                  
	03          "Mexican-Mexicano"              
	04          "Mexican-American (includes Chicano)"
	05          "Cuban/Cuban-American"          
	06          "Other Latin American"          
	07          "Other Spanish"                 
	08          "Hispanic/Spanish; non-specific type"
	09          "Hispanic/Spanish; type refused"
	10          "Hispanic/Spanish; type not ascertained"
	11          "Hispanic/Spanish; type don't know"
	12          "Not Hispanic/Spanish origin"   
;
label values mrace_p  mrace_p;
label define mrace_p 
	01          "White"                         
	02          "Black/African American"        
	03          "Indian (American) (includes Eskimo; Aleut)"
	06          "Chinese"                       
	07          "Filipino"                      
	12          "Asian Indian"                  
	15          "Other API*"                    
	16          "Other race"                    
	17          "Multiple race"                 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values racerec  racerec;
label define racerec 
	1           "White"                         
	2           "Black"                         
	3           "Other"                         
;
label values race     race;   
label define race    
	1           "White"                         
	2           "Black"                         
	3           "AIAN*"                         
	4           "API*"                          
	5           "Other"                         
	6           "Multiple race"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hispcode hispcode;
label define hispcode
	1           "Hispanic"                      
	2           "Non-Hispanic White"            
	3           "Non-Hispanic Black"            
	4           "Non-Hispanic Other"            
;
label values educ     educ;   
label define educ    
	00          "Never attended/ kindergarten only"
	12          "12th grade; no diploma"        
	13          "HIGH SCHOOL GRADUATE"          
	14          "GED or equivalent"             
	15          "Some college; no degree"       
	16          "AA degree: technical or vocational"
	17          "AA degree: academic program"   
	18          "Bachelor's degree (BA; AB; BS; BBA)"
	19          "Master's degree (MA; MS; MEng; MEd; MBA)"
	20          "Professional degree (MD; DDS; DVM; JD)"
	21          "Doctoral degree (PhD; EdD)"    
	96          "Child under 5 years old"       
	97          "Refused"                       
	98          "Not Ascertained"               
	99          "Don't know"                    
;
label values ab_bl20k ab_bl20k;
label define ab_bl20k
	01          "$20;000 or more"               
	02          "Less than $20;000"             
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
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
	1           "5;000;000 or more"             
	2           "2;500;000 - 4;999;999"         
	3           "1;000;000 - 2;499;999"         
	4           "500;000 - 999;999"             
	5           "250;000 - 499;999"             
	6           "Under 250;000"                 
	7           "Non-MSA"                       
;
label values dummy_ap dummy_ap;
label define dummy_ap
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
label values cnkind2  cnkind2l;
label define cnkind2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind3  cnkind3l;
label define cnkind3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind4  cnkind4l;
label define cnkind4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind5  cnkind5l;
label define cnkind5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind6  cnkind6l;
label define cnkind6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind7  cnkind7l;
label define cnkind7l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind8  cnkind8l;
label define cnkind8l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind9  cnkind9l;
label define cnkind9l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind10 cnkind1j;
label define cnkind1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind11 cnkind1a;
label define cnkind1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind12 cnkind1b;
label define cnkind1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind13 cnkind1c;
label define cnkind1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind14 cnkind1d;
label define cnkind1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind15 cnkind1e;
label define cnkind1e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind16 cnkind1f;
label define cnkind1f
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind17 cnkind1g;
label define cnkind1g
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind18 cnkind1h;
label define cnkind1h
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind19 cnkind1i;
label define cnkind1i
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind20 cnkind2j;
label define cnkind2j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind21 cnkind2a;
label define cnkind2a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind22 cnkind2b;
label define cnkind2b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind23 cnkind2c;
label define cnkind2c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind24 cnkind2d;
label define cnkind2d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind25 cnkind2e;
label define cnkind2e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind26 cnkind2f;
label define cnkind2f
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind27 cnkind2g;
label define cnkind2g
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind28 cnkind2h;
label define cnkind2h
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind29 cnkind2i;
label define cnkind2i
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind30 cnkind3j;
label define cnkind3j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cnkind31 cnkind3a;
label define cnkind3a
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
label values canage2  canage2l;
label define canage2l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage3  canage3l;
label define canage3l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage4  canage4l;
label define canage4l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage5  canage5l;
label define canage5l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage6  canage6l;
label define canage6l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage7  canage7l;
label define canage7l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage8  canage8l;
label define canage8l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage9  canage9l;
label define canage9l
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage10 canage1j;
label define canage1j
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage11 canage1a;
label define canage1a
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage12 canage1b;
label define canage1b
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage13 canage1c;
label define canage1c
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage14 canage1d;
label define canage1d
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage15 canage1e;
label define canage1e
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage16 canage1f;
label define canage1f
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage17 canage1g;
label define canage1g
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage18 canage1h;
label define canage1h
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage19 canage1i;
label define canage1i
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage20 canage2j;
label define canage2j
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage21 canage2a;
label define canage2a
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage22 canage2b;
label define canage2b
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage23 canage2c;
label define canage2c
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage24 canage2d;
label define canage2d
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage25 canage2e;
label define canage2e
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage26 canage2f;
label define canage2f
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage27 canage2g;
label define canage2g
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage28 canage2h;
label define canage2h
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage29 canage2i;
label define canage2i
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
;
label values canage30 canage3j;
label define canage3j
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't Know"                    
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
label values uppert   uppert; 
label define uppert  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lowert   lowert; 
label define lowert  
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
	1           "No job last week; had job past 12 m"
	2           "No job last week; no job past 12 m"
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
	1           "Limited; caused by at least one chronic cond"
	2           "Limited; not caused by chronic cond"
	3           "Limited; unk if cond causing LA is chronic"
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
	4           "Smoker; current status unknown"
	9           "Unknown if ever smoked"        
;
label values smkstat2 smkstatb;
label define smkstatb
	1           "Current every day smoker"      
	2           "Current some day smoker"       
	3           "Former smoker"                 
	4           "Never  smoker"                 
	5           "Smoker; current status unknown"
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
	7           "Smoker; current status unknown"
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
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sourcela sourcela;
label define sourcela
	01          "Same sorc sk care & rout care" 
	02          "Sorc sk care; no sorc rout care"
	03          "Sorc sk & rout care; no/unk same sorc"
	04          "Sorc sk care; unk sorc rout care"
	05          "GE2 sorc sk care; 1 is sorc rout care"
	06          "GE2 sorc sk care; no sorc rout care"
	07          "GE2 sorc sk & rout care; no/unk if same"
	08          "GE2 sorc sk care; unk sorc rout care"
	09          "No sorc sk care or rout care"  
	10          "No sorc sk care; has sorc rout care"
	11          "No sorc sk care; unk sorc rout care"
	12          "Unk sorc sk care; no sorc rout care"
	13          "Unk sorc sk care; has sorc rout care"
	14          "Unk sorc sk care or sorc rout care"
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
label values adenlong adenlong;
label define adenlong
	1           "6 Months or less"              
	2           "More than 6 mos; but not more than 1 yr ago"
	3           "More than 1 yr; but not more than 3 yrs ago"
	4           "More than 3 years"             
	5           "Never"                         
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
label values amdlong  amdlong;
label define amdlong 
	1           "6 months or less"              
	2           "More than 6 mos; but not more than 1 yr ago"
	3           "More than 1 yr; but not more than 3 yrs ago"
	4           "More than 3 years"             
	5           "Never"                         
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
save `dta_name',replace
log close

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
