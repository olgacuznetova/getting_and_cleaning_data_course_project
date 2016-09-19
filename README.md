# getting_and_cleaning_data_course_project
######Coursera Getting and Cleaning data course Final Project
######Olga Cuznetova



##Overview of the project: 
The purpose of the run_analysis.R is to prepare tidy data from the original dataset for further analysis. An experiment has been run on 30 people using  accelerometer and gyroscope technologies. Training data represents 70% of the data and testing - 30%. Participants were tested during different activities and all the collected data can be found in the following **[zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)**. 
You can find further information on experiment and data **[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)**. 

##Modifications
Line 15 sets the working directory, in order to run the script without modifications copy all the file in the working directory that you set up. 

##Script structure
The following script was created according to Coursera assignment guidline:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set.
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Comments will help to navigate and follow the script

## Files in the repo
  *1. run_analysis.R - R script*
  *2. tidyData.txt - resulting dataset*
  *3. README.md - readme file*
  *4. CodeBook.md - describes the variables, the data, and any transformations or work that you performed to clean up the data*

