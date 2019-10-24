install.packages("readr")
library(readr)
cars_data_set <- read.csv("~/Desktop/ubiqum/Data Science projects/DS2/R Tutorial Data Sets/cars.csv")
View(cars_data_set)

colnames(cars_data_set) <- c("Name","Speed","Distance") #rename the coulmns into shorter version

trainSize<-round(nrow(cars_data_set)*0.7) #choose as a training slice 70% of my data
testSize<-nrow(cars_data_set)-trainSize # indicate the left 30% of data for testing my model

training_indices<-sample(seq_len(nrow(cars_data_set)),size =trainSize) 
trainSet<-cars_data_set[training_indices,]
testSet<-cars_data_set[-training_indices,] 

Model1<-lm(Distance ~ Speed, trainSet) #this is my Linear Regression Model

summary(Model1)
PredictDistance <- predict(Model1,testSet) #Testing my model on other 30% of Data
PredictDistance #Print prediction

summary(PredictDistance) 


write.csv(PredictDistance, file = "PredictDistance.csv", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = TRUE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

# sdfdfsf

write.csv(cars_data_set, file = "cars_data_set.csv", append = FALSE, quote = TRUE, sep = " ",
          eol = "\n", na = "NA", dec = ".", row.names = TRUE,
          col.names = TRUE, qmethod = c("escape", "double"),
          fileEncoding = "")
