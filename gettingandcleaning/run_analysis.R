## run_analysis

## The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.  
## The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers 
## on a series of yes/no questions related to the project. 

##  This script will do the following:
##    1) Merges the training and the test sets to create one data set.
##    2) Extracts only the measurements on the mean and standard deviation for each measurement. 
##    3) Uses descriptive activity names to name the activities in the data set
##    4) Appropriately labels the data set with descriptive variable names. 
##    5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Downloading and unzipping the dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./data")){
  dir.create ("./data")}
zipfileName <- "./data/dataset.zip"
download.file(fileURL, zipfileName)

unzip(zipfileName, exdir="./data")

## Merging the training and the test sets into a single data set
## First we read the train data
xTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

## Next we read the test data
xTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

## Reading features
features <- read.table("./data/UCI HAR Dataset/features.txt")

## Reading activity 
activityLabels = read.table("./data/UCI HAR Dataset/activity_labels.txt")

## Assign the column names:
colnames(xTrain) <- features[,2]
colnames(yTrain) <- "activityid"
colnames(subjectTrain) <- "subjectid"

colnames(xTest) <-  features[,2]
colnames(yTest) <- "activityid"
colnames(subjectTest) <- "subjectid"

colnames(activityLabels) <- c("activityid", "activitytype")

## Combining all data into one data set called finalSet
combinedTrain <- cbind(yTrain, subjectTrain, xTrain)
combinedTest <- cbind(yTest, subjectTest, xTest)
finalSet <-  rbind(combinedTrain, combinedTest)

## Extract the measurements on the mean and standard deviation for each measurement
columnNames <- colnames(finalSet)

meanOrStd <- (grepl("activityid", columnNames) | grepl("subjectid", columnNames) | grepl("mean..", columnNames) | grepl("std...", columnNames))
extract <- finalSet[, meanOrStd==TRUE]
                       
##Use descriptive activity names to name the activities in the data set
finalSetwithActivityLabels <- merge(extract, activityLabels, by="activityid", all.x=TRUE)

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Create Second Tidy Data Set
tidySetDuex <- aggregate(. ~subjectid+activityid, finalSetwithActivityLabels, mean)
tidySetDuex <- tidySetDuex[order(tidySetDuex$subjectid, tidySetDuex$activityid),]

## Write second tidy data set in txt file
write.table(tidySetDuex, "tidySetDuex.txt", row.name=FALSE)



