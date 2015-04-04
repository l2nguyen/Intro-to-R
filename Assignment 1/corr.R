corr<- function(directory,threshold=0) {
    files<- dir(directory,full.names=TRUE)    # create a complete list of the files
    compID<- complete(directory)    # find the number of complete obs for the whole directory
  
    # Only use the cases where the data frame is greater than the threshold
    mydata<- compID[compID$nobs > threshold, ]
  
    # result is a numeric vetor of 0
    # if there is no data file that has a number of obs greater than threshold,
    # then the result with be this numeric vector of length 0
    result <- numeric(0)
  
    # for each case over threshold:
    # read csv, calculate the cor and append result
  
  for (id in mydata$id) {
    rawFile <- read.csv(files[id],header=TRUE)
    
    # make vector with results
    # pairwise deletion ignores all NA values
    result <- c(result, cor(rawFile$sulfate, rawFile$nitrate, use="pairwise.complete.obs"))
  }
  return(result)
}