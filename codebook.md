# Codebook

## Source Data
The source data for this project was collected from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The description for the dataset is here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Methodology
There are three main steps taken to create the tidy dataset required.

1.  Determine the indices and labels for the requested data; do some label cleanup
  *  Since the dataset is quite large, we can predetermine the data we need for the final set by looking at the features.txt file
  *  Using grep, we find all the features that contain "mean" or "std"
  *  We then createa set of the descriptive labels for those features for later use
  *  Additionally we pull in the activity_labels.txt for later use
2.  Load and combine the main data
  *  Using the index of features determined from Step 1, load the appropriate data into R
  *  Combine and label all the data required for the tidy dataset
  *  The combined dataset contains a table of subject IDs, activities, features, and values
3.  Create the tidy dataset
  * the reshape2 library is used to help facilitate the creation of the tidy dataset
  * the melt function is used to aggregate the subjectID + Activity + Feature combinations into an average
  * the dcast function is then used to transform the "long" format dataset into a "wide" format dataset
  
## Data Dictionary

subjectID
  *  Numeric ID of the study subject.  Values are 1 through 30

activity
  *  Activity label.  Values are:
    *  WALKING
    *  WALKING_UPSTAIRS
    *  WALKING_DOWNSTAIRS
    *  SITTING
    *  STANDING
    *  LAYING
    
##### The following are the rest of the variables/columns which contain the averaged values of subjectID + activity pair
tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tGravityAccStdX
tGravityAccStdY
tGravityAccStdZ
tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyAccJerkStdX
tBodyAccJerkStdY
tBodyAccJerkStdZ
tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroStdX
tBodyGyroStdY
tBodyGyroStdZ
tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyGyroJerkStdX
tBodyGyroJerkStdY
tBodyGyroJerkStdZ
tBodyAccMagMean
tBodyAccMagStd
tGravityAccMagMean
tGravityAccMagStd
tBodyAccJerkMagMean
tBodyAccJerkMagStd
tBodyGyroMagMean
tBodyGyroMagStd
tBodyGyroJerkMagMean
tBodyGyroJerkMagStd
fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccStdX
fBodyAccStdY
fBodyAccStdZ
fBodyAccMeanFreqX
fBodyAccMeanFreqY
fBodyAccMeanFreqZ
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyAccJerkStdX
fBodyAccJerkStdY
fBodyAccJerkStdZ
fBodyAccJerkMeanFreqX
fBodyAccJerkMeanFreqY
fBodyAccJerkMeanFreqZ
fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyGyroStdX
fBodyGyroStdY
fBodyGyroStdZ
fBodyGyroMeanFreqX
fBodyGyroMeanFreqY
fBodyGyroMeanFreqZ
fBodyAccMagMean
fBodyAccMagStd
fBodyAccMagMeanFreq
fBodyBodyAccJerkMagMean
fBodyBodyAccJerkMagStd
fBodyBodyAccJerkMagMeanFreq
fBodyBodyGyroMagMean
fBodyBodyGyroMagStd
fBodyBodyGyroMagMeanFreq
fBodyBodyGyroJerkMagMean
fBodyBodyGyroJerkMagStd
fBodyBodyGyroJerkMagMeanFreq
