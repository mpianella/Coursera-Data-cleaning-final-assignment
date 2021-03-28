

# Info about this script --------------------------------------------------
# 
# Author: Matteo Pianella
# Completed: 28/03/21
# data used can be downloaded at this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
# This script contains my solution to the final assignment for the course "Getting and Cleaning Data" offfered by JHU at Coursera.


# Dowloading the data -----------------------------------------------------


trainData <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
testData <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)

trainlabelsData <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
testlabelsData <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

trainsubjectsData <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
testsubjectsData <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

featuresData <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
activitylabelsData <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

library(dplyr)

activitylabelsData$V2 <- activitylabelsData$V2 %>% 
        tolower() %>% 
        gsub(pattern = " ", replacement =  "") %>% 
        gsub(pattern = "_", replacement = " ")


# Appropriately labels the data set with descriptive variable name --------


names(trainData) <- as.list(featuresData[,2]) 
names(testData) <- as.list(featuresData[,2])

trainData <- trainData[grep(x = names(trainData), pattern = "(-mean\\(\\))|(std\\(\\))")] #extract only the mean and sd measurements
testData <- testData[grep(x = names(testData), pattern = "(-mean\\(\\))|(std\\(\\))")]


trainData <- cbind(trainsubjectsData, trainlabelsData, trainData )
testData <- cbind(testsubjectsData, testlabelsData, testData)

HumanActivityData <- rbind(trainData, testData)

names(HumanActivityData)[1:2] <- c("subject", "activity")


# Substitute the activity numbers with the corresponding activity  --------


for (i in activitylabelsData[,1]) {
        x <- HumanActivityData$activity == i
        HumanActivityData[x,]$activity <- activitylabelsData[i, 2]
        rm(x)
}



# Create a new dataset that contains the averages for each variable by activity and by subject--------

avgHumanActivityData <- HumanActivityData


for(i in as.list(activitylabelsData[,2])){
        x <- avgHumanActivityData$activity == i
        avgHumanActivityData[x,]$activity <- activitylabelsData[activitylabelsData$V2== i,][,1]
        rm(x)
        
}

avgHumanActivityData <- avgHumanActivityData %>% 
        group_by(subject, activity) %>% 
        summarize_all(.funs = mean)

write.table(avgHumanActivityData, file= "avgHumanActivityData.txt", sep = "\t",row.names = FALSE)



