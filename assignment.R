
getwd()
setwd("/Users/siddharthkinger/Documents/R_Assignment_SK")
data <- read.table("Bank.txt",header = TRUE, sep ="|" ,na.strings = c("NA",""))
data
summary(data)

char <- data[c("Response","Branch","Age","Sex")]

char <- data[c(2,3,4,5,6)]

char

happy_loyal_business<-  data["Occupation"] == "Business" & data["Response"] == "Loyal" | (data["ACT1"]>5 & data["ACT2"]>5 & data["ACT4"]>5 & data["ACT5"]>5 & data["ACT10"]>5 & data["ACT14"]>5 & data["ACT16"]>5 & data["ACT17"]>5 & data["ACT24"]>5 & data["ACT26"]>5 & data["ACT28"]>5 & data["ACT30"]>5 & data["ACT31"]>5 & data["ACT32"]>5)

length(happy_loyal_business[happy_loyal_business==TRUE]) # ans : 111


class("Occupation")

occupation = data['Occupation']
length(occupation[occupation=='NA']) # ans : 50

data$Age_fct <- factor(data$Age,levels=c("<20","20-30","30-40","40-58","> 58"))

data$Age_fct
