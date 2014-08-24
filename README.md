
# This script will transform the samsung accellerometer data into a tidy data set for further analysis
#  The following data was used: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


# first read in trainig data


# read in test data


# get features.txt


# now add the subject and feature column onto the beginning
# If we merge first then the order might get messed up


# now merge the data together


# now let's create a vector which have mean and standard deviation from the features vector


# let's filter the columns based on the cols vector, but offset it by two since we 
#  added two columns to the beginning for activity

# create a vector of column names, start with activity, then take the char representation of the 
#  factor as the column name


# now set the nice column names


# now we also want to swap out activity with names
#  first read in activity file


# now set the first column to be the vector of activity names


# now let's create the new data set by aggregating


