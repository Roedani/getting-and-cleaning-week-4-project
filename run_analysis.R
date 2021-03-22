

# Setting the work directory
setwd("~/Desktop/Coursera/Week 4 getting and cleaning data/UCI HAR Dataset")

# uploading Test data and information
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# uploading Training data and information
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# uploading feauters
features <- read.table("features.txt")

# uploading activity_labels
activity_labels <- read.table("activity_labels.txt")

# giving collum names to Test and Train data
colnames(x_test) <- features$V2
colnames(y_test) <- "activity_ID"
colnames(subject_test) <- "subject_ID"

colnames(x_train) <- features$V2
colnames(y_train) <- "activity_ID"
colnames(subject_train) <- "subject_ID"

# giving colum name to activity_labels
colnames(activity_labels) <- c("activity_ID", "activity_Type")

# binding data.table for all the test and train
test_data <- cbind(x_test, y_test, subject_test)
train_data <- cbind(x_train, y_train, subject_train)

# binding the two data set in one ## merge will not work beacuse are different subject ID 
data_set <- rbind(test_data, train_data)

# adding the atctivity type to the data_set
data_set_activity_type <- merge(data_set, activity_labels,
                              by = "activity_ID",
                              all.x = TRUE)

# creating a vector to sort only the collumn with mean and std
features_2 <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
DataNames <- c("subject_ID", "activity_ID", "activity_Type", as.character(features_2))

# subsetting the final data using the vector created before
data_set <- subset(data_set_activity_type, select=DataNames)

# changing names 
names(data_set)<-gsub("^t", "time", names(data_set))
names(data_set)<-gsub("^f", "frequency", names(data_set))
names(data_set)<-gsub("Acc", "Accelerometer", names(data_set))
names(data_set)<-gsub("Gyro", "Gyroscope", names(data_set))
names(data_set)<-gsub("Mag", "Magnitude", names(data_set))
names(data_set)<-gsub("BodyBody", "Body", names(data_set))

# grouping by subject_ID, activity_ID, activity_Type and summarize using mean
tidy_final <- data_set %>% group_by(subject_ID, activity_ID, activity_Type) %>%
  summarise_each(funs(mean))

# saving  tidy_final in "tidy_Data.txt"
write.table(tidy_final, "tidy_Data.txt", row.names = FALSE, 
            quote = FALSE)
