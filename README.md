# A-pan-cancer-study-of-spalt-like-transcription-factors-1-2-3-4-as-therapeutic-targets
R codes for figures reproducibility


## Abstract



Spalt-like transcription factors (SALLs) are evolutionarily conserved proteins that participate in embryonic development. Four members of the SALL family, SALL1, SALL2, SALL3, and SALL4, are involved in cellular apoptosis, angiogenesis, invasion, and metastasis of tumors. We used the TCGA pan-cancer data to conduct a comprehensive analysis of SALL genes. High heterogeneity in the expression of these genes was observed across various cancers, SALL1 and SALL2 were downregulated, whereas SALL4 was upregulated. Moreover, we verified that SALL4 was commonly associated with survival disadvantage, whereas others were linked to a better prognosis. In renal cancer, SALL1, SALL2, and SALL3 showed downregulation, suggesting that they acted as tumor suppressors. Furthermore, SALLs were associated with immune infiltrate subtypes, with a close association between different degrees of infiltration of stromal cells and immune cells. DNA and RNA analyses in different tumors suggested different degrees of negative or positive correlation with tumor stem cell-like features. Finally, we revealed that SALLs were related to cancer cell resistance. Our results highlight the necessity to further study each SALL gene as a separate entity in specific types of cancer. Although this article showed that SALLs could be promising targets for cancer therapy, it needs further studies to validate the findings.



## Dependencies

This paper relies on the following libraries and softwares: 

- **[ggpubr](https://cran.r-project.org/web/packages/ggpubr/index.html)** The 'ggplot2' package is excellent and flexible for elegant data visualization in R. However the default generated plots requires some formatting before we can send them for publication. Furthermore, to customize a 'ggplot', the syntax is opaque and this raises the level of difficulty for researchers with no advanced R programming skills. 'ggpubr' provides some easy-to-use functions for creating and customizing 'ggplot2'- based publication ready plots.
- **[pheatmap](https://www.rdocumentation.org/packages/pheatmap/versions/1.0.12/topics/pheatmap)** A function to draw clustered heatmaps where one has better control over some graphical parameters such as cell size, etc.
- **[corrplot](https://www.rdocumentation.org/packages/corrplot/versions/0.90)** R package corrplot provides a visual exploratory tool on correlation matrix that supports automatic variable reordering to help detect hidden patterns among variables.
- **[survival](https://cran.r-project.org/web/packages/survival/index.html)** Contains the core survival analysis routines, including definition of Surv objects, Kaplan-Meier and Aalen-Johansen (multi-state) curves, Cox models, and parametric accelerated failure time models.
- **[survminer](https://www.rdocumentation.org/packages/survminer/versions/0.4.9)** The survminer R package provides functions for facilitating survival analysis and visualization.
- **[limma](https://www.rdocumentation.org/packages/limma/versions/3.28.14)** Data analysis, linear models and differential expression for microarray data.
- **[ggplot2](https://www.rdocumentation.org/packages/ggplot2/versions/3.3.5)** ggplot2 is a system for declaratively creating graphics, based on The Grammar of Graphics. 
- **[reshape2](https://www.rdocumentation.org/packages/reshape2/versions/1.4.4)** reshape2 is retired: only changes necessary to keep it on CRAN will be made. We recommend using tidyr instead.






## Installation

Users can manually download the scripts or use the command line as follows.

`https://github.com/yunfengwang0317/A-pan-cancer-study-of-spalt-like-transcription-factors-1-2-3-4-as-therapeutic-targets.git`



The following table describes the output files produced in this paper:

DirName | Description
---------|------------
`05.panGeneExp` | Estimate the gene expression from pan-cancer cohort.
`06.boxplot` | Visualize the gene expression in different groups via boxplot.
`07.diff` | Estimate the differential expression of genes between different conditions.
`08.pheatmap` | Visualize the expression matrix of genes in samples using heatmap.
`09.corrplot` | Visualize the correlation matrix among genes or samples.
`10.preSurvival` | Predict the suvival outcomes in all cancers.
`11.survival` | Draw KM curves of SALL genes in all cancers.
`12.cox` | Construct the cox regression model.
`13.immuneType` | Estimate and visualize the immune cell infiltration in different immune types.
`14.estimate` | Immune infiltration analysis based on ESTIMATE.
`15.estimateCor` | Estimate the correlation between immune signatures and cancers.
`16.RNAssCor` | RNA stemness score (RNAss) analysis.
`17.DNAssCor` | DNA stemness score (DNAss) analysis.
`18.CellMiner` | CellMiner™ is a development of the Genomics and Pharmacology Facility, Developmental Therapeutics Branch (DTB), Center for Cancer Research (CCR), National Cancer Institute (NCI).
`19.singleCancerImm` | Immune analysis of one single cancer type.
`20.singleCancerCli` | Clinical information analysis of one single cancer type.
`21.singleCancerScore` | Stemness score of one single cancer type.


![schematic](Fig1.pdf)
![schematic](Fig2.pdf)
![schematic](Fig3.pdf)
![schematic](Fig4.pdf)
![schematic](Fig5.pdf)



