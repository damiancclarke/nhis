clear all
log using "$LOG/personsx.log", replace
set mem 1000m

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
    
local dat_name "$DAT/2001/personsx.dat"
local dta_name "$OUT/2001/personsx"
local dct_name "$COD/2001/nhis2001_personsx.dct"
infile using "`dct_name'", using("`dat_name'") clear


#delimit ;

;
destring dob_m dob_y_p hh_ref fm_ref mother father guard, replace
;
encode hhreflg, generate(hhreflg1);
label drop hhreflg1;
label values hhreflg1 hhreflg1;
label define hhreflg1
	2			"HH Reference person"
	8			"Not ascertained"
;
encode fmreflg, generate(fmreflg1);
label drop fmreflg1;
label values fmreflg1 fmreflg1;
label define fmreflg1
	1			"Family reference person"
	8			"Not ascertained"
;
encode fmrpflg, generate(fmrpflg1);
label drop fmrpflg1;
label values fmrpflg1 fmrpflg1;
label define fmrpflg1
	2			"Family respondent"
	8			"Not ascertained"
;
label values rectype  rectype;
label define rectype 
	20          "Person"                        
;
label values srvy_yr  srvy_yr;
label define srvy_yr 
	2001        "2001"                          
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
	85          "85+ years"                     
;
label values r_age1   r_age1;
label define r_age1 
	1           "Under 5 years"                 
	2           "5-17 years"                    
	3           "18-24 years"                   
	4           "25-44 years"                   
	5           "45-64 years"                   
	6           "65-69 years"                   
	7           "70-74 years"                   
	8           "75 years and over"             
;
label values r_age2   r_age2;
label define r_age2 
	1           "Under 6 years"                 
	2           "6-16 years"                    
	3           "17-24 years"                   
	4           "25-34 years"                   
	5           "35-44 years"                   
	6           "45-54 years"                   
	7           "55-64 years"                   
	8           "65-74 years"                   
	9           "75 years and over"
;
label values dob_m		dob_m;
label define dob_m
	01			"January"
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
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't know"
;
label values dob_y_p	dob_y_p;
label define dob_y_p
	1917		"1917 or before"
	9997      "Refused"                       
	9998      "Not ascertained"               
	9999      "Don't know"                    
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
label values cohab1   cohab1l;
label define cohab1l 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values cohab2   cohab2l;
label define cohab2l 
	1           "Married"                       
	2           "Widowed"                       
	3           "Divorced"                      
	4           "Separated"                     
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lg_mstat lg_mstat;
label define lg_mstat
	1           "Married, spouse in household"  
	2           "Married, spouse not in household"
	3           "Married, spouse in household unknown"
	4           "Widowed"                       
	5           "Divorced"                      
	6           "Separated"                     
	7           "Never Married"                 
	9           "Unknown marital status"        
;
label values cdcmstat cdcmstat;
label define cdcmstat
	1           "Separated"                     
	2           "Divorced"                      
	3           "Married"                       
	4           "Single/never married"          
	5           "Widowed"                       
	9           "Unknown marital status"        
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
label values hh_ref		hh_ref;
label define hh_ref
	98         "Not ascertained"               
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
label values fm_ref		fm_ref;
label define fm_ref
	98         "Not ascertained"               
;
label values fm_resp  fm_resp;
label define fm_resp 
	98          "Not ascertained"               
;
label values sib_deg  sib_deg;
label define sib_deg 
	1           "Full  {brother/sister}"        
	2           "Half {brother/sister}"         
	3           "Adopted {brother/sister}"      
	4           "Step {brother/sister}"         
	5           "Foster {brother/sister}"       
	6           "{brother/sister}-in-law"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
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
label values guard guard;
label define guard
	00			"Guardian is not a household member"
	97        "Refused"                       
	98        "Not ascertained"               
	99        "Don't know"                    
;
label values parents  parents;
label define parents 
	1           "Mother, no father"             
	2           "Father, no mother"             
	3           "Mother and father"             
	4           "Neither mother nor father"     
	9           "Unknown"                       
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
label values fm_type  fm_type;
label define fm_type 
	1           "One adult, no child(ren) under 18"
	2           "Multiple adults, no child(ren) under 18"
	3           "One adult, 1+ child(ren) under 18"
	4           "Multiple adults, 1+ child(ren) under 18"
	9           "Unknown"                       
;
label values nowaf    nowaf;  
label define nowaf   
	1           "Armed Forces"                  
	2           "Not Armed Forces"              
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values astatflg astatflg;
label define astatflg
	0           "Sample Adult - no record"      
	1           "Sample Adult - has record"     
	2           "Not selected as Sample Adult"  
	3           "No one selected as Sample Adult"
	4           "Armed Force member"            
	5           "Armed Force member - selected as Sample Adult"
;
label values cstatflg cstatflg;
label define cstatflg
	0           "Sample Child - no record"      
	1           "Sample Child - has record"     
	2           "Not selected as Sample Child"  
	3           "No one selected as Sample Child"
	4           "Emancipated Minor"             
