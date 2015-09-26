#Here I read in the information from the files. I have the "UCI HAR Dataset" folder in my working directory.

ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
FnameaturesInfo <- readLines("UCI HAR Dataset/features_info.txt")
Features <- read.table("UCI HAR Dataset/features.txt")
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
ReadMe <- readLines("UCI HAR Dataset/README.txt")
XTest <- read.table("UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("UCI HAR Dataset/test/y_test.txt")


SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
YTrain <- read.table("UCI HAR Dataset/train/y_train.txt")


Subject <- rbind(SubjectTrain, SubjectTest)
X <- rbind(XTrain, XTest)
Y <- rbind(YTrain, YTest)


MeanRows <- subset(Features, regexpr("mean\\(\\)", Features[,2]) > 0)
STDRows <- subset(Features, regexpr("std", Features[,2]) > 0)
Rows <- rbind(MeanRows, STDRows)
X <- X[,Rows$V1]
X$Activity <- Y$V1
X$Activity <-  gsub("1", "Walking", X$Activity)
X$Activity <-  gsub("2", "Walking Upstairs", X$Activity)
X$Activity <-  gsub("3", "Walking Downstairs", X$Activity)
X$Activity <-  gsub("4", "Sitting", X$Activity)
X$Activity <-  gsub("5", "Standing", X$Activity)
X$Activity <-  gsub("6", "Laying", X$Activity)

X <- X[c(67, 1:66)]
ActivityNames <- c("")
for(i in 2:length(X)) {
  ActivityNames[i - 1] <- as.character(Features[as.numeric(substr(names(X)[i], 2, nchar(names(X)[i]))), 2])
}

names(X)[2:67] <- ActivityNames
X$subject <- Subject$V1
X <- X[c(68,1:67)]
X <- aggregate(X[,3:68], list(X$subject, X$Activity), FUN = mean)
names(X)[1] <- "Subject"
names(X)[2] <- "Activity"
write.csv(X, file = "tidydata.txt")


