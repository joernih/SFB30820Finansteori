library(htmlTable)
library(magrittr)

# Timeplan
## Input
ukenr <- seq(33,46)
timer <- rep(3,14)
tema <- c(
	  "Introduksjon og overblikk",
	  "Porteføljeteori to fond",
	  "Porteføljeteori 3 til n-fond",
	  "Effisiens",
	  "Kapitalverdimodellen",
	  "Finansielle instrumenter for finansiering",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "",
	  "Finansielle instrumenter for behandling av usikkerhet",
	  ""
)
literatur <- c(
	       "Kap. 1: Introduksjon",
	       "Kap. 2: Relevant risiko",
	       "Kap. 2: Relevant risiko",
	       "Kap. 3: Relevant risiko og kapitalkostnad",
	       "Kap. 3: Relevant risiko og kapitalkostnad",
	       "Kap. 5: Langsiktige finansieringsformer",
	       "Kap. 6: Gjeldsgrad og risiko",
	       "Kap. 7: Gjeldsgrad og verdi i perfekte kapitalmarkeder",
	       "Kap. 8: Gjeldsgrad og verdi med imperfeksjoner",
	       "Kap. 9: Sammenkobling og verdsettelse",
	       "Kap. 10: Verdifastsettelse",
	       "Kap. 11: Dividende",
	       "Kap. 12: Opsjoner",
	       "Kap. 13: Risikostyring"
)
oppgaver <- c(
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
	  "",
	  ""
)

## Output
df1 <- data.frame(Literatur=literatur,
		 Tema=tema,
		 Oppgaver=oppgaver,
		 Ukenr=ukenr,
		 Timer=timer
)
df2 <- data.frame(Literatur=literatur,
		 Tema=tema,
		 Oppgaver=oppgaver,
		 Ukenr=ukenr,
		 Timer=timer
)





