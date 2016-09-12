# Getting-and-Cleaning-Data-Course-Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Important Note: The following script requires reshape2.
The R script, run_analysis.R, does the following:
        A. Downloads and unzips the dataset.
        B. Reads all required text files including information regarding activity and feature; and, both the training and test datasets.
        C. Merges the training and test datasets.
        D. Extracts only the columns which contain a mean or standard deviation.
        E. Appropriately labels data text with descriptive variable names.
        F. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file: Tidy.txt.

## SOURCE DATA
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Acknowledgements and Sources:
David Hood advice: https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

info about reshape2: http://seananderson.ca/2013/10/19/reshape.html

info about grep: http://stackoverflow.com/questions/21311386/using-grep-to-help-subset-a-data-frame-in-r
                 https://stat.ethz.ch/R-manual/R-devel/library/base/html/grep.html
