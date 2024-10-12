getwd()
insurance = read.csv(file.choose())
str(insurance)
summary(insurance$charges)
hist(insurance$charges)
table(insurance$charges)
a=cor(insurance[c("age","bmi","children","charges")])
library(corrplot)
corrplot(a,method="circle")
x=insurance$age
y=insurance$charges
b=lm(y~x)
print(b)
data=data.frame(x=60)
c=predict(b,data)
print(c)
pairs(insurance[c("age","bmi","children","charges")])
library(psych)
pairs.panels(insurance[c("age","bmi","children","charges")])
#an enhanced scatterplot matrix can be created with the pairs.panel
#significance of corrplot,pair,pairpanel