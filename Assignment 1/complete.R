complete<- function(directory,id=1:332) {
  files<- dir(directory,full.names=TRUE)  # creates a list of files
  
  # create two new variables and specifies their types
  # idCol<- numeric()
  # nocsCol<- numberic()
  dat<- data.frame()
  
  for(i in id) {
    my_data<- read.csv(files[i],header=TRUE)
    dat<- rbind(dat,c(i,sum(complete.cases(my_data))))
  }
  colnames(dat)<- c("id","nobs")
  return(dat)
}