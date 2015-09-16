---
title: "CodeBook.md"
output: html_document
---

First I used the read.table and read.lines commands to read in the information provided in the files, which had been placed in mu working directory. Then I used the rbind commands in order to vertically merge the training and test data sets into one data set.

Then I created a vector of positions within the features vector of features that involve mean or standard deviation

Then I replaced the numbers representing activities with the actual activities.
Then I subsetted the variables of the data frame to the ones which I was interested.

Then I used the aggregate function to find the mean of each feature with regard to each subject and activity.

