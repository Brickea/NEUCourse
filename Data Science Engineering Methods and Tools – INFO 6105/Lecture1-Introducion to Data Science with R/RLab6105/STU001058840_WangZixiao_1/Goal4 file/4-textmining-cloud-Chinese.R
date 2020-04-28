## Wordcloud in Chinese
## Author: Wang Zixiao
## Date: 20190911

library(usethis)
library(devtools) # Segmentation in Chinese
install_github("lijian13/rinds")
library(rinds) # Use SogouCS08 as test text，which is contained in rinds
library(rJava) # Rwordseg dependent on rJava
library(Rwordseg) # Chinese word library Rwordseg
library(tmcn) # Chinese word mining library
library(RColorBrewer)
library(wordcloud)

# use SogouCS08 as test text
data("SogouCS08")
text1<-SogouCS08$Content
text1[1]

# ===============================================
# Part1 Word Segmentation in Chinese Text
# ===============================================

d.vec1<-segmentCN(text1,returnType = "vec")

# ===============================================
# Part2 calculate the frequency of words
# ===============================================

wc1<-createWordFreq(unlist(d.vec1),onlyCN=TRUE)

# ===============================================
# Part3 Plot the wordcloud
# ===============================================
par(family='STKaiti')
wordcloud(wc1$word,wc1$freq,min.freq=500,col=rainbow(length(wc1$freq)))
