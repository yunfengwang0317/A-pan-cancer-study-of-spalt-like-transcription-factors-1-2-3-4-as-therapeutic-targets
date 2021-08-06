######Video source: https://ke.biowolf.cn
######??????ѧ??: https://www.biowolf.cn/
######΢?Ź??ںţ?biowolf_cn
######???????䣺biowolf@foxmail.com
######????΢??: 18520221056

install.packages("corrplot")


library(corrplot)                    #???ð?
expFile="panGeneExp.txt"             #?????????ļ?
scoreFile="estimateScores.txt"       #????΢?????????ļ?
scoreType="ImmuneScore"             #????????
setwd("D://pancancerssp//15.estimateCor")     #???ù???Ŀ¼

#??ȡ?????ļ?
exp=read.table(expFile, header=T,sep="\t",row.names=1,check.names=F)
exp=exp[(exp[,"Type"]=="Tumor"),]

#??ȡ????΢?????ļ?
TME=read.table(scoreFile, header=T,sep="\t",row.names=1,check.names=F)

#??Ʒȡ????
sameSample=intersect(row.names(TME),row.names(exp))
TME=TME[sameSample,]
exp=exp[sameSample,]

#?????Լ???
outTab=data.frame()
pTab=data.frame()
#??????????ѭ??
for(i in levels(factor(exp[,"CancerType"]))){
    exp1=exp[(exp[,"CancerType"]==i),]
    TME1=TME[(TME[,"CancerType"]==i),]
    x=as.numeric(TME1[,scoreType])
    pVector=data.frame(i)
    outVector=data.frame(i)
	#??????ѭ??
	genes=colnames(exp1)[1:(ncol(exp1)-2)]
	for(j in genes){
		y=as.numeric(exp1[,j])
		corT=cor.test(x,y,method="spearman")
		cor=corT$estimate
		pValue=corT$p.value
		pVector=cbind(pVector,pValue)
		outVector=cbind(outVector,cor)
	}
	pTab=rbind(pTab,pVector)
	outTab=rbind(outTab,outVector)
}
#?????????Եı???
colNames=c("CancerType",colnames(exp1)[1:(ncol(exp1)-2)])
colnames(outTab)=colNames
write.table(outTab,file="estimateCor.cor.txt",sep="\t",row.names=F,quote=F)
#?????????Լ???pֵ?ı???
colnames(pTab)=colNames
write.table(pTab,file="estimateCor.pval.txt",sep="\t",row.names=F,quote=F)

#????΢??????????ͼ??
pdf(file=paste0(scoreType,".pdf"),height=3,width=8)
row.names(outTab)=outTab[,1]
outTab=outTab[,-1]
corrplot(corr=as.matrix(t(outTab)),
		 title=paste0("\n\n\n\n",scoreType),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()


######Video source: https://ke.biowolf.cn
######??????ѧ??: https://www.biowolf.cn/
######΢?Ź??ںţ?biowolf_cn
######???????䣺biowolf@foxmail.com
######????΢??: 18520221056
