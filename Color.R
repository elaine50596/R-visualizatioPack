## color pallette

## RColorBrewer provide very good sets of color pallette
library(RColorBrewer)
par(mar = c(0, 4, 0, 0))
display.brewer.all()
brewer.pal(12, "Greys")
brewer.pal(12, "Paired")

## package in transferring between rgb value and color code
library(grDevices)
rgb(255/255, 0, 0) # red, green, blue   -----from rgb to color number
col2rgb("#80B1D3") #   ---- from color number to rgb value
rgba(1,0,0,0.6)  # ---- rgb with color opacity 0.6 --- css command

## website in selecting all colors
# http://htmlcolorcodes.com/
