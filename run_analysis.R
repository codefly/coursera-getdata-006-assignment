

# first read in trainig data
ytrain = read.table("data/train/y_train.txt")
xtrain = read.table("data/train/x_train.txt")

# read in test data
ytest = read.table("data/test/y_test.txt")
xtest = read.table("data/test/x_test.txt")

# get features.txt
features <- read.table("data/features.txt")

# now add the feature column onto the beginning
# If we merge first then the order might get messed up
test = cbind(ytest, xtest)
train = cbind(ytrain, xtrain)

# now merge the data together
merged = rbind(test, train)

# now let's create a vector which have mean and standard deviation from the features vector
cols = features[grepl("mean|std", features[,2]),]

# let's filter the columns based on the cols vector, but offset it by one since we 
#  added a column to the beginning for activity
merged_filtered = merged[,c(1, cols[,1] + 1)]

# create a vector of column names, start with activity, then take the char representation of the 
#  factor as the column name
colstrings = c("activity", as.character(cols[,2]))

# now set the nice column names
colnames(merged_filtered) <- colstrings

# now we also want to swap out activity with names
#  first read in activity file
activity = read.table("data/activity_labels.txt")

#merged_filtered[]


