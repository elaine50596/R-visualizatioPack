library(RMySQL)
library(googleVis)

## ------------------line chart ------------------
# df = source()
plotTimeSeries <- function (df, fromDate, toDate, bar = F) {
  col = c("#A6CEE3","#1F78B4","#B2DF8A","#33A02C","#FB9A99","#E31A1C","#FDBF6F","#FF7F00","#CAB2D6","#6A3D9A","#FFBF00","#B15928","#1B9E77","#D95F02","#7570B3")
  mydf <- subset(df, date >= as.Date(fromDate) & date <= as.Date(toDate))
  na <- names(mydf)[!grepl('wday|month|holiday_|allOnes|date|base|registrations', names(mydf))]
  na <- c("invitation", na[-grep("invitation", na)])
  
  p <- gvisLineChart(mydf, "date", na[1],
                     options=list(width = 1200, height = 400,
                                  #title = kpi1,
                                  legend = "{position: 'none'}",
                                  series = "[{targetAxisIndex:0, color:'grey'}]",
                                  vAxes = paste0("[{title:'", na[1], "'}]")))
  
  for(i in 2:length(na)){
    if((i%%15)==0) myColor=col[5%%15] else myColor=col[i%%15]
    if(bar==T){
      s = paste("[{type:'bars',targetAxisIndex:0, color:'grey'},
                {targetAxisIndex:1,color:","'",myColor,"'}]",sep="")
    }else{
      s = paste("[{targetAxisIndex:0, color:'grey'},
                 {targetAxisIndex:1, color:","'",myColor,"'}]",sep="")
    }
    tmp <- gvisLineChart(mydf, "date", c(na[1],na[i]),
                         options=list(width=1200, height=400,
                                      legend = "{position: 'none'}", series = s, 
                                      vAxes = paste0("[{title:'", na[1], "'},
                                                       {title:'", na[i], "'}]")))
    p <- gvisMerge(p, tmp)
  }
  p
}

mydfplot <-plotTimeSeries(mydf, fromDate = '2015-01-01', toDate = '2017-02-12')
plot(mydfplot)

## ------------------scatter chart ------------------
plotscatterChart <- function (df, fromDate, toDate, bar = F) {
  col = c("#A6CEE3","#1F78B4","#B2DF8A","#33A02C","#FB9A99","#E31A1C","#FDBF6F","#FF7F00","#CAB2D6","#6A3D9A","#FFBF00","#B15928","#1B9E77","#D95F02","#7570B3")
  df <- subset(df, date >= as.Date(fromDate) & date <= as.Date(toDate))
  df <- df[,grep('registration|gross_offline|gross_online', names(df))]
  
  p <- gvisScatterChart(df[,c(2,1)], options=list(width = 1200, height = 400,
                                     #title = kpi1,
                                     legend = "{position: 'none'}",
                                     series = "[{targetAxisIndex:0, color:'grey'}]",
                                     vAxes = paste0("[{title:'", colnames(df)[2], "'}]")))
  
  for(i in 3:length(names(df))){
    if((i%%15)==0) myColor=col[5%%15] else myColor=col[i%%15]
    if(bar==T){
      s = paste("[{type:'bars',targetAxisIndex:0, color:'grey'},
                {targetAxisIndex:1,color:","'",myColor,"'}]",sep="")
    }else{
      s = paste("[{targetAxisIndex:0, color:'grey'},
                {targetAxisIndex:1, color:","'",myColor,"'}]",sep="")
    }
    tmp <- gvisScatterChart(df[,c(i,1)], options=list(width=1200, height=400,
                                         legend = "{position: 'none'}", series = s, 
                                         vAxes = paste0("[{title:'", colnames(df)[i], "'},
                                                        {title:'", colnames(df)[i], "'}]")))
    p <- gvisMerge(p, tmp)
    }
  p
}

mydfscatter <- plotscatterChart(mydf, fromDate = '2015-01-01', toDate = '2017-02-12')
plot(mydfscatter)
