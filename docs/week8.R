###
### Purpose: Week 8 - 
### Author: Ozlem Tuncel (otuncelgurlek1@gsu.edu)
### Date: 03/02/2023
### R version: 4.2.2 Innocent and Trusting
###

### Load necessary packages ----
# Use install.packages() if you do not have this package
library(tidyverse)  # Data manipulation
library(stargazer)  # Creates nice regression output tables
library(dotwhisker) # Dot-and-whisker plot of regression result
library(broom)      # tidy models
library(margins)
library(ggeffects)

## Load your data ----
# We are using V-Dem version 12 
my_data <- readRDS("data/vdem12.rds") 

# Let's change names of some of these variables for the sake of simplicity
# I am also subsetting it to only US
us_data <- my_data |>
  filter(country_name == "United States of America") |> 
  rename(democracy = v2x_polyarchy, 
         gdp_per_capita = e_gdppc,
         urbanization = e_miurbani,          
         polarization = v2cacamps,
         polarization_ordinal = v2cacamps_ord) |> 
  mutate(high_polarization = ifelse(polarization >= -1, 1, 0))

## Model with interaction ----

# We use * (star) between two interaction terms to make sure that each term is
# included individually

# These two are the same
lm(democracy ~ gdp_per_capita + urbanization*as.factor(high_polarization), 
   data = us_data)

lm(democracy ~ gdp_per_capita + urbanization + as.factor(high_polarization) + 
     urbanization:as.factor(high_polarization), 
   data = us_data)

# This is our toy model
no_interaction <- lm(democracy ~ gdp_per_capita + urbanization + 
                       as.factor(high_polarization), data = us_data)

my_model <- lm(democracy ~ gdp_per_capita + urbanization*as.factor(high_polarization), 
               data = us_data)

stargazer(no_interaction, my_model, 
          type = "text",
          column.labels = c("Additive model", "Interaction model"),
          covariate.labels = c(gdp_per_capita = "GDP per capita",
                               urbanization = "Urbanization", 
                               `as.factor(high_polarization)1` = "High polarization", 
                               `urbanization:as.factor(high_polarization)1` = "Urbanization*High Polarization")) 

# Results of our regression
stargazer(my_model, type = "text")

dwplot(my_model) |> 
  relabel_predictors(c(gdp_per_capita = "GDP per capita ($)",
                       urbanization = "Urbanization",
                       `as.factor(high_polarization)1` = "High Polarization",
                       `urbanization:as.factor(high_polarization)1` = "Urbanization*High Polarization")) +
  theme_bw() +
  theme(plot.title = element_text(face="bold"),
        legend.position = "",
        legend.background = element_rect(colour="grey80"),
        legend.title.align = .5) +
  labs(x = "Coefficient Estimate with 95% CIs", 
       y = "") +
  geom_vline(xintercept = 0, color = "blue") 

## Predicted values ----

# We are going to use `ggeffects` package but there are other different 
# packages out there. I prefer this because it works well with ggplot2. 
# ggpredict() computes predicted values for all possible levels and values 
# from a model’s predictors.

# Let's see the predicted values of democracy by different values of urbanization
ggpredict(my_model, terms = c("urbanization"))

# You can just plot these predicted values with plot() function 
ggpredict(my_model, terms = c("urbanization")) |> plot() +
  labs(x = "Urbanization", y = "Democracy")

# Let's see the predicted values of democracy by high polarization
ggpredict(my_model, terms = c("high_polarization")) |> 
  plot() +
  labs(x = "High Polarization", y = "Democracy")

# Let's see the predicted values of democracy by urbanization and polarization
ggpredict(my_model, terms = c("urbanization", "high_polarization")) |> 
  plot() +
  labs(x = "Urbanization", y = "Democracy", color = "High Polarization") +
  theme(legend.position = "bottom")

## Marginal effects ----
# Stata's margins command is very simple and intuitive to use. This package 
# helps us port the functionality of Stata's command. 

# margins provides “marginal effects” summaries of models and prediction provides 
# unit-specific and sample average predictions from models. Marginal effects are 
# partial derivatives of the regression equation with respect to each variable in 
# the model for each unit in the data; average marginal effects are simply the 
# mean of these unit-specific partial derivatives over some sample.

# Let's see margins first
# Warning: margins() command can take a long time depending on the model.
my_margins <- margins(my_model)
summary(my_margins)

plot(my_margins)

cplot(my_model, "high_polarization", what = "prediction")

my_plot_urban <- cplot(my_model, 
                 x = "urbanization", 
                 dx = c("high_polarization"),
                 what = "prediction",
                 rug = T,
                 level = 0.95)

my_plot_polar <- cplot(my_model, 
                       x = "high_polarization", 
                       dx = c("urbanization"),
                       what = "prediction",
                       rug = T,
                       level = 0.95)

# Make it prettier
my_plot_urban |> 
  ggplot(aes(x = xvals)) + 
  geom_line(aes(y = yvals)) +
  geom_line(aes(y = upper), linetype = 2) +
  geom_line(aes(y = lower), linetype = 2) +
  theme_bw() +
  labs(x = "Urbanization", 
       y = "Average marginal effect of high-polarization")

# How things look like in 3-D
persp(my_model, "gdp_per_capita", "urbanization")
