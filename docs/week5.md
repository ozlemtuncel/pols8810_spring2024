# Week 5: Inference and Introduction to Gauss-Markov Theorem (02/09/2023)
Ozlem Tuncel 

otuncelgurlek1@gsu.edu

> ⚠️ **CAUTION**: DO NOT SOLELY RELY ON MY NOTES. THERE MIGHT BE TYPOS AND MISTAKES. ALWAYS TAKE YOUR NOTES!

✔️ The goal of this week is to learn matrix notation for OLS regression and get familiar with Gauss-Markov theorem. 

## Here are some key points:
- This is a math heavy week so prepare yourself. For this week, we are mostly interested in Gauss-Markov theorem, and we will go into details of assumptions next week. For this week, we have to blindly make some assumptions. 
- Our estimators $\hat{\beta_0}$ and $\hat{\beta_1}$ are random variables.
- Conflict data example: you have the whole population in Correlates of War (you know every conflict out there) and why you are using inferential statistics given that you have the question? Quick answer: parallel universe argument. Confused? [see here](https://dornsife.usc.edu/assets/sites/298/docs/Graham_IR_211_Lecture_13_-_Art_of_Causal_Inference_2.pdf) and [here](https://medium.com/@ishi.sohani/prooving-the-parallel-universe-with-some-statistics-and-probability-5542b1a2bd64).
- Goal of the applied social science: eplain some outcome with some set of variables. Can we really do that? NO. Humans are inpredictable. That's why things that we cannot explain systematically goes into the error term. 
- Alone, point estimates are useless. That's why we are mostly interested in the **variance**. We hope $E(\bar{x}) = \mu$. Thus, we are mostly interested in the precision of our estimates - this helps us to make meaningful inferences. 
- Gauss-Markov Theorem is the most important thing for this class - we understand when we can use OLS regression and cannot use it. 
- Key assumptions we make:
  - X is fixed (we will explain this later)
  - Y has both systematic and random variation (randomness goes into the error term, and we assume error terms is i.i.d and normally distributed).
  - i.i.d. = independently and identically distributed
  - $u_i \sim i.i.d. N(0, \sigma^2)$
  - $Var(Y|X\beta) = \sigma^2$ - stochastic (random) variation in Y
- Remember that $\sigma^2$ is population standard deviation
- Simply having more variation in our independent variable is going to lead to larger variation in our estimators. 
- Z score is the estimate divided by the standard error => higher z score, low p-value 
- If you have enough number of observations, you will get statistical significance. So, small number of sample size is bad, high number of sample size is meaningless.
- Best means minimum variance among other estimators 

## Some suggestions:
- Here is an [exploratory regression shiny application](https://cran.r-project.org/web/packages/ERSA/vignettes/ERSA.html)
- More sources on $y$, $\hat{y}$, and residuals: [source 1](https://condor.depaul.edu/sjost/it223/documents/regress.htm), [source 2](https://www.r-bloggers.com/2018/04/y-is-for-ys-y-hats-and-residuals/), [source 3](https://web.stanford.edu/~mrosenfe/soc_meth_proj3/matrix_OLS_NYU_notes.pdf), [source 4](http://www.unm.edu/~jikaczmarski/working_papers/gm_proof.pdf)
- [Central Limit Theorem simulator](https://saskiaotto.de/shiny/clt/)
