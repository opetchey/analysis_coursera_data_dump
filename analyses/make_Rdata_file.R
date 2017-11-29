rm(list=ls())

## you will need to have the following libraries installed
library(readr)
library(stringr)

## change your_data_folder
data_folder <- "data/your_data_folder"

dir(path=data_folder)
filenames <- dir(path=data_folder, pattern="*.csv")
filenames <- unlist(lapply(str_split(filenames, "\\."), function(x) x[1]))
#i <- filenames[1]
for(i in filenames) {
  filepath <- file.path(data_folder, paste(i,".csv",sep=""))
  xx <- read_csv(filepath)
  ## only keep datasets with observations
  if(nrow(xx)>0)
    assign(i, xx)
  rm(xx)
}
rm(data_folder, filenames, filepath, i)
#remove data frames with no obs

## change your_data_folder
save.image("data/your_data_folder.Rdata")