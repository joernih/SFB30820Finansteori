#' @export
k <- function(){
    df <-  clipr::write_last_clip()
}

#' @export
l <- function(){
    open_command <- switch(Sys.info()[['sysname']],
                           Windows= 'open',
                           Linux  = 'xdg-open',
                           Darwin = 'open')

    #temp_file <- paste0('tmp/abc', '.xlsx')
    temp_file <- paste0(tempfile(), '.xlsx')
    df <-  clipr::write_last_clip()
    openxlsx::write.xlsx(df, file = temp_file)
    invisible(system(paste(open_command, temp_file),
                     ignore.stdout = TRUE, ignore.stderr = TRUE))
}
#' @export
bm <- function(pname='Finansteori'){
	devtools::document()
	system(paste0('cd ',rprojroot::find_rstudio_root_file(),';R CMD build . ; R CMD INSTALL ',pname,'_0.0.0.9000.tar.gz; rm -r Finansteori_0.0.0.9000.tar.gz'))
}
#' @export
durasjon_df <- function(r=0.0153,r_m=0.0175,n=2,T=10,M=1000){
	dur <- data.frame(per=seq(1,T*n-1)) %>%
		dplyr::mutate(kont=(M*r_m)/n) %>%
		dplyr::mutate(disk=round((1/(1+r/n))^per,digits=6)) %>%
		dplyr::mutate(NV=round(kont*disk,digits=6)) %>%
		dplyr::mutate(wNV=round(per*NV,digits=6))
}
#' @export
sd.p=function(x){sd(x)*sqrt((length(x)-1)/length(x))}

#' @export
kob <- function(A0=620,I=680,rf=0.01,theta=1.25,n=0.85){
  le1 <- 1/(1+rf)
  q <- (1+rf-n)/(theta-n)
  k_t <- max(0,theta*A0-I)
  k_n <- max(0,n*A0-I)
  qm1 <- 1-q
  kob <- le1*(q*k_t+(1-q)*k_n)
}
#print(kob(rf=0.01))
#print(kob(rf=0.03))




