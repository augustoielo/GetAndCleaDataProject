# Getting and Cleaning Data Course Project

This repository contains four items required for the course project:

* README.md (this file)
* Codebook.md
* run_analysis.R
* tidy.txt

## Codebook.md

The Codebook contains:

* Information about the original project
* List of the tidy data set variables

## run_analysis.R

R script that does the following:

* Downloads data from the internet
* Unzip the original data in the working directory
* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

To run the script from command line:

    Rscript run_analysis.R

## tidy.txt

The output dataset dataset containing the average of each variable for each activity and each subject as described in the [Code Book](CodeBook.md).

## OS and R version used
* Windows 7 Ultimate x64
* R v3.2.3 x64
