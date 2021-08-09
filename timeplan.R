library(htmlTable)
library(magrittr)

# Timeplan
## Input
ukenr <- seq(33,46)
timer <- rep(3,14)
tema <- c(
	  "Introduksjon",
	  "Porteføljeteori",
	  "Porteføljeteori",
	  "Kapitalverdimodellen",
	  "",
	  "Kapitalverdimodellen",
	  "Obligasjoner",
	  "Verdsettelse av akjser",
	  "Verdsettelse av akjser",
	  "Finanaskriser",
	  "Finanskriser",
	  "Opsjoner",
	  "Opsjoner",
	  "Repetisjon"
)
literatur <- c(
	       "Introduksjon",
	       "Porteføljeteori",
	       "B",
	       "B",
	       "B",
	       "B",
	       "B",
	       "B",
	       "B",
	       "B",
	       "B",
	       "B",
	       "B",
	       "B"
)

## Output
df <- data.frame(Literatur=literatur,Tema=tema,Ukenr=ukenr,Timer=timer)
htmlTable(df)
#https://finans2.portfolio.no/





