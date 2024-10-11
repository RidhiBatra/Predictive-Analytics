#read dataset
data = read.table(file.choose(),sep = ',',header=TRUE)
View(data)
data=data[-1]
View(data)
#preprocessing
data_norm = function(x){((x-min(x))/(max(x)-min(x)))}
data_n = as.data.frame(lapply(data[2:7],data_norm))
data_n$diagnosis_result = factor(data$diagnosis_result)
View(data_n)
library(caTools)
split = sample.split(data_n,SplitRatio = 0.70)
train_split=subset(data_n,split=TRUE)
test_split = subset(data_n,split=false)
#data model
library(party)
tree=ctree(diagnosis_result ~ .,data=train_split)
y_pred=predict(tree,newdata=test_Split)
library(C50)
tree=C5.0(diagnosis_result ~ .,data=train_split,trails=12)
y_pred=predict(tree,newdata=test_split)
library(rpart) #use for prediction,regression or classification
tree=rpart(diagnosis_result ~ .,data=train_split,method="class")
plot(tree)
library(rpart.plot)
rpart.plot(tree)
y_pred = predict(tree,newdata=test_split,type="class")
#performance measure
cm=table(y_pred,test_split$diagnosis_result)
a=sum(cm[1],cm[4])
accuracy=(a/sum(cm))
print(paste('Accuracy = ',accuracy*100))
