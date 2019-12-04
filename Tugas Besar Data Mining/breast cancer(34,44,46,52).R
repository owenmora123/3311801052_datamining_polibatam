#lokasi file
setwd("E:/TB-DataMining")

#pembacaan dataset
dataset <- read.csv("dataset.csv", sep = ",")

#library
install.packages("C50")
install.packages("printr")
install.packages("recipes")
library(C50)
library(printr)


#pembuatan model
dataset$Classification = as.factor(dataset$Classification)
model <- C5.0(Classification ~., data=dataset)

#melihat hasil model
model
summary(model)

#gambar model
plot(model)

#membuat dataset
datatesting <- dataset[,1:9]

#prediksi
predictions <- predict(model, datatesting)

#bandingkan hasil prediksi dengan dataset
table(predictions, dataset$Classification)
