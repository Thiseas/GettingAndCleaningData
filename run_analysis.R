
if(!file.exists("data")) {
      dir.create("data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, "UCI_HAR_Dataset.zip", "curl")

unzip("UCI_HAR_Dataset.zip", exdir = "data")

test_ds <- read.table("data/UCI HAR Dataset/test/X_test.txt")
train_ds <- read.table("data/UCI HAR Dataset/train/X_train.txt")
test_labels <- read.table("data/UCI HAR Dataset/test/y_test.txt")
train_labels <- read.table("data/UCI HAR Dataset/train/y_train.txt")
test_subjects <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
train_subjects <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
features <- read.table("data/UCI HAR Dataset/features.txt")
activities <- read.table("data/UCI HAR Dataset/activity_labels.txt")

merged_ds <- rbind(test_ds, train_ds)

names(merged_ds) <- sub("\\()", "", features[["V2"]])
names(merged_ds) <- gsub("-", "_", names(merged_ds))
mean_std_extr <- names(merged_ds)
mean_std_extr <- mean_std_extr[grep("mean|std", names(merged_ds))]
mean_std_extr <- mean_std_extr[grep("Freq", mean_std_extr, invert = TRUE)]
merged_ds <- merged_ds[,mean_std_extr]

merged_labels <- rbind(test_labels, train_labels)
names(merged_labels) <- "activities_id"
merged_labels <- merge(merged_labels, activities, by.x = "activities_id", by.y = "V1", all.x = TRUE)
names(merged_labels)[2] <- "activities"
merged_ds <- cbind(merged_labels["activities"], merged_ds)

merged_subjects <- rbind(test_subjects, train_subjects)
names(merged_subjects) <- "subjects"
merged_ds <- cbind(merged_subjects, merged_ds)

library(dplyr)

options(dplyr.width = Inf)
tidy_ds <- group_by(merged_ds, subjects, activities) %>% summarise_each(funs(mean), c(3:length(merged_ds)))
print(tidy_ds)