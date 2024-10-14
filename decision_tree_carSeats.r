library(ISLR) #carseats datasets is present in ISLR
attach(Carseats)
str(Carseats)
library(C50)
library(rpart)
library(rpart.plot)
tree=C5.0(US ~ .,data=Carseats, trials=10)

#make predictions
table(predict(tree, newdata=Carseats), Carseats$US)
tree_ms3 = rpart(US ~ ., Carseats, control = rpart.control(minsplit=3))
rpart.plot(tree_ms3,main="minsplit=3")

