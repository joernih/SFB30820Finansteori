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
	  "Relevant risiko: Porteføljeteori to objekter",
	  "Relevant risiko: Porteføljeteori 3-n objekter",
	  "Effisiens",
	  "Kapitalverdimodellen",
	  "Finansielle instrumenter for finansiering",
	  "Gjeld, total risiko og systematisk risiko",
	  "",
	  "Gjeldgrad og verdi i perfekte kapitalmarkeder",
	  "Skatt",
	  "Dividende",
	  "Opsjoner",
	  "Finansielle instrumenter til påvirking av kontantstrømmer",
	  "Repetisjon"
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
	       "Kap. 1,2-4,5-8,11,12,13"
)
undervform <- c(
	  "Zoom",
	  "Zoom",
	  "Zoom",
	  "Zoom",
	  "Zoom/Campus",
	  "Zoom/Campus",
	  "Zoom/Campus",
	  "",
	  "?",
	  "?",
	  "?",
	  "?",
	  "?",
	  "?"
)
oppgaver_bok <- c(
	  "1.1,1.2,1.4,1.5,1.7.1.8",
	  "2.1,2.2,2.3,2.6",
	  "2.7,2.8,2.9,2.10",
	  "3.1,3.2,3.3",
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
	  "N.2.1,N.2.2,N.2.3,N.2.4,",
	  "N.2.5,N.5.6,N.2.7",
	  "",
	  "N.3.6,N.3.9,N.3.10,N.3.11",
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
		  undervform,
		  Timer=timer
)
timenavn <- c("Uke","Forelesning","Literatur","Sentrale temaer","Undervisningsform","Timer")

timep <- htmlTable(df1,header=timenavn)
timep_i <- htmlTable(df1[1:7,],header=timenavn)
timep_ii <- htmlTable(df1[8:14,],header=timenavn)

df2 <- data.frame(Forelesning=seq(1,13),
		 OppgaverB=oppgaver_bok,
		 OppgaverN=oppgaver_nett)

oppgnavn <- c("Forelesning","Pensumbok","Nettside (ressurs)")

oppgaveplan <- htmlTable(df2,header=oppgnavn)

