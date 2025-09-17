temp <- c(32,35,29,40,38)

if(all(temp>=40)){
  print("All days were hot.")
}
if(any(temp<30)){
  print("There is a day that has a temperature below 30.")
}