# GettingAndCleaningData
Repository for "Getting and Cleaning Data" course project.

There is only one script called "run_analysis.R", which undertake the following activities: 

1. Downloads the required data that need to be cleaned.
2. Extracts the compressed zip file downloaded, as "UCI HAR Dataset".
3. Reads the necessary txt files in "UCI HAR Dataset" directory in table format and store them in appropriately named variables.
4. Operates properly in those data tables to keep only the desired data, and transform them under the principles of tidy data.
5. Calculates the average of each variable for each activity and each subject, using summarise function of dplyr package.
6. Stores the resulted tidy data set in tidy_ds variable and print it on screen.

More information on variables and actions can be found in CodeBook.md file.

# Dependencies to run "run_analysis.R" script.
Dplyr package should be downloaded before execute the above R script.


