### CodeBook File for Coursera's "Getting and Cleaning Data"" Course Project - June 2014
##### This Codebook file corresponds to run_analysis.R and tinydata.txt.

### Data Sources
The original data used in the corresponding R code (run_analysis.R) was obtained from the "Human Activity Recognition Using Smartphones Dataset - Version 1.0" provided by Anguita, et al. (2012).  The data was downloaded from the address given in the instructions of the course project.

Data download address: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectﬁles%2FUCI%20HAR%20Dataset.zip 

###### Complete Data Citation
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

### Data Description
The original data from Anuita et al. (2012) reported the results of sensor signals from a smartphone worn by a subject performing various activties.  There were 30 subjects and their measurements were split into six activity categories (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The tinydata.txt (found on the course project submission page) reports the averages of the mean and standard deviations for all the sensor measurements (referred to as features) by each subject and activity.

- The "tinydata" dataset is a 180x68 matrix.

- Each row identifies the activity performed and the subject who performed that activity.

- The columns identify the activity, subject id, and the features labels.

- The features labels are the same as the in the original data set to allow easy comparison.

- As in the original dataset, the features are normalized and bounded within [-1,1].

The averages for the features measurements were obtained by using the reshape library in R. The data was melted and recast as the mean of the features variables by activity and subject ids.  To view the complete steps, read the corresponding ReadMe.md and run_analysis.R files.
