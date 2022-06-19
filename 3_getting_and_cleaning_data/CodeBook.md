
## Getting and Cleaning Data Final Project

### Description
This file contains additional information about the data, variables and transformation used in the final course project.

### Source Data
The information about the source data can be found in the following link: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information
The size of the sample is 30 (i.e. 30 people) within an age ranging from 19 to 48 years. Each person performed different activities (six in total) wearing a smartphone (Samsung Galaxy S II) on the waist. The acctivities are these: (1) Walking, (2) walking upstairs, (3) walking downstairs, (4) sitting, (5) standing, (6) layin. Using the embedded accelerometer and gyroscopes, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constanst rate of 50Hz. The experiments were video-recorded to label the data manually. The dataset has been randomly partitioned into two sets, the training dataset and the test dataset. The training datasets contains data of the 70% of the people, and the test dataset contains the data of the other 30% of people.

The sensor signals were preprocessed by applying noise filters and then sampled in fixe-width sliding windows of 2,56 seconds and 50% overlap (128 readings/window). The sensor acceleration signal was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore af ilter with 0.3 cut-off frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information
For each record in the dataset, it is defined the following information.
- Traxial Angular velocity from the gyroscope
- Triaxial acceleration from the accelerometer (total acceleration) and the estiamted body acceleration
- A 561-feature vector with time and frequency domain variables
- The activity label
- An identifier of the subject who carried out the experiment.




