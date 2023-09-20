#rm(list=ls())
library(htmlTable)
library(magrittr)
library(xaringan)
library(aweek)
# Timeplan
## Input
ukenr <- seq(34,47)
ln <- length(ukenr)
datoer <- c(get_date(ukenr, day=3, year = 2023))
star <- rep("09:15",ln)
timer <- rep(3,ln)
forenr <- c(seq(1,5),"",seq(7,14))
tema <- c(
	  "Introduksjon og overblikk",
	  "Relevant risiko: Porteføljeteori to objekter",
	  "Relevant risiko: Porteføljeteori 3-n objekter",
	  "Effisiens",
	  "Kapitalverdimodellen",
	  "Langsiktige finansieringsformer",
	  "",
	  "Gjeldgrad og risiko",
	  "Gjeldgrad og verdi i perfekte kapitalmarkeder",
	  "Gjeldgrad og verdi med imperfeksjoner",
	  "Dividende",
	  "Opsjoner",
	  "Risikostyring",
	  "Repetisjon, læringsmål og nærmere konkretisering om typen oppgaver som er relevant for eksamen"
)
literatur <- c(
	       "Kap. 1: Introduksjon",
	       "Kap. 2: Relevant risiko",
	       "Kap. 2: Relevant risiko",
	       "Kap. 3: Relevant risiko og kapitalkostnad",
	       "Kap. 3: Relevant risiko og kapitalkostnad",
	       "Kap. 5: Langsiktige finansieringsformer",
	       "**Høstferie**",
	       "Kap. 6: Gjeldsgrad og risiko",
	       "Kap. 7: Gjeldsgrad og verdi i perfekte kapitalmarkeder",
	       "Kap. 8: Gjeldsgrad og verdi med imperfeksjoner",
	       "Kap. 11: Dividende",
	       "Kap. 12: Opsjoner",
	       "Kap. 13: Risikostyring",
	       "Kap. 1,2-4,5-8,11,12,13"
)
undervfor <- c(
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063",
	  "",
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063",
	  "Campus Sone F FU1-063"
)
###########################################################################################################3
oppgaver_bok <- c(
	  "1.1,1.2,1.4,1.5,1.7.1.8",
	  "2.1,2.2,2.3,2.6",
	  "2.7,2.8,2.9,2.10",
	  "3.1,3.2,3.3,3.5,3.6",
	  "3.3,3.4,3.7,3.8,3.9",
	  "5.1,5.2,5.3,5.8,5.9",
	  "6.1,6.6,6.7,6.8",
	  "7.1,7.2,7.8,7.8,7.9",
	  "8.1,8.3,8.4,8.5,8.7,8.8,8.10",
	  "11.1,**11.2**,11.5,11.7,11.8,11.9",
	  "12.1,12.2,**12.3**,12.5, **12.6**,12.7,**12.8**,12.9",
	  "",
	  "",
	  ""
)
oppgaver_nett <- c(
	  "N.1.1,N.1.2,N.1.3,N.1.4,",
	  "N.2.1,N.2.2,N.2.3,N.2.4,",
	  "N.2.5,N.5.6,N.2.7",
	  "N.3.3_1,N.3.4,N.3.5",
	  "N.3.6,N.3.9,N.3.10,N.3.11",
	  "N.5.1,N.5.2,N.5.3,N.5.5,N.5.5",
	  "N.6.1,**N.6.2**,**N.6.3**",
	  "**N.7.1**,**N.7.2**,**N.7.3**",
	  "N.8.1,N.8.2,**N.8.3**",
	  "**N.11.1**,N.11.2,N.11.3",
	  "N.12.1,N.12.2,12.4,12.6",
	  "",
	  "",
	  ""
)
oppgaver_eks <- c(
"Eks 2021: Oppg.1: 1",
"Eks 2021: Oppg.2: 1,2, Eks 2022: Oppg.2: 1,2",
"Eks 2020: Oppg.1: a,b,(c),d,Eks 2021: Oppg.1: 2, Eks 2022: Oppg.1: 2",
"Eks 2021: Oppg.3: 1,2, Eks. Oppg.3: a,b,c,d,e.",
"",
"",
"",
"",
"",
"",
""
)


## output
df1 <- data.frame(
		  Uke=ukenr,
		  Dato=datoer,
		  Tidspunkt=star,
		  Forelesning=forenr,
		  Literatur=literatur,
		  Temaer=tema,
		  Undervisningsform=undervfor,
		  Timer=timer
)
timenavn <- c("Uke","Datoer","Tidspunkt","Forelesning","Literatur","Sentrale temaer","Undervisningsform","Timer")
timep <- htmlTable(df1,header=timenavn)
timep_i <- htmlTable(df1[1:7,],header=timenavn)
timep_ii <- htmlTable(df1[8:15,],header=timenavn)
df2 <- data.frame(Forelesning=seq(1,11),
		 Oppgaver_eksamen=oppgaver_eks[1:11],
		 Oppgaver_bok=oppgaver_bok[1:11],
		 Oppgaver_nett=oppgaver_nett[1:11]
)
#https://tp.educloud.no/hiof/timeplan/timeplan.php?type=course&id%5b%5d=SFB10816%2C1&sort=week&id[]=SFB30820%2C1
#                               2023                               
#
#        juli                  august                september     
#ma ti on to fr lø sø   ma ti on to fr lø sø   ma ti on to fr lø sø
#                1  2       1  2  3  4  5  6                1  2  3
# 3  4  5  6  7  8  9    7  8  9 10 11 12 13    4  5  6  7  8  9 10
#10 11 12 13 14 15 16   14 15 16 17 18 19 20   11 12 13 14 15 16 17
#17 18 19 20 21 22 23   21 22 23 24 25 26 27   18 19 20 21 22 23 24
#24 25 26 27 28 29 30   28 29 30 31            25 26 27 28 29 30   
#31                                                                
#       oktober               november               desember      
#ma ti on to fr lø sø   ma ti on to fr lø sø   ma ti on to fr lø sø
#                   1          1  2  3  4  5                1  2  3
# 2  3  4  5  6  7  8    6  7  8  9 10 11 12    4  5  6  7  8  9 10
# 9 10 11 12 13 14 15   13 14 15 16 17 18 19   11 12 13 14 15 16 17
#16 17 18 19 20 21 22   20 21 22 23 24 25 26   18 19 20 21 22 23 24
#23 24 25 26 27 28 29   27 28 29 30            25 26 27 28 29 30 31
#30 31                                                             
