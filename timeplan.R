library(htmlTable)
library(magrittr)
library(xaringan)
# Timeplan
## Input
ukenr <- seq(33,46)
forenr <- c(seq(1,7),"",seq(8,13))
timer <- rep(3,14)
tema <- c(
	  "Introduksjon og overblikk",
	  "Porteføljeteori to fond",
	  "Porteføljeteori 3 til n-fond",
	  "Effisiens",
	  "Kapitalverdimodellen",
	  "Finansielle instrumenter for finansiering",
	  "Gjeld, total risiko og systematisk risiko",
	  "",
	  "Gjeldgrad og verdi i perfekte kapitalmarkeder",
	  "Skatt",
	  "Sammenkobling",
	  "Dividende",
	  "Opsjoner",
	  "Finansielle instrumenter til påvirking av kontantstrømmer"
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
	       "Kap. 9-10: Sammenkobling og verdsettelse",
	       "Kap. 11: Dividende",
	       "Kap. 12: Opsjoner",
	       "Kap. 13: Risikostyring"
)

oppgaver_bok <- c(
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  ""
)

oppgaver_nett <- c(
	  "N.1.1,N.1.2,N.1.3,N.1.4,",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  ""
)
## Output
df1 <- data.frame(
		  Uke=ukenr,
		  Forelesning=forenr,
		  Literatur=literatur,
		  Temaer=tema,
		  Timer=timer
)
df1
df2 <- data.frame(
		 OppgaverB=oppgaver_bok,
		 OppgaverN=oppgaver_nett
)
