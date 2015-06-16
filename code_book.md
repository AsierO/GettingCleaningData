# Code book
Asier  

##Strategy

The run_analysis.R code performs the following 5 steps described in the instructions:

0. Load the required general, activity and subject data.

1.Merges the training and the test sets to create one data set using rbind() in all data files.

2. Appropriately labels the data set with descriptive variable names usind the data in "features.txt".

3. Extracts only the measurements on the mean and standard deviation for each measurement by searching for those in the newly added names of columns.

4. Uses descriptive activity names to name the activities in the data set by searching and replacing.

5. Create a data set with the average of each variable for each activity and each subject in an elegant way using the ddply() function. Finally we generate the txt file.


##Variables

-datatest, datavy, datavs, datatrain, datavytr and datavstr contain the general, subject and activity data from the downloaded files.

-featl contains the names of the column measurements.

-mergedata contains the merged general data, mergedatact the activity one and mergedatasub the subject one.

-datan contains the merged data with the columns we are interested together with subject and activities, eventually.

-averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is extremely useful in this case.