;
label values immunflg immunflg;
label define immunflg
	0           "Immunization Child - no record"
	1           "Immunization Child - has record"
	2           "Not eligible for immunization questions"
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
label values plaplylm plaplylm;
label define plaplylm
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plaplyun plaplyun;
label define plaplyun
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pspedeis pspedeis;
label define pspedeis
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pspedem  pspedem;
label define pspedem 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plaadl   plaadl; 
label define plaadl  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values labath   labath; 
label define labath  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ladress  ladress;
label define ladress 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values laeat    laeat;  
label define laeat   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values labed    labed;  
label define labed   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values latoilt  latoilt;
label define latoilt 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lahome   lahome; 
label define lahome  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plaiadl  plaiadl;
label define plaiadl 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plawknow plawknow;
label define plawknow
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plawklim plawklim;
label define plawklim
	0           "Unable to work"                
	1           "Limited in work"               
	2           "Not limited in work"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plawalk  plawalk;
label define plawalk 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plaremem plaremem;
label define plaremem
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plimany  plimany;
label define plimany 
	0           "Limitation previously mentioned"
	1           "Yes, limited in some other way"
	2           "Not limited in any way"        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values la1ar    la1ar;  
label define la1ar   
	1           "Limited in any way"            
	2           "Not limited in any way"        
	3           "Unknown if limited"            
