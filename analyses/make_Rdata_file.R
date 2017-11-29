library(readr)
library(stringr)

data_folder <- "data/teachingscience_1499756645319"

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
save.image("data/teachingscience_1499756645319.Rdata")