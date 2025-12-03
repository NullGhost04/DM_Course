library(arules)
library(arulesViz)

data("Groceries")

par(mar = c(4, 4, 2, 1))

itemFrequencyPlot(
  Groceries, 
  topN = 20, 
  type = "absolute", 
  main = "Absolute Item Frequency for Top 20 Items"
)

rules <- apriori(
  Groceries,
  parameter = list(support = 0.001, confidence = 0.5)
)

rules_sorted <- sort(rules, by = "lift", decreasing = TRUE)

inspect(rules_sorted[1:10])

milk_rules <- subset(rules, subset = rhs %in% "whole milk")
inspect(sort(milk_rules, by = "confidence")[1:5])

try({ windows() }, silent = TRUE)
try({ x11() }, silent = TRUE)          
try({ quartz() }, silent = TRUE)       

plot(rules)

top_rules_20 <- rules_sorted[1:20]

# Graph view (HTML widget)
plot(top_rules_20, method = "graph", engine = "htmlwidget")

### --- 8. Grouped Matrix Plot ---
plot(top_rules_20, method = "grouped")