;
label values lahcc1   lahcc1l;
label define lahcc1l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln1  lhccln1l;
label define lhccln1l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt1  lhcclt1l;
label define lhcclt1l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly1  lhccly1l;
label define lhccly1l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc2   lahcc2l;
label define lahcc2l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln2  lhccln2l;
label define lhccln2l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt2  lhcclt2l;
label define lhcclt2l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly2  lhccly2l;
label define lhccly2l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc3   lahcc3l;
label define lahcc3l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln3  lhccln3l;
label define lhccln3l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt3  lhcclt3l;
label define lhcclt3l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly3  lhccly3l;
label define lhccly3l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc4   lahcc4l;
label define lahcc4l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln4  lhccln4l;
label define lhccln4l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt4  lhcclt4l;
label define lhcclt4l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly4  lhccly4l;
label define lhccly4l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc5   lahcc5l;
label define lahcc5l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln5  lhccln5l;
label define lhccln5l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lhcclt5  lhcclt5l;
label define lhcclt5l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly5  lhccly5l;
label define lhccly5l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc6   lahcc6l;
label define lahcc6l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln6  lhccln6l;
label define lhccln6l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt6  lhcclt6l;
label define lhcclt6l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly6  lhccly6l;
label define lhccly6l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc7   lahcc7l;
label define lahcc7l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln7  lhccln7l;
label define lhccln7l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt7  lhcclt7l;
label define lhcclt7l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly7  lhccly7l;
label define lhccly7l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc8   lahcc8l;
label define lahcc8l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln8  lhccln8l;
label define lhccln8l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt8  lhcclt8l;
label define lhcclt8l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly8  lhccly8l;
label define lhccly8l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc9   lahcc9l;
label define lahcc9l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln9  lhccln9l;
label define lhccln9l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt9  lhcclt9l;
label define lhcclt9l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly9  lhccly9l;
label define lhccly9l
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc10  lahcc10l;
label define lahcc10l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln10 lhccln1j;
label define lhccln1j
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt10 lhcclt1j;
label define lhcclt1j
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly10 lhccly1j;
label define lhccly1j
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc11  lahcc11l;
label define lahcc11l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln11 lhccln1a;
label define lhccln1a
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt11 lhcclt1a;
label define lhcclt1a
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly11 lhccly1a;
label define lhccly1a
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc12  lahcc12l;
label define lahcc12l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln12 lhccln1b;
label define lhccln1b
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt12 lhcclt1b;
label define lhcclt1b
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly12 lhccly1b;
label define lhccly1b
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc13  lahcc13l;
label define lahcc13l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln13 lhccln1c;
label define lhccln1c
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt13 lhcclt1c;
label define lhcclt1c
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly13 lhccly1c;
label define lhccly1c
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc90  lahcc90l;
label define lahcc90l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln90 lhccln9j;
label define lhccln9j
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt90 lhcclt9j;
label define lhcclt9j
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly90 lhccly9j;
label define lhccly9j
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahcc91  lahcc91l;
label define lahcc91l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccln91 lhccln9a;
label define lhccln9a
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcclt91 lhcclt9a;
label define lhcclt9a
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhccly91 lhccly9a;
label define lhccly9a
	00          "Less than 1 year"              
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca1   lahca1l;
label define lahca1l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln1  lhcaln1l;
label define lhcaln1l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt1  lhcalt1l;
label define lhcalt1l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly1  lhcaly1l;
label define lhcaly1l
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca2   lahca2l;
label define lahca2l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln2  lhcaln2l;
label define lhcaln2l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt2  lhcalt2l;
label define lhcalt2l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly2  lhcaly2l;
label define lhcaly2l
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca3   lahca3l;
label define lahca3l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln3  lhcaln3l;
label define lhcaln3l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt3  lhcalt3l;
label define lhcalt3l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly3  lhcaly3l;
label define lhcaly3l
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca4   lahca4l;
label define lahca4l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln4  lhcaln4l;
label define lhcaln4l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt4  lhcalt4l;
label define lhcalt4l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly4  lhcaly4l;
label define lhcaly4l
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca5   lahca5l;
label define lahca5l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln5  lhcaln5l;
label define lhcaln5l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt5  lhcalt5l;
label define lhcalt5l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly5  lhcaly5l;
label define lhcaly5l
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca6   lahca6l;
label define lahca6l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln6  lhcaln6l;
label define lhcaln6l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt6  lhcalt6l;
label define lhcalt6l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly6  lhcaly6l;
label define lhcaly6l
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca7   lahca7l;
label define lahca7l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln7  lhcaln7l;
label define lhcaln7l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt7  lhcalt7l;
label define lhcalt7l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly7  lhcaly7l;
label define lhcaly7l
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca8   lahca8l;
label define lahca8l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln8  lhcaln8l;
label define lhcaln8l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt8  lhcalt8l;
label define lhcalt8l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly8  lhcaly8l;
label define lhcaly8l
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca9   lahca9l;
label define lahca9l 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln9  lhcaln9l;
label define lhcaln9l
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt9  lhcalt9l;
label define lhcalt9l
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly9  lhcaly9l;
label define lhcaly9l
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca10  lahca10l;
label define lahca10l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln10 lhcaln1j;
label define lhcaln1j
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt10 lhcalt1j;
label define lhcalt1j
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly10 lhcaly1j;
label define lhcaly1j
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca11  lahca11l;
label define lahca11l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln11 lhcaln1a;
label define lhcaln1a
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt11 lhcalt1a;
label define lhcalt1a
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly11 lhcaly1a;
label define lhcaly1a
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca12  lahca12l;
label define lahca12l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln12 lhcaln1b;
label define lhcaln1b
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt12 lhcalt1b;
label define lhcalt1b
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly12 lhcaly1b;
label define lhcaly1b
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca13  lahca13l;
label define lahca13l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln13 lhcaln1c;
label define lhcaln1c
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lhcalt13 lhcalt1c;
label define lhcalt1c
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly13 lhcaly1c;
label define lhcaly1c
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca14  lahca14l;
label define lahca14l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln14 lhcaln1d;
label define lhcaln1d
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt14 lhcalt1d;
label define lhcalt1d
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly14 lhcaly1d;
label define lhcaly1d
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca15  lahca15l;
label define lahca15l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln15 lhcaln1e;
label define lhcaln1e
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt15 lhcalt1e;
label define lhcalt1e
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly15 lhcaly1e;
label define lhcaly1e
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca16  lahca16l;
label define lahca16l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln16 lhcaln1f;
label define lhcaln1f
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt16 lhcalt1f;
label define lhcalt1f
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly16 lhcaly1f;
label define lhcaly1f
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca17  lahca17l;
label define lahca17l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln17 lhcaln1g;
label define lhcaln1g
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt17 lhcalt1g;
label define lhcalt1g
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly17 lhcaly1g;
label define lhcaly1g
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca18  lahca18l;
label define lahca18l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln18 lhcaln1h;
label define lhcaln1h
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt18 lhcalt1h;
label define lhcalt1h
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly18 lhcaly1h;
label define lhcaly1h
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca19  lahca19l;
label define lahca19l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln19 lhcaln1i;
label define lhcaln1i
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt19 lhcalt1i;
label define lhcalt1i
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly19 lhcaly1i;
label define lhcaly1i
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca20  lahca20l;
label define lahca20l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln20 lhcaln2j;
label define lhcaln2j
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt20 lhcalt2j;
label define lhcalt2j
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly20 lhcaly2j;
label define lhcaly2j
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca21  lahca21l;
label define lahca21l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln21 lhcaln2a;
label define lhcaln2a
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt21 lhcalt2a;
label define lhcalt2a
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly21 lhcaly2a;
label define lhcaly2a
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca22  lahca22l;
label define lahca22l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln22 lhcaln2b;
label define lhcaln2b
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt22 lhcalt2b;
label define lhcalt2b
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly22 lhcaly2b;
label define lhcaly2b
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca23  lahca23l;
label define lahca23l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln23 lhcaln2c;
label define lhcaln2c
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt23 lhcalt2c;
label define lhcalt2c
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly23 lhcaly2c;
label define lhcaly2c
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca24  lahca24l;
label define lahca24l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln24 lhcaln2d;
label define lhcaln2d
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt24 lhcalt2d;
label define lhcalt2d
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly24 lhcaly2d;
label define lhcaly2d
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca25  lahca25l;
label define lahca25l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln25 lhcaln2e;
label define lhcaln2e
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt25 lhcalt2e;
label define lhcalt2e
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly25 lhcaly2e;
label define lhcaly2e
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca26  lahca26l;
label define lahca26l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln26 lhcaln2f;
label define lhcaln2f
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt26 lhcalt2f;
label define lhcalt2f
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly26 lhcaly2f;
label define lhcaly2f
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca27  lahca27l;
label define lahca27l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln27 lhcaln2g;
label define lhcaln2g
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt27 lhcalt2g;
label define lhcalt2g
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly27 lhcaly2g;
label define lhcaly2g
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca28  lahca28l;
label define lahca28l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln28 lhcaln2h;
label define lhcaln2h
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt28 lhcalt2h;
label define lhcalt2h
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly28 lhcaly2h;
label define lhcaly2h
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca29  lahca29l;
label define lahca29l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln29 lhcaln2i;
label define lhcaln2i
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt29 lhcalt2i;
label define lhcalt2i
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly29 lhcaly2i;
label define lhcaly2i
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca30  lahca30l;
label define lahca30l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln30 lhcaln3j;
label define lhcaln3j
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt30 lhcalt3j;
label define lhcalt3j
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly30 lhcaly3j;
label define lhcaly3j
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca31  lahca31l;
label define lahca31l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln31 lhcaln3a;
label define lhcaln3a
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt31 lhcalt3a;
label define lhcalt3a
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly31 lhcaly3a;
label define lhcaly3a
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca32  lahca32l;
label define lahca32l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln32 lhcaln3b;
label define lhcaln3b
	95          "95+"                           
	96          "Since birth **"                
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt32 lhcalt3b;
label define lhcalt3b
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth *"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly32 lhcaly3b;
label define lhcaly3b
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca33  lahca33l;
label define lahca33l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln33 lhcaln3c;
label define lhcaln3c
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt33 lhcalt3c;
label define lhcalt3c
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly33 lhcaly3c;
label define lhcaly3c
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca34  lahca34l;
label define lahca34l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln34 lhcaln3d;
label define lhcaln3d
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt34 lhcalt3d;
label define lhcalt3d
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly34 lhcaly3d;
label define lhcaly3d
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca90  lahca90l;
label define lahca90l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln90 lhcaln9j;
label define lhcaln9j
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt90 lhcalt9j;
label define lhcalt9j
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly90 lhcaly9j;
label define lhcaly9j
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lahca91  lahca91l;
label define lahca91l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	6           "No condition at all"           
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaln91 lhcaln9a;
label define lhcaln9a
	95          "95+"                           
	96          "Since birth"                   
	97          "Refused*"                      
	98          "Not ascertained"               
	99          "Don't know*"                   
