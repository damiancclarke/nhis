clear all

global DAT "~/database/NHIS/Data/raw/1999"
global OUT "~/database/NHIS/Data/dta/1999"
global LOG "~/database/NHIS/Log"
global COD "~/database/NHIS/Source/1999"

log using "$LOG/familyxx.log", replace
set mem 1000m

/*------------------------------------------------
  This program reads the 1999 National Health Interview Survey 1999 familyxx  Data File
  by Jean Roth Mon Jul  2 15:41:21 EDT 2007
  Please report errors to jroth@nber.org 
  NOTE:  This program is distributed under the GNU GPL.
  See end of this file and http://www.gnu.org/licenses/ for details.
  Run with do nhis1999_familyxx
----------------------------------------------- */

/* The following line should contain
   the complete path and name of the raw data file.
   On a PC, use backslashes in paths as in C:\  */

local dat_name "~/database/NHIS/Data/raw/1999/familyxx.dat"

/* The following line should contain the path to your output '.dta' file */

local dta_name "~/database/NHIS/Data/dta/1999/familyxx"

/* The following line should contain the path to the data dictionary file */

local dct_name "$COD/nhis1999_familyxx.dct"

infile using "`dct_name'", using("`dat_name'") clear


*Everything below this point are value labels

#delimit ;

;
label values rectype  rectype;
label define rectype 
	60          "Family"                        
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
	01          "House; apartment; flat; condo" 
	02          "HU in nontransient hotel; motel"
	03          "HU-permanent in transient hotel; motel"
	04          "HU in rooming house"           
	05          "Mobile home/trailer w/no permanent rooms added"
	06          "Mobile home/trailer w/ 1+ permanent rooms adde"
	07          "HU not specified above"        
	08          "Quarters not HU in room or board house"
	09          "Unit not permanent-transient hotel; motel"
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
	1           "5;000;000 or more"             
	2           "2;500;000 - 4;999;999"         
	3           "1;000;000 - 2;499;999"         
	4           "500;000 - 999;999"             
	5           "250;000 - 499;999"             
	6           "Under 250;000"                 
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
label values finjyn   finjyn; 
label define finjyn  
	1           "Yes"                           
	2           "No"                            
	7           "Refused"                       
	8           "Not ascertained"               
	9           "Don't know"                    
;
label values fpoisyn  fpoisyn;
label define fpoisyn 
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
label values fhcphyn  fhcphyn;
label define fhcphyn 
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
	2           "$500-$1;999"                   
	3           "$2;000-$2;999"                 
	4           "$3;000-$4;999"                 
	5           "$5;000 or more"                
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
label values fintrsyn fintrsyn;
label define fintrsyn
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
	3           "Other Arrangement"             
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
label values fmtype   fmtype; 
label define fmtype  
	1           "One adult; no child(ren) under 18"
	2           "Multiple adults; no child(ren) under 18"
	3           "One adult; 1+ child(ren) under 18"
	4           "Multiple adults; 1+ child(ren) under 18"
	9           "Unknown"                       
;
label values fm_educ  fm_educ;
label define fm_educ 
	01          "Less/equal to 8th grade"       
	02          "9-12th grade; no high school diploma"
	03          "High school graduate"          
	04          "GED recipient"                 
	05          "Some college; no degree"       
	06          "AA degree; technical or vocational"
	07          "AA degree; academic program"   
	08          "Bachelor's degree (BA; BS; AB; BBA)"
	09          "Master's; professional; or doctoral degree"
	97          "Refused"                       
	98          "Not ascertained"               
	99          "Don't know"                    
;
label values fm_resp  fm_resp;
label define fm_resp 
	98          "Not ascertained"               
;
#delimit cr
save `dta_name' ,replace
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
