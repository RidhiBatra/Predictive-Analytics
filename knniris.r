library(caret)
data("iris")
str(iris)
indexes = createDataPartition(iris$Species, p=.85, list = F)
train = iris[indexes, ]
test = iris[-indexes,]
xtrain = train[,-5]
xtrain = train[,5]
xtest = test[,-5]
xtest = test[,5]
yhat = knn(xtrain,xtest,ytest,k=3)
cm= confusionMatrix(ytest,yhat)
print(cm)
