choice <- 2
x <- 13
y <- 9

result <- switch(choice,
                 "1"= x + y,
                 "2"= x - y,
                 "3"= x * y,
                 "4"= x / y)

print(result)