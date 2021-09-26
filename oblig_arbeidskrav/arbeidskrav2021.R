# Installing libraries
rm(list=ls())
library(ggplot2)
library(dplyr)
library(SFB30820Finansteori)
ls("package:SFB30820Finansteori")

# Del I

0.2*(0.16-0.11)*(0.05-0.23)+
0.5*(0.12-0.11)*(0.20-0.23)+
0.3*(0.06-0.11)*(0.40-0.23)
#
(1/2)^2*(0.0013)+(1/2)^2*(0.0156)-2*(1/2)*(1/2)*0.0045
cx_c <- c(((df_eks_2_1_w$avk_a-ex_a)*
	   (df_eks_2_1_w$avk_b-ex_b))%*%df_eks_2_1_w$prob)
#m <- as.matrix(df_eks_2_1_w[,c(3,4)])
#v <- as.vector(df_eks_2_1_w[,c(2)])
#cov.wt(m,v)$cov
df_eks_2_1 <- data.frame(tilstand=c(1,2,3),
                         prob=c(0.2,0.5,0.3),
                         avk_a=c(0.16,0.12,0.06),
                         avk_b=c(0.05,0.20,0.40)
                         )
ex_a <- c(df_eks_2_1$avk_a%*%df_eks_2_1$prob)
ex_b <- c(df_eks_2_1$avk_b%*%df_eks_2_1$prob)
vx_a <- c((df_eks_2_1$avk_a-ex_a)^2%*%df_eks_2_1$prob)
vx_b <- c((df_eks_2_1$avk_b-ex_b)^2%*%df_eks_2_1$prob)
htmlTable(df_eks_2_1, header=c("Tilstand","Sansynlighet","A","B"))
r <- cor(df_eks_2_1[,3],df_eks_2_1[,4])
# [1] -0.9994664
plotwf <- c(r) %>% purrr::map_dfr(function(r,df=df_eks_2_1){
	w <- seq(0,1,0.01)
	v <- as.vector(df[,(2)])
	m <- as.matrix(df[,(3:4)])
	covall <- cov.wt(m,v,method='ml')
	avk <- as.vector(covall$center)
	kov <- covall$cov[lower.tri(covall$cov)] 
	var <- as.vector(diag(as.matrix(covall$cov)))
	avkdf <- data.frame(corr=r,w1=1-w, w2=w) %>%
 		dplyr::mutate(forvavk=w1*avk[1]+w2*avk[2]) %>%
 		dplyr::mutate(varians=w1^2*var[1]+w2^2*var[2]+2*w1*w2*r*sqrt(var[1])*sqrt(var[2])) %>%
 		dplyr::mutate(stdavk=sqrt(varians))
			 }
)

gg <- ggplot2::ggplot(data=plotwf,ggplot2::aes(x=stdavk,y=forvavk)) + ggplot2::geom_point() 
plotly::ggplotly(gg)

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

obj <- unique(gensh_df$typeindex)
criptcoinsg <- obj %>% 
	purrr::map(function(x,df=gensh_df)
		   {
	dfg <- dplyr::filter(gensh_df,typeindex==x)
	ggplot2::ggplot(dfg, aes(x=date,y=rp, color=typeindex)) + geom_point()
		   })
gridExtra::grid.arrange(criptcoinsg[[1]],criptcoinsg[[2]],criptcoinsg[[3]],criptcoinsg[[4]], ncol=2)

## Porteføljeinvesteringer
gensh_df_2 <- dplyr::filter(gensh_df, date>=max(mdate)) %>% 
	dplyr::select(typeindex,date,rp) %>%
	tidyr::pivot_wider(names_from=typeindex, values_from=rp) %>%
	tidyr::drop_na()

View(gensh_df_2)

cor(gensh_df_2$BTC,gensh_df_2$ETH)
cor(gensh_df_2$BTC,gensh_df_2$NSE)
cor(gensh_df_2$BTC,gensh_df_2$XRP)
cor(gensh_df_2$XRP,gensh_df_2$ETH)

ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=ETH)) + geom_point()+geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95)
ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=XRP)) + geom_point()
ggplot2::ggplot(gensh_df_2, aes(x=XRP,y=ETH)) + geom_point()
ggplot2::ggplot(gensh_df_2, aes(x=BTC,y=NSE)) + geom_point()

### 1. Finn Kovarians

## Sheet 3: Enkelt porteføljer 

## Sheet 4: Samlet porteføljer

## Sheet 5: Med markedsindeks (New York)

## Appendiks
#https://www.quantshare.com/sa-620-10-new-ways-to-download-historical-stock-quotes-for-free
#
## Explain differences between expected and realised values
#install.packages("foreign")
#library(foreign)
#ls("package:foreign")
#nyse <- read.dta("https://query1.finance.yahoo.com/v7/finance/download/%5ENYA?period1=1472774400&period2=1630540800&interval=1d&events=history&includeAdjustedClose=true")
# Tasks
## Sheet 1: Individuelt
### 1. Finn tidsintervall
### 2. Finn forventet verdi
### 3. Finn varians og standardavvik
### 4. Avkastning i prosent
### 5. Tidserieplot over utviklingen i avkastningen 
#View(nyse)
#library(zoo)
#?rollapply
