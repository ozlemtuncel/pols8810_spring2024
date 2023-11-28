### 
### Purpose: Week 11 - Collinearity
### Author: Ozlem Tuncel (otuncelgurlek1@gsu.edu)
### Date: 03/23/2023
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
library(car)        # Variance Inflation Factor 
library(psych)      # Correlation matrix
library(GGally)     # Correlation matrix

## Today's agenda ----

## Load your data ----
# We are using V-Dem version 12 

# Small data filtered to US
us_data <- readRDS("data/vdem12.rds") |> 
  filter(country_name == "United States of America") |> 
  rename(democracy = v2x_polyarchy, 
         gdp_per_capita = e_gdppc,
         urbanization = e_miurbani,
         regime = v2x_regime)

# Full data
my_data <- readRDS("data/vdem12.rds") |> 
  rename(democracy = v2x_polyarchy, 
         gdp_per_capita = e_gdppc,
         urbanization = e_miurbani,
         regime = v2x_regime)

# Toy model for this week
us_model <- lm(democracy ~ gdp_per_capita + urbanization + regime, data = us_data)
my_model <- lm(democracy ~ gdp_per_capita + urbanization + regime, data = my_data)

stargazer(us_model, my_model, type = "text", report = "vcstp*",
          column.labels = c("US sample", "Full sample"))

# Correlation matrix ----
my_data |> 
  select(democracy, gdp_per_capita, urbanization, regime) |> 
  ggpairs()

# Correlation basics ----

# cor() computes the correlation coefficient
# cor.test() test for association/correlation between paired samples. 
# It returns both the correlation coefficient and the significance level
# (or p-value) of the correlation.

# cor.test(x, y, method=c("pearson", "kendall", "spearman"))

# Pearson - normal distribution, continuous
# Spearman - non-parametric, ordinal variables
# Kendall - non-parametric, continuous 

# The nice thing about the Spearman correlation is that relies on nearly all 
# the same assumptions as the pearson correlation, but it doesn’t rely on 
# normality, and your data can be ordinal as well. 

# The Kendall correlation is similar to the spearman correlation in that it is 
# non-parametric. It can be used with ordinal or continuous data.
cor.test(my_data$democracy, my_data$regime, 
    use = "complete.obs", 
    method = c("pearson"))

# Variance Inflation Factor (VIF) ----
# VIF value starts from 1 
# A value of 1 indicates there is no correlation
# A value between 1 and 5 indicates moderate correlation
# A value greater than 5 indicates potentially severe correlation
vif(us_model)
vif(my_model)

# Plot VIF with values more than 5 
# Create vector of VIF values
vif_values <- vif(us_model)

# Create horizontal bar chart to display each VIF value
barplot(vif_values, main = "VIF Values", horiz = TRUE, col = "steelblue")

# Add vertical line at 5
abline(v = 5, lwd = 3, lty = 2)

# Taking the first difference ----
us_data$diff_regime <- us_data$regime - lag(us_data$regime, n = 1)

# OR in tidy language
us_data <- us_data |> 
  mutate(diff_regime = regime - lag(regime, n = 1))

# Let's compare our models 
us_model <- lm(democracy ~ gdp_per_capita + urbanization + regime, data = us_data)
us_model2 <- lm(democracy ~ gdp_per_capita + urbanization + diff_regime, data = us_data)

stargazer(us_model, us_model2, type = "text", report = "vcspt*",
          column.labels = c("US Sample", "US Sample - First difference"))

vif(us_model)
vif(us_model2)
