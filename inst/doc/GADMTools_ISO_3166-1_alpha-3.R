## ----message=FALSE, echo=FALSE------------------------------------------------
library(GADMTools)
library(knitr)
library(kableExtra)
data("GADM36SF")

kable(GADM36SF, "latex", longtable = T) %>%
  kable_styling("striped", "repeat_header", font_size = 6) %>%
  landscape()

