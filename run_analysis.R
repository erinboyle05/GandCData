#  These packages are required to run this code.
require(tidyr)
require(dplyr)

# These are the data files being used/

test1 <- read.table("dataset/test/subject_test.txt")
test2 <- read.table("dataset/test/X_test.txt")
test3 <- read.table("dataset/test/Y_test.txt")
train1 <- read.table("dataset/train/subject_train.txt")
train2 <- read.table("dataset/train/X_train.txt")
train3 <- read.table("dataset/train/Y_train.txt")
features <- read.table("dataset/features.txt", stringsAsFactors = FALSE)

# Create more descriptive names

features$V2 <- gsub("Acc", "Acceleration", features$V2)
features$V2 <- gsub("std", "StandardDeviation", features$V2)
features$V2 <- gsub("Mag", "Magnitude", features$V2)
features$V2 <- gsub("Freq", "Frequency", features$V2)

# Combine test and train files
subjrow <- rbind(test1, train1)
data <- rbind(test2, train2)
activity <- rbind(test3, train3)

# Add column names
colnames(data) <- features$V2
colnames(subjrow) <- "subject"
colnames(activity) <- "activity_level"

# Remove non-unique colums and select only those with "mean" or "std"
data <- data[, !duplicated(colnames(data))] 
meansd_data <- select(data, matches('mean()|StandardDeviation()'))

df <- cbind(subjrow, meansd_data, activity)
df <- tbl_df(df)

#  This line clears the enviornment of all unnecessary files/variables.
rm(list=ls()[! ls() %in% c("df")])


# Replace numbers in activity column with activity names.

df$activity_level[df$activity_level == 1] <- "Walking"
df$activity_level[df$activity_level == 2] <- "Walking Upstairs"
df$activity_level[df$activity_level == 3] <- "Walking Downstairs"
df$activity_level[df$activity_level == 4] <- "Sitting"
df$activity_level[df$activity_level == 5] <- "Standing"
df$activity_level[df$activity_level == 6] <- "Laying"

# Group by subject and activity and calculate mean of variables.
dftidy <- df %>%
        group_by(subject, activity_level) %>%
        summarize_each(funs(mean))

# Write data to a txt file
write.table(dftidy, file = "tidy_data.txt", row.names = FALSE)
