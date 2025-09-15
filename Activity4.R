#Age Group
edad <- 65

if (edad < 13) {
  print("Child")
} else if (edad >= 13 & edad <= 19) {
  print("Teenager")
} else if (edad >= 20 & edad <= 59) {
  print("Adult")
} else if (edad >= 60) {
  print("Senior")
}