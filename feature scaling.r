library(caTools)
set.seed(123)
data <- data.frame(Age = rnorm(5,50,8), weight = rnorm(5,80,10))

data <- data.frame(scale(data))
View(data)
a = mean(data$Age)
b= sd(data$Age)
c=data$Age[1]-a
d=c/d
d=c/b
#standardization
library(caret)
set.seed(123)
data = data.frame(Age = rnorm(500,50,8),Weight = rnorm(500,80,10))
data.pre = preprocess(data,method = c("center","scale"))
#normalization
data=dat.frame(Age = rnorm(500,50,8),Weight = rnorm(500,80,10))
data.pre = preprocess(data,method = "range")
data = predict(data.pre,data)
data = predict(data.pre,data)

dataset = read.csv(file.choose())  #socialnetworkadscsv
View(dataset)
dataset = dataset[3:5]
#encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased,levels=c(0,1))
#splitting the dataset into the training set and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased,SplitRatio = 0.75)
training_set = subset(dataset,split= TRUE)
test_set = subset(dataset,split == FALSE)
#feature scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])


#fitting knn to the training set and predicting the test set results
library(class)
y_pred = knn(train = training_set[,-3],test = test_set[,-3],cl = training_set[,3],k=5)
#making the confusion matrix
cm = table(test_set[,3],y_pred)