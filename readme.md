README.md

How to run the script:

The script assumes that you have unextracted (unzipped) the data and have not 
changed the directory structure. The script assumes that your current working 
directory is one up from the "UCI HAR Dataset" directory; i.e., it expects 
that directory, and under it to be  directories called "test" and "train",
which contain files called "X_test.txt" and "X_train.txt".

Script also assumes that there is in the current directory a file called
"features-fixed.txt", which includes all the variable names (even the ones 
that will be discarded) but with the leading numbers and spaces removed.

If the above conditions are met, execute the script using the source() command.

Some other points of clarification:

When creating the tidy dataset, I started to select every variable with "mean" in the name. However, I think that some of the later variables, such as #559 (angle(X,GravityMean)) were not mean values for any measurement, but were measurements of other things (in this case, angle) when provided the mean of another variable. So I ended up selecting only variables for which there were both a "mean" and an "std" value provided.

The instructions were a little unclear; I ended up with 46 mean variables and 33 std variables, and my final submission was the mean of each of those variables (so 79 numbers in all I guess). I also used the row.name = FALSE as per the instructions, but my variable names still showed up in the output. I hope that is expected...
