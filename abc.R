erp <- c(0.12,0.15,0.25)
std <- c(0.10,0.20,0.40)
korr <- c(0.8,0.5,-0.10)
w <- c(0.3,0.4,0.3)
kor_matq <- matrix(c(std[1],korr[1],korr[2],korr[1],std[2],korr[3],korr[2],korr[3],std[3]),nrow=3)
kovv <- c(0,0,0)
kovv[1]<- korr[1]*std[1]*std[2]  
kovv[2]<- korr[2]*std[1]*std[3]
kovv[3]<- korr[3]*std[2]*std[3]
cov_mat <- matrix(c(std[1]^2,kovv[1],kovv[2],korr[1],std[2]^2,kovv[3],kovv[2],kovv[3],std[3]^2),nrow=3)
port_returns <- (sum(w *df_eks_2_6$erp))
port_risk <- sqrt(t(w) %*% (cov_mat %*% w))
port_returns
port_risk
