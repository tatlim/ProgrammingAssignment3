
# Download and extract zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "UCI_HAR_Dataset.zip", method = "curl")
dateDownloaded <- date()
unzip(zipfile = "UCI_HAR_Dataset.zip")

# Load the data that is spread across several files
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")  # subject id
train.activity <- read.table("UCI HAR Dataset/train/y_train.txt")       # activity id
train.data <- read.table("UCI HAR Dataset/train/X_train.txt")           # actual data

test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.activity <- read.table("UCI HAR Dataset/test/y_test.txt")
test.data <- read.table("UCI HAR Dataset/test/X_test.txt")

features <- read.table("UCI HAR Dataset/features.txt")
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Create the train and test data frames from the columns the
train <- cbind(train.subject, train.activity, train.data)
test <- cbind(test.subject, test.activity, test.data)

# 1. Merge the training and the test sets to create one data set
all.data <- rbind(train, test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement


# 3. Use descriptive activity names to name the activities in the data set


# 4. Appropriately label the data set with descriptive variable names


# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.