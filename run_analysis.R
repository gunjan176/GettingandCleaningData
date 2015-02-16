mergeFile <-function (testFN,trainFN, mergedFN)
{
        if(file.exists(mergedFN))
        {
                unlink(mergedFN)
        }
        file.append(mergedFN , testFN)
        file.append(mergedFN , trainFN)
}

mergeFiles <-function ()
{
        # create the merged folder
        if(!file.exists("data/merged"))
        {
                dir.create("data/merged")        
        }
        
        if(!file.exists("data/merged/Inertial Signals"))
        {
                dir.create("data/merged/Inertial Signals")        
        }
        
        mergeFile("data/test/y_test.txt","data/train/y_train.txt" , "data/merged/y_merged.txt" )
        mergeFile("data/test/X_test.txt","data/train/X_train.txt" , "data/merged/X_merged.txt" )
        mergeFile("data/test/subject_test.txt","data/train/subject_train.txt" , "data/merged/subject_merged.txt" )
        mergeFile("data/test/Inertial Signals/body_acc_x_test.txt","data/train/Inertial Signals/body_acc_x_train.txt","data/merged/Inertial Signals/body_acc_x_merged.txt")
        mergeFile("data/test/Inertial Signals/body_acc_y_test.txt","data/train/Inertial Signals/body_acc_y_train.txt","data/merged/Inertial Signals/body_acc_y_merged.txt")
        mergeFile("data/test/Inertial Signals/body_acc_z_test.txt","data/train/Inertial Signals/body_acc_z_train.txt","data/merged/Inertial Signals/body_acc_z_merged.txt")
        mergeFile("data/test/Inertial Signals/body_gyro_x_test.txt","data/train/Inertial Signals/body_gyro_x_train.txt","data/merged/Inertial Signals/body_gyro_x_merged.txt")
        mergeFile("data/test/Inertial Signals/body_gyro_y_test.txt","data/train/Inertial Signals/body_gyro_y_train.txt","data/merged/Inertial Signals/body_gyro_y_merged.txt")
        mergeFile("data/test/Inertial Signals/body_gyro_z_test.txt","data/train/Inertial Signals/body_gyro_z_train.txt","data/merged/Inertial Signals/body_gyro_z_merged.txt")
        mergeFile("data/test/Inertial Signals/body_acc_x_test.txt","data/train/Inertial Signals/body_acc_x_train.txt","data/merged/Inertial Signals/body_acc_x_merged.txt")
        mergeFile("data/test/Inertial Signals/body_acc_y_test.txt","data/train/Inertial Signals/body_acc_y_train.txt","data/merged/Inertial Signals/body_acc_y_merged.txt")
        mergeFile("data/test/Inertial Signals/body_acc_z_test.txt","data/train/Inertial Signals/body_acc_z_train.txt","data/merged/Inertial Signals/body_acc_z_merged.txt")
}


