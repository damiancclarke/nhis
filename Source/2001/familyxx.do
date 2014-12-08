clear all
log using "$LOG/familyxx.log", text replace
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
    
local dat_name "$DAT/2001/familyxx.dat"
local dta_name "$OUT/2001/familyxx"
local dct_name "$COD/2001/nhis2001_familyxx.dct"
infile using "`dct_name'", using("`dat_name'") clear


#delimit ;

;
label values rectype  rectype;
label define rectype 
	60          "Family"                        
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
label values livqrt   livqrt; 
label define livqrt  
	01          "House, apartment, flat, condo" 
	02          "HU in nontransient hotel, motel"
	03          "HU-permanent in transient hotel, motel"
	04          "HU in rooming house"           
	05          "Mobile home/trailer w/no permanent rooms added"
	06          "Mobile home/trailer w/ 1+ permanent rooms adde"
	07          "HU not specified above"        
	08          "Quarters not HU in room or board house"
	09          "Unit not permanent-transient hotel, motel"
	10          "Unoccupied site for mobile home/trailer/tent"
	11          "Student quarters in college dormitory"
	12          "Group quarter unit not specified above"
	98          "Not ascertained"               
;
label values telenum  telenum;
label define telenum 
	1           "Yes (gave phone number)"       
	2           "No (no phone service)"         
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
	1           "5,000,000 or more"             
	2           "2,500,000 - 4,999,999"         
	3           "1,000,000 - 2,499,999"         
	4           "500,000 - 999,999"             
	5           "250,000 - 499,999"             
	6           "Under 250,000"                 
	7           "Non-MSA"                       
;
label values fchlmyn  fchlmyn;
label define fchlmyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fspedyn  fspedyn;
label define fspedyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values flaadlyn flaadlyn;
label define flaadlyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fliadlyn fliadlyn;
label define fliadlyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fwklimyn fwklimyn;
label define fwklimyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fwalkyn  fwalkyn;
label define fwalkyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values frememyn frememyn;
label define frememyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fanylyn  fanylyn;
label define fanylyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fdmedyn  fdmedyn;
label define fdmedyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fnmedyn  fnmedyn;
label define fnmedyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhomeyn  fhomeyn;
label define fhomeyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fadayyn  fadayyn;
label define fadayyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fastlyn  fastlyn;
label define fastlyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhospcyn fhospcyn;
label define fhospcyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fnursyn  fnursyn;
label define fnursyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhospyn  fhospyn;
label define fhospyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhchmyn  fhchmyn;
label define fhchmyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhcphryn fhcphryn;
label define fhcphryn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhcdvyn  fhcdvyn;
label define fhcdvyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values f10dvyn  f10dvyn;
label define f10dvyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhicovyn fhicovyn;
label define fhicovyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fhicost  fhicost;
label define fhicost 
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
label values fsalyn   fsalyn; 
label define fsalyn  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fseincyn fseincyn;
label define fseincyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fssrryn  fssrryn;
label define fssrryn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fpensyn  fpensyn;
label define fpensyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fopensyn fopensyn;
label define fopensyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fssiyn   fssiyn; 
label define fssiyn  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ftanfyn  ftanfyn;
label define ftanfyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fowbenyn fowbenyn;
label define fowbenyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fintr1yn fintr1yn;
label define fintr1yn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fdivdyn  fdivdyn;
label define fdivdyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fchspyn  fchspyn;
label define fchspyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fincotyn fincotyn;
label define fincotyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fincgrp  fincgrp;
label define fincgrp 
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
label values frat_cat frat_cat;
label define frat_cat
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
label values fhouse   fhouse; 
label define fhouse  
	1           "Owned or being bought"         
	2           "Rented"                        
	3           "Other arrangement"             
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fssaplyn fssaplyn;
label define fssaplyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fsdaplyn fsdaplyn;
label define fsdaplyn
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values ffdstyn  ffdstyn;
label define ffdstyn 
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fwicyn   fwicyn; 
label define fwicyn  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fwicyn2  fwicyn2l;
label define fwicyn2l
	1           "Yes - at least 1 recipient age-eligible"
	2           "Yes - no recipients age-eligible"
	3           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fmtype   fmtype; 
label define fmtype  
	1           "One adult, no child(ren) under 18"
	2           "Multiple adults, no child(ren) under 18"
	3           "One adult, 1+ child(ren) under 18"
	4           "Multiple adults, 1+ child(ren) under 18"
	9           "Unknown"                       
;
label values fm_educ  fm_educ;
label define fm_educ 
	01          "Less/equal to 8th grade"       
	02          "9-12th grade, no high school diploma"
	03          "High school graduate"          
	04          "GED recipient"                 
	05          "Some college, no degree"       
	06          "AA degree, technical or vocational"
	07          "AA degree, academic program"   
	08          "Bachelor's degree (BA, BS, AB, BBA)"
	09          "Master's, professional, or doctoral degree"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fm_resp  fm_resp;
label define fm_resp 
	98          "Not ascertained"               
;
#delimit cr
save "`dta_name'", replace
log close
