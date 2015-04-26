# Getting and Cleaning Data Course Project

## run_analysis.R Tasks
    You should create one R script called run_analysis.R that does the following:


  1. Merges the training and the test sets to create one data set.

  2. Extracts only the measurements on the mean and standard deviation for each measurement. 

  3. Uses descriptive activity names to name the activities in the data set

  4. Appropriately labels the data set with descriptive activity names. 

  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 



    It should run in a folder of the Samsung data i.e. Set the working dir to UCI HAR Dataset containing the following files
  1. activity_labels.txt

  2. features.txt

  3. test/

  4. train/





## run_analysis.R Steps



####1:
  
  - Read the data in test and train folder (Labels, Subjects and Data)
  - Merge the data together

####2:
  
  - Read the features from features.txt and extract mean and standard deviation for each measurement.
  - A new data frame is then created that includes subjects, labels and the described features.



####3:
  
  - Read the activity labels from activity_labels.txt and replace the labels.



####4:
  
  - Create list of the column names and feature names 
  - Remove all non-alphabetic characters and converting the result to lowercase
  
  - Use the list as column names for data


####5:
  
  - Find the mean for each combination of subject and label.
  - Write the new dataset to a text file called tidydataset2.txt.