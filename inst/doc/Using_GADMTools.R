## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  # Loading country border (level=0 [default])
#  # -----------------------------------------------------------------
#  map <- gadm.loadCountries("FRA", basefile = "./")
#  plotmap(map)

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  # Loading regions @ level = 2])
#  # -----------------------------------------------------------------
#  map <- gadm.loadCountries(c("FRA"), level=2, basefile = "./")
#  plotmap(map)

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  # Assemble administrative boundaries (country level = 0)
#  # -----------------------------------------------------------------
#  map <- gadm.loadCountries(c("BEL","LUX","NLD"),  basefile = "./")
#  plotmap(map, title="Bénélux")

## ----eval=FALSE----------------------------------------------------------
#  # Extract some regions of a map
#  # -----------------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  FR = gadm.loadCountries("FRA", level=2, basefile = "./")
#  listNames(FR, level=2)
#  AV = subset(FR, regions=c("Allier", "Cantal",
#              "Haute-Loire","Puy-de-Dôme"))
#  plotmap(AV)

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
#  library(sp)
#  
#  map = gadm.loadCountries("FRA", level=1, simplify=0.01,  basefile = "./")
#  map = subset(map, level=1, regions=c("Île-de-France","Haute-Normandie"))
#  
#  W <- read.csv2("wepi.csv", stringsAsFactors = FALSE)
#  W$lieux_lat <- as.double(W$lieux_lat)
#  W$lieux_long <- as.double(W$lieux_long)
#  colnames(W)[1] <- "latitude"
#  colnames(W)[2] <- "longitude"
#  
#  # Simple dots
#  #--------------------------------------------------------------------
#  dots(map, points = W, title="Cases 2015", note="Data from Wepi")
#  
#  

## ----eval=FALSE----------------------------------------------------------
#  
#  # Classified dots
#  #--------------------------------------------------------------------
#  dots(map, points = W,
#       palette = "Reds",
#       value="comptage",
#       title="Classified Cases 2015", note="Data from Wepi")
#  

## ----eval=FALSE----------------------------------------------------------
#  # Typed points
#  #--------------------------------------------------------------------
#  dots(map, points = W,
#       color = "#ee00ee",
#       strate="type",
#       title="Typed Cases 2015", note="Data from Wepi")

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  France = gadm.loadCountries("FRA", level=1, simplify=0.01, basefile = "./")
#  Region = subset(France, regions=c("Île-de-France","Haute-Normandie"), level=1)
#  
#  W <- read.csv2("wepi.csv")
#  W$lieux_lat <- as.double(as.character(W$lieux_lat))
#  W$lieux_long <- as.double(as.character(W$lieux_long))
#  W <- rename(W, latitude = lieux_lat, longitude = lieux_long)
#  
#  
#  # Test of propDots with default parameters
#  # ------------------------------------------------------------------------------
#  propDots( Region,
#            data = W,
#            value = "comptage",
#            color="blue",
#            note="Test of propDots with default parameters")

## ----eval=FALSE----------------------------------------------------------
#  # Test of propDots with default parameters
#  # ------------------------------------------------------------------------------
#  propDots(Region, data = W, value = "comptage", color="orange",
#           breaks=c(30, 40, 50, 70, 100),
#           title="Cases 2015",
#           note="Test of propDots with defined breaks")

## ----eval=FALSE----------------------------------------------------------
#  propDots(Region, data = W, value = "comptage", color="green",
#           range=c(30,70),
#           breaks=c(30, 40, 50, 70, 100),
#           title="Cases 2015",
#           note="Test of propDots with forced range of breaks",
#           labels = c("< 30", "30 - 40", "40 - 50", "50 -70", "70 - 100"))

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  France = gadm.loadCountries("FRA", level=1, simplify=0.01,   basefile = "./")
#  Region = subset(France, regions=c("Île-de-France","Haute-Normandie"), level=1)
#  
#  W <- read.csv2("wepi.csv")
#  W$lieux_lat <- as.double(as.character(W$lieux_lat))
#  W$lieux_long <- as.double(as.character(W$lieux_long))
#  W <- rename(W, latitude = lieux_lat, longitude = lieux_long)
#  
#  classDots(Region,               # Polygons
#            data = W,             # Dataset
#            value = "comptage",   # Varname
#            color="#ff9900",
#            breaks=c(1, 10, 30, 50, 60, 100),
#            legend = "Emergency",
#            title = "Classes of points",
#            opacity = 0.6,
#            note = "Cases 2015"
#  )
#  

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  France = gadm.loadCountries("FRA", level=1, simplify=0.01,   basefile = "./")
#  W <- read.csv2("wepi.csv")
#  W$lieux_lat <- as.double(as.character(W$lieux_lat))
#  W$lieux_long <- as.double(as.character(W$lieux_long))
#  colnames(W)[1] <- "latitude"
#  colnames(W)[2] <- "longitude"
#  Region = subset(France, regions=c("Île-de-France","Haute-Normandie"), level=1)
#  isopleth(Region, W)

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  library(dplyr)
#  
#  MAP <- gadm.loadCountries("BEL", level = 3, simplify=0.01)
#  DAT = read.csv2("BE_clamydia_incidence.csv")
#  
#  # Rewriting District names
#  # ------------------------
#  DAT$district <- as.character(DAT$district)
#  DAT[7,1] = "Brussel"
#  DAT[20,1] <- "Liège"
#  DAT[22,1] = "Marche-en-Famenne"
#  DAT[27,1] = "Neufchâteau"
#  
#  # Here is the main trick !
#  # -----------------------------------------------------
#  DAT <- rename(DAT, NAME_3 = district)
#  
#  choropleth(MAP, DAT,
#             adm.join = "NAME_3",
#             value = "rate03",
#             breaks = "sd",
#             palette="Oranges", legend = "Incidence",
#             title="Chlamydia incidence by Belgian district for 2003)")

## ----eval=FALSE----------------------------------------------------------
#  MAP <- gadm.loadCountries("BEL", level = 3, simplify=0.01)
#  DAT = read.csv2("BE_clamydia_incidence.csv")
#  
#  # Rewriting District names
#  # ------------------------
#  DAT$district <- as.character(DAT$district)
#  DAT[7,1] = "Brussel"
#  DAT[20,1] <- "Liège"
#  DAT[22,1] = "Marche-en-Famenne"
#  DAT[27,1] = "Neufchâteau"
#  DAT <- rename(DAT, NAME_3 = district)
#  
#  
#  fast.choropleth(MAP, DAT,
#                  adm.join = "NAME_3",
#                  value = "rate03",
#                  steps = 4,
#                  breaks = "jenks",
#                  palette="Greens",
#                  legend = "Incidence",
#                  title="Chlamydia incidence by Belgian district (2003)")

