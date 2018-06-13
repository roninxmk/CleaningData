## Clean all workbench environment
rm(list=ls())

## Load necessary libraries
library(readr)
library(tidyr)
library(dplyr)
library(reshape2)

## Gather the activity label file and insert the data into table actlbl_tab
file <- "UCI HAR Dataset/activity_labels.txt"
actlbl_tab <- read.table(file, sep = "" , header = F , na.strings=c(""," ","NA"), stringsAsFactors= F)

## Gather the features file and insert the data into table feat_tab
file <- "UCI HAR Dataset/features.txt"
feat_tab <- read.table(file, sep = "" , header = F , na.strings=c(""," ","NA"), stringsAsFactors= F)

## Gather the subject file values and insert the data into table subjecttrain_tab
file <- "UCI HAR Dataset/train/subject_train.txt"
subjecttrain_tab <- read.table(file, sep = "" , header = F , na.strings=c(""," ","NA"), stringsAsFactors= F)

## Gather the X_train file values and insert the data into table Xtrain_tab
file <- "UCI HAR Dataset/train/X_train.txt"
Xtrain_tab <- read.table(file, sep = "" , header = F , na.strings=c(""," ","NA"), stringsAsFactors= F)

## Gather the y_train file values and insert the data into table ytrain_tab
file <- "UCI HAR Dataset/train/y_train.txt"
ytrain_tab <- read.table(file, sep = "" , header = F , na.strings=c(""," ","NA"), stringsAsFactors= F)

## Gather the subject file values and insert the data into table subjecttrain_tab
file <- "UCI HAR Dataset/test/subject_test.txt"
subjecttest_tab <- read.table(file, sep = "" , header = F , na.strings=c(""," ","NA"), stringsAsFactors= F)

## Gather the X_test file values and insert the data into table Xtest_tab
file <- "UCI HAR Dataset/test/X_test.txt"
Xtest_tab <- read.table(file, sep = "" , header = F , na.strings=c(""," ","NA"), stringsAsFactors= F)

## Gather the y_test file values and insert the data into table ytest_tab
file <- "UCI HAR Dataset/test/y_test.txt"
ytest_tab <- read.table(file, sep = "" , header = F , na.strings=c(""," ","NA"), stringsAsFactors= F)

## Create feat_head as a list of headers
# The names of the headers are contained in the second row of feat_tab table
feat_head <- feat_tab[,2]

## Fix the headers to be compatible to features_info.txt
# Some of the headers have the wrong name such as fBodyBodyGyroMag 
feat_head <- gsub("BodyBody","Body",feat_head)
# angle(tBodyAccJerkMean),gravityMean) is also wrong. It has an extra ')'
feat_head <- gsub("),",",",feat_head)
# Clean all '()' from header names
feat_head <- gsub("\\(\\)","",feat_head)


## Add the activity values from y file to each of the tables
training_set <- cbind(Xtrain_tab, ytrain_tab)
test_set <- cbind(Xtest_tab, ytest_tab)

## Add the column name "activity".
# "activity" variable consists here of numerical values of activities 
feat_head <- c(feat_head, "activity")

## Add the subject values from subject file to each of the tables
training_set <- cbind(training_set, subjecttrain_tab)
test_set <- cbind(test_set, subjecttest_tab)

## Add the column name "activity".
# "activity" variable consists here of numerical values of activities 
feat_head <- c(feat_head, "subject")

## Add the correct headers to both tables separately
colnames(training_set) <- feat_head
colnames(test_set) <- feat_head

## Add the respective observations for "type"
# Xtrain_tab values are the "training" values
# Xtest_tab values are the "test" values
training_set[,"type"] <- "training"
test_set[,"type"] <- "test"

## 1. Merges the training and the test sets to create one data set.
# Create the one data set contaning training and test sets
merged_set <- rbind(training_set, test_set)
colnames(merged_set)[563] <- "subject"


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Create the one data set contaning mean and std values
meanstd_set <- select(merged_set, c(contains("-mean"), contains("-std")))

## 3. Uses descriptive activity names to name the activities in the data set
# Replace the numeric values of 'activity' by their respective values from actlbl_tab
names(actlbl_tab)[2] <- "activity"
merged_set$activity <- actlbl_tab[match(merged_set$activity, actlbl_tab$V1), 2, drop = F]

meanstd_set <- cbind(merged_set$subject, merged_set$activity, meanstd_set)
colnames(meanstd_set)[1] <- "subject"

## 4. Appropriately labels the data set with descriptive variable names.
# The 'activity', 'subject' and 'type' columns were already created.
# Some column names were previously cleaned when creating feat_tab. See above.
# The bandsEnergy() headers have repeated names and each set 
# must be attributed to its specific axis (X, Y or Z)
names(merged_set)[303:316]<-c(lapply(feat_head[303:316], function(txt) {paste(txt,"X",sep="-")}),recursive=TRUE)
names(merged_set)[317:330]<-c(lapply(feat_head[317:330], function(txt) {paste(gsub(".1","",txt),"Y",sep="-")}),recursive=TRUE)
names(merged_set)[331:344]<-c(lapply(feat_head[331:344], function(txt) {paste(gsub(".2","",txt),"Z",sep="-")}),recursive=TRUE)

names(merged_set)[382:395]<-c(lapply(feat_head[382:395], function(txt) {paste(txt,"X",sep="-")}),recursive=TRUE)
names(merged_set)[396:409]<-c(lapply(feat_head[396:409], function(txt) {paste(gsub(".1","",txt),"Y",sep="-")}),recursive=TRUE)
names(merged_set)[410:423]<-c(lapply(feat_head[410:423], function(txt) {paste(gsub(".2","",txt),"Z",sep="-")}),recursive=TRUE)

names(merged_set)[461:474]<-c(lapply(feat_head[461:474], function(txt) {paste(txt,"X",sep="-")}),recursive=TRUE)
names(merged_set)[475:488]<-c(lapply(feat_head[475:488], function(txt) {paste(gsub(".1","",txt),"Y",sep="-")}),recursive=TRUE)
names(merged_set)[489:502]<-c(lapply(feat_head[489:502], function(txt) {paste(gsub(".2","",txt),"Z",sep="-")}),recursive=TRUE)

## 5. From the data set in step 4, creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject.
#melted_set <- melt(meanstd_set, id.vars=c("activity","subject"))
melted_set <- melt(meanstd_set, id.vars=c("activity","subject"))
newtidy_set <- dcast(melted_set, activity+subject ~ variable, mean)
