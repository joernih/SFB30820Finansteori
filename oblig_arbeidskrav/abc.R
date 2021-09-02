# Installing libraries
library(ggplot2)
library(dplyr)
library(SFB30820Finansteori)
ls("package:SFB30820Finansteori")
# Reading the data
crypto_df <- list.files(path="csv",pattern = "*.csv") %>% purrr::map_df(~readr::read_delim(paste0("csv/",.)))
names(crypto_df) <- c("currency","date","close","open","high","low") 
# [1] "currency" "date"     "close"    "open"    
# [5] "high"     "low"     

# Genereal transformation
unique(crypto_df$currency)
# [1] "BTC" "ETH" "XRP"
gensh_df <- crypto_df %>% 
	dplyr::group_by(currency) %>% 
	dplyr::mutate(mdate=min(date)) %>%
	dplyr::mutate(rp=(close-dplyr::lag(close))/close) %>%
	dplyr::mutate(varp=var(rp,na.rm=T))%>%
	dplyr::mutate(stdp=varp^(1/2)) %>%
	dplyr::mutate(mean=mean(close)) %>%
	dplyr::ungroup() 

View(gensh_df)
# Tasks
## Sheet 1: Individuelt
### 1. Finn tidsintervall
### 2. Finn forventet verdi
### 3. Finn varians og standardavvik
### 4. Avkastning i prosent
### 5. Tidserieplot over utviklingen i avkastningen 
gensh_df_1 <- gensh_df 
ggplot2::ggplot(gensh_df_1, aes(x=date,y=rp, color=currency)) + geom_point()

## Sheet 2: Samlet
gensh_df_2 <- dplyr::filter(gensh_df, date>=max(mdate)) %>% 
	dplyr::select(currency,date,rp) %>%
	tidyr::pivot_wider(names_from=currency, values_from=rp) %>%
	tidyr::drop_na()

ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=ETH)) + geom_point()+geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95)
ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=XRP)) + geom_point()
ggplot2::ggplot(gensh_df_2, aes(x=XRP,y=ETH)) + geom_point()

cor(gensh_df_2$BTC,gensh_df_2$ETH)
cor(gensh_df_2$BTC,gensh_df_2$XRP)
cor(gensh_df_2$XRP,gensh_df_2$ETH)


### 1. Finn Kovarians

## Sheet 3: Enkelt porteføljer 

## Sheet 4: Samlet porteføljer

## Sheet 5: Med markedsindeks (New York)

## Appendiks
https://www.quantshare.com/sa-620-10-new-ways-to-download-historical-stock-quotes-for-free

# Explain differences between expected and realised values
install.packages("foreign")
library(foreign)
ls("package:foreign")
nyse <- read.dta("https://query1.finance.yahoo.com/v7/finance/download/%5ENYA?period1=1472774400&period2=1630540800&interval=1d&events=history&includeAdjustedClose=true")
View(nyse)
