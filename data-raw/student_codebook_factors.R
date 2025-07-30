## code to prepare `student_codebook_factors` dataset goes here
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(tibble)

codebook <- read_excel(codebook)|>
   mutate(
 #     response_options = str_replace_all(response_options,'yesterday.','yesterday at school.'),
  #    response_options = str_replace_all(response_options,'fruit','fruit or berries'),
       Question = str_squish(Question),
       subset = ifelse(Variable == 'state_name','All',subset),
       type = ifelse(Variable == 'state_name','Character',type)
      )


student_codebook_factors <- codebook |>
   select(Variable,response_options)|>
   mutate(
      response_options = str_split(response_options, pattern = '\\s*\\;\\s*'))|>
   deframe()


# write to data folder
usethis::use_data(student_codebook_factors, overwrite = TRUE)
