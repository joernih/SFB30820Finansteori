# Installing libraries
rm(list=ls())
library(ggplot2)
library(dplyr)
library(htmlTable)
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

## Mothersheet
gensh_df <- bind_rows(dplyr::select(crypto_df,date,typeindex,close), 
		  dplyr::select(stocko_df,date,typeindex,close)) 
## Enkeltinvesteringer
enkelt_df <- 
 	gensh_df %>%
	# Enkeltobjekter	
	dplyr::group_by(typeindex) %>% 
	dplyr::mutate(mdate=min(date)) %>%
	dplyr::mutate(rp=(close-dplyr::lag(close))/close) %>%
	dplyr::mutate(mean=mean(close)) %>%
	dplyr::mutate(varp=var(rp,na.rm=T))%>%
	dplyr::mutate(stdp=sd(varp)) %>%
	dplyr::ungroup() 

obj <- unique(enkelt_df$typeindex)[-3]
criptcoinsg <- obj %>% 
	purrr::map(function(x,df=enkelt_df)
		   {
	dfg <- dplyr::filter(df,typeindex==x)
	ggplot2::ggplot(dfg, aes(x=date,y=rp, color=typeindex)) + geom_point()
		   })

gridExtra::grid.arrange(criptcoinsg[[1]],criptcoinsg[[2]],criptcoinsg[[3]], 
			ncol=3)

## Porteføljeinvesteringer
gensh_df_2 <- dplyr::filter(gensh_df, date>=max(mdate)) %>% 
	dplyr::select(typeindex,date,rp) %>%
	tidyr::pivot_wider(names_from=typeindex, values_from=rp) %>%
	tidyr::drop_na()

### Technical part
w <- c(0.3,0.4,0.3)
erp <- 
mean(gensh_df_2[,1,2,3])
### Graphical part
cor(gensh_df_2$BTC,gensh_df_2$ETH)
cor(gensh_df_2$BTC,gensh_df_2$NSE)
cor(gensh_df_2$ETH,gensh_df_2$NSE)

ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=ETH)) + geom_point()
ggplot2::ggplot(gensh_df_2, aes(x=ETH,y=BTC)) + geom_point()
ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=NSE)) + geom_point()
geom_point()+geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95)

### Works
w <- c(0.3,0.4,0.3)
df_eks_2_6 <- data.frame(aksje=c("A","B","C"),erp=c(0.12,0.15,0.25),std=c(0.10,0.20,0.40),korr=c("Mellom A og B: 0.8",
												 "Mellom A og C: 0.5",
												 "Mellom B og C: -0.10"))
htmlTable::htmlTable(df_eks_2_6, header=c("Aksje","Forventet avkastning","Standardavvik","Korrelasjonskoeffisient"))
port_returns <- (sum(w *df_eks_2_6$erp))
port_risk_v <- t(w) %*% (cov_mat %*% w)
port_risk_s <- sqrt(t(w) %*% (cov_mat %*% w))
avkdf <- data.frame(w1=1-w[1], w2=w[2], w3=w[3],wc=sum(w)) %>%
dplyr::mutate(forvavk=port_returns) %>%
dplyr::mutate(varians=port_risk_v) %>%
dplyr::mutate(stdavk=port_risk_s)


###
## Appendiks
#https://www.quantshare.com/sa-620-10-new-ways-to-download-historical-stock-quotes-for-free
#library(foreign)
#ls("package:foreign")
#nyse <- read.dta("https://query1.finance.yahoo.com/v7/finance/download/%5ENYA?period1=1472774400&period2=1630540800&interval=1d&events=history&includeAdjustedClose=true")