;
label values lhcalt91 lhcalt9a;
label define lhcalt9a
	1           "Day(s)"                        
	2           "Week(s)"                       
	3           "Month(s)"                      
	4           "Year(s)"                       
	6           "Since birth"                   
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values lhcaly91 lhcaly9a;
label define lhcaly9a
	00          "Less than 1 year"              
	85          "85+ years"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values lacntr1  lacntr1l;
label define lacntr1l
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr2  lacntr2l;
label define lacntr2l
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr3  lacntr3l;
label define lacntr3l
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr4  lacntr4l;
label define lacntr4l
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr5  lacntr5l;
label define lacntr5l
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr6  lacntr6l;
label define lacntr6l
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr7  lacntr7l;
label define lacntr7l
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr8  lacntr8l;
label define lacntr8l
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr9  lacntr9l;
label define lacntr9l
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr10 lacntr1j;
label define lacntr1j
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr11 lacntr1a;
label define lacntr1a
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr12 lacntr1b;
label define lacntr1b
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr13 lacntr1c;
label define lacntr1c
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr90 lacntr9j;
label define lacntr9j
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lacntr91 lacntr9a;
label define lacntr9a
	00          "Since birth and child < 1 year of age"
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr1  laantr1l;
label define laantr1l
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr2  laantr2l;
label define laantr2l
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr3  laantr3l;
label define laantr3l
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr4  laantr4l;
label define laantr4l
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr5  laantr5l;
label define laantr5l
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr6  laantr6l;
label define laantr6l
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr7  laantr7l;
label define laantr7l
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
label values laantr8  laantr8l;
label define laantr8l
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr9  laantr9l;
label define laantr9l
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr10 laantr1j;
label define laantr1j
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr11 laantr1a;
label define laantr1a
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr12 laantr1b;
label define laantr1b
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr13 laantr1c;
label define laantr1c
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr14 laantr1d;
label define laantr1d
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr15 laantr1e;
label define laantr1e
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr16 laantr1f;
label define laantr1f
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr17 laantr1g;
label define laantr1g
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr18 laantr1h;
label define laantr1h
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr19 laantr1i;
label define laantr1i
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr20 laantr2j;
label define laantr2j
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr21 laantr2a;
label define laantr2a
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr22 laantr2b;
label define laantr2b
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr23 laantr2c;
label define laantr2c
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr24 laantr2d;
label define laantr2d
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr25 laantr2e;
label define laantr2e
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr26 laantr2f;
label define laantr2f
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr27 laantr2g;
label define laantr2g
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr28 laantr2h;
label define laantr2h
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr29 laantr2i;
label define laantr2i
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr30 laantr3j;
label define laantr3j
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr31 laantr3a;
label define laantr3a
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr32 laantr3b;
label define laantr3b
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr33 laantr3c;
label define laantr3c
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr34 laantr3d;
label define laantr3d
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr90 laantr9j;
label define laantr9j
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values laantr91 laantr9a;
label define laantr9a
	01          "Less than 3 months"            
	02          "3 -  5 months"                 
	03          "6 - 12 months"                 
	04          "More than 1 year"              
	10          "Unknown number of days"        
	11          "Unknown number of weeks"       
	12          "Unknown number of months"      
	13          "Unknown number of years"       
	99          "Unknown time with cond/impairment"
