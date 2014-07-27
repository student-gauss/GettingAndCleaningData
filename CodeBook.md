Code book
======================

Abstract
----------------------
The code book explains the schema of the tidy data set created by run_analysis.R. 

The data file is a standard CSV format. The file name is tidy.txt
which is available in the project submission.

Fields
----------------------

The dataset has average of each measurement for each subject and activity.

The measurement is represented by column names which are specified in
feature.txt in the Samsung data set. For example,
tBodyGyroJerk-mean()-X represents the average of body gyro jerk
signal.

Each row represents an average of each measurement for a given pair of
activity and subject. For example, the first row represetns the
average measurements of subject 10 when she/he is laying down.

Transform
----------------------

The tidy data set was obtained by performing the following processing
on the original Samsung data set.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
