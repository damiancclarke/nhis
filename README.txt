#-------------------------------------------------------------------------------
#-------README for NHIS downloading and conversion to dta (1997-2013 file)------
#----------------------------Author:damiancclarke-------------------------------
#---------------------------yyyy-mm-dd: 2014-12-06------------------------------
#-------------------------------------------------------------------------------

These scripts import and process data from the NHIS (National Health Information
Survey), creating Stata files for each year from 1997-2013.  Initially, only the
script NHISprocess.py is required.  This Python script downloads full NHIS data
from the CDC website, and also downloads Stata do files and dictionary files to
read in to Stata format the fixed width data made available from the CDC.

In order to fully convert data to Stata format, the following process should be
followed:
 (1) Run the Python script which downloads data and source files
 (2) Change to the directory entitled "Source"
 (3) Change the globals in the Stata do file NHISprep.do
 (4) Run the Stata do file NHISprep.do

As an example - on a Mac or Unix operating system - the following should be run 
at the command line of the terminal (assuming that NHISprocess.py is downloaded 
and available in the current working directory):
 
  python NHISprocess.py OUTDIR/
  cd OUTDIR/Source
  stata -b do NHISprep.do &

where OUTDIR should be changed to the location of the directory where you want 
the Source files, raw CDC data, and Stata .dta files saved.  Note that a slash
must be included *after* the location of OUTDIR at the python command.  The fin-
al line can be run directly in Stata if preferred, rather than in batch at the 
command line.

On a Windows operating system, the following should be run at the command line,
once again assuming that NHISprocess.py is downloaded: 
  
  python NHISprocess.py OUTDIR/
  cd OUTDIR/Source
	"C:\Program Files\Stata12\StataSE" /b do OUTDIR\Source\NHISprep.do
  
The last line can be run in Stata itself rather than run in batch from the comm-
and line (as in the example above). In order to use the command line in Windows, 
go to the Start menu or equivalent, and click on "run". If using Windows 8, from 
the desktop use the Windows key + R on the keyboard to access run.  Once again, 
here OUTDIR should be replaced with the location of the file where you want all 
data and source code to be saved. For example:

  python NHISprocess.py c:\database\NHIS\

if you have a directory called database\NHIS in your c drive. If desired, Furter
details are located at the top of the Stata do file and the top of the Python f-
ile as comments.
