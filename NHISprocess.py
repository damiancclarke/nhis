#   NHISprocess.py v0.00         damiancclarke             yyyy-mm-dd:2014-12-08
#---|----1----|----2----|----3----|----4----|----5----|----6----|----7----|----8
#
#   This script downloads and processes NHIS all (National Health Interview Sur-
#   vey) files, resulting in a series of Stata dta files for each year from 1997
#   -2013. This is the series of the survey after changes were made in 1996.  To 
#   run the sript, python 2.x is required.  The syntax is the following
# 
#       python NHISprocess.py OUTDIR
#
#   where OUTDIR is the directory where processed files should be saved after the 
#   script terminates.
#
#   Note that all raw data is stored on an FTP at the CDC website. The only tric-
#   ky part of this file storage is that data from 1997-2009 is zipped using .exe
#   format, while post-2009 files are zipped using .zip.  This is dealt with aut-
#   omatically in the script below.
#
#   This file is made available under the GNU Public License version 3. For ques-
#   tions and comments:
#
#                    mailto:damian.clarke@economics.ox.ac.uk
#


#-------------------------------------------------------------------------------
#--- (1) Import required packages
#-------------------------------------------------------------------------------
from sys import argv
import os
import urllib
import zipfile

script, OUTDIR = argv

#-------------------------------------------------------------------------------
#--- (2) URL for NHIS raw data (CDC website)
#-------------------------------------------------------------------------------
u1      = 'ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/'
surveys = ['familyxx', 'househld', 'personsx', 'samchild', 'samadult']
dirs    = ['familyfile', 'household', 'person', 'samplechild', 'sampleadult']
dcc     = 'https://sites.google.com/site/damiancclarke/computation/'

print 'The script ' + script + ' is taking files from:'

#-------------------------------------------------------------------------------
#--- (3) Generate Data directories
#-------------------------------------------------------------------------------
if not os.path.exists(OUTDIR + 'Data/'):
    os.mkdir(OUTDIR + 'Data/')
if not os.path.exists(OUTDIR + 'Data/raw/'):
    os.mkdir(OUTDIR + 'Data/raw/')

for year in range(1997,2014):
    if not os.path.exists(OUTDIR + 'Data/raw/' + str(year)):
        os.mkdir(OUTDIR + 'Data/raw/' + str(year))
        

#-------------------------------------------------------------------------------
#--- (3) Download all files from CDC FTP
#-------------------------------------------------------------------------------
for year in range(1997,2014):
    if year <=2009:
        end = '.exe'
    else:
        end = '.zip'

    for s in range(len(surveys)):
        if year==2004:
            target = u1 + str(year) + '/' + dirs[s] + '/' + surveys[s] + end
        else:
            target = u1 + str(year) + '/' + surveys[s] + end

        response = OUTDIR + 'Data/raw/' + str(year) + '/' + surveys[s] + end

        #---- DOWNLOAD ----#
        print "Downloading %s ... ..." %target
        urllib.urlretrieve(target, response)

        #---- RENAME ----#
        outpath = OUTDIR + 'Data/raw/' + str(year) + '/'
        upname  = outpath + surveys[s].upper() + '.DAT'
        midname = outpath + surveys[s].upper() + '.dat'
        lowname = outpath + surveys[s] + '.dat'

        #---- UNZIP ----#
        fz = open(response, 'rb')
        z = zipfile.ZipFile(fz)
        for name in z.namelist():
            z.extract(name, outpath)
        fz.close()

        #---- NAME AS LOWER CASE ----#
        if os.path.isfile(upname):
            os.rename(upname, lowname)
        if os.path.isfile(midname):
            os.rename(midname, lowname)

#-------------------------------------------------------------------------------
#--- (4) Downloading Source
#-------------------------------------------------------------------------------
source = dcc + 'erate.zip?attredirects=0&d=1'


#-------------------------------------------------------------------------------
#--- (5) Terminating
#-------------------------------------------------------------------------------
print 'Terminating. Now simply run NHISPrep.do to convert all dat to dta format.'


