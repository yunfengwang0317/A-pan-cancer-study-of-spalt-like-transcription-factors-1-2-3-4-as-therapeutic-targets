######Video source: https://ke.biowolf.cn
######生信自学网: https://www.biowolf.cn/
######微信公众号：biowolf_cn
######合作邮箱：biowolf@foxmail.com
######答疑微信: 18520221056

inputFile="panGeneExp.txt"    #输入文件
setwd("D:\\biowolf\\panGenes\\06.boxplot")              #设置工作目录
rt=read.table(inputFile,sep="\t",header=T,check.names=F,row.names=1)    #读取输入文件
rt=rt[(rt[,"Type"]=="Tumor"),]     #删除正常样品
data=rt[,(1:(ncol(rt)-2))]         #保留代表基因表达的列
geneNum=ncol(data)                 #基因数目

#绘制boxplot图形
pdf(file="boxplot.pdf",width=6,height=5)    #输出文件
par(mar=c(5, 5, 2, 2))                      #设置图片边距(下，左，上，右)
boxplot(data,ylab ="Gene expression",col = rainbow(geneNum),xaxt = "n",outline = FALSE)    #绘制boxplot
text(1:geneNum, par("usr")[3]-0.25, srt=45, adj=1, labels=colnames(data), xpd=TRUE, cex=0.8)  #x轴刻度
dev.off()


######Video source: https://ke.biowolf.cn
######生信自学网: https://www.biowolf.cn/
######微信公众号：biowolf_cn
######合作邮箱：biowolf@foxmail.com
######答疑微信: 18520221056
