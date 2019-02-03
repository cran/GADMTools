## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  library(sp)
#  
#  map = gadm.sp.loadCountries("FRA", level=1, simplify=0.01,  basefile = "./")
#  map = gadm.subset(map, level=1, regions=c("Île-de-France","Haute-Normandie"))
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
#  France = gadm.sf.loadCountries("FRA", level=1, basefile = "./")
#  Region = gadm.subset(France, regions=c("Île-de-France","Haute-Normandie"), level=1)
#  
#  W <- read.csv2("wepi.csv")
#  W$lieux_lat <- as.double(as.character(W$lieux_lat))
#  W$lieux_long <- as.double(as.character(W$lieux_long))
#  W <- rename(W, latitude = lieux_lat, longitude = lieux_long)
#  W[13, "comptage"] <- 120
#  
#  # Test of propDots with default parameters
#  # ------------------------------------------------------------------------------
#  propDots( Region,
#            data = W,
#            value = "comptage",
#            color="blue",
#            note="Test of propDots with default parameters")

## ----eval=FALSE----------------------------------------------------------
#  # Test of propDots with defined breaks
#  # ------------------------------------------------------------------------------
#  propDots(Region, data = W, value = "comptage", color="orange",
#           breaks=c(30, 40, 50, 70, 100),
#           title="Cases 2015",
#           caption="Test of propDots with defined breaks")

## ----eval=FALSE----------------------------------------------------------
#  propDots(Region, data = W, value = "comptage", color="green",
#           range=c(1,100),
#           breaks=c(30, 40, 50, 70, 100),
#           title="Cases 2015",
#           note="Test of propDots with forced range of breaks",
#           labels = c("< 30", "30 - 40", "40 - 50", "50 -70", "70 - 100"))

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  
#  France = gadm.sf.loadCountries("FRA", level=1, simplify=0.01,   basefile = "./")
#  Region = gadm.subset(France, regions=c("Île-de-France","Normandie"), level=1)
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
#  
#  France = gadm.sp.loadCountries("FRA", level=1, simplify=0.01,   basefile = "./")
#  W <- read.csv2("wepi.csv")
#  W$lieux_lat <- as.double(as.character(W$lieux_lat))
#  W$lieux_long <- as.double(as.character(W$lieux_long))
#  colnames(W)[1] <- "latitude"
#  colnames(W)[2] <- "longitude"
#  Region = gadm.subset(France, regions=c("Île-de-France","Normandie"), level=1)
#  isopleth(Region, W)
#  
#  # With Simple features (SF)
#  FRA_SF_1 = gadm.sf.loadCountries("FRA", level=1,   basefile = "./")
#  Region = gadm.subset(FRA_SF_1, regions=c("Île-de-France","Normandie"), level=1)
#  Region <- gadm.getBackground(Region, "FRA_IDF_NORM", type = "hotstyle")
#  isopleth(Region, W, palette = "Reds",
#           title = "Density of Cases",
#           subtitle="Cases in Ile-de-France and Normandie",
#           caption="Background from OpenStreetMap")
#  

## ----eval=FALSE----------------------------------------------------------
#  library(GADMTools)
#  
#  library(readr)
#  RPPS2 <- as.data.frame(read_csv2("RPPS2.csv"))
#  RPPS2 <- RPPS2[1:96, ]
#  RPPS2$ratio <- round(RPPS2$Specialistes / RPPS2$Généralistes, 3)
#  
#  
#  FRA_SF_2 <- gadm.sf.loadCountries("FRA",level = 2, basefile = "DATA/")
#  FRA_SF_2 <- gadm.getBackground(FRA_SF_2, name = "FRA", clip = FALSE)
#  choropleth(FRA_SF_2, data = RPPS2,
#             value="Specialistes",
#             adm.join = "Departement",
#             steps = 6,
#             breaks = "sd",
#             palette = rev(RColorBrewer::brewer.pal(9, "Blues")),
#             title = "Répartition des spécialistes en France",
#             subtitle = "Data from RPPS",
#             caption = "Background map from OpenStreetMap")
#  
#  
#  
#  FRA_SP_2 <- gadm.sp.loadCountries("FRA", level = 2, basefile = "DATA/")
#  FRA_SP_2 <- gadm.getBackground(FRA_SP_2, name = "FRA", clip = FALSE)
#  #RPPS3 <- rename(RPPS2, NAME_2 = Departement)
#  choropleth(FRA_SP_2, data = RPPS2,
#             steps = 6,
#             value="Specialistes",
#             adm.join = "NAME_2",
#             breaks = "sd",
#             palette = rev(RColorBrewer::brewer.pal(9, "Reds")),
#             title = "Répartition des spécialistes en France",
#             subtitle = "Data from RPPS",
#             caption = "Background map from OpenStreetMap")
#  
#  

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

