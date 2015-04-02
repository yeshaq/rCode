library(gender)

##Warning: Takes 2.6 seconds per call!

testQ$Gender2 <- factor(apply(testQ[,c('FirstName','Gender')],1, function(x) {ifelse(x[2] == "NULL", gender(x[1])$gender, x[2])}))
