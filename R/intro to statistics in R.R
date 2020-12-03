
# Intro to statistics in R
#Mean, medine< and Mode
#---------------------------

x <- c(12:20)
x
y <- mean(x,trim = 0, na.rm = FALSE)
y
med <- median(x,na.rm = TRUE)
med 


#Mode

#get mode
getmode<- function(v){
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v,uniqv)))]
}
v <- c(12,2,33,4,5,-6,76,8,-76,-6,76,-6,8)
getmode(v)


#Linear regression

# y = ax + b
# syntax 

# lm(formula,data)

#Linear relation
x <- c(151,174,138,186,128,
       136,179,163,152,131)

y<- c(63,81,56,91,47,57,76,72,62,48)

relation <- lm(y~x, data = data.frame(y,x))
relation

a<- data.frame(x = 10)

pred_y <- predict(lm(y~x), a)
pred_y



#Multiple regression
#===================

# y = a +b1*1 + b2*2 + ...bn*n

#Syntax: lm()
data <- datasets::mtcars

#names(mtcars)
input <- mtcars[,c("mpg","disp","hp","wt")]

#Create the relationship model
model <- lm(mpg~disp+hp+wt, data=input)

#Show model
print(model)


#Logistic regress
#=================
#SYntax: glm(formula,data,family)

#Load dataset
data <- datasets::mtcars

#names(mtcars)
input <- mtcars[,c("am","cyl","hp","wt")]

#Build the model
am.data <- glm(formula = am~cyl+hp+wt, data = input, family = binomial)
print(summary(am.data))


#Normal distribution
# R has four in built functions to generate normal distribution.They are;
# dnorm(x, mean, sd):This is the PDF
# pnorm(x, mean, sd):This is the CDF
# qnorm(p, mean, sd): The quantile function
# rnorm(n, mean, sd)

#Example 1

#specify x-values for dnorm function
x_dnorm <- seq(-5,5, by=0.05)

#Probability are stored
y_dnorm <- dnorm(x_dnorm, mean=2.5, sd=0.5)
plot(x_dnorm, y_dnorm)

#Example 2
#Get 200 smples from the standard norm distribution
y <- rnorm(200)

#Plot histogram
hist(y,main = "Normal Distribution")



#========== Chi Square Tests==============

#Load library
#install.packages("MASS")
library("MASS")

#Create a table with needed variables
car.data = table(Cars93$AirBags, Cars93$Type)
car.data1 = c(Cars93$AirBags, Cars93$Type)
print(car.data)


#Perform the chi-square test.
print(chisq.test(car.data,simulate.p.value = TRUE))

#T test: One sample T test
#=========================

#Create data
daily.intake <- c(5260,5470,5640,6180,6390,6515,6805,7515,8230,8770)

#Set the main
t_mu <- 7725
#ttest
t.test(daily.intake,mu = t_mu)

# T test : Two sample
#Example: Here , we use the sleep dataset of the datasets package

View(sleep)

t.test(extra~group,data=sleep, var.equal=TRUE)