;
label values lccndr1  lccndr1l;
label define lccndr1l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr2  lccndr2l;
label define lccndr2l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr3  lccndr3l;
label define lccndr3l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr4  lccndr4l;
label define lccndr4l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr5  lccndr5l;
label define lccndr5l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr6  lccndr6l;
label define lccndr6l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr7  lccndr7l;
label define lccndr7l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr8  lccndr8l;
label define lccndr8l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr9  lccndr9l;
label define lccndr9l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr10 lccndr1j;
label define lccndr1j
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr11 lccndr1a;
label define lccndr1a
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr12 lccndr1b;
label define lccndr1b
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr13 lccndr1c;
label define lccndr1c
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr90 lccndr9j;
label define lccndr9j
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lccndr91 lccndr9a;
label define lccndr9a
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr1  lacndr1l;
label define lacndr1l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr2  lacndr2l;
label define lacndr2l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr3  lacndr3l;
label define lacndr3l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr4  lacndr4l;
label define lacndr4l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr5  lacndr5l;
label define lacndr5l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr6  lacndr6l;
label define lacndr6l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr7  lacndr7l;
label define lacndr7l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr8  lacndr8l;
label define lacndr8l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr9  lacndr9l;
label define lacndr9l
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr10 lacndr1j;
label define lacndr1j
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr11 lacndr1a;
label define lacndr1a
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr12 lacndr1b;
label define lacndr1b
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr13 lacndr1c;
label define lacndr1c
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr14 lacndr1d;
label define lacndr1d
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr15 lacndr1e;
label define lacndr1e
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr16 lacndr1f;
label define lacndr1f
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr17 lacndr1g;
label define lacndr1g
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr18 lacndr1h;
label define lacndr1h
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr19 lacndr1i;
label define lacndr1i
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr20 lacndr2j;
label define lacndr2j
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr21 lacndr2a;
label define lacndr2a
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr22 lacndr2b;
label define lacndr2b
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr23 lacndr2c;
label define lacndr2c
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr24 lacndr2d;
label define lacndr2d
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr25 lacndr2e;
label define lacndr2e
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr26 lacndr2f;
label define lacndr2f
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr27 lacndr2g;
label define lacndr2g
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr28 lacndr2h;
label define lacndr2h
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr29 lacndr2i;
label define lacndr2i
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr30 lacndr3j;
label define lacndr3j
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr31 lacndr3a;
label define lacndr3a
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr32 lacndr3b;
label define lacndr3b
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr33 lacndr3c;
label define lacndr3c
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr34 lacndr3d;
label define lacndr3d
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr90 lacndr9j;
label define lacndr9j
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lacndr91 lacndr9a;
label define lacndr9a
	1           "Chronic"                       
	2           "Not chronic"                   
	9           "Unknown if chronic"            
;
label values lcondrt  lcondrt;
label define lcondrt 
	1           "At least one condition causing LA is chronic"
	2           "No condition causing LA is chronic"
	9           "Unknown if any condition causing LA is chronic"
;
label values lachronr lachronr;
label define lachronr
	0           "Not limited in any way (incl unk if limited)"
	1           "Limited, caused by at least one chronic cond"
	2           "Limited, not caused by chronic cond"
	3           "Limited, unk if cond causing LA is chronic"
;
label values phstat   phstat; 
label define phstat  
	1           "Excellent"                     
	2           "Very good"                     
	3           "Good"                          
	4           "Fair"                          
	5           "Poor"                          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pdmed12m pdmed12m;
label define pdmed12m
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pnmed12m pnmed12m;
label define pnmed12m
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values homewho  homewho;
label define homewho 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values adaywho  adaywho;
label define adaywho 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values astlwho  astlwho;
label define astlwho 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hospwho  hospwho;
label define hospwho 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values nurswho  nurswho;
label define nurswho 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values phospyr  phospyr;
label define phospyr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hospno   hospno; 
label define hospno  
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values hpnite   hpnite; 
label define hpnite  
	997         "Refused"                       
	998         "Not ascertained"               
	999         "Don't know"                    
;
label values phchm2w  phchm2w;
label define phchm2w 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values phchmn2w phchmn2w;
label define phchmn2w
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values phcph2wr phcph2wr;
label define phcph2wr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values phcphn2w phcphn2w;
label define phcphn2w
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values phcdv2w  phcdv2w;
label define phcdv2w 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values phcdvn2w phcdvn2w;
label define phcdvn2w
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values p10dvyr  p10dvyr;
label define p10dvyr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikinda  hikinda;
label define hikinda 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindb  hikindb;
label define hikindb 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindc  hikindc;
label define hikindc 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindd  hikindd;
label define hikindd 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikinde  hikinde;
label define hikinde 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindf  hikindf;
label define hikindf 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindg  hikindg;
label define hikindg 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindh  hikindh;
label define hikindh 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindi  hikindi;
label define hikindi 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindj  hikindj;
label define hikindj 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindk  hikindk;
label define hikindk 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindl  hikindl;
label define hikindl 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindm  hikindm;
label define hikindm 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hikindn  hikindn;
label define hikindn 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values medicare medicare;
label define medicare
	1           "Yes, information"              
	2           "Yes, but no detail information"
	3           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mcpart   mcpart; 
