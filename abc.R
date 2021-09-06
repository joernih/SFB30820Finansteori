porttrekk <- 1:1000 
plotwfd <- 1 %>% purrr::map_dfr(function(pd){
        # Trekker investeringsandelene
	n <- 3
	x <- runif(3, 0, 1)
	w <- x/sum(x)
	#w <- c(0.3,0.4,0.3)
	# Finner kovariansmatrisen
	erp <- c(0.12,0.15,0.25)
	std <- c(0.10,0.20,0.40)
	korr <- c(0.8,0.5,-0.10)
	kor_matq <- matrix(c(std[1],korr[1],korr[2],korr[1],std[2],korr[3],korr[2],korr[3],std[3]),nrow=3)
	kovv <- c(0,0,0)
	kovv[1]<- korr[1]*std[1]*std[2]  
	kovv[2]<- korr[2]*std[1]*std[3]
	kovv[3]<- korr[3]*std[2]*std[3]
	cov_mat <- matrix(c(std[1]^2,kovv[1],kovv[2],kovv[1],std[2]^2,kovv[3],kovv[2],kovv[3],std[3]^2),nrow=3)
	# Forventet avkastning	
	port_returns <- (sum(w *df_eks_2_6$erp))
        # Varians	
	port_risk_v <- t(w) %*% (cov_mat %*% w)
	port_risk_s <- sqrt(t(w) %*% (cov_mat %*% w))
	avkdf <- data.frame(pdraw=pd,w1=1-w[1], w2=w[2], w3=w[3],wc=sum(w)) %>%
 	dplyr::mutate(forvavk=port_returns) %>%
 	dplyr::mutate(varians=port_risk_v) %>%
	 dplyr::mutate(stdavk=port_risk_s)
})
ggf <- ggplot2::ggplot(data=plotwfd,ggplot2::aes(x=stdavk,y=forvavk)) + ggplot2::geom_point() 
plotly::ggplotly(ggf)



#w <- c(0.3,0.4,0.3)
kor_matq <- matrix(c(std[1],korr[1],korr[2],korr[1],std[2],korr[3],korr[2],korr[3],std[3]),nrow=3)
kovv <- c(0,0,0)
kovv[1]<- korr[1]*std[1]*std[2]  
kovv[2]<- korr[2]*std[1]*std[3]
kovv[3]<- korr[3]*std[2]*std[3]
cov_mat <- matrix(c(std[1]^2,kovv[1],kovv[2],kovv[1],std[2]^2,kovv[3],kovv[2],kovv[3],std[3]^2),nrow=3)
port_returns <- (sum(w *df_eks_2_6$erp))
port_risk_v <- t(w) %*% (cov_mat %*% w)
port_risk_s <- sqrt(t(w) %*% (cov_mat %*% w))
avkdf <- data.frame(pdraw=1,w1=1-w[1], w2=w[2], w3=w[3]) %>%
 dplyr::mutate(forvavk=(sum(w *df_eks_2_6$erp))) %>%
 dplyr::mutate(varians=t(w) %*% (cov_mat %*% w)
) %>%
 dplyr::mutate(stdavk=sqrt(varians))





ggf <- ggplot2::ggplot(data=plotwf,ggplot2::aes(x=stdavk,y=forvavk, group_by=corr)) + ggplot2::geom_point() 
plotly::ggplotly(ggf)






#! doublecheck
l1 <- (0.30)^2*0.10^2+(0.40)^2*0.20^2+(0.3)^2*0.40^2
l2 <- 2*0.30*0.40*0.10*0.20*0.80+2*0.30*0.30*0.10*0.40*0.50 -2*0.30*0.40*0.20*0.40*0.10  
l1+l2
sqrt(l1+l2)


covmatd <- diag(cov_mat)
port_risk_v <- t(w) %*% (covmatd %*% w)









inp_kor <- seq(-1,1,0.01)
plotwf <- inp_kor %>% purrr::map_dfr(function(r,df=df_eks_2_1){
	w <- seq(0,1,0.01)
	v <- as.vector(df[,(2)])
	m <- as.matrix(df[,(3:4)])
	covall <- cov.wt(m,v,method='ML')
	avk <- as.vector(covall$center)
	kov <- covall$cov[lower.tri(covall$cov)] 
	var <- as.vector(diag(as.matrix(covall$cov)))
	avkdf <- data.frame(corr=r,w1=1-w, w2=w) %>%
 		dplyr::mutate(forvavk=w1*avk[1]+w2*avk[2]) %>%
 		dplyr::mutate(varians=w1^2*var[1]+w2^2*var[2]+2*w1*w2*r*sqrt(var[1])*sqrt(var[2])) %>%
 		dplyr::mutate(stdavk=sqrt(varians))
			 }
)


ggf <- ggplot2::ggplot(data=plotwf,ggplot2::aes(x=stdavk,y=forvavk, group_by=corr)) + ggplot2::geom_point() 
plotly::ggplotly(ggf)
