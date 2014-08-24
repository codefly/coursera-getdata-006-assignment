
# This script will transform the samsung accellerometer data into a tidy data set for further analysis
#  The following data was used: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#  The script assumes that the data is availible in a directory called 'data'


# first read in trainig data
ytrain = read.table("data/train/y_train.txt")
xtrain = read.table("data/train/x_train.txt")
subtrain = read.table("data/train/subject_train.txt")

# read in test data
ytest = read.table("data/test/y_test.txt")
xtest = read.table("data/test/x_test.txt")
subtest = read.table("data/test/subject_test.txt")

# get features.txt
features <- read.table("data/features.txt")

# now add the subject and feature column onto the beginning
# If we merge first then the order might get messed up
test = cbind(ytest, xtest)
test = cbind(subtest, test)

train = cbind(ytrain, xtrain)
train = cbind(subtrain, train)

# now merge the data together
merged = rbind(test, train)

# now let's create a vector which have mean and standard deviation from the features vector
cols = features[grepl("mean|std", features[,2]),]

# let's filter the columns based on the cols vector, but offset it by two since we 
#  added two columns to the beginning for activity
merged_filtered = merged[,c(1,2,cols[,1] + 2)]

# create a vector of column names, start with activity, then take the char representation of the 
#  factor as the column name
colstrings = c("subject", "activity", as.character(cols[,2]))

# now set the nice column names
colnames(merged_filtered) <- colstrings

# now we also want to swap out activity with names
#  first read in activity file
activity = read.table("data/activity_labels.txt")

# now set the first column to be the vector of activity names
merged_filtered[,2] <- sapply(merged_filtered[,2], function(x) { as.character(activity[x,2] )})

# now let's create the new data set by aggregating
mean_data <- aggregate(merged_filtered[,3:81], by=list("activity"=merged_filtered$activity, "subject"=merged_filtered$subject), FUN=mean)

