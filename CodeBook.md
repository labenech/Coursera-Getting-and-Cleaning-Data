## Code Book for Course Project

### Overview

[Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of the original data:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

[Full Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) at the site where the data was obtained:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	


### Data sets

- testData : table with contents of `test/X_test.txt`
- trainData : table with contents of `train/X_train.txt`
- Data : merge of the two above

- testSubject : table with contents of `test/subject_test.txt`
- trainSubject : table contents of `test/subject_train.txt`
- Subjects : merge of the two above

- testLabel : table with contents of `test/y_test.txt`
- trainLabel : table with contents of `train/y_train.txt`
- Label : merge of the two above

- activity : table with contents of `activity_labels.txt`
- features : table with contents of `features.txt`



### Results

#### tidyData (10299x68).

- 1 column : subject IDs
- 2 column : activity names
- 66 columns of data measurements 

#### tidy_data2 and tidy_data2.txt (180x68)

- 1 column : subject IDs
- 2 column : activity names
- 66 columns of data with mean of data measurements from tidyData

