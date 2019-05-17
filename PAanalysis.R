# Data analysis for "Physical activity context correlates with hippocampal subfield volume"
# May 16 2019 by Sara L. Seoane and Niels Janssen
# R 3.5.2; RStudio 1.1.463

library(fmsb)

# Read the dataframe "clean.txt"
Clean <- read.table('PATH_TO_FILE/data_clean.txt', header = TRUE)

# Subsets for substructures Cornu Ammonis 1 (CA1), CA2/3, CA4 and the granule cell layer of the dentate gyrus (DG)
ca1 <- Clean[Clean$Structure == "CA1",]
ca23 <- Clean[Clean$Structure == "CA3",]
ca4 <- Clean[Clean$Structure == "CA4",]
dg <- Clean[Clean$Structure == "GCMLDG",]

# Linear models for each substructure's dataset
lmca1<-lm(Volume~WI+SI+LI+Gender+eTIV+BMI+Hemisphere,data=ca1)
lmca23<-lm(Volume~WI+SI+LI+Gender+eTIV+BMI+Hemisphere,data=ca23)
lmca4<-lm(Volume~WI+SI+LI+Gender+eTIV+BMI+Hemisphere,data=ca4)
lmdg<-lm(Volume~WI+SI+LI+Gender+eTIV+BMI+Hemisphere,data=dg)

# VIF{fmsb} to calculate variance inflation factor for each linear model
VIF(lmca1)
VIF(lmca3)
VIF(lmca4)
VIF(lmdg)