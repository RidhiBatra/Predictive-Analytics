#create a datframe with the mathematical values with three categories
d1 = data.frame(v1 = c(12,25,63,85),
v2 = c(23,21,62,42),
grade = c('A','B','A','B'))
print(d1)

str(d1)
View(d1)
summary(d1)


#model training
library(caTools)
set.seed(123)
split=sample.split(d1, SplitRatio = 0.70) #allow system to divide your record in propor
training_set=subset(d1,split==TRUE)
testing_set = subset(d1,split==FALSE)

#input variable
train_set = training_set[,1:2]       #train variable
test_set=testing_set[,1:2]  #test variable
#output variable
train_name=training_set[,3]   #class name
test_name=testing_set[,3]   #accuracy

#KNN mode1

  library(class)
library(caret)
y_pred=knn(train_set,test_set,train_name,k=1)
#knn()
cm = table(test_name,y_pred)    #confusion matrix

cm = table(test_name,y_pred)
training_set = c(12,23)
cm1=confusionMatrix(test_name,y_pred)
d1$grade=factor(d1$grade) #data preprocessing

# sum1=sum(cm[1],cm[4])
# accuracy=sum1/sum(cm)
# print(accuracy)
library(caret)

