```
require(DOSE)
data(geneList)
de = names(geneList)[1:100]
x = enrichDO(de)

require(clusterProfiler.dplyr)
y <- mutate(x, richFactor = Count / as.numeric(sub("/\\d+", "", BgRatio)))
```

```
> y
#
# over-representation test
#
#...@organism 	 Homo sapiens 
#...@ontology 	 DO 
#...@keytype 	 ENTREZID 
#...@gene 	 chr [1:100] "4312" "8318" "10874" "55143" "55388" "991" "6280" "2305" "9493" "1062" "3868" ...
#...pvalues adjusted by 'BH' with cutoff <0.05 
#...28 enriched terms found
'data.frame':	28 obs. of  10 variables:
 $ ID         : chr  "DOID:0060071" "DOID:5295" "DOID:8719" "DOID:3007" ...
 $ Description: chr  "pre-malignant neoplasm" "intestinal disease" "in situ carcinoma" "breast ductal carcinoma" ...
 $ GeneRatio  : chr  "5/77" "9/77" "4/77" "4/77" ...
 $ BgRatio    : chr  "22/8007" "157/8007" "18/8007" "29/8007" ...
 $ pvalue     : num  1.67e-06 1.76e-05 2.18e-05 1.56e-04 2.08e-04 ...
 $ p.adjust   : num  0.00064 0.00279 0.00279 0.0136 0.0136 ...
 $ qvalue     : num  0.000461 0.002008 0.002008 0.009796 0.009796 ...
 $ geneID     : chr  "6280/6278/10232/332/4321" "4312/6279/3627/10563/4283/890/366/4902/3620" "6280/6278/10232/332" "6280/6279/4751/6286" ...
 $ Count      : int  5 9 4 4 13 6 13 5 5 6 ...
 $ richFactor : num  0.2273 0.0573 0.2222 0.1379 0.0302 ...
#...Citation
  Guangchuang Yu, Li-Gen Wang, Guang-Rong Yan, Qing-Yu He. DOSE: an
  R/Bioconductor package for Disease Ontology Semantic and Enrichment
  analysis. Bioinformatics 2015, 31(4):608-609 
```

```
library(ggplot2)
library(forcats)
library(enrichplot)

ggplot(y, showCategory = 20, 
  aes(richFactor, fct_reorder(Description, richFactor))) + 
  geom_segment(aes(xend=0, yend = Description)) +
  geom_point(aes(color=p.adjust, size = Count)) +
  scale_color_viridis_c() +
  scale_size_continuous(range=c(2, 10)) +
  theme_minimal() + 
  xlab("rich factor") +
  ylab(NULL) + 
  ggtitle("Enriched Disease Ontology")
```

![](figures/dotplot-richFactor.png)


