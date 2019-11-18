library(tidyverse)

dc <- read.table("arcos-dc-district-of-columbia-11001-itemized.tsv", skip=0, header=TRUE, fill = TRUE, sep="\t")
md <- read.table("arcos-md-statewide-itemized.tsv.gz", skip=0, header=TRUE, fill = TRUE, sep="\t")
va <- read.table("arcos-va-statewide-itemized.tsv.gz", skip=0, header=TRUE, fill = TRUE, sep="\t")