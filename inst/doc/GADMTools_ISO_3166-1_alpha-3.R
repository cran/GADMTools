## ----message=FALSE, echo=FALSE-------------------------------------------
library(GADMTools)
library(knitr)
library(kableExtra)
data("GADM36SF")

kable(GADM36SF, "latex", longtable = T, booktabs = T) %>%
  kable_styling(latex_options = c("repeat_header"), font_size = 7) %>%
  landscape()

