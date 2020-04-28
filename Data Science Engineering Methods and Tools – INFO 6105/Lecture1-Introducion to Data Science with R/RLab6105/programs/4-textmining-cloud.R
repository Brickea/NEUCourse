## Part 4: basic text mining using tm package, and a slew of other nifty ones..

## ============================================================================
## BASIC TEXT MINING
## =======================================================================?====


## If it works, adapted by dino from code in https://sites.google.com/site/miisqda/?pli=1
## Otherwise i have no idea who wrote this!

## bnary packages:
Needed <- c("tm", "SnowballCC", "RColorBrewer", "ggplot2", "wordcloud", "biclust", "cluster", "?graph", "fpc")
install.packages(Needed, dependencies=TRUE)

## If you get the following message:
##Update all/some/none? [a/s/n]:
##  enter "a" and press return

## You downloaded source and binary packages will probably be somewhere in 
## C:\Users\<you>\?ppData\Local\Temp\RtmpYXWUHd\downloaded_packages

## one source:
install.packages("Rcampdf", repos = "http://datacube.wu.ac.at/", type = "source")

## allright allright allright! Are we ready for some data wrangling?!

## Loading Texts
## Start by saving y?ur text files in a folder titled: "texts" This will be the "corpus" (body) of texts you are mining.

## Read this next part carefully. You need three unique things here:
## 1. Create a folder named "texts" where you'll keep your data.
## 2. That folder sho?ld be:
## Mac: Desktop
## PC: C: drive
## 3. Copy the files "iliad.txt" and "odyssey.txt" to that folder. 
## You can copy any number of media files in that folder, 
## such as PDF and HTML to do your text mining.

## On a Mac, save the folder to your desk?op and use the following code chunk:
cname <- file.path("~", "Desktop", "texts")   
cname  

## Use this to check to see that your texts have loaded. 
dir(cname)

## On a PC, save the folder to your C: drive and use the following code chunk:
cname <- file.?ath("C:", "texts")   
cname   
dir(cname) 

## Load the R package for text mining and then load your texts into R.
library(tm)   
docs <- Corpus(DirSource(cname))   
summary(docs) 

## If you so desire, you can read your documents in the R terminal 
## usi?g inspect(docs). Or, if you prefer to look at only one of 
## the documents you loaded, then you can specify which one using something like:
inspect(docs[1])

##
## PART I
## Preprocessing
##

## Once you are sure that all documents loaded properly, go on ?o preprocess your texts.
## This step allows you to remove numbers, capitalization, common words, punctuation, and otherwise prepare your texts for analysis.
## This can be somewhat time consuming and picky, but it pays off in the end in terms of high qual?ty analyses.

## Removing punctuation:
##  Your computer cannot actually read. Punctuation and other special characters only look like more words to your computer and R. Use the following to methods to remove them from your text
docs <- tm_map(docs, remove?unctuation)

## If necessary, such as when working with emails, you can remove special characters.
## This list has been customized to remove punctuation that you commonly
## find in emails. You can customize what is removed by changing them as you see fit? to meet your own unique needs.
for(j in seq(docs))   
{   
  docs[[j]] <- gsub("/", " ", docs[[j]])   
  docs[[j]] <- gsub("@", " ", docs[[j]])   
  docs[[j]] <- gsub("\\|", " ", docs[[j]])   
} 

## Removing numbers:
docs <- tm_map(docs, removeNumbers) 
?## Converting to lowercase:
##   As before, we want a word to appear exactly the same every time it appears. We therefore change everything to lowercase.
docs <- tm_map(docs, tolower) 

## Removing "stopwords" (common words) that usually have no analytic v?lue.
## In every text, there are a lot of common, and uninteresting words (a, and, also, the, etc.). Such words are frequent by their nature, and will confound your analysis if they remain in the text.
# For a list of the stopwords, see:   
# length(stopwo?ds("english"))   
# stopwords("english")   
docs <- tm_map(docs, removeWords, stopwords("english"))   
# inspect(docs[3]) # Check to see if it worked (you will soon reach the max.print limit, so don't worry about text overlfow..)

## Removing particular wo?ds:
##  If you find that a particular word or two appear in the output, but are not of value to your particular analysis. You can remove them, specifically, from the text.
docs <- tm_map(docs, removeWords, c("department", "email"))   
# Just replace "depar?ment" and "email" with words that you would like to remove
## (I'm fairly certain Homer did not deal with departments and email ;-)

