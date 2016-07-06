## ASCHM 20160704 
## run_analysis.R
## Assignment Peer Graded Week 4 - Getting and Cleaning data - JHU

library( data.table)
library( dplyr)

## Files from UCI HAR Dataset
## Uncomment this if the zipped/unzipped data is not in your main directory
# urlZIP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# zipUCI <- "./UCI HAR Dataset.zip"
# download.file( url = urlZIP, destfile = zipUCI, method = "curl", mode = wb)
# unzip( zipfile = zipUCI, exdir = ".")

## Start by loading the column names : the features.
## Keep only the ones related to mean and std. Remove parenthesis in column names.
## And save col names and col numbers for later
dfFeatures <- read.csv( file = "./UCI HAR Dataset/features.txt",
                     sep = " ",
                     stringsAsFactors = FALSE,
                     header = FALSE)

dfFeatures <- dfFeatures[ grep( "mean|std", dfFeatures$V2), ]
dfFeatures$V2 <- sub( "\\(\\)", "", dfFeatures$V2)
colNumbers <- dfFeatures$V1
colNames <-   dfFeatures$V2

## read the activity labels to make activities more readable in the dataframes
dfActivityLevels <- read.csv( file = "./UCI HAR Dataset/activity_labels.txt",
                     sep = " ",
                     stringsAsFactors = TRUE,
                     header = FALSE)

####################### TRAIN DATA SET ##############################
## then we load the 3 files for the train data set : 
##            X_train (measure data),
##            y_train (activity data) and 
##            subject_train (subject data)

dfTrainActivities <- read.csv( file = "./UCI HAR Dataset/train/y_train.txt",
                       sep = " ",
                       stringsAsFactors = FALSE,
                       header = FALSE,
                       col.names = "activity")

dfTrainActivities$activity <- factor( dfTrainActivities$activity,
                                      levels = dfActivityLevels$V1,
                                      labels = dfActivityLevels$V2)

dfTrainSubjects <-read.csv( file = "./UCI HAR Dataset/train/subject_train.txt", 
                        sep = " ", 
                        stringsAsFactors = TRUE, 
                        header = FALSE,
                        col.names = "subject")

## Only load the column relative to mean and std
dfTrain <- fread( input = "./UCI HAR Dataset/train/X_train.txt", 
                  sep = " ", 
                  stringsAsFactors = FALSE, 
                  header = FALSE,
                  select = colNumbers,
                  col.names = colNames)

## Merge/associate the 3 files for the train set
## To have a well readable data set
dfTrain <- cbind( dfTrainSubjects, cbind( dfTrainActivities, dfTrain))

####################### TEST DATA SET ##############################
## And now the same for the test data set

dfTestActivities <- read.csv( file = "./UCI HAR Dataset/test/y_test.txt",
                            sep = " ",
                            stringsAsFactors = FALSE,
                            header = FALSE,
                            col.names = "activity")

dfTestActivities$activity <- factor( dfTestActivities$activity,
                                      levels = dfActivityLevels$V1,
                                      labels = dfActivityLevels$V2)

dfTestSubjects <-read.csv( file = "./UCI HAR Dataset/test/subject_test.txt",
                         sep = " ",
                         stringsAsFactors = TRUE,
                         header = FALSE,
                         col.names = "subject")

dfTest <- fread( input = "./UCI HAR Dataset/test/X_test.txt", 
                  sep = " ",
                  stringsAsFactors = FALSE,
                  header = FALSE,
                  select = colNumbers,
                  col.names = colNames)

dfTest <- cbind( dfTestSubjects, cbind( dfTestActivities, dfTest))

##########################################
# Then appened train and test data sets
dfAll <- rbindlist( list( dfTrain, dfTest))

####################################
## New data set with the average for each variable for each subject and each activity
dfMean <- dfAll %>% group_by( subject, activity) %>% summarize_each( funs( mean))

#############################
## At the end write the summary (mean) data set to a file
write.table( dfMean, "./DF Mean.txt", row.names = FALSE)




























