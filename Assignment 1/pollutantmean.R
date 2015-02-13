pollutantmean<- function(directory,pollutant,id=1:332) {
  files<- dir(directory,full.names=TRUE) #creates a list of files
  my_data<- data.frame() #empty data frame
  for(i in id) {
    #-- loops through and appends the rows from the files together
    my_data<-rbind(my_data,read.csv(files[i]))
  }
  #-- only consider the pollutant column
  mean(my_data[[pollutant]],na.rm=TRUE)
}