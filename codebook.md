# Codebook

## HumanActivityData

The first function of the script **run_analysis.R** is to produce dataset that merges in a consisistent way two starting datasets: **X_test.txt** and **X_train.txt**. 
After some manipulation and after adding the names to each variable, a new tiny dataset is produced contained in the object called **HumanActivityData**.\
This dataset contains the following variables:

1. **subject**: this is a categorical variable that assign an integer to each one of the 30 volunteers from which the data has been generated
2. **activity**: this is a categorical variable that describe the kind of activity the subject was doing when the measurement was taken. It can take 6 values : walking, walking downstairs, walking upstairs, standing, sitting, lying.
3. the **mean** and **standard deviation** for different features. 

The following isa description of the features considered in the dataset. __Note__: the description is taken from the **features_info.txt** file that can be found in the **UCI HAR Dataset** folder that can be dowloaded at the following link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.\

### Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in **features.txt** dowloadeble at the link above.\
**Remark**: as required by the assignement, the HumanActivityData object contains only the measurements of mean and standard deviation.

### avgHumanActivityData

The **subject** variable is the same as in the previous dataset.\
The **activity** variable is a categorical variable associating a number to the 6 kind of activities listed before: 
1 = walking; 2=walking upstairs; 3= walking downstairs; 4=sitting; 5=standing; 6=laying.
The other variables are the average measure by subject and by activity for each feature.

