complete <- function(directory, id =1:322){
  mydf <-data.frame()
  #read each id file, grab non-NA pollutant data
  for(i in id){
    monitor <- read.csv(paste(directory, paste(sprintf("%03d",i),"csv", sep="."), sep="/"))
    rows<-which(!is.na(monitor$sulfate) & !is.na(monitor$nitrate))
    gooddata <- monitor[rows,]
    mydf <- rbind(mydf, c(i, nrow(gooddata)))
  }
  colnames(mydf)<- c("id", "nobs")
  mydf
}