library(plyr)

## Reading data
print("Reading data");
print("  Reading features.txt");
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "name"), colClasses=c("factor", "character"))[["name"]]

print("  Reading x.train");
x.train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features, check.names=FALSE, colClasses="numeric")

print("  Reading x.test");
x.test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features, check.names=FALSE, colClasses="numeric")

print("  Reading y.train");
y.train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label", colClasses="factor")

print("  Reading y.test");
y.test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label", colClasses="factor")

print("  Reading activity_labels.txt");
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("label", "activity"), colClasses=c("factor", "character"))

print("  Reading subject_train.txt");
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"), colClasses=c("factor"))

print("  Reading subject_test.txt");
subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"), colClasses=c("factor"))

## Merging the training and the test sets to create one data set.
print("Merging the training and the test sets to create one data set.")
x <- rbind(x.train, x.test)
y <- rbind(y.train, y.test)
subject <- rbind(subject.train, subject.test)

rm(x.train)
rm(x.test)

## Extracting only the measurements on the mean and standard deviation for each measurement.
print("Extracting only the measurements on the mean and standard deviation for each measurement.")
mean.and.sd.features <- grep(".*(mean\\(\\)|std\\(\\)).*", features, value=TRUE)
mean.and.sd.x <- x[mean.and.sd.features]

## Add descriptive activity names to name the activities in the data set.
print("Adding descriptive activity names to name the activities in the data set.")
y.named <- merge(y, activity.labels, by = "label")
activity <- y.named[[2]]
mean.and.sd.x <- cbind(mean.and.sd.x, activity)

# add subject
mean.and.sd.x <- cbind(mean.and.sd.x, subject)

## Set column names
new.colnames <- colnames(mean.and.sd.x)
new.colnames <- c(new.colnames[1:(length(new.colnames) - 2)], "activity", "subject")
colnames(mean.and.sd.x) <- new.colnames

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
print("Creating a second, independent tidy data set with the average of each variable for each activity and each subject.")

tidy <- ddply(mean.and.sd.x, c("activity", "subject"), function(x) colMeans(x[mean.and.sd.features]))
write.csv(tidy, file="tidy.txt", row.names=FALSE)
