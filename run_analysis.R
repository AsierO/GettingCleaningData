
#We begin by loading the required data

#First test data

#The "general" data

datatest<-read.table("./test/X_test.txt")

#The activity data

datatesty<-read.table("./test/y_test.txt")

datavy<-datatesty$V1

#The subject data

datatests<-read.table("./test/subject_test.txt")

datavs<-datatests$V1

#Next, train data

#The "general" data

datatrain<-read.table("./train/X_train.txt")

#The activity data

datatrainy<-read.table("./train/y_train.txt")

datavytr<-datatrainy$V1

#The subject data

datatrains<-read.table("./train/subject_train.txt")

datavstr<-datatrains$V1

#1.Merges the training and the test sets to create one data set

mergedata<-rbind(datatest,datatrain)

#2. Appropriately labels the data set with descriptive variable names. 

#Obtain the 561 features from the features file

feat<-read.table("features.txt")

featl<-feat[,2]

#Add the names obtained

names(mergedata)<-as.character(featl)

#3. Extracts only the measurements on the mean and standard deviation for each measurement. 

#Seach for the columns that calculate the mean or standard deviation

vmean<-grep("mean[^Freq]",feat[,2])
vstd<-grep("std()",feat[,2])

#Subset the data corresponding to these columns

datan<-mergedata[,c(vmean,vstd)]

#4.Uses descriptive activity names to name the activities in the data set


#Merge the activity and subject vectors

mergedatact<-c(datavy,datavytr)

mergedatasub<-c(datavs,datavstr)

#Add descriptive names to the activities

mergedatact[grep("1",mergedatact)]="WALKING"

mergedatact[grep("2",mergedatact)]="WALKING_UPSTAIRS"

mergedatact[grep("3",mergedatact)]="WALKING_DOWNSTAIRS"

mergedatact[grep("4",mergedatact)]="SITTING"

mergedatact[grep("5",mergedatact)]="STANDING"

mergedatact[grep("6",mergedatact)]="LAYING"

#Add the activities and subject to our data file

datan$activities<-mergedatact

datan$subject<-mergedatasub


#5. create a data set with the average of each variable for each activity and each subject.

#Calculate the lenght minus the last two as it will be neccesary in the future

le<-length(names(datan))-2

#Using this elegant way we can group subject and activities and calculate the mean for each

library(plyr)
averages_data <- ddply(datan, .(subject, activities), function(x) colMeans(x[, 1:le]))

#The only thing left is to write the table

write.table(averages_data,file="averages_data.txt",row.name=FALSE)


