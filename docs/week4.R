###
### Purpose: Week 4 - Bivariate regression
### Author: Ozlem Tuncel (otuncelgurlek1@gsu.edu)
### Date: 02/04/2023
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
my_data <- my_data |>
  rename(democracy = v2x_polyarchy, gdp_per_capita = e_gdppc)

### Run a bivariate OLS ----
# We are going to use lm() function (which means linear model). 
# Always check function help page!
?lm
help(lm)

# Here is how you specify your variables:
# lm(dependent_variable ~ independent_variable(s), data = your_data)
# ~ => this is tilda

# For example:
lm(democracy ~ gdp_per_capita, data = my_data) 

# This produces very little info, so we save this output as a list object 
# and then examine it. Like this:

my_lm <- lm(democracy ~ gdp_per_capita, data = my_data) # creates a list object called my_lm

summary(my_lm) # gives more detailed output

### Stargazer package ----
# Let's create better looking output using stargazer function
stargazer(my_lm, type = "text") # Change type to latex if you're importing to LaTeX

# Let's make it much better and export it to latex!
stargazer(my_lm, 
          type = "latex", 
          title = "The relationship between democracy and GDP per capita", 
          covariate.labels = c("GDP per capita"),
          dep.var.labels = c("Electoral Democracy Index"),
          ci.level = 0.95,
          star.cutoffs = c(0.05),
          notes.align = "l",
          notes.append = FALSE,
          notes.label = "Notes", 
          notes = "*p < 0.05. Standard errors are in parentheses.")

