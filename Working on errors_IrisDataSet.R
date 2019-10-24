install.packages("readr")
library(readr)
install.packages("ggpubr")
library(ggpubr)
IrisDataSet <- read.csv("~/Desktop/ubiqum/Data Science projects/DS2/R Tutorial Data Sets/iris.csv")
IrisDataSet

View(IrisDataSet)
attributes(IrisDataSet)
summary(IrisDataSet)

str(IrisDataset)
str(IrisDataSet)

names(IrisDataSet)

hist(IrisDataSet$Petal.Length)

plot(IrisDataSet$Sepal.Length)

#IrisDataSet$Species<- as.numeric(IrisDataSet$Species) 

set.seed(123)

trainSize <- round(nrow(IrisDataSet) * 0.8)
testSize <- nrow(IrisDataSet) - trainSize

trainSize
testSize

training_indices <- sample(seq_len(nrow(IrisDataSet)),size =trainSize)
trainSet <- IrisDataSet[training_indices, ]
testSet <- IrisDataSet[-training_indices, ]

LinearModel<- lm(Petal.Length ~  Petal.Width, trainSet)
summary(LinearModel)
 
prediction<-predict(LinearModel,testSet)

prediction

summary(prediction)
View(testSet)

write.csv(prediction, file = "prediction_petal_length.csv", append = FALSE, quote = TRUE, sep = " ",
          eol = "\n", na = "NA", dec = ".", row.names = TRUE,
          col.names = TRUE, qmethod = c("escape", "double"),
          fileEncoding = "")

write.csv(IrisDataSet, file = "IrisDataSet.csv", append = FALSE, quote = TRUE, sep = " ",
          eol = "\n", na = "NA", dec = ".", row.names = TRUE,
          col.names = TRUE, qmethod = c("escape", "double"),
          fileEncoding = "")

ggscatter(IrisDataSet, x = "Petal.Length", y = "Petal.Width", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Petal Length", ylab = "Petal Width",color="Species",
          title = "Full dataset")

ggscatter(trainSet, x = "Petal.Length", y = "Petal.Width", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Petal Length", ylab = "Petal Width",color="Species",
          title = "Train dataset")


ggscatter(testSet, x = "Petal.Length", y = "Petal.Width", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Petal Length", ylab = "Petal Width",color="Species",
          title = "Test dataset")

