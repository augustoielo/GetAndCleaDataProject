# Assignment: Getting and Cleaning Data Course Project

# This run_analysis.R script does the following:

# 0. Downloads data from the internet
# 1. Merges the training and the test sets to create one data set
# 2. Extracts only the measurements on the mean and standard deviation for 
#    each measurement
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names
# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject



# download the dataset into your initial working directory
if (!file.exists("UCI HAR Dataset")) {
        dir.create("UCI HAR Dataset")
}
if (!file.exists("getdata-projectfiles-UCI_HAR_Dataset.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                        "getdata-projectfiles-UCI_HAR_Dataset.zip")
}

unzip("getdata-projectfiles-UCI_HAR_Dataset.zip")

# set the new working directory
setwd("UCI HAR Dataset")

# Extracts only the measurements on the mean and standard deviation for 
# each measurement

features <- read.table("features.txt", stringsAsFactors=F, col.names=c("id", "name")) $name
colClasses <- grepl("-(mean|meanFreq|sd)\\(", features)
colClasses <- ifelse(colClasses, "numeric", "NULL")

# Appropriately labels the data set with descriptive variable names

train <- read.table("train/X_train.txt", col.names=features, colClasses=colClasses, check.names=F)
train <- cbind(read.table("train/y_train.txt", col.names="activity"), train)
train <- cbind(read.table("train/subject_train.txt", col.names="subject"), train)

test <- read.table("test/X_test.txt", col.names=features, colClasses=colClasses, check.names=F)
test <- cbind(read.table("test/y_test.txt", col.names="activity"), test)
test <- cbind(read.table("test/subject_test.txt", col.names="subject"), test)

# Merges the training and the test sets to create one data set

dataSet <- rbind(train, test)

# Uses descriptive activity names to name the activities in the data set

labels <- read.table("activity_labels.txt", col.names=c("id", "name"))
dataSet$activity <- factor(dataSet$activity, levels=labels$id, labels=labels$name)

# From the data previously set, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject
tidyData <- aggregate(. ~ activity + subject, dataSet, mean)
write.table(tidyData, "tidy.txt", row.names=F)
