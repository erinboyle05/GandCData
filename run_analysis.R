
require(tidyr)
require(dplyr)


# test1 <- read.table("dataset/test/subject_test.txt")
# test2 <- read.table("dataset/test/X_test.txt")
# test3 <- read.table("dataset/test/Y_test.txt")
train1 <- read.table("dataset/train/subject_train.txt")
train2 <- read.table("dataset/train/X_train.txt")
train3 <- read.table("dataset/train/Y_train.txt")
features <- read.table("dataset/features.txt", stringsAsFactors = FALSE)
names <- c("subject", features$V2, "activity_level")

# test_data <- cbind(test1, test2, test3)
train_data <- cbind(train1, train2, train3)

# colnames(test_data) <- names

# summary(test_data)
