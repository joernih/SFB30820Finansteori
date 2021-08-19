library(htmlTable)
library(magrittr)
library(xaringan)
library(dplyr)
# Data input
df_eks_2_1 <- data.frame(tilstand=c(1,2,3),
                         prob=c(0.2,0.5,0.3),
                         avk_a=c(0.16,0.12,0.06),
                         avk_b=c(0.05,0.20,0.40)
                         )

# Portefølje: 1-2
w <- c(0.5,0.5)
## Metode 1
df_eks_2_1_w <- df_eks_2_1 %>%
  dplyr::mutate(wa=w[1],wb=w[2]) %>%
  dplyr::mutate(avk_c=avk_a*wa+avk_b*wb) %>%
  dplyr::mutate(ev=prob*avk_c) %>%
  dplyr::mutate(dev=avk_c-weighted.mean(avk_c, prob)) %>%
  dplyr::mutate(wvar=dev^2*prob)


htmlTable(df_eks_2_1_w)
sum(df_eks_2_1_w$ev)
sum(df_eks_2_1_w$wvar)
sqrt(sum(df_eks_2_1_w$wvar))

## Metode 2
v <-as.vector(df_eks_2_1_w[,2])
m <-as.matrix(df_eks_2_1_w[,3:4])
c <-  cov.wt(m,v)$cov
sum(as.vector(c))

# Portefølje: 3-N
m <- as.matrix(df_eks_2_1[,(3:4)])
v <- as.vector(df_eks_2_1[,(2)])
cov.wt(m,v)$cov


cp2 <- function(v=NULL,w=NULL){
 	ex <- 0.10	
 	cx <- 0.10	
	c(ex,cx)
}


plotw <- seq(-1,1,0.1) %>% purrr::map_dfr(function(x){
	w <- seq(0,1,0.1)
	a <- data.frame(w=w) %>% 
		dplyr::mutate(r=x) %>%
 		dplyr::mutate(ep=w*10+(1-w)*5) %>%
 		dplyr::mutate(vp=w^2*10^2+(1-w)^2*5^2)
			 }
)
View(plotw)
