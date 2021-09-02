# Installing libraries
library(dplyr)

# Reading the data
crypto_df <- list.files(path="csv",pattern = "*.csv") %>% purrr::map_df(~readr::read_delim(paste0("csv/",.)))
names(crypto_df) <- c("Currency","Date","Closing Price (USD)" "24h Open (USD)","24h High (USD)","24h Low (USD)") 

# Abcde
unique(crypto_df$Currency)
# [1] "ADA" "BTC" "ETH" "XRP"


