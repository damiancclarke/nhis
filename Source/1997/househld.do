clear all
log using "$LOG/househld.log", replace
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
    
local dat_name "$DAT/1997/househld.dat"
local dta_name "$OUT/1997/househld"
local dct_name "$COD/1997/nhis1997_househld.dct"
infile using "`dct_name'", using("`dat_name'") clear

#delimit ;

;
label values rectype  rectype;
label define rectype 
	10          "Household"                     
;
label values srvy_yr  srvy_yr;
label define srvy_yr 
	1997        "1997"                          
;
label values intv_qrt intv_qrt;
label define intv_qrt
	1           "Quarter 1"                     
	2           "Quarter 2"                     
	3           "Quarter 3"                     
	4           "Quarter 4"                     
;
label values assignwk assignwk;
label define assignwk
	01          "Week 1"                        
	02          "Week 2"                        
	03          "Week 3"                        
	04          "Week 4"                        
	05          "Week 5"                        
	06          "Week 6"                        
	07          "Week 7"                        
	08          "Week 8"                        
	09          "Week 9"                        
	10          "Week 10"                       
	11          "Week 11"                       
	12          "Week 12"                       
	13          "Week 13"                       
;
label values int_m_p  int_m_p;
label define int_m_p 
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
	98          "Not ascertained"               
;
label values livqrt   livqrt; 
label define livqrt  
	01          "House; apartment; flat; condo" 
	02          "HU in nontransient hotel; motel"
	03          "HU-permanent in transient hotel; motel"
	04          "HU in rooming house"           
	05          "Mobile home/trailer w/no permanent rooms added"
	06          "Mobile home/trailer w/1+ permanent rooms added"
	07          "HU not specified above"        
	08          "Quarters not HU in room or board house"
	09          "Unit not permanent-transient hotel; motel"
	10          "Unoccupied site for mobile home/trailer/tent"
	11          "Student quarters in college dormitory"
	12          "Group quarter unit not specified above"
	98          "Not ascertained"               
;
label values non_intv non_intv;
label define non_intv
	1           "Refused"                       
	2           "No one home - repeated calls"  
	3           "Temporarily absent"            
	4           "Language problem"              
	5           "Other"                         
;
label values telenum  telenum;
label define telenum 
	1           "Gave a telephone number"       
	2           "No telephone service"          
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values inside   inside; 
label define inside  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values noserv   noserv; 
label define noserv  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values howlngwk howlngwk;
label define howlngwk
	00          "One week or less"              
	01          "More than one week; up to two weeks"
	02          "More than two weeks; up to three weeks"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values nowaf_hh nowaf_hh;
label define nowaf_hh
	1           "Armed Forces member in HH"     
	2           "No Armed Forces member in HH*" 
;
label values lng_intv lng_intv;
label define lng_intv
	1           "English"                       
	2           "Spanish"                       
	3           "English and Spanish"           
	4           "Other"                         
	8           "Not ascertained"               
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
#delimit cr
save "`dta_name'",replace
log close

