## code to prepare `student_survey` dataset goes here
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)

student_survey <- readRDS('/Users/53643/Library/CloudStorage/OneDrive-SharedLibraries-ICF/CDC School Health Evaluation 2023 - General/quant_data/analytic/hsq_students2324.RDS')[['data']]|>
   filter(st=='WV')|>
   arrange(ncessch)|>
   mutate(ncessch = consecutive_id(ncessch),
          st = 'RAND',
          .before = 1
          )|>
   select(ncessch,district_schools,school_level,st,finalwt,Q1:Q34,-starts_with("Q3_"))



usethis::use_data(student_survey, overwrite = TRUE)