label define mcpart  
	1           "Part A - Hospital Only"        
	2           "Part B - Medical Only"         
	3           "Both Part A and Part B"        
	4           "Card Not Available"            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mcchoice mcchoice;
label define mcchoice
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mchmo    mchmo;  
label define mchmo   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mcname   mcname; 
label define mcname  
	04          "Medigap plan"                  
	12          "Group"                         
	22          "Staff"                         
	32          "IPA"                           
	92          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values mcref    mcref;  
label define mcref   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mcpaypre mcpaypre;
label define mcpaypre
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values medicaid medicaid;
label define medicaid
	1           "Yes, information"              
	2           "Yes, but no detail information"
	3           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values machmd   machmd; 
label define machmd  
	1           "Any doctor"                    
	2           "Select from a book/list"       
	3           "Doctor is assigned"            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mapcmd   mapcmd; 
label define mapcmd  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values maref    maref;  
label define maref   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values single   single; 
label define single  
	1           "Yes with detail"               
	2           "Yes with no detail"            
	3           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypea  sstypea;
label define sstypea 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypeb  sstypeb;
label define sstypeb 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypec  sstypec;
label define sstypec 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstyped  sstyped;
label define sstyped 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypee  sstypee;
label define sstypee 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypef  sstypef;
label define sstypef 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypeg  sstypeg;
label define sstypeg 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypeh  sstypeh;
label define sstypeh 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypei  sstypei;
label define sstypei 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypej  sstypej;
label define sstypej 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypek  sstypek;
label define sstypek 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values sstypel  sstypel;
label define sstypel 
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values private  private;
label define private 
	1           "Yes, information"              
	2           "Yes, but no detail information"
	3           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hitype1  hitype1l;
label define hitype1l
	98          "Not ascertained"               
	99          "Unknown"                       
;
label values whonam1  whonam1l;
label define whonam1l
	1           "In own name"                   
	2           "Someone else in family"        
	3           "Person not in household"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnwrk1  plnwrk1l;
label define plnwrk1l
	1           "Employer"                      
	2           "Union"                         
	3           "Through work, but DK if employer or union"
	4           "Through work, self-employ or prof assoc"
	5           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay11 plnpay1a;
label define plnpay1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay21 plnpay2a;
label define plnpay2a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay31 plnpay3a;
label define plnpay3a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay41 plnpay4a;
label define plnpay4a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay51 plnpay5a;
label define plnpay5a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay61 plnpay6a;
label define plnpay6a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay71 plnpay7a;
label define plnpay7a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hicostr1 hicostra;
label define hicostra
	20000       "$20000 or more"                
	99997       "Refused"                       
	99998       "Not ascertained"               
	99999       "Don't know"                    
;
label values plnmgd1  plnmgd1l;
label define plnmgd1l
	1           "HMO/IPA"                       
	2           "PPO"                           
	3           "POS"                           
	4           "Fee-for-service/indemnity"     
	5           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgchmd1  mgchmd1l;
label define mgchmd1l
	1           "Any doctor"                    
	2           "Select from group/list"        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgprmd1  mgprmd1l;
label define mgprmd1l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgpymd1  mgpymd1l;
label define mgpymd1l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgpref1  mgpref1l;
label define mgpref1l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hitype2  hitype2l;
label define hitype2l
	98          "Not ascertained"               
	99          "Unknown"                       
;
label values whonam2  whonam2l;
label define whonam2l
	1           "In own name"                   
	2           "Someone else in family"        
	3           "Person not in household"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnwrk2  plnwrk2l;
label define plnwrk2l
	1           "Employer"                      
	2           "Union"                         
	3           "Through work, but DK if employer or union"
	4           "Through work, self-employ or prof assoc"
	5           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay12 plnpay1b;
label define plnpay1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay22 plnpay2b;
label define plnpay2b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay32 plnpay3b;
label define plnpay3b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay42 plnpay4b;
label define plnpay4b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay52 plnpay5b;
label define plnpay5b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay62 plnpay6b;
label define plnpay6b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay72 plnpay7b;
label define plnpay7b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hicostr2 hicostrb;
label define hicostrb
	20000       "$20000 or more"                
	99997       "Refused"                       
	99998       "Not ascertained"               
	99999       "Don't know"                    
;
label values plnmgd2  plnmgd2l;
label define plnmgd2l
	1           "HMO/IPA"                       
	2           "PPO"                           
	3           "POS"                           
	4           "Fee-for-service/indemnity"     
	5           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgchmd2  mgchmd2l;
label define mgchmd2l
	1           "Any doctor"                    
	2           "Select from group/list"        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgprmd2  mgprmd2l;
label define mgprmd2l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgpymd2  mgpymd2l;
label define mgpymd2l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgpref2  mgpref2l;
label define mgpref2l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hitype3  hitype3l;
label define hitype3l
	98          "Not ascertained"               
	99          "Unknown"                       
