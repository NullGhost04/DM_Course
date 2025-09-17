input <- "B"

meaning <- switch(input,
                  "A"="Excellent",
                  "B"="Good",
                  "C"="Decent",
                  "D"="Bad",
                  "F"="Failed")
print(meaning)