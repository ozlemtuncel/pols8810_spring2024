
# Week 6: Multiple Regression and Inference (02/16/2023)
Ozlem Tuncel 

otuncelgurlek1@gsu.edu

> ⚠️ **CAUTION**: DO NOT SOLELY RELY ON MY NOTES. THERE MIGHT BE TYPOS AND MISTAKES. ALWAYS TAKE YOUR NOTES!

✔️ The goal of this week is to learn multiple OLS and inference. 

## Here are some key points:
- Just like bivariate regression, now we have multiple independent variables. 
- $\beta = ({X^\prime} X)^{-1} {X^\prime}Y$ - knowing this by heart will help you with proofs
- **Gauss-Markov Assumptions**
  1. **Linearity** - our parameters (our betas) are linear! 
  2. **No Perfect Multicollinearity** (Full Rank) (perfect multicollinearity is when your variables are strongly correlated) and **N>K** (number of observations should be bigger than number of variables. 
  3. **E(u)=0** Conditional Mean Zero assumption - so our average error term should be zero. Xs are exogenous => E(u|X) = 0. This assumption fails if X and u are correlated.
  4. **Spherical Disturbances (Homoskedasticity and Autocorrelation)** autocorrelation mostly deals with time and homoskedasticity mostly deals with space. Our error terms are not correlated with each other under homoskedasticity (within-group correlation will cause heteroskedasticity). And, there is no correlation between the error term and independent variables. 
  5. **Non-stochastic Regressors** - we are measuring things that vary but we assume that they are fixed. $Cov(X, u) = 0$. This assumption also assumes that we do not have measurement error. 
  6. **Normality** or $u \sim N[0, \sigma^2 I]$
- Violations of most assumptions, won't bias our coefficient estimates, but we will have no clue about the precision of our estimates because our standard errors will be way off. 
- Consistencty is asymptotic (aka large sample size) characteristics. 
- **Goodness-of-fit** - overall quality of our model. Here we are going to talk about $R^2$, $R^2_{adj}$, and $F-statistic$. How well my model fit the data? 
  1. **F-statistic**: depends on the degrees of freedom and sample size. Bivariate regression has 2 degrees of freedom. Comparing the model (unrestricted model) to some other model (restiricted model). If you have not significant F-stat - that is bad! 
  2. **$R^2$**: people give too much importance to this - intuitively, this is the measure of amount of variance explained by your variables. Increases as we add variables to our regression.
  3. **$R^2_{adj}$**: much better than R-squared. It penalizes for the number of k. 
- You'll always gave omitted variable bias - this is due to human nature. It is impossible account for all factors that explain an outcome. Overfitting is a much worse problem. 
- **Interpretation**: independent effects, so we can interpret each coefficient. We can say "one unit increase in our X increases Y by XXXX"
- **Standardized coefficients**: helps us to identify the effect when we have two different scales. Now, we say "one standard deviation increase in our X increases Y by XXXX standard deviations". But, this makes substantive interpretation harder, right?  
