library(tidyverse)


farmacies_cc0 <- read.csv("https://analisi.transparenciacatalunya.cat/resource/f446-3fny.csv?$limit=4000") %>% 
  mutate(nom_farmacia = str_to_title(nom_farmacia, locale = "ca"))

farmacies_gc <- read.csv("https://analisi.transparenciacatalunya.cat/resource/8gmd-gz7i.csv?categoria=Salut%7CFarm%C3%A0cies%7C%7C&$limit=4000") %>% 
  mutate(nom_farmacia = sub("Farmàcia ", "", alies))


df_combined <- farmacies_cc0 %>% 
  left_join(farmacies_gc, by = "nom_farmacia")

write.csv(df_combined, file = "data/output/farmacies_cat.csv")
