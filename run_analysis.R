## run_analysis.R

library("reshape2")

## 1. Merges the training and the test sets to create one data set
## Read the 2 data sets and combine them
testData <- read.table("test/X_test.txt")
trainData <- read.table("train/X_train.txt")
Data <- rbind(testData, trainData)

## Read the 2 subjects files and combine them
testSubject <- read.table("test/subject_test.txt")
trainSubject <- read.table("train/subject_train.txt")
Subject <- rbind(testSubject, trainSubject)

## Read the 2 labels files and combine them
testLabel <- read.table("test/y_test.txt")
trainLabel <- read.table("train/y_train.txt")
Label <- rbind(testLabel, trainLabel)

## Read ActivityList
activity <- read.table("activity_labels.txt")

## Drop all temp data sets
rm(testData)
rm(trainData)
rm(testSubject)
rm(trainSubject)
rm(testLabel)
rm(trainLabel)


## Read Features List & Save just features column
features <- read.table("features.txt", stringsAsFactors=FALSE)
features <- features$V2


## 2. Extracts only the measurements on the mean and standard deviation for each measurement
## Create Vector with only std and mean columns
Cols <- grepl("(std|mean[^F])", features)

## Keep in data set only column needed and rename with features names 
Data <- Data[, Cols]

## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
names(Data) <- features[Cols]
## Remove ( and ) from columns names
names(Data) <- gsub("\\(|\\)", "", names(Data))

## Rename ActivityList and put descriptive names in data set
activity[,2] = gsub("_", "", tolower(as.character(activity[,2])))
Label[,1] = activity[Label[,1], 2]
## Rename cols
names(Label) <- "activity"
names(Subject) <- "subject"

## Create tidy data set
tidyData <- cbind(Subject, Label, Data)

## 5. From the data set in step 4, creates a second,
## independent tidy data set with the average of each variable for each activity and each subject.

## Choose right columns
id_labels = c("subject", "activity")
data_labels = setdiff(colnames(tidyData), id_labels)

## melt data set with right columns
melt_data = melt(tidyData, id = id_labels, measure.vars = data_labels)
## dcast data set and mean
tidy_data2 = dcast(melt_data, subject + activity ~ variable, mean)

## write tidy data set in txt format
write.table(td, "tidyData2.txt",row.name=FALSE)
