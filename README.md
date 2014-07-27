Documentation: run_analysis.R
======================

Abstract
----------------------
The script (run_analysis.R) converts the data collected from the
accelerometers of the Samsung Galaxy S smartphone to a tidy data set
available here.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Run the script
----------------------

To run the script, the orinal data needs to be unzipped and the "UCI
HAR Dataset" directory should be placed at the currnet directory.

The script creates a CSV file: tidy.txt. It is the result of the
following operations.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Script 
----------------------

This section explains the internal working of the script.

First, the script loads all the raw data. It then combines the
training data and the test data with rbind fnction.

We then remove all the columns except the ones which name contains
either "mean()" or "std()".

It then adds the descriptive activity name by joining the
actibity_label.txt and the dataset with the merge function. It also
adds the subject column from subject_*.txt files.

Finally, the script uses ddply function of plyr package to calculate
the grouped average by the subject and the activity.