## Combining words that should stay together
# If you wish to preserve a concept is only apparent as a collection of two or?more words, then you can combine them or reduce them to a meaningful acronym before you begin the analysis. 
## Here, I am using examples that are particular to Homer, and some that are not ;-)
for (j in seq(docs))
{
  docs[[j]] <- gsub("Peloponnesian War"? "PW", docs[[j]])
  docs[[j]] <- gsub("World War I", "WWI", docs[[j]])
  docs[[j]] <- gsub("World War II", "WWII", docs[[j]])
}

## Removing common word endings (e.g., "ing", "es", "s")
## This is referred to as "stemming" documents. 
## We stem the docume?ts so that a word will be recognizable to the computer, 
## whether or not it may have a variety of possible endings in the original text.
library(SnowballC)   
docs <- tm_map(docs, stemDocument)   
# inspect(docs[1]) # Check to see if it worked.

## Strip?ing unnecesary whitespace from your documents:
##   The above preprocessing will leave the documents with a lot of "white space". White space is the result of all the left over spaces that were not removed along with the words that were deleted. The white ?pace can, and should, be removed.
docs <- tm_map(docs, stripWhitespace)   
# inspect(docs[1]) # Check to see if it worked.  

## To Finish
## Be sure to use the following script once you have completed preprocessing.
## This tells R to treat your preproces?ed documents as text documents.
docs <- tm_map(docs, PlainTextDocument)   

## This is the end of the preprocessing stage! Congratulations, you've done what data scientists spend 90% of their time on: data cleansing!

##
## PART II:
## Staging the Data
##
?## create a document term matrix.
## This is what you will be using from this point on.
dtm <- DocumentTermMatrix(docs)   
dtm  

## To inspect, you can use: inspect(dtm)
## This will, however, fill up your terminal quickly. So you may prefer to view a sub?et:
inspect(dtm[1:2, 1:20]) #view first 2 docs & first 20 terms - modify as you like
dim(dtm) #This will display the number of documents & terms (in that order)

## You'll also need a transpose of this matrix. Create it using:
tdm <- TermDocumentMatrix(doc?)   
tdm   

##
## PART III
## Explore your data!
##

## Organize terms by their frequency:
freq <- colSums(as.matrix(dtm))   
length(freq)
ord <- order(freq)

##Export the matrix to Excel:   
m <- as.matrix(dtm)   
dim(m)   
write.csv(m, file="dtm.csv")  ?

## That will print in your working directory!
## type getwd() in in RStudio's "Console" (bottom left)
## the output should end in:
## [...]/r-workshop-odsc-master/programs

## if not, navigate to this directory in RStudio with:
## Session - Set Working D?rectory - Choose Directory...

## Have you ever seen an Excel file with tha tmany columns??
# Try this instead":
mt <- as.matrix(tdm)   
dim(mt)   
write.csv(mt, file="tdm.csv") 

## better? :-)

## Congratulations, you've transposed your first matrix in E?cel!

## Let's focus on just the interesting stuff.
#  Start by removing sparse terms:   
dtms <- removeSparseTerms(dtm, 0.1) # This makes a matrix that is 10% empty space, maximum.   
inspect(dtms)

## Word Frequency

## There are a lot of terms, so for n?w, just check out some of the most and least frequently occurring words.
freq[head(ord)] 
freq[tail(ord)] 

## Check out the frequency of frequencies.
head(table(freq), 20)

## The resulting output is two rows of numbers. 
## The top number is the frequenc? with which words appear 
## and the bottom number reflects how many words appear that frequently. 
## Here, considering only the 20 lowest word frequencies, we can see that 
## 7407 terms appear only once and 2562 terms appear twice. 
## There are also a ?ot of others that appear very infrequently:
tail(table(freq), 20) 

## Considering only the 20 greatest frequencies, we can see that there is a huge disparity in how frequently some terms appear.

## For a less, fine-grained look at term freqency we can vi?w a table of the terms we selected when we removed sparse terms, above. (Look just under the word "Focus".)
freq <- colSums(as.matrix(dtms))   
freq   

## Or:
freq <- sort(colSums(as.matrix(dtm)), decreasing=TRUE)   
head(freq, 14)   

