#Vector Check
Vector <- c(20, 55, 70)

if (all(Vector > 50)) {
  print("All are above 50")
} else if (any(Vector > 50)) {
  print("Some are above 50")
} else {
  print("None are above 50")
}