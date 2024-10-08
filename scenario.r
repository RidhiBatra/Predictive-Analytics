###scenario
'
#1) Prostate cancer dataset
K= 3,4,5
k=sqr total value
accuracy = ?
  
#2)
train n test: 60:40, 65:35, 70:30, 75:25, 80:20, 85:15
accuracy = ?
'

data=data[,2:9]
str(data)
data_norm = function(x){((x-min(x))/(max(x) -min(x)))}
data_n = as.data.frame(lapply(data[2:8],data_norm))
View(data_n)
data_u = data.frame(data_n,diagnosis_result = data$diagnosis_result
                    )
data_u$diagnosis_result = factor(data_u$diagnosis_result)
library(caTools)
set.seed(123)
split = sample.split(data_u,SplitRatio = 0.70)
train= subset(data_u,split == TRUE)
test = subset(data_u,split== FALSE)
#train and test dataset
train_v = train[,1:7]
test_v = test[,1:7]
train_n = train[,8]
test_n = test [,8]
#data model
library(class)
y_pred = knn(train_v,test_v, train_n,k=3)
#performance measure
cm= table(test_n,y_pred)
a = sum(cm[1],cm[4])
accuracy = (a/sum(cm))
print(paste('Accuracy = ',accuracy * 100))
library(caret)
cm1  = confusionMatrix(test_n,y_pred)