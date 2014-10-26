# R script is called in order to achieve the 5 following steps for the Getting_and_cleaning_data_project
# 1- 	Merge the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names.
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# load required packages and libraries

install.packages("data.table")
install.packages("reshape2")

library(data.table)
library(reshape2)

require(reshape2)
require(data.table)


# Load in Activity Table
activity_labels <- read.table("./Coursera/Getting_and_Cleaning_Data_Project/activity_labels.txt")[,2]

# Load in Features Table
features <- read.table("./Coursera/Getting_and_Cleaning_Data_Project/features.txt")[,2]

# Load in all of the test data
x_test <- read.table("./Coursera/Getting_and_Cleaning_Data_Project/X_test.txt")
y_test <- read.table("./Coursera/Getting_and_Cleaning_Data_Project/y_test.txt")
subject_test <- read.table("./Coursera/Getting_and_Cleaning_Data_Project/subject_test.txt")


# Load in  all of the training data
x_train <- read.table("./Coursera/Getting_and_Cleaning_Data_Project/X_train.txt")
y_train <- read.table("./Coursera/Getting_and_Cleaning_Data_Project/y_train.txt")
subject_train <- read.table("./Coursera/Getting_and_Cleaning_Data_Project/subject_train.txt")


# Add column names to loaded tables
names(x_test) = features
names(x_train) = features

# Extract only the mean and standard deviation measurements from features.
get_features <- grepl("mean|std", features)


# Extract the mean and standard deviation for each measurement for x_test and x_train
x_test = x_test[,get_features]
x_train = x_train[,get_features] 

# load in activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"
 
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"


# Bind the respective data for test and training.
train_data <- cbind(as.data.table(subject_train), y_train, x_train)
test_data <- cbind(as.data.table(subject_test), y_test, x_test)

# Rbind the data for test and training
data = rbind(test_data, train_data)
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)


#create the tidy table using the mean function.
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

#write out the tidy_data txt file
write.table(tidy_data, file = "./Coursera/Getting_and_Cleaning_Data_Project/tidy_data.txt", row.name=FALSE)


