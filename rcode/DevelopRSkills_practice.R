# 2.1
uciCar <- read.table('http://www.win-vector.com/dfiles/car.data.csv', sep = ',', header = T)
# 2.2
class(uciCar)
summary(uciCar)
dim(uciCar)
# 3.1 downlaod the custdata.tsv first and save it in your working directory
custdata <- read.table('custdata.tsv', sep = '\t', header = T)
summary(custdata)
# 3.3 Note 3.2 is just the further explanation of 3.1
summary(custdata$income)
# 4.1
summary(custdata[is.na(custdata$housing.type), c("recent.move","num.vehicles")])
# 4.2 The folowing code will create a new variable custdata$is.employed.fix
custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed), "missing", ifelse(custdata$is.employed==T, "employed",  "not employed"))
# 4.3 Note that your results will not match the output shown in the book (it is okay)
breaks <-c(0, 10000, 50000, 100000, 250000, 1000000)
Income.groups <- cut(custdata$income, breaks=breaks, include.lowest=T)
summary(Income.groups)
Income.groups <- as.character(Income.groups)
Income.groups <- ifelse(is.na(Income.groups), "no income", Income.groups)
summary(as.factor(Income.groups))
# 4.4 Note: Ignore the warning
missingIncome <- is.na(custdata$Income)
Income.fix <- ifelse(is.na(custdata$Income), 0, custdata$Income) 
# 4.5 Note that your results will not match the output shown in the book (it is okay)
medianincome <- aggregate(income~state.of.res,custdata,FUN=median)
colnames(medianincome) <- c('State','Median.Income')
summary(medianincome) 
custdata <- merge(custdata, medianincome, by.x="state.of.res", by.y="State")
custdata$income.norm <- with(custdata, income/Median.Income)
summary(custdata$income.norm)
# 4.6 optional
brks <- c(0, 25, 65, Inf)
custdata$age.range <- cut(custdata$age, breaks=brks, include.lowest=T)
summary(custdata$age.range)
