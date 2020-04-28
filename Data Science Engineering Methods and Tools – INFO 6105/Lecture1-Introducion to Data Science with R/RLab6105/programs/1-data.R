## Part 1: Data Manipulation in R

## ============================================================================
## INTRO
## ============================================================================

## Introduction to data manipulation
## * using base R functions
## * using intuitive, fast methods from `dplyr`

## References
##
## James et al, p. 47
## `> vignette("introduction", "dplyr")`
##
## Data wrangling handout:
## http://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf



## ============================================================================
## Read in data
## ============================================================================

## see ../data/README.txt
college <- read.csv("../data/College.csv")

## overview of dataset
head(college)
dim(college)
summary(college)


names(college)
str(college)


## select a manageable dataset for the following exercises
df <- college[270:299,]
summary(df)



## ============================================================================
## BASE R
## ============================================================================

## subset data
private <- df[df$Private=="Yes",]
private <- subset(df,Private=="Yes")

private

## select columns
df2 <- df[,c("X","Private")]

df2

## order data
df3 <- df[order(df$Private),]

df3






## ============================================================================
## DPLYR: another tool for data manipulation
## ============================================================================

library(dplyr)

## overview of `dplyr` is here:
vignette("introduction", "dplyr")



## DPLYR: EASY AND FAST


## Single table verbs

## dplyr aims to provide a function for each basic verb of data manipulating:
## (1) filter() (and slice())
## (2) arrange()
## (3) select() (and rename())
## (4) distinct()
## (5) mutate() (and transmute())
## (6) summarise()
## sample_n() and sample_frac()
## (If you’ve used plyr before, many of these will be familar.)



glimpse(college)
glimpse(df)
summary(df)


## (1) "filter rows with filter()"
## first parameter is the data frame, then the conditions
filter(df, Private=="Yes")
filter(df, Private=="Yes" & Grad.Rate > 70)
filter(df, Private=="Yes" & Grad.Rate >= 70)



## (2) "select columns with select()"
## first parameter is the data frame, the remaining are column names
select(df, X, Private, S.F.Ratio, Grad.Rate, Top10perc)




## (3) "arrange rows with arrange()"
## first parameter is the data frame
arrange(df, Private)
arrange(df, desc(Private))

## EXERCISE
## obtain this data view from "df":

##                              X Grad.Rate
## 1     James Madison University        98
## 2       Incarnate Word College        95
## 3     Johns Hopkins University        90
## 4      John Carroll University        89
## 5               Kenyon College        88
## 6               King's College        87
## 7          La Salle University        84
## 8 Illinois Wesleyan University        83
## 9              Juniata College        80


## [your code here]




## (4) "extract distinct (unique) rows"
select(df, S.F.Ratio)

distinct(select(df, S.F.Ratio))

dim(distinct(select(df, Agency.Name)))



## (5) "add new columns with mutate()"
head(df)

mutate(df, cost=Personal+Books)

dfx <- select(df,Personal,Books)
dfx <- mutate(dfx, cost=Personal+Books)
dfx



## (6) "summarise values with summarise()" [minimizes output]
## summarise() "reduces" the size of the output
summarise(df, books=sum(Books))
summarise(df, mean.tuition=mean(Outstate))

## summarise() is really powerful when working in groups
dfx <- group_by(df, Private)
dfx <- summarise(dfx, mean.tuition=mean(Outstate))
dfx


dfx <- group_by(df, Private)
dfx <- summarise(dfx, mean.books=mean(Books))
dfx

dfx <- group_by(df, Private)
dfx <- summarise(dfx, count=n())
dfx

## EXERCISE
## find max and min tuition ("Outstate") grouped by private/public
## school, in dataset 'df' and 'college'

## DF:
##
##   Private   max  min
## 1      No  9766 3946
## 2     Yes 19240 6398

## college:
##
##   Private   max  min
## 1      No 15732 2580
## 2     Yes 21700 2340


## [your code here]


dfSelf <- group_by(df,Private)

dfSelf <- summarise(dfSelf, max = max(Outstate),min = min(Outstate))

print("df")

dfSelf

collegeSelf <- group_by(college,Private)

collegeSelf <- summarise(collegeSelf, max = max(Outstate),min = min(Outstate))

print("college")

collegeSelf




## ============================================================================
## FOR MORE
## ============================================================================

## see the Data Wrangling handout
## http://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf



