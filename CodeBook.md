Course Project Code Book
========================

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

The attached R script (run_analysis.R) performs the following to clean up the data:  

Metadata is read in from the features and activity_labels text files.

features.txt consist of 561 observations which correspond to the data via a seqence number column. Each observation represent a single measure in the data imported later.
activity_labels.txt consist of the descriptive labels to the column activityId which is part of the data imported later. The labels are as follows:  

        walking  
        
        walkingupstairs  
        
        walkingdownstairs  
        
        sitting  
        
        standing  
        
        laying
		


		Data is imported and merged
The follow files are imported and then concatated with each other

./train/subject_train.txt
./train/x_train.txt
./train/y_train.txt

this forms the training data and consist of 7352 observastions and 563 variables

The same is done for the test data in the test folder. This forms the test data and consist of 2947 observations and 563 variables.

Combining both these dataset yearn a 10299 observations with 563 variables.
Metadata is combined with the dataset. Each variable which is measured is also describe through the features dataset.

The script then filter the columns to only those variable names consisting of either '-mean()' or '-std()'. Only activityId and subjectId is exempted. 

The final dataset consist of 10299 observations with 69 variables.
Finally, activity label is to each observation through the activityId variable which is derived from the activity_labels.txt file.

The scripts then runs a cleaning of the column names of the dataset.
For each column the following procedure are run_analysis

	1. brackets are removed
	2. shortforms are renamed to their more verbose forms
	3. 't' and 'f' characters are renamed to 'time' and 'freq'
	4. Capitalization of the first letter of each word
	
the final columns are as follows
 [1] "activityId"                               			"subjectId"                               
 [3] "timeBodyAccMean-X"                        	"timeBodyAccMean-Y"                       
 [5] "timeBodyAccMean-Z"                        	"timeBodyAccStandardDev-X"                
 [7] "timeBodyAccStandardDev-Y"               "timeBodyAccStandardDev-Z"                
 [9] "timeGravityAccMean-X"                     	"timeGravityAccMean-Y"                    
[11] "timeGravityAccMean-Z"                     	"timeGravityAccStandardDev-X"             
[13] "timeGravityAccStandardDev-Y"           "timeGravityAccStandardDev-Z"             
[15] "timeBodyAccJerkMean-X"                   "timeBodyAccJerkMean-Y"                   
[17] "timeBodyAccJerkMean-Z"                   "timeBodyAccJerkStandardDev-X"            
[19] "timeBodyAccJerkStandardDev-Y"        "timeBodyAccJerkStandardDev-Z"            
[21] "timeBodyGyroMean-X"                       "timeBodyGyroMean-Y"                      
[23] "timeBodyGyroMean-Z"                       "timeBodyGyroStandardDev-X"               
[25] "timeBodyGyroStandardDev-Y"            "timeBodyGyroStandardDev-Z"               
[27] "timeBodyGyroJerkMean-X"                 "timeBodyGyroJerkMean-Y"                  
[29] "timeBodyGyroJerkMean-Z"                 "timeBodyGyroJerkStandardDev-X"           
[31] "timeBodyGyroJerkStandardDev-Y"      "timeBodyGyroJerkStandardDev-Z"           
[33] "timeBodyAccMagnitudeMean"              "timeBodyAccMagnitudeStandardDev"         
[35] "timeGravityAccMagnitudeMean"           "timeGravityAccMagnitudeStandardDev"      
[37] "timeBodyAccJerkMagnitudeMean"        "timeBodyAccJerkMagnitudeStandardDev"     
[39] "timeBodyGyroMagnitudeMean"            "timeBodyGyroMagnitudeStandardDev"        
[41] "timeBodyGyroJerkMagnitudeMean"      "timeBodyGyroJerkMagnitudeStandardDev"    
[43] "freqBodyAccMean-X"                        	"freqBodyAccMean-Y"                       
[45] "freqBodyAccMean-Z"                        	"freqBodyAccStandardDev-X"                
[47] "freqBodyAccStandardDev-Y"               "freqBodyAccStandardDev-Z"                
[49] "freqBodyAccJerkMean-X"                    "freqBodyAccJerkMean-Y"                   
[51] "freqBodyAccJerkMean-Z"                    "freqBodyAccJerkStandardDev-X"            
[53] "freqBodyAccJerkStandardDev-Y"         "freqBodyAccJerkStandardDev-Z"            
[55] "freqBodyGyroMean-X"                       	"freqBodyGyroMean-Y"                      
[57] "freqBodyGyroMean-Z"                       	"freqBodyGyroStandardDev-X"               
[59] "freqBodyGyroStandardDev-Y"             "freqBodyGyroStandardDev-Z"               
[61] "freqBodyAccMagnitudeMean"               "freqBodyAccMagnitudeStandardDev"         
[63] "freqBodyBodyAccJerkMagnitudeMean"  "freqBodyBodyAccJerkMagnitudeStandardDev" 
[65] "freqBodyBodyGyroMagnitudeMean"      "freqBodyBodyGyroMagnitudeStandardDev"    
[67] "freqBodyBodyGyroJerkMagnitudeMean""freqBodyBodyGyroJerkMagnitudeStandardDev"
[69] "activityType"   

The result is saved as tidyData.txt.
	
Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. 

The result is saved as tidyDataAverage.txt, a data frame with 180 observations and 68 variables.
The first column represent the activity type by their descriptive labels. The second is the subject Id.
The next 66 variables are the average of each activity for each subject.