## An alternate vie? of term frequency:
##  This will identify all terms that appear frequently (in this case, 50 or more times).
findFreqTerms(dtm, lowfreq=50)   # Change "50" to whatever is most appropriate for your text data.

## another way to do this:
wf <- data.frame(wo?d=names(freq), freq=freq)   
head(wf)  

## Plot Word Frequencies

## Plot words that appear at least 250 times.
library(ggplot2)   
p <- ggplot(subset(wf, freq>250), aes(word, freq))    
p <- p + geom_bar(stat="identity")   
p <- p + theme(axis.text.x=ele?ent_text(angle=45, hjust=1))   
p 

##
## PART IV
## Statistics
##

## Relationships Between Terms

## Term Correlations

## If you have a term in mind that you have found to be particularly meaningful to your analysis, 
## then you may find it helpful to ?dentify the words that most highly correlate with that term.
## If words always appear together, then correlation=1.0.
findAssocs(dtms, "vessel", corlimit=0.98) # specifying a correlation limit of 0.999   
## In this case, "vessel" was highly correlated wi?h numerous other terms

## to do it for many terms:
#findAssocs(dtms, c("vessel", "neleus"), corlimit=0.98)

## Word Clouds!

## Humans are generally strong at visual analytics. 
## That is part of the reason that these have become so popular. What follows?are a variety of alternatives for constructing word clouds with your text.
## But first you will need to load the package that makes word clouds in R.
library(wordcloud)   

##Plot words that occur at least 250 times.
set.seed(142)   
wordcloud(names(freq)? freq, min.freq=250)  

## Note: The "set.seed() function just makes the configuration of the layout of the clouds consistent each time you plot them. You can omit that part if you are not concerned with preserving a particular layout.

## Plot the 100 mos? frequently used words.
set.seed(142)   
wordcloud(names(freq), freq, max.words=100) 

##Add some color and plot words occurring at least 250 times.
set.seed(142)   
wordcloud(names(freq), freq, min.freq=250, scale=c(5, .1), colors=brewer.pal(6, "Dark2")) ? 

##Plot the 100 most frequently occurring words.
set.seed(142)   
dark2 <- brewer.pal(6, "Dark2")   
wordcloud(names(freq), freq, max.words=100, rot.per=0.2, colors=dark2) 

## Clustering by Term Similarity

## To do this well, you should always first re?ove a lot of the uninteresting or infrequent words. 
## If you have not done so already, you can remove these with the following code.
dtmss <- removeSparseTerms(dtm, 0.15) # This makes a matrix that is only 15% empty space, maximum.   
inspect(dtmss) 

##?Hierarchal Clustering

## First calculate distance between words beginning with "a..." & then cluster them according to similarity.
library(cluster)   
d <- dist(t(dtmss[,1:100]), method="euclidian")   
fit <- hclust(d=d, method="ward")   
fit 
plot(fit, h?ng=-1)  
## Click on the zoom button on the plot..

## Helping to Read a Dendrogram
## If you find dendrograms difficult to read, there is still hope:
## To get a better idea of where the groups are in the dendrogram, 
## you can also ask R to help identif? the clusters. 
## Here, we have arbitrarily chosen to look at five clusters, as indicated by the red boxes. 
## If you would like to highlight a different number of groups, then feel free to change the code accordingly
plot.new()
plot(fit, hang=-1)
groups?<- cutree(fit, k=5)   # "k=" defines the number of clusters you are using   
rect.hclust(fit, k=5, border="red") # draw dendogram with red borders around the 5 clusters
## This tells us that achilles is thew root of 5 different word groupings, 
## one of w?ich is agamemnon, so we surmise that achiles and agamemnon have a big relationship
## in the story.. Cool huh, how we can begin to infer meaning through context. This is not unlike
## how your brain does it..

##K-means clustering

## The k-means clusterin? method will attempt to cluster words 
## into a specified number of groups (in this case 2), such that 
## the sum of squared distances between individual words and one 
## of the group centers. You can change the number of groups you 
## seek by changing?the number specified within the kmeans() command.
## Can you create meaningful clusters?
library(fpc)   
d <- dist(t(dtmss), method="euclidian")   
kfit <- kmeans(d, 2)   
clusplot(as.matrix(d), kfit$cluster, color=T, shade=T, labels=2, lines=0)   
