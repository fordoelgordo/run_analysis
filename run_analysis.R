run_analysis <- function() {
# Read various data sets into R that were contained in the .zip file
# The reading of the data assumes that your working directory is set properly so that the data from the .zip file can be
# read in from wherever you have the files stored
  X_train <- read.table("./data/UCI HAR Dataset/train/x_train.txt")
  Y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
  X_test <- read.table("./data/UCI HAR Dataset/test/x_test.txt")
  Y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
  activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
  features <- read.table("./data/UCI HAR Dataset/features.txt")
  
# combine the test and train data sets by subject ID and activity ID for each observation
  train <- cbind(subject_train,Y_train,X_train)
  test <- cbind(subject_test,Y_test,X_test)
  
# merge the train and test data sets together
  combinedata <- rbind(train,test)
  
# provide logical names for the columns in the combined dataset
  colnames(combinedata)[1:2] <- c("Subject_ID","Activity_ID")
  cfeatures <- as.character(features[,2])
  vfeatures <- as.vector(cfeatures)
  for (i in 3:563){
      colnames(combinedata)[i] <- vfeatures[i-2]
    }
# subset the combined data set so only the columns for mean and standard deviation data are returned
  i <- grep("mean",colnames(combinedata))
  j <- grep("std",colnames(combinedata))
  subcombine <- combinedata[,c(1,2,i,j)]
  
# give the activity IDs in the dataset descriptive names
  vlabels <- as.vector(as.character(activity_labels[,2]))
  subcombine <- mutate(subcombine, Activity_desc = factor(subcombine$Activity_ID,labels = vlabels))
# Return an independent tidy data set with the average of each variable for each subject and activity  
  newcombine <- subcombine[,c(1,82,3:81)]
  fcombine <- newcombine %>% group_by(Subject_ID, Activity_desc) %>% summarise_each(funs(mean))
  write.table(fcombine,file ="./data/run_analysis.txt",row.names=FALSE,col.names=TRUE)
  }
