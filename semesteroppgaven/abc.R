library(dplyr)
crypto_df <- list.files(path="csv",pattern = "*.csv") %>% purrr::map_df(~readr::read_delim(paste0("csv/",.)))




unique(tbl$Currency)
View(tbl)

bitcoin_df <- readr::read_delim("csv/BTC_USD_2013-10-01_2021-08-24-CoinDesk.csv")

?read_delim

View(tbl)

??read_csv
system('ls -all')


names(bitcoin_df) <- c("Currency","Date","Closing Price (USD)" "24h Open (USD)","24h High (USD)","24h Low (USD)") 

View(bitcoin_df)
ls: cannot access '/csv': No such file or directory


zsh:1: no matches found: /csv*

