
getwd()
# Ans 1
setwd("/Users/siddharthkinger/Documents/R_Assignment_SK")
data <- read.table("Bank.txt",header = TRUE, sep ="|" ,na.strings = c("NA",""))
data
summary(data)
#Ans2
char <- data[c("Response","Branch","Age","Sex")]

char <- data[c(2,3,4,5)]

char
# Ans3
happy_loyal_business<-  data["Occupation"] == "Business" & data["Response"] == "Loyal" | (data["ACT1"]>=5 & data["ACT2"]>=5 & data["ACT4"]>=5 & data["ACT5"]>=5 & data["ACT10"]>=5 & data["ACT14"]>=5 & data["ACT16"]>=5 & data["ACT17"]>=5 & data["ACT24"]>=5 & data["ACT26"]>=5 & data["ACT28"]>=5 & data["ACT30"]>=5 & data["ACT31"]>=5 & data["ACT32"]>=5)

length(happy_loyal_business[happy_loyal_business==TRUE]) 

# Ans 4
class("Occupation")

occupation = data['Occupation']
length(occupation[occupation=='NA']) # ans : 50

# Ans 5
data$Age_fct <- factor(data$Age,levels=c("<20","20-30","30-40","40-58","> 58"))

data$Age_fct

# Ans 6

LoyalRank <- data[data["Response"]=='Loyal',][c("ACT1","ACT2","ACT4","ACT5","ACT10","ACT14","ACT16","ACT17","ACT24","ACT26","ACT28","ACT30","ACT31","ACT32")]
LoyalRank_mat = as.matrix(LoyalRank)
dim(LoyalRank_mat) # Ans : 208x14

#Ans 7
Near_from_work <- data[data$Age=='20-30' & data$Sex=='Male' & data$WorkplaceProximity>=5, ]
Near_from_home <- data[data$Age=='20-30' & data$Sex=='Female' & data$ResidenceProximity>=5, ]

colnames(Near_from_home)[which(names(Near_from_home) == "ResidenceProximity")] <- "Distance_rating"
colnames(Near_from_work)[which(names(Near_from_work) == "WorkplaceProximity")] <- "Distance_rating"

Distance_from_Bank <- rbind(Near_from_work,Near_from_home)
Distance_from_Bank <- Distance_from_Bank[c("Branch","Response","Occupation", "Age","Sex","Distance")]

str(Distance_from_Bank)
#Create a subset with records of 20-30 Age Male with mid above score (>=5) on "WorkplaceProximity" named "Near_from_work"  and append it to another subset of 20-30 Age Female with mid above score(>=5) on "ResidenceProximity" named "Near_from_home". 
#Names of both columns of distance should be "Distance_rating"
#Combine both subsets to create a master table of customers who live/work near bank named "Distance_from_Bank.
#Columns which should be taken in this combined data are Branch,Response,Occupation Age,Sex,Distance only
#Display structure of the new dataset

