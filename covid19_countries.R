rm(list=ls())
library(COVID19)
library(dplyr)
library(ggplot2)
library(plotly)
library(gridExtra)
library(ggplot2)
library(lubridate)
library(zoo)

# Data transformation
all_data <- COVID19::covid19(verbose = F)
save(all_data,file="testalldata")
# Available countries
unique(all_data$id)
  [1] "AFG" "AGO" "ALB" "AND" "ARE" "ARG" "ARM"
  [8] "ASM" "ATG" "AUS" "AUT" "AZE" "BDI" "BEL"
 [15] "BEN" "BFA" "BGD" "BGR" "BHR" "BHS" "BIH"
 [22] "BLR" "BLZ" "BMU" "BOL" "BRA" "BRB" "BRN"
 [29] "BTN" "BWA" "CAC" "CAF" "CAN" "CHE" "CHL"
 [36] "CHN" "CIV" "CMR" "COD" "COG" "COL" "COM"
 [43] "CPV" "CRI" "CUB" "CYP" "CZE" "DEU" "DJI"
 [50] "DMA" "DNK" "DOM" "DPC" "DZA" "ECU" "EGY"
 [57] "ERI" "ESP" "EST" "ETH" "FIN" "FJI" "FRA"
 [64] "GAB" "GBR" "GEO" "GHA" "GIN" "GMB" "GNB"
 [71] "GNQ" "GPC" "GRC" "GRD" "GTM" "GUM" "GUY"
 [78] "HND" "HRV" "HTI" "HUN" "IDN" "IND" "IRL"
 [85] "IRN" "IRQ" "ISL" "ISR" "ITA" "JAM" "JOR"
 [92] "JPN" "KAZ" "KEN" "KGZ" "KHM" "KIR" "KNA"
 [99] "KOR" "KWT" "LAO" "LBN" "LBR" "LBY" "LCA"
[106] "LIE" "LKA" "LSO" "LTU" "LUX" "LVA" "MAR"
[113] "MCO" "MDA" "MDG" "MDV" "MEX" "MHL" "MKD"
[120] "MLI" "MLT" "MMR" "MNE" "MNG" "MNP" "MOZ"
[127] "MRT" "MSZ" "MUS" "MWI" "MYS" "NAM" "NER"
[134] "NGA" "NIC" "NLD" "NOR" "NPL" "NZL" "OMN"
[141] "PAK" "PAN" "PER" "PHL" "PLW" "PNG" "POL"
[148] "PRI" "PRT" "PRY" "PSE" "QAT" "RKS" "ROU"
[155] "RUS" "RWA" "SAU" "SDN" "SEN" "SGP" "SLB"
[162] "SLE" "SLV" "SMR" "SOM" "SRB" "SSD" "STP"
[169] "SUR" "SVK" "SVN" "SWE" "SWZ" "SYC" "SYR"
[176] "TCD" "TGO" "THA" "TJK" "TLS" "TTO" "TUN"
[183] "TUR" "TWN" "TZA" "UGA" "UKR" "URY" "USA"
[190] "UZB" "VAT" "VCT" "VEN" "VIR" "VNM" "VUT"
[197] "WSM" "YEM" "ZAF" "ZMB" "ZWE"
names(all_data)

sel_cou <- c('NOR','ITA','SWE','GBR','ISR','FIN','CZE','ESP','USA','CAN','SVK','RUS')
covid_sel_df <- all_data %>% dplyr::filter(id%in%sel_cou) %>%
        # Datering	
	dplyr::mutate(year=as.factor(lubridate::year(date))) %>% 
	dplyr::mutate(dayofyear=lubridate::yday(date)) %>% 
	dplyr::select(id,date,confirmed,deaths,hosp,dayofyear,year,population)  %>%
	dplyr::mutate(c_deaths=deaths-dplyr::lag(deaths)) %>%
	dplyr::mutate(ma_deaths=round(rollmean(c_deaths,k=7, fill=NA)),digits=4) %>%
	dplyr::mutate(ma_deaths_perc=(ma_deaths/population)*100000) %>%
	{. ->> b }    #here is save
View(b)
c_cdf <- sel_cou %>% purrr::map(function(x,df=covid_sel_df)(
				   {
					out <- df %>% dplyr::filter(id==x)
				       gout <- ggplot(out, aes(x=dayofyear,y=hosp, color=year)) + geom_point() + geom_line() + labs(title=x,"Day during the year", y="Hospitlalized") 
				   }))

all_cou <- grid.arrange(grobs=c_cdf)

c_cdf <- sel_cou %>% purrr::map(function(x,df=covid_sel_df)(
				   {
					out <- df %>% dplyr::filter(id==x)
				       gout <- ggplot(out, aes(x=dayofyear,y=ma_deaths, color=year)) + geom_point() + geom_line() + labs(title=x,"Day during the year", y="Covid-deaths (7-days rolling average)") 
				   }))

all_cou <- grid.arrange(grobs=c_cdf)



###
cap_cdf <- sel_cou %>% purrr::map(function(x,df=covid_sel_df)(
				   {
					out <- df %>% dplyr::filter(id==x)
				       gout <- ggplot(out, aes(x=dayofyear,y=ma_deaths_perc, color=year)) + geom_point() + geom_line() + labs(title=x,"Covid-deaths during the year", y="Deaths (7-days rolling average) per 1000k") + ylim(0,0.75)
				   }))

all_cou <- grid.arrange(grobs=cap_cdf)
###################################################################

