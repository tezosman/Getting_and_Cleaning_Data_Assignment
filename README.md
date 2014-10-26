Getting and Cleaning Data Course Project:
======================================

Introduction:
======================================
This github repository contains information on performing the 5 required steps for the getting and cleaning data assignment.

	1.	Merges the training and the test sets to create one data set.
	2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
	3.	Uses descriptive activity names to name the activities in the data set
	4.	Appropriately labels the data set with descriptive variable names. 
	5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data Set:
======================================

Download and extract the UCI HAR Data to your local machine.
Save the files to your working directory for R studio to have access to.

How run_analysis.R  Works:
======================================

run_analysis.R requires the read.table, reshape2 libraries  to be loaded.  It also needs the UCI HAR Data to be locally stored in your working directory.

Once the run_analysis.R script is run it will create a tidy data set which contains the means of all of the columns per test subject and activity.  This data will then be exported to the working directory ready to be uploaded to github. (tidy_data.txt)

Code Book:
======================================

The CodeBook.md file explains in more detail what types of transformations will be performed on the data in order to meet the 5 requirements of the assignment. 

