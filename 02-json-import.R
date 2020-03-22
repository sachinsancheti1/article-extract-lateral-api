#install.packages("blogdown")
# library('blogdown')
blogdown::install_hugo()
setwd("D:/Desktop/LateralAPI-Article/")
setwd(paste0(getwd(),"/new_site"))
blogdown::new_site()
blogdown::update_hugo()

blogdown::new_post(title=result$title,
                   open = interactive(),
                   author = result$author,
                   kind = "check",
                   categories = result$keywords,
                   date = substr(result$published,1,10),
                   ext = ".md")

# Load the package required to read JSON files.
library("rjson")
library(dplyr)

setwd("D:/Desktop/LateralAPI-Article/")
files.list = read.table("jsons/a.txt",header=FALSE,stringsAsFactors = FALSE)[,1]
setwd(paste0(getwd(),"/new_site"))
titcd = as.character()
# creating sample yaml/md pages for use
for (i in 1:10){
  result <- fromJSON(file = paste0("../jsons/",files.list[i]))
  if(is.null(result$message) | is.null(result$message)){
    if(nchar(paste0(result$title))>1){
      titcd = c(titcd,result$title)
      cat("Processing ",i,"\n")
      setnewpost(i,result)
    }
  }
}

setnewpost <- function(i,x){
  dateset = substr(x$published,1,10)
  tryCatch(expr = if(as.Date(dateset) > Sys.Date()){
    dateset = Sys.Date()
  } else if(is.null(as.Date(dateset)) | is.na(as.Date(dateset))){
    dateset = Sys.Date()
  } else{
    dateset = substr(x$published,1,10)
  },error = function(e) dateset = Sys.Date())
  blogdown::new_post(title=paste(i,x$title),
                     open = interactive(),
                     author = x$author,
                     kind = "check1",
                     categories = x$keywords,
                     date = Sys.Date(),
                     ext = ".md")
}


# failed attempt
result2 <- fromJSON(file = "jsons/00006.json")
result3 <- fromJSON(file = "jsons/00008.json")
result4 <- fromJSON(file = "jsons/00009.json")
# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(result)
result$videos
print(json_data_frame)

rbind.fill(result, result2, result4)
