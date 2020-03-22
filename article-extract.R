#Require the package so you can use it
require("httr")
require("jsonlite")
testurl = as.vector(urlt$V1)[14]

CusAuth <- c(content-type = "application/json", subscription-key = "c8bfc5c6c0cc1bbad618baf5c2f671d3")
base <- "https://document-parser-api.lateral.io/?url="
endpoint <- testurl #to change later

geturl = paste0(base,testurl)
r = GET(geturl,add_headers(.headers = CusAuth))


get_prices <- GET(call1, authenticate(username,password, type = "basic"))

get_prices_json <- fromJSON(get_prices_text, flatten = TRUE)
get_prices_df <- as.data.frame(get_prices_json)


add_headers(.headers = c(subscription-key = "c8bfc5c6c0cc1bbad618baf5c2f671d3",
                         content-type = "application/json"))

r <- GET("http://httpbin.org/get",
         add_headers(.headers = )

