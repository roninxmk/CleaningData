# Code Book

## Human Activity Recognition Using Smartphones Dataset

The original [data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) was modified to attend the demands from the course ["Getting and Cleaning Data"](https://www.coursera.org/learn/data-cleaning) offered by John Hopkins University via Coursera.

The complete set of files can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Processed data

The original data provided sensor signals (accelerometer and gyroscope) from a group of 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist.

The original dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The files utilized in this project were:

    * 'README.txt'

    * 'features_info.txt'

    * 'features.txt'

    * 'activity_labels.txt'

    * 'train/X_train.txt'

    * 'train/y_train.txt'

    * 'train/subject_train.txt'

    * 'test/X_test.txt': Test set.

    * 'test/y_test.txt': Test labels.

    * 'test/subject_test.txt'	

A more detailed description of the data can be found in the text files mentioned above.

### Merged data (merged_set)
 
The actual merged dataset (**merged_set**) now contains both group of volunteers (training data and test data) discerned by the variable *'type'*.

Besides, this set also includes the activities being performed by each individual (under the label *'activity'*) and the ID of each individual (under the label *'subject'*).

### Mean and standard deviation data (meanstd_set)

The **meanstd_set** contains only the measurements on the mean and standard deviation for each measurement and it is derived from the **merged_set** dataset, plus the *'subject'*, *'activity'*, and *'type'* variables.

### Tidy set (newtidy_set)

The **newtidy_set** contains independent tidy data set with the average of each variable for each activity and each subject. It is based on the **meanstd_set**.

## Some header names changes

Some header names were changed/corrected to make more clean and clear view.

    - fBodyBody<string>: any name containing fBodyBody<string> was renamed to fBody<string>.
    - angle(tBodyAccJerkMean),gravityMean): this was corrected to angle(tBodyAccJerkMean,gravityMean).
    - (): any name containing '()' had them removed.
    - bandsEnergy: all bandsEnergy fields had their respective axis added to its name. 
	
# Acknowledgements
The dataset is described at [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and it was provided by reference [1]. 

# References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
