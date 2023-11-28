---
layout: default
---

# Course information

- **Instructor**: Mike Fix <mfix@gsu.edu>

- **Teaching Assistant**: Ozlem Tuncel <otuncelgurlek1@student.gsu.edu>

- **Meeting Time**: Thursday 12:45 pm – 03:15 pm

- **Class Location**: Langdale Hall 1004

# Ozlem's Office Hours and TA Sessions
- My office: Langdale Hall Room 1027
- Office hours: Monday 1-3 pm and Thursday 9-11 am.
- In addition to office hours, I will be conducting lab sessions for three purposes: to answer your software related questions, supplementing class material, questions about problem sets, and help with general methodology matters. If you have any particular subject that you want to discuss in these workshops, please let me know!

# Slides, Notes, and Tips

## Week 1

### Class materials 
> ✔️ Goal: Get familiar with matrix algebra and perform basic matrix algebra operations.

[Week 1 Slides](docs/01Matrix.pdf)

[Ozlem's notes from Week 1 class](docs/week1.md)

### Software and others
> ✔️ Goal 1: Participate in Josh's R sessions to learn more about base R.

> ✔️ Goal 2: Get familiar with LaTeX to typeset your problem sets.

> ⚠️ Josh's workshops are not mandatory, but I highly recommend them! 

**Learning LaTeX**
I encourage all of you to get familiar with **LaTeX** or similar kind of document preparation system to typset your problem sets. GSU offers online/in-person LaTeX course. I use Overleaf for typetting these sort of documents. Recently, I have been using Quarto in R and Phyton to typeset reports and presentations. Here are some useful links to learn LaTeX:

- GSU Library's [LaTeX workshop](https://research.library.gsu.edu/latex)
- Visit Dr. Fix's [website](http://michaelfix.gsucreate.org/) for his LaTeX presentations.
- Overleaf's [30-minute guide](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes)
- Overleaf's detailed [3-part guide](https://www.overleaf.com/learn/latex/Free_online_introduction_to_LaTeX_(part_1))

You can alternatively learn and use **R Markdown** or **Quarto**. Here are some useful links:

- [Using Quarto in R](https://quarto.org/docs/get-started/hello/rstudio.html)
- Posit's (previously known as R Studio) guide to [R Markdown](https://rmarkdown.rstudio.com/lesson-1.html)

## Week 2

### Class materials 
> ✔️ Goal: Get familiar with the basics of probability and distribution.

[Week 2 Slides](docs/02Probability.pdf)

[Ozlem's notes from Week 2 class](docs/week2.md)

### Software and others 
> No update here! I highly recommend Josh's R workshops. 

## Week 3

> ✔️ Goal: Get familiar with the basics of descriptive stats and representing your data visually.

[Week 3 Slides](docs/03Data.pdf)

[Ozlem's notes from Week 3 class](docs/week3.md)

[R script that I used to create input for this week's slide](docs/week3.R) & [V-Dem dataset for the R script](https://drive.google.com/file/d/1IRS2gnECAuELEcG-CZOy1lO0lCys91up/view?usp=sharing)

❗[The slides for Josh's workshop are here](docs/field-guide-to-base-r.pdf). ❗

**Suggestions for descriptive stats (and other things)**
For basic descriptive stats and understanding your data, base R is more than enough! So, do not bother with tidy language (which can be overkill sometimes). Here are some further suggestions and examples: 

- [Great summary of basic descriptive stats in R](https://statsandr.com/blog/descriptive-statistics-in-r/)
- [Exploratory Data Analysis (EDA) Intro from Hadley Wickham](https://r4ds.had.co.nz/exploratory-data-analysis.html) - I recommend this book for learning R. [Hadley](https://twitter.com/hadleywickham) is the one who created the whole tidyverse universe, so he knows what he is doing. 👍
- [Another EDA vignette](https://cran.r-project.org/web/packages/dlookr/vignettes/EDA.html) - This is going to be extremely useful with Gauss-Markov assumptions. 
- [Want to learn more about R and how it works under the hood (all base R)? Read this!](https://adv-r.hadley.nz/) - This is my go-to book to R (again Hadley wrote this). ⭐
- [All the possible things you can do with ggplot2](https://r-graph-gallery.com/ggplot2-package.html) - Of course, this is not the complete list. There is always going to be one specific thing that needs additional package (e.g., I was trying to do cluster dendongrams which does not exist in ggplot2 but exists as [ggdendro](https://cran.r-project.org/web/packages/ggdendro/vignettes/ggdendro.html). So, google it if you are not sure!). 
- [For those who want to learn GitHub - here is how I learned](https://happygitwithr.com/) - Git might be a bit of advance at this point, but it is essential part of every project that I do. So, version control everything (future you will be super happy) and I like how GitHub can be easy. Feel free to ask if you have any questions about version control and Git!

**Josh's suggestions and slides from R Workshops** ⭐
- For graphing in ggplot and design decisions Josh highly recommends [Cederic Scherer's Graphic Design with ggplot2](https://rstudio-conf-2022.github.io/ggplot2-graphic-design/), [Cederic Scherer's talks more generally](https://www.cedricscherer.com/top/portfolio/), and [Andrew Heiss's Data Visualization class](https://datavizs21.classes.andrewheiss.com/)
- To make good tables in R with minimal effort Josh recommends [modelsummary](https://vincentarelbundock.github.io/modelsummary/index.html).

## Week 4

> ✔️ Goal: Get familiar with the basics of bivariate OLS.

[Week 4 Slides](docs/04Bivariate.pdf)

[Ozlem's notes from Week 4 class](docs/week4.md)

[R script that I used to create input for week 4 slide](docs/week4.R) & [V-Dem dataset for the R script](https://drive.google.com/file/d/1IRS2gnECAuELEcG-CZOy1lO0lCys91up/view?usp=sharing)

**Suggestions for descriptive stats (and other things)**
- Want to construct your own OLS estimator, [here is how](https://economictheoryblog.com/2016/02/20/rebuild-ols-estimator-manually-in-r/). 🥊
- Learn more about `stargazer` packager, [here is a great source](https://fgeerolf.com/code/R/stargazer.html#Stargazer_options) ⭐

## Week 5

> ✔️ Goal: Get familiar with variance, covariance, and Gauss-Markov theorem.

[Week 5 Slides](docs/05Inference.pdf)

[Ozlem's notes from Week 5 class](docs/week5.md)

[R script that I used to create input for week 5 slide](docs/week5.R) & [V-Dem dataset for the R script](https://drive.google.com/file/d/1IRS2gnECAuELEcG-CZOy1lO0lCys91up/view?usp=sharing)

**Suggestions for matrix notation and residuals**
- Here is a great overview of [matrix notation for OLS regression](https://www.css.cornell.edu/faculty/dgr2/_static/files/R_html/explainRegression.html)

## Week 6

> ✔️ Goal: Get familiar with multiple regression, testing for Gauss-Markov assumptions, and standardized coefficients.

[Week 6 Slides](docs/06MultipleReg.pdf)

[Ozlem's notes from Week 6 class](docs/week6.md)

[R script that I used to create input for week 6 slide](docs/week6.R) & [V-Dem dataset for the R script](https://drive.google.com/file/d/1IRS2gnECAuELEcG-CZOy1lO0lCys91up/view?usp=sharing)

**Suggestions for week 6 materials**
- If you want to learn more about dot-and-whisker plots, [see here](https://felixhaass.github.io/dataviz_ggplot2/session4.html).
- Further, explanation of linearity in parameters, [see here](https://mgkim.blog/2017/06/19/linearity-in-parameters/)
- I prefer to visualize OLS using 3-dimensional space. So, this is a great source for that. [See here](https://kaomorphism.com/socraticregression/space.html)
- Read Gelman (2008) for standardizing by 2sd - [see here](http://www.stat.columbia.edu/~gelman/research/unpublished/standardizing.pdf)

## Week 7

> ✔️ Goal: Understanding binary predictors, nonlinearity, and data transformations.

[Week 7 Slides](docs/07Dummy.pdf)

[Ozlem's notes from Week 7 class](docs/week7.md)

[R script that I used to create input for week 7 slide](docs/week7.R) & [V-Dem dataset for the R script](https://drive.google.com/file/d/1IRS2gnECAuELEcG-CZOy1lO0lCys91up/view?usp=sharing)

**Suggestions for week 7 material**
- Most of you are having difficulty with taking notes in your replication files. [Here is a great source on how to outline your scripts.](https://posit.co/blog/rstudio-v1-4-preview-little-things/)
- There are several packages out there to help with OLS diagnostics: [performance](https://easystats.github.io/performance/index.html), [olsrr](https://cran.r-project.org/web/packages/olsrr/vignettes/intro.html), and [gvlma](https://cran.r-project.org/web/packages/olsrr/vignettes/intro.html).

## Week 8

> ✔️ Goal: Understanding the use and interpretation of interaction terms. 

[Week 8 Slides](docs/08Interaction.pdf)

[Josh's Slides](docs/interactions.html)

[Ozlem's notes from Week 8 class](docs/week8.md)

[R script that I used to create input for week 8 slide](docs/week8.R) & [V-Dem dataset for the R script](https://drive.google.com/file/d/1IRS2gnECAuELEcG-CZOy1lO0lCys91up/view?usp=sharing)

**Suggestions for week 8 material**
- Check `ggeffects` [package](https://strengejacke.github.io/ggeffects/) in detail. I recommend starting with this [vignette](https://strengejacke.github.io/ggeffects/articles/ggeffects.html).
-  Check `margins` package in detail. I recommend starting with this [vignette](https://cran.r-project.org/web/packages/margins/vignettes/Introduction.html).
- One alternative to `ggeffects` that I like to use: `sjPlot` and `sjmisc`. Read more about these packages [here](https://cran.r-project.org/web/packages/sjPlot/vignettes/plot_interactions.html). Another alternative is `interactions` package, read more [here](https://interactions.jacob-long.com/articles/interactions.html).
- Read more about interactions in [here](https://www.econometrics-with-r.org/8-3-interactions-between-independent-variables.html).
- Read more about different types of interactions [here](https://stats.oarc.ucla.edu/r/seminars/interactions-r/#s4).
- Some of you asked about three-way and other type of interactions in the office hours. As I said, interactions consume a lot of your [statistical power. Here is a great explanation of why interactions are tricky.](https://statmodeling.stat.columbia.edu/2018/03/15/need-16-times-sample-size-estimate-interaction-estimate-main-effect/) 

## Week 9

> ✔️ Goal: Deeper dive on the heteroskedasticity issue and exploring heteroskedasticity-consistent solutions. 

[Week 9 Slides](docs/09Variance.pdf)

[Ozlem's notes from Week 9 class](docs/week9.md)

[Dr. Fix's guide for dealing with heteroskedasticity](docs/heteroskedasticity.pdf)

[R script that I used to create input for week 9 slide](docs/week9.R) & [V-Dem dataset for the R script](https://drive.google.com/file/d/1IRS2gnECAuELEcG-CZOy1lO0lCys91up/view?usp=sharing)

**Substantive Interpretation Guides**

I have realized that many of you are having difficulty with substantive interpretation of your regression results. This is normal (for now)! This is an important skill to learn, but it is one of the most challenging parts of learning methods. So, here are few key points and sources that might help you out! 

- ⚠️ The fact that an estimated regression coefficient is **statistically significant** (i.e., you can reject the null hypothesis that the true β is 0 with a high level of confidence) *does not mean that your independent variable is substantively important!* What does this mean? You might have statistically significant relationship that supports your alternative hypothesis, but we mostly care about "So what?" question.❗What does this relationship tell us? Hence, substantive interpretation matters!
- For instance, let's say we modelled the impact of video gaming (in hours) on reading time (in hours). We found that the estimated coefficient on gaming time is quite small ($\beta$ = -0.04; s.e. = 0.01) and statistically significant (p < 0.01). The coefficient translates to a reduction of about two minutes (0.04 of 60 minutes - 1 hr - is around 2.4) in reading time for each hour spent video gaming. Although the estimated coefficient is statistically significant, it is so small that it isn't very substantively meaningful. In other words, that finding suggests that banning video game playing would not be a very effective way to increase reading time by a meaningful amount, even if the association between gaming time and reading time is statistically significant as it only leads to 2 minute reduction for the sample we are using.

You might ask, "Ozlem, how am I suppose to develop my interpretation skills?" A simple answer: **Read analysis section of journal articles and books in detail. Best way to learn this skill is by imitating what people wrote.**

- [Here is a great source to learn more about statistical significance and substantive interpretation](http://www.statlit.org/pdf/2008MillerASA.pdf)..
- [Here is a great guide on interpretation in which we see how interpretation differs depending on the variable type](https://semrasevi342192471.files.wordpress.com/2021/01/guide-to-interpreting-regression-tables.pdf). 
- [Here is a published research in APSR that uses OLS! (yes it is possible to publish with OLS in a top journal!)](https://www.cambridge.org/core/journals/american-political-science-review/article/different-paths-to-the-modern-state-in-europe-the-interaction-between-warfare-economic-structure-and-political-regime/81A71D2950D41552F5FB69FF71917AD6)
- [Here is a published research in Party Politics that uses OLS! This one is less complex compared to the APSR one](https://journals.sagepub.com/doi/pdf/10.1177/1354068819836047). 
  - Carefully read the variable description and see how we refer to our variables in real life.
  - See how descriptive statistics plays a role prior to the analysis results. 
  - See how results are interpreted substantively!

**Suggestions for week 9 material**
- For future projects, read `sandwich` package in [CRAN carefully.](https://cran.r-project.org/web/packages/sandwich/index.html) 
- We talked about unbiased estimates with heteroskedasticity. See [this Stackoverflow discussion](https://stats.stackexchange.com/questions/16381/what-is-a-complete-list-of-the-usual-assumptions-for-linear-regression) to understand how violating Gauss-Markov assumptions influence efficiency, bias, and consistency. 
- [Quick summary of z-score and t-score](https://www.statisticshowto.com/probability-and-statistics/hypothesis-testing/t-score-vs-z-score/).
- 

## Week 10

> 🌞Spring Break

In case you are having difficulty with interpreting interaction terms, I suggest reading some articles that uses interactions. I have two recommendations: 

- This [Golder (2006) article](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E20B729DB038D7C920215319A2B1A094/S0007123406000123b.pdf/pre-electoral-coalition-formation-in-parliamentary-democracies.pdf). Golder does a great job of interpreting the two-way interactions in her model. Here, she uses marginal effect plots to provide substantive interpretation. Also, we have Brambor, Clark, and Golder (2006) article in the syllabus on interactions - a must read!
- This [Kertzer et al. (2020) article](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/931AC830FEB7D24D26800E22558D9F9D/S0020818319000328a.pdf/price_of_peace_motivated_reasoning_and_costly_signaling_in_international_relations.pdf) uses three-way interaction term - which is something rare in political science. Here, they use marginal effect plots. If you check their appendix, you will find predicted probability plots as well.

In these articles, you will see 3 things:

- We use interactions because our theory tells us to use it!
- **We never interpret the coefficent of the interaction term and one or both constitutive terms.** This is true for OLS and every other estimator out there. We talked about this in the class and did proofs as well. We care about whether they are significant or not. But, overall, interpretation purposes we need more than statistical significance.
- **If the interaction is significant, we should use predicted plots and marginal effect plots to make substantive interpretation!**

## Week 11 

> ✔️ Goal: Deeper dive on the perfect multicollinearity issue and exploring possible solutions. 

[Week 11 Slides](docs/10Collinearity.pdf)

[Ozlem's notes from Week 11 class](docs/week11.md)

[R script that I used to create input for week 11 slide](docs/week11.R) & [V-Dem dataset for the R script](https://drive.google.com/file/d/1IRS2gnECAuELEcG-CZOy1lO0lCys91up/view?usp=sharing)

**Suggestions for week 11 material**
- Here is a simple guide if you want to learn how to use [ridge regression in R](https://www.r-bloggers.com/2020/05/simple-guide-to-ridge-regression-in-r/).
- Here is a simple guide if you want to learn how to use [lasso regression in R](https://www.statology.org/lasso-regression-in-r/). 
- Here is a [great guide](http://web.vu.lt/mif/a.buteikis/wp-content/uploads/PE_Book/4-5-Multiple-collinearity.html) on multicollinearity. It is a bit math and code intense, but I recommend checking it. 
- If you are using log transformation in your final paper, make sure to interpret coefficients appropriately. Variable transformations change how we interpet stuff. [Here is a great source on log transformation.](http://svmiller.com/blog/2023/01/what-log-variables-do-for-your-ols-model/)
- Some of you are having problems with shading and colors in ``ggplot``. Hint on this: check `color` and `alpha` options. Here is a [short guide](https://ggplot2.tidyverse.org/reference/aes_colour_fill_alpha.html#:~:text=Values%20of%20alpha%20range%20from,AA%20refers%20to%20transparency%20values.). 
 
## Week 12

> ✔️ Goal: Get a better sense of our residuals and use them for influential points and outliers. 

[Week 12 Slides](docs/11Outliers.pdf)

[Ozlem's notes from Week 12 class](docs/week12.md)

[R script that I used to create input for week 12 slide](docs/week12.R) & [V-Dem dataset for the R script](https://drive.google.com/file/d/1IRS2gnECAuELEcG-CZOy1lO0lCys91up/view?usp=sharing)

**Suggestions for week 12 material**
- If you want to see some examples of outliers and high leverage points, here is an [example 1](https://www.maths.usyd.edu.au/u/UG/SM/STAT3022/r/current/Lecture/lecture08_2020JC.html#1) and [example 2](https://aboomsma.webhosting.rug.nl/apstatdata/Regrdiag_R.pdf).
- Here is a [real life example where scholars drop observations](https://www.cambridge.org/core/journals/british-journal-of-political-science/article/electoral-systems-district-magnitude-and-corruption/8258AEE220BB599E092E390AADCBC482). And, here is [a research note explaining what dropping observations would do](https://whanchoi.people.uic.edu/The-Effect-of-Outliers-on-Regression-Analysis.pdf).

## Week 13

> ✔️ Goal: A short introduction to GLM world which will help you with next semester's course.

[Week 13 Slides](docs/12GLM.pdf)

[Ozlem's notes from Week 13 class](docs/week13.md)

[R script that I used to create input for week 13 slide](docs/week13.R) & [V-Dem dataset for the R script](https://drive.google.com/file/d/1IRS2gnECAuELEcG-CZOy1lO0lCys91up/view?usp=sharing)
