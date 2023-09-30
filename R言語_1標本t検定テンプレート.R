fileName <- "1標本t検定データセット.csv" 
alternative <- "two.sided" #両側検定: "two.sided", 左片側検定: "less", 右片側検定: "greater")
mu <- 170
varEqual = FALSE
confLevel = 0.95

dataset <- read.csv(fileName)

testResult <- t.test(dataset[, 1], alternative = alternative, mu = mu, conf.level = confLevel)

resultDataFrame <- data.frame(testResult$statistic,
                              testResult$estimate[1],
                              testResult$conf.int[1],
                              testResult$conf.int[2],
                              testResult$p.value, 
                              row.names = NULL)

colnames(resultDataFrame) <- c("statistic",
                               paste("sample.mean of " , colnames(dataset)[1]),
                               "upper conf.tnt of mean difference",
                               "lower conf.tnt of mean difference",
                               "p.value")

write.csv(resultDataFrame, row.names = FALSE, "1標本t検定結果.csv")
