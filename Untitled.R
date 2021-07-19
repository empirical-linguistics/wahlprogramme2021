# install CRAN packages (if not yet installed)
  sapply(c("pdftools", "tidyverse", "tidytext"), 
         function(x) 
           if(!is.element(x, installed.packages())) 
             install.packages(x, dependencies = T))


# packages ----------------------------------------------------------------
library(tidyverse)
library(tidytext)
library(pdftools)
library(reticulate)

spd <- pdftools::pdf_text("https://www.spd.de/fileadmin/Dokumente/Beschluesse/Programm/SPD-Zukunftsprogramm.pdf")
gruene <- pdftools::pdf_text("https://cms.gruene.de/uploads/documents/Vorlaeufiges-Wahlprogramm_GRUENE-Bundestagswahl-2021.pdf")
cdu <- pdftools::pdf_text("https://www.ein-guter-plan-fuer-deutschland.de/programm/CDU_Beschluss%20Regierungsprogramm.pdf")
fdp <- pdf_text("https://www.fdp.de/sites/default/files/2021-06/FDP_Programm_Bundestagswahl2021_1.pdf")
afd <- pdf_text("https://cdn.afd.tools/wp-content/uploads/sites/111/2021/06/20210611_AfD_Programm_2021.pdf")

# Linke haben kein PDF, daher Onlineversion mit Trafilatura
trafilatura <- import("trafilatura")
downloaded <- trafilatura$fetch_url("https://www.die-linke.de/wahlen/wahlprogramm-2021/")
linke <- trafilatura$extract(downloaded)

# bag of words

# https://kaskade.dwds.de/dstar/kern/dstar.perl?q=count%28*+%23sep%29+%23by%5B%24w%5D&fmt=text&start=1&limit=10000000&ctx=8&debug=&export=

