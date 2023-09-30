fileName <- "2標本t検定データセット.csv" 
alternative <- "two.sided" #両側検定: "two.sided", 左片側検定: "less", 右片側検定: "greater")
varEqual <- TRUE
confLevel <- 0.95

dataset <- read.csv(fileName)

testResult <- t.test(dataset[, 1], dataset[, 2], alternative = alternative,
                     var.equal = varEqual, conf.level = confLevel)

resultDataFrame <- data.frame(testResult$statistic,
                              testResult$estimate[1],
                              testResult$estimate[2],
                              testResult$conf.int[1],
                              testResult$conf.int[2],
                              testResult$p.value, 
                              row.names = NULL)

colnames(resultDataFrame) <- c("statistic",
                               paste("sample.mean of " , colnames(dataset)[1]),
                               paste("sample.mean of " , colnames(dataset)[2]),
                               "upper conf.tnt of mean difference",
                               "lower conf.tnt of mean difference",
                               "p.value")

write.csv(resultDataFrame, "2標本t検定結果.csv", row.names = FALSE,)