;
label values whonam3  whonam3l;
label define whonam3l
	1           "In own name"                   
	2           "Someone else in family"        
	3           "Person not in household"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnwrk3  plnwrk3l;
label define plnwrk3l
	1           "Employer"                      
	2           "Union"                         
	3           "Through work, but DK if employer or union"
	4           "Through work, self-employ or prof assoc"
	5           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay13 plnpay1c;
label define plnpay1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay23 plnpay2c;
label define plnpay2c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay33 plnpay3c;
label define plnpay3c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay43 plnpay4c;
label define plnpay4c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay53 plnpay5c;
label define plnpay5c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay63 plnpay6c;
label define plnpay6c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay73 plnpay7c;
label define plnpay7c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hicostr3 hicostrc;
label define hicostrc
	20000       "$20000 or more"                
	99997       "Refused"                       
	99998       "Not ascertained"               
	99999       "Don't know"                    
;
label values plnmgd3  plnmgd3l;
label define plnmgd3l
	1           "HMO/IPA"                       
	2           "PPO"                           
	3           "POS"                           
	4           "Fee-for-service/indemnity"     
	5           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgchmd3  mgchmd3l;
label define mgchmd3l
	1           "Any doctor"                    
	2           "Select from group/list"        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgprmd3  mgprmd3l;
label define mgprmd3l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgpymd3  mgpymd3l;
label define mgpymd3l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgpref3  mgpref3l;
label define mgpref3l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hitype4  hitype4l;
label define hitype4l
	98          "Not ascertained"               
	99          "Unknown"                       
;
label values whonam4  whonam4l;
label define whonam4l
	1           "In own name"                   
	2           "Someone else in family"        
	3           "Person not in household"       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnwrk4  plnwrk4l;
label define plnwrk4l
	1           "Employer"                      
	2           "Union"                         
	3           "Through work, but DK if employer or union"
	4           "Through work, self-employ or prof assoc"
	5           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay14 plnpay1d;
label define plnpay1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay24 plnpay2d;
label define plnpay2d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay34 plnpay3d;
label define plnpay3d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay44 plnpay4d;
label define plnpay4d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay54 plnpay5d;
label define plnpay5d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay64 plnpay6d;
label define plnpay6d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values plnpay74 plnpay7d;
label define plnpay7d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hicostr4 hicostrd;
label define hicostrd
	20000       "$20000 or more"                
	99997       "Refused"                       
	99998       "Not ascertained"               
	99999       "Don't know"                    
;
label values plnmgd4  plnmgd4l;
label define plnmgd4l
	1           "HMO/IPA"                       
	2           "PPO"                           
	3           "POS"                           
	4           "Fee-for-service/indemnity"     
	5           "Other"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgchmd4  mgchmd4l;
label define mgchmd4l
	1           "Any doctor"                    
	2           "Select from group/list"        
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgprmd4  mgprmd4l;
label define mgprmd4l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgpymd4  mgpymd4l;
label define mgpymd4l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values mgpref4  mgpref4l;
label define mgpref4l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ihs      ihs;    
label define ihs     
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values military military;
label define military
	1           "Yes, Military/VA only"         
	2           "Yes, CHAMPUS/TRICARE/CHAMP-VA only"
	3           "Yes Both Military/VA + CHAMPUS/TRICARE/CHAMP-VA"
	4           "Yes unknown type"              
	5           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values chip     chip;   
label define chip    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values otherpub otherpub;
label define otherpub
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values othergov othergov;
label define othergov
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values notcov   notcov; 
label define notcov  
	1           "Not covered"                   
	2           "Covered"                       
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hilast   hilast; 
label define hilast  
	1           "6 months or less"              
	2           "More than 6 months, but not more than 1 year ago"
	3           "More than 1 year, but not more than 3 years ago"
	4           "More than 3 years"             
	5           "Never"                         
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop1  histop1l;
label define histop1l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop2  histop2l;
label define histop2l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop3  histop3l;
label define histop3l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop4  histop4l;
label define histop4l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop5  histop5l;
label define histop5l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop6  histop6l;
label define histop6l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop7  histop7l;
label define histop7l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop8  histop8l;
label define histop8l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop9  histop9l;
label define histop9l
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop10 histop1j;
label define histop1j
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop11 histop1a;
label define histop1a
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop12 histop1b;
label define histop1b
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop13 histop1c;
label define histop1c
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop14 histop1d;
label define histop1d
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values histop15 histop1e;
label define histop1e
	1           "Mentioned"                     
	2           "Not mentioned"                 
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values hinotyr  hinotyr;
label define hinotyr 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values hinotmyr hinotmyr;
label define hinotmyr
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values hcspfyr  hcspfyr;
label define hcspfyr 
	0           "Zero"                          
	1           "Less than $500"                
	2           "$500-$1,999"                   
	3           "$2,000-$2,999"                 
	4           "$3,000-$4,999"                 
	5           "$5,000 or more"                
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't Know"                    
;
label values regionbr regionbr;
label define regionbr
	01          "United States"                 
	02          "Mexico, Central America, Caribbean Islands"
	03          "South America"                 
	04          "Europe"                        
	05          "Russia (and former USSR areas)"
	06          "Africa"                        
	07          "Middle East"                   
	08          "Indian Subcontinent"           
	09          "Asia"                          
	10          "SE Asia"                       
	11          "Elsewhere"                     
	99          "Unknown"                       
