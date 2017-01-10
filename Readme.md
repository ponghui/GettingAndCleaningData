## Getting and Cleaning Data Project

Repository for the submission of assignment for the course Getting and Cleaning Data Week 4.

### Overview
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The source data used in this project can be found in the following url(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Prepatory Step(s)
Ensure that the working directory of the R engine is set to where the following data files resides. (refer above for reference url)

./training/subject_train.txt
./training/X_train.txt
./training/Y_train.txt

./test/subject_test.txt
./test/X_test.txt
./test/Y_test.txt

activity_labels.txt
features.txt

### Project Summary
The following is a summary description of the project instructions

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file.