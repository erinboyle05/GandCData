---
title: "Getting and Cleaning Data Course Project"
author: "Erin Boyle"
date: "Oct 22, 2015"
output:
  html_document:
    keep_md: yes
---
 Codebook Update

 This file contains updates and modifications to the dataset-provided codebook files.
 The files updated and modified are:

 	features_info.txt

Features_info.txt update:
	
	Only features containing "mean" or "std" were selected to be analysed.
	All feature names were adjusted for clear, more descriptive labels. These changes were:
		Acc -> Acceleration
		Mag -> Magnitude
		Freq -> Frequency
		std -> StandardDeviation

Creating tidy_data.txt
	*This code utilizes the packages dplyr and tidyr.  For more information on these packages, please *consult the help files included with the packages

	This code will download and unzip the data files.  Be sure set your working directory

	The data is read into R to be used.  The R datasets were named in the order in which the files will be combined (subject, x, y) as well as whether they are from either the test or trial. (ie: test1 is the file subject_test.txt)  The dataset features contains the column names that are to be used.  The features dataset is modified to allow for more descriptive labeling.  See above for modifications. Datasets are combined and column names assigned as follows: set 1 = "subject", set 2 = features, set 3 = "activity_level" .  Duplicate columns are then removed and only columns containing the stings "mean" or "StandardDeviation" are selected.  The 3 datasets are combined into one data table.  To ensure enough memory is availible, the enviornment is cleared of all variables and datasets except the recently created data table.  The numerical observations listed in the activity_level column are replaced by character stings as listed in activity_lables.txt.  The dataset is grouped by subject, activity_level, and variable and the means of all other variables are calculated.  The resulting dataset is written to the file tidy_data.txt


