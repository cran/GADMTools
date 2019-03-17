## ----echo=FALSE, message=FALSE-------------------------------------------
library(GADMTools)
data("Corsica")


## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  
#  # Loading country border (level=0 [default])
#  # -----------------------------------------------------------------
#  map <- gadm_sf_loadCountries("FRA", basefile = "./")
#  gadm_plot(map) + theme_light()

## ----out.width="500px", echo=FALSE, fig.align='center', fig.cap="Loading a single country (level = 0)", fig.pos="h", out.extra=""----
knitr::include_graphics("Rplot_sf_01.jpeg")

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  data("Corsica")
#  
#  
#  # Loading regions @ level = 2])
#  # -----------------------------------------------------------------
#  map <- gadm_sp_loadCountries(c("FRA"), level=2, basefile = "./")
#  gadm_plot(map)

## ----out.width="500px", echo=FALSE, fig.cap="loading regions of a country @ level = 2", fig.pos="h", out.extra=""----
knitr::include_graphics("Rplot_sf_02.jpeg")

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  
#  # Assemble administrative boundaries (country level = 0)
#  # -----------------------------------------------------------------
#  map <- gadm_sp_loadCountries(c("BEL","LUX","NLD"),  basefile = "./")
#  gadm_plot(map + theme_light()

## ----out.width="500px", echo=FALSE, fig.cap="Benelux = Belgium + Luxembourg + Netherlands @ level = 0", fig.pos="h", out.extra=""----
knitr::include_graphics("Rplot_Benelux.jpeg")

## ----eval = FALSE--------------------------------------------------------
#  FRA <- gadm_sf_loadCountries("FRA", level = 4, basefile = "./")
#  Corsica <- gadm_subset(FRA, level=1, regions="Corse")

## ----fig.height=7, fig.align='center', fig.cap="Corsica (Region of France) @ level 4", fig.pos="h", out.extra=""----
gadm_plot(Corsica) %>% gadm_showNorth("tl") %>% gadm_showScale('bl')

## ------------------------------------------------------------------------
listNames(Corsica, 2)


## ----fig.height=7, fig.align='center', fig.cap="Corsica - Haute-Corse", fig.pos="ht", out.extra=""----

HCorse <- gadm_subset(Corsica, regions="Haute-Corse", level=2)
gadm_plot(HCorse)

## ----fig.align='center', fig.height=7.1, fig.cap='Corsica with districts only', fig.pos="h", out.extra=""----
UCorse <- gadm_union(Corsica, level=3, type="Arrondissements")
gadm_plot(UCorse)


## ------------------------------------------------------------------------
listNames(Corsica, 3)

## ----fig.height=6.8, fig.align='center', fig.cap="Corsica without district of Corte", fig.pos="h", out.extra=""----
Corse_without_Corte <- gadm_remove(Corsica, regions="Corte", 3)
gadm_plot(Corse_without_Corte)

## ----"getBbox"-----------------------------------------------------------
gadm_getBbox(Corsica)

## ----fig.width=7.5, fig.align='center', warning=FALSE, fig.pos="h", out.extra=""----
STUDY_AREA <- gadm_crop(Corsica, xmin=9.3, ymin=42.96, xmax=9.566, ymax=43.02819)
gadm_plot(STUDY_AREA)

## ----eval=FALSE, fig.pos="h", out.extra=""-------------------------------
#  library(GADMTools)
#  FJI = gadm_sp_loadCountries("FJI", 1, basefile = "./")
#  gadm_plot(FJI, title = "Fidji Island with bad coordinates")

## ----out.width="4500px", echo=FALSE, fig.align='center', fig.cap="Fiji Islands, with polygons crossing the Date Line", fig.pos="h", out.extra=""----
knitr::include_graphics("Rplot_8.8.png")

## ----eval=FALSE----------------------------------------------------------
#  FJI = gadm_longTo360(FJI)
#  gadm_plot(FJI, title = "Fidji Island with 0 - 360 coordinates")

## ----out.width="300px", echo=FALSE, fig.align='center', fig.cap="Fiji Islands, with polygons crossing the Date Line", fig.pos="h", out.extra=""----
knitr::include_graphics("Rplot_8.9.png")

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(rosm)
#  FRA = gadm_sp_loadCountries("FRA", 2, basefile = "./")
#  BRE = gadm_subset(FRA, level=1, regions=c("Bretagne"))
#  BRE2 <- gadm_getBackground(BRE, "BRE", "osm")
#  gadm_plot(BRE2, title = "Map of Bretagne (FRANCE)")

## ----out.width="500px", echo=FALSE, fig.align='center', fig.cap="map of Bretagne with background from OSM @ level = 2", fig.pos="h", out.extra=""----
knitr::include_graphics("Rplot_7.7.png")

