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
	dplyr::mutate(varp=rp)%>%
	dplyr::mutate(stdp=std(varp)) %>%
	dplyr::mutate(mean=mean(close)) %>%
	dplyr::ungroup() 

# Tasks
## Sheet 1: Individuelt
### 1. Finn tidsintervall
### 2. Finn forventet verdi
### 3. Finn varians og standardavvik
### 4. Avkastning i prosent
### 5. Graf
gensh_df_1 <- gensh_df
ggplot2::ggplot(gensh_df_1, aes(x=date,y=rp, color=currency)) + geom_point()

## Sheet 2: Samlet
gensh_df_2 <- dplyr::filter(gensh_df, date>=max(mdate)) %>% print()
ggplot2::ggplot(gensh_df_2, aes(x=date,y=rp, color=currency)) + geom_point()
### 1. Finn Kovarians

View(gensh_df_2)
## Sheet 3: Enkelt porteføljer 

## Sheet 4: Samlet porteføljer


btc_df <- crypto_df %>% dplyr::filter(currency=='BTC')
eth_df <- crypto_df %>% dplyr::filter(currency=='ETH')
xrp_df <- crypto_df %>% dplyr::filter(currency=='XRP')
