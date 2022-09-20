# load library()dplyr package.
library(dplyr)
# import and read csv file, MechaCar_mpg.csv as DataFrame.
MechaCar_mpg <- read.csv(file = 'MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)
head(MechaCar_mpg)
# linear regression model using the lm() function.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD , data = MechaCar_mpg)
# summary statistics using summary() function,determine the p-value 
# and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD , data = MechaCar_mpg))

###############
# Deliverable 2
# import and read csv file, Suspension_Coil.csv as a Table.
Suspension_Coil <- read.csv(file = 'Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
# summary statistics using summary() function to creates a 'total_summary' dataframe,
# to find the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <- Suspension_Coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
# summary statistics using groupby().
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
  
###############
# Deliverable 3
# t-tests all the lots, population mu = 1500 psi.
t.test(Suspension_Coil$PSI, mu=mean(Suspension_Coil$PSI))
# t-test for lot 1
t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == "Lot1"), mu=mean(Suspension_Coil$PSI))
# t-test for lot 2
t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == "Lot2"), mu=mean(Suspension_Coil$PSI))
# t-test for lot 3
t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == "Lot3"), mu=mean(Suspension_Coil$PSI))

  