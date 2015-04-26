# 1
# reading the test and train data

testLabels <- read.table("test/y_test.txt", col.names="label")
testSubjects <- read.table("test/subject_test.txt", col.names="subject")
testData <- read.table("test/X_test.txt")

trainLabels <- read.table("train/y_train.txt", col.names="label")
trainSubjects <- read.table("train/subject_train.txt", col.names="subject")
trainData <- read.table("train/X_train.txt")

# merging the data together
data <- rbind(cbind(testSubjects, testLabels, testData), 
              cbind(trainSubjects, trainLabels, trainData))


## 2
# extracting mean and standard deviation for each measurement
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
featuresMeanStd <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# getting the mean and standard deviations from data
meanStd <- data[, c(1, 2, featuresMeanStd$V1+2)]


## 3
# reading the names of activities
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
# replace labels in data with label names
meanStd$label <- labels[meanStd$label, 2]


## 4
# creating list of the column names and feature names
good <- c("subject", "label", featuresMeanStd$V2)
# removing non-alphabetic characterS and converting to lowercase
good <- tolower(gsub("[^[:alpha:]]", "", good))
# using the list as column names for data
colnames(meanStd) <- good


## 5
# find the mean for each combination of subject and label
dataMean <- aggregate(meanStd[, 3:ncol(meanStd)], 
                       by=list(subject = meanStd$subject, label = meanStd$label), mean)

# creating the second tidy dataset
write.table(format(dataMean, scientific=T), "tidydataset2.txt", row.names=F, col.names=F, quote=2)
