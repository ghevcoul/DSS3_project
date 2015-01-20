# Check if the data has already been downloaded
# If not, download and unzip it into working directory
if (!file.exists("UCI HAR Dataset/")){
    message("Downloading data")
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

# Read in test set data
test.data <- read.table("UCI HAR Dataset/test/X_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(test.subject) <- "subject"
test.activity <- read.table("UCI HAR Dataset/test/y_test.txt")
test.activity <- factor(test.activity$V1, labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
test <- cbind(test.subject, test.activity, test.data)
names(test)[2] <- "activity"
rm(test.data, test.subject, test.activity)

# Read in training set data
train.data <- read.table("UCI HAR Dataset/train/X_train.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(train.subject) <- "subject"
train.activity <- read.table("UCI HAR Dataset/train/y_train.txt")
train.activity <- factor(train.activity$V1, labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
train <- cbind(train.subject, train.activity, train.data)
names(train)[2] <- activity
rm(train.data, train.subject, train.activity)

# Merge the test and training sets
dat <- merge(test, train, by=intersect(names(test), names(train)), all=TRUE)
rm(test, train)
