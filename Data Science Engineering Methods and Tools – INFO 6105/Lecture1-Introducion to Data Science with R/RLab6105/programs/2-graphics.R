## Part 2: graphics in R, using ggplot2

## ============================================================================
## INTRO
## ============================================================================


## Hands-on introductions to creating graphics in R
## * using base R methods
## * using the very popular `ggplot2` package

## References:
## James et al, p 45, 49
## http://docs.ggplot2.org/current/




## ============================================================================
## BASE R
## ============================================================================

plot(college$S.F.Ratio, college$Grad.Rate)
title("College graduation rate vs. Student-faculty ratio")

hist(college$Grad.Rate)
hist(college$S.F.Ratio)


s1 <- college[,c(16:19)]
pairs(s1)



## ============================================================================
## ggplot2: another tool for R graphics
## ============================================================================

## "ggplot2 is designed to work in a layered fashion, starting with a
## layer showing the raw data then adding layers of annotation and
## statistical summaries."

## examples: ../docs/ggplot2-samples.pdf


library(ggplot2)
college <- read.csv("../data/College.csv")

## BASIC PLOTS

## ggplot2:
qplot(college$S.F.Ratio, college$Grad.Rate)
qplot(S.F.Ratio, Grad.Rate, data = college)

qplot(S.F.Ratio, Grad.Rate, data = college, colour=Private)

## add layers with "+"
qplot(S.F.Ratio, Grad.Rate, data = college, colour=Private) +
    ggtitle("College graduation rate vs. Student-faculty ratio")


## histograms are univariate: one variable required
qplot(Grad.Rate, data = college, geom="histogram")
qplot(Grad.Rate, data = college, geom="histogram", binwidth = 2)


## USING ggplot() function and CUSTOMIZING PLOTS
## aes = aesthetics
p <- ggplot(college, aes(x=S.F.Ratio, y=Grad.Rate))

p + geom_point()
p + geom_point(aes(colour = Private))
##p + geom_point(colour = Private) 
p + geom_point(colour = "green")


## nice palette
p + geom_point(aes(colour = Private)) + scale_color_brewer()

p + geom_point(aes(colour = Private)) +
    scale_color_brewer(type="qual", palette=2)

## variations on histogram
ggplot(college) +
    geom_histogram(aes(x=S.F.Ratio))

p <- ggplot(college, aes(x=S.F.Ratio))

p + geom_histogram()
p + stat_bin(geom="area")
p + stat_bin(geom="point")
p + stat_bin(geom="line")


## OVERLAYS
## The box plot (a.k.a. box and whisker diagram) is a standardized way of displaying the distribution of 
## data based on the five number summary: minimum, first quartile, median, third quartile, and maximum.
## http://www.physics.csbsju.edu/stats/box2.html
qplot(Private, Grad.Rate, data = college)
qplot(Private, Grad.Rate, data = college, geom="jitter")
qplot(Private, Grad.Rate, data = college, geom=c("jitter", "boxplot"))
qplot(Private, Grad.Rate, data = college, geom=c("boxplot", "jitter"))

p <- ggplot(college, aes(x=Private, y=Grad.Rate))

## documentation example: http://docs.ggplot2.org/current/geom_boxplot.html
p + geom_point()
p + geom_boxplot() + geom_jitter()
p + geom_boxplot() + geom_jitter() + coord_flip()
p + geom_boxplot(notch = TRUE, notchwidth = .5) +
    geom_jitter(colour="sienna1")

## modifying theme
theme_set(theme_bw())
## theme_set(theme_gray())
p + geom_boxplot(notch = TRUE, notchwidth = .5) +
    geom_jitter(colour="sienna1")


## 'FACETS'
library(dplyr)                          #for next line:
college$Top10quartile <- ntile(college$Top10perc, 4)

p <- ggplot(college, aes(x=S.F.Ratio, y=Grad.Rate)) + geom_point()
p

p + facet_grid(. ~ Top10quartile)

## an outlier affects the visuals. have a good reason for removing it,
## and document it
college2 <- college[college$S.F.Ratio<39,]

## tip: don't need to iterate too much
ggplot(college2, aes(x=S.F.Ratio, y=Grad.Rate)) + geom_boxplot() +
    geom_point() + facet_grid(. ~ Top10quartile) +
    ggtitle("Graduation Rate vs. Student-Faculty Ratio, by Top 10 Quartiles")

## vs.
p <- ggplot(college2, aes(x=S.F.Ratio, y=Grad.Rate))
p <- p + geom_boxplot()
p <- p + geom_point()
p <- p + facet_grid(. ~ Top10quartile)
p <- p + ggtitle("Graduation Rate vs. Student-Faculty Ratio, by Top 10 Quartiles")


## Questions?
