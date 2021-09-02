# Installing libraries
library(ggplot2)
library(dplyr)
library(SFB30820Finansteori)
ls("package:SFB30820Finansteori")
# Reading the data
crypto_df <- list.files(path="csv",pattern = "*.csv") %>% purrr::map_df(~readr::read_delim(paste0("csv/",.)))
names(crypto_df) <- c("currency","date","close","open","high","low") 

# Genereal transformation
unique(crypto_df$currency)
# [1] "BTC" "ETH" "XRP"
gensh_df <- crypto_df %>% 
	dplyr::group_by(currency) %>% 
	dplyr::mutate(mdate=min(date)) %>%
	dplyr::mutate(rp=(close-dplyr::lag(close))/close) %>%
	dplyr::mutate(mean=mean(close)) %>%
	dplyr::ungroup() 

# Tasks
## Sheet 1: Individuelt
### 1. Finn tidsintervall
### 2. Finn forventet verdi
### 3. Finn varians og standardavvik
### 4. Avkastning i prosent
### 5. Graf
ggplot2::ggplot(gensh_df, aes(x=date,y=rp, color=currency)) + geom_point()

## Sheet 2: Samlet
%>% dplyr::filter(date>=max(mdate))

a <- crypto_df %>% dplyr::group_by(currency) %>% dplyr::mutate(mdate=min(date)) %>%
	dplyr::ungroup() %>% dplyr::filter(date>=max(mdate))

ggplot2::ggplot(a, aes(x=date,y=open)) + geom_point()

View(a)
### 1. Finn Kovarians

## Sheet 3: Enkelt porteføljer 

## Sheet 4: Samlet porteføljer


btc_df <- crypto_df %>% dplyr::filter(currency=='BTC')
eth_df <- crypto_df %>% dplyr::filter(currency=='ETH')
xrp_df <- crypto_df %>% dplyr::filter(currency=='XRP')
