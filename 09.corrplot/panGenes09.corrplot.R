######Video source: https://ke.biowolf.cn
######生信自学网: https://www.biowolf.cn/
######微信公众号：biowolf_cn
######合作邮箱：biowolf@foxmail.com
######答疑微信: 18520221056

#install.packages("corrplot")


library(corrplot)                #引用包
inputFile="panGeneExp.txt"       #输入文件
setwd("D:\\biowolf\\panGenes\\09.corrplot")    #设置工作目录

#读取输入文件，并对数据进行整理
rt=read.table(inputFile,sep="\t",header=T,check.names=F,row.names=1)    #读取输入文件
rt=rt[(rt[,"Type"]=="Tumor"),]       #删除正常样品
data=rt[,(1:(ncol(rt)-2))]           #保留代表基因表达的列
geneNum=ncol(data)                   #基因数目

#绘制相关性图形
pdf("corrplot.pdf",height=6,width=6)              #保存图片的文件名称
par(oma=c(0.5,0.5,0.5,1))
M=cor(data)
corrplot(M, order = "AOE", type = "upper", tl.pos = "lt")
corrplot(M, add = TRUE, type = "lower", method = "number", order = "AOE",
         col = "black", diag = FALSE, tl.pos = "n", cl.pos = "n")
dev.off()


######Video source: https://ke.biowolf.cn
######生信自学网: https://www.biowolf.cn/
######微信公众号：biowolf_cn
######合作邮箱：biowolf@foxmail.com
######答疑微信: 18520221056
