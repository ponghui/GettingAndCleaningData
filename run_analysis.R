##########################################################################################################

## Coursera Getting and Cleaning Data Course Project

# runAnalysis.r File Description:

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##########################################################################################################



# 1. Merges the training and the test sets to create one data set.
# Read in the data from files
features = read.table('./features.txt',header=FALSE) #imports features.txt
activityType = read.table('./activity_labels.txt',header=FALSE) #imports activity_labels.txt
subjectTrain = read.table('./train/subject_train.txt',header=FALSE) #imports subject_train.txt
xTrain = read.table('./train/x_train.txt',header=FALSE) #imports x_train.txt
yTrain = read.table('./train/y_train.txt',header=FALSE) #imports y_train.txt

# Assign names to training dataset
colnames(activityType) = c('activityId','activityType')
colnames(subjectTrain) = "subjectId"
colnames(xTrain) = features[,2]
colnames(yTrain) = "activityId"

# Create training dataset
trainingData = cbind(yTrain,subjectTrain,xTrain)

# Read in the test data
subjectTest = read.table('./test/subject_test.txt',header=FALSE); #imports subject_test.txt
xTest = read.table('./test/x_test.txt',header=FALSE); #imports x_test.txt
yTest = read.table('./test/y_test.txt',header=FALSE); #imports y_test.txt

# Assign column names similar to training data
colnames(subjectTest) = "subjectId"
colnames(xTest) = features[,2]
colnames(yTest) = "activityId"

# Create the test dataset
testData = cbind(yTest,subjectTest,xTest)

# Combine both training and test dataset
tidyData = rbind(trainingData,testData)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.

# get all measures provided by source and clean it
requestedFeatures = grepl("-mean\\(\\)|-std\\(\\)|activityId|subjectId", colnames(tidyData))
tidyData = tidyData[, requestedFeatures]

# 3. Use descriptive activity names to name the activities in the data set

# Merge the tidyData set with the acitivityType table to include descriptive activity names
tidyData = merge(tidyData,activityType,by='activityId',all.x=TRUE)

# 4. Appropriately label the data set with descriptive activity names.

# prep temp variable for manipulation
tempColNames  = colnames(tidyData); 
# Cleaning up the variable names
for (i in 1:length(tempColNames)) 
{
  tempColNames[i] = gsub("\\()","",tempColNames[i])
  tempColNames[i] = gsub("-std","StandardDev",tempColNames[i])
  tempColNames[i] = gsub("-mean","Mean",tempColNames[i])
  tempColNames[i] = gsub("^t","time",tempColNames[i])
  tempColNames[i] = gsub("^f","freq",tempColNames[i])
  tempColNames[i] = gsub("([Gg]ravity)","Gravity",tempColNames[i])
  tempColNames[i] = gsub("([Bb]ody|[Bb]ody)","Body",tempColNames[i])
  tempColNames[i] = gsub("[Gg]yro","Gyro",tempColNames[i])
  tempColNames[i] = gsub("AccMag","AccMagnitude",tempColNames[i])
  tempColNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",tempColNames[i])
  tempColNames[i] = gsub("JerkMag","JerkMagnitude",tempColNames[i])
  tempColNames[i] = gsub("GyroMag","GyroMagnitude",tempColNames[i])
}
# Assign back to tidyData
colnames(tidyData) = tempColNames

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidyDataAggregate = aggregate(tidyData[,colnames(tidyData) != c("activityId","subjectId","activityType")], by=list(activityType=tidyData$activityType,subjectId = tidyData$subjectId), FUN="mean")

# Export the tidyData set 
write.table(tidyData, './tidyData.txt',row.names=TRUE,sep='\t')
write.table(tidyDataAggregate, './tidyDataAverage.txt',row.names=TRUE,sep='\t')