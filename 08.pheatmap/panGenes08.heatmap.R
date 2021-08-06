######Video source: https://ke.biowolf.cn
######生信自学网: https://www.biowolf.cn/
######微信公众号：biowolf_cn
######合作邮箱：biowolf@foxmail.com
######答疑微信: 18520221056

#install.packages("pheatmap")

library(pheatmap)            #引用包
inputFile="panGeneExp.txt"   #输入文件
setwd("D:\\biowolf\\panGenes\\08.pheatmap")              #设置工作目录
rt=read.table(inputFile,header=T,sep="\t",check.names=F,row.names=1)   #读取输入文件

#对肿瘤类型进行循环
logFcTab=data.frame()
pTab=data.frame()
genelist=colnames(rt[,(1:(ncol(rt)-2))])
for(cancerType in levels(factor(rt[,"CancerType"]))){
	data=rt[(rt[,"CancerType"]==cancerType),]
	normal=data[(data[,"Type"]=="Normal"),]
	tumor=data[(data[,"Type"]=="Tumor"),]
	if(nrow(normal)>=5){
		logFcVector=data.frame(cancerType)
		pVector=data.frame(cancerType)
		normal=normal[,(1:(ncol(normal)-2))]
		tumor=tumor[,(1:(ncol(tumor)-2))]
		for(gene in colnames(tumor)){
			logFC=mean(tumor[,gene])-mean(normal[,gene])
			test=wilcox.test(tumor[,gene],normal[,gene])
			pVector=cbind(pVector,test$p.value)
			logFcVector=cbind(logFcVector,logFC)
		}
		logFcTab=rbind(logFcTab,logFcVector)
		pTab=rbind(pTab,pVector)
	}
}
#输出logFC结果
colnames(logFcTab)=c("CancerType",genelist)
write.table(logFcTab,file="logFC.txt",sep="\t",row.names=F,quote=F)
#输出p值结果
colnames(pTab)=c("CancerType",genelist)
write.table(pTab,file="pvalue.txt",sep="\t",row.names=F,quote=F)

#绘制热图
row.names(logFcTab)=logFcTab[,1]
logFcTab=logFcTab[,-1]
pdf(file="heatmap.pdf",height=6,width=5)
pheatmap(logFcTab, 
         color = colorRampPalette(c("green", "black", "red"))(50),
         fontsize = 8,
         fontsize_row=8,
         fontsize_col=8)
dev.off()


######Video source: https://ke.biowolf.cn
######生信自学网: https://www.biowolf.cn/
######微信公众号：biowolf_cn
######合作邮箱：biowolf@foxmail.com
######答疑微信: 18520221056
