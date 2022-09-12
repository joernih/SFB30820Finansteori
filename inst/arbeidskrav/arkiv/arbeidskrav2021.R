# Installing libraries
library(ggplot2)
library(dplyr)
library(htmlTable)
library(SFB30820Finansteori)
#ls("package:SFB30820Finansteori")
####################################################################################################################################################################
# Del I
## Reading the data
crypto_df <- list.files(path="csv",pattern = "*.csv")[c(1,2,4)] %>% purrr::map_df(~readr::read_delim(paste0("csv/",.))) %>% dplyr::filter(Currency==c("BTC","ETH"))
names(crypto_df) <- c("typeindex","date","close","open","high","low")

stocko_df <- list.files(path="csv",pattern = "*.csv")[c(3)] %>% purrr::map_df(~readr::read_delim(paste0("csv/",.))) %>% dplyr::select(c(-6,-7)) %>% dplyr::mutate(typeindex='NSE') %>%
	dplyr::relocate(typeindex,1)
names(stocko_df) <- c("typeindex","date","open","high","low","close")
#View(crypto_df)
#View(stocko_df)
msheets <- list(krypto=crypto_df,boers=stocko_df)
openxlsx::write.xlsx(msheets,file='cryptos_nyse.xlsx',overwrite=T)

## Mothersheet
gensh_df <- bind_rows(dplyr::select(crypto_df,date,typeindex,close),
		  dplyr::select(stocko_df,date,typeindex,close))
## Enkeltinvesteringer
enkelt_df <-
 	gensh_df %>%
	# Enkeltobjekter
	dplyr::group_by(typeindex) %>%
	dplyr::mutate(teller=dplyr::row_number(date)) %>%
#	dplyr::filter(teller<=10) %>%
	dplyr::mutate(mdate=min(date)) %>%
	dplyr::mutate(rp=(close-dplyr::lag(close))/dplyr::lag(close)) %>%
	dplyr::mutate(mean=mean(rp, na.rm=T)) %>%
	dplyr::mutate(varp=var(rp,na.rm=T))%>%
	dplyr::mutate(stdp=sd(rp,na.rm=T)) %>%
	dplyr::ungroup()

View(enkelt_df)
## Descriptive
unique(enkelt_df$mean)
unique(enkelt_df$varp)
unique(enkelt_df$stdp)

obj <- unique(enkelt_df$typeindex)
criptcoinsg <- obj %>%
	purrr::map(function(x,df=enkelt_df)
		   {
	dfg <- dplyr::filter(df,typeindex==x)
	color <- c('blue','green','red')
	ggplot2::ggplot(dfg, aes(x=date,y=rp)) + geom_point()
		   })
## Graphical
gridExtra::grid.arrange(criptcoinsg[[1]],criptcoinsg[[2]],criptcoinsg[[3]],
			ncol=3)
####################################################################################################################################################################
# Del II
## Porteføljeinvesteringer
gensh_df_2 <- dplyr::filter(enkelt_df, date>=max(mdate)) %>%
	dplyr::select(typeindex,date,rp) %>%
	tidyr::pivot_wider(names_from=typeindex, values_from=rp) %>%
	tidyr::drop_na() 

sheets <- list(portfinvest=gensh_df_2)
masheets <- list(krypto=crypto_df,boers=stocko_df,portfinvest=gensh_df_2)
openxlsx::write.xlsx(masheets,file='cryptos2_nyse.xlsx',overwrite=T)

ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=ETH)) + geom_point() +geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95)
ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=NSE)) + geom_point() +geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95)
ggplot2::ggplot(gensh_df_2, aes(x=NSE,y=ETH)) + geom_point() +geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95)
cor(gensh_df_2$BTC,gensh_df_2$ETH)
cor(gensh_df_2$BTC,gensh_df_2$NSE)
cor(gensh_df_2$NSE,gensh_df_2$ETH)


# Stopped here
wp <- c(1/3,1/3,1/3)
bitrp <- as.matrix(gensh_df_2[,c(2:4)])
# Funvtion here
#
is.matrix(bitrp)
### rp
rp <-  wp%*%colMeans(bitrp)
### Var
covall <- cov(bitrp)
#### Part I
vpi <- diag(covall)%*%wp
#### Part II
vpii <- sum(covall[lower.tri(covall*wp%*%t(wp))] )
###
vp <- vpi+vpii


names(gensh_df_2)[-1] %>% purrr::map(function(x,df=gensh_df_2){
					     browser()
}) -> abc
####################################################################################################################################################################
				     
