# CodeBook.md

The script `run_analysis.R`performs the following 5 steps:

1. Test and Train data is loaded into varibles named testLabels, testSubjects, testData, trainLabels, trainSubjects and trainData with the read.table() function from respective files in test and train folders. We then then combine the test and train data together using rbind() and cbind() functions and save them into the data variable.
2. We extract the mean and standard deviation for each measurement using read.table() function on feature.txt file.
3. Names of activities form the activity_labels.txt file are read using read.table() function and then replaced by the labels in the dataset with these activities names.
4. We create a list of column names and feature names, remove the non-alphabetic characters from them and convert them to lowercase.
5. Next we find the mean for each combination of subject and label using aggregate() function. Finally, we save the tidy dataset to tidydataset2.txt file using write.table() function.