---
title: "Getting and Cleaning Data Project"
output: html_document
---

Please follow the below instructions to run the R file to create a tidy data set for the Course Project:

* Download the files from the following location https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and save Test, Train and other files on "Data"" directory on your current working directory.

* Download the run_analysis.R from github repo and place the file on your R current working directory.

* Once the R file is opened using RStudio and executed, it will create a couple of files on the "Data" directory called merged_clean_data.txt (which is the cleaned and compact output of the test and training files) and Averages_Dataset.txt (which contains the final averages by Subject and Activity).

* You can open the Averages Output file using a Notepad or by using the following R command "read.table("Averages_Dataset.txt")" 