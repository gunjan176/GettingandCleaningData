##
# mergeFile merges content of two files passed as parameter and returns a single data table containing consolidated data
# Assumption :: the data in  testdata and training data has similar structure  
# Requirment Addressed :: 
#       1. Merges the training and the test sets to create one data set.
# Parameters :: 
#         1. testFN - File Name of the test data  
#         2. trainFN - File Name of the training data  
# Returns ::
#        Data table containing the merged data by row. 
#        The data is merged first by row and contents of testFN and then contents of trainFN.
##
mergeFile <-function (testFN,trainFN)
{
        # read from the test file name
        test<-read.table(testFN)
        # read from the train file name
        train<-read.table(trainFN)
        # rowbind the test and train data and cast it as a data table(casting step may not be required)
        data.table(rbind(test,train))
}


##
# mergeAllFiles merges all the test and train data required as a part of the course project
# and returns a data table which contains all the data which is required for the analysis.
# Requirment Addressed :: 
#       1. Merges the training and the test sets to create one data set.
#       3. Uses descriptive activity names to name the activities in the data set
# Parameters :: None
# Returns ::
#        Data table containing the merged. 
#        The data is merged first by column of and contents of testFN and then contents of trainFN.
##
mergeAllFiles <-function ()
{
        # load and merge the y params from both test and train and rename column header to a more readable name.        
        y_merged<-mergeFile("y_test.txt","y_train.txt" )
        y_merged<-setnames(y_merged,"V1","ActivityName")
       
        # load and merge the x params from both test and train.   
        x_merged <-mergeFile("X_test.txt","X_train.txt" )
        
        # load and merge subject details from both test and train.   
        subject_merged <-mergeFile("subject_test.txt","subject_train.txt" )
        subject_merged<-setnames(subject_merged,"V1","Subject")
        
        # load activity labels and rename the column header to more readable names.
        activity_labels<-read.table("activity_labels.txt")
        activity_labels<-setnames(activity_labels,c("ActivityName","Label"))
       
        # Column bind the data from all the sources and cast it in a data table. 
        merged_table<-data.table(cbind(y_merged,subject_merged,x_merged))
        
        # merge activity lables with the merged data mapping by ActivityName. 
        merge(merged_table,activity_labels, by = "ActivityName",all.x =T)
}

##
# extractMeanAndSD extracts mean and standard deviation fields from the merged data table and renames the fields names to a more human decipherable format. 
# Requirment Addressed :: 
#        2. Extracts only the measurements on the mean and standard deviation for each measurement." 
#        4. Appropriately labels the data set with descriptive variable names
# Parameters :: 
#       1. mergedDataTable : data table containing the merged data.
# Returns ::
#        Processed Data table containing only the fields which need to be analysed. 
##
extractMeanAndSD <-function(mergedDataTable)
{
        # select all the relavant data - (fields containing mean and standard deviations)
        mergedDataTable<-select(mergedDataTable,ActivityName,Label,Subject,V1,V2,V3,V4,V5,V6,V41,V42,V43,V44,V45,V46,V81,V82,V83,V84,V85,V86,V121,V122,V123,V124,V125,V126,V161,V162,V163,V164,V165,V166,V266,V267,V268,V269,V270,V271,V345,V346,V347,V348,V349,V350,V424,V425,V426,V427,V428,V429)
        
        setnames(mergedDataTable
                 ,c("V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46","V81","V82","V83","V84","V85","V86","V121","V122","V123","V124","V125","V126","V161","V162","V163","V164","V165","V166","V266","V267","V268","V269","V270","V271","V345","V346","V347","V348","V349","V350","V424","V425","V426","V427","V428","V429")
                 ,c("tBodyAcc_mean_X","tBodyAcc_mean_Y","tBodyAcc_mean_Z","tBodyAcc_std_X","tBodyAcc_std_Y","tBodyAcc_std_Z","tGravityAcc_mean_X","tGravityAcc_mean_Y","tGravityAcc_mean_Z","tGravityAcc_std_X","tGravityAcc_std_Y","tGravityAcc_std_Z","tBodyAccJerk_mean_X","tBodyAccJerk_mean_Y","tBodyAccJerk_mean_Z","tBodyAccJerk_std_X","tBodyAccJerk_std_Y","tBodyAccJerk_std_Z","tBodyGyro_mean_X","tBodyGyro_mean_Y","tBodyGyro_mean_Z","tBodyGyro_std_X","tBodyGyro_std_Y","tBodyGyro_std_Z","tBodyGyroJerk_mean_X","tBodyGyroJerk_mean_Y","tBodyGyroJerk_mean_Z","tBodyGyroJerk_std_X","tBodyGyroJerk_std_Y","tBodyGyroJerk_std_Z","fBodyAcc_mean_X","fBodyAcc_mean_Y","fBodyAcc_mean_Z","fBodyAcc_std_X","fBodyAcc_std_Y","fBodyAcc_std_Z","fBodyAccJerk_mean_X","fBodyAccJerk_mean_Y","fBodyAccJerk_mean_Z","fBodyAccJerk_std_X","fBodyAccJerk_std_Y","fBodyAccJerk_std_Z","fBodyGyro_mean_X","fBodyGyro_mean_Y","fBodyGyro_mean_Z","fBodyGyro_std_X","fBodyGyro_std_Y","fBodyGyro_std_Z"))
        mergedDataTable

}
##
# summarizeData groups the ActivityName, Label and Subject Details and calculates the mean for each of the fields  
# Requirment Addressed :: 
#        5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Parameters :: 
#       1. mergedDataTable : data table containing the merged data containing only the fields which need to be analysed. .
# Returns ::
#        An independent tidy data set with the average of each variable for each activity and each subject.
##
summarizeData<-function(mergedDataTable)
{
        group_by(mergedDataTable,ActivityName, Label, Subject)%>% summarise_each(funs(mean))
}


##
# mainFunction is the entrypoint to the analysis , it calls various functions mentioned above and exports the results into out.txt file
# Parameters :: 
#        none 
# Returns ::
#       nothing 
##
mainFunction<-function()
{
        summaryData<- summarizeData(extractMeanAndSD(mergeAllFiles()))
        write.table(summaryData,file="output.txt",row.name=F)
}


        
