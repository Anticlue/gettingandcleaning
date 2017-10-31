---
title: "CodeBook"
author: "Elyse Nielsen"
date: "October 30, 2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Getting and Cleaning Course Project


This ReadMe provides a quick start for how to run the run_analysis.R code and what needs to be setup to assure the code runs properly.

### The Why? 
The goal of this work is provide a demonstration of how a tidy data set can be created for the Getting and Cleaning Data Course.

The data for this project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the data used is located here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


###  What do you need to change to run this script.
It is suggested you pay attention to the location of the files being saved on your comporter.  You may want to validate teh working directory to understand where the output will be saved.


### What does run_analysis do?
Run_analysis.R goes about the following actions

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


