bitcoin_df <- readr::read_delim("BTC_USD_2013-10-01_2021-08-24-CoinDesk.csv")

names(bitcoin_df) <- c("Currency","Date","Closing Price (USD)" "24h Open (USD)","24h High (USD)","24h Low (USD)") 

View(bitcoin_df)
