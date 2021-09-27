# Installing libraries
rm(list=ls())
library(ggplot2)
library(dplyr)
library(SFB30820Finansteori)
ls("package:SFB30820Finansteori")

# Del I


# Del II
## Reading the data
crypto_df <- list.files(path="csv",pattern = "*.csv")[c(1,2,4)] %>% purrr::map_df(~readr::read_delim(paste0("csv/",.)))
names(crypto_df) <- c("typeindex","date","close","open","high","low") 

stocko_df <- list.files(path="csv",pattern = "*.csv")[c(3)] %>% purrr::map_df(~readr::read_delim(paste0("csv/",.))) %>% dplyr::select(c(-6,-7)) %>% dplyr::mutate(typeindex='NSE') %>%
	dplyr::relocate(typeindex,1)
names(stocko_df) <- c("typeindex","date","open","high","low","close") 
#View(crypto_df)
#View(stocko_df)
msheets <- list(krypto=crypto_df,boers=stocko_df)
openxlsx::write.xlsx(msheets,file='mothersheet.xlsx',overwrite=T)

## Enkeltinvesteringer
gensh_df <- 
	bind_rows(dplyr::select(crypto_df,date,typeindex,close), 
		  dplyr::select(stocko_df,date,typeindex,close)) %>% 
        # Enkeltobjekter	
	dplyr::group_by(typeindex) %>% 
	dplyr::mutate(mdate=min(date)) %>%
	dplyr::mutate(rp=(close-dplyr::lag(close))/close) %>%
	dplyr::mutate(mean=mean(close)) %>%
	dplyr::mutate(varp=var(rp,na.rm=T))%>%
	dplyr::mutate(stdp=sd(varp)) %>%
	dplyr::ungroup() 

obj <- unique(gensh_df$typeindex)[-3]
criptcoinsg <- obj %>% 
	purrr::map(function(x,df=gensh_df)
		   {
	dfg <- dplyr::filter(gensh_df,typeindex==x)
	ggplot2::ggplot(dfg, aes(x=date,y=rp, color=typeindex)) + geom_point()
		   })
gridExtra::grid.arrange(criptcoinsg[[1]],criptcoinsg[[2]],criptcoinsg[[3]], ncol=3)

## Porteføljeinvesteringer
gensh_df_2 <- dplyr::filter(gensh_df, date>=max(mdate)) %>% 
	dplyr::select(typeindex,date,rp) %>%
	tidyr::pivot_wider(names_from=typeindex, values_from=rp) %>%
	tidyr::drop_na()

cor(gensh_df_2$BTC,gensh_df_2$ETH)
cor(gensh_df_2$BTC,gensh_df_2$NSE)
cor(gensh_df_2$ETH,gensh_df_2$NSE)

ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=ETH)) + geom_point()
ggplot2::ggplot(gensh_df_2, aes(x=ETH,y=BTC)) + geom_point()
ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=NSE)) + geom_point()
geom_point()+geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95)

## Appendiks
#https://www.quantshare.com/sa-620-10-new-ways-to-download-historical-stock-quotes-for-free
#library(foreign)
#ls("package:foreign")
#nyse <- read.dta("https://query1.finance.yahoo.com/v7/finance/download/%5ENYA?period1=1472774400&period2=1630540800&interval=1d&events=history&includeAdjustedClose=true")
