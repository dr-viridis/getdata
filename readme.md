README.md

How to run the script:

The script assumes that you have unextracted (unzipped) the data and have not 
changed the directory structure. The script assumes that your current working 
directory is the "UCI HAR Dataset" directory; i.e., it expects there to be 
directories called "test" and "train", which are subdirectories of the 
current working directory, and which contain files called "X_test.txt" and "X_train.txt".

Some other points of clarification:

When creating the tidy dataset, I started to select every variable with "mean" in the name. However, I think that some of the later variables, such as #559 (angle(X,GravityMean)) were not mean values for any measurement, but were measurements of other things (in this case, angle) when provided the mean of another variable. So I ended up selecting only variables for which there were both a "mean" and an "std" value provided.
