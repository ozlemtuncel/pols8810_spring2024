# Week 12: Residuals, outliers, and diagnostics (04/06/2023)
Ozlem Tuncel 

otuncelgurlek1@gsu.edu

> ⚠️ **CAUTION**: DO NOT SOLELY RELY ON MY NOTES. THERE MIGHT BE TYPOS AND MISTAKES. ALWAYS TAKE YOUR NOTES!

✔️ The goal of this week is to understand the leverage, discrepancy, influence, and outliers. 

## Here are some key points from the lecture:
- Outliers, even outside of OLS, will matter for us. 
- **$H$** is a matrix (see slides)
- As t approaches to z as N increases, student's t will converge to z distribution
- Influence is combination of leverage and discrepancy - which shows how unusual that observation is
- Most important two properties of a good estimator: unbiasedness and efficiency
  - Unbiasedness (estimator is right on average) deals with our coefficients 
  - Efficiency deals with the variance 
- Outliers can mess with our estimates
- What do we do with these outliers? First, check your observation for coding mistakes. If you cannot fix it, drop it. If it is not a coding error, then you go back to theory. Not theoretically important, then feel free to drop it (if it is nonrelevant to the theory). And, make sure to add a footnote explaining your decision. 

## Suggestions for this week:
- We talked about bias and efficiency, here is a reminder [visualization of these](https://quantscience.rbind.io/slides/2019mc_slides#16)
