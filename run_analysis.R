
###Assignment: 
    #1.Merges the training and the test sets to create one data set.
    #2.Extracts only the measurements on the mean and standard deviation for each measurement. 
    #3.Uses descriptive activity names to name the activities in the data set
    #4.Appropriately labels the data set with descriptive variable names. 
    #5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### The purpose of this project is to create tidy data that can be used for later analysis


##########
#1.Merge the training and the test sets to create one data set.
###set a directory to read in files
setwd("getttingANDcleaningdata/")

## Read in features
features <- read.table('features.txt',header=FALSE)

## Read in activity lables and assign column names
activity_labels <- read.table('activity_labels.txt',header=FALSE)
colnames(activity_labels)  <- c('activityId','activityType')

## Reading in train data and assign column names
###Reading in x_train
x_train <- read.table("X_train.txt", header=FALSE)
colnames(x_train) <- features[,2]
###Reading in column from y_train
y_train <- read.table("Y_train.txt", header=FALSE)
colnames(y_train) <- "activityId"
###Reading in column from subject_train
subj_train <- read.table("subject_train.txt", header=FALSE)
colnames(subj_train) <- "subjectId"
## Combine x_train, y_train and subj_train into one data set
train_data <- cbind(x_train, y_train, subj_train)

### Reading in test data and assign column names
###Reading in x_train
x_test <- read.table("X_test.txt", header=FALSE)
colnames(x_test) <- features[,2]
###Reading in column from y_train
y_test <- read.table("Y_test.txt", header=FALSE)
colnames(y_test) <- "activityId"
###Reading in column from subject_train
subj_test <- read.table("subject_test.txt", header=FALSE)
colnames(subj_test) <- "subjectId"
## Combine x_train, y_train and subj_train into one data set
test_data <- cbind(x_test, y_test, subj_test)

## Combine train and test
full_data <- rbind(train_data, test_data)

## Create a vector for the column names from the full_data
f_d_col_names  <- colnames(full_data)

##########
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 

##Using logical operator to select ID, mean and stddev 
id_mean_stdev_YES <- (grepl("activity..",f_d_col_names) | grepl("subject..",f_d_col_names) | grepl("-mean..",f_d_col_names) & !grepl("-meanFreq..",f_d_col_names) & !grepl("mean..-",f_d_col_names) | grepl("-std..",f_d_col_names) & !grepl("-std()..-",f_d_col_names))

##Getting records in full_data that contain mean and stddev only
full_data <- full_data[id_mean_stdev_YES==TRUE]

##########
#3.Uses descriptive activity names to name the activities in the data set

## include descriptive activity names
full_data <- merge(full_data, activity_labels, by='activityId', all.x=TRUE)

f_d_col_names <- colnames(full_data)

##########
#4.Appropriately label the data set with descriptive activity names. 

## Assigning new names
for (i in 1:length(f_d_col_names)) 
{
  f_d_col_names[i] <- gsub("\\()","",f_d_col_names[i])
  f_d_col_names[i] <- gsub("-std$","StdDev",f_d_col_names[i])
  f_d_col_names[i] <- gsub("-mean","Mean",f_d_col_names[i])
  f_d_col_names[i] <- gsub("^(t)","time",f_d_col_names[i])
  f_d_col_names[i] <- gsub("^(f)","freq",f_d_col_names[i])
  f_d_col_names[i] <- gsub("([Gg]ravity)","Gravity",f_d_col_names[i])
  f_d_col_names[i] <- gsub("[Mm]ag","Magnitude",f_d_col_names[i])
}

colnames(full_data) <- f_d_col_names

###########
#5.Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

##New table without activity type
full_data_no_activity  <- full_data[,names(full_data) != 'activityType']

##Getting mean of each variable
tidyData <- aggregate(full_data_no_activity[,names(full_data_no_activity) != c('activityId','subjectId')],by=list(activityId=full_data_no_activity$activityId,subjectId = full_data_no_activity$subjectId),mean)

##Adding activity type back
tidyData <- merge(tidyData,activity_labels,by='activityId',all.x=TRUE);

##Writing tidyData
write.table(tidyData,'tidyData.txt',row.names=TRUE,sep='\t');
