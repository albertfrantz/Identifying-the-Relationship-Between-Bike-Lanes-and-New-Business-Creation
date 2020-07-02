#########################################################################################
# Author: Albert Frantz
# Date: May 8, 2020
#
# Questions: Does the instillation of  bike lanes affect new business creation
#            near to where theyre installed in NYC
# 
# Purpose: The purpose of this study is to find if changing the built enviroment
#          through the instillation of bike lanes can cause new businesses to be created
#          on those same streets.
#
# Method: I will be using a difference-in-differences model for the years 2010 and 2018 model 
#         to assess how bikes lanes influence new business creation in NYC
#
# Data: Data comes from the NYC Open Data Project
# 
# Data file: 
#      https://drive.google.com/file/d/12vz_CsV2awXL-M8JHa5eGUqsiA7SJdTy/view?usp=sharing
##########################################################################################


#############################
#importing libraries and data
#############################

install.packages("stargazer")
install.packages("lattice")
library(stargazer)
library(lattice)
bikeDataNew = read.csv(file.choose()) #choose the downloaded data file
head(bikeDataNew)
nrow(bikeDataNew) #376 total NYC neighborhoods
options(scipen=7) #getting rid of scientific notation 

###################
#exploring the data
###################

#exploring the distrubtion for each variable
lattice::densityplot(~BusApps, data=bikeDataNew) #right skew not log transformed due to additivity assumption of DID
lattice::densityplot(~TotalBikeLanesFt, data=bikeDataNew) #right skew
lattice::densityplot(~TotalPop, data=bikeDataNew) #right skew
lattice::densityplot(~FemalePct, data=bikeDataNew) #normal distrubtion
lattice::densityplot(~MedianAge, data=bikeDataNew) #normal distrubtion
lattice::densityplot(~BachDegreeOrHigherPct, data=bikeDataNew) #Possibly bimodal or right skew
lattice::densityplot(~UnempPCT, data=bikeDataNew) #right skew
lattice::densityplot(~MeanHouseIncome, data=bikeDataNew) #right skew

####################
#model creation
#################### 

#difference in differences model
bikeModel = lm(formula=BusApps~TotalBikeLanesFt+y18+I(y18*TotalBikeLanesFt)
               +TotalPop+FemalePct+MedianAge+BachDegreeOrHigherPct
               +UnempPCT+MeanHouseIncome, bikeDataNew)
summary(bikeModel, robust = T)
car::vif(bikeModel) #checking for multicollinearity

#######################################
#creating output tables using StarGazer
#######################################

#decriptive statistics
stargazer(bikeDataNew, type = "text", title="Descriptive statistics", digits=1, out="table1.txt")

#Regression Results, had to manually enter robust P values found earlier (line 55)
stargazer(bikeModel, type="text", title="Table 1. Regression Results", report = "vcsp*", out="bikeResults.html", robust = T)

