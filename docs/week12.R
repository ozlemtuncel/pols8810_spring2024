### 
### Purpose: Week 13 - Residuals, outliers, and diagnostics
### Author: Ozlem Tuncel (otuncelgurlek1@gsu.edu)
### Date: 04/06/2023
### R version: 4.2.2 Innocent and Trusting
###

### Load necessary packages ----
# Use install.packages() if you do not have this package
library(tidyverse)  # Data manipulation
library(stargazer)  # Creates nice regression output tables
library(dotwhisker) # Dot-and-whisker plot of regression result
library(broom)      # tidy models
library(lmtest)     # Breusch-Pagan test
library(sandwich)   # Robust standard errors
library(olsrr)      # Detecting influential observations 
# https://cran.r-project.org/web/packages/olsrr/vignettes/influence_measures.html

## Load your data ----
# We are using V-Dem version 12 

# Full data
my_data <- readRDS("data/vdem12.rds") |> 
  filter(country_name == "United States of America") |> 
  select(year, v2x_polyarchy, e_gdppc, e_miurbani) |> 
  rename(democracy = v2x_polyarchy, 
         gdp_per_capita = e_gdppc,
         urbanization = e_miurbani)

# Toy model for this week
my_model <- lm(democracy ~ gdp_per_capita + urbanization, data = my_data)

stargazer(my_model, type = "text", report = "vcstp*",
          title = "Predictors of democracy in the US")

### INFLUENTIAL POINTS AND RESIDUALS ###

# Outliers: Residuals can be obtained with the resid() function, standardized 
# residuals with the rstandard() function and studentized residuals with the 
# rstudent() function.

# Influential cases: Cook’s distances can be obtained with the cooks.distance() 
# function, DFBeta with the dfbeta() function, DFFit with the dffits() function, 
# hat values (leverage) with the hatvalues() function, and the covariance ratio 
# with the covratio() function.

# Also, recall these 
fitted(my_model) # predicted Y
residuals(my_model) # residuals
which.max(abs(residuals(my_model))) # largest absolute residual

# Using plot() function -----
plot(my_model, which = 1, add.smooth = FALSE) 
plot(my_model, which = 2, add.smooth = FALSE)
plot(my_model, which = 3, add.smooth = FALSE)
plot(my_model, which = 4, add.smooth = FALSE)

# Or, you can manually find observations ----
# Get cook's D
cooksD <- cooks.distance(my_model)
# any values greater than 3x the mean
cooksD[(cooksD > (3 * mean(cooksD, na.rm = TRUE)))]

# Get DFBETA for gdp_per_capita
# I decided that 2/sqrt(n) is my threshold for suspicious dfbetas
my_data[which(abs(dfbetas(my_model)[,'gdp_per_capita']) > 0.15),]

# Or, we can use this function
car::outlierTest(my_model)

## base's influence.measures ----
# https://www.math.ucla.edu/~anderson/rw1001/library/base/html/influence.measures.html
influence.measures(my_model)

## COVRATIO stat ----
# Delete-1 change in covariance (CovRatio) identifies the observations that are 
# influential in the regression fit. 
covratio(my_model, 
         infl = lm.influence(my_model, do.coef = FALSE),
         res = weighted.residuals(my_model))

# Let's compare y, y_hat, residuals, and covratio
my_covratio <- covratio(my_model)
my_comparison <- cbind(my_model$y[nrow(my_model$y), ], my_model$y, my_model$fitted.values, my_model$residuals, my_covratio)
my_comparison <- as.data.frame(my_comparison)
names(my_comparison) <- c("Y", "Y hat", "Residuals", "Covratio")

### olsrr package ----

## COOK's DISTANCE (influential points) ----
# Steps to compute Cook’s distance:
# delete observations one at a time.
# refit the regression model on remaining (n−1)
# observations
# examine how much all of the fitted values change when the ith observation is deleted.
# A data point having a large cook’s d indicates that the data point strongly 
# influences the fitted values.

# In general use, those observations that have a cook’s distance greater than 4 
# times the mean may be classified as influential. This is not a hard boundary.

# Bar Plot of Cook’s distance to detect observations that strongly influence 
# fitted values of the model.
ols_plot_cooksd_bar(my_model)
ols_plot_cooksd_chart(my_model)

# Let's check these observations
my_data[197:201, ] 
# maybe after-effect of oil crisis? Or, Reagan defeated Carter? More conservative economy?

## DFBETAs ----
# DFBETA measures the difference in each parameter estimate with and without the influential point.
ols_plot_dfbetas(my_model)

# Let's check these observations
my_data[134:136, ] 
# Supreme Court rejected women's right to vote? US occupies Haiti?

# Outliers ----
ols_plot_resid_stud_fit(my_model)
ols_plot_resid_stand(my_model)

# See everything ---
ols_plot_resid_lev(my_model)

# Let's drop these observations
# What we dropped these influential points?
subset_data <- my_data[-c(197:201, 134:136), ] 

subset_model <- lm(democracy ~ gdp_per_capita + urbanization, data = subset_data)

stargazer(my_model, subset_model, type = "text", report = "vcstp*",
          column.labels = c("full sample", "influential/outliers removed"))
