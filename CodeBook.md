## Data overview from the [UCI Machine Learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#): 
#### Data set information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
#### Attribute Information:
The dataset is then divided in two parts and they can be used separately. 
1. Inertial sensor data 
--1. Raw triaxial signals from the accelerometer and gyroscope of all the trials with with participants. 
--2. The labels of all the performed activities. 
2. Records of activity windows. Each one composed of: 
--1. A 561-feature vector with time and frequency domain variables. 
--2. Its associated activity label. 
--3. An identifier of the subject who carried out the experiment.

###Assignment: 
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps in the script run_analysis.R
All the data can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
### Step 1: Files below were read in and combines using cbind and rbind. Column names were assigned as well. 
* features.txt
* activity_labels.txt
* x_train.txt
* y_train.txt
* subject_train.txt
* train_data <- cbind(x_train, y_train, subj_train)
* x_test.txt
* y_test.txt
* subject_test.txt
* test_data <- cbind(x_test, y_test, subj_test)
* full_data <- rbind(train_data, test_data)

### Step 2: Measurements that only contain mean and stddev were selected
* grepl was used to get logical operator YES for measurements containing standard deviation, mean and id
* data set was updated only with measurements == Yes from the line above 

### Step 3: Descriptive activity names
  Data set was assignes descriptive activity names by merging data with activity_labels
  
### Step 4: Labeling data with descriptive names
  gsub was used to substitute names 
  
### Step 5: tidyData was created 
 * ActivityType was removed 
 * Data aggregated using mean of each variable for each activity and each subject
 * Data set was merged back with activity_labels, 
 * Data was written as tidyData.txt

### Variables:
* subject - The ID of the test subject
* activity - The type of activity performed when the corresponding measurements were taken
* activity type: 
**WALKING (value 1): subject was walking during the test
**WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
**WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
**SITTING (value 4): subject was sitting during the test
**STANDING (value 5): subject was standing during the test
**LAYING (value 6): subject was laying down during the test)
* timeBodyAccMagnitudeMean	
* timeBodyAccMagnitudeStdDev
* timeGravityAccMagnitudeMean
* timeGravityAccMagnitudeStdDev	
* timeBodyAccJerkMagnitudeMean
* timeBodyAccJerkMagnitudeStdDev
* timeBodyGyroMagnitudeMean
* timeBodyGyroMagnitudeStdDev
* timeBodyGyroJerkMagnitudeMean	
* timeBodyGyroJerkMagnitudeStdDev
* freqBodyAccMagnitudeMean
* freqBodyAccMagnitudeStdDev
* freqBodyBodyAccJerkMagnitudeMean
* freqBodyBodyAccJerkMagnitudeStdDev
* freqBodyBodyGyroMagnitudeMean	
* freqBodyBodyGyroMagnitudeStdDev
* freqBodyBodyGyroJerkMagnitudeMean	
* freqBodyBodyGyroJerkMagnitudeStdDev

