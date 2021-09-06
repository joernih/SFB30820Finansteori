erp <- c(0.12,0.15,0.25)
std <- c(0.10,0.20,0.40)
korr <- c(0.8,0.5,-0.10)
w <- c(0.3,0.4,0.3)
kor_matq <- matrix(c(std[1],korr[1],korr[2],korr[1],std[2],korr[3],korr[2],korr[3],std[3]),nrow=3)
kovv <- c(0,0,0)
kovv[1]<- korr[1]*std[1]*std[2]  
kovv[2]<- korr[2]*std[1]*std[3]
kovv[3]<- korr[3]*std[2]*std[3]
cov_mat <- matrix(c(std[1]^2,kovv[1],kovv[2],kovv[1],std[2]^2,kovv[3],kovv[2],kovv[3],std[3]^2),nrow=3)
port_returns <- (sum(w *df_eks_2_6$erp))
port_risk_v <- t(w) %*% (cov_mat %*% w)
port_risk_s <- sqrt(t(w) %*% (cov_mat %*% w))
port_returns
port_risk_v
port_risk_s

#! doublecheck
l1 <- (0.30)^2*0.10^2+(0.40)^2*0.20^2+(0.3)^2*0.40^2
l2 <- 2*0.30*0.40*0.10*0.20*0.80+2*0.30*0.30*0.10*0.40*0.50 -2*0.30*0.40*0.20*0.40*0.10  
l1+l2
sqrt(l1+l2)


covmatd <- diag(cov_mat)
port_risk_v <- t(w) %*% (covmatd %*% w)
