#   NHISprocess.py v0.00         damiancclarke             yyyy-mm-dd:2014-12-08
#---|----1----|----2----|----3----|----4----|----5----|----6----|----7----|----8
#
#This script downloads and processes all NHIS (National Health Interview Survey)
#data, resulting in a series of Stata dta files for each year from 1997-2013. T-
#his is the series of the survey after changes were made in 1996. To run the sc-
#ript, python 2.x is required.  The syntax is the following
# 
#  python NHISprocess.py DLDIR OUTDIR
#
#where DLDIR is the directory where web based downloads are sent on the computer
#and OUTDIR is the directory where processed files should be saved after the sc-
#ript terminates.
#
#This file is made available under the GNU Public License version 3. For questio-
#ns and comments:
#                     mailto:damian.clarke@economics.ox.ac.uk

#-------------------------------------------------------------------------------
#--- (1) Import required packages
#-------------------------------------------------------------------------------
from sys import argv
import os
import urllib2
import zipfile

script, DLDIR, OUTDIR = argv

#-------------------------------------------------------------------------------
#--- (2) URL for NHIS raw data (CDC website)
#-------------------------------------------------------------------------------
u1 = 'www.cdc.gov/nchs/nhis/nhis_'
u2 = '_data_release.htm'

print 'The script' + script + 'is taking files from:'

for year in range(1997,2014):
    print u1 + str(year) + u2

print 'saving them in ' + DLDIR + 'and processing them in ' + OUTDIR

#-------------------------------------------------------------------------------
#--- (3) Unpack, process
#-------------------------------------------------------------------------------
