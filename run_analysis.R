##
# MergeFile merges content of two files passed as parameter and returns a single data table containing consolidated data
# Assumption :: the data in  testdata and training data has similar structure  
# Parameters :: 
#         1. testFN - File Name of the test data  
#         2. trainFN - File Name of the training data  
# Returns ::
#        Data table containing the merged data by row. 
#        The data is merged first by row and contents of testFN and then contents of trainFN.
##
mergeFile <-function (testFN,trainFN)
{
        test<-read.table(testFN)
        train<-read.table(trainFN)
        data.table(rbind(test,train))
}


##
# mergeAllFiles merges all the test and train data required as a part of the course project
# and returns a data table which contains all the data which is required for the analysis.
# Parameters :: None
# Returns ::
#        Data table containing the merged data by row. 
#        The data is merged first by column of and contents of testFN and then contents of trainFN.
##
mergeAllFiles <-function ()
{
        y_merged<-mergeFile("data/test/y_test.txt","data/train/y_train.txt" )
        y_merged<-setnames(y_merged,"V1","ActivityName")
        x_merged <-mergeFile("data/test/X_test.txt","data/train/X_train.txt" )
        subject_merged <-mergeFile("data/test/subject_test.txt","data/train/subject_train.txt" )
        subject_merged<-setnames(subject_merged,"V1","Subject")
        activity_labels<-read.table("data/activity_labels.txt")
        activity_labels<-setnames(activity_labels,c("ActivityName","Label"))
        merged_table<-data.table(cbind(y_merged,subject_merged,x_merged))
        merge(merged_table,activity_labels, by = "ActivityName",all.x =T)
}
        
