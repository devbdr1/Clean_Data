# Getting and Cleaning Data course project
# 
# Assumptions:
# -data files are in the "UCI HAR Dataset" directory of 
#  current working directory

# the reshape2 library will be used to create the tidy data set later
library(reshape2)

###############################################################################
#
# Step 1: Load descriptive data for activities and features of the test
#         Determine festures that need to be in final data set to eliminate
#         unecessary data from being loaded
#
###############################################################################
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# convert descriptive columns from factor to character for easier manipulation
features[,2] <- as.character(features[,2])
activity_labels[,2] <- as.character(activity_labels[,2])

# find the indices and names of the features we want to include
featureSet <- grep(".*mean.*|.*std.*",features[,2])
featureSet.names <- features[featureSet,2]

# Alter the feature descriptions to be friendlier
featureSet.names <- gsub("-mean","Mean", featureSet.names)
featureSet.names <- gsub("-std","Std", featureSet.names)
featureSet.names <- gsub("[()-]","", featureSet.names)

###############################################################################
#
# Step 2: Load the test and train data and combine into datasets
#
###############################################################################
train.measures <- read.table("./UCI HAR Dataset/train/X_train.txt")[featureSet]
train.activities <- read.table("./UCI HAR Dataset/train/y_train.txt")
train.subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train.subjects, train.activities, train.measures)

test.measures <- read.table("./UCI HAR Dataset/test/X_test.txt")[featureSet]
test.activities <- read.table("./UCI HAR Dataset/test/y_test.txt")
test.subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test.subjects, test.activities, test.measures)

# merge the train and test sets
allData <- rbind(train, test)

# add column names
names(allData) <- c("subjectID", "activity", featureSet.names)

# replace activity ID with activity description
allData$activity <- factor(allData$activity, levels = activity_labels[,1], labels = activity_labels[,2])

# change subjectID to factor also
allData$subjectID <- as.factor(allData$subjectID)


###############################################################################
#
# Step 3: Create the tidy data set
#
###############################################################################
# The melt function of the reshape2 package will translate all the
# columns(variables) into separate rows based on the specified key fields.
# ie, creating the long-format tidy data
allDataMelt <- melt(allData, id = c("subjectID", "activity"))

# Finally we will use the dcast function to reshape the long-format data
# into wide-format data, aggregating the data into the average for
# all subject + activity combinations
tidy <- dcast(allDataMelt, subjectID + activity ~ variable, mean)

# and write the file out
write.table(tidy,"tidydata.txt")