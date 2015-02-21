# Analysis of the Data and Code

## Data Source 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
### Contents of the Zip

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

### Type of Activities Being Analysed

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### Activity Captured in files
* **Training Activities:** :y_train.txt
* **Test Activities:**  :y_test.txt
* **Training Subjects:** :subject_train.txt
* **Test Subjects:**  :subject_test.txt
* **Training Data:** :x_train.txt
* **Test Data:**  :x_test.txt

## Code 

###Functions 
* **mainFunction**:mainFunction is the entry point to the analysis , it calls various functions mentioned above and exports the results into out.txt file
* **summarizeData:**summarizeData groups the ActivityName, Label and Subject Details and calculates the mean for each of the fields 
* **extractMeanAndSD:**extractMeanAndSD extracts mean and standard deviation fields from the merged data table and renames the fields names to a more human decipherable format.  
* **mergeAllFiles:**mergeAllFiles merges all the test and train data required as a part of the course project and returns a data table which contains all the data which is required for the analysis.
* **mergeFile:**mergeFile merges content of two files passed as parameter and returns a single data table containing consolidated data


## Data Output 
The Data captures the averages of mean and standard deviation of measurements for each of activity and subject.
a new variable called Label has been added to give descriptive details of the activities there is a one to one relation between the activityName and the Label

###Grouped By Columns
*ActivityName*
*Label*
*Subject*

###Summarised Columns Headers
The following columns contain the averages of measurements for each of activity and subject.

* tBodyAcc_mean_X
* tBodyAcc_mean_Y
* tBodyAcc_mean_Z
* tBodyAcc_std_X
* tBodyAcc_std_Y
* tBodyAcc_std_Z
* tGravityAcc_mean_X
* tGravityAcc_mean_Y
* tGravityAcc_mean_Z
* tGravityAcc_std_X
* tGravityAcc_std_Y
* tGravityAcc_std_Z
* tBodyAccJerk_mean_X
* tBodyAccJerk_mean_Y
* tBodyAccJerk_mean_Z
* tBodyAccJerk_std_X
* tBodyAccJerk_std_Y
* tBodyAccJerk_std_Z
* tBodyGyro_mean_X
* tBodyGyro_mean_Y
* tBodyGyro_mean_Z
* tBodyGyro_std_X
* tBodyGyro_std_Y
* tBodyGyro_std_Z
* tBodyGyroJerk_mean_X
* tBodyGyroJerk_mean_Y
* tBodyGyroJerk_mean_Z
* tBodyGyroJerk_std_X
* tBodyGyroJerk_std_Y
* tBodyGyroJerk_std_Z
* fBodyAcc_mean_X
* fBodyAcc_mean_Y
* fBodyAcc_mean_Z
* fBodyAcc_std_X
* fBodyAcc_std_Y
* fBodyAcc_std_Z
* fBodyAccJerk_mean_X
* fBodyAccJerk_mean_Y
* fBodyAccJerk_mean_Z
* fBodyAccJerk_std_X
* fBodyAccJerk_std_Y
* fBodyAccJerk_std_Z
* fBodyGyro_mean_X
* fBodyGyro_mean_Y
* fBodyGyro_mean_Z
* fBodyGyro_std_X
* fBodyGyro_std_Y
* fBodyGyro_std_Z

