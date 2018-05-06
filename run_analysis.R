library(dplyr)

# Download and extract zip file
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file.url, destfile = "UCI_HAR_Dataset.zip", method = "curl")
date.downloaded <- date()
unzip(zipfile = "UCI_HAR_Dataset.zip")

# Load the data that is spread across several files
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")  # subject
train.activity <- read.table("UCI HAR Dataset/train/y_train.txt")       # activity
train.data <- read.table("UCI HAR Dataset/train/X_train.txt")           # actual measurement data

test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.activity <- read.table("UCI HAR Dataset/test/y_test.txt")
test.data <- read.table("UCI HAR Dataset/test/X_test.txt")

features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)                # feature labels
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)  # activity labels

# Bind the columns of train/test data sets
train <- cbind(train.subject, train.activity, train.data)
test <- cbind(test.subject, test.activity, test.data)


# 1. Merge the training and the test sets to create one data set.
all.data <- rbind(train, test)


# 2. Extract only the measurements on the mean and standard deviation for each measurement
feature.indexes <- grep('-(mean|std)', features[, 2])
# increment feature.index, since we have two additional columns (subject id, activity id) in all.data
std.mean.indexes <- c(1:2, feature.indexes + 2)
std.mean.data <- all.data[, std.mean.indexes]


# 3. Use descriptive activity names to name the activities in the data set
std.mean.data[, 2] <- factor(std.mean.data[, 2], levels = activity.labels[, 1], labels = activity.labels[, 2])


# 4. Appropriately label the data set with descriptive variable names
feature.names <- grep("-(mean|std)", features[, 2], value = TRUE)
# replace hypens with underscores and remove parentheses
feature.names <- gsub("-", "_", feature.names)
feature.names <- gsub("\\(\\)", "", feature.names)
names(std.mean.data) <- c("subject", "activity", feature.names)


# 5. From the data set in step 4, create a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
tidy.data <- std.mean.data %>% group_by(subject, activity) %>% summarize_all(funs(mean))
write.table(tidy.data, file = "tidy_data.txt", row.names = FALSE)
