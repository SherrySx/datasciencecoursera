pollutantmean <- function(directory, pollutant, id =1:322){
  addtotal <-0
  totalnum <-0
  #read each id file, grab non-NA pollutant data
  for(i in id){
    monitor <- read.csv(paste(directory, paste(sprintf("%03d",i),"csv", sep="."), sep="/"))
    rows<-which(!is.na(monitor[[pollutant]]))
    gooddata <- monitor[rows,]
    addtotal<- addtotal + sum(gooddata[[pollutant]])
    totalnum <- totalnum + nrow(gooddata)
  
  }
  round(addtotal/totalnum, 3)
  
}