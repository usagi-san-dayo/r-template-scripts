fileName <- "母比率の差の検定データセット.csv" 
alternative <- "two.sided" #両側検定: "two.sided", 左片側検定: "less", 右片側検定: "greater")
confLevel <- 0.95

dataset <- read.csv(fileName)

testResult <- prop.test(dataset[, 1], dataset[, 2], alternative = alternative,conf.level = confLevel)

resultDataFrame <- data.frame(testResult$statistic,
                              testResult$estimate[1],
                              testResult$estimate[2],
                              testResult$conf.int[1],
                              testResult$conf.int[2],
                              testResult$p.value, 
                              row.names = NULL)

colnames(resultDataFrame) <- c("statistic",
                               "sample proportion of x1",
                               "sample proportion of x2",
                               "upper conf.tnt of proportion difference",
                               "lower conf.tnt of proportion difference",
                               "p.value")

write.csv(resultDataFrame, "母比率の差の検定結果.csv", row.names = FALSE,)

