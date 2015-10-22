#  These packages are required to run this code.
require(tidyr)
require(dplyr)

<<<<<<< HEAD
# These are the data files being used/
=======

>>>>>>> origin/master
test1 <- read.table("dataset/test/subject_test.txt")
test2 <- read.table("dataset/test/X_test.txt")
test3 <- read.table("dataset/test/Y_test.txt")
train1 <- read.table("dataset/train/subject_train.txt")
train2 <- read.table("dataset/train/X_train.txt")
train3 <- read.table("dataset/train/Y_train.txt")
features <- read.table("dataset/features.txt", stringsAsFactors = FALSE)
<<<<<<< HEAD

# These commands merge the data files and assign column names.
test_data <- cbind(test1, test2, test3)
train_data <- cbind(train1, train2, train3)
all_data <- rbind(test_data, train_data)
names <- c("subject", features$V2, "activity_level")
colnames(all_data) <- names

#  This line clears the enviornment of all unnecessary files/variables.
rm(list=ls()[! ls() %in% c("all_data")])

# Choose only columns that are either mean or std
tbl_df(all_data)
all_data <- all_data[,!duplicated(colnames(all_data))]
mean_data <- select(all_data, contains("mean"))
sd_data <- select(all_data, contains("std"))
mean_sd_data <- cbind(all_data$subject,mean_data, sd_data, all_data$activity_level)
colnames(mean_sd_data)[1] <- "subject"
colnames(mean_sd_data)[88] <- "activity_level"
# Replace numbers in activity column with activity names.

mean_sd_data$activity_level[mean_sd_data$activity_level == 1] <- "Walking"
mean_sd_data$activity_level[mean_sd_data$activity_level == 2] <- "Walking Upstairs"
mean_sd_data$activity_level[mean_sd_data$activity_level == 3] <- "Walking Downstairs"
mean_sd_data$activity_level[mean_sd_data$activity_level == 4] <- "Sitting"
mean_sd_data$activity_level[mean_sd_data$activity_level == 5] <- "Standing"
mean_sd_data$activity_level[mean_sd_data$activity_level == 6] <- "Laying"
        

=======
# names <- c("subject", features$V2, "activity_level")
subjrow <- rbind(test1, train1)
data <- rbind(test2, train2)
activity <- rbind(test3, train3)

colnames(data) <- features$V2
colnames(subjrow) <- "subject"
colnames(activity) <- "activity_level"

data <- data[, !duplicated(colnames(data))] 
meansd_data <- select(data, matches('mean()|sd()'))

df <- cbind(subjrow, meansd_data, activity)
 rm(list=(ls()[ls()!="df"]))
>>>>>>> origin/master
