##################
## ASSIGNMENT 1 ##
##################

# specify the directory where the data is located
specdata<-"/Users/Zelda/Data Science/Intro to R/specdata"

#----------#
#- PART 1 -#
#----------#

#######################################################
## Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate)
## across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory',
## 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors'
## particulate matter data from the directory specified in the 'directory' argument and returns the mean
## of the pollutant across all of the monitors, ignoring any missing values coded as NA.
#######################################################

## Load pollutant mean function
source("pollutantmean.R")

## Test 1
pollutantmean(specdata,"sulfate",1:10)
#-- should be 4.064

## Test 2
pollutantmean(specdata,"nitrate",70:72)
#-- should be 1.706

## Test 3
pollutantmean(specdata,"nitrate",23)
#-- should be 1.281

#----------#
#- PART 2 -#
#----------#

#####################
# Write a function that reads a directory full of files and reports 
# the number of completely observed cases in each data file. 
# The function should return a data frame where the first column is the name of
# the file and the second column is the number of complete cases
#####################

## Load complete function
source("complete.R")

## Test 1
complete(specdata,1)

## Test 2
complete(specdata, c(2, 4, 8, 10, 12))

## Test 3
complete(specdata, 30:25)

## Test 4
complete(specdata, 3)

#----------#
#- PART 3 -#
#----------#

#############
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0
## Return a numeric vector of correlations
############

## Load corr and complete function
source("corr.R")
source("complete.R")

##-- TEST 1 --##
cr <- corr(specdata,150)
head(cr)

summary(cr)

##-- TEST 2 --##
cr <- corr(specdata,400)
head(cr)

summary(cr)

##-- TEST 3 --##
cr <- corr(specdata,5000)
summary(cr)

length(cr)

##-- TEST 4 --##
cr <- corr(specdata)
summary(cr)

length(cr)