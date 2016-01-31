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








