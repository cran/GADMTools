## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  # Loading country border (level=0 [default])
#  # -----------------------------------------------------------------
#  map <- gadm.sp.loadCountries("FRA", basefile = "./")
#  plotmap(map)

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  
#  # Loading country border (level=0 [default])
#  # -----------------------------------------------------------------
#  map <- gadm.sf.loadCountries("FRA", basefile = "./")
#  plotmap(map)

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  # Loading regions @ level = 2])
#  # -----------------------------------------------------------------
#  map <- gadm.sp.loadCountries(c("FRA"), level=2, basefile = "./")
#  plotmap(map)

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  # Assemble administrative boundaries (country level = 0)
#  # -----------------------------------------------------------------
#  map <- gadm.sp.loadCountries(c("BEL","LUX","NLD"),  basefile = "./")
#  plotmap(map, title="Bénélux")

## ----eval=FALSE----------------------------------------------------------
#  # Extract some regions of a map
#  # -----------------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  FR = gadm.sp.loadCountries("FRA", level=2, basefile = "./")
#  listNames(FR, level=2)
#  AV = gadm.subset(FR, regions=c("Allier", "Cantal",
#              "Haute-Loire","Puy-de-Dôme"))
#  plotmap(AV)

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  FR = gadm.loadCountries("FRA", level=2, basefile = "./")
#  AV = gadm.subset(FR, regions=c("Allier", "Cantal",
#              "Haute-Loire","Puy-de-Dôme"))
#  AV <- gadm.union(AV)
#  plotmap(AV)
#  

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(GADMTools)
#  FJI = gadm.sp.loadCountries("FJI", 1, basefile = "./")
#  # Fig. 6
#  plotmap(FJI, title = "Fidji Island with bad coordinates")

## ----eval=FALSE----------------------------------------------------------
#  FJI = gadm.longTo360(FJI)
#  # Fig. 7
#  plotmap(FJI, title = "Fidji Island with 0 - 360 coordinates")

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  FR = gadm.loadCountries("FRA", level=1, basefile = "./")
#  plotmap(FR)
#  listNames(FR, level=1)
#  FR2 = remove(FR, level = 1, regions = c("Grand Est"))
#  plotmap(FR2)

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(rosm)
#  FRA = gadm.sp.loadCountries("FRA", 2, basefile = "./")
#  BRE = gadm.subset(FRA, level=1, regions=c("Bretagne"))
#  BRE2 <- gadm.getBackground(BRE, "BRE", "osm")
#  plotmap(BRE2, title = "Map of Bretagne (FRANCE)")

