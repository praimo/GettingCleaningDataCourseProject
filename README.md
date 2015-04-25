# Getting and Cleaning Data - Course Project
## Data Science Track - Johns Hopkins University


This repository contains the `run_analysis.R` script , `CodeBook.md`, `README.md`, and output file, `averages_data.txt`.  The data files can be  downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  

 A full description of the data is available at the site where the data was obtained: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files

`CodeBook.md` describes the data, the variables, and any transformations performed to clean up the data.

All downloaded data should be unzipped and placed in one folder (example: `UCIHAR`) and set as the working directory. File names should not be altered.

`run_analysis.R` contains the code to perform the analyses required by these 5 steps: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script can be launched in RStudio by running ```source("run_analysis.R")```.

The output of the script is the independent tidy data set named `averages_data.txt` and is created by the script using the write.table() function with row.name=FALSE.
