# Week 9: Variance Issues (03/09/2023)
Ozlem Tuncel 

otuncelgurlek1@gsu.edu

> ⚠️ **CAUTION**: DO NOT SOLELY RELY ON MY NOTES. THERE MIGHT BE TYPOS AND MISTAKES.

✔️ The goal of this week is to learn more about heteroskedasticity and heteroskedasticity-consistent standard errors.

## Here are some key points:
- **Homoskedasticity** is the consistant variance in the error term. This is one of the Gauss-Markov assumptions. Heteroskedasticity is the opposite of homoskedasticity/
- Heteroskedasticity is a very common problem in social science data. 
- Why we have heteroskedasticity? (1) Aggregation across subunits of differing size or (2) Pooled data across units. For instance, ANES or V-Dem datasets that we use for our assignments and in-class activities have aggregation across subunits of differing size (units: countries). We cannot no longer use OLS as out estimator. Multi-level (hierarchical) modeling would be one potential way to resolve this issues. Another thing we talked about in class was fixed-effects regression to account for unit-level variance. But, remember that fixed-effects models add dummy variable for each unit. Hence, a lot of independent variables in your analysis. 
- Under heteroskedasticity, OLS estimates are unbiased. So, our OLS is BLU but not BLUE. However, standard errors are not unbiased! 
- OLS is no longer BLUE (best linear unbiased estimator) as other linear models may be more efficient. Our standard errors are biased downward (smaller than what they should be larger) than what it should be! Hence, our t-statistics are automatically inflated and will be higher. Hence, our p-value will be lower. Further, if our SEs are biased, our t-statistic, p-values, confidence intervals, etc. will all be unreliable. 
- **This means that if even they are not, our p-values can be statistically significant (which might not be true if corrected).**
- Increasing the sample size decreases your SE, and will guarantee statistically significant results after some threshold (like 10,000 observations).
- Generally, any t-value greater than +2 or less than - 2 is acceptable. The higher the t-value, the greater the confidence we have in the coefficient as a predictor. Low t-values are indications of low reliability of the predictive power of that coefficient. 
- $t-statistics = \frac{\hat{\beta} - \beta_0}{SE(\hat{\beta})}$
- How to detect heteroskedasticity? (1) Visual examination and (2) Breusch-Pagan test. However, there are at least 20 tests out there to test heteroskedasticity. We prefer to use this one. 
- We have 3 band-aid solutions: (1) Weighted Least Squares (WLS), (2) Robust standard errors, and (3) Clustered standard errors. 
- If we know nothing about the source of heteroskedasticity then it is usefult o use robust SEs, but if we know a lot about the source of heteroskedasticity, then WLS or multi-level/hierarchical modeling is the best. In between (moderate knowledge), we can do clustering or fixed-effects.
- We are not post-hoc correcting our SEs with WLS. We do this with theoretical knowledge. 
- Robust SEs are consistant, meaning t-statistic estimates (and F tests) are only asymptotically valid. They are potentially biased in small samples.
- Cross Sectional Time Series (CSTS) or Panel data -- where we observe changes within space and time. Read the following to start with panel data:
  - Beck, N., Katz, J. N., & Tucker, R. (1998). Taking time seriously: Time-series-cross-section analysis with a binary dependent variable. *American Journal of Political Science, 42(4),* 1260-1288.
