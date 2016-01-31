# Codebook for "Getting and Cleaning Data" course project
This document describes the variables, the data, and work performed to clean up the data for the project, 
which can be downloaded by the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Description of variables used through the project
fileURL: Contains the URL of data file compressed as a zip

test_ds: Contains test data set in table format

train_ds: Contains train data set in table format

test_labels: Contains table with integer numbers from 1 to 6 for every record of test data set, which corresponds to activity labels

train_labels: Contains table with integer numbers from 1 to 6 for every record of train data set, which corresponds to activity labels

test_subjects: Contains table with integer numbers from 1 to 30 for every record of test data set, which corresponds to a volunteer's id

train_subjects: Contains table with integer numbers from 1 to 30 for every record of train data set, which corresponds to a volunteer's id

features: Contains table with the available 561 types of measurements

activities: Contains table with the 6 activities under which data from volunteers participated were collected

merged_ds: Contains a merged table made by combination of test and train data tables using rbind function. Initially, contains all columns, at a next step only those that refers to mean and std and finally activities and subjects are added using cbind function.

mean_std_extr: Used to extract only mean and std measurements from merged_ds data table, and for that reason contains those names which have mean and std words as part of the name

merged_labels: Contains a merged table made by combination of test_labels and train_labels using rbind function. The integer numbers in that table which corresponds to an activity label, in the end are substituted by that activity.

merged_subjects: Contains a merged table made by combination of test_subjects and train_subjects using rbind function.

tidy_ds: Contains the independent tidy data set with the average of each variable for each activity and each subject

# Activities done for getting and cleaning data until the final tidy data set

First of all, a directory called data is created if it hasn't already done so, in which raw data from URL that fileURL variable indicates, are downloaded into it in a zip format. Then, unzip funtion is used to unzip compressed data into data directory. A new directory named "UCI HAR Dataset" is created.

As a second step, variables test_ds, train_ds, test_labels, train_labels, test_subjects, train_subjects, features and activities are initiated with those values as described in the previous description section. 

Next, test_ds and train_ds data frames merged using rbind funtion into merged_ds data frame. The same operation followed, also, for the creation of merged_labels and merged_subjects variables. Note that the arguments in rbind function have the same order in all the previous actions: test_ds, train_ds.

Then, names of measurements from "V2" column of features.txt file are read and parentheses "()" are removed or more precisely are substituded by an empty string, using sub function. Also, "-" symbols replaced everywhere by "_", using gsub function. This is done so as to give a more descriptive name to variable names. With the resulted names merged_ds columns are named.

Next, grep function is used to find those names of merged_ds, that contain the words mean and std. An inverted search is, also, done so as to reject measurements that contain words "meanFreq", such as "fBodyAcc-meanFreq()-X". The desired names are saved as a vector in mean_std_extr variable. Using this variable, merged_ds contains now, only the desired columns that refered to mean and std.

In merged_labels data table is given the name "activities_id". Then is merged with activities table, so as to make relate activities ids with their corresponding activity, using merge function, in such a way to keep the length of merged_labels table. Name "activities" is given to that column, which contains the activities for every subject.

The "activities" column by previous step is merged with those of merged_ds, using cbind function. The same happens with merged_subjects table, after "subjects" name is given to it.

So, until now, merged_ds contains mean and std measurements as well as subjects and activities.

Thean dplyr library is used, to summarise data of merged_ds and calculate average for each activity and each subject, using summarise_each function. Funtion "options" is used with "dplyr.width = Inf" argument to replace the default setting of summarise function and print all columns of data set. The resulted data set is saved in variable tidy_ds and is printed on screen.













