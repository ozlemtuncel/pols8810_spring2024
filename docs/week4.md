
# Week 4: Bivariate OLS (02/02/2023)
Ozlem Tuncel 

otuncelgurlek1@gsu.edu

> ⚠️ **CAUTION**: DO NOT SOLELY RELY ON MY NOTES. THERE MIGHT BE TYPOS AND MISTAKES. ALWAYS TAKE YOUR NOTES!

✔️ The goal of this week is to learn the theory behind bivariate OLS and how to perform one in R. 
✅ We are also covering some details from last week's materials and talking about Problem Set I. 

## Here are some key points:
- For graphs, make sure you have the correct baseline (point of reference), have meaningful scales and sizes, clear labels, and it serves a purpose. 
- **Bivariate regression**: the relationship between two variables (x and y), y is usually the dependent variable. 
- **OLS** only works with continous dependent variables. 
- **Dependent** variable - also known as *regressand, response, observed*
- **Independent** variable - also known as *regressor, factor, explanatory*
- OLS is **BLUE** - best linear unbiased estimator
- The goal of OLS is to find a predicted value for Y represented by $\hat{Y}$ ⭐
- $y = \alpha + X\beta$ means that $\beta$ is the population parameter and the slope coefficient and $\alpha$ is the y-intercept of the line
- Another goal = minimize the deviation which is $d = y - \hat{y}$, precisely minimize the sum of squared differences ⭐
- With OLS, we cannot claim causation, this is all about correlation! Recall correlation $\not=$ causation
- In OLS, one unit change in x corresponds to $\beta$ unit change in y (interpretation is often easy, but consider log etc.)
- Bivariate regression is $y = f(x)$ in which we have one indepedent and dependent variable
- Multiple regression is $y = f(**X**)$ in which we have multiple independent variables, 
- Multivariate regression is $**Y** = f(**X**)$ where there are multiple dependent variables and multiple independent variables
- Reminder => population is always in Greek letters and stats in Roman letters. 

## Some recommendations: 
- Curious about inverse Gaussian distribution, see [here](https://en.wikipedia.org/wiki/Inverse_Gaussian_distribution).
- Read more about [bias of an estimator](https://en.wikipedia.org/wiki/Bias_of_an_estimator), [efficiency of an estimator](https://en.wikipedia.org/wiki/Efficiency_(statistics)), [visual representation of bias and efficiency](https://quantscience.rbind.io/slides/2019mc_slides#16), and [bias-variance tradeoff](https://en.wikipedia.org/wiki/Bias%E2%80%93variance_tradeoff).
