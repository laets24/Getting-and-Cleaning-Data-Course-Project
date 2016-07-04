##Getting and Cleaning Data - Course Project


This is the course project for the Getting and Cleaning Data Coursera course. 


Using run_analysis.R will : 
1. Load the relevant datasets, that we previouly put on the correct directory, especially : 
    - the activity labels dataset
    - Both training and test datasets
    - the features datasets
    - The subject datasets

2. Extracts only the columns containing mean or standard deviation (std) on the labels a creates a new dataset (samsungData)
3. Creates a final dataset by merging with the activities Ids (SamsungData2)
4. Creates a new dataset (MeanData) bases on the means of subjects*activities group for each variable
5. Creates an outpout file of MeanData dataset : Tidy_MeanData.txt

The repo contains the following files : 
- CodeBook : the instructions of the data processing
- run_analysis.R : the R script
- Tidy_MeanData.txt : the output tidy dataset
- README : this present README file