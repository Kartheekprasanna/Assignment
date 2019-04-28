library(googleVis)
heart <- read_csv("Heart.csv")
View(heart)
mychart2 <- gvisBarChart(heart,"Cholestrol", "RestingBPS", 
                         options=list(gvis.editor="Edit this chart if you want!",title="Cholestrol x RestingBPS",width=600, height=400),chartid = "Cholestrol")
plot(mychart2)
print(mychart2, file="Chart.html")