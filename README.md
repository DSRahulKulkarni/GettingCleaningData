---
title: "README.md"
output: html_document
---

First I used the unzip function in R to unzip the data. Then I kept the data in my working directory so I could access it via read.table and read.lines.

Then I used the script run_analysis.R to combine the training and test data with only variables corresponding to means and standard deviation. Then the script aggregated the data by finding the mean of each variable grouped by subject and activity

