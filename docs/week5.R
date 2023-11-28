###
### Purpose: Week 5 - Bivariate regression
### Author: Ozlem Tuncel (otuncelgurlek1@gsu.edu)
### Date: 02/07/2023
### R version: 4.2.2 Innocent and Trusting
###

### Load necessary packages ----
# Use install.packages() if you do not have this package
library(tidyverse) # Data manipulation
library(stargazer) # Creates nice regression output tables

### Load your data ----
# We are using V-Dem version 12 
my_data <- readRDS("data/vdem12.rds") 

# Let's change names of some of these variables for the sake of simplicity
# I am also subsetting it to only US
us_data <- my_data |>
  filter(country_name == "United States of America") |> 
  rename(democracy = v2x_polyarchy, gdp_per_capita = e_gdppc)

### Bivariate OLS ----
# Fit simple linear regression model
my_model <- lm(democracy ~ gdp_per_capita, 
               data = us_data,
               x = TRUE, # see arguments in function help page
               y = TRUE) # TRUE allow us to have these values in the list object

# View model summary
summary(my_model)

stargazer(my_model, type = "text")

# my_model is a list object - which means that it has multiple objects contained
# within an object
names(my_model)

# Get y and y-hat: create a data frame and change column names 
y_yhat <- as.data.frame(cbind(my_model$y, my_model$fitted.values, my_model$residuals))
colnames(y_yhat) <- c("My Y", "My Y Hat", "My Residuals")

# Let's look at the first 10 rows
# remember u_i = y - y_hat
y_yhat[1:10, ]

### Let's use graphs ----
# Plot the relationship between democracy and GDP per capita 
us_data |> 
  ggplot(aes(x = gdp_per_capita, y = democracy)) +
  geom_point() +
  geom_smooth(method = "lm", color = "red") +
  geom_smooth(color = "blue") +
  theme_bw() +
  labs(x = "GDP per capita", y = "Democracy",
       title = "Relationship between democracy and GDP per capita in the US",
       subtitle = "(red is linear line, blue is loess line)")

# Residual plot -- Fitted values vs residuals 
# This plot will be super useful for homoskedasticity assumption
my_model |> 
  ggplot(aes(x = .fitted, y = .resid)) +
  geom_point() +
  geom_hline(yintercept = 0) +
  theme_bw() +
  labs(x = "Fitted values", y = "Residuals", 
       title = "Residual vs. Fitted Values Plot")

# Histogram of these residuals
hist(my_model$residuals,
     xlab = "Residuals", 
     ylab = "Frequency", 
     main = "Distribution of residuals")

### BASE R NOTES ----
# You could create this plot in base R like this: 
# Define residuals
residuals <- residuals(my_model)

# Produce residual vs. fitted plot
plot(fitted(my_model), residuals)

# Add a horizontal line at 0 
abline(0,0)

# We could also look at upper and lower bounds for each observation
# Estimate standard error of Y
se_pred <- sd(my_model$fitted.values)/sqrt(length(my_model$fitted.values))

# Upper and lower limits
y_yhat$yhat_ub <- my_model$fitted.values + (1.96*se_pred)
y_yhat$yhat_lb <- my_model$fitted.values - (1.96*se_pred)

# Let's check first 10 rows
y_yhat[1:10, ]
