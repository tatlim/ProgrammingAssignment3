
# Download and extract zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "UCI_HAR_Dataset.zip")
dateDownloaded <- date()
unzip(zipfile = "UCI_HAR_Dataset.zip")

# 1. Merge the training and the test sets to create one data set


# 2. Extract only the measurements on the mean and standard deviation for each measurement


# 3. Use descriptive activity names to name the activities in the data set


# 4. Appropriately label the data set with descriptive variable names


# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.