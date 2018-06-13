# Description
This project is part of "Getting and Cleaning Data Course Project: Peer-graded Assignment" for the course ["Getting and Cleaning Data"](https://www.coursera.org/learn/data-cleaning) offered by John Hopkins University via Coursera.

# Objectives
As stated at the course webpage:

"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis."

The student "should create one R script called run_analysis.R that does the following."

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Instructions

In order to make the script work, you will need to:

1. Download this [file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file under your preferred workspace folder. The script respects the directory structure as it is. There is no need to move files if you unzipped the file above under your workspace folder.
3. Be sure that you have the following R libraries installed:
* readr
* tidyr
* dplyr
* reshape2
(Note: Remember, the command to install packages is *install.packages("name of library")*.


# Acknowledgements
The dataset is described at [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and it was provided by reference [1]. 

# References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
