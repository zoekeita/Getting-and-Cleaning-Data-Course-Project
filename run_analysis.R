## This script creates a tidy data set with avg of each variable for each 
## activity and subject by merging data from numerous text files and 
## cleaning data.

##0.1 Load reshape2
library(reshape2)

## 0.2.1 Download dataset
if(!file.exists("./data_UCI")){dir.create("./data_UCI")}
fileUrl <- 
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI
%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data_UCI/Dataset.zip")
        
## 0.2.2 Unzip the dataset
unzip(zipfile = ".data_UCI/Dataset.zip", exdir = "./data_UCI")
                
## 0.3 Read all required text files
  ## 0.3.1 Read test data:
  test <- read.table("./data_UCI/UCI HAR Dataset/test/X_test.txt")
  test_activity <- read.table("./data_UCI/UCI HAR Dataset/test/y_test.txt")
  test_subjectId <- read.table("./data_UCI/UCI HAR Dataset/test/subject_test.txt")
          
  ## 0.3.2 Read training data:
  train <- read.table("./data_UCI/UCI HAR Dataset/train/X_train.txt")
  train_activity <- read.table("./data_UCI/UCI HAR Dataset/train/y_train.txt")
  train_subjectId <- read.table("./data_UCI/UCI HAR Dataset/train/subject_train.txt")
          
  ## 0.3.3 Read activity labels:
  activity_labels <- read.table("./data_UCI/UCI HAR Dataset/activity_labels.txt")
          
  ## 0.3.4 Read features:
  features <- read.table("./data_UCI/UCI HAR Dataset/features.txt")
  
## 1. Merge the training and the test sets to create one data set:
## 1.1 Merge all subject data
subject_data <- rbind(train_subjectId, test_subjectId)

## 1.2 Merge all activity data
activity_data <- rbind(train_activity, test_activity)

## 1.3 Merge all features data
features_data <- rbind(train, test)

## 1.4 Assign variables names
names(subject_data)<-c("subject")
names(activity_data)<- c("activity")
names(features_data)<- features$V2

## 1.5 Combine subject and activity into one data file
sub_and_act <- cbind(subject_data, activity_data)
all_data <- cbind(features_data, sub_and_act)

## 2. Extract only the measurements on the mean and standard deviation 
##    for each measurement:
feature_names <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
NamesSelected <- c(as.character(feature_names), "subject", "activity" )
mean_std <- subset(all_data, select = NamesSelected)

## 3. Use descriptive activity names to name the activities in the data:
names(mean_std) <- gsub("^t", "time", names(mean_std))
names(mean_std) <- gsub("^f", "frequency", names(mean_std))
names(mean_std) <- gsub("Acc", "Accelerometer", names(mean_std))
names(mean_std) <- gsub("Gyro", "Gyroscope", names(mean_std))
names(mean_std) <- gsub("Mag", "Magnitude", names(mean_std))
names(mean_std) <- gsub("BodyBody", "Body", names(mean_std))

## 4. Label the data set with descriptive variable names:
## This was done in 1.4

## 5. Create a file with new tidy dataset taking avg of each var:
mean_stdTidy <- aggregate(. ~subject + activity, mean_std, mean)
mean_stdTidy <- mean_stdTidy[order(mean_stdTidy$subject, mean_stdTidy$activity),]
write.table(mean_stdTidy, file = "Tidydata.txt", row.name=FALSE)
