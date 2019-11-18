library(tidyverse)

# get colnames for use with data_cols:
  # data %>% names() %>% paste0(collapse="','")

fname <- "arcos_all_washpost.tsv.gz"
index <- 0
chunk <- 100000
con <- file(description=fname,open="r")
counter <- 0
dataChunk <- read.table(con, nrows=chunk, skip=0, header=TRUE, fill = TRUE, sep="\t")
data <- dataChunk
data_cols <- c('REPORTER_DEA_NO','REPORTER_BUS_ACT','REPORTER_NAME','REPORTER_ADDL_CO_INFO',
               'REPORTER_ADDRESS1','REPORTER_ADDRESS2','REPORTER_CITY','REPORTER_STATE','REPORTER_ZIP',
               'REPORTER_COUNTY','BUYER_DEA_NO','BUYER_BUS_ACT','BUYER_NAME','BUYER_ADDL_CO_INFO',
               'BUYER_ADDRESS1','BUYER_ADDRESS2','BUYER_CITY','BUYER_STATE','BUYER_ZIP','BUYER_COUNTY',
               'TRANSACTION_CODE','DRUG_CODE','NDC_NO','DRUG_NAME','QUANTITY','UNIT','ACTION_INDICATOR',
               'ORDER_FORM_NO','CORRECTION_NO','STRENGTH','TRANSACTION_DATE','CALC_BASE_WT_IN_GM','DOSAGE_UNIT',
               'TRANSACTION_ID','Product_Name','Ingredient_Name','Measure','MME_Conversion_Factor','Combined_Labeler_Name',
               'Revised_Company_Name','Reporter_family','dos_str')
repeat {
  counter <- counter + nrow(dataChunk)
  index <- index + 1
  print(paste('Processing rows:', index * chunk))
  dataChunk <- read.table(con, nrows=chunk, skip=index*chunk, header=FALSE, fill = TRUE, sep="\t",col.names = data_cols)
  if (nrow(dataChunk) != chunk){
    print('Processed all files!')
    break}
  data <- rbind(data,dataChunk)
  if (index > 48) break
  
}
close(con)