;
label values usbrth_p usbrth_p;
label define usbrth_p
	1           "Yes"                           
	2           "No"                            
;
label values yrsinus  yrsinus;
label define yrsinus 
	1           "Less than 1 year"              
	2           "1 yr., less than 5 yrs."       
	3           "5 yrs., less than 10 yrs."     
	4           "10 yrs., less than 15 yrs."    
	5           "15 years or more"              
	9           "Unknown"                       
;
label values citizenp citizenp;
label define citizenp
	1           "Yes, citizen of the United States"
	2           "No, not a citizen of the United States"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values headst   headst; 
label define headst  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values headstv1 headstva;
label define headstva
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not Ascertained"               
	9           "Don't know"                    
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
label values educ_r1  educ_r1l;
label define educ_r1l
	01          "Less/equal to 8th grade"       
	02          "9-12th grade, no high school diploma"
	03          "High school graduate"          
	04          "GED recipient"                 
	05          "Some college, no degree"       
	06          "AA degree, technical or vocational"
	07          "AA degree, academic program"   
	08          "Bachelor's degree (BA, BS, AB, BBA)"
	09          "Master's, professional, or doctoral degree"
	96          "Child under 5 years of age"    
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values miltryds miltryds;
label define miltryds
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values doinglw1 doinglwa;
label define doinglwa
	1           "Working for pay at a job or business"
	2           "With a job or business but not at work"
	3           "Looking for work"              
	4           "Working, but not for pay, at a job or business"
	5           "Not working and not looking for work"
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values whynowk1 whynowka;
label define whynowka
	01          "Taking care of house or family"
	02          "Going to school"               
	03          "Retired"                       
	04          "On a planned vacation from work"
	05          "On family or maternity leave"  
	06          "Temporarily unable to work for health reasons"
	07          "On layoff"                     
	08          "Disabled"                      
	09          "Have job/contract, off-season" 
	10          "Other"                         
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values wrkhrs   wrkhrs; 
label define wrkhrs  
	95          "95+ hours"                     
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values wrkftall wrkftall;
label define wrkftall
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values wrklyr1  wrklyr1l;
label define wrklyr1l
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values wrkmyr   wrkmyr; 
label define wrkmyr  
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values majr_act majr_act;
label define majr_act
	1           "Working at a job or business"  
	2           "Keeping house"                 
	3           "Going to school"               
	4           "Something else"                
	5           "Unknown"                       
;
label values ernyr_p  ernyr_p;
label define ernyr_p 
	01          "$01-$4999"                     
	02          "$5000-$9999"                   
	03          "$10000-$14999"                 
	04          "$15000-$19999"                 
	05          "$20000-$24999"                 
	06          "$25000-$34999"                 
	07          "$35000-$44999"                 
	08          "$45000-$54999"                 
	09          "$55000-$64999"                 
	10          "$65000-$74999"                 
	11          "$75000 and over"               
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values hiempof  hiempof;
label define hiempof 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values psal     psal;   
label define psal    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pseinc   pseinc; 
label define pseinc  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pssrr    pssrr;  
label define pssrr   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pssrrdb  pssrrdb;
label define pssrrdb 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pssrrd   pssrrd; 
label define pssrrd  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ppens    ppens;  
label define ppens   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values popens   popens; 
label define popens  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pssi     pssi;   
label define pssi    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pssid    pssid;  
label define pssid   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ptanf    ptanf;  
label define ptanf   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values powben   powben; 
label define powben  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pintrstr pintrstr;
label define pintrstr
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pdivd    pdivd;  
label define pdivd   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pchldsp  pchldsp;
label define pchldsp 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pincot   pincot; 
label define pincot  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values incgrp   incgrp; 
label define incgrp  
	01          "0-$4999"                       
	02          "$5000-$9999"                   
	03          "$10000-$14999"                 
	04          "$15000-$19999"                 
	05          "$20000-$24999"                 
	06          "$25000-$34999"                 
	07          "$35000-$44999"                 
	08          "$45000-$54999"                 
	09          "$55000-$64999"                 
	10          "$65000-$74999"                 
	11          "$75000 and over"               
	12          "$20000 or more (no detail)"    
	13          "Less than $20000 (no detail)"  
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
label values houseown houseown;
label define houseown
	1           "Owned or being bought"         
	2           "Rented"                        
	3           "Other arrangement"             
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fgah     fgah;   
label define fgah    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values pssapl   pssapl; 
label define pssapl  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values psdapl   psdapl; 
label define psdapl  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values tanfmyr  tanfmyr;
label define tanfmyr 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values pfstp    pfstp;  
label define pfstp   
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fstpmyr  fstpmyr;
label define fstpmyr 
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values eligpwic eligpwic;
label define eligpwic
	0           "No WIC age-eligible family members"
	1           "At least 1 WIC age-eligible family member"
;
label values pwic     pwic;   
label define pwic    
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values wic_flag wic_flag;
label define wic_flag
	0           "Person not age-eligible"       
	1           "Person age-eligible"           
;
#delimit cr
save "`dta_name'", replace
log close
