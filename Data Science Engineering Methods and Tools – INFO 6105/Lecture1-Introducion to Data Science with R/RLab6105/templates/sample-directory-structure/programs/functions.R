## sample function
## given a vector, remove negatives and NAs
getPos <- function(vv){
    out <- vv[vv>=0]
    out <- out[!is.na(out)]
    out
}
