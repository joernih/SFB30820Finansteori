#' @export
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
