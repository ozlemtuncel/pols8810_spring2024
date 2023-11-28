### 
### Purpose: Week 13 - Brief Intro to GLM
### Author: Ozlem Tuncel (otuncelgurlek1@gsu.edu)
### Date: 04/13/2023
### R version: 4.2.2 Innocent and Trusting
###

### Load necessary packages ----
# Use install.packages() if you do not have this package
library(tidyverse)  # Data manipulation
library(stargazer)  # Creates nice regression output tables
library(dotwhisker) # Dot-and-whisker plot of regression result
library(lmtest)     # Breusch-Pagan test
library(sandwich)   # Robust standard errors
library(broom)

## Load your data ----
# We are using V-Dem version 12 

# Full data
my_data <- readRDS("data/vdem12.rds") |> 
  select(year, v2x_regime, e_gdppc, e_miurbani) |> 
  rename(regime = v2x_regime, 
         gdp_per_capita = e_gdppc,
         urbanization = e_miurbani) |> 
  mutate(democracy_binary = ifelse(regime >=2, 1, 0))

# Make sure your outcome is binary
str(my_data$democracy_binary)
my_data$democracy_binary <- as.factor(my_data$democracy_binary)

# Toy model for this week

# First, let's see what happens with lm()
lm_model <- lm(democracy_binary ~ gdp_per_capita + urbanization, data = my_data)
summary(lm_model)
# See warning message
# R will still run stuff because R is not as smart as you think

# Let's run the model with glm() function
glm_model <- glm(democracy_binary ~ gdp_per_capita + urbanization, 
                 data = my_data,
                 family = binomial(link = "logit"))

summary(glm_model)

# compare glm and lm
stargazer(lm_model, glm_model,
          type = "text", 
          report = "vcstp*",
          title = "Predictors of democratic regimes in the world")

# There is also probit option as well
glm_model_probit <- glm(democracy_binary ~ gdp_per_capita + urbanization, 
                 data = my_data,
                 family = binomial(link = "probit"))

# Let's compare logit and probit
stargazer(glm_model, glm_model_probit,
          type = "text", 
          report = "vcstp*",
          title = "Predictors of democratic regimes in the world",
          column.labels = c("logit", "probit"))

# What happened to residuals?
par(mfrow = c(2,2)) # this helps me to plot 4 plots at the same time
plot(glm_model)
par(mfrow = c(1,1)) # return back to single plot in a page 

# Let's plot standardized residuals
model.data <- augment(glm_model) %>% 
  mutate(index = 1:n()) 

ggplot(model.data, aes(index, .std.resid)) + 
  geom_point(aes(color = democracy_binary), alpha = .5) +
  theme_bw()

# Example from https://www.r-bloggers.com/2013/08/residuals-from-a-logistic-regression/
source("http://freakonometrics.free.fr/probit.R")
reg=glm(Y~X1+X2,family=binomial)

plot(predict(reg),residuals(reg),col=c("blue","red")[1+Y])
abline(h=0,lty=2,col="grey")
