clear all

log using "$LOG/househld.log", replace
set mem 1000m

/*------------------------------------------------
  This program reads the 1999 National Health Interview Survey 1999 househld  Data File
  by Jean Roth Mon Jul  2 15:43:08 EDT 2007
  Please report errors to jroth@nber.org 
  NOTE:  This program is distributed under the GNU GPL.
  See end of this file and http://www.gnu.org/licenses/ for details.
  Run with do nhis1999_househld
----------------------------------------------- */

/* The following line should contain
   the complete path and name of the raw data file.
   On a PC, use backslashes in paths as in C:\  */

local dat_name "~/database/NHIS/Data/raw/1999/househld.dat"

/* The following line should contain the path to your output '.dta' file */

local dta_name "~/database/NHIS/Data/dta/1999/househld"

/* The following line should contain the path to the data dictionary file */

local dct_name "$COD/1999/nhis1999_househld.dct"

infile using "`dct_name'", using("`dat_name'") clear


*Everything below this point are value labels

#delimit ;

;
label values rectype  rectype;
label define rectype 
	10          "Household"                     
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
	98        "Not ascertained"               
;
label values livqrt   livqrt; 
label define livqrt  
	01          "House apartment flat condo" 
	02          "HU in nontransient hotel motel"
	03          "HU-permanent in transient hotel motel"
	04          "HU in rooming house"           
	05          "Mobile home/trailer w/no permanent rooms added"
	06          "Mobile home/trailer w/1+ permanent rooms added"
	07          "HU not specified above"        
	08          "Quarters not HU in room or board house"
	09          "Unit not permanent-transient hotel; motel"
	10          "Unoccupied site for mobile home/trailer/tent"
	11          "Student quarters in college dormitory"
	12          "Group quarter unit not specified above"
	98          "Not ascertained*"              
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
	01          "More than one week up to two weeks"
	02          "More than two weeks up to three weeks"
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
	1           "5000000 or more"             
	2           "2500000 - 4999999"         
	3           "1000000 - 2499999"         
	4           "500000 - 999999"             
	5           "250000 - 499999"             
	6           "Under 250000"                 
	7           "Non-MSA"                       
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
