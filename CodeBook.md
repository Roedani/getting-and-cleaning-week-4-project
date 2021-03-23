# CookBook for the project in the 4th week in the getting and cleaning data at Coursera

First step to download the data,, and it can be using the 
## creating a directory and download.file to this new directory
if(!file.exists("./corsera")){dir.create("./coursera")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./coursera/data.zip",method="curl")

unzip(zipfile="./coursera/data.zip",exdir="./data_1")

## or download direct it to your desktop and unzipp just clicking on the folder
then, setting the work directory
setwd("~/Desktop/Coursera/Week 4 getting and cleaning data/UCI HAR Dataset")

## next step uploading the data
for this step needs to use the libraries:
library(data.table)
library(dplyr)

## after downloading the txt data and information will start to combine the files
### using cbind() and rbind()

## now will add the last part that is the activty labels
### using merge()

## creating a vector to subset only the collumn with mean and std
### subset()

## changing the column names
### using gsub()

## grouping by subject_ID, activity_ID, activity_Type and summarize using mean
using library(dplyr)

## saving  tidy_final in "tidy_Data.txt"
### using write.table()





