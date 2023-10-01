fileName <- "母比率の検定データセット.csv" 
alternative <- "two.sided" #両側検定: "two.sided", 左片側検定: "less", 右片側検定: "greater")
p <- 0.9
confLevel <- 0.95

dataset <- read.csv(fileName)

testResult <- prop.test(dataset[, 1], dataset[, 2], p = p, alternative = alternative,conf.level = confLevel)

resultDataFrame <- data.frame(testResult$statistic,
                              testResult$estimate,
                              testResult$conf.int[1],
                              testResult$conf.int[2],
                              testResult$p.value, 
                              row.names = NULL)

colnames(resultDataFrame) <- c("statistic",
                               "sample proportion",
                               "upper conf.tnt of proportion",
                               "lower conf.tnt of proportion",
                               "p.value")

write.csv(resultDataFrame, "母比率の検定結果.csv", row.names = FALSE,)

