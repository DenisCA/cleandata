run_analysis <- function (path) {
##Create path to files	
path_x_test <- paste (path, "/test/X_test.txt", sep="")
path_y_test <- paste (path, "/test/y_test.txt", sep="")
path_subject_test <- paste (path, "/test/subject_test.txt", sep="")
path_x_train <- paste (path, "/train/X_train.txt", sep="")
path_y_train <- paste (path, "/train/y_train.txt", sep="")
path_subject_train <- paste (path, "/train/subject_train.txt", sep="")
path_features <- paste (path, "/features.txt", sep="")

## Test Data
test_x <- read.table (path_x_test) ##Load Test data
test_y <- read.table (path_y_test)
subject_test <- read.table (path_subject_test)

names (subject_test)[1] <- "Subject" ## Rename Column
names (test_y)[1] <- "Activity"

test_full <- cbind (subject_test, test_y, test_x) ## Add all column in one table

## Train Data
train_x <- read.table (path_x_train) ##Load Train data
train_y <- read.table (path_y_train)
subject_train <- read.table (path_subject_train)

names (subject_train)[1] <- "Subject" ## Rename Column
names (train_y)[1] <- "Activity"

train_full <- cbind (subject_train, train_y, train_x) ## Add all column in one table

merge_data = merge (train_full, test_full, all=TRUE) ## Merge Train and Test sets

## Extracts mean() and std ()
features <- read.table (path_features)
std_col <- grep ("std()", features[,2])
mean_col <- grep ("mean()", features[,2])

ext_table <- merge_test[, paste ("V", sort (union (mean_col, std_col)), sep="")] ##Extracts
write.table (ext_table, "tidy_data_1.txt") ## Create file for Task 1

print ("File tidy_data_1.txt created in your working directory")

}