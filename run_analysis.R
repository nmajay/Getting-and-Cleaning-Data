# 1. Merges the training and the test sets to create one data set.

x_train <- read.table("./data/X_train.txt")
x_test <- read.table("./data/X_test.txt")
X <- rbind(x_train, x_test)

sub_train <- read.table("./data/subject_train.txt")
sub_test <- read.table("./data/subject_test.txt")
S <- rbind(sub_train, sub_test)

y_train <- read.table("./data/y_train.txt")
y_test <- read.table("./data/y_test.txt")
Y <- rbind(y_train, y_test)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./data/features.txt")
needed_measurements <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

X <- X[, needed_measurements]
names(X) <- features[needed_measurements, 2]

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./data/activity_labels.txt")
Y[,1] = activity_labels[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.
names(S) <- "subject"
cleaned_dataset <- cbind(S, Y, X)
write.table(cleaned_dataset, "./data/merged_clean_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activity_labels[,1])
numCols = dim(cleaned_dataset)[2]
result = cleaned_dataset[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activity_labels[a, 2]
    tmp <- cleaned_dataset[cleaned_dataset$subject==s & cleaned_dataset$activity==activity_labels[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "./data/Averages_Dataset.txt",row.name=FALSE)