---
title: "词云可视化方法"
output:
  html_document: default
  word_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

文本挖掘是数据挖掘的重要应用之一，其基本任务是计算文本中各个词的词频，并利用词频反映文本的核心内容。若已获得了文本中各个词以及它们的词频数据，则可利用词云来可视化词频。也就是说，词云可以显示特定的文本集中各个词出现的频率，进而可以快速的了解文本主题及关键词。

我们首先安装本节课需要的R包：install.packages(c(“wordcloud”, “tm”,“devtools”,“rinds”,“rJava”,“Rwordseg”,“tmcn”,“wordcloud2”)。

英文单词云实现起来相对比较简单，我们以文本数据crude为例说明如何给出单词云，首先需要调用wordcloud和tm包：
```{r}
library(wordcloud)
library(tm)
```

```{r}
data(crude)
```

```{r}
crude <- tm_map(crude, removePunctuation)  # 去除标点符号
```

```{r}
crude <- tm_map(crude, function(x)removeWords(x,stopwords()))  # 去除stopword
```

```{r}
tdm <- TermDocumentMatrix(crude) # 词频矩阵
```
class(tdm)
inspect(tdm[1:10,1:3])
as.matrix(tdm)[1:10,1:3]
```{r}
m <- as.matrix(tdm) 
```

```{r}
v <- sort(rowSums(m),decreasing=TRUE)
```

```{r}
d <- data.frame(word = names(v),freq=v)
```

Wordcloud函数的基本格式是：wordcloud(words=词向量,freq=词频向量,min.freq=n,max.words=m,random.order=TRUE/FALSE)。其中，参数words用于存放词的向量；freq指定相应的词频向量；参数min.freq表示词频小于n的词将不出现在词云图中；参数max.words表示仅词向量中的前m个词出现在词云图中，后面的词将不出现，有些高频词将被忽略；random.order取TRUE表示随机画词云，取FALSE表示按词频降序，先画高词频的词，后画低词频的词，通常词频高的词出现在词云图的中部位置。

```{r}
wordcloud(d$word,d$freq,random.order=FALSE, colors=brewer.pal(8, "Dark2"))
```

对于中文词云，若已知词频，

```{r}
library("wordcloud")
```

library(readr)
guess_encoding('/Users/johnsonwang/Downloads/R语言可视化/data/词频示例.csv')
```{r}
wordFreq<-read.csv('/Users/johnsonwang/Downloads/R语言可视化/data/词频示例.csv',header=TRUE,sep=',',fileEncoding='GB18030') # 读取词频数据
```

```{r}
head(wordFreq[order(wordFreq$Freq,decreasing=TRUE),])   #浏览词频最高的前6个词
```

```{r}
set.seed(123)    #设置随机数种子
```

```{r}
par(family='STKaiti')
wordcloud(words=wordFreq$Word,freq=wordFreq$Freq,random.order=FALSE,min.freq=20)  #绘制词云图
```

若不知中文词频，需要先对中文文本进行分词，为此，需要安装并调用新的包：
```{r}
library(devtools)
```

我们将用SogouCS08作为测试文本，它包含在rinds包中，因此需先安装该包：install_github("lijian13/rinds")，并调用

```{r}
library(rinds)
```

我们还需要安装中文分词包Rwordseg和中文文本挖掘包tmcn，为此，先安装并调用rJava包：

```{r}
library(rJava) # Rwordseg包要调用它
```

从下面网址下载中文分词包Rwordseg：https://r-forge.r-project.org/R/?group_id=1054

```{r}
library(Rwordseg)
```

从下面网址下载中文文本挖掘包tmcn：https://r-forge.r-project.org/R/?group_id=1571

```{r}
library(tmcn)
```

```{r}
library(wordcloud)
```

我们以数据SogouCS08为例，

```{r}
data("SogouCS08")
text1<-SogouCS08$Content
text1[1]
```

首先对中文文本分词，

```{r}
d.vec1<-segmentCN(text1,returnType = "vec")
```

之后计算词频

```{r}
wc1<-createWordFreq(unlist(d.vec1),onlyCN=TRUE)
```

最后给出词云

```{r}
par(family='STKaiti')
wordcloud(wc1$word,wc1$freq,min.freq=500,col=rainbow(length(wc1$freq)))
wordcloud2(wc1,size=0.7)
```

一个更好的词云可视化方法是用wordcloud2包，它可以生成交互式的词云：

```{r}
library(wordcloud) 
library(wordcloud2) 
#wordcloud(demoFreq$word, demoFreq$freq) 
wordcloud2(demoFreq,size=0.5,shape='diamond')
```

