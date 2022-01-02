##Barplot of my data science profile
##Author: Miguel Bonilla

#create data table with values out of 100 (percent)
catprof = c("Data Viz", "Machine Learning", "Mathematics", "Statistics", "Computer Science", "Communication", "Domain Expertise")
catpercnt = c(.068966,0,.195402,.183908,.022989,.137931,.091954)

summary(catprof)
summary(catpercnt)

DSP.df = data.frame(Category = catprof, values = catpercnt)
DSP.df


barplot(DSP.df$values, names.arg = catprof, col = "Purple", main = "Data Science Profile",border = "black")


ggplot(DSP.df, aes(Category,values))+ geom_hline(yintercept = mean(DSP.df$values),col="black")+geom_bar(stat = "identity", fill = "Purple", col = "Black")+scale_x_discrete(limits=DSP.df$Category)+theme_bw()+ggtitle("Data Science Profile")+theme(plot.title = element_text(face = 'bold',color = "darkslategray",hjust = .5,size = 14))
