fileName <- "F検定データセット.csv" 
alternative <- "two.sided" #両側検定: "two.sided", 左片側検定: "less", 右片側検定: "greater")
varEqual <- TRUE
confLevel <- 0.95

dataset <- read.csv(fileName)

testResult <- var.test(dataset[, 1], dataset[, 2], alternative = alternative,conf.level = confLevel)

resultDataFrame <- data.frame(testResult$statistic,
                              testResult$estimate,
                              testResult$conf.int[1],
                              testResult$conf.int[2],
                              testResult$p.value, 
                              row.names = NULL)

colnames(resultDataFrame) <- c("statistic",
                               "sample ratio of variances",
                               "upper conf.tnt of ratio of variances",
                               "lower conf.tnt of ratio of variances",
                               "p.value")

write.csv(resultDataFrame, "F検定結果.csv", row.names = FALSE,)

