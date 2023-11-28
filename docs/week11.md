# Week 11: Collinearity (03/23/2023)
Ozlem Tuncel 

otuncelgurlek1@gsu.edu

> ⚠️ **CAUTION**: DO NOT SOLELY RELY ON MY NOTES. THERE MIGHT BE TYPOS AND MISTAKES. ALWAYS TAKE YOUR NOTES!

✔️ The goal of this week is understanding multicollinearity issue in depth. 

## You will be doing peer-review this week. So, here is how to hone your peer-review skills:
- Around 1.5 page, and nothing less or more is not helpful. 
- Introduction should be a one paragraph of brief summary of the manuscript, and your overall comment about the contribution.
- Main body should be about main criticisms. 3 is the ideal number of major concerns. Spend a paragraph on each. If it is an obvious mistake, do not explain why. But if that is not a obvious one, make sure to include an explanation. Pair your criticism with a suggestion. 
- End with minor points with bullet points. Major typos, formatting issues, aesthetics ... are some of the examples of minor issues. 
  
 ## Here are some key points from the lecture:
 - Perfect multicollinearity deals with **$X$**. We assume that X is full rank, **$N>k$**, and sufficient variability in **$X$**. 
 - If our coefficients add up to zero - this is perfect multicollinearity. 
 - Theoretically, this is a major problem. In real life, it is not because R will not produce results for the variable causing this error. 
 - You need more observations than your number of variables. This is problematic theoretically and practically because R will produce `NaN`. 
 - Colinearity is really easy to diagnose with Pearson's R. But, multicollinearity is tricky because it can exist even with relatively low pairwise correlation.
 - Multicollinearity is sample problem. 

## Here is the article suggestion on variable selection (ART):
- Achen, C. H. (2002). Toward a new political methodology: Microfoundations and ART. *Annual Review of Political Science*, 5(1), 423-450.
