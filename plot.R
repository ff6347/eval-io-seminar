getwd()
# read in data
data <- read.table("ergebnis-eval-SoSe-2015.csv",sep=",", header=TRUE)
# create vectors from each colmn
c1 <- c(data$triftnichtzu)
c2 <- c(data$teilsteils)
c3 <- c(data$triftzu)
# create a matrix from those vectors
d <- rbind(c1, c2, c3)
# plot it side by side
# with some settings
png(filename="plot.png",width=800,height=800)
plt <- barplot(d,
  space=c(0,4),
  beside=TRUE,
  horiz=TRUE,
  col=heat.colors(length(rownames(d))),
  las=1,
  width=1.2,
  border=NA,
  xlab="Responses",
  ylab="Questions",font=1)
# add a legend to the plot
legend("topright",c("trift nicht zu", "teils teils", "trifft zu"),lty=1,lwd=3, col=heat.colors(length(rownames(d))), bty='n', cex=.75, text.font=1)
# get every third coordiante from the plot
# for the text
coords = plt[seq(1,length(plt),3)]
# plot the text onto the graph
text(x= 0.5, coords, labels= data$Frage,  cex=1, adj = c(0,-2),font=1)
# add a grid
grid(nx = NULL, ny=0, lwd = 1)
# plot it all
plt
dev.off()


