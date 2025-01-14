# set wd

library(dplyr)
library(tidyr)
library(caTools)
library(nnet)
library(AER)

# 1. read csv files, bikin as factor semua

df <- read.csv("heart.csv", stringsAsFactors = TRUE)

# 2. summary dataset

summary(df)

# 3. cek missing value tiap column

sum(is.na(df$Age))
sum(is.na(df$Sex))
sum(is.na(df$ChestPainType))
sum(is.na(df$RestingBP))
sum(is.na(df$Cholesterol))
sum(is.na(df$FastingBS))
sum(is.na(df$RestingECG))
sum(is.na(df$MaxHR))
sum(is.na(df$ExerciseAngina))
sum(is.na(df$oldpeak))
sum(is.na(df$ST_Slope))
sum(is.na(df$HeartDisease))

# 4. Keterangan Column

# 5. cek total data dari dataset

count(df)

# 6. membagi dataset menjadi 2 (sebagian kecil untuk validasi dan sisanya untuk pembuatan model)

split <- sample.split(df, SplitRatio=0.8)
df_model <- df[split,]
df_test <- df[!split,]

# 7. membuat model logistic regression (multiple variables)

# berdasarkan num
model_logistic <- multinom(HeartDisease ~ ., data = df)
summary(model_logistic)
exp(coefficients(model_logistic))
coeftest(model_logistic)
