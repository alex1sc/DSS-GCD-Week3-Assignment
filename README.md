# DSS - Get and Clean Data - Week 4 - Assignment 

## Introduction

The script is run_assignment.R in the repo is the only R file.
It needs to be executed in a directory where there is a "UCI HAR Dataset" directory.
At the end it writes a file in the main directory : "DF Mean.txt"

## Script 

The script does all what asked by instructions but not in the same order.
Explicit comments are present all along the "run_analysis.R" script

The script loads only the features (column names i.e. variables) needed for the assignment. It's starting with this for making the loading of the dataset quicker.

It renames the column names suppressing the parenthesis for a better lisibility. I think simplifying more wouldn't have been more efficient. 

It uses descriptive names (labels) for the activities.

It merges (appends) the train and test datasets.

And at the end create and write down a grouped by subject/activity average summary for all the variable. 

## Tidy data set
I think the dataset is tidy because I took the point-of-view that an observation is a group of measures (variables) made at one time : for one subject and one activity. It is a wide format data set.

## Code book 

There are 81 columns. The 79 last ones (3 to 81) are numeric. In the first data frame "dfAll" these 79 measures are the values for the different observations. In the second data frame "dfMean" and in the resulting file "DF Mean.txt" they are the mean values for each subject and activity.

1. subject : integer 1:30
1. activity : factor of 6 value/label : integer/string :
 1 WALKING 
 2 WALKING_UPSTAIRS 
 3 WALKING_DOWNSTAIRS 
 4 SITTING
 5 STANDING
 6 LAYING 
1. tBodyAcc.mean.X 
1. tBodyAcc.mean.Y 
1. tBodyAcc.mean.Z 
1. tBodyAcc.std.X 
1. tBodyAcc.std.Y 
1. tBodyAcc.std.Z 
1. tGravityAcc.mean.X 
1. tGravityAcc.mean.Y 
1. tGravityAcc.mean.Z 
1. tGravityAcc.std.X 
1. tGravityAcc.std.Y 
1. tGravityAcc.std.Z 
1. tBodyAccJerk.mean.X 
1. tBodyAccJerk.mean.Y 
1. tBodyAccJerk.mean.Z 
1. tBodyAccJerk.std.X 
1. tBodyAccJerk.std.Y 
1. tBodyAccJerk.std.Z 
1. tBodyGyro.mean.X 
1. tBodyGyro.mean.Y 
1. tBodyGyro.mean.Z 
1. tBodyGyro.std.X 
1. tBodyGyro.std.Y 
1. tBodyGyro.std.Z 
1. tBodyGyroJerk.mean.X 
1. tBodyGyroJerk.mean.Y 
1. tBodyGyroJerk.mean.Z 
1. tBodyGyroJerk.std.X 
1. tBodyGyroJerk.std.Y 
1. tBodyGyroJerk.std.Z 
1. tBodyAccMag.mean 
1. tBodyAccMag.std 
1. tGravityAccMag.mean 
1. tGravityAccMag.std 
1. tBodyAccJerkMag.mean 
1. tBodyAccJerkMag.std 
1. tBodyGyroMag.mean 
1. tBodyGyroMag.std 
1. tBodyGyroJerkMag.mean 
1. tBodyGyroJerkMag.std 
1. fBodyAcc.mean.X 
1. fBodyAcc.mean.Y 
1. fBodyAcc.mean.Z 
1. fBodyAcc.std.X 
1. fBodyAcc.std.Y 
1. fBodyAcc.std.Z 
1. fBodyAcc.meanFreq.X 
1. fBodyAcc.meanFreq.Y 
1. fBodyAcc.meanFreq.Z 
1. fBodyAccJerk.mean.X 
1. fBodyAccJerk.mean.Y 
1. fBodyAccJerk.mean.Z 
1. fBodyAccJerk.std.X 
1. fBodyAccJerk.std.Y 
1. fBodyAccJerk.std.Z 
1. fBodyAccJerk.meanFreq.X 
1. fBodyAccJerk.meanFreq.Y 
1. fBodyAccJerk.meanFreq.Z 
1. fBodyGyro.mean.X 
1. fBodyGyro.mean.Y 
1. fBodyGyro.mean.Z 
1. fBodyGyro.std.X 
1. fBodyGyro.std.Y 
1. fBodyGyro.std.Z 
1. fBodyGyro.meanFreq.X 
1. fBodyGyro.meanFreq.Y 
1. fBodyGyro.meanFreq.Z 
1. fBodyAccMag.mean 
1. fBodyAccMag.std 
1. fBodyAccMag.meanFreq 
1. fBodyBodyAccJerkMag.mean 
1. fBodyBodyAccJerkMag.std 
1. fBodyBodyAccJerkMag.meanFreq 
1. fBodyBodyGyroMag.mean 
1. fBodyBodyGyroMag.std 
1. fBodyBodyGyroMag.meanFreq 
1. fBodyBodyGyroJerkMag.mean 
1. fBodyBodyGyroJerkMag.std 
1. fBodyBodyGyroJerkMag.meanFreq



