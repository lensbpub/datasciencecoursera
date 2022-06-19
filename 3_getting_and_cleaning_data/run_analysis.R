

# Loading packages
library("data.table")
library("reshape2")

# Getting the data
path <- getwd()
#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url, file.path(path, "dataFiles.zip"))
#unzip(zipfile="dataFiles.zip")

# Getting labels and features
activity_labels <- fread(file.path(path, "UCI HAR Dataset/activity_labels.txt"), 
                         col.names=c("classLabels", "activityName"))
features <- fread(file.path(path, "UCI HAR Dataset/features.txt"),
                  col.names=c("index","featureNames"))
features_grep <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[features_grep, featureNames]
measurements <- gsub('[()]', '', measurements)

# Load training datasets
train <- fread(file.path(path, "UCI HAR Dataset/train/X_train.txt"))[, features_grep, with=FALSE]
data.table::setnames(train, colnames(train), measurements)
train_activities <- fread(file.path(path, "UCI HAR Dataset/train/Y_train.txt"), 
                          col.names=c("Activity"))
train_subjects <- fread(file.path(path, "UCI HAR Dataset/train/subject_train.txt"),
                        col.names=c("SubjectNum"))
train <- cbind(train_subjects, train_activities, train)

# Load test datasets
test <- fread(file.path(path, "UCI HAR Dataset/test/X_test.txt"))[, features_grep, with=FALSE]
data.table::setnames(test, colnames(test), measurements)
test_activities <- fread(file.path(path, "UCI HAR Dataset/test/Y_test.txt"),
                         col.names = c("Activity"))
test_subjects <- fread(file.path(path, "UCI HAR Dataset/test/subject_test.txt"),
                       col.names = c("SubjectNum"))
test <- cbind(test_subjects, test_activities, test)

# Merging dataset
combined_ds <- rbind(train, test)
combined_ds[["Activity"]] <- factor(combined_ds[, Activity], levels = activity_labels[["classLabels"]],
                                    labels=activity_labels[["activityName"]])
combined_ds[["SubjectNum"]] <- as.factor(combined_ds[, SubjectNum])
combined_ds <- reshape2::melt(data=combined_ds, id=c("SubjectNum", "Activity"))
combined_ds <- reshape2::dcast(data=combined_ds, SubjectNum+Activity ~ variable, fun.aggregate=mean)

# Writing
data.table::fwrite(x=combined_ds, file="tidyData.txt", quote=FALSE)
