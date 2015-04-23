# Getting and Cleaning Data - Course Project Script
# Data Science Speicalization Track
# Courseara - Johns Hopkins University

# get the data for the project
# download the data from: 
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# unzip the files into a folder named "UCIHAR" and set as your working directory.

library(plyr)

# Step 1: Merge the training and test sets to create one data set

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)


# Step 2: Extract only the measurements on the mean and standard deviation 
# for each measurement

# load data column names
features <- read.table("features.txt")[,2]

# extract only columns with mean or std in their names for each measurement
mean_and_std_features <- grep("mean|std", features)

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# update column names
names(x_data) <- features[mean_and_std_features, 2]


# Step 3: Use descriptive activity names to name the activities in the data set

# load activity labels
activity_label <- read.table("activity_labels.txt")[,2]

# update values with descriptive activity names
y_data[, 1] <- activity_label[y_data[, 1], 2]

# update column name
names(y_data) <- "activity"


# Step 4: Appropriately label the data set with descriptive variable names

# update column name
names(subject_data) <- "subject"

# merge all data into one data set
all_data <- cbind(x_data, y_data, subject_data)

# Step 5: From the 'all_data' data set in Step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject


# There are 68 columns in 'all_data'. The last two are 'activity' and 'subject'.
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Output .txt file
write.table(averages_data, "averages_data.txt", row.name=FALSE)