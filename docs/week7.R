###
### Purpose: Week 7 - Dichotomous Predictors
### Author: Ozlem Tuncel (otuncelgurlek1@gsu.edu)
### Date: 02/23/2023
### R version: 4.2.2 Innocent and Trusting
###

### Load necessary packages ----
# Use install.packages() if you do not have this package
library(tidyverse)  # Data manipulation
library(stargazer)  # Creates nice regression output tables
library(lmtest)     # Breusch-Pagan test 
library(dotwhisker) # Dot-and-whisker plot of regression result
library(ggpubr)     # Publication quality visuals   
library(broom)      # tidy models
library(PerformanceAnalytics) # correlation matrix
library(MASS)
library(bestNormalize)

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
         regime = v2x_regime,
         polarization = v2cacamps,
         polarization_ordinal = v2cacamps_ord) |> 
  mutate(regime_binary = ifelse(regime %in% c(2,3), 1, 0), 
         high_polarization = ifelse(polarization >= -1, 1, 0))

## Binary IV ----
# Continuous IV 
cont <- us_data |> 
  ggplot(aes(x = gdp_per_capita, y = democracy)) +
  geom_point() + 
  geom_smooth(method = "lm") +
  scale_x_continuous(breaks = seq(0, 80, 10)) +
  scale_y_continuous(breaks = seq(0, 2, 0.10)) +
  labs(x = "GDP per capita ($)", y = "Democracy") +
  theme_bw()

# Binary IV
binary <- us_data |> 
  filter(!is.na(high_polarization)) |> 
  ggplot(aes(x = high_polarization, y = democracy)) +
  geom_point() + 
  geom_smooth(method = "lm") +
  scale_x_continuous(breaks = seq(0, 1, 1), limits = c(0, 1)) +
  scale_y_continuous(breaks = seq(0, 1, 0.10)) +
  labs(x = "High Political Polarization", y = "Democracy") +
  theme_bw()

# Combine 
ggarrange(cont, binary)

## Dichotomous and continuous X ----
us_data |> 
  filter(!is.na(high_polarization)) |> 
  ggplot(aes(x = gdp_per_capita, y = democracy, color = as.factor(high_polarization))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_bw() +
  theme(legend.position = "bottom") +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 1, 0.10), limits = c(0.4, 1)) +
  scale_color_discrete(labels = c("No (0)", "Yes (1)")) +
  labs(title = "Democracy in the US explained by GDP and polarization",
       x = "GDP per capita ($)",
       y = "Democracy", 
       color = "High Political Polarization")

## Ordinal vs continuous ----
continuous <- lm(democracy ~ polarization_ordinal, data = us_data)
ordinal <- lm(democracy ~ as.factor(polarization_ordinal), data = us_data)

# transform model objects into data frames
m1_tidy <- tidy(continuous) |> 
  mutate(model = "Continuous DV Model")

# repeat for model 2
m2_tidy <- tidy(ordinal) |> 
  mutate(model = "Ordinal DV Model")

# combine these models 
all_models <- bind_rows(m1_tidy, m2_tidy)

dwplot(all_models) |> 
  relabel_predictors(c(polarization_ordinal = "Political Polarization",
                       `as.factor(polarization_ordinal)2` = "Political Polarization \n To somewhat extent",
                       `as.factor(polarization_ordinal)3` = "Political Polarization \n To noticeable extent",
                       `as.factor(polarization_ordinal)4` = "Political Polarization \n To a large extent")) +
  theme_bw() +
  theme(plot.title = element_text(face="bold"),
        legend.position = "bottom",
        legend.background = element_rect(colour="grey80"),
        legend.title.align = .5) +
  labs(x = "Coefficient Estimate with 95% CIs", 
       y = "", 
       title = "Predicting democracy in the US") +
  scale_shape_discrete(name  ="Models", breaks = c(0, 1)) + # breaks assign shapes
  scale_colour_grey(start = .3, end = .7, name = "Models") # start/end for light/dark greys

## Transformations ----
# Let's start with a toy model
multiple <- lm(democracy ~ gdp_per_capita + urbanization, data = us_data)

# Correlation between these variables
chart.Correlation(us_data |> dplyr::select(democracy, gdp_per_capita, urbanization))

# plot the model
par(mfrow = c(2,2)) # this helps me to plot 4 plots at the same time
plot(multiple)
par(mfrow = c(1,1)) # return back to single plot in a page 

# Residual plot with histogram
hist(multiple$residuals, freq=F, xaxt="n", xlab="", ylab="", main="")
par(new = T)
plot(density(resid(multiple)))

### NOTES - Advanced Transformation ----
# https://cran.r-project.org/web/packages/bestNormalize/vignettes/bestNormalize.html
(BNobject <- bestNormalize(us_data$gdp_per_capita))
# arcsinh transformation
(arcsinh_obj <- arcsinh_x(us_data$gdp_per_capita))
# Box Cox's Transformation
(boxcox_obj <- boxcox(us_data$gdp_per_capita))
# Yeo-Johnson's Transformation
(yeojohnson_obj <- yeojohnson(us_data$gdp_per_capita))
# orderNorm Transformation
(orderNorm_obj <- orderNorm(us_data$gdp_per_capita))

par(mfrow = c(2,2))
MASS::truehist(arcsinh_obj$x.t, main = "Arcsinh transformation", nbins = 12)
MASS::truehist(boxcox_obj$x.t, main = "Box Cox transformation", nbins = 12)
MASS::truehist(yeojohnson_obj$x.t, main = "Yeo-Johnson transformation", nbins = 12)
MASS::truehist(orderNorm_obj$x.t, main = "orderNorm transformation", nbins = 12)
