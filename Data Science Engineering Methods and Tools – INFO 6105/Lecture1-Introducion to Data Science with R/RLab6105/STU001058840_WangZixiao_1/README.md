# Assignment 1 for INFO 6105

STU001058840 Wang Zixiao

**Assignment:**

1. Go through 0-intro.R, 1-data.R and finish the exercises.
    * Source code are saved in "Goal1 file"
2. Repeat 8-ml.R using a different dataset from UCI or another repository( big dataset will cost long time to fit, a small one is enough). Export plots as images and capture screenshots of fit result, save them in one folder.
    * Source code is saved in "Goal2 file"
    * All results from repeating 8-ml.R are saved in "Goal2\Wine\"
    * The new database comes from http://archive.ics.uci.edu/ml/datasets/Wine
    * The new database has 14 features
    * I didn't use all features to make the "featurePlot", because too many features will cause "margin error"
    ![error](./Goal2&#32;file/Wine/WinePlotShowTooMany.png)
    * I only use 4 features to make the "featurePlot"
3. Do the word cloud lab 4-textmining-cloud.R on iliad.txt and odyssey.txt, export plots and save in one folder.
    * All results picture are saved in "Goal3 file"
4. Get extra points to repeat word cloud lab with a text corpus in your native language.
    * In order to run my code, you need to install following package:

    ```r
    install_github("lijian13/rinds") # use install_github to install rinds
    ```

    ```r
    # use install packages in Rstudio to install Rwordseg and tmcn
    library(Rwordseg) # Chinese word library Rwordseg
    library(tmcn) # Chinese word mining library
    ```

    ![install](./Goal4&#32;file/InstallPackage.jpg)

    * The chinese wordcloud and source code are saved in Goal4 file
