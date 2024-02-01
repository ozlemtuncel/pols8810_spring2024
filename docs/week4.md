
# Week 4: Bivariate OLS (02/01/2023)
Ozlem Tuncel 

otuncelgurlek1@gsu.edu

> ⚠️ **CAUTION**: DO NOT SOLELY RELY ON MY NOTES. THERE MIGHT BE TYPOS AND MISTAKES. ALWAYS TAKE YOUR NOTES!

✔️ The goal of this week is to learn the theory behind bivariate OLS and how to perform one in R. 
✅ We are also covering some details from the last semester. 

## Here are some key points:
- For graphs, make sure you have the correct baseline (point of reference), have meaningful scales and sizes, clear labels, and it serves a purpose. 
- **Bivariate regression**: the relationship between two variables (x and y), y is usually the dependent variable. 
- **OLS** only works with continous dependent variables. 
- **Dependent** variable - also known as *regressand, response, observed, outcome*
- **Independent** variable - also known as *regressor, factor, explanatory, covariates*
- OLS is **BLUE** - best linear unbiased estimator
- **Estimator** is something we use to estimate to population parameter.
- **Good estimator** has two characteristics unbiasedness and efficiency (lower variance). 
- **Unbiasedness**, $E(\theta) = \theta$, is the case when expected value of sampling distribution of an estimator to is equal to the unknown true population parameter.  
- The goal of OLS is to find a predicted value for Y represented by $\hat{Y}$ ⭐
- $y = \alpha + X\beta$ means that $\beta$ is the population parameter and the slope coefficient and $\alpha$ is the y-intercept of the line
- Another goal => minimize the deviation which is $d = y - \hat{y}$, precisely minimize the sum of squared differences ⭐
- Squaring is actually helping us to get the exponential increase in our differences. We are giving more weight to outlier observations.
- The p-value is the probability that we would get our sample value given that the null hypothesis is true. We never truely estimate the alternative hypothesis.
- Alpha $\alpha$, the significance level, is the probability that you will make the mistake of rejecting the null hypothesis when in fact it is true.
- Statistical significance is dichotomy! (Rosnow and Rosenthal (1989) once said: "God loves the 0.06 nearly as much as the 0.05.")  
- With OLS, we cannot claim causation, this is all about correlation! Recall correlation $\not=$ causation
- In OLS, one unit change in x corresponds to $\beta$ unit change in y (interpretation is often easy, but consider log etc.)
- Bivariate regression is $y = f(x)$ in which we have one indepedent and dependent variable
- Multiple regression is $y = f(**X**)$ in which we have multiple independent variables, 
- Multivariate regression is $**Y** = f(**X**)$ where there are multiple dependent variables and multiple independent variables
- Reminder => population is always in Greek letters and stats in Roman letters. 

## Some recommendations: 
- Curious about inverse Gaussian distribution, see [here](https://en.wikipedia.org/wiki/Inverse_Gaussian_distribution).
- Read more about [bias of an estimator](https://en.wikipedia.org/wiki/Bias_of_an_estimator), [efficiency of an estimator](https://en.wikipedia.org/wiki/Efficiency_(statistics)), [visual representation of bias and efficiency](https://quantscience.rbind.io/slide/2019mc_slides#16), and [bias-variance tradeoff](https://en.wikipedia.org/wiki/Bias%E2%80%93variance_tradeoff).
