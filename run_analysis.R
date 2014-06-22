## Download Data
URL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file_name <- "HAR.zip"
downloadfile(url=URL, dest=file_name)

## Unzip Data
unzip(file_name)

## Find location and name of unzipped files
list.files(path=".")
list.files(path="./UCI HAR Dataset")
list.files(path = "./UCI HAR Dataset/test")
list.files(path="./UCI HAR Dataset/train")

## Read in Textfiles on labels
activityid=read.table("./UCI HAR Dataset/activity_labels.txt", sep="")
features=read.table("./UCI HAR Dataset/features.txt", sep="")

## Read in Test files
xtest=read.table("./UCI HAR Dataset/test/X_test.txt", sep="")
ytest=read.table("./UCI HAR Dataset/test/y_test.txt", sep="")
subtest=read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")

## Read in Train files
xtrain=read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
ytrain=read.table("./UCI HAR Dataset/train/y_train.txt", sep="")
subtrain=read.table("./UCI HAR Dataset/train/subject_train.txt", sep="")

##Label Columns
colnames(xtest)=features$V2
colnames(xtrain)=features$V2
colnames(ytest)="activity_id"
colnames(ytrain)="activity_id"
colnames(subtest)="subject_id"
colnames(subtrain)="subject_id"
colnames(activityid)=c("activity_id", "activity")

## Concecrate Test Data
testdata=cbind(subtest, ytest, xtest)

## Concecrate Train Data
traindata=cbind(subtrain, ytrain, xtrain)

## Merge Test and Train Data
all.data=rbind(testdata, traindata)

## Extract only the measurments on the mean and standard deviations
names(all.data)=gsub("meanFreq", "mFreq", names(all.data),)
subset=unique(grep("subject_id|activity_id|activity|mean()|std()", names(all.data), value=TRUE))
all.data1=all.data[,subset]

## Merge subsetted data and activityid datasets
all.data2=merge(all.data1, activityid, by.x="activity_id", by.y="activity_id", sort=FALSE)

## Average each variable by subject and activity
library(reshape2)
meltdata=melt(all.data2, id.vars=c("activity", "activity_id", "subject_id"))
castdata=dcast(meltdata, activity+subject_id~variable, fun=mean, drop=FALSE)

## Write output to a text file
write.table(castdata, file="./tinydata.txt", sep="\t", row.names=FALSE)
