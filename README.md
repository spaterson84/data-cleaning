data-cleaning
=============

Course Project for Coursera's "Getting and Cleaning Data" Class

### ReadMe File for Coursera's "Getting and Cleaning Data"" Course Project - June 2014
This ReadMe file corresponds to run_analysis.R.

### Data Sources
The data used in the corresponding R code (run_analysis.R) was obtained from the "Human Activity Recognition Using Smartphones Dataset - Version 1.0" provided by Anguita, et al. (2012).  The data was downloaded from the address given in the instructions of the course project.

Data download address: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectﬁles%2FUCI%20HAR%20Dataset.zip 

##### Complete Data Citation
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

### Accessing the Data
After the data file was downloaded, the file was unzipped on the user's working directory.  The file paths were examined to determine the contents of the unzipped folders.  The ReadMe.txt corresponding to the downloaded data was read to understand the data structure and variables. 

### Reading the Data
Data required for the completion of the course project were found in eight different text files.  Each necessary text file was read into R as a dataset.  The following list describes each dataset.

- activityid = a 6x2 matrix listing the types of activities recorded and the corresponding id number

- features = a 561x2 matrix listing the types of features recorded and the corresponding id number

- xtest = a 2947x561 matrix with test data for all of the features.  Each feature is its own column.

- ytest = 2947x1 matrix with the activity ids for the test data

- subtest = 2947x1 matrix with the subject ids for the test data

- xtrain = a 7352x561 matrix with train data for all of the features.  Each feature is its own column.

- ytrain = 7352x1 matrix with the activity ids for the train data

- subtrain = 7352x1 matrix with the subject ids for the train data

### Labeling the datasets
The columns of the datasets were not labeled.  Once the eight data sets were read into R, the columns were labled for clarity.  The xtest and xtrain datasets were named for their corresponding features.  The labels were provided by linking the column numbers with the feature names given in the second column of the features dataset.  The names of the feature variables were not changed to allow easy comparison with the original data.  The ytest and ytrain datasets were labled as "activity_id" and the subtest and subtrain datasets were labeled as "subject_id".  The first column in the activityid dataset was named "activity_id" so it could be easily merged with the ytest and ytrain datasets.  The second column of the activityid dataset was named "activity".

### Merging the Test and Train data sets
Following the course project instructions, the three test data sets were combined into a data set named "testdata" using the cbind command and the three train data sets were also combined into a data set named "traindata" using the cbind command.  The testdata and traindata were combined into the "all.data" dataset using the rbind command.

### Extracting the Mean and Standard Deviation Variables
A subset of the "all.data" dataset with only the activity ids, subject ids and the means and standard deviations of the features variables was then created.  First, to avoid including variables with "meanFreq" in their names, "mFreq" was substituted for "meanFreq" in all the applicable variable names.  Then the modified "all.data" dataset was subsetted.  The resulting "all.data1" dataset was a 10299x568 matrix that only included activity ids, subject ids and the means and standard deviations of the features variables.

The final step linked the activity ids with the names of the activities.  The "all.data1" was merged with the "activity" datset by the "activity_ids" variable found in both data sets.  The merged dataset was named "all.data2"

### Tiny Data Set with the average of each mean and standard deviation features variable by activity and subject

The final phase of the course project asked for the subsetted means and standard deviation variables to be averaged by activity and subject.  Using the reshape library, "all.data2" was melted and recast as the mean of the features variables by activity and subject ids.  The resulting 180x68 cast dataset was named "castdata".

### Writing out the final output
The final tiny data output of "castdata" was written into a text file using the write.table command.  The resulting text file "tinydata.txt" can be found on the course project submission page and read into R with a read.table command.
