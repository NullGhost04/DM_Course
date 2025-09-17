scores <- c(75,82,60,95,40)

if(all(scores>60)){
  print("All students have passed.")
}
if(any(scores<60)){
  print("There is atleast one student that failed.")
}