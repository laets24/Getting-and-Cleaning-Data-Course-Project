##--Getting and Cleaning Data Course Project--

#INTRO
Assigment for the Johns Hopkins Coursera Course
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its 
embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% 
of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 
sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a 
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency 
domain.


DATA SOURCE
The data source is downloaded following this link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###1-MERGE THE INITIAL DATA
---------------------------
Data contained in these datasets : 
x_train ,  y_train ,  x_test ,  y_test ,  subject_train  and  subject_test

> activity_labels dataset : 
    activityNum : Identify the activity type
    ActivityType : Label od type of activity


> subject_train dataset : 
    subject : identifies the subject

> Xs and Ys datasets
    Features[,2] : the features come from the features dataset and we include on the Xs datasets
    y_train : has 1 column with ActId
    y_test : has 1 column with ActId

> Then we create 3 datasets by rbinding respectively the Xs, Ys and Subjects datasets


###2-EXTRACT THE COLUMNS FOR MEAN AND STANDARD DEVIATIONS MEASURES
------------------------------------------------------------------

A vector is created from features dataset and greps the correct names containing mean or std (standard deviation). The x_data dataset
is then subsetting with that and we give the right names using the features dataset
A news dataset is created (SamsungData) by cbinding the subject_data, y_data and the last x_data datasets


###3-RENAMING ACTIVITIES IN THE DATASET
------------------------------------
We Put the ActType column from activity_labels into SamsungData by using the merge function between activity_labels dataset and SamsungData
bases on ActId

###4-DESCRIPTIVE VARIABLE NAMES
-------------------------------
Renaming variables with appropriate labels


###5- AVERAGE TIDY DATA SET BASED ON ACTIVITIES AND SUBJECTS
------------------------------------------------------------
A new dataset is created by using the aggregate function of the plyr library and based on the mean for each subject and each activity : 
We have 30 subjects and 6 activities so the new dataset contains 180 rows. The output file is called Tidy_MeanData.txt 



 

