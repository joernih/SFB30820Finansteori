#rm(list=ls())
library(htmlTable)
library(magrittr)
library(xaringan)
library(aweek)
# Timeplan
## Input
ukenr <- c(seq(33,47))
ln <- length(ukenr)
datoer <- get_date( ukenr, day=3, year = 2022)
star <- rep("09:15",ln)
timer <- rep(3,ln)
forenr <- c(seq(1,7),"",seq(8,14))
tema <- c(
	  "Introduksjon og overblikk",
	  "Relevant risiko: Porteføljeteori to objekter",
	  "Relevant risiko: Porteføljeteori 3-n objekter",
	  "Effisiens",
	  "Kapitalverdimodellen",
	  "Langsiktige finansieringsformer",
	  "Gjeldgrad og risiko",
	  "",
	  "Gjeldgrad og verdi i perfekte kapitalmarkeder",
	  "Gjeldgrad og verdi med imperfeksjoner",
	  "Dividende",
	  "Opsjoner",
	  "Risikostyring",
	  "Erstatter forelesning med rask gjennomgang av arbeidskrav + indiviuell tilbakemedling til de som ønsker dette",
	  "**Repetisjon, læringsmå og nærmere konkretisering om typen oppgaver som er relevant for eksamen**"
)
literatur <- c(
	       "Kap. 1: Introduksjon",
	       "Kap. 2: Relevant risiko",
	       "Kap. 2: Relevant risiko",
	       "Kap. 3: Relevant risiko og kapitalkostnad",
	       "Kap. 3: Relevant risiko og kapitalkostnad",
	       "Kap. 5: Langsiktige finansieringsformer",
	       "Kap. 6: Gjeldsgrad og risiko",
	       "**Høstferie**",
	       "Kap. 7: Gjeldsgrad og verdi i perfekte kapitalmarkeder",
	       "Kap. 8: Gjeldsgrad og verdi med imperfeksjoner",
	       "Kap. 11: Dividende",
	       "Kap. 12: Opsjoner",
	       "Kap. 13: Risikostyring",
	       "",
	       "**Kap. 1,2-4,5-8,11,12,13**"
)
undervfor <- c(
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037",
	  "Campus Sone E E1-037"
)

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

View(df1)
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

## output
df1 <- data.frame(
		  Uke=ukenr,
		  Forelesning=forenr,
		  Literatur=literatur,
		  Temaer=tema,
		  Undervisningsform=undervfor,
		  Timer=timer
)
timenavn <- c("Uke","Forelesning","Literatur","Sentrale temaer","Undervisningsform","Timer")

timep <- htmlTable(df1,header=timenavn)
timep_i <- htmlTable(df1[1:7,],header=timenavn)
timep_ii <- htmlTable(df1[8:15,],header=timenavn)

df2 <- data.frame(Forelesning=seq(1,14),
		 OppgaverB=oppgaver_bok,
		 OppgaverN=oppgaver_nett)
View(df2)
