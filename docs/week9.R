### 
### Purpose: Week 9 - Variance Issues
### Author: Ozlem Tuncel (otuncelgurlek1@gsu.edu)
### Date: 03/05/2023
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

## Today's agenda ----

# 1. Test for heteroskedasticity  
# 2. Band-aid solutions to heteroskedasticity  

## Load your data ----
# We are using V-Dem version 12 
my_data <- readRDS("data/vdem12.rds") |> 
  rename(democracy = v2x_polyarchy, 
         gdp_per_capita = e_gdppc,
         urbanization = e_miurbani)

# Toy model for this week
my_model <- lm(democracy ~ gdp_per_capita + urbanization, data = my_data)

summary(my_model)

stargazer(my_model,
          type = "text", 
          title = "Predictors of democracy in the world", 
          covariate.labels = c("GDP per capita", "Urbanization"),
          dep.var.labels = c("Electoral Democracy Index"),
          report = "vcstp",
          ci.level = 0.95,
          star.cutoffs = c(0.05),
          notes.align = "l",
          notes.append = FALSE,
          notes.label = "Notes", 
          notes = "Standard errors are in parentheses.")

## Detecting heteroskedasticity  ----

# You can test whether you have any heteroskedasticity using formal tests or 
# visuals. Both are valid ways to understand this issue.
# I prefer visuals - easy to do and interpret. 

# Looking for heteroskedasticity - plot residuals ~ fitted.values
my_model |> 
  ggplot(aes(x = .fitted, y = .resid)) + 
  geom_point(col = 'blue') + 
  geom_abline(slope = 0) +
  labs(x = "Fitted values", y = "Residuals") + 
  theme_bw()

# Breusch-Pagan test ----
# From lmtest() package

# H0: Homoscedasticity is present (the residuals are # distributed with equal variance)
# HA: Heteroscedasticity is present (the residuals are not distributed with equal variance)
bptest(my_model)

# p is smaller than 0.05 - so we reject the null, find support for heteroscedasticity

# How homoskedasticity looks like ----
n <- 1000      # sample size
x <- runif(n, 
           min = 0, 
           max = 100)

y.good <- 3 + 0.1 * x + rnorm(n, sd = 3)

# Residual vs fitted for ideal OLS setting 
lm.good <- lm(y.good ~ x)
plot(lm.good, which = 1) 

## Band-aid solutions to heteroskedasticity ----

# Weighted standard errors ----

# Perform weighted least squares regression
weighted_model <- lm(democracy ~ gdp_per_capita + urbanization, 
                     data = my_data,
                     weights = my_data$e_pop)

summary(weighted_model)

# Robust standard errors ----

# We are going to use sandwich package and vcov related functions
# I recommed reading the package carefully for your own projects
# https://cran.r-project.org/web/packages/sandwich/sandwich.pdf

# This is an econometric package that computes robust standard errors in a 
# regression model. These robust estimates are also called sandwich estimators 
# because the formula looks like a sandwich. But, you only know that if you 
# studied a bit of econometric theory. 

# sandwich package has 7 different ways to estimate standard errors
# vcovBS, vcovCL, vcovHAC, vcovHC, vcovOPG, vcovPC, vcovPL
# We use vcovHC (heteroscedasticity- consistent) for Huber-White correction

# Get robust standard errors 
coeftest(my_model, vcov. = vcovHC(my_model, type = "HC0"))

# type can be:
# type = c("HC3", "const", "HC", "HC0", "HC1", "HC2", "HC4", "HC4m", "HC5")

# This gives us robust standard errors but in order to get this output 
# We need to generate these robust se's differently 

# Generate robust standard errors to use them in stargazer
cov_m1 <- vcovHC(my_model, method = "HC3")
rob_m1 <- sqrt(diag(cov_m1))

# Use these robust standard errors in stargazer function
stargazer(my_model, 
          se = (list(rob_m1)), 
          type = "text",
          title = "Predictors of democracy in the US", 
          covariate.labels = c("GDP per capita", "Urbanization"),
          dep.var.labels = c("Electoral Democracy Index"),
          report = "vcstp",
          ci.level = 0.95,
          star.cutoffs = c(0.05),
          notes.align = "l",
          notes.append = FALSE,
          notes.label = "Notes", 
          notes = "Standard errors are in parentheses.")

# Clustered standard errors ----

# Get clustered standard errors 
coeftest(my_model, vcov. = vcovCL(my_model, cluster = ~ country_name))

# Generate clustered standard errors to use them in stargazer
cov_m2 <- vcovCL(my_model, cluster = ~ country_name)
rob_m2 <- sqrt(diag(cov_m2))

# Use these robust standard errors in stargazer function
stargazer(my_model, 
          se = (list(rob_m2)), 
          type = "text",
          title = "Predictors of democracy in the world", 
          covariate.labels = c("GDP per capita", "Urbanization"),
          dep.var.labels = c("Electoral Democracy Index"),
          report = "vcstp",
          ci.level = 0.95,
          star.cutoffs = c(0.05),
          notes.align = "l",
          notes.append = FALSE,
          notes.label = "Notes", 
          notes = "Standard errors are in parentheses.")

# Compare all models ----
stargazer(my_model, weighted_model, my_model, my_model, 
          se = (list(NULL, NULL, rob_m1, rob_m2)),
          type = "latex",
          title = "Predictors of democracy in the world", 
          covariate.labels = c("GDP per capita", "Urbanization"),
          dep.var.labels = c("Electoral Democracy Index"),
          column.labels = c("OLS Model", 
                            "Weighted OLS",
                            "OLS with Robust SE", 
                            "OLS with Clustered SE"),
          report = "vcstp",
          ci.level = 0.95,
          star.cutoffs = c(0.05),
          notes.align = "l",
          notes.append = FALSE,
          notes.label = "Notes", 
          notes = "Standard errors are in parentheses.")

### NOTES ----
# Weighted standard errors alternative ----

# defining the weights in such a way that the observations with lower 
# variance are given more weight

# define weights to use
my_data2 <- my_data |> 
  filter(!is.na(my_data$e_pop) & 
           !is.na(my_data$democracy) & 
           !is.na(my_data$gdp_per_capita) & 
           !is.na(my_data$urbanization))

alternative_model <- lm(democracy ~ gdp_per_capita + urbanization, 
                        data = my_data2)

my_wt <- 1 / lm(abs(alternative_model$residuals) ~ alternative_model$fitted.values)$fitted.values^2

#perform weighted least squares regression
wls_model <- lm(democracy ~ gdp_per_capita + urbanization, 
                data = my_data2, 
                weights = my_wt)

#view summary of model
summary(wls_model)
