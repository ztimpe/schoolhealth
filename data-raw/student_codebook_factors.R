## code to prepare `student_codebook_factors` dataset goes here
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(tibble)
codebook <- '/Users/53643/Library/CloudStorage/OneDrive-SharedLibraries-ICF/CDC School Health Evaluation 2023 - General/quant_data/analytic/codebooks/student_survey_codebook.xlsx'
codebook <- read_excel(codebook)|>
   mutate(
 #     response_options = str_replace_all(response_options,'yesterday.','yesterday at school.'),
  #    response_options = str_replace_all(response_options,'fruit','fruit or berries'),
       Question = str_squish(Question),
       subset = ifelse(Variable == 'state_name','All',subset),
       type = ifelse(Variable == 'state_name','Character',type)
      )


student_codebook_factors <- codebook |>
   filter(between(row_number(),13,71))|>
   select(Variable,response_options)|>
   mutate(
      response_options = str_split(response_options, pattern = '\\s*\\;\\s*'))|>
   deframe()


# write to data folder
usethis::use_data(student_codebook_factors, overwrite = TRUE)
