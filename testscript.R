library(htmlTable)
library(magrittr)
library(xaringan)
library(plotly)
library(SFB30820Finansteori)
sd.p=function(x){sd(x)*sqrt((length(x)-1)/length(x))}
radnr_ii <- c("OFR","Renter","OER","OPA")
rm <- 0.00
M <- 0
utaksjer <- 10
# Uten gjeld
til_u <- data.frame(ofr=c(250,200,150,100,50)) %>%
	dplyr::mutate(r=ofr*rm) %>%
	dplyr::mutate(oer=ofr-M*rm) %>%
	dplyr::mutate(opa=oer/utaksjer)
kableExtra::kbl(til_u) %>% kableExtra::kable_classic_2(full_width = F)
htmlTable(t(til_u), header=c(seq(1,5)),rnames=radnr_ii,
	  rowlabel="Tilstand:")

# Med gjeld
radnr_iii <- c("OFR","Renter","OER","OPA")
rm <- 0.05
M <- 1000
utaksjer <- 5
til_m <- data.frame(ofr=c(250,200,150,100,50)) %>%
	dplyr::mutate(r=M*rm) %>%
	dplyr::mutate(oer=ofr-r) %>%
	dplyr::mutate(opa=oer/utaksjer)
kableExtra::kbl(til_m) %>% kableExtra::kable_classic_2(full_width = F)
#htmlTable(t(til_m), header=c(seq(1,5)),rnames=radnr_iii,rowlabel="Tilstand:")

mu <- mean(til_u$opa)
mm <- mean(til_m$opa)
su <- round(sd.p(c(til_u$opa)),digits=0)
sm <- round(sd.p(c(til_m$opa)),digits=0)
vu <- round(su/mu,digits=1)
vm <- round(sm/mm,digi=1)
uu <- max(til_u$opa)-min(til_u$opa)
um <- max(til_m$opa)-min(til_m$opa)





