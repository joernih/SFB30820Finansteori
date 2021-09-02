# Installing libraries
library(dplyr)

# Reading the data
crypto_df <- list.files(path="csv",pattern = "*.csv") %>% purrr::map_df(~readr::read_delim(paste0("csv/",.)))
names(crypto_df) <- c("Currency","Date","close","open","high","low") 

# Abcde
unique(crypto_df$Currency)
# [1] "ADA" "BTC" "ETH" "XRP"

btc_df <- crypto_df %>% dplyr::filter(Currency=='BTC')
eth_df <- crypto_df %>% dplyr::filter(Currency=='ETH')
xrp_df <- crypto_df %>% dplyr::filter(Currency=='XRP')

plot(x=btc_df$Date,btc_df$close)
# Tasks
## Sheet 1: Individuelt
## Sheet 2: Samlet
## Sheet 3: Enkelt porteføljer 
## Sheet 4: Samlet porteføljer
