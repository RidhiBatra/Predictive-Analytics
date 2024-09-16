#naive bayess
library(e1071)
library(caTools)
library(caret)
split = sample.split(iris,SplitRatio=0.7)
train_cl=subset(iris,split == "True")
test_cl = subset(iris,split == "False")

#feature scaling
train_scale = scale(train_cl[,1:4])
train_scale = scale(test_cl[,1:4])
set.seed(120) #seeting seed
classifier_cl = naiveBayes(Species ~ ., data = train_cl)
classifier_cl
y_pred = predict(classifier_cl,newdata = test_cl)

#confusion matrix
cm= table(test_cl$Species, y_pred)
cm

#model Evaluation
a = confusionMatrix(cm)
