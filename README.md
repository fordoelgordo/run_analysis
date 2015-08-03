# run_analysis script explanation and description
# 
# This script takes data gathered via Samsung Galaxy smart phones and transforms it into a workable dataset suitable
# for downstream analysis.  The first portion of the script brings in various datasets from a .Zip file from the 
# following URL https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# The datasets describe telemetry data for two groups of subjects.  The data relating to each individual group was 
# separated out and needed to be combined together.  The two distinct datasets for each group are then merged together
# to create one merged dataset.
#
# The third portion of the script provides logical names for the columns of the merged dataset, then subsets the
# merged data so that only variables relating to mean and standard deviation measurements remain.
#
# The fourth portion does more scrubbing and provides logical names for each of the activities that are measured
# for each subject.  The dataset is finally grouped by subject ID and activity description, and the mean of each of
# the variables grouped by ID and activity description is taken to provide a consolidated dataset.
#
# The final result table is then written to the user's directory as a .txt file
