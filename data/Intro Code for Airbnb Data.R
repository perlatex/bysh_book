```{r}
library(dplyr)
library(stringr)
library(mosaic)
library(ggplot2)
library(pscl)
library(broom)
library(AER)
library(stargazer)
```

```{r}
Sydney <- SYDNEY.2.W.DATES <- read.csv("~/Project Data/SYDNEY 2 W DATES.csv")
London <- read.csv("~/Project Data/LONDON 2 W DATES.csv")
NYC <- read.csv("~/Project Data/NYC 2 W DATES.csv")

#Deleting Unnecessary Columns
Sydney$reviews_per_month<- NULL
London$reviews_per_month<- NULL
NYC$reviews_per_month<- NULL

#Adding necessary columns for indicator variables
Sydney$NYC <- NA
Sydney$London <- NA

London$NYC <- NA
London$Sydney <- NA

NYC$London <- NA
NYC$Sydney <- NA

totaljk <- rbind(Sydney, NYC)

total <- rbind(totaljk,London)

#Replacing NA with 0 for indicator variables
total[is.na(total)] <- 0