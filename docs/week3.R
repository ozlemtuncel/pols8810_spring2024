###
### Purpose: Week 3 Materials
### Author: Ozlem Tuncel (otuncelgurlek1@gsu.edu)
### Date: 01/19/2023
### R version: 4.2.2 Innocent and Trusting
###

### Library ----
library(tidyverse)

### DATA TYPES AND STRUCTURES ----

# Core functions ----
class()
typeof()
str()

# Functions to convert data types
as.numeric()
as.integer()
as.character()

# Core functions to determine any object's class
is.numeric()
is.integer()
is.numeric()
is.na()

# Some of these data types will not be something we'll use (like complex and raw)
my_complex <- c(22-1i)
class(my_complex)

# Raw type (holds raw bytes, so it is a very unusual data type)
my_raw <- raw(5)
print(my_raw)
class(my_raw)

# Character ----
x <- "apple"
class(x)
str(x) # prints class and content of the object

# Using double quote marks, 4 becomes a character
z <- c("apple", "4")
str(z)

# Numeric & Integer & Double ----
# When R stores a number in a variable, it converts the number into a “double” 
# value or a decimal type with at least two decimal places. This means that a 
# value such as “1” here, is stored as 1.00 with a type of double and a 
# class of numeric.
# Double is a real number stored in “double-precision floating point format.”
typeof(1)
class(1)

# the L tells R to store this as an integer. Many R programmers do not use this 
# mode since every integer value can be represented as a double. 
# An integer can be positive or negative.
my_int <- 35L 
class(my_int)

# You can convert numeric to integer
my_num_int <- as.integer(my_num)
class(my_num_int)

# You can even convert numeric to character
my_num_character <- as.character(my_num)
str(my_num_character)

# Logical (TRUE, FALSE, T, F) ----
my_logical <- c(TRUE, FALSE, TRUE, TRUE)
class(my_logical)
is.logical(my_logical)

my_logical2 <- c(F, F, T, T) # this is also logical
str(my_logical2)

# Here, I have numbers in my vector, and R will force it to numeric class
my_logical2 <- c(T, 3, 5, F)
str(my_logical2)

### DESCRIPTIVES ----

# Basic functions to use for descriptives ----
summary()  # produces result summaries 
mean()     # arithmetic mean
median()   # median
sd()       # standard deviation
table()    # shows frequencies of factor/category variables
var(x)     # (sample) variance
quantile() # quantile
min()      # minimum value
max()      # maximum value
range()    # range with minimum and maximum value 

# I recommend using these with sapply() command
sapply(my_data, mean, na.rm = T) # will procude mean for every variable in my_data

# Or, there are several packages out there for quick descriptive stats
library(psych)
describe(mtcars)

# I also recommend using correlation matrix 
library(PerformanceAnalytics)
chart.Correlation(mtcars)

# Examples ----

### GRAPHS ----
# Load data and make sure you have necessary packages 
# We are using Varieties of Democracy version 12
library(tidyverse)
my_data <- readRDS("data/vdem12.rds")

# Let's change names of some of these variables for the sake of simplicity
my_data <- my_data |>
  rename(democracy = v2x_polyarchy, 
         regime_type = v2x_regime, 
         gdp = e_gdp,
         gdp_per_capita = e_gdppc)

### Line plot ----

# This is a huge data, so let's focus on just one country here. 
# Let's plot Turkey's democracy score over time using base R.
plot(x = my_data[my_data$country_name %in% "Turkey",]$year, 
     y = my_data[my_data$country_name %in% "Turkey",]$democracy, 
     type = "l", 
     xlab = "Year", ylab = "Democracy")

# ggplot version 
my_data |>
  filter(country_name == "Turkey") |> 
  ggplot(aes(x = year, y = democracy)) +
  geom_line()

# Let's make it pretty
my_data |>
  filter(country_name == "Turkey") |> 
  ggplot(aes(x = year, y = democracy)) +
  geom_line() +
  theme_bw() +
  labs(x = "Year", y = "Democracy") +
  scale_x_continuous(breaks = seq(1800, 2020, by = 20)) +
  scale_y_continuous(breaks = seq(0, 1, by = 0.1))

### Bar plot ----
# Base R: simple and fast!
str(my_data$regime_type)

plot(as.factor(my_data$regime_type))

# ggplot is also similarly easy!
my_data |> 
  ggplot(aes(x = regime_type)) +
  geom_bar() 

# Make it fancy
my_labels <- c("Closed Autocracy", "Electoral Autocracy", 
               "Electoral Democracy", "Liberal Democracy")

my_data |> 
  filter(!is.na(regime_type)) |> 
  ggplot(aes(x = as.factor(regime_type), y = (..count..)/sum(..count..))) +
  geom_bar() + 
  theme_bw() +
  labs(x = "Regime Type", y = "Frequency") + 
  scale_x_discrete(labels = my_labels)

### Histogram ----

# Base R histogram is super simple!
hist(my_data$democracy)

# ggplot is also easy! 
my_data |> 
  ggplot(aes(x = democracy)) +
  geom_histogram()

# Let's make it fancy
my_data |> 
  ggplot(aes(x = democracy, y = (..count..)/sum(..count..))) +
  geom_histogram(bins = 50) +
  labs(x = "Democracy", y = "Frequency") +
  theme_bw() + 
  scale_x_continuous(breaks = seq(0, 1, by = 0.1)) +
  scale_y_continuous(breaks = seq(0, 0.15, by = 0.01))

### Box plot ----
boxplot(my_data$democracy)

# ggplot version 
my_data |> 
  ggplot(aes(x = democracy)) +
  geom_boxplot()

# Make it fancy!
my_data |> 
  ggplot(aes(x = factor(0), y = democracy)) +
  geom_boxplot() + 
  labs(x = "Democracy", y = "") + 
  theme_bw() +
  theme(axis.text.x = element_blank(), 
        axis.ticks.x = element_blank()) +
  scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, by = 0.1))

### Scatter plot ----
# Base R
plot(x = my_data[my_data$country_name == "United States of America",]$democracy, 
     y = my_data[my_data$country_name == "United States of America",]$gdp_per_capita)

# ggplot 
my_data |> 
  filter(country_name == "United States of America") |> 
  ggplot(aes(x = democracy, y = gdp_per_capita)) +
  geom_point()

# Make it fancy
my_data |> 
  filter(country_name == "United States of America") |> 
  ggplot(aes(x = democracy, y = gdp_per_capita)) +
  geom_point() + 
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 1, by = 0.1)) +
  scale_y_continuous(breaks = seq(0, 60, by = 10)) +
  labs(x = "Democracy", y = "GDP per capita") +
  geom_smooth(method = lm)
  