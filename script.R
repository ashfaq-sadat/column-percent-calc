
# Loading Data
library(readxl)
data <- read_excel("data.xlsx")
View(data)


# counting percent of yes response as per column

percent_yes <- list()
for (i in colnames(data)) {
  percent_yes[[i]] <- sum(data[[i]] == 1)/NROW(data[[i]])*100
  percent_yes <- data.frame(percent_yes)
}

# creating Bar chart 

library(ggplot2)
install.packages('ggthemes')
library(ggthemes)
percent_yes_t<- data.frame(t(percent_yes))

ggplot(percent_yes_t)+aes(x=rownames(percent_yes_t), y=percent_yes_t$t.percent_yes)+ geom_bar(stat = "identity")+ xlab("Medication Questions")+ylab('Percent reponded "yes"')+theme_par()



