#Correlation values ranges between - 1 to + 1.
#With +1 shows highest positive correlation,
#while -1 represents highest negative correlation.
#-1 indicates a perfectly negative linear correlation between two variables
#0 indicates no linear correlation between two variables
#1 indicates a perfectly positive linear correlation between two variables

bank = read.csv(file.choose()) #choose file bank loan
my_data = bank[,c(1,3,5,4,7,6,8)]
head(my_data)
cor_mat=cor(my_data)
print("Correlation Matrix:");
print(cor_mat)

library(corrplot)
corrplot(cor_mat,method = "circle")
corrplot(cor_mat,method = "number")
corrplot(cor_mat,method = "pie")

# Output and Interpretation
# The output of lm is an object of class "lm"
# This object contains several components, including:
# coefficients: A named vector of coefficients from the model.
# residuals: The residuals of the model, which are the differences
# between observed and fitted values.
# fitted.values: The predicted values based on the model.
# rank: The numeric rank of the fitted linear model.
# df.residual: The residual degrees of freedom.
#height predictor vector
x = c(5.1,5.5,5.6,5.9,6.1,6.4,6.7,6.9,7.1,5.10)
#WEIGHT PREDICTOR VECTOR
y= c(63,56,42,85,45,61,55,49,57,88)
#lm()
relation = lm(y~x)
summary(relation)
#find weight of a person with given height
a= data.frame(x=6.3)
result = predict(relation,a)
print(result)
