corr <- function(directory, threshold =0){
  mydf <-data.frame()
  #read each id file, grab non-NA pollutant data
  for(i in 1:332){
    monitor <- read.csv(paste(directory, paste(sprintf("%03d",i),"csv", sep="."), sep="/"))
    rows<-which(!is.na(monitor$sulfate) & !is.na(monitor$nitrate))
    gooddata <- monitor[rows,]
    if(nrow(gooddata) > threshold) {
      mydf <- rbind(mydf, round(cor(gooddata$sulfate, gooddata$nitrate),5))
    }
  }
  if(nrow(mydf)>0){
    mydf[[1]]
  }else{
    0
  }

}