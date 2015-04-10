library(plotly)

contractDetails <- read.csv(file="contractDetails.csv", sep=",")

x <- contractDetails$PremiumPercent
y <- contractDetails$BUFPercent
py <- plotly()

data <- list(
  list(
    x = x, 
    y = y, 
   #histnorm = "probability", 
    autobinx = FALSE, 
    xbins = list(
      start = 0.0, 
      end = 3, 
      size = 0.1
    ), 
    autobiny = FALSE, 
    ybins = list(
      start = 0.0,
      end = 3, 
      size = 0.1
    ), 
    colorscale = list(c(0.0, "white"),list(.0045, "rgb(12,51,131)"),list(0.25, "rgb(10,136,186)"),list(0.5, "rgb(242,211,56)"),list(0.75, "rgb(242,143,56)"),list(1, "rgb(217,30,30)")), 
    type = "histogram2d"
  )
)
layout <- list(
title = "Premium vs BUF",	
  xaxis = list(
  showline = TRUE,  
  linewidth = 1.5,
  title = "Premium (%)"
  ), 
  yaxis = list(
    title = "BUF (%)",
    showline = TRUE,
    showgrid = TRUE,
    zeroline = TRUE,	
    showticks = TRUE,
    linewidth = 1.5
)
)


#
#layout <- list(
#  title = "Premium vs BUF", 
#  xaxis = list(
#    title = "Premium (%)",
#    titlefont = list(
#      family = "Courier New, monospace", 
#      size = 20, 
#      showline = TRUE,
#      color = "#7f7f7f"
#    )
#  ), 
#  yaxis = list(
#    title = "BUF (%)",
#    showline = TRUE,
#    showgrid = TRUE,
#    zeroline = TRUE,	
#
#    linewidth = 5,
#    titlefont = list(
#      family = "Courier New, monospace", 
#      size = 20,
#      color = "#7f7f7f"
#      )
#  )
#)

response <- py$plotly(data, kwargs=list(layout=layout,filename="premVsBufInR", fileopt="overwrite"))
url <- response$url
url