
require(tidyr)
require(dplyr)


test1 <- read.table("dataset/test/subject_test.txt")
test2 <- read.table("dataset/test/X_test.txt")
test3 <- read.table("dataset/test/Y_test.txt")
train1 <- read.table("dataset/train/subject_train.txt")
train2 <- read.table("dataset/train/X_train.txt")
train3 <- read.table("dataset/train/Y_train.txt")
features <- read.table("dataset/features.txt", stringsAsFactors = FALSE)
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
