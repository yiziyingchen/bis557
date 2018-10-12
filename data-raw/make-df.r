lm_patho <- read.csv("/Users/yiziyingchen/Desktop/bis557/data-raw/df.csv")
dir.create("/Users/yiziyingchen/Desktop/bis557/data")
save(lm_patho, file = "/Users/yiziyingchen/Desktop/bis557/data/lm_patho.rda")


ridge_test <- read.csv("/Users/yiziyingchen/Desktop/bis557/data-raw/ridge_test.csv")
ridge_train <- read.csv("/Users/yiziyingchen/Desktop/bis557/data-raw/ridge_train.csv")
save(ridge_train, file = "/Users/yiziyingchen/Desktop/bis557/data/ridge_train.rda")
save(ridge_test, file = "/Users/yiziyingchen/Desktop/bis557/data/ridge_test.rda")
