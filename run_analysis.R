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
  test <- read.table("./data_UCI/UCI HAR Dataset/test/x_test.txt")
  test_activity <- read.table("./data_UCI/UCI HAR Dataset/test/y_test.txt")
  test_subjectId <- read.table("./data_UCI/UCI HAR 
                               Dataset/test/subject_test.txt")
          
  ## 0.3.2 Read training data:
  train <- read.table("./data_UCI/UCI HAR Dataset/train/x_train.txt")
  train_activity <- read.table("./data_UCI/UCI HAR Dataset/train/y_train.txt")
  train_subjectId <- read.table("./data_UCI/UCI HAR 
                                Dataset/train/subject_train.txt")
          
  ## 0.3.3 Read activity labels:
  activity_labels <- read.table("./data_UCI/UCI HAR 
                                Dataset/activity_labels.txt")
          
  ## 0.3.4 Read features:
  features <- read.table("./data_UCI/UCI HAR Dataset/features.txt")
  
  ## 0.3.5 Labeling column names:
  colnames(test) <- features[,2]
  colnames(test_activity) <- "activity_id"
  colnames(test_subjectId) <- "subject_id"
  
  colnames(train) <- features[,2]
  colnames(train_activity) <- "activity_id"
  colnames(train_subjectId) <- "subject_id"
  
  colnames(activity_labels) <- c("activity_id", "activity_names")
  
## 1. Merge the training and the test sets to create one data set:
  ## 1.1 Combine test data into one df:
  test_df <- cbind(test_subjectId, test_activity, test)
          
  ## 1.2 Combine training data into one df:
  train_df <- cbind(train_subjectId, train_activity, train)
          
  ## 1.3 Merge the two dfs
  train_and_test <- rbind(test_df, train_df)
          
## 2. Extract only the measurements on the mean and standard deviation 
##    for each measurement:
  ## 2.1 Reading col names:
  col_names <- colnames(train_and_test)
  
  ## 2.2 Create vector defining IDs, mean, and std:
  mean_std <- (grepl("subject_id", col_names) |
                       grepl("activity_id", col_names) |
                       grepl("mean", col_names) |
                       grepl("std", col_names)
               )
  meanstd_data <-  train_and_test[,mean_std == TRUE]
## 3. Use descriptive activity names to name the activities in the data:
  descr_names <- merge(activity_labels, meanstd_data, by= "activity_id", 
                     all= TRUE)
## 4. Label the data set with descriptive variable names:
  ## This was done in 0.3.5, 2.1, 2.2
        
## 5. Create a file with new tidy dataset:
## avg of each var for each activity and each subject
  ## 5.1 Melt the data for easier manipulation
  t_and_t_melt <- melt(descr_names, id=c("activity_id", "activity_names", 
                                         "subject_id"))
  ## 5.2 Cast the data according to avg of each var
  t_and_t_mean <- dcast(t_and_t_melt, activity_id + activity_names + 
                                subject_id ~ variable, mean)
  ## 5.3 Write tidy dataset file
  write.table(t_and_t_mean, "./Tidy.txt", row.names = FALSE)

