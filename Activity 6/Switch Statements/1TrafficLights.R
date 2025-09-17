signal <- "yellow"
message <- switch(signal,
                  "red"="Stop",
                  "yellow" = "Ready",
                  "green"="Go",
                  "Invalid Signal")
print(message)