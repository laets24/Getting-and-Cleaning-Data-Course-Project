##Getting and Cleaning Data Course Project

##Getting the right dorectory : 
setwd("~/Coursera/Course3_Week4/UCI HAR Dataset")

##1-MERGE THE INITIAL DATA
#-------------------------------------------------------------------------------------

###Loading data : the training data
#----------------------------------
features<- read.table('./features.txt',header=FALSE)
activity_labels <- read.table('./activity_labels.txt',header=FALSE)
subject_train <- read.table('./subject_train.txt',header=FALSE) 
x_train <- read.table('./x_train.txt',header=FALSE)
y_train <- read.table('./y_train.txt',header=FALSE)

## Putting the labels into X_train and y_train
colnames(activity_labels)<- c('ActId','ActType')
colnames(subject_train)<- "SubjId"
colnames(x_train)<-features[,2]
colnames(y_train) = "ActId"

###Loading data : the test data
#------------------------------

subject_test <- read.table('./subject_test.txt',header=FALSE)
X_test<-read.table('./X_test.txt',header=FALSE)
y_test<-read.table('./y_test.txt',header=FALSE)

## Put the labels into X_test and y_test
colnames(subject_test)<-"SubjId"
colnames(X_test)<-features[,2] 
colnames(y_test)<-"ActId"

###creating the datasets
#------------------------------

 x_data <- rbind(x_train, X_test) 
 y_data <- rbind(y_train, y_test) 
 subject_data <- rbind(subject_train, subject_test) 

 
##2-EXTRACT THE COLUMNS FOR MEAN AND STANDARD DEVIATIONS MEASURES
#-------------------------------------------------------------------------------------

#Vector with the required num of columns
mean_std <- grep(".*mean.*|.*std.*", features[,2])

#Subsetting with the right columns and correcting names
x_data <- x_data[, mean_std]
names(x_data) <- features[mean_std, 2]

##Merging the date
SamsungData<-cbind(subject_data,y_data,x_data)


##3-RENAMING ACTIVITIES IN THE DATASET
#-------------------------------------------------------------------------------------
#Putting the ActType column from activity_labels into SamsungData
SamsungData2<-merge(SamsungData, activity_labels, by = "ActId")


##4-DESCRIPTIVE VARIABLE NAMES
#-------------------------------------------------------------------------------------
#Already named on 1, and by cbinding data on SamsungData creating processing


##5- AVERAGE TIDY DATA SET BASED ON ACTIVITIES AND SUBJECTS
#-------------------------------------------------------------------------------------

library(plyr)
MeanData <- aggregate(. ~SubjId + ActId, SamsungData2, mean) 
write.table(MeanData, "Tidy_MeanData.txt", row.names=FALSE,sep='\t') 


