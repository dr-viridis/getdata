	## Per the instructions,
	# 
	# 1. Merge the training and test sets into one data set
	# 2. Extract only the measurements on the mean and standard deviation
	# for each measurement
	# 3. Use descriptive activity names to name the activities
	# in the data set
	# 4. Appropriately label the data set with descriptive variable names
	# 5. Create a second independent tidy dataset with the average of each
	# variable for each activity and each subject


# Read data

# Assumes there is a file called "features_fixed.txt" that 
# is the "features.txt" file but with the numbers removed

features <- read.table("./features-fixed.txt",stringsAsFactors = FALSE)
features <- t(features) # transpose the stupid thing

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features)
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features)

# append one to the other

my_data <-  rbind(test_data, train_data)

# now to extract just the means and standard deviation measurements
# see the codebook for a description of why these columns are chosen

my_means <- c(1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,266,267,268,294,295,296,345,346,347,373,374,375,424,425,426,452,453,454,503,513,516,526,529,539,542,552)

 my_stds <- c(4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,269,270,271,348,349,350,427,428,429,504,517,530,543)

mean_data <- my_data[my_means]
# or shoudl this be my_data[,my_means]?
std_data <- my_data[my_stds]

# Now lets apply some useful variable names, though the original names 
# are pretty good to start with

mean_headers <- c(
"TimeBodyAcc-X",
"TimeBodyAcc-Y",
"TimeBodyAcc-Z",
"TimeGravityAcc-X",
"TimeGravityAcc-Y",
"TimeGravityAcc-Z",
"TimeBodyAccJerk-X",
"TimeBodyAccJerk-Y",
"TimeBodyAccJerk-Z",
"TimeBodyGyro-X",
"TimeBodyGyro-Y",
"TimeBodyGyro-Z",
"TimeBodyGyroJerk-X",
"TimeBodyGyroJerk-Y",
"TimeBodyGyroJerk-Z",
"TimeBodyAccMag",
"TimeGravityAccMag",
"TimeBodyAccJerkMag",
"TimeBodyGyroMag",
"TimeBodyGyroJerkMag",
"FreqBodyAcc-X",
"FreqBodyAcc-Y",
"FreqBodyAcc-Z",
"FreqBodyAccFreq-X",
"FreqBodyAccFreq-Y",
"FreqBodyAccFreq-Z",
"FreqBodyAccJerk-X",
"FreqBodyAccJerk-Y",
"FreqBodyAccJerk-Z",
"FreqBodyAccJerkFreq-X",
"FreqBodyAccJerkFreq-Y",
"FreqBodyAccJerkFreq-Z",
"FreqBodyGyro-X",
"FreqBodyGyro-Y",
"FreqBodyGyro-Z",
"FreqBodyGyroFreq-X",
"FreqBodyGyroFreq-Y",
"FreqBodyGyroFreq-Z",
"FreqBodyAccMag",
"FreqBodyAccMagFreq",
"FreqBodyBodyAccJerkMag",
"FreqBodyBodyAccJerkMagFreq",
"FreqBodyBodyGyroMag",
"FreqBodyBodyGyroMagFreq",
"FreqBodyBodyGyroJerkMag",
"FreqBodyBodyGyroJerkMagFreq")

std_headers <- c(
"TimeBodyAcc-X",
"TimeBodyAcc-Y",
"TimeBodyAcc-Z",
"TimeGravityAcc-X",
"TimeGravityAcc-Y",
"TimeGravityAcc-Z",
"TimeBodyAccJerk-X",
"TimeBodyAccJerk-Y",
"TimeBodyAccJerk-Z",
"TimeBodyGyro-X",
"TimeBodyGyro-Y",
"TimeBodyGyro-Z",
"TimeBodyGyroJerk-X",
"TimeBodyGyroJerk-Y",
"TimeBodyGyroJerk-Z",
"TimeBodyAccMag",
"TimeGravityAccMag",
"TimeBodyAccJerkMag",
"TimeBodyGyroMag",
"TimeBodyGyroJerkMag",
"FreqBodyAcc-X",
"FreqBodyAcc-Y",
"FreqBodyAcc-Z",
"FreqBodyAccJerk-X",
"FreqBodyAccJerk-Y",
"FreqBodyAccJerk-Z",
"FreqBodyGyro-X",
"FreqBodyGyro-Y",
"FreqBodyGyro-Z",
"FreqBodyAccMag",
"FreqBodyBodyAccJerkMag",
"FreqBodyBodyGyroMag",
"FreqBodyBodyGyroJerkMag")

# Now change the perfectly fine names to some other 
# perfectly fine names

names(mean_data) <- mean_headers
names(std_data) <- std_headers

# Finally (step 5) we create a second tidy dataset with the
# average of each variable above

last_means <- colMeans(mean_data)
last_stds <- colMeans(std_data)

last_last <- cbind(last_means,last_stds)

write.table(last_last, "c:/data/getdata/output.txt", row.name=FALSE)

