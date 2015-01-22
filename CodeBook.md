# CodeBook
## Getting and Cleaning Data - Course project

`run_analysis.R`

* _Requires the plyr and dplyr R packages._
* First checks if the data is in the working directory and downloads it if not.
* Reads in three files for both the training and test sets.
..* `X_[test/train].txt` - Contains the observations
..* `subject_[test/train].txt` - Contains the subject identifiers
..* `y_[test/].txt` - Contains the activity identifiers
* Merges the three files into one data.frame, `test/train`.
* Merges the test and train datasets into one large data.frame, `dat.merged`.
* Selects only the mean and standard deviation observations from the dataset and labels the columns.
* Finds the average value of each observation for a given subject and activity, `avedat`.
* Writes the tidy dataset of average values to `HAR_averages.txt`.