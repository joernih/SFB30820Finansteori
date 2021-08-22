# Start
############## here now ################
library(htmlTable)
library(magrittr)
library(xaringan)
library(dplyr)
############## 2-variable case ################
## Input
df_eks_2_1 <- data.frame(tilstand=c(1,2,3),
                         prob=c(0.2,0.5,0.3),
                         avk_a=c(0.16,0.12,0.06),
                         avk_b=c(0.05,0.20,0.40)
                         )

## Function for varianse
vpn <- function(df=df_eks_2_1,wp=c(1/5,2/5,3/5)){
	v <- as.vector(df[,(2)])
	m <- as.matrix(df[,(3:4)])
	covall <- cov.wt(m,v,method="ml")
	varp <- diag(as.matrix(covall$cov))
	covp <- covall[lower.tri(covall$cov)] 
}
## Data frame 
plotw <- seq(-1,1,0.1) %>% purrr::map_dfr(function(x){
	w <- seq(0,1,0.1)
	a <- data.frame(w=w) %>% 
		dplyr::mutate(r=x) %>%
 		dplyr::mutate(ep=w*10+(1-w)*5+r) %>%
 		dplyr::mutate(vp=w^2*10^2+(1-w)^2*5^2)
			 }
)
## Plot function
ggplot2::ggplot(data=plotwf,ggplot2::aes(x=vp,y=ep, group=r)) + ggplot2::geom_point() + ggplot2::geom_line()
############## 3-n variable case ################
## Input

## Function for varianse

## Plot function for weight and correlation

############## here now ################

plotwf <- plotw %>% dplyr::group_by(r)	
#	dplyr::filter(r==-1)
str(plotwf)
ggplot2::ggplot(data=plotwf,ggplot2::aes(x=vp,y=ep, group=r)) + ggplot2::geom_point() + ggplot2::geom_line()

plot(plotwf$vp,plotwf$ep)






























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


## Metode 2





v <- as.vector(df_eks_2_1_w[,2])
m <- as.matrix(df_eks_2_1_w[,3:4])
c <- cov.wt(m,v)$cov
sum(as.vector(c))

# Portefølje: 3-N
m <- as.matrix(df_eks_2_1[,(3:4)])
v <- as.vector(df_eks_2_1[,(2)])
cov.wt(m,v)$cov

############## here now ################
df_eks_2_1 <- data.frame(tilstand=c(1,2,3),
                         prob=c(0.2,0.5,0.3),
                         avk_a=c(0.16,0.12,0.06),
                         avk_b=c(0.05,0.20,0.40)
                         )
c(as.matrix(df_eks_2_1))

vpn <- function(df=df_eks_2_1[,c(2:4)]){
	m <- as.matrix(df[,(2:3)])
	v <- as.vector(df[,(1)])
        w <- c(1/2,1/2)
	covall <- cov.wt(m,v,method="ml")
	varp <- w^2*diag(as.matrix(covall$cov))
	covp <- 
	(m2 <- matrix(1:20, 4, 5))
	lower.tri(m2)
	to <- m2[lower.tri(m2)] 
	c(m2)
}

w <- c(1/5,2/5,3/5)
w%*%t(w)
plotw <- seq(-1,1,0.1) %>% purrr::map_dfr(function(x){
	w <- seq(0,1,0.1)
	a <- data.frame(w=w) %>% 
		dplyr::mutate(r=x) %>%
 		dplyr::mutate(ep=w*10+(1-w)*5+r) %>%
 		dplyr::mutate(vp=w^2*10^2+(1-w)^2*5^2)
			 }
)

plotwf <- plotw %>% dplyr::group_by(r)	
#	dplyr::filter(r==-1)
str(plotwf)
ggplot2::ggplot(data=plotwf,ggplot2::aes(x=vp,y=ep, group=r)) + ggplot2::geom_point() + ggplot2::geom_line()

plot(plotwf$vp,plotwf$ep)

set.seed(1)
mydf <- data.frame(
  group = sample(letters[1:4], 50, replace = TRUE),
  x = runif(50, 0, 7),
  y = runif(50, 0, 7)
)
View(mydf)

ggplot(data=mydf, aes(x=x, y=y, group = group, colour = group)) + geom_line() 

lattice::xyplot(y ~ x, groups=mydf$group, data = mydf, 
       auto.key = list(corner = c(0, .98)), cex = 1.5)

#
mdf <- read.table( text="Company   2011   2013  2011   2013  2011   2013
Company1  300    350   290    300   295    290
Company2  320    430   305    301   300    400
Company3  310    420   400    305   400    410", header = TRUE, check.names=FALSE )

library(ggplot2)
        ggplot(data=x, aes(x=Year, y=value, group = Company, colour = Company)) +
          geom_line() +
          geom_point( size=4, shape=21, fill="white")
########################################################################################
# Portefølje: 3-N
df_eks_2_1 <- data.frame(tilstand=c(1,2,3),
#                         prob=c(0.2,0.5,0.3),
                         prob=c(0.2,0.5,0.3),
                         avk_a=c(0.16,0.12,0.06),
                         avk_b=c(0.05,0.20,0.40)
                         )
m <- as.matrix(df_eks_2_1[,(3:4)])
v <- as.vector(df_eks_2_1[,(2)])
cov.wt(m,wt=v,method="ML")
########################################################################################
